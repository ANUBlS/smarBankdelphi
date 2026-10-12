CREATE OR REPLACE VIEW out_sba_transactions (
   id,
   operatorid,
   transactiondate,
   debitid,
   debitaccno,
   debitcurrencyid,
   debitcurrencysname,
   creditid,
   creditaccno,
   creditcurrencyid,
   creditcurrencysname,
   debitamount,
   creditamount,
   lamount,
   debitrate,
   creditrate,
   debitbank,
   creditbank,
   packagenumber,
   cyphercode,
   operationcode,
   inbalancechar,
   outbalancechar,
   filialid,
   debitbalance,
   name,
   flags,
   status,
   reject_reason )
AS
Select "ID","OPERATORID","TRANSACTIONDATE","DEBITID","DEBITACCNO","DEBITCURRENCYID","DEBITCURRENCYSNAME","CREDITID","CREDITACCNO","CREDITCURRENCYID","CREDITCURRENCYSNAME","DEBITAMOUNT","CREDITAMOUNT","LAMOUNT","DEBITRATE","CREDITRATE","DEBITBANK","CREDITBANK","PACKAGENUMBER","CYPHERCODE","OPERATIONCODE","INBALANCECHAR","OUTBALANCECHAR","FILIALID","DEBITBALANCE","NAME","FLAGS","STATUS","REJECT_REASON" 
from transactions
where
(OPERATORID<>-1 and 
not EXISTS(select SUSER from sba_userman where MUSER=uid and (type#=1 or type#=0)))
or
(OPERATORID in(select SUSER from sba_userman where MUSER=uid and (type#=1 or type#=0)))
/

GRANT SELECT ON out_sba_transactions TO sbr_transaction
/
GRANT SELECT ON out_sba_transactions TO sbr_transactionmanager
/

