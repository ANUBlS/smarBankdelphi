-- Start of DDL Script for Package Body SMART.SB_ADM
-- Generated 3-Nov-2004 14:54:21 from SMART@sbdev

CREATE OR REPLACE 
PACKAGE sb_adm
/* *********************************************** */
/*        SmartBank Administration package         */
/*  Copyright 2003, Smart Systems Technoogy, Ltd.  */
/* *********************************************** */

IS
   -----------------------------User-Manipulating--------------------->>--
   PROCEDURE create_user (
      username    VARCHAR2,
      passw       VARCHAR2,
      iscreate    BOOLEAN DEFAULT TRUE,
      iscascade   BOOLEAN DEFAULT TRUE
   );

   FUNCTION user_passw (username VARCHAR2, passw VARCHAR2)
      RETURN BOOLEAN;

   PROCEDURE delete_user_inf (us VARCHAR2);

   PROCEDURE dropuseraction (username VARCHAR2);

   PROCEDURE clearclassforuser (us VARCHAR2);

   PROCEDURE dropgroupmanuser (usid VARCHAR2);

   PROCEDURE useradvacedgrantsbymodule (
      granted     BOOLEAN,
      vuser       VARCHAR2,
      vmoduleid   NUMBER
   );

   PROCEDURE useradvancedgrants (
      granted     BOOLEAN,
      vusername   VARCHAR2,
      grantid     NUMBER
   );

   PROCEDURE delete_advancedusergrants (us VARCHAR2);

   FUNCTION getusertablespaceid (user_name VARCHAR2)
      RETURN NUMBER;

   PROCEDURE grantprivtorole (
      gprole      VARCHAR2,
      gpaction    VARCHAR2,
      gpobject    VARCHAR2,
      gpowner     VARCHAR2,
      gpisgrant   BOOLEAN DEFAULT TRUE
   );

   PROCEDURE revokeprivsfromtorole (gprole VARCHAR2, gpowner VARCHAR2);

   PROCEDURE create_synonyms (
      obj        VARCHAR2,
      sowner     VARCHAR2,
      suser      VARCHAR2,
      iscreate   BOOLEAN DEFAULT TRUE
   );

   PROCEDURE create_allsynonyms (
      sowner     VARCHAR2,
      suser      VARCHAR2,
      iscreate   BOOLEAN DEFAULT TRUE
   );

   FUNCTION getobjid (cobj VARCHAR2, otype CHAR)
      RETURN NUMBER;

   FUNCTION lockuser (username VARCHAR2, islock BOOLEAN)
      RETURN BOOLEAN;

   
--<<--------------------------User-Install--------------------------------

--**************************************************************************--     

--------------------------------User-Access------------------------------>>--

   FUNCTION grrole (
      modnam   VARCHAR2,
      gruser   VARCHAR2,
      isset    BOOLEAN DEFAULT TRUE
   )
      RETURN BOOLEAN;

   FUNCTION modacc (
      modnam   VARCHAR2,
      mduser   VARCHAR2,
      isset    BOOLEAN DEFAULT TRUE
   )
      RETURN BOOLEAN;

   PROCEDURE setadvancedgrants (
      module    VARCHAR2,
      aduser    VARCHAR2,
      insert_   INTEGER,
      delete_   INTEGER,
      update_   INTEGER
   );

   
--<<----------------------------User-Access--------------------------------

--**************************************************************************--  

   -----------------------------Class-Manipulating--------------------->>--

   PROCEDURE createclass (CLASS VARCHAR2, classdescripion VARCHAR2);

   PROCEDURE dropclass (CLASS VARCHAR2);

   PROCEDURE updateclass (clid INTEGER, newclass VARCHAR2, newdescr VARCHAR2);

   PROCEDURE updateclassgrants (
      clid         INTEGER,
      clmod        VARCHAR2,
      isaccessed   BOOLEAN
   );

   PROCEDURE grantclass (
      username      VARCHAR2,
      classname     VARCHAR2,
      deloldgrant   BOOLEAN DEFAULT TRUE
   );

   PROCEDURE updateallusersbyclass (clid INTEGER);

   PROCEDURE updateuserbyclass (clid INTEGER, us VARCHAR2);

   FUNCTION checkclassgrant (clid INTEGER, clmod VARCHAR2)
      RETURN BOOLEAN;

   --<<-------------------------Class-Manipulating-----------------------

--**************************************************************************--   

   -----------------------------Group-Manipulating--------------------->>--
   PROCEDURE refreshgroup (grid INTEGER);

   PROCEDURE creategroup (
      gobj    VARCHAR2,
      descr   VARCHAR2,
      type#   INTEGER DEFAULT 0
   );

   PROCEDURE dropgroup (gobj VARCHAR2);

   PROCEDURE updategroup (grid INTEGER, gobj VARCHAR2, descr VARCHAR2);

   PROCEDURE adduseringrup (us INTEGER, tp INTEGER, grid INTEGER);

   PROCEDURE dropuseringrup (us INTEGER, grid INTEGER);

   PROCEDURE cleargroupman (grid INTEGER);

   FUNCTION checkforadduseringroup (
      USER       INTEGER,
      groupid    INTEGER,
      usertype   INTEGER DEFAULT 0
   )
      RETURN BOOLEAN;

   
--<<---------------------------Group-Manipulating-------------------------
--**************************************************************************--   

   -----------------------------Module-Manipulating--------------------->>--
   PROCEDURE deletemodule (moduleid INTEGER);

   PROCEDURE addmodule (
      passw     VARCHAR2,
      classid   VARCHAR2,
      descr     VARCHAR2,
      trvdeck   VARCHAR2,
      can_ins   INTEGER,
      can_del   INTEGER,
      can_upd   INTEGER
   );

   PROCEDURE updatemodule (
      modnam        VARCHAR2,
      vclassid      VARCHAR2,
      vtrvdesc      VARCHAR2,
      vcan_insert   VARCHAR2,
      vcan_delete   VARCHAR2,
      vcan_update   VARCHAR2
   );

   
--<<---------------------------Module-Manipulating-----------------------
--**************************************************************************--  
------------------------------------Utils---------------------------->>--
   PROCEDURE roleslistcreate (
      creat    BOOLEAN DEFAULT TRUE,
      passw    VARCHAR2 DEFAULT NULL,
      action   VARCHAR2 := NULL
   );

   PROCEDURE insertuserinf (
      objc           VARCHAR2,
      descriptionc   VARCHAR2,
      fullnamec      VARCHAR2,
      phonec         VARCHAR2,
      classc         VARCHAR2,
      filid          VARCHAR2
   );

   PROCEDURE dropallsynonims (sowner IN VARCHAR2, suser IN VARCHAR2);

   PROCEDURE createrolesalllist (
      filloc   BOOLEAN := FALSE,
      dir      VARCHAR2 := '',
      NAME     VARCHAR2 := ''
   );

   FUNCTION chekforobject (sowner VARCHAR2, objectname VARCHAR2)
      RETURN BOOLEAN;

   FUNCTION isadmin (userid INTEGER DEFAULT UID)
      RETURN BOOLEAN;

   FUNCTION changeownerincustomers (owner INTEGER, newowner INTEGER)
      RETURN BOOLEAN;

   FUNCTION changeownerinaccount (owner INTEGER, newowner INTEGER)
      RETURN BOOLEAN;

   FUNCTION changeownerintransaction (owner INTEGER, newowner INTEGER)
      RETURN BOOLEAN;

   FUNCTION changeownerincontracts (owner INTEGER, newowner INTEGER)
      RETURN BOOLEAN;

   
--<<------------------------------OwnerSheep----------------------------   

   PROCEDURE triggerinterface (
      shemaowner    VARCHAR2,
      tablename     VARCHAR2,
      isenable      BOOLEAN,
      incinterval   INTEGER DEFAULT 1
   );
END;
/


CREATE OR REPLACE 
PACKAGE BODY sb_adm
/* *********************************************** */
/*        SmartBank Administration package         */
/*  Copyright 2003, Smart Systems Technoogy, Ltd.  */
/* *********************************************** */
IS
   crlf            CONSTANT VARCHAR2 (2)  := '
';
   dcrlf           CONSTANT VARCHAR2 (8)  :=    crlf
                                             || crlf;
   dil             CONSTANT VARCHAR2 (30) := '--**********************';
   prob            CONSTANT VARCHAR2 (30) := '                     ';
   dot             CONSTANT VARCHAR (2)   := '.';
   del             CONSTANT VARCHAR (2)   := ';';
   gr              CONSTANT VARCHAR2 (8)  := 'Grant ';
   rv              CONSTANT VARCHAR2 (16) := 'Revoke ';
   grstate         CONSTANT VARCHAR2 (8)  := ' TO ';
   rvstate         CONSTANT VARCHAR2 (8)  := ' FROM ';
   crcrole         CONSTANT VARCHAR2 (24) := 'Create role ';
   drcrole         CONSTANT VARCHAR2 (24) := 'drop role ';
   psrole          CONSTANT VARCHAR2 (24) := ' identified by ';
   def             CONSTANT VARCHAR2 (64)
            := ' default tablespace smartbank temporary tablespace temp';
   chnpassw        CONSTANT VARCHAR2 (12) := 'alter user ';
   mtype           CONSTANT INTEGER       := 1;
   stype           CONSTANT INTEGER       := 2;
   ntype           CONSTANT INTEGER       := 3;
   drsyn           CONSTANT VARCHAR2 (64) := 'DROP SYNONYM %own.%syn';
   lockuserconst   CONSTANT VARCHAR (64)  := 'ALTER USER %usname ACCOUNT %lock';

   FUNCTION runsql (QUERY VARCHAR2, run BOOLEAN DEFAULT TRUE)
      RETURN BOOLEAN
   AS
      result    BOOLEAN;
      curhand   INTEGER;
      tmp       INTEGER;
   BEGIN
      IF run
      THEN
         BEGIN
            EXECUTE IMMEDIATE QUERY;
            RETURN TRUE;
         --curhand := DBMS_SQL.open_cursor ();
         --DBMS_SQL.parse (curhand, QUERY, DBMS_SQL.native);
         --tmp := DBMS_SQL.EXECUTE (curhand);
         -- DBMS_SQL.close_cursor (curhand);
         EXCEPTION
            WHEN OTHERS
            THEN
               -- DBMS_SQL.close_cursor (curhand);
               raise_application_error (
                  sbdecls.error_invalidparameters,
                     'Error on query.Query: '
                  || QUERY
                  || ', Error code: '
                  || TO_CHAR (SQLCODE)
                  || ', Error message: '
                  || SQLERRM
               );
               RETURN FALSE;
         END;
      ELSE
         RETURN FALSE;
      END IF;
   END;

   FUNCTION chekforobject (sowner VARCHAR2, objectname VARCHAR2)
      RETURN BOOLEAN
   IS
      rec   all_objects%ROWTYPE;
   BEGIN
      SELECT *
        INTO rec
        FROM all_objects
       WHERE owner = UPPER (sowner)
         AND object_name = UPPER (objectname)
         AND object_type <> 'SYNONYM';

      RETURN TRUE;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN FALSE;
      WHEN OTHERS
      THEN
         RETURN TRUE;
   END;

   FUNCTION grrole (modnam VARCHAR2, gruser VARCHAR2, isset BOOLEAN
            DEFAULT TRUE)
      RETURN BOOLEAN
   IS
      act      VARCHAR2 (40);
      fstate   VARCHAR2 (20);
      sstate   VARCHAR2 (20);
      rsql     BOOLEAN;
   BEGIN
      act :=    'SBR_'
             || modnam;

      IF isset
      THEN
         BEGIN
            fstate := gr;
            sstate := grstate;
            rsql := NOT (sb_aca.checkmodaccess (modnam, gruser, FALSE));
         END;
      ELSE
         BEGIN
            fstate := rv;
            sstate := rvstate;
            rsql := sb_aca.checkmodaccess (modnam, gruser, FALSE);
         END;
      END IF;

      RETURN runsql (
                   fstate
                || UPPER (act)
                || sstate
                || UPPER (gruser),
                rsql AND NOT (sb_aca.isadm (gruser))
             );
   END;

   FUNCTION modacc (modnam VARCHAR2, mduser VARCHAR2, isset BOOLEAN
            DEFAULT TRUE)
      RETURN BOOLEAN
   IS
   BEGIN
      ---Dobavit udaleniye prav
      RETURN grrole (REPLACE (modnam, ' '), mduser, isset);
   END;

   FUNCTION actionfun (VALUE IN VARCHAR2 := NULL)
      RETURN VARCHAR2
   IS
   BEGIN
      IF NOT (VALUE IS NULL)
      THEN
         RETURN    '_'
                || VALUE;
      ELSE
         RETURN NULL;
      END IF;
   END actionfun;

   PROCEDURE roleslistcreate (
      creat    BOOLEAN,
      passw    VARCHAR2,
      action   VARCHAR2 := NULL
   )
   IS
      qr     VARCHAR2 (128);
      tmp    VARCHAR2 (96);
      pas    VARCHAR2 (128)   := NULL;
      tpbl   BOOLEAN;

      CURSOR c_mods
      IS
         (SELECT *
            FROM modules);

      rec    c_mods%ROWTYPE;
   BEGIN
      IF NOT (passw IS NULL)
      THEN
         pas :=    psrole
                || passw;
      END IF;

      OPEN c_mods;

      LOOP
         FETCH c_mods INTO rec;
         tmp := UPPER (
                      'SBR_'
                   || REPLACE (rec.description, ' ')
                   || actionfun (action)
                );

         IF creat
         THEN
            qr :=    crcrole
                  || tmp
                  || pas;
            tpbl := runsql (UPPER (qr), NOT (sb_aca.checkrole (tmp)));
         ELSE
            qr :=    drcrole
                  || tmp;
            tpbl := runsql (UPPER (qr), sb_aca.checkrole (tmp));
         END IF;

         EXIT WHEN c_mods%NOTFOUND;
      END LOOP;

      CLOSE c_mods;
   END;

   FUNCTION synreplace (objname IN OUT VARCHAR2, own VARCHAR2)
      RETURN BOOLEAN
   IS
      res      BOOLEAN;
      tmpobj   sba_synreplace.repobject%TYPE;
      rectmp   sba_synreplace%ROWTYPE;
   BEGIN
      BEGIN
         SELECT *
           INTO rectmp
           FROM sba_synreplace
          WHERE repobject = objname;

         RETURN FALSE;
      EXCEPTION
         WHEN OTHERS
         THEN
            res := TRUE;
      END;

      SELECT repobject
        INTO tmpobj
        FROM sba_synreplace
       WHERE target = objname;

      SELECT object_name
        INTO tmpobj
        FROM sys.all_objects
       WHERE object_name = tmpobj AND owner = UPPER (own);

      objname := tmpobj;
      RETURN TRUE;
   EXCEPTION
      WHEN OTHERS
      THEN
         tmpobj := NULL;
         RETURN TRUE;
   END;

   FUNCTION notcreatesynforrep (objc VARCHAR2)
      RETURN BOOLEAN
   IS
      rectmp   sba_synreplace%ROWTYPE;
   BEGIN
      SELECT *
        INTO rectmp
        FROM sba_synreplace
       WHERE repobject = objc;

      RETURN FALSE;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN TRUE;
   END;

   
--must create with obj some of 'TABLE','VIEW','PACKAGE','FUNCTION' ,'SYNONYM' or 'PROCEDURE'  
   PROCEDURE create_synonyms (
      obj        VARCHAR2,
      sowner     VARCHAR2,
      suser      VARCHAR2,
      iscreate   BOOLEAN
   )
   IS
      QUERY      VARCHAR2 (256)                  := NULL;
      tpbl       BOOLEAN;
      objname    VARCHAR2 (256);
      boll       BOOLEAN;
      tmpobj     sba_synreplace.repobject%TYPE;
      tempbool   BOOLEAN;

      CURSOR c_obj
      IS
         SELECT *
           FROM sys.all_objects
          WHERE (object_type = UPPER (obj))
            AND (owner = UPPER (sowner))
            AND object_name NOT IN (SELECT objectname
                                      FROM sba_syndec);

      CURSOR c_syrep
      IS
         SELECT *
           FROM sba_synreplace;
   BEGIN
      FOR objrec IN c_obj
      LOOP
         IF iscreate
         THEN
            QUERY := 'Create synonym ';
         ELSE
            QUERY := 'Drop synonym ';
         END IF;

         objname := objrec.object_name;
         tempbool := chekforobject (UPPER (suser), UPPER (objname));
         QUERY :=    QUERY
                  || suser
                  || dot
                  || objname;
         boll := TRUE;

         FOR reprec IN c_syrep
         LOOP
            IF reprec.repobject = objname
            THEN
               boll := FALSE;
            END IF;

            IF reprec.target = objname
            THEN
               objname := reprec.repobject;
               boll := TRUE;
            END IF;
         END LOOP;

         IF iscreate
         THEN
            QUERY :=    QUERY
                     || ' for '
                     || sowner
                     || dot
                     || objname;
         END IF;

         QUERY := UPPER (QUERY);

         IF NOT (tempbool)
         THEN
            tpbl :=
                  runsql (
                     QUERY,
                            (iscreate AND boll)
                        AND (    iscreate
                             AND NOT (sb_aca.checkforsynonym (suser, objname))
                            )
                     OR (    NOT (iscreate)
                         AND sb_aca.checkforsynonym (suser, objname)
                        )
                  );
         END IF;
      END LOOP;
   END;

   --creating synonyms for all objects in sowner schema  
   PROCEDURE create_allsynonyms (
      sowner     VARCHAR2,
      suser      VARCHAR2,
      iscreate   BOOLEAN DEFAULT TRUE
   )
   IS
   BEGIN
      create_synonyms ('TABLE', sowner, suser, iscreate);
      create_synonyms ('VIEW', sowner, suser, iscreate);
      create_synonyms ('PACKAGE', sowner, suser, iscreate);
      create_synonyms ('PROCEDURE', sowner, suser, iscreate);
      create_synonyms ('FUNCTION', sowner, suser, iscreate);
      create_synonyms ('SYNONYM', sowner, suser, iscreate);
   END;

   PROCEDURE create_user (
      username    VARCHAR2,
      passw       VARCHAR2,
      iscreate    BOOLEAN DEFAULT TRUE,
      iscascade   BOOLEAN DEFAULT TRUE
   )
   IS
      usstr   VARCHAR2 (256);
      tpbl    BOOLEAN;
   BEGIN
      IF iscreate
      THEN
         usstr :=
                 'create user '
              || username
              || ' identified by '
              || passw
              || def;
      ELSE
         usstr :=    'drop user '
                  || username;
         dropuseraction (username);

         IF iscascade
         THEN
            usstr :=    usstr
                     || ' cascade';
            dropuseraction (username);
            delete_user_inf (username);
            dropgroupmanuser (sb_aca.getidbyuser (username));
            delete_advancedusergrants (username);
         END IF;
      END IF;

      tpbl := runsql (usstr);

      IF iscreate
      THEN
         EXECUTE IMMEDIATE    'grant UNLIMITED TABLESPACE to '
                           || UPPER (username);
      END IF;
   END;

   FUNCTION user_passw (username VARCHAR2, passw VARCHAR2)
      RETURN BOOLEAN
   IS
   BEGIN
      IF sb_aca.checkforuser (UPPER (username))
      THEN
         RETURN runsql (
                      chnpassw
                   || UPPER (username)
                   || psrole
                   || passw,
                   TRUE
                );
      ELSE
         raise_application_error (-20280,    'User '
                                          || username
                                          || ' not exist');
      END IF;
   END;

   PROCEDURE dropallsynonims (sowner IN VARCHAR2, suser IN VARCHAR2)
   IS
      tempsyn   VARCHAR2 (162);
      dummy     BOOLEAN;

      CURSOR c_synom
      IS
         SELECT *
           FROM dba_synonyms
          WHERE owner = UPPER (suser) AND table_owner = UPPER (sowner);
   BEGIN
      FOR rec IN c_synom
      LOOP
         tempsyn := drsyn;
         dummy := runsql (
                     REPLACE (
                        REPLACE (tempsyn, '%own', UPPER (suser)),
                        '%syn',
                        rec.synonym_name
                     )
                  );
      END LOOP;
   END;

   FUNCTION getobjid (cobj VARCHAR2, otype CHAR)
      RETURN NUMBER
   IS
      cid   NUMBER;
   BEGIN
      SELECT id
        INTO cid
        FROM sba_objinf
       WHERE obj = cobj AND TYPE = otype;

      RETURN cid;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN NULL;
   END;

   PROCEDURE insertuserinf (
      objc           VARCHAR2,
      descriptionc   VARCHAR2,
      fullnamec      VARCHAR2,
      phonec         VARCHAR2,
      classc         VARCHAR2,
      filid          VARCHAR2
   )
   IS
      cid   NUMBER;
      fid   NUMBER;
   BEGIN
      cid := getobjid (classc, 'C');
      fid := TO_NUMBER (filid);

      IF NOT (sb_aca.checkclass (objc, 'U'))
      THEN
         INSERT INTO sba_objinf
                     (TYPE, obj, description, fullname,
                      phone, classid, filialid)
              VALUES ('U', UPPER (objc), descriptionc, fullnamec,
                      REPLACE (REPLACE (phonec, '-'), '_'), cid, fid);

         COMMIT;
      ELSE
         UPDATE sba_objinf
            SET description = descriptionc,
                fullname = fullnamec,
                phone = REPLACE (REPLACE (phonec, '-'), '_'),
                classid = cid,
                filialid = fid
          WHERE obj = UPPER (objc) AND TYPE = 'U';

         COMMIT;
      END IF;
   END;

   PROCEDURE delete_user_inf (us VARCHAR2)
   IS
   BEGIN
      DELETE FROM sba_objinf
            WHERE obj = us;

      COMMIT;
   END;

   PROCEDURE delete_advancedusergrants (us VARCHAR2)
   IS
   BEGIN
      DELETE FROM sba_usergrants_advanced
            WHERE UPPER (username) = UPPER (us);
   END;

   PROCEDURE useradvancedgrants (
      granted     BOOLEAN,
      vusername   VARCHAR2,
      grantid     NUMBER
   )
   IS
      find   BOOLEAN;
      rec    sba_usergrants_advanced%ROWTYPE;
   BEGIN
      BEGIN
         SELECT *
           INTO rec
           FROM sba_usergrants_advanced
          WHERE username = UPPER (vusername) AND advancedgrantid = grantid;

         find := TRUE;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            find := FALSE;
      END;

      IF  (granted) AND NOT (find)
      THEN
         INSERT INTO sba_usergrants_advanced
              VALUES (UPPER (vusername), grantid);
      END IF;

      IF (NOT (granted) AND find)
      THEN
         DELETE FROM sba_usergrants_advanced
               WHERE username = UPPER (vusername)
                 AND advancedgrantid = grantid;
      END IF;

      COMMIT;
   END;

   PROCEDURE useradvacedgrantsbymodule (
      granted     BOOLEAN,
      vuser       VARCHAR2,
      vmoduleid   NUMBER
   )
   IS
      CURSOR cadvgrants
      IS
         SELECT id
           FROM sba_advanced_grants
          WHERE moduleid = vmoduleid;
   BEGIN
      FOR rec IN cadvgrants
      LOOP
         useradvancedgrants (granted, vuser, rec.id);
      END LOOP;
   END;

   PROCEDURE clearclassforuser (us VARCHAR2)
   IS
   BEGIN
      UPDATE sba_objinf
         SET classid = NULL
       WHERE UPPER (obj) = UPPER (us);

      COMMIT;
   END;

   PROCEDURE setadvancedgrants (
      module    VARCHAR2,
      aduser    VARCHAR2,
      insert_   INTEGER,
      delete_   INTEGER,
      update_   INTEGER
   )
   IS
      notnulset   BOOLEAN;
      tpinsert    INTEGER;
      tpdelete    INTEGER;
      tpupdate    INTEGER;
   BEGIN
      tpinsert := insert_;
      tpdelete := delete_;
      tpupdate := update_;

      DECLARE
         obrec   modules%ROWTYPE;
      BEGIN
         SELECT *
           INTO obrec
           FROM modules
          WHERE description = module;

         IF obrec.can_insert = 0
         THEN
            tpinsert := 0;
         END IF;

         IF obrec.can_delete = 0
         THEN
            tpdelete := 0;
         END IF;

         IF obrec.can_update = 0
         THEN
            tpupdate := 0;
         END IF;
      EXCEPTION
         WHEN OTHERS
         THEN
            obrec.can_insert := 0;
      END;

      notnulset :=    (tpinsert != 0)
                   OR (tpupdate != 0)
                   OR (tpdelete != 0);

      IF notnulset
      THEN
         UPDATE sba_usergrants
            SET can_insert = tpinsert,
                can_delete = tpdelete,
                can_update = tpupdate
          WHERE cur_user = UPPER (aduser)
            AND cur_module = UPPER (REPLACE (module, ' '));
      ELSE
         DELETE FROM sba_usergrants
               WHERE cur_user = UPPER (aduser)
                 AND cur_module = UPPER (REPLACE (module, ' '));
      END IF;

      COMMIT;

      IF SQL%ROWCOUNT = 0
      THEN
         IF notnulset
         THEN
            INSERT INTO sba_usergrants
                        (cur_user, cur_module,
                         can_insert, can_update, can_delete)
                 VALUES (UPPER (aduser), UPPER (REPLACE (module, ' ')),
                         tpinsert, tpupdate, tpdelete);

            COMMIT;
         END IF;
      END IF;
   END;

   PROCEDURE dropuseraction (username VARCHAR2)
   IS
   BEGIN
      DELETE FROM sba_usergrants
            WHERE cur_user = UPPER (username);
   END;

   -----------------------------ClassManipulating----------------------->>--   

   PROCEDURE createclass (CLASS VARCHAR2, classdescripion VARCHAR2)
   IS
   BEGIN
      IF NOT (sb_aca.checkclass (CLASS))
      THEN
         INSERT INTO sba_objinf
                     (TYPE, obj, description)
              VALUES ('C', REPLACE (CLASS, ' '), classdescripion);

         COMMIT;
      END IF;
   END;

   PROCEDURE dropclass (CLASS VARCHAR2)
   IS
      clid   INTEGER;
   BEGIN
      IF sb_aca.checkclass (CLASS)
      THEN
         SELECT id
           INTO clid
           FROM sba_objinf
          WHERE UPPER (TYPE) = 'C' AND obj = CLASS;

         DELETE FROM sba_objinf
               WHERE UPPER (TYPE) = 'C' AND obj = CLASS;

         UPDATE sba_objinf
            SET classid = NULL
          WHERE TYPE = 'U' AND classid = clid;

         COMMIT;
      END IF;
   END;

   PROCEDURE updateclass (clid INTEGER, newclass VARCHAR2, newdescr VARCHAR2)
   IS
   BEGIN
      UPDATE sba_objinf
         SET obj = REPLACE (newclass, ' '),
             description = newdescr
       WHERE id = clid;

      COMMIT;
   END;

   FUNCTION checkclassgrant (clid INTEGER, clmod VARCHAR2)
      RETURN BOOLEAN
   IS
      rec   sba_objmanager%ROWTYPE;
   BEGIN
      SELECT *
        INTO rec
        FROM sba_objmanager
       WHERE id = clid AND OBJECT = clmod;

      RETURN TRUE;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN FALSE;
   END;

   PROCEDURE updateclassgrants (clid INTEGER, clmod VARCHAR2, isaccessed BOOLEAN)
   IS
   BEGIN
      IF isaccessed
      THEN
         IF NOT (checkclassgrant (clid, clmod))
         THEN
            INSERT INTO sba_objmanager
                        (id, OBJECT)
                 VALUES (clid, clmod);

            COMMIT;
         END IF;
      ELSE
         DELETE FROM sba_objmanager
               WHERE id = clid AND OBJECT = clmod;

         COMMIT;
      END IF;
   END;

   PROCEDURE grantclass (
      username      VARCHAR2,
      classname     VARCHAR2,
      deloldgrant   BOOLEAN DEFAULT TRUE
   )
   IS
      tpbl   BOOLEAN;

      CURSOR c_clgr
      IS
         (SELECT *
            FROM sba_objmanager
           WHERE id = (SELECT id
                         FROM sba_objinf
                        WHERE UPPER (TYPE) = 'C' AND obj = classname));
   BEGIN
      IF sb_aca.checkclass (classname)
      THEN
         FOR rec IN c_clgr
         LOOP
            tpbl := grrole (rec.OBJECT, username, TRUE);
            setadvancedgrants (rec.OBJECT, username, 1, 1, 1);
         END LOOP;
      END IF;
   END;

   PROCEDURE updateuserbyclass (clid INTEGER, us VARCHAR2)
   IS
      rol    VARCHAR2 (256);
      tpbl   BOOLEAN;

      CURSOR c_dbar
      IS
         (SELECT UPPER (REPLACE (description, ' ')) AS mods
            FROM modules);
   BEGIN
      FOR rec IN c_dbar
      LOOP
         IF checkclassgrant (clid, rec.mods)
         THEN
            tpbl := modacc (rec.mods, us, TRUE);
            setadvancedgrants (rec.mods, UPPER (us), 1, 1, 1);
         ELSE
            tpbl := modacc (rec.mods, us, FALSE);
            setadvancedgrants (rec.mods, UPPER (us), 0, 0, 0);
         END IF;
      END LOOP;
   END;

   PROCEDURE updateallusersbyclass (clid INTEGER)
   IS
      CURSOR c_objinf
      IS
         SELECT *
           FROM sba_objinf
          WHERE TYPE = 'U' AND classid = clid;
   BEGIN
      FOR rec IN c_objinf
      LOOP
         updateuserbyclass (clid, rec.obj);
      END LOOP;
   END;

   
--<<---------------------------ClassManipulating-------------------------


   -----------------------------GroupManipulating--------------------->>--
   FUNCTION checkuserman (musr INTEGER, susr INTEGER, gr INTEGER)
      RETURN BOOLEAN
   IS
      rec   sba_userman%ROWTYPE;
   BEGIN
      SELECT *
        INTO rec
        FROM sba_userman
       WHERE muser = musr AND suser = susr AND ugrup = gr;

      RETURN TRUE;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN FALSE;
   END;

   FUNCTION checkforadduseringroup (
      USER       INTEGER,
      groupid    INTEGER,
      usertype   INTEGER DEFAULT 0
   )
      RETURN BOOLEAN
   IS
      grouptype   NUMBER;
      rec         sba_groupmanager%ROWTYPE;
   BEGIN
      IF usertype = ntype
      THEN
         RETURN TRUE;
      END IF;

      BEGIN
         SELECT DECODE (advtype, NULL, 0, advtype) AS advtype
           INTO grouptype
           FROM sba_objinf
          WHERE id = groupid;
      EXCEPTION
         WHEN OTHERS
         THEN
            grouptype := 0;
      END;

      BEGIN
         IF grouptype = 0
         THEN
            SELECT *
              INTO rec
              FROM sba_groupmanager
             WHERE userid = USER
               AND TYPE <> ntype
               AND groupid IN (SELECT id
                                 FROM sba_objinf
                                WHERE TYPE = 'G' AND advtype <> 0);
         ELSE
            SELECT *
              INTO rec
              FROM sba_groupmanager
             WHERE userid = USER
               AND TYPE <> ntype
               AND groupid IN (SELECT id
                                 FROM sba_objinf
                                WHERE TYPE = 'G' AND advtype = 0);
         END IF;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            RETURN TRUE;
         WHEN TOO_MANY_ROWS
         THEN
            RETURN FALSE;
      END;

      RETURN FALSE;
   END;

   FUNCTION checkgroupmanager (us INTEGER, tp INTEGER, grid INTEGER)
      RETURN BOOLEAN
   IS
      rec   sba_groupmanager%ROWTYPE;
   BEGIN
      SELECT *
        INTO rec
        FROM sba_groupmanager
       WHERE userid = us AND groupid = grid AND TYPE = tp;

      RETURN TRUE;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN FALSE;
   END;

   FUNCTION isadmin (userid INTEGER DEFAULT UID)
      RETURN BOOLEAN
   IS
      adusername   VARCHAR2 (256);
      result       BOOLEAN;
   BEGIN
      SELECT NAME
        INTO adusername
        FROM user$
       WHERE id = userid;

      result := sb_aca.isadm (adusername);
      RETURN result;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN FALSE;
   END;

   PROCEDURE insertsba_userman (
      mus      INTEGER,
      sus      INTEGER,
      gr       INTEGER,
      grtype   INTEGER
   )
   IS
   BEGIN
      IF  NOT (checkuserman (mus, sus, gr)) AND NOT (isadmin (mus))
      THEN
         INSERT INTO sba_userman
                     (muser, suser, ugrup, type#)
              VALUES (mus, sus, gr, grtype);
      END IF;
   END;

   PROCEDURE refreshuseringroup (
      us       INTEGER,
      tp       INTEGER,
      grpid    INTEGER,
      grtype   INTEGER
   )
   IS
      CURSOR c_us
      IS
         (SELECT *
            FROM sba_groupmanager
           WHERE groupid = grpid);
   BEGIN
      FOR rec IN c_us
      LOOP
         IF    (tp = mtype)
            OR (tp = stype AND rec.userid = us)
         THEN
            insertsba_userman (us, rec.userid, grpid, grtype);
         END IF;
      END LOOP;

      COMMIT;
   END;

   PROCEDURE refreshgroup (grid INTEGER)
   IS
      grouptype   NUMBER;

      CURSOR c_us_groups
      IS
         (SELECT *
            FROM sba_groupmanager
           WHERE groupid = grid);
   BEGIN
      BEGIN
         DELETE FROM sba_userman
               WHERE ugrup = grid;

         COMMIT;
      EXCEPTION
         WHEN OTHERS
         THEN
            ROLLBACK;
      END;

      BEGIN
         SELECT DECODE (advtype, NULL, 0, advtype) AS advtype
           INTO grouptype
           FROM sba_objinf
          WHERE id = grid;
      EXCEPTION
         WHEN OTHERS
         THEN
            grouptype := 0;
      END;

      FOR rec IN c_us_groups
      LOOP
         refreshuseringroup (rec.userid, rec.TYPE, grid, grouptype);
      END LOOP;
   END;

   PROCEDURE adduseringrup (us INTEGER, tp INTEGER, grid INTEGER)
   IS
   BEGIN
      IF      NOT (checkgroupmanager (us, tp, grid))
          AND checkforadduseringroup (us, grid, tp)
          AND NOT (isadmin (us) AND tp <> ntype)
      THEN
         INSERT INTO sba_groupmanager
                     (userid, groupid, TYPE)
              VALUES (us, grid, tp);

         COMMIT;
      END IF;
   END;

   PROCEDURE dropuseringrup (us INTEGER, grid INTEGER)
   IS
   BEGIN
      DELETE FROM sba_groupmanager
            WHERE userid = us AND groupid = grid;

      COMMIT;
   --  refreshgroup (grid);
   END;

   PROCEDURE cleargroupman (grid INTEGER)
   IS
   BEGIN
      DELETE FROM sba_groupmanager
            WHERE groupid = grid;

      COMMIT;
   END;

   PROCEDURE dropgroupmanuser (usid VARCHAR2)
   IS
   BEGIN
      DELETE FROM sba_groupmanager
            WHERE userid = usid;

      DELETE FROM sba_userman
            WHERE muser = usid
               OR suser = usid;

      COMMIT;
   END;

   PROCEDURE creategroup (gobj VARCHAR2, descr VARCHAR2, type# INTEGER
            DEFAULT 0)
   IS
   BEGIN
      IF NOT (sb_aca.checkgroup (gobj))
      THEN
         INSERT INTO sba_objinf
                     (TYPE, obj, description, advtype)
              VALUES ('G', gobj, descr, type#);

         COMMIT;
      END IF;
   END;

   PROCEDURE updategroup (grid INTEGER, gobj VARCHAR2, descr VARCHAR2)
   IS
   BEGIN
      UPDATE sba_objinf
         SET obj = gobj,
             description = descr
       WHERE TYPE = 'G' AND id = grid;

      COMMIT;
   END;

   PROCEDURE dropgroup (gobj VARCHAR2)
   IS
   BEGIN
      DELETE FROM sba_objinf
            WHERE obj = gobj AND TYPE = 'G';

      COMMIT;
   END;

   
--<<-------------------------GroupManipulating-------------------------

--**************************************************************************--   

   -----------------------------Module-Manipulating--------------------->>--
   PROCEDURE deletemodule (moduleid INTEGER)
   IS
      rolname   modules.description%TYPE;
      tp        BOOLEAN;
   BEGIN
      SELECT REPLACE (UPPER (description), ' ')
        INTO rolname
        FROM modules
       WHERE id = moduleid;

      DELETE FROM modules
            WHERE id = moduleid;

      DELETE FROM sba_objmanager
            WHERE OBJECT = rolname;

      rolname :=    'SBR_'
                 || rolname;

      IF sb_aca.checkrole (rolname)
      THEN
         tp := runsql (   drcrole
                       || rolname, TRUE);
      END IF;

      COMMIT;
   END;

   PROCEDURE addmodule (
      passw     VARCHAR2,
      classid   VARCHAR2,
      descr     VARCHAR2,
      trvdeck   VARCHAR2,
      can_ins   INTEGER,
      can_del   INTEGER,
      can_upd   INTEGER
   )
   IS
      tp   BOOLEAN;
   BEGIN
      INSERT INTO modules
                  (NAME, description, trvdesc, can_insert,
                   can_delete, can_update)
           VALUES (classid, UPPER (REPLACE (descr, ' ')), trvdeck, can_ins,
                   can_del, can_upd);

      tp := runsql (
                  crcrole
               || 'SBR_'
               || REPLACE (UPPER (descr), ' ')
               || psrole
               || passw,
               TRUE
            );
      COMMIT;
   END;

   PROCEDURE updatemodule (
      modnam        VARCHAR2,
      vclassid      VARCHAR2,
      vtrvdesc      VARCHAR2,
      vcan_insert   VARCHAR2,
      vcan_delete   VARCHAR2,
      vcan_update   VARCHAR2
   )
   IS
   BEGIN
      UPDATE modules
         SET NAME = vclassid,
             trvdesc = vtrvdesc,
             can_insert = vcan_insert,
             can_delete = vcan_delete,
             can_update = vcan_update
       WHERE UPPER (REPLACE (description, ' ')) =
                                                 UPPER (REPLACE (modnam, ' '));

      COMMIT;
   END;

   PROCEDURE saveresults (
      svstr    VARCHAR2,
      filloc   BOOLEAN,
      hand     UTL_FILE.file_type
   )
   IS
   BEGIN
      IF filloc
      THEN
         UTL_FILE.put_line (hand, svstr);
      ELSE
         DBMS_OUTPUT.put_line (svstr);
      END IF;
   END;

   PROCEDURE createrolesalllist (
      filloc   BOOLEAN := FALSE,
      dir      VARCHAR2 := '',
      NAME     VARCHAR2 := ''
   )
   IS
      CURSOR c_roles
      IS
         SELECT *
           FROM dba_roles
          WHERE ROLE LIKE ('SBR_%');

      CURSOR c_granrole (gr VARCHAR2)
      IS
         SELECT *
           FROM dba_role_privs
          WHERE grantee = gr;

      CURSOR c_gransyspriv (gr VARCHAR2)
      IS
         SELECT *
           FROM dba_sys_privs
          WHERE grantee = gr;

      CURSOR c_grantabprivs (gr VARCHAR2)
      IS
         SELECT *
           FROM dba_tab_privs
          WHERE grantee = gr;

      CURSOR c_rol
      IS
         SELECT ROLE
           FROM dba_roles
          WHERE ROLE LIKE ('SBR%');

      file_handle   UTL_FILE.file_type;
   BEGIN
      IF filloc
      THEN
         file_handle := UTL_FILE.fopen (dir, NAME, 'w');
      END IF;

      saveresults (   prob
                   || '---Creating roles---', filloc, file_handle);

      FOR rolrec IN c_roles
      LOOP
         saveresults (
               crcrole
            || rolrec.ROLE
            || psrole
            || 'sm'
            || del,
            filloc,
            file_handle
         );
      END LOOP;

      FOR rec IN c_rol
      LOOP
         saveresults (   dil
                      || rec.ROLE
                      || dil, filloc, file_handle);
         saveresults (   prob
                      || '---Granting roles---', filloc, file_handle);

         FOR recrp IN c_granrole (rec.ROLE)
         LOOP
            saveresults (
                  'Grant '
               || recrp.granted_role
               || ' to '
               || rec.ROLE
               || del,
               filloc,
               file_handle
            );
         END LOOP;

         saveresults (
               prob
            || '---Granting system privileges---',
            filloc,
            file_handle
         );

         FOR recsp IN c_gransyspriv (rec.ROLE)
         LOOP
            saveresults (
                  'Grant '
               || recsp.PRIVILEGE
               || ' to '
               || rec.ROLE
               || ';',
               filloc,
               file_handle
            );
         END LOOP;

         saveresults (
               prob
            || '---Granting tab privs---',
            filloc,
            file_handle
         );

         FOR rectp IN c_grantabprivs (rec.ROLE)
         LOOP
            saveresults (
                  'Grant '
               || rectp.PRIVILEGE
               || ' on '
               || rectp.table_name
               || ' to '
               || rec.ROLE
               || ';',
               filloc,
               file_handle
            );
         END LOOP;

         saveresults (   crlf
                      || crlf, filloc, file_handle);
      END LOOP;

      IF UTL_FILE.is_open (file_handle)
      THEN
         UTL_FILE.fclose (file_handle);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         IF UTL_FILE.is_open (file_handle)
         THEN
            UTL_FILE.fclose (file_handle);
         END IF;

         RAISE;
   END;

   
--<<---------------------------Module-Manipulating-----------------------

----------------------------------OwnerSheep------------------------->>--
   FUNCTION changeownerincustomers (owner INTEGER, newowner INTEGER)
      RETURN BOOLEAN
   IS
   BEGIN
      triggerinterface ('SMART', 'CUSTOMERS', FALSE);

      UPDATE customers
         SET op_id = newowner
       WHERE op_id = owner;

      triggerinterface ('SMART', 'CUSTOMERS', TRUE);
      RETURN TRUE;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN FALSE;
   END;

   FUNCTION changeownerinaccount (owner INTEGER, newowner INTEGER)
      RETURN BOOLEAN
   IS
   BEGIN
      triggerinterface ('SMART', 'ACCOUNT', FALSE);

      UPDATE ACCOUNT
         SET op_id = newowner
       WHERE op_id = owner;

      triggerinterface ('SMART', 'ACCOUNT', TRUE);
      RETURN TRUE;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN FALSE;
   END;

   FUNCTION changeownerintransaction (owner INTEGER, newowner INTEGER)
      RETURN BOOLEAN
   IS
   BEGIN
      triggerinterface ('SMART', 'PROVARCH', FALSE);

      UPDATE provarch
         SET op_id = newowner
       WHERE op_id = owner;

      triggerinterface ('SMART', 'PROVARCH', TRUE);
      triggerinterface ('SMART', 'LAZYTRANSACTION', FALSE);

      UPDATE lazytransaction
         SET op_id = newowner
       WHERE op_id = owner;

      triggerinterface ('SMART', 'LAZYTRANSACTION', TRUE);
      RETURN TRUE;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN FALSE;
   END;

   FUNCTION changeownerincontracts (owner INTEGER, newowner INTEGER)
      RETURN BOOLEAN
   IS
   BEGIN
      triggerinterface ('SMART', 'SBCM_CONTRACTS', FALSE);

      UPDATE sbcm_contracts
         SET sid# = newowner
       WHERE sid# = owner;

      triggerinterface ('SMART', 'SBCM_CONTRACTS', TRUE);
      RETURN TRUE;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN FALSE;
   END;

   
--<<------------------------------OwnerSheep----------------------------

   PROCEDURE grantprivtorole (
      gprole      VARCHAR2,
      gpaction    VARCHAR2,
      gpobject    VARCHAR2,
      gpowner     VARCHAR2,
      gpisgrant   BOOLEAN DEFAULT TRUE
   )
   IS
      tmpquery   VARCHAR2 (256);
      objuery    VARCHAR2 (256);
      dum        BOOLEAN;
   BEGIN
      IF    (UPPER (gpaction) = 'ROLE')
         OR (UPPER (gpaction) = 'PRIVILEGE')
      THEN
         objuery := gpobject;
      ELSE
         objuery :=    gpaction
                    || ' on '
                    || gpowner
                    || '.'
                    || gpobject;
      END IF;

      IF gpisgrant
      THEN
         tmpquery := UPPER (   'grant '
                            || objuery
                            || ' to '
                            || gprole);
      ELSE
         tmpquery := UPPER (   'revoke '
                            || objuery
                            || ' from '
                            || gprole);
      END IF;

      dum := runsql (tmpquery);
   END;

   PROCEDURE revokeprivsfromtorole (gprole VARCHAR2, gpowner VARCHAR2)
   IS
      CURSOR clroleprivs (tmprole VARCHAR2)
      IS
         SELECT *
           FROM (SELECT grantee, table_name, PRIVILEGE
                   FROM dba_tab_privs dgr
                 UNION
                 SELECT grantee, granted_role AS table_name,
                        DECODE (granted_role, NULL, NULL, 'ROLE') AS PRIVILEGE
                   FROM dba_role_privs
                 UNION
                 SELECT grantee, PRIVILEGE AS table_name,
                        DECODE (PRIVILEGE, NULL, NULL, 'PRIVILEGE') AS PRIVILEGE
                   FROM dba_sys_privs objects) tab
          WHERE tab.grantee = UPPER (gprole);

      objquery   VARCHAR2 (256);
      dum        BOOLEAN;
   BEGIN
      FOR rec IN clroleprivs (gprole)
      LOOP
         IF    (rec.PRIVILEGE = 'ROLE')
            OR (rec.PRIVILEGE = 'PRIVILEGE')
         THEN
            objquery := rec.table_name;
         ELSE
            objquery :=
                      rec.PRIVILEGE
                   || ' on '
                   || gpowner
                   || '.'
                   || rec.table_name;
         END IF;

         dum := runsql (   'revoke '
                        || objquery
                        || ' from '
                        || gprole);
      END LOOP;
   END;

   FUNCTION getusertablespaceid (user_name VARCHAR2)
      RETURN NUMBER
   IS
      rec   sys.user$.datats#%TYPE;
   BEGIN
      SELECT datats#
        INTO rec
        FROM sys.user$
       WHERE NAME = UPPER (user_name);

      RETURN rec;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN -1;
   END;

   PROCEDURE triggerenable (
      NAME       VARCHAR2,
      ddldate    DATE,
      isenable   BOOLEAN,
      INTERVAL   INTEGER DEFAULT 1
   )
   IS
      commandpromt   VARCHAR2 (64) := 'ALTER TRIGGER ';
   BEGIN
      IF  isenable AND (INTERVAL > 0)
      THEN
         IF (ddldate >   SYSDATE
                       - INTERVAL
            )
         THEN
            EXECUTE IMMEDIATE (   commandpromt
                               || NAME
                               || ' enable'
                              );
         END IF;
      ELSE
         EXECUTE IMMEDIATE (   commandpromt
                            || NAME
                            || ' disable'
                           );
      END IF;
   END;

   PROCEDURE triggerinterface (
      shemaowner    VARCHAR2,
      tablename     VARCHAR2,
      isenable      BOOLEAN,
      incinterval   INTEGER DEFAULT 1
   )
   IS
      triggerstatus   VARCHAR2 (12);

      CURSOR triggerintr (trigstatus VARCHAR2)
      IS
         SELECT object_name, last_ddl_time
           FROM dba_objects
          WHERE object_name IN (SELECT trigger_name
                                  FROM dba_triggers
                                 WHERE owner = UPPER (shemaowner)
                                   AND table_name = UPPER (tablename)
                                   AND status = trigstatus
                                   AND triggering_event LIKE '%UPDATE%');

      rec             triggerintr%ROWTYPE;
   BEGIN
      IF isenable
      THEN
         triggerstatus := 'DISABLED';
      ELSE
         triggerstatus := 'ENABLED';
      END IF;

      FOR rec IN triggerintr (triggerstatus)
      LOOP
         triggerenable (
            rec.object_name,
            rec.last_ddl_time,
            isenable,
            incinterval
         );
      END LOOP;
   END;

   FUNCTION lockuser (username VARCHAR2, islock BOOLEAN)
      RETURN BOOLEAN
   IS
      lockstring   VARCHAR2 (24);
   BEGIN
      IF islock
      THEN
         lockstring := 'LOCK';
      ELSE
         lockstring := 'UNLOCK';
      END IF;

      RETURN runsql (
                REPLACE (
                   REPLACE (lockuserconst, '%usname', UPPER (username)),
                   '%lock',
                   lockstring
                )
             );
   END;
END;
/


-- End of DDL Script for Package Body SMART.SB_ADM


