--select * from v_balance1 where accountnumber='2311001011740100'
--and datdate >='10-jun-03'
select 
  a.accountnumber
,  a.accountid, a.datdate, a.ostat, a.pok_ostat,  o.ostat rate, o.ostat*a.ostat aaa, a.pok_ostat-o.ostat*a.ostat q
, a.obr_d, a.pok_obr_d, o.ostat*a.obr_d ddd , a.pok_obr_d-o.ostat*a.obr_d d
, a.obr_k, a.pok_obr_k, o.ostat*a.obr_k ccc , a.pok_obr_k-o.ostat*a.obr_k c 
from v_balance1 a, operkurs o
where 
(a.accountid=3064 or a.accountid=4630) 
--(a.accountnumber='8311001000010100' or a.accountnumber='4414001011150100')
and (a.datdate>='4-jun-03')
and o.dat=a.datdate and (o.val_kod=a.currencyid)
order by a.accountname , a.accountid,a.datdate
