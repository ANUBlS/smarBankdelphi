declare
  cursor c_new is 
  select ID , NumberOfCredit
    from cm_portfolio partition (activecredits) where branchid=0;
    
  cursor c_old(numb in varchar2) is
  select id from smart.sbcm_contracts 
    where contractno=numb;

  cursor c_old_tranches(oldID in integer) is
  select * 
    from smart.sbcm_tranches
    where id#=oldid;

  o c_old%rowtype;
  ot c_old_tranches%rowtype;
  cfound boolean;
begin
  for n in c_new 
  loop
  
    open c_old(n.NumberOfCredit);
    fetch c_old into o;
    cfound := c_old%found;
    close c_old;
    
    if cfound then
      for ot in c_old_tranches(o.id)
      loop
        insert into cm_tranches(creditid, tranchedate, trancheamount, tranchetrid,
         reservetrid, obligationouttrid)
        values (n.id,ot.hdate,ot.total,null,null,null);        
      end loop;
    end if;      
  end loop;
end;      
        
