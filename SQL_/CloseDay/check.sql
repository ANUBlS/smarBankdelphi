-- Check For Ostat=0 and Pok_ostat<>0
 select * from v_restCheck where ostat=0;
-- Check For Ostat*Rate<> Pok_ostat
 select * from v_restCheck where ostat<>0;
-- Check For Sum(28)<>Sum(48)
 select * from v_28_48Check;

-- Check For different beetvin rate tranzactions and real rate
select * from ratecheck

-- Check For Changed Rest with out Tranzaction
  select * from v_db_check 
   where 
     (delta_ostat<>0 or delta_pok_ostat<>0)
 and (Debit is null and Credit is null);

-- Check For fault Changed Rest with Tranzaction
  select * from v_db_check 
   where 
   (Debit is not null and Credit is not null)
   and  ( abs(delta_ostat    )<>(abs(nvl(d_amount ,0)-nvl(c_amount ,0)))
   or  abs(delta_pok_ostat)<>(abs(nvl(d_lamount,0)-nvl(c_lamount,0))));

-- Check For TurnOvers <> Sum Transactions
select * from v_db_check 
 where (
   Obr_d<>nvl(D_amount,0)
or Obr_K<>nvl(C_amount,0) 
or Pok_Obr_d<>nvl(D_Lamount,0) 
or Pok_Obr_k<>nvl(C_lamount,0));


