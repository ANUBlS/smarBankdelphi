select
  ac.acc_no   
, ac.id        
, ac.val_acc   
, ac.filial    
, ac.bal_cn1   
, ac.open_dat  
, ac.close_dat
, ar.lastopdate
, ar.datdate
, ar.ostat
, ar.pok_ostat
, ar.obr_d
, ar.obr_k
, ar.pok_obr_d
, ar.pok_obr_k
, ac.name   
from
  account ac
, archost ar
where
    ac.id=ar.acc_id
and ar.ostat=0 
and ar.pok_ostat<>0
