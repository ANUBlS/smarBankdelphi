set serveroutput on;
spool KillAll.log
begin
	sb_session_mgr.KillAll('&1');
end;
/
quit