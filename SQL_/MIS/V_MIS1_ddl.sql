-- Start of DDL Script for View SMART.V_MIS1
-- Generated 5-Sep-2004 22:53:15 from SMART@SB

-- Drop the old instance of V_MIS1
DROP VIEW v_mis1
/

CREATE OR REPLACE VIEW v_mis1 (
   type,
   val_name,
   id,
   kli_id,
   op_id,
   acc_no,
   val_acc,
   name,
   open_dat,
   close_dat,
   bal_cn1,
   filial,
   tipacc,
   ostat,
   pok_ostat,
   datdate,
   obr_d,
   obr_k,
   pok_obr_d,
   pok_obr_k,
   lastopdate,
   type#,
   opendate,
   closedate,
   amount,
   contractno,
   pledgetype,
   reliabilityid,
   clienttype,
   pledgeprice,
   sid#,
   overduereliabilityid,
   branchid )
AS
select 
--sbcm_deposit_Types t
--    ,t.id
    t.type
    ,v.val_name
--    ,t.additionaltype
--    ,t.withdrawtype
--    ,t.dateinterval
--  account a
    ,a.id
    ,a.kli_id
    ,a.op_id
    ,a.acc_no
    ,a.val_acc
    ,a.name
    ,a.open_dat
    ,a.close_dat
    ,a.bal_cn1
--    ,a.bal_cn2
--    ,a.bal_cn3
--    ,a.bal_cn4
    ,a.filial
 --   ,a.sim_otcet
    ,a.tipacc
--    ,a.limit
--    ,a.old_acc_no
--    ,a.pair_acc
--    ,a.insider
--    ,a.sid#
--archost ar
--    ,ar.id_number
--    ,ar.acc_id
    ,ar.ostat
    ,ar.pok_ostat
    ,ar.datdate
    ,ar.obr_d
    ,ar.obr_k
    ,ar.pok_obr_d
    ,ar.pok_obr_k
    ,ar.lastopdate
--sbcm_Contract_Accounts da
--    ,da.id#
--    ,da.contractaccid
--    ,da.clientaccid
--    ,da.reserveaccid
--    ,da.interestaccid
--    ,da.overdueaccid
--    ,da.overdueinterestaccid
--    ,da.overduereserveaccid
--sbcm_contracts d
--    ,d.id
    ,d.type#
    ,d.opendate
    ,d.closedate
    ,d.amount
    ,d.contractno
--    ,d.contracttype
    ,d.pledgetype
    ,d.reliabilityid
    ,d.clienttype
    ,d.pledgeprice
    ,d.sid#
    ,d.overduereliabilityid
    ,d.branchid
 from 
  sbcm_Contract_Accounts da
 ,sbcm_contracts d 
 ,account a
 ,sbcm_deposit_Types t
 ,archost ar
 ,avalute_t v
 where 
      da.id#=d.id 
  and da.contractaccid=a.id 
  and d.type#=3 
  and t.id=d.contracttype 
  and da.contractaccid=ar.acc_id 
--  and ar.datdate='26-jul-04'
  and v.valute=a.val_acc
/


-- End of DDL Script for View SMART.V_MIS1

