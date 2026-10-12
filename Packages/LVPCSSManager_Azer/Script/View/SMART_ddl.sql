-- Start of DDL Script for View SMART.XS_BATCHS_SYSDAT
-- Generated 5-Feb-2007 19:54:00 from SMART@SBN

CREATE OR REPLACE VIEW xs_batchs_sysdat (
   id,
   f_id,
   opercode,
   acc_id,
   client_name,
   client_code,
   trans_ref,
   amount,
   val_acc,
   transdate,
   send,
   status,
   filial,
   transaction_id,
   client_inn,
   userid )
AS
select "ID","F_ID","OPERCODE","ACC_ID","CLIENT_NAME","CLIENT_CODE","TRANS_REF","AMOUNT","VAL_ACC","TRANSDATE","SEND","STATUS","FILIAL","TRANSACTION_ID","CLIENT_INN","USERID" from xs_batchs where transdate=sbop.Get_Date
/

-- Grants for View
GRANT SELECT ON xs_batchs_sysdat TO sbr_xohks
/

-- End of DDL Script for View SMART.XS_BATCHS_SYSDAT

-- Start of DDL Script for View SMART.XS_BATCHS_TODAY
-- Generated 5-Feb-2007 19:54:00 from SMART@SBN

CREATE OR REPLACE VIEW xs_batchs_today (
   id,
   f_id,
   opercode,
   acc_id,
   client_name,
   client_code,
   trans_ref,
   amount,
   val_acc,
   transdate,
   send,
   status,
   filial,
   transaction_id,
   client_inn,
   userid )
AS
select "ID","F_ID","OPERCODE","ACC_ID","CLIENT_NAME","CLIENT_CODE","TRANS_REF","AMOUNT","VAL_ACC","TRANSDATE","SEND","STATUS","FILIAL","TRANSACTION_ID","CLIENT_INN","USERID" from xs_batchs where transdate=to_date(sysdate)
/

-- Grants for View
GRANT SELECT ON xs_batchs_today TO sbr_xohks
/

-- End of DDL Script for View SMART.XS_BATCHS_TODAY

-- Start of DDL Script for View SMART.XS_BENEFICIARY_SYSDAT
-- Generated 5-Feb-2007 19:54:00 from SMART@SBN

CREATE OR REPLACE VIEW xs_beneficiary_sysdat (
   id,
   batchid,
   rec_bank_id,
   rec_bank_sub_acc,
   client_acc_no,
   client_name,
   client_code,
   client_inn,
   remit_inf,
   trans_cod,
   add_inf,
   val_date,
   val_cod,
   mess_reference,
   amount,
   bnfcount,
   status,
   transaction_id,
   userid )
AS
select "ID","BATCHID","REC_BANK_ID","REC_BANK_SUB_ACC","CLIENT_ACC_NO","CLIENT_NAME","CLIENT_CODE","CLIENT_INN","REMIT_INF","TRANS_COD","ADD_INF","VAL_DATE","VAL_COD","MESS_REFERENCE","AMOUNT","BNFCOUNT","STATUS","TRANSACTION_ID","USERID" from xs_beneficiary where val_date=sbop.get_date
/

-- Grants for View
GRANT SELECT ON xs_beneficiary_sysdat TO sbr_xohks
/

-- End of DDL Script for View SMART.XS_BENEFICIARY_SYSDAT

-- Start of DDL Script for View SMART.XS_BENEFICIARY_TODAY
-- Generated 5-Feb-2007 19:54:00 from SMART@SBN

CREATE OR REPLACE VIEW xs_beneficiary_today (
   id,
   batchid,
   rec_bank_id,
   rec_bank_sub_acc,
   client_acc_no,
   client_name,
   client_code,
   client_inn,
   remit_inf,
   trans_cod,
   add_inf,
   val_date,
   val_cod,
   mess_reference,
   amount,
   bnfcount,
   status,
   transaction_id,
   userid )
AS
select "ID","BATCHID","REC_BANK_ID","REC_BANK_SUB_ACC","CLIENT_ACC_NO","CLIENT_NAME","CLIENT_CODE","CLIENT_INN","REMIT_INF","TRANS_COD","ADD_INF","VAL_DATE","VAL_COD","MESS_REFERENCE","AMOUNT","BNFCOUNT","STATUS","TRANSACTION_ID","USERID" from xs_beneficiary where val_date=to_date(sysdate)
/

-- Grants for View
GRANT SELECT ON xs_beneficiary_today TO sbr_xohks
/

-- End of DDL Script for View SMART.XS_BENEFICIARY_TODAY

-- Start of DDL Script for View SMART.XS_READYBATCHS
-- Generated 5-Feb-2007 19:54:00 from SMART@SBN

CREATE OR REPLACE VIEW xs_readybatchs (
   id,
   f_id,
   opercode,
   acc_id,
   client_name,
   client_code,
   trans_ref,
   amount,
   val_acc,
   transdate,
   send,
   status,
   filial,
   transaction_id,
   client_inn,
   userid,
   acc_no,
   val_name )
AS
SELECT x.*, a.acc_no, v.val_name
  FROM xs_batchs x, ACCOUNT a, avalute_t v
 WHERE x.acc_id = a.id
   AND v.valute = x.val_acc
   AND (   (x.send IS NULL)  
        OR (x.send = 0)
       )
   AND (transdate = xs_control.GetDefaultDate)
   AND (x.status = 1)
--   AND (xs_control.CheckReadingBatch (x.id, 1) = 1)
/

-- Grants for View
GRANT SELECT ON xs_readybatchs TO sbr_xohks
/

-- End of DDL Script for View SMART.XS_READYBATCHS

-- Start of DDL Script for View SMART.XS_SENDINGBATCHS
-- Generated 5-Feb-2007 19:54:01 from SMART@SBN

CREATE OR REPLACE VIEW xs_sendingbatchs (
   id,
   f_id,
   opercode,
   acc_id,
   client_name,
   client_code,
   trans_ref,
   amount,
   val_acc,
   transdate,
   send,
   status,
   filial,
   transaction_id,
   client_inn,
   userid,
   acc_no,
   val_name )
AS
SELECT x.*, a.acc_no, v.val_name
  FROM xs_batchs x, ACCOUNT a, avalute_t v
 WHERE x.acc_id = a.id
   AND v.valute = x.val_acc
   AND (x.send = 1)
   AND (x.status = 1)
   AND (x.transdate= xs_control.GetDefaultDate)
/

-- Grants for View
GRANT SELECT ON xs_sendingbatchs TO sbr_xohks
/

-- End of DDL Script for View SMART.XS_SENDINGBATCHS

