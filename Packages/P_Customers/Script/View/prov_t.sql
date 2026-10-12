DROP VIEW prov_t
/

CREATE OR REPLACE VIEW prov_t (
   dat,
   debit,
   credit,
   ammount,
   lammount,
   ammount_c,
   name )
AS
select 
 p.dat,a1.acc_no as Debit,a2.acc_no as Credit,
  p.ammount,p.lammount,p.ammount_c,p.name
  
from provarch p, account a1, account a2
where 
 (p.debt=a1.id and p.kredit=a2.id)
/

