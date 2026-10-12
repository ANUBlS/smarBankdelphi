update sysdat set tek_dat='6-jun-3', pred_dat='5-jun-3',arc_day='4-jun-3';
Delete from lazytransaction;
Delete from provarch;
Delete from archost where datdate>'6-jun-3';
update archost set ostat=0,pok_ostat=0,obr_d=0,pok_obr_d=0,obr_k=0,pok_obr_k=0;
delete from lazyrest;
insert into lazyRest select * from archost where datdate=(select tek_dat from sysdat);
delete from operkurs where dat>(select tek_dat from sysdat);
delete from temprate;
insert into temprate select * from operkurs where dat=(select tek_dat from sysdat);

update archost set ostat=1000000, pok_ostat=1000000 where acc_id in (6383,6403,6467,6444);
update archost set ostat=1000, pok_ostat=1000*4921 where acc_id in  (6366,6367,6443,6469);
update archost set ostat=-4000000, pok_ostat=-4000000 where acc_id in (6483);
update archost set ostat=-4000, pok_ostat=-4000*4921 where acc_id in  (6524);


commit;

 

