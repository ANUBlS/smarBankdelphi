/* Formatted on 2006/02/27 18:07 (Formatter Plus v4.7.0) */
DECLARE
   CURSOR c_acc
   IS
      SELECT   loanaccid, dueloanaccid, primaryreserveaccid,
               secondaryreserveaccid
          FROM cm_accounts
       WHERE creditid IN (SELECT ID
                              FROM cm_portfolio
                             WHERE numberofcredit IN ('t1', 't2'))   
      GROUP BY loanaccid,
               dueloanaccid,
               primaryreserveaccid,
               secondaryreserveaccid;

   CURSOR c_port (p_id IN INTEGER)
   IS
      SELECT ID, numberofcredit, currency, customertype, branchid
        FROM cm_portfolio
       WHERE ID IN (SELECT creditid
                      FROM cm_accounts
                     WHERE loanaccid = p_id);

   CURSOR c_rest (p_id IN INTEGER)
   IS
      SELECT rest, duerest, reserveid, duereserveid
        FROM cm_curr_state
       WHERE creditid = p_id;

   CURSOR c_ostat (val IN INTEGER)
   IS
      SELECT ostat
        FROM sb_temprate
       WHERE val_kod = val;

   CURSOR c_sm_ostat (p_id IN INTEGER)
   IS
      SELECT ostat
        FROM sb_tenostat
       WHERE acc_id = p_id;

   CURSOR c_res (p_id IN INTEGER)
   IS
      SELECT PERCENT
        FROM cm_reserve_types
       WHERE ID = p_id;

   sm_ostat        c_sm_ostat%ROWTYPE;
   restinfo        c_rest%ROWTYPE;
   ostatinfo       c_ostat%ROWTYPE;
   resinfo         c_res%ROWTYPE;
   srest           NUMBER;
   sduerest        NUMBER;
   custtype        NUMBER;
   filial          NUMBER;
   currencytype    NUMBER;
   numcredit       VARCHAR2 (50);
   factresamt      NUMBER;
   duefactresamt      NUMBER;
   tramt           NUMBER;
   debitaccid      NUMBER;
   creditaccid     NUMBER;
   trdescription   VARCHAR2 (80);
   currdate        DATE;
   temptrid        NUMBER;
BEGIN
   SELECT tek_dat
     INTO currdate
     FROM sb_sysdat;

   FOR acc IN c_acc
   LOOP
      srest := 0;
      sduerest := 0;

      FOR port IN c_port (acc.loanaccid)
      LOOP
         custtype := port.customertype;
         filial := port.branchid;
         currencytype := port.currency;
         numcredit := port.numberofcredit;
         OPEN c_rest (port.ID);
         FETCH c_rest INTO restinfo;
         CLOSE c_rest;
         OPEN c_res (restinfo.reserveid);
         FETCH c_res INTO resinfo;
         CLOSE c_res;
         srest := srest + restinfo.rest * resinfo.PERCENT / 100;
         OPEN c_res (restinfo.duereserveid);
         FETCH c_res INTO resinfo;
         CLOSE c_res;
         sduerest := sduerest + restinfo.duerest * resinfo.PERCENT / 100;
      END LOOP;

      OPEN c_ostat (currencytype);
      FETCH c_ostat INTO ostatinfo;
      CLOSE c_ostat;

      OPEN c_sm_ostat (acc.primaryreserveaccid);
      FETCH c_sm_ostat INTO sm_ostat;
      CLOSE c_sm_ostat;

      factresamt := srest * ostatinfo.ostat;
      if factresamt >0 then
      tramt := factresamt - sm_ostat.ostat;

      IF tramt <> 0
      THEN --1
         IF tramt > 0
         THEN --2
            debitaccid :=
               cm_utils.lnkreserveaccount (p_custcategory      => custtype,
                                           p_crdcurrency       => currencytype,
                                           p_bankid            => filial
                                          );
            creditaccid := acc.primaryreserveaccid;
         ELSE
            debitaccid := acc.primaryreserveaccid;
            creditaccid :=
               cm_utils.lnkreserveaccount (p_custcategory      => custtype,
                                           p_crdcurrency       => currencytype,
                                           p_bankid            => filial
                                          );
         END IF;

         tramt := ROUND (ABS (tramt), 2);
         trdescription := 'Êנוהטע צחנÿ ושעטייאעûם הÿיטרטכלÿסט  ¹' || numcredit;
         trdescription :=
                     REPLACE (trdescription, cm_decls.trdescnumber, numcredit);
         trdescription :=
            REPLACE (trdescription,
                     cm_decls.trdescdate,
                     TO_CHAR (currdate, 'DD/MM/YYYY')
                    );
         DBMS_OUTPUT.put_line (   'CreditID = '
                               || creditaccid
                               || 'debitid = '
                               || debitaccid
                              );
         temptrid :=
            cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                p_debitid              => debitaccid,
                                                p_creditid             => creditaccid,
                                                p_debitamount          => tramt,
                                                p_creditamount         => tramt,
                                                p_lamount              => tramt,
                                                p_flags                => sb_decls.atfcommitimmediate,
                                                p_operationtype        => cm_decls.cmtransactionoptype,
                                                p_inbalancechar        => NULL,
                                                p_transactiondate      => currdate,
                                                p_trname               => trdescription
                                               );
      end if;                                         
      END IF; --2
/*----------------------------------------------------------*/
      OPEN c_sm_ostat (acc.SECONDARYRESERVEACCID);
      FETCH c_sm_ostat INTO sm_ostat;
      CLOSE c_sm_ostat;

      factresamt := sduerest * ostatinfo.ostat;
      if  factresamt <> 0 then
      tramt := factresamt - sm_ostat.ostat;

      IF tramt <> 0
      THEN --1
         IF tramt > 0
         THEN --2
            debitaccid :=
               cm_utils.lnkDueReserveAccount (p_custcategory      => custtype,
                                           p_crdcurrency       => currencytype,
                                           p_bankid            => filial
                                          );
            creditaccid := acc.SECONDARYRESERVEACCID;
         ELSE
            debitaccid := acc.SECONDARYRESERVEACCID;
            creditaccid :=
               cm_utils.lnkDueReserveAccount (p_custcategory      => custtype,
                                           p_crdcurrency       => currencytype,
                                           p_bankid            => filial
                                          );
         END IF;

         tramt := ROUND (ABS (tramt), 2);
         trdescription := 'Êנוהטע צחנÿ ושעטייאעûם הÿיטרטכלÿסט  ¹' || numcredit;
         trdescription :=
                     REPLACE (trdescription, cm_decls.trdescnumber, numcredit);
         trdescription :=
            REPLACE (trdescription,
                     cm_decls.trdescdate,
                     TO_CHAR (currdate, 'DD/MM/YYYY')
                    );
         DBMS_OUTPUT.put_line (   'CreditID = '
                               || creditaccid
                               || 'debitid = '
                               || debitaccid
                              );
         temptrid :=
            cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                p_debitid              => debitaccid,
                                                p_creditid             => creditaccid,
                                                p_debitamount          => tramt,
                                                p_creditamount         => tramt,
                                                p_lamount              => tramt,
                                                p_flags                => sb_decls.atfcommitimmediate,
                                                p_operationtype        => cm_decls.cmtransactionoptype,
                                                p_inbalancechar        => NULL,
                                                p_transactiondate      => currdate,
                                                p_trname               => trdescription
                                               );
      END IF; --2
      end if;
   END LOOP;
END;

