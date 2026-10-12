CREATE OR REPLACE 
PACKAGE cm_autoexp
IS
   PROCEDURE autoexp (p_opdate IN DATE);

   PROCEDURE autores (p_opdate IN DATE);
  PROCEDURE autoexp_one (p_creditid IN integer);
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
          WHERE  ID IN (SELECT creditid
                         FROM cm_payment_schedule
                        WHERE paymentdate = p_date);

   currdat   date;

   BEGIN
      SELECT tek_dat
        INTO currdat
        FROM sb_sysdat;
 
      FOR portinfo IN c_port (currdat)
      LOOP
         autoexp_one(portinfo.id);
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
         SELECT resdate
           FROM cm_auto_res
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

         IF avto_e.resdate <> currdate
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

                  UPDATE cm_auto_res
                     SET resamt = tramount
                   WHERE creditid = port.ID AND resdate = currdate;

                  IF SQL%NOTFOUND
                  THEN
                     INSERT INTO cm_auto_res
                                 (creditid, resamt, resdate
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
   
   PROCEDURE autoexp_one (p_creditid IN integer)
   IS

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

      CURSOR c_a_exp (p_id IN INTEGER, p_date IN DATE)
      IS
         SELECT creditid, expamt
           FROM cm_auto_exp
          WHERE creditid = p_id AND expdate = p_date;

      sm_ostat             c_sm_ostat%ROWTYPE;
      EXP                  c_exp%ROWTYPE;
      shedulerest          c_shedulerest%ROWTYPE;
      currencyostat        c_currencyostat%ROWTYPE;
      reserverate          c_reserverate%ROWTYPE;
      ACCOUNT              c_account%ROWTYPE;
      payment              c_payment%ROWTYPE;
      a_exp                c_a_exp%ROWTYPE;
      debitaccid           INTEGER;
      creditaccid          INTEGER;
      tramount             NUMBER;
      reservecontenabled   BOOLEAN;
      trdescription        VARCHAR2 (50);
      resultmaintrid       INTEGER;
      resultprestrid       INTEGER;
      temp                 NUMBER;
      currdat              DATE;
      crdrest              NUMBER;
      crdinterestrest      NUMBER;
      crdduerest           NUMBER;
      crddueinterestrest   NUMBER;
      stopcalcdat          DATE;
      payrest              NUMBER;
      payinterstrest       NUMBER;
      payduerest           NUMBER;
      paydueinterstrest    NUMBER;
      customercanpay       NUMBER;
      canpay               NUMBER;
      i                    integer;
      Def                  boolean;
      crdnum               varchar2(80);                   
   BEGIN

      SELECT tek_dat
        INTO currdat
        FROM sb_sysdat;

       select numberofcredit 
       into crdnum
       from cm_portfolio
       where  id  = p_creditid;
       
         SELECT rest, interestrest, duerest, dueinterestrest,
                stopcalcdate
           INTO crdrest, crdinterestrest, crdduerest, crddueinterestrest,
                stopcalcdat
           FROM cm_curr_state
          WHERE creditid = p_creditid;

         OPEN c_shedulerest (p_creditid, currdat);
         FETCH c_shedulerest INTO shedulerest;
         CLOSE c_shedulerest;
         OPEN c_account (p_creditid);
         FETCH c_account INTO ACCOUNT;
         CLOSE c_account;
       /*OPEN c_currencyostat (portinfo.currency);
         FETCH c_currencyostat INTO currencyostat;
         CLOSE c_currencyostat;*/
         OPEN c_reserverate (p_creditid);
         FETCH c_reserverate INTO reserverate;
         CLOSE c_reserverate;
         OPEN c_payment (p_creditid, currdat);
         FETCH c_payment INTO payment;
         CLOSE c_payment;
         OPEN c_exp (p_creditid, currdat);
         FETCH c_exp INTO EXP;
         CLOSE c_exp;
         OPEN c_sm_ostat (ACCOUNT.booroweraccid);
         FETCH c_sm_ostat INTO sm_ostat;
         CLOSE c_sm_ostat;
         
         customercanpay := sm_ostat.ostat;
         
         OPEN c_a_exp (p_creditid, currdat);
         FETCH c_a_exp INTO a_exp;
          IF c_a_exp%NOTFOUND
         THEN Def := False;else Def :=true; 
         end if;
         CLOSE c_a_exp;
        if not Def then 
         
            /*Temp := crdduerest;
            if (Temp > 0) and (CustomerCanPay > 0) then
              if Temp > CustomerCanPay then
                payDuerest := CustomerCanPay;
              else
                payDuerest := Temp;

              CustomerCanPay := CustomerCanPay - Temp;
            end if;
            end if;

            Temp := crddueinterestrest;
            if (Temp > 0) and (CustomerCanPay > 0) then
              if Temp > CustomerCanPay then
                paydueinterstrest := CustomerCanPay;
              else
                paydueinterstrest := Temp;

              CustomerCanPay := CustomerCanPay - Temp;
            end if;
            end if;*/
            if customercanpay > 0 then
            IF stopcalcdat IS NULL
            THEN
               temp := shedulerest.interest /*crdinterestrest*/;

               IF (temp > 0) AND (customercanpay > 0)
               THEN
                  IF temp > customercanpay
                  THEN
                     payinterstrest := customercanpay;
                  ELSE
                     payinterstrest := temp;
                     customercanpay := customercanpay - temp;
                     dbms_output.put_line('customercanpay 1 =  '||customercanpay);
                  END IF;
               END IF;

               temp := shedulerest.principal /*crdrest*/;

               IF (temp > 0) AND (customercanpay > 0)
               THEN
                  IF temp > customercanpay
                  THEN
                     payrest := customercanpay;
                  ELSE
                     payrest := temp;
                  END IF;
               END IF;
            END IF;

            IF stopcalcdat IS NOT NULL
            THEN
               temp := shedulerest.principal /*crdrest*/;

               IF (temp > 0) AND (customercanpay > 0)
               THEN
                  IF temp > customercanpay
                  THEN
                     payrest := customercanpay;
                  ELSE
                     payrest := temp;
                     customercanpay := customercanpay - temp;
                     dbms_output.put_line('customercanpay 2 =  '||customercanpay);
                  END IF;
               END IF;

               temp := shedulerest.interest /*crdinterestrest*/;

               IF (temp > 0) AND (customercanpay > 0)
               THEN
                  IF temp > customercanpay
                  THEN
                     payinterstrest := customercanpay;
                  ELSE
                     payinterstrest := temp;
                  END IF;
               END IF;
            END IF;

            IF payrest + payinterstrest > 0
            THEN
            dbms_output.put_line('payinterstrest =  '||payinterstrest||'crdinterestrest = '||crdinterestrest);
            dbms_output.put_line('payrest =  '||payrest||'crdrest = '||crdrest);

               DBMS_OUTPUT.put_line ('payment begin ');
               cm_payment.paymentadd (p_creditid                 => p_creditid,
                                      p_date                     => currdat,
                                      p_custaccid                => ACCOUNT.booroweraccid,
                                      p_maindebt                 => payrest,
                                      p_maininterest             => payinterstrest,
                                      p_duedebt                  => 0,
                                      p_dueinterest              => 0,
                                      p_processtransactions      => FALSE
                                     );
               DBMS_OUTPUT.put_line ('payment end ');
            END IF;
            end if;
                  debitaccid := ACCOUNT.dueloanaccid;
                  creditaccid := ACCOUNT.loanaccid;
                  tramount :=
                        shedulerest.principal - payrest /*p_Amount*/;
                  trdescription := cm_utils.trdescmaindebtexpire ();
                  trdescription :=
                     REPLACE (trdescription,
                              cm_decls.trdescnumber,
                              crdnum
                             );
                  trdescription :=
                     REPLACE (trdescription,
                              cm_decls.trdescdate,
                              TO_CHAR (currdat, 'DD/MM/YYYY')
                             );
 
                  dbms_output.put_line('creditid =  '||crdnum);
                  dbms_output.put_line('tramount =  '||tramount);
                  IF (debitaccid IS NOT NULL) AND (creditaccid IS NOT NULL)and(tramount <> 0)
                  THEN
                     DBMS_OUTPUT.put_line ('tr begin ');
                     dbms_output.put_line(' i =  '||i);
                     resultmaintrid :=
                        cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                            p_debitid              => debitaccid,
                                                            p_creditid             => creditaccid,
                                                            p_debitamount          => NULL,
                                                            p_creditamount         => tramount,
                                                            p_lamount              => NULL,
                                                            p_trname               => trdescription,
                                                            p_flags                => sb_decls.atfcommitimmediate,
                                                            p_transactiondate      => currdat,
                                                            p_operationtype        => cm_decls.cmtransactionoptype,
                                                            p_inbalancechar        => NULL
                                                           );
                     DBMS_OUTPUT.put_line ('tr end ');
              CM_TRANSACTIONMGR.CM_CommitDelayedTransactions(SB_DECLS.atfCommitImmediate);       

               UPDATE    cm_curr_state
                     SET rest =
                               rest
                             -  payrest
                               ,
                         duerest =
                               duerest
                             + payrest
                   WHERE creditid = p_creditid
               RETURNING rest
                    INTO temp;

               IF temp = 0
               THEN
                  UPDATE cm_accounts
                     SET contractaccid = dueloanaccid
                   WHERE creditid = p_creditid;
               END IF;

               INSERT INTO cm_expires
                           (creditid, expdate,
                            expamount /*, oldduereserveid*/,
                            exptrid, prestrid                    /*, srestrid*/
                           )
                    VALUES (p_creditid, currdat,
                               NVL (shedulerest.principal, 0)
                             - NVL (payment.payedamt, 0) /*, HistInfoRec.DUERESERVEID*/,
                            resultmaintrid, resultprestrid /*, ResultSResTrID*/
                           );

               UPDATE cm_auto_exp
                  SET expamt = tramount
                WHERE creditid = p_creditid AND expdate = currdat;

               IF SQL%NOTFOUND
               THEN
                  INSERT INTO cm_auto_exp
                              (creditid, expamt, expdate
                              )
                       VALUES (p_creditid, tramount, currdat
                              );
               END IF;
            END IF;
         END IF;
       COMMIT WORK;
     EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK WORK;
         dbms_output.put_line('Muqavilenin nomresi =  '||CrdNum);
       
   END;
   
END;
/

