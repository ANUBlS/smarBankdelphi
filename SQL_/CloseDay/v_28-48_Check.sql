create view v_28_48Check as
select 
(
select 
sum(pok_ostat)
from tenostat 
where acc_id in (
select id from account a where a.bal_cn1 like '48%' 
) 
) as B48
,
(
select 
sum(pok_ostat)
from tenostat 
where acc_id in (
select id from account a where a.bal_cn1 like '28%' 
) 
) B28
from dual

