REM
REM ORA_KILL.SQL
REM FUNCTION: Kills non-essential Oracle sessions (those that aren't owned
REM         : by SYS or "NULL" 
REM DEPENDANCIES: Depends on kill_session procedure
REM
SET HEADING OFF TERMOUT OFF VERIFY OFF ECHO OFF
SPOOL kill_all.sql
SELECT 'EXECUTE kill_session(' ||
       CHR (39) ||
       sid ||
       CHR (39) ||
       ',' ||
       CHR (39) ||
       serial# ||
       CHR (39) ||
       ');'
FROM   v$session
WHERE  username IS NOT NULL
    OR username <> 'SYS'
/
SPOOL OFF
START kill_all.sql
