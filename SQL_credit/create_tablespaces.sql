create tablespace smartbank
datafile '/OraHome/oracle/product/10.2.0/db_1/oradata/SB/SMARTBANK.ORA'
size 512M
autoextend on next 32M;  


create tablespace smartidx
datafile '/OraHome/oracle/product/10.2.0/db_1/oradata/SB/SMARTIDX.ORA'
size 512M
autoextend on next 32M;  

create tablespace smartcurrent
datafile '/OraHome/oracle/product/10.2.0/db_1/oradata/SB/smartcurrent.ORA'
size 256M
autoextend on next 32M;  


create tablespace depositscurrent
datafile '/OraHome/oracle/product/10.2.0/db_1/oradata/SB/depositscurrent.ORA'
size 50M
autoextend on next 32M; 


create tablespace ts_credits
datafile '/OraHome/oracle/product/10.2.0/db_1/oradata/SB/TS_CREDITS.ORA'
size 256M
autoextend on next 32M;  


create tablespace ts_credits_history
datafile '/OraHome/oracle/product/10.2.0/db_1/oradata/SB/TS_CREDITS_HISTORY.ORA'
size 256M
autoextend on next 32M;  


create tablespace ts_credits_idx
datafile '/OraHome/oracle/product/10.2.0/db_1/oradata/SB/TS_CREDITS_IDX.ORA'
size 256M
autoextend on next 32M;  


create tablespace creditcurrent
datafile '/OraHome/oracle/product/10.2.0/db_1/oradata/SB/creditcurrent.ORA'
size 256M
autoextend on next 32M;  


create tablespace cardmanager
datafile '/OraHome/oracle/product/10.2.0/db_1/oradata/SB/cardmanager.ORA'
size 50M
autoextend on next 32M; 

create tablespace salary
datafile '/OraHome/oracle/product/10.2.0/db_1/oradata/SB/salary.ORA'
size 50M
autoextend on next 32M;   



create user smart identified by sm
default tablespace smartbank
temporary tablespace temp;

grant all privileges to smart;
grant dba to smart;

create user creditsmgr identified by sm
default tablespace ts_credits
temporary tablespace temp;

grant all privileges to creditsmgr;
grant dba to creditsmgr;


