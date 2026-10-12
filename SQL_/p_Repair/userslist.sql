select * from sys.v_$session
where program = (select program from sys.v_$session where audsid=userenv('SESSIONJID'))
