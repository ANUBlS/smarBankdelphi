select debt, kredit,dat
, val_acc
, currencyid_c
, ammount,Lammount
, ammount_c
, name
--,(select ostat from operkurs where provarch.dat=dat and 1=val_kod) rate

from provarch where 
id>0
--and vid_op between 1 and 3 
--and val_acc = 0
--and currencyid_c=0
--and ammount<>ammount_c
order by dat
--,vid_op
--select 2661701.91/547441.15 from dual

--update provarch set vid_op=3 where name ='ћ€з€нн€ ф€рги'
--select name from provarch where name is not null and vid_op is null
--select name, vid_op from provarch where vid_op is not null order by vid_op desc
