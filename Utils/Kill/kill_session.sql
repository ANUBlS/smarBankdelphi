CREATE OR REPLACE PROCEDURE kill_session (session_id IN VARCHAR2,
   serial_num IN VARCHAR2)
AS
   cur INTEGER;
   ret INTEGER;
   string VARCHAR2(100);
BEGIN
   string := 'ALTER SYSTEM KILL SESSION' ||
             CHR (10) ||
             CHR (39) ||
             session_id ||
             ',' ||
             serial_num ||
             CHR (39);
-- string :=
--          'ALTER SYSTEM DISCONNECT SESSION' || CHR(10) ||
-- CHR(39)||session_id||','||serial_num||CHR(39)||CHR(10)||
--' POST_TRANSACTION';
   cur := DBMS_SQL.open_cursor;
   DBMS_SQL.parse (cur, string, DBMS_SQL.v7);
   ret := DBMS_SQL.execute (cur);
   DBMS_SQL.close_cursor (cur);
EXCEPTION
   WHEN OTHERS
   THEN
      raise_application_error (-20001, 'Error in execution', TRUE);
      IF DBMS_SQL.is_open (cur)
      THEN
         DBMS_SQL.close_cursor (cur);
      END IF;
END;
/