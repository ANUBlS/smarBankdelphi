declare

  cursor c_acc is
  select creditid,
         interestaccid,
         dueinterestaccid
    from cm_accounts
    where creditid in (select id from cm_active_credits where branchid =/*FilialID*/ and numberofcredit =' dsgr');
    
    cursor c_ostat(p_id in integer) is
    select abs(ostat) as ostat
    from sb_tenostat
    where acc_id=p_id;
    
    ostatinfo c_ostat%rowtype;
    irest number:=0;
    drest number:=0;
    
begin

   for acc in c_acc loop
     
      open c_ostat (acc.interestaccid);
      fetch c_ostat into ostatinfo;
      close c_ostat;

      
      irest := ostatinfo.ostat;

      open c_ostat (acc.dueinterestaccid);
      fetch c_ostat into ostatinfo;
      close c_ostat;
      
      drest := nvl(ostatinfo.ostat,0);
      
      update cm_curr_state
      set interestrest = irest,
           dueinterestrest =drest 
      where creditid=acc.creditid;
      
   
   end loop;
   
   
end;
