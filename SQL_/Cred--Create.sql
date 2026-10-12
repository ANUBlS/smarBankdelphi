create tableSpace TS_CREDITS
datafile 'D:\Oracle\ORADATA\SB\TS_CREDITS.ORA'
size 512M
Autoextend ON Next 32M
/
create tableSpace TS_CREDITS_IDX
datafile 'D:\Oracle\ORADATA\SB\TS_CREDITS_IDX.ORA'
size 128M
Autoextend ON Next 32M
/
create tableSpace TS_CREDITS_HISTORY
datafile 'D:\Oracle\ORADATA\SB\TS_CREDITS_HISTORY.ORA'
size 128M
Autoextend ON Next 32M
/
create User CreditsMgr
identified by sm
default tablespace TS_CREDITS
temporary tablespace TEMP
/
grant all privileges to CreditsMgr
/
grant DBA to CreditsMgr
/
----- Bunu buraxandan sonra Import elemek lazimdi


