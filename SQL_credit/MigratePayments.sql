declare
  cursor c_new is 
  select ID , NumberOfCredit
    from cm_portfolio partition (activecredits) where Branchid = 0;
    
  cursor c_old(numb in varchar2) is
  select id from smart.sbcm_contracts 
    where contractno=numb;

  cursor c_old_tranches(oldID in integer) is
  select * 
    from smart.sbcm_payments
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
        insert into cm_payments(creditid, paydate, payedamt, payedintamt, payeddueamt,
         payeddueintamt, payedpenaltyamt, tridamt, tridintamt, triddueamt,
         triddueintamt, tridpenaltyamt, tridprimreserve, tridsecreserve,
         outtridobligation)
        values (n.id,ot.hdate,ot.facticaldebt,ot.interestdebt,ot.overduedebt,
        ot.overdueinterestdebt,0,null,null,null
        ,null,null,null,null,null);        
      end loop;
    end if;      
  end loop;
end;      
        
