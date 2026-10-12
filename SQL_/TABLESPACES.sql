create tablespace smartbank datafile
'D:\app\Administrator\oradata\nonunic\SMARTBANK.ORA' size 512 m
autoextend on
online
/
create tablespace smartidx datafile
'D:\app\Administrator\oradata\nonunic\SMARTIDX.ORA' size 256 m
autoextend on
online
/
create tablespace SALARY datafile
'D:\app\Administrator\oradata\nonunic\SALARY.ORA' size 16 m
autoextend on
online
/
create user SMART identified by s6c457f61
default tablespace SMARTBANK temporary tablespace TEMP
/
GRANT all privileges to smart;
grant dba to smart;
