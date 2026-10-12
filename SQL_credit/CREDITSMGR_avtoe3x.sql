CREATE OR REPLACE 
PACKAGE cm_autoexp
IS
   PROCEDURE autoexp (p_opdate IN DATE);

   PROCEDURE autores (p_opdate IN DATE);
END;
/


CREATE OR REPLACE 
PACKAGE BODY cm_autoexp
IS
   PROCEDURE autoexp (p_opdate IN DATE)
   IS
      CURSOR c_port (p_date IN DATE)
      IS
         SELECT ID, numberofcredit, currency, customertype, branchid,
                credittype
           FROM cm_active_credits
          WHERE ID IN (SELECT creditid
                         FROM cm_payment_schedule
                        WHERE paymentdate = p_date);

      CURSOR c_shedulerest (p_id IN INTEGER, p_date IN DATE)
      IS
         SELECT principal, interest
           FROM cm_payment_schedule
          WHERE creditid = p_id AND paymentdate = p_date;

      CURSOR c_currencyostat (val IN INTEGER)
      IS
         SELECT ostat
           FROM sb_temprate
          WHERE val_kod = val;

      CURSOR c_reserverate (p_id IN INTEGER)
      IS
         SELECT PERCENT
           FROM cm_reserve_types
          WHERE ID = (SELECT reserveid
                        FROM cm_curr_state
                       WHERE creditid = p_id);

      CURSOR c_account (p_id IN INTEGER)
      IS
         SELECT booroweraccid, contractaccid, loanaccid, dueloanaccid,
                interestaccid, dueinterestaccid, primaryreserveaccid,
                secondaryreserveaccid
           FROM cm_accounts
          WHERE creditid = p_id;

      CURSOR c_sm_ostat (p_id IN INTEGER)
      IS
         SELECT ABS (ostat) AS ostat
           FROM sb_tenostat
          WHERE acc_id = p_id;

      CURSOR c_payment (p_id IN INTEGER, p_date IN DATE)
      IS
         SELECT payedamt, payedintamt
           FROM cm_payments
          WHERE creditid = p_id AND paydate = p_date;

      CURSOR c_exp (p_id IN INTEGER, p_date IN DATE)
      IS
         SELECT expamount
           FROM cm_expires
          WHERE creditid = p_id AND expdate = p_date;

      sm_ostat             c_sm_ostat%ROWTYPE;
      EXP                  c_exp%ROWTYPE;
      shedulerest          c_shedulerest%ROWTYPE;
      currencyostat        c_currencyostat%ROWTYPE;
      reserverate          c_reserverate%ROWTYPE;
      ACCOUNT              c_account%ROWTYPE;
      payment              c_payment%ROWTYPE;
      debitaccid           INTEGER;
      creditaccid          INTEGER;
      tramount             NUMBER;
      reservecontenabled   BOOLEAN;
      trdescription        VARCHAR2 (50);
      resultmaintrid       INTEGER;
      resultprestrid       INTEGER;
      temp                 NUMBER;
      currdat              DATE;
      crdrest              number;
      crdinterestrest      number;
      crdduerest           number;
      crddueinterestrest   number;   
      stopcalcdat          date;
      payrest              number;
      payinterstrest       number;
      payduerest           number;
      paydueinterstrest    number; 
          
   BEGIN

      SELECT tek_dat
        INTO currdat
        FROM sb_sysdat;

      FOR portinfo IN c_port (currdat)
      LOOP
        
        select rest,
               interestrest,
               duerest,
               dueinterestrest,
               stopcalcdate
           into crdrest,
                crdinterestrest,
                crdduerest,
                crddueinterestrest,
                stopcalcdat 
        from cm_curr_state
        where creditid  = portinfo.id;

         OPEN c_shedulerest (portinfo.ID, currdat);
         FETCH c_shedulerest INTO shedulerest;
         CLOSE c_shedulerest;

         OPEN c_account (portinfo.ID);
         FETCH c_account INTO ACCOUNT;
         CLOSE c_account;

         OPEN c_currencyostat (portinfo.currency);
         FETCH c_currencyostat INTO currencyostat;
         CLOSE c_currencyostat;

         OPEN c_reserverate (portinfo.ID);
         FETCH c_reserverate INTO reserverate;
         CLOSE c_reserverate;

         OPEN c_payment (portinfo.ID, p_opdate);
         FETCH c_payment INTO payment;
         CLOSE c_payment;

         OPEN c_exp (portinfo.ID, p_opdate);
         FETCH c_exp INTO EXP;
         CLOSE c_exp;

         
         open c_sm_ostat(ACCOUNT.booroweraccid);
         fetch c_sm_ostat into sm_ostat ;
         close c_sm_ostat;
         
           
         IF EXP.expamount <>
                 (NVL (shedulerest.principal, 0) - NVL (payment.payedamt, 0)
                 )
         THEN
            IF NVL (shedulerest.principal, 0) > NVL (payment.payedamt, 0)
            THEN
               debitaccid := ACCOUNT.dueloanaccid;
               creditaccid := ACCOUNT.loanaccid;
               tramount :=
                     NVL (shedulerest.principal, 0)
                   - NVL (payment.payedamt, 0) /*p_Amount*/;
               trdescription := cm_utils.trdescmaindebtexpire ();
               trdescription :=
                  REPLACE (trdescription,
                           cm_decls.trdescnumber,
                           portinfo.numberofcredit
                          );
               trdescription :=
                  REPLACE (trdescription,
                           cm_decls.trdescdate,
                           TO_CHAR (p_opdate, 'DD/MM/YYYY')
                          );

               IF (debitaccid IS NOT NULL) AND (creditaccid IS NOT NULL)
               THEN
                  resultmaintrid :=
                     cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                         p_debitid              => debitaccid,
                                                         p_creditid             => creditaccid,
                                                         p_debitamount          => NULL,
                                                         p_creditamount         => tramount,
                                                         p_lamount              => NULL,
                                                         p_trname               => trdescription,
                                                         p_flags                => sb_decls.atfcommitimmediate,
                                                         p_transactiondate      => p_opdate,
                                                         p_operationtype        => cm_decls.cmtransactionoptype,
                                                         p_inbalancechar        => NULL
                                                        );
               END IF;
            END IF;

            UPDATE    cm_curr_state
                  SET rest =
                            rest
                          - (  NVL (shedulerest.principal, 0)
                             - NVL (payment.payedamt, 0)
                            ),
                      duerest =
                            duerest
                          + NVL (shedulerest.principal, 0)
                          - NVL (payment.payedamt, 0)
                WHERE creditid = portinfo.ID
            RETURNING rest
                 INTO temp;

            IF temp = 0
            THEN
               UPDATE cm_accounts
                  SET contractaccid = dueloanaccid
                WHERE creditid = portinfo.ID;
            END IF;

            INSERT INTO cm_expires
                        (creditid, expdate,
                         expamount /*, oldduereserveid*/,
                         exptrid, prestrid                       /*, srestrid*/
                        )
                 VALUES (portinfo.ID, p_opdate,
                            NVL (shedulerest.principal, 0)
                          - NVL (payment.payedamt, 0) /*, HistInfoRec.DUERESERVEID*/,
                         resultmaintrid, resultprestrid    /*, ResultSResTrID*/
                        );
         END IF;

         COMMIT WORK;
      END LOOP;
   END;

   PROCEDURE autores (p_opdate IN DATE)
   IS
      CURSOR c_port (p_date IN DATE)
      IS
         SELECT ID, numberofcredit, currency, branchid, customertype
           FROM cm_active_credits
          WHERE ID IN (SELECT creditid
                         FROM cm_expires);

      CURSOR c_exp (p_id IN INTEGER /*,p_date in date*/)
      IS
         SELECT MIN (expdate) AS expdate
           FROM cm_expires
          WHERE creditid = p_id /*and expdate = p_date*/;

      CURSOR c_rests (p_id IN INTEGER)
      IS
         SELECT rest, reserveid, duerest, dueinterestrest
           FROM cm_curr_state
          WHERE creditid = p_id;

      CURSOR c_accounts (p_id IN INTEGER)
      IS
         SELECT primaryreserveaccid, secondaryreserveaccid
           FROM cm_accounts
          WHERE creditid = p_id;

      CURSOR c_res
      IS
         SELECT ID, PERCENT, bdcount, edcount
           FROM cm_reserve_types;

      CURSOR c_ostat (p_id IN INTEGER)
      IS
         SELECT ostat
           FROM sb_tenostat
          WHERE acc_id = p_id;

      CURSOR c_avto_e (p_id IN INTEGER)
      IS
         SELECT expdate
           FROM cm_auto_exp
          WHERE creditid = p_id;

      avto_e          c_avto_e%ROWTYPE;
      port            c_port%ROWTYPE;
      EXP             c_exp%ROWTYPE;
      rests           c_rests%ROWTYPE;
      accounts        c_accounts%ROWTYPE;
      ostatinfo       c_ostat%ROWTYPE;
      currdate        DATE;
      countdat        NUMBER;
      crdpercent      NUMBER;
      crdoldpercent   NUMBER;
      currencyostat   NUMBER;
      tramount        NUMBER;
      creditaccid     INTEGER;
      debitaccid      INTEGER;
      firsttrid       NUMBER;
      secondtrid      NUMBER;
      oldamt          NUMBER;
   BEGIN
      SELECT tek_dat
        INTO currdate
        FROM sb_sysdat;

      FOR port IN c_port (currdate)
      LOOP
         OPEN c_exp (port.ID /*,currdate*/);
         FETCH c_exp INTO EXP;
         CLOSE c_exp;
         OPEN c_accounts (port.ID);
         FETCH c_accounts INTO accounts;
         CLOSE c_accounts;
         OPEN c_rests (port.ID);
         FETCH c_rests INTO rests;
         CLOSE c_rests;
         OPEN c_ostat (accounts.primaryreserveaccid);
         FETCH c_ostat INTO ostatinfo;
         CLOSE c_ostat;
         OPEN c_avto_e (port.ID);
         FETCH c_avto_e INTO avto_e;
         CLOSE c_avto_e;

         IF avto_e.expdate <> currdate
         THEN
            IF EXP.expdate IS NOT NULL
            THEN
               countdat := currdate - EXP.expdate;

               FOR res IN c_res
               LOOP
                  IF (countdat >= res.bdcount) AND (countdat <= res.edcount)
                  THEN
                     crdpercent := res.PERCENT;
                     EXIT;
                  END IF;
               END LOOP;

               SELECT ostat
                 INTO currencyostat
                 FROM sb_temprate
                WHERE val_kod = port.currency;

               SELECT PERCENT
                 INTO crdoldpercent
                 FROM cm_reserve_types
                WHERE ID = rests.reserveid;

               IF crdpercent IN (6, 25)
               THEN
                  creditaccid :=
                     cm_utils.lnkreserveaccount (p_custcategory      => port.customertype,
                                                 p_crdcurrency       => port.currency,
                                                 p_bankid            => port.branchid
                                                );
                  debitaccid := accounts.primaryreserveaccid;
                  tramount := ostatinfo.ostat;
/*-----------------------------------F---------------------------------------------------------*/
                  firsttrid :=
                     cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                         p_debitid              => debitaccid,
                                                         p_creditid             => creditaccid,
                                                         p_debitamount          => tramount,
                                                         p_creditamount         => NULL,
                                                         p_lamount              => NULL,
                                                         p_trname               =>    'Ещтийатын йенилянмяси-MY '
                                                                                   || port.numberofcredit,
                                                         p_flags                => sb_decls.atfcommitimmediate,
                                                         p_transactiondate      => currdate,
                                                         p_operationtype        => cm_decls.cmtransactionoptype,
                                                         p_inbalancechar        => NULL
                                                        );
/*-------------------------------------------------S-------------------------------------------*/
                  OPEN c_ostat (accounts.secondaryreserveaccid);
                  FETCH c_ostat INTO ostatinfo;
                  CLOSE c_ostat;
                  oldamt :=
                        cm_utils.calcpercent (p_sum              => rests.rest,
                                              p_rate             => crdpercent,
                                              p_coefficient      => 1,
                                              p_delimmer         => 1
                                             )
                      * currencyostat;
                  debitaccid :=
                     cm_utils.lnkreserveaccount (p_custcategory      => port.customertype,
                                                 p_crdcurrency       => port.currency,
                                                 p_bankid            => port.branchid
                                                );
                  creditaccid := accounts.primaryreserveaccid;
                  tramount := ROUND (oldamt, 2);

                  IF    debitaccid IS NOT NULL
                     OR (creditaccid NOT IN (-1, 0, NULL))
                  THEN
                     firsttrid :=
                        cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                            p_debitid              => debitaccid,
                                                            p_creditid             => creditaccid,
                                                            p_debitamount          => tramount,
                                                            p_creditamount         => NULL,
                                                            p_lamount              => NULL,
                                                            p_trname               =>    'Ещтийатын йенилянмяси-MY '
                                                                                      || port.numberofcredit,
                                                            p_flags                => sb_decls.atfcommitimmediate,
                                                            p_transactiondate      => currdate,
                                                            p_operationtype        => cm_decls.cmtransactionoptype,
                                                            p_inbalancechar        => NULL
                                                           );
                  END IF;
               END IF;

               IF crdpercent NOT IN (6, 25)
               THEN
                  tramount :=
                        cm_utils.calcpercent (p_sum              => rests.rest,
                                              p_rate             => (  crdpercent
                                                                     - crdoldpercent
                                                                    ),
                                              p_coefficient      => 1,
                                              p_delimmer         => 1
                                             )
                      * currencyostat;
                  tramount := ROUND (tramount, 2);
                  /*-----------------First Transaction-----------------*/
                  debitaccid :=
                     cm_utils.lnkreserveaccount (p_custcategory      => port.customertype,
                                                 p_crdcurrency       => port.currency,
                                                 p_bankid            => port.branchid
                                                );
                  creditaccid := accounts.primaryreserveaccid;

                  IF     (tramount IS NOT NULL)
                     AND (tramount > 0)
                     AND (   (rests.duerest <> 0)
                          OR (rests.dueinterestrest <> 0)
                         )
                  THEN
                     firsttrid :=
                        cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                            p_debitid              => debitaccid,
                                                            p_creditid             => creditaccid,
                                                            p_debitamount          => tramount,
                                                            p_creditamount         => NULL,
                                                            p_lamount              => NULL,
                                                            p_trname               =>    'Ещтийатын йенилянмяси-MY '
                                                                                      || port.numberofcredit,
                                                            p_flags                => sb_decls.atfcommitimmediate,
                                                            p_transactiondate      => currdate,
                                                            p_operationtype        => cm_decls.cmtransactionoptype,
                                                            p_inbalancechar        => NULL
                                                           );
                  END IF;

                  UPDATE cm_curr_state
                     SET reserveid = (SELECT ID
                                        FROM cm_reserve_types
                                       WHERE PERCENT = crdpercent);

                  UPDATE cm_auto_exp
                     SET expamt = tramount,
                         expdate = currdate
                   WHERE creditid = port.ID;

                  IF SQL%NOTFOUND
                  THEN
                     INSERT INTO cm_auto_exp
                                 (creditid, expamt, expdate
                                 )
                          VALUES (port.ID, tramount, currdate
                                 );
                  END IF;
               END IF;
            END IF;
         END IF;

         COMMIT;
      END LOOP;
   END;
   
     procedure PayAuto(
            p_CreditID in Integer ,
            p_Date in Date ,            
            p_ShowTransactions in Boolean default False
            )
  is
  
     cursor c_HistoryInfo(CrdID in Integer) is
     select REST ,
            DUEREST ,
            INTERESTREST ,
            DUEINTERESTREST 
       from CM_CURR_STATE
      where CREDITID = CrdID;

      cursor c_Accounts(CrdID in Integer) is
      select BOOROWERACCID
        from CM_ACCOUNTS
       where CreditID = CrdID;
       
      cursor c_CurrAccRest(AcID in Integer) is
      select OSTAT
        from SB_TENOSTAT
       where Acc_ID = AcID;  
  
  HistInfoRec c_HistoryInfo%rowtype;         
  AccRec c_Accounts%rowtype;
  CurrAccRestRec c_CurrAccRest%rowtype; 
  
  LoanPaymentAmt Number := 0;
  DueLoanPaymentAmt Number := 0;
  InterestPaymentAmt Number := 0;
  DueInterestPaymentAmt Number := 0;
  
  CurrAccAmt Number;
  
  CurrAccFound Boolean;
  
  Temp Number;
    
  begin
    
    open c_Accounts(p_CreditID);
    fetch c_Accounts into AccRec;
    CurrAccFound := c_Accounts%found and (AccRec.BOOROWERACCID is not null); 
    close c_Accounts;
    
    if not CurrAccFound then
      CM_UTILS.ProcessError(0); -- ToDo
    end if;

    open c_CurrAccRest(AccRec.BOOROWERACCID);
    fetch c_CurrAccRest into CurrAccRestRec; 
    close c_CurrAccRest;
    
    CurrAccAmt := CurrAccRestRec.OSTAT;
    
    if (CurrAccAmt is null) or (CurrAccAmt <= 0) then
      CM_UTILS.ProcessError(0); --ToDo
    end if; 
    
    open c_HistoryInfo(p_CreditID);
    fetch c_HistoryInfo into HistInfoRec;
    close c_HistoryInfo;
    
    if HistInfoRec.REST + 
       HistInfoRec.INTERESTREST + 
       HistInfoRec.DUEINTERESTREST +
       HistInfoRec.DUEREST = 0 then   -- Nothing To Pay
       
    CM_UTILS.ProcessError(0); --ToDo
       
    end if;    
    
    Temp := HistInfoRec.DUEREST;
    if  Temp > 0 then
      if Temp > CurrAccAmt then
        DueLoanPaymentAmt := CurrAccAmt;
      else
        DueLoanPaymentAmt := Temp;   
      end if;  
      CurrAccAmt := CurrAccAmt - Temp;   
    end if;        

    Temp := HistInfoRec.DUEINTERESTREST;
    if  (Temp > 0) and (CurrAccAmt > 0) then
      if Temp > CurrAccAmt then
        DueInterestPaymentAmt := CurrAccAmt;
      else
        DueInterestPaymentAmt := Temp;   
      end if;  
      CurrAccAmt := CurrAccAmt - Temp;   
    end if;        

    Temp := HistInfoRec.INTERESTREST;
    if  (Temp > 0) and (CurrAccAmt > 0) then
      if Temp > CurrAccAmt then
        InterestPaymentAmt := CurrAccAmt;
      else
        InterestPaymentAmt := Temp;   
      end if;  
      CurrAccAmt := CurrAccAmt - Temp;   
    end if;        

    Temp := HistInfoRec.REST;
    if  (Temp > 0) and (CurrAccAmt > 0) then
      if Temp > CurrAccAmt then
        LoanPaymentAmt := CurrAccAmt;
      else
        LoanPaymentAmt := Temp;   
      end if;  
      CurrAccAmt := CurrAccAmt - Temp;   
    end if;        
    
    cm_payment.PaymentAdd(
        p_CreditID => p_CreditID , 
        p_Date => p_Date ,
        p_CustAccID => AccRec.BOOROWERACCID ,
        p_MainDebt => LoanPaymentAmt ,
        p_MainInterest => InterestPaymentAmt ,
        p_DueDebt => DueLoanPaymentAmt ,
        p_DueInterest => DueInterestPaymentAmt ,
        p_ProcessTransactions => True    
    );
    
   CM_TRANSACTIONMGR.CM_CommitDelayedTransactions(SB_DECLS.atfCommitImmediate);

   commit work; 
   EXCEPTION WHEN OTHERS THEN
   rollback work;    
                
  end;          

END;
/

