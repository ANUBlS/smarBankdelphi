-- Start of DDL Script for Package Body SMART.WU_CONTROL
-- Generated 18-May-2004 14:43:42 from SMART@ata

CREATE OR REPLACE 
PACKAGE wu_control
IS
   PROCEDURE wu_incoming_delete (v_id INTEGER);

   PROCEDURE PrincipialTrans (v_trans INTEGER);

   PROCEDURE WU_Accounts_Add (
      V_ACCID         INTEGER,
      V_currency      INTEGER,
      V_TYPE          VARCHAR,
      V_ACCOUNTTYPE   INTEGER,
      V_branch        INTEGER
   );
  PROCEDURE SetTransaction (INCOMID INTEGER);
  PROCEDURE WU_incoming_ChangeStatus(v_id integer ,V_STATUS INTEGER);
  PROCEDURE ImportReportTable (StDate DATE, EndDate DATE);
  PROCEDURE ConvertFileToTable (Rowbody VARCHAR2, INCOMDATE# OUT  DATE);
END;
/

CREATE OR REPLACE 
PACKAGE BODY wu_control

IS
   PROCEDURE wu_incoming_delete (v_id INTEGER)
   IS
   BEGIN
      DELETE FROM wu_incoming
            WHERE id = v_id;

      COMMIT;
   END;

   FUNCTION GetFileIncomDate (FILENAME VARCHAR2)
      RETURN DATE
   IS
      RESULT   DATE;
   BEGIN
      RESULT := To_Date(FILENAME,'MMDDYY');
      RETURN RESULT; 
   END;

   PROCEDURE ConvertFileToTable (Rowbody VARCHAR2,  INCOMDATE# OUT DATE)
   IS
      SECTIONSYMBOL   CONSTANT VARCHAR2 (1)   := ';';
      SECTIONCOUNT             INTEGER;
      SECTIONPOSITION          INTEGER;
      SECTIONPOSITION_         INTEGER;
      DATA                     VARCHAR2 (100);
      V_KIND                   VARCHAR2 (2);
      V_BRANCH                 VARCHAR2 (10);
      V_incomdate              DATE;
      V_reference              VARCHAR2 (20);
      V_currency               NUMBER;
      V_PRINCIPIAL             NUMBER (15, 2);
      V_CHARGES                NUMBER (15, 2);
      V_Revenue                NUMBER (15, 2);
   BEGIN
      SECTIONCOUNT := 1;
      V_KIND := SUBSTR (ROWBODY, 1, 1);

      LOOP
         SECTIONPOSITION := INSTR (ROWBODY, SECTIONSYMBOL, 1, SECTIONCOUNT);
         EXIT WHEN SECTIONPOSITION = 0;
         SECTIONCOUNT :=   SECTIONCOUNT
                         + 1;
         SECTIONPOSITION_ := INSTR (ROWBODY, SECTIONSYMBOL, 1, SECTIONCOUNT);
         DATA := SUBSTR (
                    ROWBODY,
                      SECTIONPOSITION
                    + 1,
                      SECTIONPOSITION_
                    - (  SECTIONPOSITION
                       + 1
                      )
                 );

         IF SECTIONCOUNT = 2
         THEN
            V_BRANCH := DATA;
         ELSIF SECTIONCOUNT = 3
         THEN
            V_INCOMDATE := TO_DATE (DATA, 'MMDDYYYY');
         ELSIF SECTIONCOUNT = 4
         THEN
            V_REFERENCE := DATA;
         ELSIF SECTIONCOUNT = 5
         THEN
            SELECT VALUTE
              INTO V_CURRENCY
              FROM AVALUTE
             WHERE VAL_NAME = DATA;
         ELSIF SECTIONCOUNT = 6
         THEN
            V_PRINCIPIAL := TO_NUMBER (DATA);
         ELSIF SECTIONCOUNT = 7
         THEN
            V_CHARGES := TO_NUMBER (DATA);
         ELSIF SECTIONCOUNT = 8
         THEN
            V_REVENUE := TO_NUMBER (DATA);
         END IF;
      END LOOP;

      INSERT INTO WU_INCOMING
                  (KIND, BRANCH, INCOMDATE, REFERENCE, CURRENCY,
                   PRINCIPIAL, CHARGES, REVENUE, CONVERTDATE)
           VALUES (V_KIND, V_BRANCH, V_INCOMDATE, V_REFERENCE, V_CURRENCY,
                   V_PRINCIPIAL, V_CHARGES, V_REVENUE, SYSDATE);
      INCOMDATE# :=V_INCOMDATE; 
      COMMIT;
   END;

   PROCEDURE WU_Accounts_Add (
      V_ACCID         INTEGER,
      V_currency      INTEGER,
      V_TYPE          VARCHAR,
      V_ACCOUNTTYPE   INTEGER,
      V_branch        INTEGER
   )
   IS
      EXISTSCUR   INTEGER DEFAULT 0;
   BEGIN
      SELECT COUNT (CURRENCY)
        INTO EXISTSCUR
        FROM WU_ACCOUNTS
       WHERE CURRENCY = V_CURRENCY
         AND TYPE = V_TYPE
         AND ACCOUNTTYPE = V_ACCOUNTTYPE
         AND BRANCHID = V_BRANCH;

      IF EXISTSCUR > 0
      THEN
         UPDATE WU_ACCOUNTS
            SET ACCID = V_ACCID,
                CURRENCY = V_CURRENCY,
                TYPE = V_TYPE,
                ACCOUNTTYPE = V_ACCOUNTTYPE
          WHERE CURRENCY = V_CURRENCY
            AND TYPE = V_TYPE
            AND ACCOUNTTYPE = V_ACCOUNTTYPE
            AND BRANCHID = V_BRANCH;
      ELSE
         INSERT INTO WU_ACCOUNTS
                     (ACCID, CURRENCY, TYPE, ACCOUNTTYPE, BRANCHID)
              VALUES (V_ACCID, V_CURRENCY, V_TYPE, V_ACCOUNTTYPE, V_BRANCH);
      END IF;

      COMMIT;
   END;

   PROCEDURE PrincipialTrans (v_trans INTEGER)
   IS
   BEGIN
      UPDATE wu_config
         SET PRINCIPIALTRANS = v_trans;

      COMMIT;
   END;

   PROCEDURE SetTransaction (INCOMID INTEGER)
   IS
      TransactionID      INTEGER;
      v_debitID          INTEGER;
      v_creditID         INTEGER;
      v_debitID#         INTEGER;
      v_creditID#        INTEGER;
      v_Amount           NUMBER (15, 2);
      principialtrans#   INTEGER;

      CURSOR INCOM
      IS
         SELECT w.*, v.val_name AS valute, wb.BranchName, wb.BranchID
           FROM WU_Incoming w, avalute v, wu_branch wb
          WHERE w.currency = v.valute(+)
            AND w.branch = wb.symbol(+)
            AND ID = INCOMID;

      RINCOM             INCOM%ROWTYPE;
   BEGIN
      OPEN INCOM;
      FETCH INCOM INTO RINCOM;
      CLOSE INCOM;

      IF RINCOM.STATUS > 0
      THEN
         RETURN;
      END IF;

      SELECT PRINCIPIALTRANS
        INTO PRINCIPIALTRANS#
        FROM WU_CONFIG;

      SELECT ACCID
        INTO V_DEBITID
        FROM WU_ACCOUNTS
       WHERE BRANCHID = RINCOM.BRANCHID
         AND TYPE = 'D'
         AND ACCOUNTTYPE = 1
         AND CURRENCY = RINCOM.CURRENCY;

      SELECT ACCID
        INTO V_CREDITID
        FROM WU_ACCOUNTS
       WHERE BRANCHID = RINCOM.BRANCHID
         AND TYPE = 'C'
         AND ACCOUNTTYPE = 1
         AND CURRENCY = RINCOM.CURRENCY;

      TransactionID :=
            sb_transaction.transaction_add (
               debitid=> v_debitID,
               creditid=> v_creditID,
               debitamount=> NULL,
               creditamount=> RINCOM.REVENUE,
               lamount=> NULL,
               debitrate=> NULL,
               creditrate=> NULL,
               trname=>    'Western Union צחנÿ ‎ÿכטנ - '
                        || TO_CHAR (RINCOM.INCOMDATE, 'DD.MM.YYYY')
                        || ' - ('
                        || RINCOM.BRANCHNAME
                        || ')',
               flags => 0,
               -- inbalancechar => 0,
               -- outbalancechar => 0,
               -- transactionid => null,
               -- parentid => null,
               -- tempid => null
               parentid=> NULL,
               operationtype=> 17,
               transactiondate=> SBOP.GET_DATE
            );

      IF PRINCIPIALTRANS# = 1
      THEN
         SELECT ACCID
           INTO V_DEBITID#
           FROM WU_ACCOUNTS
          WHERE BRANCHID = RINCOM.BRANCHID
            AND TYPE = 'D'
            AND ACCOUNTTYPE = 0
            AND CURRENCY = RINCOM.CURRENCY;

         SELECT ACCID
           INTO V_CREDITID#
           FROM WU_ACCOUNTS
          WHERE BRANCHID = RINCOM.BRANCHID
            AND TYPE = 'C'
            AND ACCOUNTTYPE = 0
            AND CURRENCY = RINCOM.CURRENCY;

         TransactionID :=
               sb_transaction.transaction_add (
                  debitid=> v_debitID#,
                  creditid=> v_creditID#,
                  debitamount=> NULL,
                  creditamount=> RINCOM.PRINCIPIAL,
                  lamount=> NULL,
                  debitrate=> NULL,
                  creditrate=> NULL,
                  trname=>    'Western Union-ך‏קצנלÿסט - '
                           || RINCOM.BRANCHNAME,
                  flags => 0,
                  -- inbalancechar => 0,
                  -- outbalancechar => 0,
                  -- transactionid => null,
                  -- parentid => null,
                  -- tempid => null
                  parentid=> NULL,
                  operationtype=> 17,
                  transactiondate=> SBOP.GET_DATE
               );
      END IF;

      WU_incoming_ChangeStatus (RINCOM.ID, 1);
   EXCEPTION
      WHEN OTHERS
      THEN
         BEGIN
            ROLLBACK;
            RAISE;
         END;

         COMMIT;
   END;

   PROCEDURE WU_incoming_ChangeStatus (v_id INTEGER, V_STATUS INTEGER)
   IS
   BEGIN
      UPDATE WU_INCOMING
         SET STATUS = V_STATUS
       WHERE id = v_id;

      COMMIT;
   END;

   PROCEDURE ImportReportTable (StDate DATE, EndDate DATE)
   IS
      CURSOR C_INCOM (ABRANCH VARCHAR)
      IS
         SELECT w.*, v.val_name AS valute
           FROM WU_Incoming w, avalute v
          WHERE w.currency = v.valute(+)
            AND w.branch = Abranch
            AND INCOMDATE BETWEEN STDATE AND ENDDATE;

      CURSOR C_BRANCH
      IS
         SELECT   *
             FROM WU_BRANCH
         ORDER BY BRANCHID;

      R_INCOM     C_INCOM%ROWTYPE;
      R_BRANCH    C_BRANCH%ROWTYPE;
      InAmount    NUMBER (15, 2);
      OutAmount   NUMBER (15, 2);
      ACount      INTEGER;
      ANom        INTEGER            DEFAULT 0;
      ARevenue    NUMBER (15, 2);
      NAME        VARCHAR2 (50);
   BEGIN
      ANom := 0;

      DELETE FROM WU_REPORT;

      COMMIT;
      OPEN C_BRANCH; --open batchs

      LOOP
         FETCH C_BRANCH INTO R_BRANCH;
         ACount := 0;
         InAmount := 0;
         OutAmount := 0;
         ARevenue := 0;
         ANom :=   ANom
                 + 1;
         OPEN c_incom (R_BRANCH.symbol); --open incoming

         LOOP
            FETCH C_INCOM INTO R_INCOM;
            EXIT WHEN C_INCOM%NOTFOUND;

            IF R_Incom.Revenue > 0
            THEN
               ACount :=   ACount
                         + 1;
               ARevenue :=   ARevenue
                           + R_Incom.Revenue;
            END IF;

            IF R_Incom.KIND = 'P'
            THEN
               InAmount :=   InAmount
                           + R_Incom.Principial;
            ELSIF R_Incom.KIND = 'S'
            THEN
               OutAmount :=   OutAmount
                            + R_Incom.Principial;
            END IF;
         END LOOP;

         CLOSE c_incom; --close incoming
         --create temporary report table
         EXIT WHEN C_BRANCH%NOTFOUND;

         INSERT INTO WU_REPORT
                     (nom, branch, transcount, amount_i, amount_o,
                      revenue)
              VALUES (ANom, R_BRANCH.BRANCHNAME, ACOUNT, InAmount, OutAmount,
                      ARevenue);
      END LOOP;

      INSERT INTO WU_REPORT
         SELECT NULL AS NOM, 'ֶßָּ ' AS BRANCH, SUM (TRANSCOUNT) AS TRANSCOUNT,
                SUM (AMOUNT_I) AS AMOUNT_I, SUM (AMOUNT_O) AS AMOUNT_O,
                SUM (REVENUE) AS REVENUE
           FROM WU_REPORT;

      CLOSE C_BRANCH; --close batchs
      COMMIT;
   END;
END;
/


-- End of DDL Script for Package Body SMART.WU_CONTROL


