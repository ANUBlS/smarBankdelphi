--select * from v$session where username like '%E%';

declare
String varchar(3000);
session_id number;
serial_num number;
begin
session_id :=7;
serial_num :=180;

 string := 'ALTER SYSTEM KILL SESSION' ||
             CHR (10) ||
             CHR (39) ||
             session_id ||
             ',' ||
             serial_num ||
             CHR (39);
dbms_output.put_line(string);
execute immediate string;
end;
