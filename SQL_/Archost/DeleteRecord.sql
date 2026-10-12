declare 
dat date;
begin
 loop
 select min(datdate) into dat from archost;
 delete from archost where datdate=dat;
 commit;
 if dat>'31-dec-2003' then
  dbms_output.put_line('OK');
  return;
 else
 dbms_output.put_line(dat);
 end if;

 end loop;

end;
