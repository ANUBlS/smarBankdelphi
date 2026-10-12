select * from account where bal_cn1 <5000 and id not in 
(
select acc_id from archost where 
ostat<>0 or pok_ostat<>0 or obr_d<>0 or obr_k<>0 or pok_obr_d<>0 or pok_obr_k<>0
)
order by bal_cn1

