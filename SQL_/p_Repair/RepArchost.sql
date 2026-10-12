update archost a set 
a.pok_ostat=
a.ostat*
(
select o.ostat from operkurs o where a.datdate=o.dat and o.val_kod=
(
select ac.val_acc from account ac where ac.id=a.acc_id
)
)
 where a.datdate>='9-jun-03';
 
update archost a set 
a.pok_obr_D=
a.obr_D*
(select o.ostat from operkurs o where a.datdate=o.dat and o.val_kod=
(select ac.val_acc from account ac where ac.id=a.acc_id))
 where a.datdate>='9-jun-03';

update archost a set 
a.pok_obr_K=
a.obr_k*
(select o.ostat from operkurs o where a.datdate=o.dat and o.val_kod=
(select ac.val_acc from account ac where ac.id=a.acc_id))
 where a.datdate>='9-jun-03';

