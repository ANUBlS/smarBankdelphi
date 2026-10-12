-- Start of DDL Script for View SMART.ACCOUNT_INC
-- Generated 20-Apr-2005 11:42:05 from SMART@SB

CREATE OR REPLACE VIEW account_inc (
   id,
   kli_id,
   op_id,
   acc_no,
   val_acc,
   name,
   open_dat,
   close_dat,
   bal_cn1,
   bal_cn2,
   bal_cn3,
   bal_cn4,
   filial,
   sim_otcet,
   tipacc,
   limit,
   old_acc_no,
   pair_acc,
   insider,
   sid# )
AS
select "ID","KLI_ID","OP_ID","ACC_NO","VAL_ACC","NAME","OPEN_DAT","CLOSE_DAT","BAL_CN1","BAL_CN2","BAL_CN3","BAL_CN4","FILIAL","SIM_OTCET","TIPACC","LIMIT","OLD_ACC_NO","PAIR_ACC","INSIDER","SID#" from smart.account 
 where (filial in (select id from filial))
  or (bal_cn1=5501 and filial=0)
/


-- End of DDL Script for View SMART.ACCOUNT_INC

