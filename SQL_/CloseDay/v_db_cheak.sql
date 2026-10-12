--drop view v_db_check;
create or replace view v_db_check as
--select * from (

select 
  tt.acc_id
, tt.ostat-tp.ostat as Delta_ostat
, tt.obr_d 
, tt.obr_k 
, pr_D.D_amount
, Pr_C.C_amount
, ' ' s
,tt.pok_ostat-tp.pok_ostat as delta_pok_ostat
,tt.pok_obr_d
,tt.pok_obr_k
,pr_D.D_lamount
,pr_C.C_lamount
,pr_D.debt     debit  
,pr_C.kredit   Credit
from 
  tenostat tt
, tempost  tp 
, (select debt, sum(ammount) D_amount, sum(lammount) D_lamount from  provdoc pr group by debt)  pr_D
, (select kredit, sum(ammount_c) C_amount, sum(lammount) C_lamount from  provdoc pr group by kredit) pr_C
where
--    tt.pok_obr_d <>0
--and tt.pok_obr_k <>0    
--and 
tt.acc_id=tp.acc_id
and pr_D.debt(+)=tt.acc_id
and pr_C.kredit(+)=tt.acc_id

--) s where Debit is not null or Credit is not null 
