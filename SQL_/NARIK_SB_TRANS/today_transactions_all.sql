-- Start of DDL Script for View SMART.TODAY_TRANSACTIONS_ALL
-- Generated 30-Mar-2005 17:34:16 from SMART@TROYAN

CREATE OR REPLACE VIEW today_transactions_all (
   id,
   operatorid,
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
   transactionno,
   name,
   flags,
   status,
   reject_reason )
AS
SELECT
  p.ID,
	p.OP_ID as OperatorID,
  p.DEBT as DebitID,
  ad.ACC_NO as DebitAccNo,
  p.VAL_ACC as DebitCurrencyID,
  dc.val_name as DebitCurrencySName,
  p.KREDIT as CreditID,
  ac.ACC_NO as CreditAccNo,
  p.CurrencyID_C as CreditCurrencyID,
  cc.val_name as CreditCurrencySName,
  p.ammount as DebitAmount,
  p.Ammount_C as CreditAmount,
  p.LAmmount as LAmount,
  p.Rate_D as DebitRate,
  p.Rate_C as CreditRate,
  p.Bank_D as DebitBank,
  p.Bank_K as CreditBank,
  p.NO_PACK as PackageNumber,
  p.SHIFR as CYPHERCODE,
  p.VID_OP as OPERATIONCODE,
  p.Kassa_B as INBALANCECHAR,
  p.Kassa_Z as OUTBALANCECHAR,
  p.NO_FILIAL as FilialID,
  ad.bal_cn1 as DebitBalance,
  p.no_prov as TransactionNo, 
  p.Name,
	0 as Flags,
	2 as status,
	'' as REJECT_REASON
FROM
  provdoc p,
	account ad,
	account ac,
	avalute dc,
	avalute cc
where
  (ad.ID = p.DEBT)
	and (ac.ID = p.KREDIT)
  and (ad.val_acc = p.val_acc)
	and (ac.val_acc = p.CurrencyID_C)
	and (dc.VALUTE = p.val_acc)
	and (cc.VALUTE = p.CurrencyID_C)
union
SELECT
  p.ID,
	p.OP_ID as OperatorID,
  p.DEBT as DebitID,
  ad.ACC_NO as DebitAccNo,
  p.VAL_ACC as DebitCurrencyID,
  dc.val_name as DebitCurrencySName,
  p.KREDIT as CreditID,
  ac.ACC_NO as CreditAccNo,
  p.CurrencyID_C as CreditCurrencyID,
  cc.val_name as CreditCurrencySName,
  p.ammount as DebitAmount,
  p.Ammount_C as CreditAmount,
  p.LAmmount as LAmount,
  p.Rate_D as DebitRate,
  p.Rate_C as CreditRate,
  p.Bank_D as DebitBank,
  p.Bank_K as CreditBank,
  p.NO_PACK as PackageNumber,
  p.SHIFR as CYPHERCODE,
  p.VID_OP as OPERATIONCODE,
  p.Kassa_B as INBALANCECHAR,
  p.Kassa_Z as OUTBALANCECHAR,
  p.NO_FILIAL as FilialID,
  ad.bal_cn1 as DebitBalance, 
  p.no_prov as TransactionNo,  
  p.Name,
	0 as Flags,
	decode(Rejected, 0, 1, 3) as status,
	RejectReason as REJECT_REASON
FROM
  LAZYTRANSACTION p,
	account ad,
	account ac,
	avalute dc,
	avalute cc
where
  (ad.ID = p.DEBT)
	and (ac.ID = p.KREDIT)
	and (dc.VALUTE = p.val_acc)
	and (cc.VALUTE = p.CurrencyID_C)
	
union

SELECT
  p.ID,
	p.OperatorID, 
  p.DebitID,
  ad.ACC_NO as DebitAccNo,
  ad.VAL_ACC as DebitCurrencyID,
  dc.val_name as DebitCurrencySName,
  p.CreditID,
  ac.ACC_NO as CreditAccNo,
  ac.VAL_ACC as CreditCurrencyID,
  cc.val_name as CreditCurrencySName,
  p.DebitAmount as DebitAmount,
  p.CreditAmount as CreditAmount,
  p.LAmount as LAmount,
  p.Rate_D as DebitRate,
  p.Rate_C as CreditRate,
  p.Bank_D as DebitBank,
  p.Bank_K as CreditBank,
  p.NO_PACK as PackageNumber,
  p.SHIFR as CYPHERCODE,
  p.VID_OP as OPERATIONCODE,
  p.Kassa_B as INBALANCECHAR,
  p.Kassa_Z as OUTBALANCECHAR,
  p.FilialID as FilialID,
  ad.bal_cn1 as DebitBalance, 
  p.no_prov as TransactionNo,  
  p.TrName,
	p.Flags,
	4 as status,
	'' as REJECT_REASON
FROM
  temptranz p,
	account ad,
	account ac,
	avalute dc,
	avalute cc
where
  (ad.ID = p.DEBITID)
	and (ac.ID = p.CreditID)
	and (dc.VALUTE = ad.VAL_ACC)
	and (cc.VALUTE = ac.VAL_ACC)
/

-- End of DDL Script for View SMART.TODAY_TRANSACTIONS_ALL

