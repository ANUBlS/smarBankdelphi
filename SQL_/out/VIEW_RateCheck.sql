CREATE OR REPLACE VIEW ratecheck (
   val_acc,
   ratepr,
   d$,
   ratetr,
   delta )
AS
select 
pr."VAL_ACC",pr."RATEPR"
,tr."D$",tr."RATETR"
,ratepr-ratetr Delta
from
(
select val_acc,max(rate_d) RatePr from provdoc
where
(id not in (select parentid from provdoc where parentid>0)) and
val_acc<>0
group by val_acc) pr,
(select val_kod D$,ostat RateTr from temprate) tr
where pr.val_acc --(+) 
=tr.D$

/*
select 
pr.*
,tr.*
,ratepr-ratetr Delta
from
(
select val_acc,max(rate_d) RatePr from provdoc
where
val_acc=currencyid_c 
and val_acc<>0 
group by val_acc
) pr,
(select val_kod D$,ostat RateTr from temprate) tr
where pr.val_acc --(+) 
=tr.D$

*/
/
