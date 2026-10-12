declare 

cursor c_p is SELECT p.ID,
       cm_utils.get_creditplanprincipal (p.ID, '7-Jun-2007') AS principal,
       cm_utils.get_creditplaninterest (p.ID, '7-Jun-2007') AS interest,
       
        cm_utils.Get_FacticalCalcRate1(p.ID,'7-Jun-2007') as e,
       c.rest,
       cm_utils.get_ExpiresDateCount (p.ID) AS expdatcount
  FROM cm_active_credits p,
       cm_curr_state c 
 WHERE c.creditid = p.ID
   AND abs((cm_utils.Get_FacticalCalcRate1 (p.ID, '7-Jun-2007') - c.rest)) >=2
   and p.intcalcmethod = 0;
   --and cm_utils.get_creditplandate (p.ID, '7-Jun-2007') >0;
 
  c c_p%rowtype;
  pen number;
  
 begin
 
    for c in c_p 
    loop
      pen := (c.e-c.rest/100)*c.expdatcount;
      
      if pen > 0 then
      update cm_curr_state
      set PENALTYREST = pen
      where creditid = c.id;
      end if;
      
     end loop;
         
 end;
 

