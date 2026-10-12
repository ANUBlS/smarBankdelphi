
select * from account where id=4462;
--2416500
select * from archost where acc_id=4462 order by datdate;
select * from provarch where dat='11-Jul-2003' and (debt =4462 or kredit=4462)
select * from archost where (acc_id=4462 or acc_id=4527) and datdate='11-Jul-2003';
select * from provarch where (debt=4462 or kredit=4462) and dat='11-Jul-2003';

--update archost set 
--pok_ostat=pok_ostat+2416500, ostat=ostat+2416500 
-- where acc_id=2415 and datdate='11-jun-03'


