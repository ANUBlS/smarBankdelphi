-- Start of DDL Script for View SMART.XS_SENDINGBATCHS
-- Generated 18-May-2004 14:36:46 from SMART@ata

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
  FROM xs_batchs x, ACCOUNT a, avalute v
 WHERE x.acc_id = a.id
   AND v.valute = x.val_acc
   AND (x.send = 1)
   AND (x.status = 1)
   AND (x.transdate= xs_control.GetDefaultDate)
/

-- End of DDL Script for View SMART.XS_SENDINGBATCHS

-- Start of DDL Script for View SMART.XS_READYBATCHS
-- Generated 18-May-2004 14:36:46 from SMART@ata

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
  FROM xs_batchs x, ACCOUNT a, avalute v
 WHERE x.acc_id = a.id
   AND v.valute = x.val_acc
   AND (   (x.send IS NULL)
        OR (x.send = 0)
       )
   AND (transdate = xs_control.GetDefaultDate)
   AND (x.status = 1)
--   AND (xs_control.CheckReadingBatch (x.id, 1) = 1)
/

-- End of DDL Script for View SMART.XS_READYBATCHS


