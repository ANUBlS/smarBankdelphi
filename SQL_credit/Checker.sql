select
 t.acc_id , 
 a.acc_no ,
 a.val_acc ,
 t.datdate ,
 t.ostat ,
 t.pok_ostat ,
 o.ostat as Rate ,
 o.ostat * t.ostat - t.pok_ostat as Delta
from
 archost t,
 account a,
 operkurs o
where 
  t.acc_id = a.id and
  a.val_acc=o.val_kod and
  t.datdate=o.dat and
  round(t.ostat*o.ostat,2)<>t.pok_ostat and
  t.datdate between '01-jun-2004' and '25-jun-2004'
  
order by 
  t.datdate ,a.acc_no   
