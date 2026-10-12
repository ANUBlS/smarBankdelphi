ALTER TABLE provarch
ADD CONSTRAINT chk_provarch CHECK (DEBT<>KREDIT)
/

ALTER TABLE provarch
ADD CONSTRAINT chk_provarch1 
CHECK ((AMMOUNT<>0)OR(AMMOUNT_C<>0)OR(LAMMOUNT<>0))
/

ALTER TABLE archost 
ADD CONSTRAINT chk_ArchOst
CHECK (((ostat<>0) and (Pok_ostat<>0)) OR ((Ostat=0) and (Pok_ostat=0))  )
/
/*
update provarch set ammount_c=ammount where id in(
select id from provarch where (
(val_acc=currencyid_c) 
and (ammount<>ammount_c)
)
)
*/

ALTER TABLE provarch ADD CONSTRAINT chk_provarch2 CHECK 
((
(val_acc=currencyid_c) 
and (ammount=ammount_c)
) 
or (val_acc<>currencyid_c))

