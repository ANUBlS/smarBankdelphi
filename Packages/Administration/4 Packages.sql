CREATE OR REPLACE 
PACKAGE smart.sb_aca
IS
   
/* *********************************************** */
 /*        SmartBank Objects Check package          */
/*  Copyright 2003, Smart Systems Technoogy, Ltd.  */
 /* *********************************************** */

   ex_grant_er_msg   CHAR (32) := 'More then one row returned';
   error_accessdeniedInsert                    constant integer := -20280;
   error_accessdeniedDelete                    constant integer := -20281;
   error_accessdeniedUpdate                    constant integer := -20282;
   
    FUNCTION isadm (user_name VARCHAR2 DEFAULT USER)
      RETURN BOOLEAN;

   FUNCTION checkmodaccess (
      modnam        VARCHAR2,
      username      VARCHAR2,
      checkformod   BOOLEAN DEFAULT TRUE
   )
      RETURN BOOLEAN;

   FUNCTION checkrole (rolename VARCHAR2)
      RETURN BOOLEAN;

   FUNCTION checkmodaccess_int (modnam VARCHAR2, username VARCHAR2)
      RETURN NUMBER;

   FUNCTION checkmodright (classid VARCHAR2, suser VARCHAR2 DEFAULT USER)
      RETURN BOOLEAN;

   FUNCTION checkforsynonym (suser VARCHAR2, obj VARCHAR2)
      RETURN BOOLEAN;

   PROCEDURE checkobjectaccess (
      module      VARCHAR2,
      action      VARCHAR2,
      user_name   VARCHAR2 DEFAULT USER
   );

   FUNCTION checkforuser (suser VARCHAR2, israise BOOLEAN DEFAULT FALSE)
      RETURN BOOLEAN;

   FUNCTION checkclass (classname VARCHAR2, ctype VARCHAR2 DEFAULT 'C')
      RETURN BOOLEAN;

   FUNCTION checkgroup (grp VARCHAR2)
      RETURN BOOLEAN;

   FUNCTION getidbyuser (usnam VARCHAR2)
      RETURN NUMBER;

   FUNCTION getuserbyid (usid NUMBER)
      RETURN VARCHAR2;

   FUNCTION getuserfilialid (uname IN VARCHAR2 DEFAULT USER)
      RETURN NUMBER;
 
   FUNCTION isadm_num (user_name VARCHAR2 DEFAULT USER)
      RETURN NUMBER;
   
   procedure checkadvancedobjectaccess(AdvancedGrant varchar2,user_name varchar2 default user);
 
   procedure GetUsersOrder;
 
   procedure GetGroupsOrder;
  function GetUserFilial (User integer default uid)
   return Number;
   
   function checkLockUser (InUserName varchar2) return Boolean;
  function checkLockUser_num (InUserName varchar2) return Integer;
  PROCEDURE checkmoneyborderaccess (
      moneyvalue number,
      user_name       VARCHAR2 DEFAULT USER
   );
  function IsConnected_num(user_name varchar2)
     return integer;
  procedure CheckUserConnected(user_name varchar2 default user);
  function checkbalaccaccess (
       pbalacc     number,
       poptype     number default 1,
       pusername   varchar2 default user
    )
       return integer;
  function getaccountbalacc(accid number)
     return number;
  function checksymbolaccess(symbs varchar2, usname varchar2 default user)
      return number;
END;
/

CREATE OR REPLACE 
PACKAGE BODY smart.sb_aca
IS
 /* *********************************************** */
/*         SmartBank Objects Check package         */
 /*  Copyright 2003, Smart Systems Technoogy, Ltd.  */
/* *********************************************** */
   crlf   CONSTANT VARCHAR2 (2) := '
';

   FUNCTION isadm (user_name VARCHAR2 DEFAULT USER)
      RETURN BOOLEAN
   IS
      cnt   dba_role_privs%ROWTYPE;
   BEGIN
      SELECT *
        INTO cnt
        FROM dba_role_privs
       WHERE grantee = UPPER (user_name) AND granted_role = 'DBA';

      RETURN TRUE;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN FALSE;
   END;

   FUNCTION isadm_num (user_name VARCHAR2 DEFAULT USER)
      RETURN NUMBER
   IS
      tempbol   BOOLEAN;
   BEGIN
      tempbol := isadm (user_name);

      IF tempbol
      THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN 0;
   END;

   FUNCTION isconnected_num (user_name VARCHAR2)
      RETURN INTEGER
   IS
      CURSOR c_users
      IS
         SELECT COUNT (*) AS cnt
           FROM SYS.v_$session
          WHERE username IS NOT NULL
            AND username <> 'SMART'
            AND username = user_name;

      userlist   c_users%ROWTYPE;
      res        INTEGER;
   BEGIN
      res := 1;
      OPEN c_users;
      FETCH c_users INTO userlist;

      IF (userlist.cnt > 1)
      THEN
         res := 0;
      END IF;

      CLOSE c_users;
      RETURN res;
   END;

   PROCEDURE checkuserconnected (user_name VARCHAR2 DEFAULT USER)
   IS
   BEGIN
      IF isconnected_num (user_name) = 0
      THEN
         raise_application_error (-20290,
                                   'User ' || user_name
                                   || ' already connected'
                                 );
      END IF;
   END;

   FUNCTION getuserfilial (USER INTEGER DEFAULT UID)
      RETURN NUMBER
   IS
      filial   sba_objinf.filialid%TYPE;
   BEGIN
      SELECT filialid
        INTO filial
        FROM sba_objinf
       WHERE TYPE = 'U' AND obj = (SELECT NAME
                                     FROM user$
                                    WHERE ID = USER);

      RETURN filial;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN -1;
   END;

   FUNCTION checkrole (rolename VARCHAR2)
      RETURN BOOLEAN
   IS
      rec   dba_roles%ROWTYPE;
   BEGIN
      SELECT *
        INTO rec
        FROM dba_roles
       WHERE ROLE = UPPER (rolename);

      RETURN TRUE;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN FALSE;
   END;

   FUNCTION checkclass (classname VARCHAR2, ctype VARCHAR2 DEFAULT 'C')
      RETURN BOOLEAN
   IS
      rec   sba_objinf%ROWTYPE;
   BEGIN
      SELECT *
        INTO rec
        FROM sba_objinf
       WHERE obj = classname AND TYPE = ctype;

      RETURN TRUE;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN FALSE;
   END;

   PROCEDURE access_denied (isaccessed BOOLEAN, mdstr VARCHAR2, accs VARCHAR2)
   IS
      temp   NUMBER;
   BEGIN
      IF NOT (isaccessed)
      THEN
         IF UPPER (accs) = 'INSERT'
         THEN
            temp := error_accessdeniedinsert;
         ELSIF UPPER (accs) = 'DELETE'
         THEN
            temp := error_accessdenieddelete;
         ELSIF UPPER (accs) = 'UPDATE'
         THEN
            temp := error_accessdeniedupdate;
         ELSE
            raise_application_error (-20300, 'Unknown action');
         END IF;

         raise_application_error (temp,
                                      'Access is denied for '
                                   || INITCAP (accs)
                                   || ' on '
                                   || INITCAP (mdstr)
                                 );
      END IF;
   END;

   PROCEDURE checkobjectaccess (
      module      VARCHAR2,
      action      VARCHAR2,
      user_name   VARCHAR2 DEFAULT USER
   )
   IS
      ex_grant   EXCEPTION;
      RESULT     BOOLEAN;
      tempac     VARCHAR2 (56);
      obj        sba_usergrants%ROWTYPE;
      PRAGMA EXCEPTION_INIT (ex_grant, -1422);
   BEGIN
      tempac := UPPER (action);

      BEGIN
         SELECT *
           INTO obj
           FROM sba_usergrants
          WHERE cur_user = UPPER (user_name) AND cur_module = UPPER (module);

         RESULT := TRUE;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            RESULT := isadm (user_name);
         WHEN ex_grant
         THEN
            raise_application_error (-20001, ex_grant_er_msg);
      END;

      access_denied (    RESULT
                     AND (   (tempac = 'INSERT' AND (obj.can_insert = 1))
                          OR (tempac = 'UPDATE' AND (obj.can_update = 1))
                          OR (tempac = 'DELETE' AND (obj.can_delete = 1))
                         ),
                     UPPER (module),
                     tempac
                    );
   END;

   PROCEDURE raisebordererror (val NUMBER)
   IS
   BEGIN
      raise_application_error (-20280,
                                   chr(10)||chr(10)||'You haven''t access to commit this operation. Amount: '
                                || TO_CHAR (val)||chr(10)||chr(10)|| TO_CHAR (val)||
                                ' ћ€бл€ьи т€сдиг етм€ щцгугунуз йохдур!'||chr(10)||chr(10)
                              );
   END;

   PROCEDURE raiseadvancederror (advancedgrant VARCHAR2)
   IS
      advanceddefineerror   EXCEPTION;
      ermessage             sba_advanced_grants.errormessage%TYPE;
   BEGIN
      SELECT errormessage
        INTO ermessage
        FROM sba_advanced_grants
       WHERE grantname = UPPER (advancedgrant);

      DBMS_OUTPUT.put_line (ermessage);

      IF ermessage IS NOT NULL
      THEN
         DBMS_OUTPUT.put_line ('1' || ermessage);
         raise_application_error (error_accessdeniedinsert, ermessage);
      ELSE
         DBMS_OUTPUT.put_line ('2' || ermessage);
         RAISE advanceddefineerror;
      END IF;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         raise_application_error (error_accessdeniedinsert,
                                  'Advanced rights not Find in table'
                                 );
      WHEN advanceddefineerror
      THEN
         raise_application_error (error_accessdeniedinsert,
                                  'Advanced rights type undefined error'
                                 );
   END;

   PROCEDURE checkadvancedobjectaccess (
      advancedgrant   VARCHAR2,
      user_name       VARCHAR2 DEFAULT USER
   )
   IS
      obj   sba_usergrants_advanced%ROWTYPE;
   BEGIN
      IF NOT isadm (user_name)
      THEN
         SELECT *
           INTO obj
           FROM sba_usergrants_advanced
          WHERE username = UPPER (user_name)
            AND advancedgrantid = (SELECT ID
                                     FROM sba_advanced_grants
                                    WHERE grantname = UPPER (advancedgrant));
      END IF;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         raiseadvancederror (UPPER (advancedgrant));
   END;

   PROCEDURE checkmoneyborderaccess1 (
      advancedgrant   VARCHAR2,
      moneyvalue      NUMBER,
      user_name       VARCHAR2 DEFAULT USER
   )
   IS
      CURSOR c_useradvgrant (uname VARCHAR2, advgrt IN VARCHAR2)
      IS
         SELECT *
           FROM sba_usergrants_advanced
          WHERE username = UPPER (uname)
            AND advancedgrantid = (SELECT ID
                                     FROM sba_advanced_grants
                                    WHERE grantname = UPPER (advgrt));

      CURSOR c_moneyborder (advgrtid IN INT)
      IS
         SELECT *
           FROM sba_monetaryborder
          WHERE advgrantid = advgrtid;

      obj           c_useradvgrant%ROWTYPE;
      bordervalue   c_moneyborder%ROWTYPE;
   BEGIN
      IF NOT isadm (user_name)
      THEN
         OPEN c_useradvgrant (user_name, advancedgrant);
         FETCH c_useradvgrant INTO obj;

         IF c_useradvgrant%NOTFOUND
         THEN
            raiseadvancederror (advancedgrant);
         END IF;

         CLOSE c_useradvgrant;
         OPEN c_moneyborder (obj.advancedgrantid);
         FETCH c_moneyborder INTO bordervalue;

         IF    (c_moneyborder%NOTFOUND)
            OR (bordervalue.maxavalue <= moneyvalue)
         THEN
            raiseadvancederror (advancedgrant);
         END IF;

         CLOSE c_moneyborder;
      END IF;
   END;

   PROCEDURE checkmoneyborderaccess (
      moneyvalue   NUMBER,
      user_name    VARCHAR2 DEFAULT USER
   )
   IS
      CURSOR c_maxamount (uname VARCHAR2)
      IS
         SELECT MAX (maxamount) AS maxamt
           FROM sba_advgrantwider
          WHERE username = uname;

      maxamount   c_maxamount%ROWTYPE;
   BEGIN
      IF NOT isadm (user_name)
      THEN
         OPEN c_maxamount (user_name);
         FETCH c_maxamount INTO maxamount;

         IF (c_maxamount%NOTFOUND) OR (maxamount.maxamt < moneyvalue)
         THEN
            raisebordererror (moneyvalue);
         END IF;

         CLOSE c_maxamount;
      END IF;
   END;

   FUNCTION checkmodaccess (
      modnam        VARCHAR2,
      username      VARCHAR2,
      checkformod   BOOLEAN DEFAULT TRUE
   )
      RETURN BOOLEAN
   IS
      bol     BOOLEAN;
      v_row   dba_role_privs%ROWTYPE;
   BEGIN
      
      bol := isadm (username) AND checkformod;

      SELECT *
        INTO v_row
        FROM dba_role_privs
       WHERE grantee = UPPER (username)
         AND granted_role = UPPER (REPLACE ('SBR_' || modnam, ' '));

      RETURN TRUE;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN (bol OR FALSE);
   END;

   FUNCTION checkmodaccess_int (modnam VARCHAR2, username VARCHAR2)
      RETURN NUMBER
   IS
   BEGIN
      IF checkmodaccess (modnam, username)
      THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION checkmodright (classid VARCHAR2, suser VARCHAR2 DEFAULT USER)
      RETURN BOOLEAN
   IS
      v_row   modules%ROWTYPE;
   BEGIN
      sb_adm.logs_modacc_add(suser,classid);
      IF isadm (suser)
      THEN
         RETURN TRUE;
      END IF;

      SELECT *
        INTO v_row
        FROM modules
       WHERE NAME = classid;

      IF (v_row.description <> 'SPLASH')
      THEN
         RETURN checkmodaccess (v_row.description, suser);
      ELSE
         RETURN TRUE;
      END IF;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN FALSE;
   END;

   FUNCTION checkforsynonym (suser VARCHAR2, obj VARCHAR2)
      RETURN BOOLEAN
   IS
      rec   dba_synonyms%ROWTYPE;
   BEGIN
      SELECT *
        INTO rec
        FROM dba_synonyms
       WHERE owner = UPPER (suser) AND table_name = UPPER (obj);

      RETURN TRUE;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN FALSE;
   END;

   FUNCTION checkforuser (suser VARCHAR2, israise BOOLEAN DEFAULT FALSE)
      RETURN BOOLEAN
   IS
      rec   sys.user$%ROWTYPE;
   BEGIN
      SELECT *
        INTO rec
        FROM SYS.user$
       WHERE NAME = UPPER (suser);

      IF israise
      THEN
         raise_application_error (-20280,
                                      'User with name '''
                                   || UPPER (suser)
                                   || ''' is already exists'
                                 );
      END IF;

      RETURN TRUE;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN FALSE;
   END;

   FUNCTION checkgroup (grp VARCHAR2)
      RETURN BOOLEAN
   IS
      rec   sba_objinf%ROWTYPE;
   BEGIN
      SELECT *
        INTO rec
        FROM sba_objinf
       WHERE TYPE = 'G' AND obj = grp;

      RETURN TRUE;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN FALSE;
   END;

   FUNCTION getuserbyid (usid NUMBER)
      RETURN VARCHAR2
   IS
      res   SYS.user$.NAME%TYPE;
   BEGIN
      SELECT NAME
        INTO res
        FROM user$
       WHERE id = usid;

      RETURN res;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN NULL;
   END;

   FUNCTION getidbyuser (usnam VARCHAR2)
      RETURN NUMBER
   IS
      res   SYS.user$.user#%TYPE;
   BEGIN
      SELECT user#
        INTO res
        FROM SYS.user$
       WHERE NAME = usnam;

      RETURN res;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN NULL;
   END;

   FUNCTION getuserfilialid (uname IN VARCHAR2 DEFAULT USER)
      RETURN NUMBER
   IS
      tmp   NUMBER;
   BEGIN
      SELECT filialid
        INTO tmp
        FROM sba_objinf
       WHERE TYPE = 'U' AND obj = UPPER (uname);

      RETURN tmp;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN NULL;
   END;

   PROCEDURE getusersorder
   IS
      CURSOR c_users
      IS
         SELECT *
           FROM user$;

      CURSOR c_usergrants (username VARCHAR2)
      IS
         SELECT   md.ID, md.trvdesc,
                  REPLACE (md.description, ' ') description,
                  md.can_insert mod_insert, md.can_delete mod_delete,
                  md.can_update mod_update, md.advanced_grants, sba.cur_user,
                  DECODE (sba.can_insert,
                          NULL, 0,
                          sba.can_insert
                         ) AS can_insert,
                  DECODE (sba.can_update,
                          NULL, 0,
                          sba.can_delete
                         ) AS can_delete,
                  DECODE (sba.can_delete,
                          NULL, 0,
                          sba.can_update
                         ) AS can_update,
                  sb_aca.checkmodaccess_int (description,
                                             username) AS mselect,
                  md.ROWID
             FROM modules md, (SELECT *
                                 FROM sba_usergrants sba
                                WHERE cur_user = UPPER (username)) sba
            WHERE UPPER (REPLACE (md.description, ' ')) = sba.cur_module(+)
         ORDER BY description;

      CURSOR c_useradvancedgrants (modid INTEGER, uusername VARCHAR2)
      IS
         SELECT sec.*, fir.*,
                DECODE (fir.username, NULL, 0, 1) AS usergranted
           FROM (SELECT ID, grantname, description
                   FROM sba_advanced_grants
                  WHERE moduleid = modid) sec,
                (SELECT *
                   FROM sba_usergrants_advanced
                  WHERE username = uusername) fir
          WHERE sec.ID = fir.advancedgrantid(+);

      gr   VARCHAR2 (50);
   BEGIN
      FOR rec IN c_users
      LOOP
         DBMS_OUTPUT.put_line ('*********************************************************'
                              );
         DBMS_OUTPUT.put_line ('User Name: ' || rec.NAME);

         FOR rec2 IN c_usergrants (rec.NAME)
         LOOP
            gr := '';

            IF rec2.mselect = 1
            THEN
               DBMS_OUTPUT.put_line (crlf);
               DBMS_OUTPUT.put_line ('----------------------------------------------------'
                                    );
               DBMS_OUTPUT.put_line (   '            Module name: '
                                     || rec2.trvdesc
                                    );
               DBMS_OUTPUT.put_line ('            ---Grants---');
               DBMS_OUTPUT.put_line ('          Select: Granted ');

               IF rec2.can_insert = 1
               THEN
                  gr := 'Granted';
               ELSE
                  gr := 'Not granted';
               END IF;

               DBMS_OUTPUT.put_line ('          Insert:' || gr);

               IF rec2.can_update = 1
               THEN
                  gr := 'Granted';
               ELSE
                  gr := 'Not granted;';
               END IF;

               DBMS_OUTPUT.put_line ('          Update:' || gr);

               IF rec2.can_delete = 1
               THEN
                  gr := 'Granted';
               ELSE
                  gr := 'Not granted';
               END IF;

               DBMS_OUTPUT.put_line ('          Delete:' || gr);
            END IF;

            IF rec2.advanced_grants = 1
            THEN
               DBMS_OUTPUT.put_line (crlf);
               DBMS_OUTPUT.put_line ('         --Advanced grants--');

               FOR rec3 IN c_useradvancedgrants (rec2.ID, rec.NAME)
               LOOP
                  IF rec3.usergranted = 1
                  THEN
                     gr := 'Granted';
                  ELSE
                     gr := 'Not granted';
                  END IF;

                  DBMS_OUTPUT.put_line ('  ' || rec3.description || ': ' || gr);
               END LOOP;
            END IF;
         END LOOP;
      END LOOP;
   END;

   PROCEDURE getgroupsorder
   IS
      CURSOR c_groups (rid INTEGER)
      IS
         SELECT gmn.userid, sus.NAME, gmn.groupid, gmn.TYPE,
                grobj.description
           FROM sba_groupmanager gmn,
                SYS.user$ sus,
                (SELECT ID, obj, description, createdate
                   FROM sba_objinf
                  WHERE TYPE = 'G') grobj
          WHERE gmn.userid = sus.user#
            AND gmn.groupid = rid
            AND gmn.groupid = grobj.ID;

      CURSOR c_allgoups
      IS
         SELECT   ID, obj, description, createdate
             FROM sba_objinf
            WHERE TYPE = 'G'
         ORDER BY ID;

      gr   VARCHAR2 (50);
   BEGIN
      FOR rec1 IN c_allgoups
      LOOP
         DBMS_OUTPUT.put_line ('*************************************');
         DBMS_OUTPUT.put_line ('Group Name:' || rec1.description);

         FOR rec2 IN c_groups (rec1.ID)
         LOOP
            DBMS_OUTPUT.put ('    User name:' || rec2.NAME);

            IF rec2.TYPE = 1
            THEN
               gr := 'Master';
            ELSE
               gr := 'Slave';
            END IF;

            DBMS_OUTPUT.put_line ('    Type: ' || gr);
         END LOOP;
      END LOOP;
   END;

   FUNCTION checklockuser (inusername VARCHAR2)
      RETURN BOOLEAN
   IS
      status   dba_users.account_status%TYPE;
   BEGIN
      SELECT account_status
        INTO status
        FROM dba_users
       WHERE username = UPPER (inusername) AND account_status LIKE ('%LOCKED%');

      RETURN TRUE;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN FALSE;
      WHEN TOO_MANY_ROWS
      THEN
         RETURN FALSE;
   END;

   FUNCTION checklockuser_num (inusername VARCHAR2)
      RETURN INTEGER
   IS
   BEGIN
      IF (checklockuser (inusername))
      THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;
   END;
   
   function getaccountbalacc(accid number)
     return number
   is
     res number;
   begin
      select bal_cn1
        into res
        from account
       where id=accid;
      return res;
      exception when others then
        return -1;
   end;
   
    function checkbalaccaccess (
       pbalacc     number,
       poptype     number default 1,
       pusername   varchar2 default user
    )
       return integer
    is
       cnt   number;
    begin
       select bal_acc
         into cnt
         from sba_balance_acc a
        where a.username = pusername and a.bal_acc = pbalacc
              and a.optype = poptype;

       return 1;
    exception
       when no_data_found
       then
          return isadm_num;
       when others
       then
          return -1;
    end;
    
    function checksymbolaccess(symbs varchar2, usname varchar2 default user)
      return number
    is
      res number;
    begin
      select decode(count(*),0,0,1)
        into res
        from sba_userflags
       where username=usname
         and symbs like '%'||flagsymb||'%';
       
      return res;
    exception
       when no_data_found
       then
          return isadm_num;
       when others
       then
          return -1;
    end;

END;
/

CREATE OR REPLACE 
PACKAGE smart.sb_adm
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

   PROCEDURE triggerinterface (
      shemaowner    VARCHAR2,
      tablename     VARCHAR2,
      isenable      BOOLEAN,
      incinterval   INTEGER DEFAULT 1
   );
--------------------------------OwnerSheep-------------------------->>--   

   FUNCTION changeownerincustomers (owner INTEGER, newowner INTEGER)
      RETURN BOOLEAN;

   FUNCTION changeownerinaccount (owner INTEGER, newowner INTEGER)
      RETURN BOOLEAN;

   FUNCTION changeownerintransaction (owner INTEGER, newowner INTEGER)
      RETURN BOOLEAN;

   FUNCTION changeownerincontracts (owner INTEGER, newowner INTEGER)
      RETURN BOOLEAN;

   --<<------------------------------OwnerSheep----------------------------   
  procedure createprofile(usern varchar2);
  FUNCTION getprofilevalues(usern varchar2,  paramName varchar2)
      RETURN varchar2;
  FUNCTION getusername
      RETURN varchar2;
  function islocked(usern varchar2)
     return boolean;
  procedure lockunlockuser(usern varchar2, status boolean := false );
  FUNCTION verify_password (passwd VARCHAR2)
      RETURN BOOLEAN;
  function setprofilevalues(usern varchar2, paramName varchar2, paramValue varchar2)
   return boolean;

   FUNCTION user_passw (username VARCHAR2, passw VARCHAR2)
      RETURN BOOLEAN;
  procedure addnewadvancedgrantwithborder(pmoduleid integer, pgrantname varchar2, perrormessage varchar2, pdescription varchar2, moneyborder number);
  function addnewadvancedgrant(pmoduleid integer, pgrantname varchar2, perrormessage varchar2, pdescription varchar2)
     return number;
  procedure editadvancedgrant(pid integer, pmoduleid integer, pgrantname varchar2, perrormessage varchar2, pdescription varchar2);
  procedure editmoneyborder(pgrantid integer, pmborder number);
  procedure delmoneyborder(pgrantid integer);
  procedure deladvancedgrant(pid integer);
  procedure addmoneyborder (pgrantid integer, pmborder number);
  procedure admlog_add (
   clogtype       number,
   changeduser    varchar2 default null,
   changedmodul   varchar2 default null,
   chins          number default null,
   chupd          number default null,
   chdel          number default null,
   opertype       number default null,
   moddescr       varchar2 default null,
   modtrv         varchar2 default null,
   objtype        varchar2 default null,
   objfullname    varchar2 default null,
   objphone       varchar2 default null,
   objclassid     number default null,
   objfilialid    number default null,
   objadvtype     number default null,
   objsysuserid   number default null
);
  FUNCTION islocked_num (user_name VARCHAR2 DEFAULT USER)
      RETURN NUMBER;
  procedure backupgroupman(grpid number);
  procedure locknewusers(grpid number);
  function getmodadvgrant(advgrantid number)
     return varchar2;
  procedure dellog(logid number);
  procedure backupusergrants(username varchar2);
  procedure logs_del(lid number);
  procedure logs_add(tblname number, operid number, tblid number);
  procedure logs_modacc_add(username varchar2, modnam varchar2);
  procedure deluserflag(puser varchar2);
  procedure adduserflag(puser varchar2, pflag varchar2);
  procedure deluserbalacc(usname varchar2, optp number);
  procedure adduserbalacc(usname varchar2, bal_acc number, optp number);
  procedure addclassflag(puser varchar2, pflag varchar2);
  procedure addclassbalacc(usname varchar2, bal_acc number, optp number);
  procedure delclassbalacc(usname varchar2, optp number);
  procedure delclassflag(puser varchar2);
  procedure delclassadvgrant(puser varchar2, modnam varchar2 default '-');
  procedure addclassadvgrant(puser varchar2, pgrid number, modnam varchar2 default '-');
  procedure updclassgrant(clsid number, modname varchar2, i number, u number, d number);
  procedure applyclassgrants(classname varchar2);
  procedure insclassadvgr(classname varchar2, usernam varchar2);
  procedure insclassbalacc(classname varchar2, usernam varchar2);
  procedure insclassflags(classname varchar2, usernam varchar2);
  procedure insclassgrants(classid number, usernam varchar2);
  procedure unlockclass(clsid number);
END;
/

CREATE OR REPLACE 
PACKAGE BODY smart.sb_adm
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
   /*def             CONSTANT VARCHAR2 (64)
            := ' default tablespace smartbank temporary tablespace temp';*/
   def        CONSTANT VARCHAR2 (256)
            := ' default tablespace smartbank temporary tablespace temp
                 profile %sprofile
                 password expire
                 account unlock';
   prof       CONSTANT VARCHAR2 (512) := 'CREATE PROFILE %sPROFILE LIMIT
                                          PASSWORD_LIFE_TIME 30
                                          PASSWORD_GRACE_TIME 3
                                          PASSWORD_REUSE_TIME 1800
                                          PASSWORD_REUSE_MAX 3
                                          FAILED_LOGIN_ATTEMPTS 4
                                          PASSWORD_LOCK_TIME 1/1440
                                          PASSWORD_VERIFY_FUNCTION null';

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
   FUNCTION verify_password (passwd VARCHAR2)
      RETURN BOOLEAN
   IS
      res   BOOLEAN;
      minlength NUMBER;
   BEGIN
      select MAX(to_number(value)) into minlength from settings
              where name = 'PASSWORD_LENGTH';
      if sql%found and minlength > length(passwd) then return false; end if;
      res := true;--SYS.verify_function (user, passwd, 'sex');
      RETURN res;
   EXCEPTION
      WHEN OTHERS THEN
      RETURN FALSE;
   END;

   procedure createprofile(usern varchar2)
   is
   begin
      if runsql(replace(prof, '%s', usern)) then dbms_output.put_line(' ');
      else dbms_output.put_line(' ');
      end if;
   exception
      when others then  dbms_output.put_line(sqlerrm);
   end;


   FUNCTION getusername
      RETURN varchar2
   IS
   BEGIN
      RETURN user;
   END;

   FUNCTION getprofilevalues(usern varchar2,  paramName varchar2)
      RETURN varchar2
   IS
   value varchar2(128) := '';
   BEGIN
      if paramName = 'edMinPassLength' then
       select s.value into value from settings s
         where name = 'PASSWORD_LENGTH';
      else

      select limit into value
        FROM dba_profiles
          WHERE PROFILE = UPPER(usern)||'PROFILE' AND resource_type = 'PASSWORD'
          and RESOURCE_NAME = paramName;
      end if;
      RETURN value;
   END;

   function setprofilevalues(usern varchar2, paramName varchar2, paramValue varchar2)
   return boolean
   IS
   BEGIN
--     return false;
      if getprofilevalues(usern, paramName) = paramValue then return true; end if;
      if paramName = 'edMinPassLength' then
       update settings s
       set s.value = paramValue
         where name = 'PASSWORD_LENGTH';
        return true;
      elsif
       runsql('alter profile '||usern||'profile limit '||paramName||' '|| paramValue)
       then return true;
      end if;
   exception
    when others then
      return false;
   END;

   procedure lockunlockuser(usern varchar2, status boolean := false )
   is
   begin
     if status then
       if runsql('alter user '||usern||' account lock') then dbms_output.put_line('ok ');
       end if;
     else
       if runsql('alter user '||usern||' account unlock') then dbms_output.put_line('ok ');
       end if;
     end if;
   end;

   function islocked(usern varchar2)
     return boolean
    is
      val number;
      res boolean;
   begin
      SELECT MAX(u.astatus) into val
        FROM SYS.user$ u
      WHERE u.NAME = usern;
     if sql%notfound then res := false;
     elsif val = 0 then res := false;
     elsif val in (4,5,6,8,9,10) then res := true;
     end if;
     return res;
    exception
      when others then return false;
   end;

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
                                      FROM sba_syndec)
                                      and not(object_name like ('BIN%'));

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
         createprofile(username);
         usstr :=
                 'create user '
              || username
              || ' identified by '
              || passw
              || replace(def, '%s', username);--!!!!!!!!!!!!!!!!!!!!!!!!
/*
         usstr :=
                 'create user '
              || username
              || ' identified by '
              || passw
              || def;*/
      ELSE /*Changed by Kera 2007-08-08 10:47 */
         usstr :=    'alter user '
                  || username||' account lock';
                  
         dropuseraction (username);

            --dropuseraction (username);
            --delete_user_inf (username);
            dropgroupmanuser (sb_aca.getidbyuser (username));
            delete_advancedusergrants (username);
            /* End KerA*/
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
         execute immediate 'alter user '||vusername||' account lock';
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

     /* notnulset :=    (tpinsert != 0)
                   OR (tpupdate != 0)
                   OR (tpdelete != 0);

      IF notnulset
      THEN*/
         UPDATE sba_usergrants
            SET can_insert = tpinsert,
                can_delete = tpdelete,
                can_update = tpupdate
          WHERE cur_user = UPPER (aduser)
            AND cur_module = UPPER (REPLACE (module, ' '));
      /*ELSE
         DELETE FROM sba_usergrants
               WHERE cur_user = UPPER (aduser)
                 AND cur_module = UPPER (REPLACE (module, ' '));
      END IF;*/

      COMMIT;

      IF SQL%ROWCOUNT = 0
      THEN
         /*IF notnulset
         THEN*/DELETE FROM sba_usergrants
               WHERE cur_user = UPPER (aduser)
                 AND cur_module = UPPER (REPLACE (module, ' '));
            INSERT INTO sba_usergrants
                        (cur_user, cur_module,
                         can_insert, can_update, can_delete)
                 VALUES (UPPER (aduser), UPPER (REPLACE (module, ' ')),
                         tpinsert, tpupdate, tpdelete);

            COMMIT;
        -- END IF;
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
      cursor c_clsgrants(mnam varchar2)
      is
         select * from sba_objmanager where id=clid and object=mnam;
      cursor c_clsnam is select obj from sba_objinf where id=clid;
      clsnam c_clsnam%rowtype;
      cgr c_clsgrants%rowtype;
   BEGIN
      FOR rec IN c_dbar
      LOOP
         open c_clsgrants (rec.mods);
         fetch c_clsgrants into cgr;
         close c_clsgrants;
         IF checkclassgrant (clid, rec.mods)
         THEN
            tpbl := modacc (rec.mods, us, TRUE);
            setadvancedgrants (rec.mods, UPPER (us), cgr.ins, cgr.upd, cgr.del);
         ELSE
            tpbl := modacc (rec.mods, us, FALSE);
            setadvancedgrants (rec.mods, UPPER (us), 0, 0, 0);
         END IF;
       open c_clsnam;
       fetch c_clsnam into clsnam;
       close c_clsnam;
       insclassbalacc(clsnam.obj, us);
       insclassflags(clsnam.obj, us);
       insclassadvgr(clsnam.obj, us);
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
         admlog_add(4,sb_aca.getuserbyid(us),null,null,null,null,1,null,null,null,null,null,grid,null,tp,null);
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
   
   /*Added by KerA 20070724 09:30 AM (Checkpoint #1)*/
    function addnewadvancedgrant (
       pmoduleid       integer,
       pgrantname      varchar2,
       perrormessage   varchar2,
       pdescription    varchar2
    )
       return number
    is
       res   integer;
    begin
       insert into sba_advanced_grants
                   (grantname, errormessage, moduleid, description)
            values (pgrantname, perrormessage, pmoduleid, pdescription)
         returning id
              into res;

       commit;
       return res;
    end;

    procedure addmoneyborder (pgrantid integer, pmborder number)
    is
    begin
       insert into sba_monetaryborder
            values (pgrantid, pmborder);

       commit;
    end;

    procedure editmoneyborder (pgrantid integer, pmborder number)
    is
    begin
       update sba_monetaryborder
          set maxavalue = pmborder
        where advgrantid = pgrantid;
       if sql%rowcount=0 then
         addmoneyborder(pgrantid, pmborder);
       end if;

       commit;
    end;

    procedure delmoneyborder (pgrantid integer)
    is
    begin
       delete from sba_monetaryborder
             where advgrantid = pgrantid;

       commit;
    end;

    procedure addnewadvancedgrantwithborder (
       pmoduleid       integer,
       pgrantname      varchar2,
       perrormessage   varchar2,
       pdescription    varchar2,
       moneyborder     number
    )
    is
       getid   number;
    begin
       insert into sba_advanced_grants
                   (grantname, errormessage, moduleid, description)
            values (pgrantname, perrormessage, pmoduleid, pdescription)
         returning id
              into getid;

       insert into sba_monetaryborder
            values (getid, moneyborder);

       commit;
    end;

    procedure editadvancedgrant (
       pid             integer,
       pmoduleid       integer,
       pgrantname      varchar2,
       perrormessage   varchar2,
       pdescription    varchar2
    )
    is
    begin
       update sba_advanced_grants
          set moduleid = pmoduleid,
              grantname = pgrantname,
              errormessage = perrormessage,
              description = pdescription
        where id = pid;

       commit;
    end;

    procedure deladvancedgrant (pid integer)
    is
    begin
       delmoneyborder(pid);
       delete from sba_advanced_grants
             where id = pid;

       commit;
    end;

   /*End of Checkpoint 20070725 16:30 PM#1*/
   
   /* Checkpoint #2 20070726 15:00 */
FUNCTION islocked_num (user_name VARCHAR2 DEFAULT USER)
      RETURN NUMBER
   IS
      tempbol   BOOLEAN;
   BEGIN
      tempbol := islocked (user_name);

      IF tempbol
      THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN 0;
   END;
   
procedure admlog_add (
   clogtype       number,
   changeduser    varchar2 default null,
   changedmodul   varchar2 default null,
   chins          number default null,
   chupd          number default null,
   chdel          number default null,
   opertype       number default null,
   moddescr       varchar2 default null,
   modtrv         varchar2 default null,
   objtype        varchar2 default null,
   objfullname    varchar2 default null,
   objphone       varchar2 default null,
   objclassid     number default null,
   objfilialid    number default null,
   objadvtype     number default null,
   objsysuserid   number default null
)
is
begin
   insert into sba_adm_logs
               (logtype, moduser, modul, cins, cupd, cdel,
                oper, description, trvdesc, otype, ofullname, ophone,
                oclassid, ofilialid, oadvtype, osysuserid
               )
        values (clogtype, changeduser, changedmodul, chins, chupd, chdel,
                opertype, moddescr, modtrv, objtype, objfullname, objphone,
                objclassid, objfilialid, objadvtype, objsysuserid
               );
--     commit;
end;

   procedure backupgroupman(grpid number)
   is
   begin
     delete from sba_tempgroupman;
     insert into sba_tempgroupman
       select * from sba_groupmanager where groupid=grpid;
   end;

   procedure backupusergrants(username varchar2)
   is
   begin
     delete from sba_tempusergrants;
     insert into sba_tempusergrants
       select * from sba_usergrants where cur_user=username;
   end;

   procedure locknewusers(grpid number)
   is
     cursor cc is
        select *
          from (select nvl (t.type, 0) - g.type tp, g.userid
                  from sba_tempgroupman t, (select *
                                             from sba_groupmanager
                                            where groupid = grpid) g
                where g.groupid = t.groupid(+) and g.userid = t.userid(+)) t,
              user$ u
        where tp <> 0 and t.userid = u.id;
   begin
      for z in cc loop
        execute immediate 'alter user '||z.name||' account lock';
      end loop;
   end;
   
   function getmodadvgrant(advgrantid number)
     return varchar2
   is res varchar2(200);
   begin
     select m.description||'/'||g.grantname
       into res
       from modules m, sba_advanced_grants g
      where m.id=g.moduleid and g.id=advgrantid;
     return res;
     exception when others then
       return '(-)';
   end;
   
   procedure dellog(logid number)
   is
   begin
     delete from sba_adm_logs
           where id=logid;
     commit;
   end;
   /*End of Checkpoint #2 */

   /* Checkpoint #3 20070818 09:00 */
   
   procedure logs_add(tblname number, operid number, tblid number)
   is
   begin
     insert into sba_logs(tablename, oper, tid) values (tblname , operid , tblid );
   end;
   
   procedure logs_del(lid number)
   is
   begin
     delete from sba_logs
           where id=lid;
     delete from sba_logs_modaccess
           where id=lid;
     commit;
   end;
   
   procedure logs_modacc_add(username varchar2, modnam varchar2)
   is
   begin
     insert into sba_logs_modaccess(cuser, modul) values (username, modnam);
     commit;
   end;
   /*End of Checkpoint #3 */
   
   /* Checkpoint #4 20070918 10:00 */

   procedure adduserflag(puser varchar2, pflag varchar2)
   is
   begin
     insert into sba_userflags values(puser, pflag);
     commit;
   end;

   procedure deluserflag(puser varchar2)
   is
   begin
     delete from sba_userflags where username=puser;
     commit;
   end;

   procedure deluserbalacc(usname varchar2, optp number)
   is
   begin
     delete from sba_balance_acc where username=usname and optype=optp;
     commit;
   end;

   procedure adduserbalacc(usname varchar2, bal_acc number, optp number)
   is
   begin
     insert into sba_balance_acc values (usname,bal_acc,optp);
     commit;
   end;
   
   procedure addclassflag(puser varchar2, pflag varchar2)
   is
   begin
     insert into sba_class_flags values(puser, pflag);
     commit;
   end;
   
   procedure delclassflag(puser varchar2)
   is
   begin
     delete from sba_class_flags where username=puser;
     commit;
   end;

   procedure delclassbalacc(usname varchar2, optp number)
   is
   begin
     delete from sba_class_balance_acc where username=usname and optype=optp;
     commit;
   end;

   procedure addclassbalacc(usname varchar2, bal_acc number, optp number)
   is
   begin
     insert into sba_class_balance_acc values (usname,bal_acc,optp);
     commit;
   end;
   
   procedure addclassadvgrant(puser varchar2, pgrid number, modnam varchar2 default '-')
   is
   begin
     insert into sba_classgrants_advanced values(puser, pgrid, modnam);
     commit;
   end;

   procedure delclassadvgrant(puser varchar2, modnam varchar2 default '-')
   is
   begin
     delete from sba_classgrants_advanced where username=puser and modname=modnam;
     commit;
   end;

   procedure updclassgrant(clsid number, modname varchar2, i number, u number, d number)
   is
   begin
     update sba_objmanager set ins=i, upd=u, del=d where id=clsid and object=modname;
     if sql%rowcount=0 then
       insert into sba_objmanager values (clsid, modname, i, u, d);
     end if;
     commit;
   end;

   procedure insclassbalacc(classname varchar2, usernam varchar2)
   is
   begin
     delete from sba_balance_acc where username=usernam;
     insert into sba_balance_acc
        select usernam, bal_acc, optype
          from sba_class_balance_acc
         where username = classname;
   end;

   procedure insclassflags(classname varchar2, usernam varchar2)
   is
   begin
     delete from sba_userflags where username=usernam;
     insert into sba_userflags
        select usernam, flagsymb
          from sba_class_flags
         where username = classname;
   end;

   procedure insclassgrants(classid number, usernam varchar2)
   is
   begin
     delete from sba_usergrants where cur_user=usernam;
     insert into sba_usergrants
        select usernam, object, ins, upd, del
          from sba_objmanager
         where id = classid;
   end;

   procedure insclassadvgr(classname varchar2, usernam varchar2)
   is
   begin
     delete from sba_usergrants_advanced where username=usernam;
     insert into sba_usergrants_advanced
        select usernam, advancedgrantid
          from sba_classgrants_advanced
         where username = classname;
   end;

   procedure applyclassgrants(classname varchar2)
   is
     cid number;
     cursor c_obj (clid number) is select obj from sba_objinf where classid=clid;
   begin
     select id into cid from sba_objinf where upper(obj)=upper(classname);
     --raise_application_error(-20001, cid);
     for z in c_obj(cid) loop
       insclassgrants(cid, z.obj);
       insclassbalacc(classname, z.obj);
       insclassflags(classname, z.obj);
       insclassadvgr(classname, z.obj);
       execute immediate 'alter user '||z.obj||' account lock';
     end loop;
     dbms_output.put_line(' ');
   end;

   procedure unlockclass(clsid number)
   is
     cursor c_us is select obj from sba_objinf where type='U' and classid=clsid;
   begin
     for z in c_us loop
       lockunlockuser(z.obj, false);
     end loop;
   end;
   /* End of Checkpoint */
END;
/

