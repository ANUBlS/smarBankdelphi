-- Start of DDL Script for View SMART.V_ACCOUNT1
-- Generated 16-Dec-2003 11:12:46 from SMART@SB

CREATE OR REPLACE VIEW v_account1 (
   customername,
   customervoin,
   customerid,
   accountname,
   accountnumber,
   accountid,
   currencyid,
   currencyname,
   balancecode,
   balancename,
   opendate,
   filial,
   close_dat,
   ratedifference,
   closebalance,
   typeid,
   additionaltypeid,
   saldo )
AS
select
  c.name       CustomerName
, c.inn        CustomerVoin
, ac.kli_id    CustomerId
, ac.name      AccountName
, ac.acc_no    AccountNumber
, ac.id        AccountId
, ac.val_acc   CurrencyId
, av.val_name  CurrencyName
, ac.bal_cn1   BalanceCode
, b.BalName    BalanceName
, ac.open_dat  OpenDate
, ac.filial    Filial
, ac.close_dat
, b.ratedifference
, b.CloseBalance
, b.typeid
, b.additionaltypeid
, b.saldo
--, ar.datdate
--, ar.lastopdate
--, ar.ostat
--, ar.pok_ostat
--, ar.obr_d
--, ar.obr_k
--, ar.pok_obr_d
--, ar.pok_obr_k
from
  account ac
--, archost ar
, avalute av
, bal_spr1 b
, customers c

where
--    ac.id=ar.acc_id
ac.val_acc = av.valute
and ac.bal_cn1=b.bal_cn
and ac.kli_id=c.id
/

-- Create synonym V_ACCOUNT1
CREATE SYNONYM v_account1
  FOR v_account1
/

-- End of DDL Script for View SMART.V_ACCOUNT1

