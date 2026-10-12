-- Start of DDL Script for Package CREDITSMGR.CM_SCHEDULE
-- Generated 13-Jul-2007 13:54:20 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE cm_schedule
IS
   PROCEDURE paymentschedule_delete (p_id IN INTEGER);

   PROCEDURE insertannutyschedule (
      p_creditid       IN   INTEGER,
      p_amount         IN   NUMBER,
      p_rate           IN   NUMBER,
      p_firstpaydate   IN   DATE,
      p_startdate      IN   DATE,
      p_periods        IN   INTEGER,
      p_periodrate     IN   INTEGER -- In Months 
   );

   FUNCTION annutypayment_get (
      p_amount       IN   NUMBER,
      p_rate         IN   NUMBER,
      p_periods      IN   INTEGER,
      p_periodrate   IN   INTEGER
   )
      RETURN NUMBER;

   FUNCTION equalpartspayment_get (
      p_amount       IN   NUMBER,
      p_rate         IN   NUMBER,
      p_periods      IN   INTEGER,
      p_periodrate   IN   INTEGER
   )
      RETURN NUMBER;

   PROCEDURE insertequalschedule (
      p_creditid       IN   INTEGER,
      p_amount         IN   NUMBER,
      p_rate           IN   NUMBER,
      p_firstpaydate   IN   DATE,
      p_startdate      IN   DATE,
      p_periods        IN   INTEGER,
      p_periodrate     IN   INTEGER -- In Months 
   );

   PROCEDURE trschedule_add (p_id INTEGER, p_date DATE, p_ammount INTEGER);

   PROCEDURE trschedule_edit (t_id INTEGER, p_date DATE, p_ammount INTEGER);

   PROCEDURE trschedule_del (t_id INTEGER);

   FUNCTION get_annutydate (
      p_date       IN   DATE,
      p_char       IN   VARCHAR2,
      p_creditid   IN   INTEGER,
      FIRST        IN   BOOLEAN
   )
      RETURN DATE;

  PROCEDURE changeschedule (
      p_creditid   IN   INTEGER,
      p_date       IN   DATE,
      p_period     IN   INTEGER,
      p_rest       IN   NUMBER
   );
  FUNCTION paymentschedule_addedit (
      p_id           IN   INTEGER,
      p_creditid     IN   INTEGER,
      p_paydate      IN   DATE,
      p_principial   IN   NUMBER,
      p_interest     IN   NUMBER,
      p_rest         IN   NUMBER DEFAULT NULL,
      p_optype       in   boolean default false
   )
      RETURN INTEGER;
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY cm_schedule
IS
   FUNCTION annutypayment_get (
      p_amount       IN   NUMBER,
      p_rate         IN   NUMBER,
      p_periods      IN   INTEGER,
      p_periodrate   IN   INTEGER
   )
      RETURN NUMBER
   IS
      RESULT   NUMBER (18, 2);
   BEGIN
      RESULT :=
            p_amount
          * POWER ((1 + p_rate / 12 / 100), p_periods)
          * p_rate
          / 12
          / 100
          / (POWER ((1 + p_rate / 12 / 100), p_periods) - 1);
      RETURN RESULT;
   END;

   FUNCTION equalpartspayment_get (
      p_amount       IN   NUMBER,
      p_rate         IN   NUMBER,
      p_periods      IN   INTEGER,
      p_periodrate   IN   INTEGER
   )
      RETURN NUMBER
   IS
      RESULT   NUMBER (18, 2);
   BEGIN
      RESULT := p_amount / p_periods;
      RETURN RESULT;
   END;

   PROCEDURE insertannutyschedule (
      p_creditid       IN   INTEGER,
      p_amount         IN   NUMBER,
      p_rate           IN   NUMBER,
      p_firstpaydate   IN   DATE,
      p_startdate      IN   DATE,
      p_periods        IN   INTEGER,
      p_periodrate     IN   INTEGER -- In Months 
   )
   IS
      annutypayment   NUMBER;
      intramt         NUMBER;
      principialamt   NUMBER;
      fullpayment     NUMBER         := p_amount;
      paydate         DATE           := p_firstpaydate;
      daycnt          INTEGER;
      temp            INTEGER;
      crdrest         NUMBER (18, 2);
      sumpay          NUMBER;
      f               BOOLEAN        := FALSE;
   BEGIN
      annutypayment :=
             annutypayment_get (fullpayment, p_rate, p_periods, p_periodrate);
      daycnt := cm_utils.bankdaysbetween (p_startdate, p_firstpaydate);
      intramt := cm_utils.calcpercent (fullpayment, p_rate, 30 /*DayCnt*/);
      principialamt := annutypayment - intramt;
      crdrest := fullpayment - principialamt;
      temp :=
         paymentschedule_addedit (0,
                                  p_creditid,
                                  get_annutydate (ADD_MONTHS (paydate, -1),
                                                  TO_CHAR (p_firstpaydate,
                                                           'DD'
                                                          ),
                                                  p_creditid,
                                                  FALSE
                                                 ),
                                  principialamt,
                                  intramt,
                                  crdrest
                                 );
      fullpayment := p_amount - principialamt;

      FOR i IN 2 .. p_periods
      LOOP
         intramt :=
                cm_utils.calcpercent (fullpayment, p_rate, p_periodrate * 30);
         principialamt := annutypayment - intramt;
         paydate :=
            get_annutydate (paydate,
                            TO_CHAR (ADD_MONTHS (p_firstpaydate, -1), 'DD'),
                            p_creditid,
                            f
                           );
         crdrest := fullpayment - principialamt;
         f := TRUE;
         temp :=
            paymentschedule_addedit (0,
                                     p_creditid,
                                     paydate,
                                     principialamt,
                                     intramt,
                                     crdrest
                                    );

         IF fullpayment >= principialamt
         THEN
            fullpayment := fullpayment - principialamt;
         ELSE
            fullpayment := 0;
         END IF;
      END LOOP;

      UPDATE cm_payment_schedule
         SET rest = 0
       WHERE creditid = p_creditid
         AND paymentdate = (SELECT MAX (paymentdate)
                              FROM cm_payment_schedule
                             WHERE creditid = p_creditid);
   END;

   PROCEDURE insertequalschedule (
      p_creditid       IN   INTEGER,
      p_amount         IN   NUMBER,
      p_rate           IN   NUMBER,
      p_firstpaydate   IN   DATE,
      p_startdate      IN   DATE,
      p_periods        IN   INTEGER,
      p_periodrate     IN   INTEGER -- In Months 
   )
   IS
      equalpayment    NUMBER;
      intramt         NUMBER;
      principialamt   NUMBER;
      fullpayment     NUMBER  := p_amount;
      paydate         DATE    := p_firstpaydate;
      daycnt          INTEGER;
      temp            INTEGER;
      crdrest         NUMBER;
   BEGIN
      equalpayment :=
         equalpartspayment_get (fullpayment, p_rate, p_periods, p_periodrate);
      daycnt := cm_utils.bankdaysbetween (p_startdate, p_firstpaydate);
      intramt := cm_utils.calcpercent (p_amount, p_rate, daycnt);
      principialamt := equalpayment;
      crdrest := fullpayment - principialamt;
      temp :=
         paymentschedule_addedit (0,
                                  p_creditid,
                                  paydate,
                                  principialamt,
                                  intramt,
                                  crdrest
                                 );
      fullpayment := p_amount - equalpayment;

      FOR i IN 2 .. p_periods
      LOOP
         intramt :=
                cm_utils.calcpercent (fullpayment, p_rate, p_periodrate * 30);
         principialamt := equalpayment;
         paydate := ADD_MONTHS (paydate, 1);
         crdrest := fullpayment - principialamt;
         temp :=
            paymentschedule_addedit (0,
                                     p_creditid,
                                     paydate,
                                     principialamt,
                                     intramt,
                                     crdrest
                                    );

         IF fullpayment >= equalpayment
         THEN
            fullpayment := fullpayment - equalpayment;
         ELSE
            fullpayment := 0;
         END IF;
      END LOOP;
   END;

   FUNCTION paymentschedule_addedit (
      p_id           IN   INTEGER,
      p_creditid     IN   INTEGER,
      p_paydate      IN   DATE,
      p_principial   IN   NUMBER,
      p_interest     IN   NUMBER,
      p_rest         IN   NUMBER DEFAULT NULL,
      p_optype       in   boolean default false
   )
      RETURN INTEGER
   IS
      RESULT         INTEGER;

      CURSOR c_rest
      IS
         SELECT SUM (rest) AS smrest
           FROM cm_payment_schedule
          WHERE creditid = p_creditid;


      crdlineamt     NUMBER;
      sumrest        NUMBER;
      sumpay         NUMBER;
      sumprincipal   NUMBER;
   BEGIN
      SELECT creditlineamount
        INTO crdlineamt
        FROM cm_portfolio
       WHERE ID = p_creditid;

      UPDATE cm_payment_schedule
         SET paymentdate = p_paydate,
             principal = p_principial,
             interest = p_interest,
             rest = p_rest
       WHERE ID = p_id;

      IF SQL%ROWCOUNT = 0
      THEN
         INSERT INTO cm_payment_schedule
                     (creditid, paymentdate, principal, interest, rest
                     )
              VALUES (p_creditid, p_paydate, p_principial, p_interest, p_rest
                     )
           RETURNING ID
                INTO RESULT;

         IF p_rest IS NULL
         THEN
            OPEN c_rest;
            FETCH c_rest INTO sumrest;
            CLOSE c_rest;

            SELECT SUM (principal)
              INTO sumpay
              FROM cm_payment_schedule
             WHERE creditid = p_creditid;

            sumrest := crdlineamt - sumpay;

            UPDATE cm_payment_schedule
               SET rest = sumrest
             WHERE ID = RESULT;
         END IF;
      END IF;

      --commit work;

      RETURN RESULT;
   END;

   PROCEDURE paymentschedule_delete (p_id IN INTEGER)
   IS
   BEGIN
      DELETE FROM cm_payment_schedule
            WHERE ID = p_id;
   --commit work;
   END;

   PROCEDURE trschedule_add (p_id INTEGER, p_date DATE, p_ammount INTEGER)
   IS
   BEGIN
      INSERT INTO cm_tranche_schedule
                  (creditid, trchdate, trchamount
                  )
           VALUES (p_id, p_date, p_ammount
                  );
   END;

   PROCEDURE trschedule_edit (t_id INTEGER, p_date DATE, p_ammount INTEGER)
   IS
   BEGIN
      UPDATE cm_tranche_schedule
         SET trchdate = p_date,
             trchamount = p_ammount
       WHERE ID = t_id;
   END;

   PROCEDURE trschedule_del (t_id INTEGER)
   IS
   BEGIN
      DELETE FROM cm_tranche_schedule
            WHERE ID = t_id;
   END;

   FUNCTION defdate (
      p_date           IN   DATE,
      p_begindatechr   IN   VARCHAR2,
      p_creditid       IN   INTEGER,
      p_first          IN   BOOLEAN
   )
      RETURN DATE
   IS
      RESULT   DATE;
      DAY      VARCHAR2 (5);
      mon      VARCHAR2 (5);
      YEAR     VARCHAR2 (5);
      rday     VARCHAR2 (5);
      rmon     VARCHAR2 (5);
      ryear    VARCHAR2 (5);
      ldat     VARCHAR2 (5);

      CURSOR c_p (bdat IN DATE, edat IN DATE)
      IS
         SELECT *
           FROM cm_payment_schedule
          WHERE creditid = p_creditid AND paymentdate BETWEEN bdat AND edat;

      CURSOR c_cp (bdat IN DATE, edat IN DATE)
      IS
         SELECT COUNT (*) AS cnt
           FROM cm_payment_schedule
          WHERE creditid = p_creditid AND paymentdate BETWEEN bdat AND edat;

      fmdat    DATE;
      lmdat    DATE;
      cfmdat   DATE;
      clmdat   DATE;
      p        c_p%ROWTYPE;
      cp       c_cp%ROWTYPE;
      d        BOOLEAN;
      d1       BOOLEAN;
      cont     INTEGER;
   BEGIN
      fmdat := cm_utils.get_firstmonth (ADD_MONTHS (p_date, -1));
      lmdat := cm_utils.get_lastmonth (ADD_MONTHS (p_date, -1));
      cfmdat := cm_utils.get_firstmonth (p_date);
      clmdat := cm_utils.get_lastmonth (p_date);
      DAY := TO_CHAR (p_date, 'DD');
      mon := TO_CHAR (p_date, 'MON');
      YEAR := TO_CHAR (p_date, 'YYYY');
      ldat := TO_CHAR (LAST_DAY (p_date), 'DD');
      RESULT := ADD_MONTHS (p_date, 1);
      rmon := TO_CHAR (RESULT, 'MON');
      ryear := TO_CHAR (RESULT, 'YYYY');
      rday := TO_CHAR (RESULT, 'DD');

      IF (p_begindatechr <> rday)
      THEN
         IF TO_NUMBER (rday) < TO_NUMBER (p_begindatechr)
         THEN
            RESULT := TO_DATE (rday || '-' || rmon || '-' || ryear);
         ELSE
            RESULT := TO_DATE (p_begindatechr || '-' || rmon || '-' || ryear);
         END IF;
      END IF;

      OPEN c_p (fmdat, lmdat);
      FETCH c_p INTO p;
      d := c_p%FOUND;
      CLOSE c_p;
      OPEN c_cp (cfmdat, clmdat);
      FETCH c_cp INTO cont;
      CLOSE c_cp;

      IF p_first
      THEN
         IF NOT d AND NOT cont = 2
         THEN
            IF (p_begindatechr <> DAY)
            THEN
               IF TO_NUMBER (ldat) < TO_NUMBER (p_begindatechr)
               THEN
                  RESULT := (TO_DATE (ldat || '-' || mon || '-' || YEAR));
               ELSE
                  RESULT :=
                        TO_DATE (p_begindatechr || '-' || mon || '-' || YEAR);
               END IF;
            END IF;
         END IF;
      END IF;

      RETURN RESULT;
   END;

   FUNCTION get_annutydate (
      p_date       IN   DATE,
      p_char       IN   VARCHAR2,
      p_creditid   IN   INTEGER,
      FIRST        IN   BOOLEAN
   )
      RETURN DATE
   IS
      RESULT      DATE;

      CURSOR c_seldate (dat IN DATE)
      IS
         SELECT seldate
           FROM cm_seldates
          WHERE seldate = dat;

      sdate       c_seldate%ROWTYPE;
      checkdate   BOOLEAN             := TRUE;
   BEGIN
      RESULT := defdate (p_date, p_char, p_creditid, FIRST);

      IF cm_utils.check_endweek (RESULT)
      THEN
         RESULT := RESULT + 1;
      END IF;

      WHILE checkdate
      LOOP
         OPEN c_seldate (RESULT);
         FETCH c_seldate INTO sdate;
         checkdate := c_seldate%FOUND;
         CLOSE c_seldate;

         IF NOT checkdate
         THEN
            EXIT;
         END IF;

         RESULT := RESULT + 1;
      END LOOP;

      RETURN RESULT;
   END;

   PROCEDURE changeschedule (
      p_creditid   IN   INTEGER,
      p_date       IN   DATE,
      p_period     IN   INTEGER,
      p_rest       IN   NUMBER
   )
   IS
      creditrest   NUMBER;
      bclosedat    DATE;

      CURSOR c_portfinfo
      IS
         SELECT annualyinterestrate
           FROM cm_portfolio
          WHERE ID = p_creditid;

      portfinfo    c_portfinfo%ROWTYPE;
   BEGIN
      OPEN c_portfinfo;
      FETCH c_portfinfo INTO portfinfo;
      CLOSE c_portfinfo;

      DELETE      cm_payment_schedule
            WHERE creditid = p_creditid AND paymentdate > p_date;

      SELECT rest
        INTO creditrest
        FROM cm_curr_state
       WHERE creditid = p_creditid;

      cm_schedule.insertannutyschedule (p_creditid          => p_creditid,
                                        p_amount            => p_rest,
                                        p_rate              => portfinfo.annualyinterestrate,
                                        p_firstpaydate      => ADD_MONTHS (p_date,
                                                                           1
                                                                          ),
                                        p_startdate         => p_date,
                                        p_periods           => p_period,
                                        p_periodrate        => 1
                                       );

      UPDATE cm_payment_schedule
         SET rest = creditrest
       WHERE creditid = p_creditid AND paymentdate = p_date;

      COMMIT;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_SCHEDULE

