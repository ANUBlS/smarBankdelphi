-- Start of DDL Script for View SMART.TRANS_KNN
-- Generated 17-Nov-2006 16:12:38 from SMART@SB

CREATE OR REPLACE VIEW trans_knn (
   id,
   transactiondate,
   debitid,
   debitaccno,
   debitname,
   no_prov,
   debitcurrencyid,
   debitcurrencysname,
   creditid,
   creditaccno,
   creditname,
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
   status,
   reject_reason )
AS
SELECT
  p.ID,
   p.dat as TransactionDate,
  p.DEBT as DebitID,
  ad.ACC_NO as DebitAccNo,
  ad.name as Debitname,
  p.NO_PROV as NO_PROV,
  p.VAL_ACC as DebitCurrencyID,
  dc.val_name as DebitCurrencySName,
  p.KREDIT as CreditID,
  ac.ACC_NO as CreditAccNo,
    ac.name as CreditName,
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
  p.Name,
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
  p.dat as TransactionDate,   
  p.DEBT as DebitID,
  ad.ACC_NO as DebitAccNo,
    ad.name as Debitname,
    p.NO_PROV,
  p.VAL_ACC as DebitCurrencyID,
  dc.val_name as DebitCurrencySName,
  p.KREDIT as CreditID,
  ac.ACC_NO as CreditAccNo,
    ac.name as Creditname,
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
  p.Name,
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
  and (ad.val_acc = p.val_acc)
	and (ac.val_acc = p.CurrencyID_C)
	and (dc.VALUTE = p.val_acc)
	and (cc.VALUTE = p.CurrencyID_C)
/


-- End of DDL Script for View SMART.TRANS_KNN


