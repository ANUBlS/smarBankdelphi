-- Start of DDL Script for View SMART.V_BALANCE1
-- Generated 21-Jul-2003 11:56:31 from SMART@SB-CURRENT

CREATE OR REPLACE VIEW v_balance1 (
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
   close_dat,
   ratedifference,
   typeid,
   additionaltypeid,
   saldo,
   lastopdate,
   datdate,
   ostat,
   pok_ostat,
   obr_d,
   obr_k,
   pok_obr_d,
   pok_obr_k )
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
, ac.close_dat
, b.ratedifference
, b.typeid
, b.additionaltypeid
, b.saldo
, ar.lastopdate
, ar.datdate
, ar.ostat
, ar.pok_ostat
, ar.obr_d
, ar.obr_k
, ar.pok_obr_d
, ar.pok_obr_k
from
  account ac
, archost ar
, avalute av
, bal_spr1 b
, customers c

where
    ac.id=ar.acc_id
and ac.val_acc = av.valute
and ac.bal_cn1=b.bal_cn
and ac.kli_id=c.id
/

-- Create synonym V_BALANCE1
CREATE SYNONYM v_balance1
  FOR v_balance1
/


-- End of DDL Script for View SMART.V_BALANCE1

