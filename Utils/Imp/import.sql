connect system/manager@sbdev2

set serverout on

@@DropSB.sql
@@CreateSB.sql '&1\ORADATA\&2\SMARTBANK.dbf'

discconnect
exit