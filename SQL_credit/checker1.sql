select 
 ac.acc_no ,
 ar.datdate ,
 ar.ostat ,
 ar.pok_ostat,
  ostat - pok_ostat as Delta
from 
archost ar ,
account ac
where 
  ar.acc_ID = ac.id and 
  ar.datdate between '17-may-2004' and '21-may-2004' and
  ac.val_acc=0 and
  ar.ostat <> ar.pok_ostat
  
