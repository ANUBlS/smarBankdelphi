-- Start of DDL Script for View SMART.RATECHECK
-- Generated 15-Apr-2004 2:25:36 from SMART@SBNEW

CREATE OR REPLACE VIEW ratecheck (
   val_acc,
   ratepr,
   d$,
   ratetr,
   delta )
AS
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
/

-- End of DDL Script for View SMART.RATECHECK


