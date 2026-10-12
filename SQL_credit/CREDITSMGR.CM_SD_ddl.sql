-- Start of DDL Script for Package CREDITSMGR.CM_SD
-- Generated 24-Sep-2007 12:15:27 from CREDITSMGR@SD

CREATE OR REPLACE 
PACKAGE cm_sd
IS
   PROCEDURE get_duerest (
      bdat         IN   DATE,
      edat         IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   );

   PROCEDURE get_obligation (
      dat          IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   );

   PROCEDURE get_payments (
      bdat         IN   DATE,
      edat         IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   );

   PROCEDURE get_rest (
      dat          IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   );

   PROCEDURE get_tranches (
      bdat         IN   DATE,
      edat         IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   );

   FUNCTION get_annint (crdid IN INTEGER)
      RETURN NUMBER;

   PROCEDURE results_sd (
      bdat         IN   DATE,
      edat         IN   DATE,
      val_kod      IN   INTEGER,
      persontype   IN   INTEGER
   );

   PROCEDURE run_result (
      bdate    IN   DATE,
      edate    IN   DATE,
      n_val    IN   BOOLEAN DEFAULT FALSE,
      f_val    IN   BOOLEAN DEFAULT FALSE,
      fn_val   IN   BOOLEAN DEFAULT FALSE,
      natper   IN   BOOLEAN DEFAULT FALSE,
      legper   IN   BOOLEAN DEFAULT FALSE
   );

   FUNCTION get_ostat (p_id IN INTEGER, p_dat IN DATE)
      RETURN NUMBER;
  FUNCTION get_divzero (p IN NUMBER)
      RETURN NUMBER;
  function get_creditTranche(p_creditid in integer,bdat in date,edat in date)
  return number;
  function Get_CreditRest(p_creditid in integer,p_dat in date)
  return number;
  function get_creditPayment(p_creditid in integer,bdat in date,edat in date)
  return number;
  function Get_CreditBalance(p_Creditid in integer)
   return integer;
  function get_CreditCurrency(p_currency in integer)
 return varchar2;
  function get_creditprlngdat(p_creditid in integer)
return date;
  function get_creditExpires(p_creditid in integer,bdat in date,edat in date)
  return number;
  function Get_CreditDueRest(p_creditid in integer,p_dat in date)
  return number;
  procedure InitSDData(bdat in date,edat in date);
  function get_crdPayment(p_creditid in integer)
  return number;
  function get_crdTranche(p_creditid in integer)
  return number;
  FUNCTION get_crdexpires (p_creditid IN INTEGER)
      RETURN NUMBER;
  FUNCTION get_period (p_id IN INTEGER/*, p_dat IN DATE*/)
      RETURN VARCHAR2;
END;
/


CREATE OR REPLACE 
PACKAGE BODY            cm_sd
IS
   PROCEDURE get_rest (
      dat          IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   )
   IS
      CURSOR c_rest (
         p_dat          IN   DATE,
         p_val_kod      IN   INTEGER,
         p_bper         IN   NUMBER,
         p_eper         IN   NUMBER,
         p_pername      IN   VARCHAR2,
         p_persontype   IN   NUMBER
      )
      IS
         SELECT SUM (rest) AS csrest,
                SUM (rest * get_annint (creditid)) AS carest
           FROM cm_history
          WHERE hdate = p_dat
            AND creditid IN (
                   SELECT ID
                     FROM cm_portfolio
                    WHERE currency = p_val_kod
                      AND personaltype = p_persontype
                      AND ((duedatefirstcontract - dateofconclusion) >= p_bper
                          )
                      AND ((duedatefirstcontract - dateofconclusion) <= p_eper
                          ));

      CURSOR c_ostat (v IN INTEGER, p_d IN DATE)
      IS
         SELECT ostat
           FROM sb_operkurs
          WHERE val_kod = v AND dat = p_d;

      restinfo    c_rest%ROWTYPE;
      ostatinfo   c_ostat%ROWTYPE;
      srest       NUMBER;
      arest       NUMBER;
      prid        NUMBER;
      currostat   NUMBER;
   BEGIN
      OPEN c_ostat (val_kod, dat);
      FETCH c_ostat INTO ostatinfo;
      CLOSE c_ostat;
      OPEN c_rest (dat, val_kod, bper, eper, pername, persontype);
      FETCH c_rest INTO restinfo;
      CLOSE c_rest;
      srest := NVL (restinfo.csrest, 0) /** ostatinfo.ostat*/;
      arest := NVL (restinfo.carest, 0) /** ostatinfo.ostat*/;

      /* IF srest <> 0
       THEN
          arest := arest / srest;
       END IF;*/
      IF val_kod = 0
      THEN
         INSERT INTO cm_rests_sd
                     (ID, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount
                     )
              VALUES (perid, pername, srest, arest, 0,
                      0, 0, 0
                     );
      END IF;

      IF val_kod = 1
      THEN
         INSERT INTO cm_rests_sd
                     (ID, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount
                     )
              VALUES (perid, pername, 0, 0, srest,
                      arest, 0, 0
                     );
      END IF;

      IF val_kod = 48
      THEN
         INSERT INTO cm_rests_sd
                     (ID, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount
                     )
              VALUES (perid, pername, 0, 0, 0,
                      0, srest, arest
                     );
      END IF;
   END;

   PROCEDURE get_tranches (
      bdat         IN   DATE,
      edat         IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   )
   IS
      CURSOR c_tr (
         p_bdat         IN   DATE,
         p_edat         IN   DATE,
         p_val_kod      IN   INTEGER,
         p_bper         IN   NUMBER,
         p_eper         IN   NUMBER,
         p_pername      IN   VARCHAR2,
         p_persontype   IN   NUMBER
      )
      IS
         SELECT SUM (trancheamount * get_ostat (creditid, tranchedate)
                    ) AS ctramt,
                SUM (  trancheamount
                     * get_annint (creditid)
                     * get_ostat (creditid, tranchedate)
                    ) AS catr
           FROM cm_tranches
          WHERE tranchedate BETWEEN p_bdat AND p_edat
            AND creditid IN (
                   SELECT ID
                     FROM cm_portfolio
                    WHERE currency = p_val_kod
                      AND personaltype = p_persontype
                      AND ((duedatefirstcontract - dateofconclusion) >= p_bper
                          )
                      AND ((duedatefirstcontract - dateofconclusion) <= p_eper
                          ));

      trinfo   c_tr%ROWTYPE;
      tramt    NUMBER;
      atr      NUMBER;
      prid     NUMBER;
   BEGIN
      OPEN c_tr (bdat, edat, val_kod, bper, eper, pername, persontype);
      FETCH c_tr INTO trinfo;
      CLOSE c_tr;
      tramt := NVL (trinfo.ctramt, 0);
      atr := NVL (trinfo.catr, 0);

      IF tramt <> 0
      THEN
         atr := atr / tramt;
      END IF;

      IF val_kod = 0
      THEN
         INSERT INTO cm_tranches_sd
                     (ID, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount
                     )
              VALUES (perid, pername, tramt, atr, 0,
                      0, 0, 0
                     );
      END IF;

      IF val_kod = 1
      THEN
         INSERT INTO cm_tranches_sd
                     (ID, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount
                     )
              VALUES (perid, pername, 0, 0, tramt,
                      atr, 0, 0
                     );
      END IF;

      IF val_kod = 48
      THEN
         INSERT INTO cm_tranches_sd
                     (ID, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount
                     )
              VALUES (perid, pername, 0, 0, 0,
                      0, tramt, atr
                     );
      END IF;
   END;

   PROCEDURE get_payments (
      bdat         IN   DATE,
      edat         IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   )
   IS
      CURSOR c_pay (
         p_bdat         IN   DATE,
         p_edat         IN   DATE,
         p_val_kod      IN   INTEGER,
         p_bper         IN   NUMBER,
         p_eper         IN   NUMBER,
         p_pername      IN   VARCHAR2,
         p_persontype   IN   NUMBER
      )
      IS
         SELECT SUM (payedamt * get_ostat (creditid, paydate)) AS cspay,
                SUM (  payedamt
                     * get_annint (creditid)
                     * get_ostat (creditid, paydate)
                    ) AS capay
           FROM cm_payments
          WHERE paydate BETWEEN p_bdat AND p_edat
            AND creditid IN (
                   SELECT ID
                     FROM cm_portfolio
                    WHERE currency = p_val_kod
                      AND personaltype = p_persontype
                      AND ((duedatefirstcontract - dateofconclusion) >= p_bper
                          )
                      AND ((duedatefirstcontract - dateofconclusion) <= p_eper
                          ));

      payinfo   c_pay%ROWTYPE;
      spay      NUMBER;
      apay      NUMBER;
      prid      NUMBER;
   BEGIN
      OPEN c_pay (bdat, edat, val_kod, bper, eper, pername, persontype);
      FETCH c_pay INTO payinfo;
      CLOSE c_pay;
      spay := NVL (payinfo.cspay, 0);
      apay := NVL (payinfo.capay, 0);

      IF spay <> 0
      THEN
         apay := apay / spay;
      END IF;

      IF val_kod = 0
      THEN
         INSERT INTO cm_payments_sd
                     (ID, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount
                     )
              VALUES (perid, pername, spay, apay, 0,
                      0, 0, 0
                     );
      END IF;

      IF val_kod = 1
      THEN
         INSERT INTO cm_payments_sd
                     (ID, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount
                     )
              VALUES (perid, pername, 0, 0, spay,
                      apay, 0, 0
                     );
      END IF;

      IF val_kod = 48
      THEN
         INSERT INTO cm_payments_sd
                     (ID, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount
                     )
              VALUES (perid, pername, 0, 0, 0,
                      0, spay, apay
                     );
      END IF;
   END;

   PROCEDURE get_obligation (
      dat          IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   )
   IS
      CURSOR c_obl (
         p_dat          IN   DATE,
         p_val_kod      IN   INTEGER,
         p_bper         IN   NUMBER,
         p_eper         IN   NUMBER,
         p_pername      IN   VARCHAR2,
         p_persontype   IN   NUMBER
      )
      IS
         SELECT SUM (obligation) AS csobl,
                SUM (obligation * get_annint (creditid)) AS caobl
           FROM cm_history
          WHERE hdate = p_dat
            AND creditid IN (
                   SELECT ID
                     FROM cm_portfolio
                    WHERE currency = p_val_kod
                      AND personaltype = p_persontype
                      AND ((duedatefirstcontract - dateofconclusion) >= p_bper
                          )
                      AND ((duedatefirstcontract - dateofconclusion) <= p_eper
                          ));

      CURSOR c_ostat (v IN INTEGER, p_d IN DATE)
      IS
         SELECT ostat
           FROM sb_operkurs
          WHERE val_kod = v AND dat = p_d;

      oblinfo     c_obl%ROWTYPE;
      ostatinfo   c_ostat%ROWTYPE;
      sobl        NUMBER;
      aobl        NUMBER;
      prid        NUMBER;
   BEGIN
      OPEN c_ostat (val_kod, dat);
      FETCH c_ostat INTO ostatinfo;
      CLOSE c_ostat;
      OPEN c_obl (dat, val_kod, bper, eper, pername, persontype);
      FETCH c_obl INTO oblinfo;
      CLOSE c_obl;
      sobl := NVL (oblinfo.csobl, 0) * ostatinfo.ostat;
      aobl := NVL (oblinfo.caobl, 0) * ostatinfo.ostat;

      IF sobl <> 0
      THEN
         aobl := aobl / sobl;
      END IF;

      IF val_kod = 0
      THEN
         INSERT INTO cm_obligations_sd
                     (ID, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount
                     )
              VALUES (perid, pername, sobl, aobl, 0,
                      0, 0, 0
                     );
      END IF;

      IF val_kod = 1
      THEN
         INSERT INTO cm_obligations_sd
                     (ID, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount
                     )
              VALUES (perid, pername, 0, 0, sobl,
                      aobl, 0, 0
                     );
      END IF;

      IF val_kod = 48
      THEN
         INSERT INTO cm_obligations_sd
                     (ID, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount
                     )
              VALUES (perid, pername, 0, 0, 0,
                      0, sobl, aobl
                     );
      END IF;
   END;

   PROCEDURE get_duerest (
      bdat         IN   DATE,
      edat         IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   )
   IS
      CURSOR c_duerest (
         p_bdat         IN   DATE,
         p_edat         IN   DATE,
         p_val_kod      IN   INTEGER,
         p_bper         IN   NUMBER,
         p_eper         IN   NUMBER,
         p_pername      IN   VARCHAR2,
         p_persontype   IN   NUMBER
      )
      IS
         SELECT SUM (duerest * get_ostat (creditid, hdate)) AS csduerest,
                SUM (  duerest
                     * get_annint (creditid)
                     * get_ostat (creditid, hdate)
                    ) AS caduerest
           FROM cm_history
          WHERE hdate BETWEEN p_bdat AND p_edat
            AND creditid IN (
                   SELECT ID
                     FROM cm_portfolio
                    WHERE currency = p_val_kod
                      AND personaltype = p_persontype
                      AND ((duedatefirstcontract - dateofconclusion) >= p_bper
                          )
                      AND ((duedatefirstcontract - dateofconclusion) <= p_eper
                          ));

      duerestinfo   c_duerest%ROWTYPE;
      sduerest      NUMBER;
      aduerest      NUMBER;
      prid          NUMBER;
   BEGIN
      OPEN c_duerest (bdat, edat, val_kod, bper, eper, pername, persontype);
      FETCH c_duerest INTO duerestinfo;
      CLOSE c_duerest;
      sduerest := NVL (duerestinfo.csduerest, 0);
      aduerest := NVL (duerestinfo.caduerest, 0);

      IF sduerest <> 0
      THEN
         aduerest := aduerest / sduerest;
      END IF;

      IF val_kod = 0
      THEN
         INSERT INTO cm_duerests_sd
                     (ID, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount
                     )
              VALUES (perid, pername, sduerest, aduerest, 0,
                      0, 0, 0
                     );
      END IF;

      IF val_kod = 1
      THEN
         INSERT INTO cm_duerests_sd
                     (ID, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount
                     )
              VALUES (perid, pername, 0, 0, sduerest,
                      aduerest, 0, 0
                     );
      END IF;

      IF val_kod = 48
      THEN
         INSERT INTO cm_duerests_sd
                     (ID, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount
                     )
              VALUES (perid, pername, 0, 0, 0,
                      0, sduerest, aduerest
                     );
      END IF;
   END;

   PROCEDURE results_sd (
      bdat         IN   DATE,
      edat         IN   DATE,
      val_kod      IN   INTEGER,
      persontype   IN   INTEGER
   )
   IS
      CURSOR c_per
      IS
         SELECT ID, NAME, bperiod, eperiod
           FROM cm_periods;
   BEGIN
      FOR per IN c_per
      LOOP
         get_rest (bdat,
                   val_kod,
                   per.bperiod,
                   per.eperiod,
                   per.NAME,
                   per.ID,
                   persontype
                  );
         get_tranches (bdat,
                       edat,
                       val_kod,
                       per.bperiod,
                       per.eperiod,
                       per.NAME,
                       per.ID,
                       persontype
                      );
         get_payments (bdat,
                       edat,
                       val_kod,
                       per.bperiod,
                       per.eperiod,
                       per.NAME,
                       per.ID,
                       persontype
                      );
         get_obligation (edat,
                         val_kod,
                         per.bperiod,
                         per.eperiod,
                         per.NAME,
                         per.ID,
                         persontype
                        );
         get_duerest (bdat,
                      edat,
                      val_kod,
                      per.bperiod,
                      per.eperiod,
                      per.NAME,
                      per.ID,
                      persontype
                     );
      END LOOP;
   END;

   FUNCTION get_period (p_id IN INTEGER/*, p_dat IN DATE*/)
      RETURN VARCHAR2
   IS
      cm        NUMBER;
      RESULT    VARCHAR2 (56);

      CURSOR c_p(p_per in integer)
      IS
         SELECT NAME
           FROM cm_periods
           where p_per between bperiod and eperiod ;

      lastdat   DATE;
      pr c_p%rowtype;
   BEGIN
      SELECT (  /*NVL (get_creditprlngdat (ID),*/ duedatefirstcontract/*)*/
              - dateofconclusion
             )
        INTO cm
        FROM cm_portfolio
       WHERE ID = p_id;

      open c_p(cm);
      fetch c_p into RESULT;
      close c_p;

      /*FOR pr IN c_p
      LOOP
         IF (cm >= pr.bperiod) AND (cm <= pr.eperiod)
         THEN
            RESULT := pr.NAME;
            EXIT;
         END IF;
      END LOOP;*/

      RETURN RESULT;
   END;

   FUNCTION get_annint (crdid IN INTEGER)
      RETURN NUMBER
   IS
      RESULT   NUMBER;
   BEGIN
      SELECT annualyinterestrate
        INTO RESULT
        FROM cm_portfolio
       WHERE ID = crdid;

      RETURN RESULT;
   END;

   PROCEDURE run_result (
      bdate    IN   DATE,
      edate    IN   DATE,
      n_val    IN   BOOLEAN DEFAULT FALSE,
      f_val    IN   BOOLEAN DEFAULT FALSE,
      fn_val   IN   BOOLEAN DEFAULT FALSE,
      natper   IN   BOOLEAN DEFAULT FALSE,
      legper   IN   BOOLEAN DEFAULT FALSE
   )
   IS
   BEGIN
      IF n_val AND natper
      THEN
         results_sd (bdate, edate, 0, 1);
      END IF;

      IF n_val AND legper
      THEN
         results_sd (bdate, edate, 0, 2);
      END IF;

      IF f_val AND natper
      THEN
         results_sd (bdate, edate, 1, 1);
      END IF;

      IF f_val AND legper
      THEN
         results_sd (bdate, edate, 1, 2);
      END IF;

      IF fn_val AND natper
      THEN
         results_sd (bdate, edate, 48, 1);
      END IF;

      IF fn_val AND legper
      THEN
         results_sd (bdate, edate, 48, 2);
      END IF;
   END;

   FUNCTION get_ostat (p_id IN INTEGER, p_dat IN DATE)
      RETURN NUMBER
   IS
      RESULT   NUMBER;
   BEGIN
      SELECT ostat
        INTO RESULT
        FROM sb_operkurs
       WHERE dat = (SELECT MAX (dat)
                      FROM sb_operkurs
                     WHERE dat <= p_dat) AND val_kod = (SELECT currency
                                                          FROM cm_portfolio
                                                         WHERE ID = p_id);

      RETURN RESULT;
   END;

   FUNCTION get_divzero (p IN NUMBER)
      RETURN NUMBER
   IS
      RESULT   NUMBER;
   BEGIN
      IF p = 0
      THEN
         RESULT := 1;
      END IF;

      IF p <> 0
      THEN
         RESULT := p;
      END IF;

      RETURN RESULT;
   END;

   FUNCTION get_creditbalance (p_creditid IN INTEGER)
      RETURN INTEGER
   IS
      RESULT   INTEGER;
   BEGIN
      SELECT bal_cn1
        INTO RESULT
        FROM sb_account
       WHERE ID = (SELECT contractaccid
                     FROM cm_accounts
                    WHERE creditid = p_creditid);

      RETURN RESULT;
   END;

   FUNCTION get_creditrest (p_creditid IN INTEGER, p_dat IN DATE)
      RETURN NUMBER
   IS
      RESULT   NUMBER;
   BEGIN
      SELECT rest /**get_ostat(p_creditid,p_dat)*/
        INTO RESULT
        FROM cm_hist                                                    /*ory*/
       WHERE creditid = p_creditid
         AND hdate =
                p_dat /*(select max(hdate) from cm_history where hdate <= p_dat)*/;

      RETURN NVL (RESULT, 0);
   END;

   FUNCTION get_creditduerest (p_creditid IN INTEGER, p_dat IN DATE)
      RETURN NUMBER
   IS
      RESULT   NUMBER;
   BEGIN
      SELECT duerest /**get_ostat(p_creditid,p_dat)*/
        INTO RESULT
        FROM cm_hist                                                    /*ory*/
       WHERE creditid = p_creditid
         AND hdate =
                p_dat /*(select max(hdate) from cm_history where hdate <= p_dat)*/;

      RETURN NVL (RESULT, 0);
   END;

   FUNCTION get_credittranche (
      p_creditid   IN   INTEGER,
      bdat         IN   DATE,
      edat         IN   DATE
   )
      RETURN NUMBER
   IS
      RESULT   NUMBER;

      CURSOR c_tr
      IS
         SELECT SUM (trancheamount * get_ostat (p_creditid, tranchedate)
                    ) AS tramt
           FROM cm_tranches
          WHERE creditid = p_creditid AND tranchedate BETWEEN bdat AND edat;
   BEGIN
      OPEN c_tr;
      FETCH c_tr INTO RESULT;
      CLOSE c_tr;
      RETURN NVL (RESULT, 0);
   END;

   FUNCTION get_crdtranche (p_creditid IN INTEGER)
      RETURN NUMBER
   IS
      RESULT   NUMBER;

      CURSOR c_tr
      IS
         SELECT trancheamount AS tramt
           FROM cm_tranch
          WHERE creditid = p_creditid;
   BEGIN
      OPEN c_tr;
      FETCH c_tr INTO RESULT;
      CLOSE c_tr;
      RETURN NVL (RESULT, 0);
   END;

   
   FUNCTION get_crdexpires (p_creditid IN INTEGER)
      RETURN NUMBER
   IS
      RESULT   NUMBER;

      CURSOR c_tr
      IS
         SELECT EXPAMT 
           FROM cm_exp
          WHERE creditid = p_creditid;
   BEGIN
      OPEN c_tr;
      FETCH c_tr INTO RESULT;
      CLOSE c_tr;
      RETURN NVL (RESULT, 0);
   END;

   
   FUNCTION get_creditexpires (
      p_creditid   IN   INTEGER,
      bdat         IN   DATE,
      edat         IN   DATE
   )
      RETURN NUMBER
   IS
      RESULT   NUMBER;

      CURSOR c_tr
      IS
         SELECT SUM (expamount * get_ostat (p_creditid, expdate)) AS tramt
           FROM cm_expires
          WHERE creditid = p_creditid AND expdate BETWEEN bdat AND edat;
   BEGIN
      OPEN c_tr;
      FETCH c_tr INTO RESULT;
      CLOSE c_tr;
      RETURN NVL (RESULT, 0);
   END;

   FUNCTION get_creditprlngdat (p_creditid IN INTEGER)
      RETURN DATE
   IS
      RESULT   DATE;

      CURSOR c_pr
      IS
         SELECT MAX (newclosedate) AS prdat
           FROM cm_prolongations
          WHERE creditid = p_creditid;
   BEGIN
      OPEN c_pr;
      FETCH c_pr INTO RESULT;
      CLOSE c_pr;
      RETURN RESULT;
   END;

   FUNCTION get_creditpayment (
      p_creditid   IN   INTEGER,
      bdat         IN   DATE,
      edat         IN   DATE
   )
      RETURN NUMBER
   IS
      RESULT   NUMBER;

      CURSOR c_tr
      IS
         SELECT SUM (payedamt * get_ostat (p_creditid, paydate)) AS tramt
           FROM cm_payments
          WHERE creditid = p_creditid AND paydate BETWEEN bdat AND edat;
   BEGIN
      OPEN c_tr;
      FETCH c_tr INTO RESULT;
      CLOSE c_tr;
      RETURN NVL (RESULT, 0);
   END;

   FUNCTION get_crdpayment (p_creditid IN INTEGER)
      RETURN NUMBER
   IS
      RESULT   NUMBER;

      CURSOR c_tr
      IS
         SELECT payedamt AS tramt
           FROM cm_pay
          WHERE creditid = p_creditid;
   BEGIN
      OPEN c_tr;
      FETCH c_tr INTO RESULT;
      CLOSE c_tr;
      RETURN NVL (RESULT, 0);
   END;

   FUNCTION get_creditcurrency (p_currency IN INTEGER)
      RETURN VARCHAR2
   IS
      RESULT   VARCHAR2 (5);
   BEGIN
      SELECT val_name
        INTO RESULT
        FROM sb_avalute
       WHERE valute = p_currency;

      RETURN RESULT;
   END;

   PROCEDURE initsddata (bdat IN DATE, edat IN DATE)
   IS
   BEGIN
      COMMIT;

      INSERT INTO cm_hist
         SELECT creditid, hdate, rest, interestrest, duerest,
                dueinterestrest
           FROM cm_history
          WHERE hdate IN (bdat, edat);

      INSERT INTO cm_tranch
         SELECT   creditid,
                  SUM (trancheamount * get_ostat (creditid, tranchedate))
             FROM cm_tranches
            WHERE tranchedate BETWEEN bdat AND edat
         GROUP BY creditid;


      INSERT INTO cm_exp
         SELECT   creditid,
                  SUM (expamount * get_ostat (creditid, expdate))
             FROM cm_expires
            WHERE expdate BETWEEN bdat AND edat
         GROUP BY creditid;

      INSERT INTO cm_pay
         SELECT   creditid, SUM (payedamt * get_ostat (creditid, paydate))
             FROM cm_payments
            WHERE paydate BETWEEN bdat AND edat
         GROUP BY creditid;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_SD

