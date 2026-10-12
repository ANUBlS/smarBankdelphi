create view v_RestCheck as
select
 t.acc_id , 
 a.acc_no ,
 c.val_name ,
 a.val_acc ,
 t.datdate ,
 t.ostat ,
 t.pok_ostat ,
 o.ostat as Rate ,
 o.ostat * t.ostat - t.pok_ostat as Delta
from
 tenostat t,
 account a,
 operkurs o ,
 avalute_t c
where 
  t.acc_id = a.id and
  a.val_acc=o.val_kod and
  t.datdate=o.dat and
  c.valute=a.val_acc 
  and round(t.ostat*o.ostat,2)<>t.pok_ostat 
  and   abs(t.ostat*o.ostat - t.pok_ostat) >=0.01
--  and t.datdate between '16-may-2005' and '16-may-2005'  
order by 
  t.datdate ,a.acc_no
