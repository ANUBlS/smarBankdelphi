create tableSpace smartbank
datafile 'C:\Oracle\ORADATA\SBDNM\SMARTBANK.ORA'
size 512M
Autoextend ON Next 32M
/
create tableSpace SMARTIDX
datafile 'C:\Oracle\ORADATA\SBDNM\SMARTIDX.ORA.ORA'
size 512M
Autoextend ON Next 32M

/
create tableSpace TS_CREDITS
datafile 'C:\Oracle\ORADATA\SBDNM\TS_CREDITS.ORA'
size 512M
Autoextend ON Next 32M
/
create tableSpace TS_CREDITS_IDX
datafile 'C:\Oracle\ORADATA\SBDNM\TS_CREDITS_IDX.ORA'
size 128M
Autoextend ON Next 32M
/
create tableSpace TS_CREDITS_HISTORY
datafile 'C:\Oracle\ORADATA\SBDNM\TS_CREDITS_HISTORY.ORA'
size 128M
Autoextend ON Next 32M
/



