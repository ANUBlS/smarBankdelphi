/*
Update Baxan Triggerleri Sondur!
Account, Customers, Provarch
*/
--Begin Block 1--
UPDATE smart.customers tbl
   SET op_id = (SELECT smart.sb_aca.getidbyuser (obj)
                  FROM smart.sba_objinf
                 WHERE sysuserid = tbl.op_id);

COMMIT ;

UPDATE smart.ACCOUNT tbl
   SET op_id = (SELECT smart.sb_aca.getidbyuser (obj)
                  FROM smart.sba_objinf
                 WHERE sysuserid = tbl.op_id);

COMMIT ;
--End Block 1--
--Begin Block 2--
DECLARE
   CURSOR cp
   IS
      SELECT   dat
          FROM provarch
      GROUP BY dat
      ORDER BY dat;
BEGIN

   FOR nextp IN cp
   LOOP
      UPDATE smart.provarch tbl
         SET op_id = (SELECT smart.sb_aca.getidbyuser (obj)
                        FROM smart.sba_objinf
                       WHERE sysuserid = tbl.op_id)
       WHERE dat = nextp.dat;

      COMMIT;
   END LOOP;
END;
---
DECLARE
   CURSOR cp
   IS
      SELECT   dat
          FROM lazytransaction
      GROUP BY dat
      ORDER BY dat;
BEGIN

   FOR nextp IN cp
   LOOP
      UPDATE smart.lazytransaction tbl
         SET op_id = (SELECT smart.sb_aca.getidbyuser (obj)
                        FROM smart.sba_objinf
                       WHERE sysuserid = tbl.op_id)
       WHERE dat = nextp.dat;

      COMMIT;
   END LOOP;
END;
--End Block 2--
--Begin Block 3--

UPDATE smart.sbcm_contracts tbl
   SET sid# = (SELECT smart.sb_aca.getidbyuser (obj)
                 FROM smart.sba_objinf
                WHERE sysuserid = tbl.sid#);

COMMIT ;

UPDATE smart.paymentdecree tbl
   SET sid# = (SELECT smart.sb_aca.getidbyuser (obj)
                 FROM smart.sba_objinf
                WHERE sysuserid = tbl.sid#);

COMMIT ;

UPDATE smart.xs_batchs tbl
   SET userid = (SELECT smart.sb_aca.getidbyuser (obj)
                   FROM smart.sba_objinf
                  WHERE sysuserid = tbl.userid);

COMMIT ;
--End Block 3--
--Begin Block 4--
UPDATE smart.sba_groupmanager tbl
   SET userid = (SELECT smart.sb_aca.getidbyuser (obj)
                   FROM smart.sba_objinf
                  WHERE sysuserid = tbl.userid);

COMMIT ;

UPDATE smart.sba_userman tbl
   SET muser = (SELECT smart.sb_aca.getidbyuser (obj)
                  FROM smart.sba_objinf
                 WHERE sysuserid = tbl.muser);

COMMIT ;

UPDATE smart.sba_userman tbl
   SET suser = (SELECT smart.sb_aca.getidbyuser (obj)
                  FROM smart.sba_objinf
                 WHERE sysuserid = tbl.suser);
commit;
--End Block 4--
--Begin Block 5--
UPDATE creditsmgr.cm_portfolio tbl
   SET usid = (SELECT smart.sb_aca.getidbyuser (obj)
                 FROM smart.sba_objinf
                WHERE sysuserid = tbl.usid);

COMMIT ;

UPDATE creditsmgr.cm_visible_fields tbl
   SET userid = (SELECT smart.sb_aca.getidbyuser (obj)
                   FROM smart.sba_objinf
                  WHERE sysuserid = tbl.userid);

COMMIT ;

UPDATE creditsmgr.cm_adm_groupmanager tbl
   SET userid = (SELECT smart.sb_aca.getidbyuser (obj)
                   FROM smart.sba_objinf
                  WHERE sysuserid = tbl.userid);

COMMIT ;

UPDATE creditsmgr.cm_adm_usergrants tbl
   SET userid = (SELECT smart.sb_aca.getidbyuser (obj)
                   FROM smart.sba_objinf
                  WHERE sysuserid = tbl.userid);

COMMIT ;

--End Block 5--
--Begin Block 6--
EXECUTE IMMEDIATE 'CREATE TABLE oldsba_objinf_1 AS SELECT * FROM sba_objinf;';

UPDATE sba_objinf
   SET sysuserid = (SELECT id
                      FROM user$
                     WHERE NAME = obj)
 WHERE TYPE = 'U';

COMMIT ;
--End Block 6--
