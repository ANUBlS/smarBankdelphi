select a1.acc_id,a1.ostat, a1.pok_ostat, a2.ostat, a2.pok_ostat, a1.ostat-a2.ostat Delta, a1.pok_ostat-a2.pok_ostat pok_delta 
from archost a1, archost a2
where 
    a1.datdate=(select tek_dat from sysdat) 
and a2.datdate=(select pred_dat from sysdat) 
and a1.acc_id in 
(
select debt   id from provdoc
union
select kredit id from provdoc
)
and a1.acc_id=a2.acc_id

