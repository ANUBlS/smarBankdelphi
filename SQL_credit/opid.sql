declare
  cursor c_new is 
  select ID , NumberOfCredit
    from cm_portfolio;
    
  cursor c_old(numb in varchar2) is
  select id,sid# from smart.sbcm_contracts@sb 
    where contractno=numb;


  o c_old%rowtype;

  cfound boolean;
  u integer;
begin
  for n in c_new 
  loop
  
    open c_old(n.NumberOfCredit);
    fetch c_old into o;
    cfound := c_old%found;
    close c_old;
    
   select id into u from sb_user$ where
   name=(select obj from sba_objinf@sb where sysuserid = o.sid#);
   
   update cm_portfolio 
   set usid=u
   where id=n.id;
  end loop;
end;      
        
