-- Start of DDL Script for View SMART.V_PROVARCH1
-- Generated 16-Dec-2003 11:13:02 from SMART@SB

CREATE OR REPLACE VIEW v_provarch1 (
   id,
   op_id,
   d$,
   d$_name,
   d_currencyname,
   debitnumber,
   c$,
   c$_name,
   c$_currencyname,
   creditnumber,
   dat,
   debt,
   kredit,
   vid_op,
   amount_d,
   lamount,
   amount_c,
   d_ostat,
   d_pok_ostat,
   c_ostat,
   c_pok_ostat,
   kassa_b,
   kassa_z,
   bank_d,
   bank_k,
   rate_d,
   rate_c,
   parentid,
   name,
   d_obr_d,
   d_obr_k,
   d_pok_obr_d,
   d_pok_obr_k,
   c_obr_d,
   c_pok_obr_d,
   c_obr_k,
   c_pok_obr_k,
   d_bal,
   c_bal )
AS
select 
    p.id
 --  ,u.name UserName
   ,p.op_id
   ,p.val_acc d$
   ,av1.valu_short  D$_Name
   ,av1.valu_name  D_CurrencyName
   ,a1.acc_no debitnumber
   ,p.currencyid_c c$
   ,av2.valu_short  C$_Name
   ,av2.valu_name  C$_CurrencyName
   ,a2.acc_no creditnumber
--   ,p.no_prov
   ,p.dat
   ,p.debt
   ,p.kredit
   ,p.vid_op
--   ,p.no_doc
   ,p.ammount Amount_d
   ,p.lammount LAmount
   ,p.ammount_c Amount_C
   ,ar1.ostat      D_ostat 
   ,ar1.pok_ostat  D_pok_ostat
   ,ar2.ostat      C_ostat
   ,ar2.pok_ostat  C_pok_ostat
--   ,p.tim
--   ,p.shifr
--   ,p.no_pack
   ,p.kassa_b
   ,p.kassa_z
--   ,p.no_filial
--   ,p.sloj_prov
   ,p.bank_d
   ,p.bank_k
--   ,p.no_mem
--   ,p.d1
--   ,p.k1
   ,p.rate_d
   ,p.rate_c
   ,p.parentid
   ,p.name
--   ,ar1.id_number  D_id_number
--   ,ar1.acc_id     D_Acc_ID
--   ,ar2.acc_id     C_acc_id 
--   ,ar1.datdate    D_datdate
   ,ar1.obr_d      D_obr_d
   ,ar1.obr_k      D_obr_k
   ,ar1.pok_obr_d  D_pok_obr_d
   ,ar1.pok_obr_k  D_pok_obr_k
--   ,ar1.lastopdate D_lastopdate  
--   ,ar2.id_number  C_id_number
--   ,ar2.datdate    C_datdate
   ,ar2.obr_d      C_obr_d
   ,ar2.pok_obr_d  C_pok_obr_d 
   ,ar2.obr_k      C_obr_k
   ,ar2.pok_obr_k  C_pok_obr_k
   ,a1.bal_cn1     D_Bal 
   ,a2.bal_cn1     C_Bal
--   ,ar2.lastopdate C_lastopdate 
		
 from 
   provarch p
 , account a1
 , account a2 
 , archost ar1
 , archost ar2
 , avalute av1
 , avalute av2
 --, user$ u
   where 
     p.debt=a1.id 
 and p.kredit=a2.id
 and ar1.datdate=p.dat
 and ar2.datdate=p.dat
 and ar1.Acc_id=p.debt
 and ar2.Acc_id=p.kredit
 and p.val_acc=av1.valute
 and p.currencyid_c=av2.valute
 --and p.op_id=u.id
/

-- Create synonym V_PROVARCH1
CREATE SYNONYM v_provarch1
  FOR v_provarch1
/

-- End of DDL Script for View SMART.V_PROVARCH1

