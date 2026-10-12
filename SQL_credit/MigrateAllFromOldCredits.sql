DECLARE
   CURSOR c_oldcredits
   IS
      SELECT e.contractaccid, e.clientaccid, e.reserveaccid, e.interestaccid,
             e.overdueaccid, e.overdueinterestaccid, e.overduereserveaccid,
             c.id, c.opendate, c.closedate, c.amount, c.contractno,
             c.contracttype, c.pledgetype, c.reliabilityid, c.clienttype,
             c.pledgeprice, c.sid#, c.overduereliabilityid, d.facticaldebt,
             d.overduedebt, d.facticalinterestdebt, d.overdueinterestdebt,
             d.residuaryamount, b.interest, a.overdueinterest
        FROM smart.sbcm_contracts c,
             smart.sbcm_contract_accounts e,
             smart.sbcm_overdueinterests a,
             smart.sbcm_interests b,
             smart.sbcm_contract_state d
       WHERE (a.id# = c.id)
         AND (b.id# = c.id)
         AND (d.id# = c.id)
         AND (e.id# = c.id)
         AND (c.type# = 1)
         AND (e.contractaccid<>-1)
         AND(e.contractaccid in(select id from smart.account where filial=0));

   result   INTEGER;
   curr     INTEGER;
   custid   INTEGER;
   bid      INTEGER;
   rid      INTEGER;
   drid     INTEGER;
BEGIN
   FOR oldrec IN c_oldcredits
   LOOP
      SELECT kli_id, val_acc, filial
        INTO custid, curr, bid
        FROM smart.ACCOUNT
       WHERE id = oldrec.contractaccid;

      SELECT DECODE (
                NVL (oldrec.reliabilityid, 0),
                1, 2,
                2, 1,
                NVL (oldrec.reliabilityid, 0)
             ),
             DECODE (
                NVL (oldrec.overduereliabilityid, 0),
                1, 2,
                2, 1,
                NVL (oldrec.overduereliabilityid, 0)
             )
        INTO rid,
             drid
        FROM DUAL;

      result :=
            cm_credit.contract_add (
               currency=> curr,
               boorowerid=> custid,
               initialamount=> 0,
               creditlineamount=> oldrec.amount,
               annualyinterestrate=> oldrec.interest,
               annualyoverduerate=> oldrec.overdueinterest,
               annualypenaltyrate=> 0,
               dateofconclusion=> oldrec.opendate,
               duedatefirstcontract=> oldrec.closedate,
               numberofcredit=> oldrec.contractno,
               purposeofcredit=> '',
               customertype=> 1,
               credittype=> 4,
               personaltype=> 1,
               autopayment=> 0,
               autoexpire=> 0,
               usrgroup=> 0,
               branchid=> bid,
               booroweraccid=> oldrec.clientaccid,
               loanaccid=> oldrec.contractaccid,
               dueloanaccid=> oldrec.overdueaccid,
               interestaccid=> oldrec.interestaccid,
               dueinterestaccid=> oldrec.overdueinterestaccid,
               primaryreserveaccid=> oldrec.reserveaccid,
               secondaryreserveaccid=> oldrec.overduereserveaccid,
               outcollateralaccid=> NULL,
               outguaranteeaccid=> NULL,
               outinterestaccid =>null,
               crdlineoblaccid =>null,
               reserveid=> rid,
               duereserveid=> drid,
               pledgeprice=> oldrec.pledgeprice,
               pledgeid=> 1
            );

      UPDATE cm_curr_state
         SET rest = oldrec.facticaldebt,
             interestrest = oldrec.facticalinterestdebt,
             duerest = oldrec.overduedebt,
             dueinterestrest = oldrec.overdueinterestdebt,
             obligation = oldrec.residuaryamount
       WHERE creditid = result;
   END LOOP;
END;

