DROP User smart CASCADE;
/
DROP TABLESPACE smartIdx INCLUDING CONTENTS CASCADE CONSTRAINTS;
/
DROP TABLESPACE smartbank INCLUDING CONTENTS CASCADE CONSTRAINTS;
/

CREATE TABLESPACE smartbank DATAFILE 
'd:\ORACLE\SB\Smartbank.ora' SIZE 2048 M  AUTOEXTEND ON NEXT 128M 
 ONLINE
 EXTENT MANAGEMENT LOCAL AUTOALLOCATE;
/
CREATE TABLESPACE smartIDX DATAFILE 
'd:\ORACLE\SB\SmartIdx.ora' SIZE 1024 M  AUTOEXTEND ON NEXT 128M 
 ONLINE
 EXTENT MANAGEMENT LOCAL AUTOALLOCATE;

/
CREATE USER SMART IDENTIFIED BY SM DEFAULT TABLESPACE smartbank TEMPORARY TABLESPACE TEMP
/
GRANT dba to SMART;
GRANT all privileges to SMART;

-- for oracle 9i
GRANT SELECT ON user$ TO smart;
GRANT SELECT ON v_$session TO smart;
GRANT execute ON dbms_lock TO smart;
GRANT execute ON dbms_alert TO smart;
GRANT select ON dba_role_privs TO smart;
GRANT select ON dba_roles TO smart;
GRANT select ON dba_synonyms TO smart;
GRANT select ON dba_sys_privs TO smart;
GRANT select ON dba_tab_privs TO smart;

--revoke restricted session from Smart



