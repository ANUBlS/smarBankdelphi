declare 
startid  integer:=0;
endid integer:=10;
begin
 while endid<5000
  loop
   delete account where id between startid and endid;
   commit;
   startid:=endid;
   endid:=endid+10;  
  end loop;
 
end;



