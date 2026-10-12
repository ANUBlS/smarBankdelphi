-- Start of DDL Script for Package Body SMART.SB_ACA
-- Generated 3-Nov-2004 14:53:58 from SMART@sbdev

CREATE OR REPLACE 
PACKAGE sb_aca
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
END;
/

-- Grants for Package
GRANT EXECUTE ON sb_aca TO sbr_standart
/

CREATE OR REPLACE 
PACKAGE BODY sb_aca
IS
   
 /* *********************************************** */
/*         SmartBank Objects Check package         */
 /*  Copyright 2003, Smart Systems Technoogy, Ltd.  */
/* *********************************************** */
   crlf       CONSTANT VARCHAR2 (2)  := '
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
   
   function GetUserFilial (User integer default uid)
   return Number
   is
    Filial sba_objinf.FilialID%type;
   begin
    select filialid into Filial
    from sba_objinf
    where type='U' and obj=(select NAME from user$ where ID=User);
   return filial;
   exception
    when OTHERS then
     Return -1; 
   end;

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

         raise_application_error (
            temp,
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
      result     BOOLEAN;
      tempac     VARCHAR2 (56);
      obj        sba_usergrants%ROWTYPE;
      PRAGMA EXCEPTION_INIT (ex_grant,  -1422);
   BEGIN
      tempac := UPPER (action);

      BEGIN
         SELECT *
           INTO obj
           FROM sba_usergrants
          WHERE cur_user = UPPER (user_name) AND cur_module = UPPER (module);

         result := TRUE;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            result := isadm (user_name);
         WHEN ex_grant
         THEN
            raise_application_error (-20001, ex_grant_er_msg);
      END;

      access_denied (
             result
         AND (   (tempac = 'INSERT' AND (obj.can_insert = 1))
              OR (tempac = 'UPDATE' AND (obj.can_update = 1))
              OR (tempac = 'DELETE' AND (obj.can_delete = 1))
             ),
         UPPER (module),
         tempac
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
         DBMS_OUTPUT.put_line (   '1'
                               || ermessage);
         raise_application_error (error_accessdeniedinsert, ermessage);
      ELSE
         DBMS_OUTPUT.put_line (   '2'
                               || ermessage);
         RAISE advanceddefineerror;
      END IF;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         raise_application_error (
            error_accessdeniedinsert,
            'Advanced rights not Find in table'
         );
      WHEN advanceddefineerror
      THEN
         raise_application_error (
            error_accessdeniedinsert,
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
   IF   not isadm (user_name) then
   
      SELECT *
        INTO obj
        FROM sba_usergrants_advanced
       WHERE username = UPPER (user_name)
         AND advancedgrantid = (SELECT id
                                  FROM sba_advanced_grants
                                 WHERE grantname = UPPER (advancedgrant));
   end if;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         raiseadvancederror (UPPER (advancedgrant));
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
         AND granted_role = UPPER (REPLACE (   'SBR_'
                                            || modnam, ' '));

      RETURN TRUE;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN (   bol
                 OR FALSE
                );
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
      IF isadm (suser)
      THEN
         RETURN TRUE;
      END IF;

      SELECT *
        INTO v_row
        FROM modules
       WHERE NAME = classid;

      IF (v_row.description ~= 'SPLASH')
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
        FROM sys.user$
       WHERE NAME = UPPER (suser);

      IF israise
      THEN
         raise_application_error (
            -20280,
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
      INTO Rec
      FROM sba_objinf
      WHERE TYPE='G' and obj =grp;

    RETURN TRUE;
    EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN FALSE;
   END;

   FUNCTION getuserbyid (usid NUMBER)
      RETURN VARCHAR2
   IS
      res   sys.user$.NAME%TYPE;
   BEGIN
      SELECT NAME
        INTO res
        FROM sys.user$
       WHERE user# = usid;

      RETURN res;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN NULL;
   END;

   FUNCTION getidbyuser (usnam VARCHAR2)
      RETURN NUMBER
   IS
      res   sys.user$.user#%TYPE;
   BEGIN
      SELECT user#
        INTO res
        FROM sys.user$
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
   
  procedure GetUsersOrder
  is
  
   cursor C_Users  is
   select * from user$;
  
   cursor C_UserGrants(username varchar2)
   is
     select
     md.id
    ,md.trvdesc
    ,Replace(md.Description,' ') Description
    ,md.can_insert mod_insert
    ,md.can_delete mod_delete
    ,md.can_update mod_update 
    ,md.advanced_grants
    ,sba.cur_user 
    ,Decode(sba.can_insert,null,0,sba.can_insert) as can_insert
    ,Decode(sba.can_update,null,0,sba.can_delete) as can_delete
    ,Decode(sba.can_delete,null,0,sba.can_update) as can_update
    ,SB_ACA.checkmodaccess_int(description,USERNAME) as MSelect
    ,md.rowid
 from modules md ,
   (select *
    from sba_usergrants sba
    where cur_user=UPPER(USERNAME)) sba 
  where
    UPPER(Replace(md.Description,' ')) =sba.cur_module(+)
     order by Description;


   cursor C_UserAdvancedGrants(modid integer,Uusername varchar2) is     
   select sec.*,fir.*,
Decode(fir.username,null,0,1) as UserGranted
from 
(select id,grantname,description from
sba_advanced_grants
where moduleid=modid) sec,
(select * from sba_usergrants_advanced
where username=Uusername) fir
where 
sec.id=fir.advancedgrantid(+);
  
gr varchar2(50);
  begin
   for rec in C_Users
   loop
    dbms_output.put_line('*********************************************************');
    dbms_output.put_line('User Name: '||rec.name);
     for rec2 in C_UserGrants(rec.name)
      loop
         gr:='';

           if rec2.mselect  =1 then 
             dbms_output.put_line(crlf);
           dbms_output.put_line('----------------------------------------------------');
                
             dbms_output.put_line('            Module name: '||rec2.trvdesc);
             dbms_output.put_line('            ---Grants---');
                  dbms_output.put_line('          Select: Granted ');
         
         if rec2.can_insert=1 then
            gr:='Granted';
         else
          gr:='Not granted';
         end if;
         dbms_output.put_line('          Insert:'||GR);
         
         if rec2.can_update=1 then
            gr:='Granted';
         else
          gr:='Not granted;';
         end if;
         dbms_output.put_line('          Update:'||GR);
         
         if rec2.can_delete=1 then
            gr:='Granted';
         else
          gr:='Not granted';
         end if;
         dbms_output.put_line('          Delete:'||GR);
     end if;
        if rec2.advanced_grants=1 then
            dbms_output.put_line(crlf);         
         dbms_output.put_line('         --Advanced grants--');
           for rec3 in C_UserAdvancedGrants(rec2.id,rec.name) 
          loop
            if rec3.UserGranted=1 then
              gr:='Granted';
             else
              gr:='Not granted';
            end if;            
            dbms_output.put_line('  '||rec3.description ||': '||GR);
            end loop;
         end if;
 end loop;
end loop;
end;


procedure GetGroupsOrder
is
 cursor C_groups(rId integer)
 is
  SELECT   gmn.userid,sus.name, gmn.groupid, gmn.type,grobj.description
  FROM sba_groupmanager gmn,sys.user$ sus
  ,(select id,obj,description,createdate from sba_objinf
    where type='G') grobj
where 
 gmn.userid=sus.user#
  and gmn.groupid=rid
  and gmn.groupid=grobj.id;

 cursor c_allgoups is
  select id,obj,description,createdate from sba_objinf
   where type='G' order by id;
 
gr varchar2(50);  
begin
 for rec1 in c_allgoups
 loop
     dbms_output.put_line('*************************************');
    dbms_output.put_line('Group Name:'||rec1.description);
  for rec2 in C_groups(rec1.id)
   loop
     dbms_output.put('    User name:'||rec2.name);
     if rec2.type=1 then
      gr:= 'Master';  
     else
      gr:= 'Slave';
     end if;
     
     dbms_output.put_line('    Type: '||gr);
   end loop;
 end loop;
end;

function checkLockUser (InUserName varchar2) return Boolean
is
 STATUS dba_users.ACCOUNT_STATUS%type;
begin
 select ACCOUNT_STATUS into STATUS from dba_users
  where username=UPPER(InUserName) and  ACCOUNT_STATUS='LOCKED';
  
Return True;
EXCEPTION
 WHEN NO_DATA_FOUND  THEN
   RETURN False;
 WHEN TOO_MANY_ROWS then 
  RETURN False;
end;

function checkLockUser_num (InUserName varchar2) return Integer
is
begin
  if  (CheckLockUser(InUserName)) then return 1;
  else return 0;
  end if;
end;


   
END;
/


-- End of DDL Script for Package Body SMART.SB_ACA


