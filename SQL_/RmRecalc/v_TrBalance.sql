--create or replace view v_TrBalance as
select 
   a1.val_acc "$"
 , v.val_name
 , a1.acc_no
 , tr.*
 , ar1.ostat today
 , ar1.pok_ostat pok_toDay, ar2.ostat yesterday, ar2.pok_ostat pok_yesterday 
 , ar1.ostat - ar2.ostat as Delta
from
( 
 select 'd' f,debt as id
 ,sum(ammount) SumAmount
 from provdoc group by debt
 union 
 select 'c' f,kredit as id
 , sum(ammount_c) SumAmount
 from provdoc group by kredit
) tr
, archost ar1
, archost ar2
, account a1
, account a2
, avalute v
where
    tr.id= ar1.acc_id
and tr.id= ar2.acc_id
and ar1.datdate=(select tek_dat from sysdat)
and ar2.datdate=(select pred_dat from sysdat)
and tr.id=a1.id
and a1.id=a2.id
and v.valute=a1.val_acc
order by tr.id
