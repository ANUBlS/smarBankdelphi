-- Start of DDL Script for View SMART.EXCONVERT
-- Generated 3-Nov-2004 17:15:49 from SMART@sbDEV

CREATE OR REPLACE VIEW exconvert (
   id,
   dat,
   kassa_z,
   debt,
   kredit,
   val_acc,
   currencyid_c,
   ammount,
   ammount_c,
   lammount,
   rate_d,
   rate_c,
   dacc_no,
   kacc_no,
   ostat )
AS
SELECT DISTINCT pr.id, pr.dat, pr.kassa_z, pr.debt, pr.kredit, pr.val_acc,
                pr.currencyid_c, pr.ammount, pr.ammount_c, pr.lammount,
                pr.rate_d, pr.rate_c, a1.acc_no AS dacc_no,
                a2.acc_no AS kacc_no,
                DECODE (pr.rate_d, 1, pr.rate_c, pr.rate_d) AS ostat
           FROM provarch pr, ACCOUNT a1, ACCOUNT a2, convert_assignments c
          WHERE (pr.val_acc <> pr.currencyid_c)
            AND pr.debt = a1.id
            AND pr.kredit = a2.id
            AND a1.bal_cn1 IN
                          (SELECT bal_cn
                             FROM bal_spr1
                            WHERE cashincoming = 0)
            AND a2.bal_cn1 IN
                          (SELECT bal_cn
                             FROM bal_spr1
                            WHERE cashincoming = 0)
            AND pr.kassa_z = c.id
       ORDER BY pr.dat
/

-- Grants for View
GRANT SELECT ON exconvert TO sbr_exchange
/

-- End of DDL Script for View SMART.EXCONVERT

-- Start of DDL Script for View SMART.EXCHANGE_SELLS
-- Generated 3-Nov-2004 17:15:49 from SMART@sbDEV

CREATE OR REPLACE VIEW exchange_sells (
   selldate,
   currency,
   currencyname,
   intercode,
   sellammount,
   sellequivalent,
   sellrate,
   minsellrate,
   maxsellrate,
   sellcount )
AS
Select 
 dat as SellDate,
 currency,
 currencyname,
 intercode,
 sum(ammount) as SellAmmount,
 sum(ammount)*Round(sum(rate)/count(rate),2) as SellEquivalent,
 Round(sum(rate)/count(rate),2) as SellRate, 
 Min(rate) as MinSellRate,
 Max(rate) as MaxSellRate,
 count(*) as SellCount
From Exchange_Sell

Group by dat, currency, currencyname, intercode
/


-- End of DDL Script for View SMART.EXCHANGE_SELLS

-- Start of DDL Script for View SMART.EXCHANGE_SELL
-- Generated 3-Nov-2004 17:15:49 from SMART@sbDEV

CREATE OR REPLACE VIEW exchange_sell (
   dat,
   currencyname,
   currency,
   intercode,
   debt,
   kredit,
   ammount,
   lammount,
   rate,
   name )
AS
select 
  P.dat,
  A.val_name as CurrencyName,
  P.currencyid_c as Currency,
  A.valu_inter as InterCode,
  P.debt,
  P.kredit,
  P.ammount_c as Ammount,
  P.ammount_c * P.rate_c as Lammount,
  P.rate_c as Rate,
  P.name   
from 
  provarch P,
  avalute A 
where 
    (P.kredit in (select ID from account where bal_cn1=(Select for_balance From SetExchange))
    and
    P.debt in  (select  ID from account where bal_cn1=(Select nat_balance From SetExchange)))
    and
    P.currencyid_c = A.valute
/


-- End of DDL Script for View SMART.EXCHANGE_SELL

-- Start of DDL Script for View SMART.EXCHANGE_KREDIT
-- Generated 3-Nov-2004 17:15:49 from SMART@sbDEV

CREATE OR REPLACE VIEW exchange_kredit (
   id,
   op_id,
   no_prov,
   dat,
   debt,
   kredit,
   val_acc,
   vid_op,
   ammount,
   lammount,
   tim,
   shifr,
   no_pack,
   kassa_b,
   kassa_z,
   no_filial,
   sloj_prov,
   bank_d,
   bank_k,
   no_doc,
   no_mem,
   d1,
   k1,
   rate_d,
   rate_c,
   parentid,
   currencyid_c,
   ammount_c,
   name,
   commit_opid,
   valu_inter )
AS
select P.*,A.valu_inter From Provarch P,Avalute A
where (P.kredit in (select ID from account where bal_cn1=(Select for_balance From SetExchange))and
      P.debt in  (select  ID from account where bal_cn1=(Select nat_balance From SetExchange)))and 
			(val_acc<>currencyid_c) and P.currencyID_c=A.valute
/


-- End of DDL Script for View SMART.EXCHANGE_KREDIT

-- Start of DDL Script for View SMART.EXCHANGE_DEBT
-- Generated 3-Nov-2004 17:15:49 from SMART@sbDEV

CREATE OR REPLACE VIEW exchange_debt (
   id,
   op_id,
   no_prov,
   dat,
   debt,
   kredit,
   val_acc,
   vid_op,
   ammount,
   lammount,
   tim,
   shifr,
   no_pack,
   kassa_b,
   kassa_z,
   no_filial,
   sloj_prov,
   bank_d,
   bank_k,
   no_doc,
   no_mem,
   d1,
   k1,
   rate_d,
   rate_c,
   parentid,
   currencyid_c,
   ammount_c,
   name,
   commit_opid,
   valu_inter )
AS
select P.*,A.valu_inter 
 from provarch P,avalute a 
 where (P.debt in (select  ID from account where bal_cn1=(Select for_balance From SetExchange)) and
       P.kredit in (select  ID from account where bal_cn1=(Select nat_balance From SetExchange)))and 
 val_acc<>currencyid_c and P.val_acc=A.valute
/


-- End of DDL Script for View SMART.EXCHANGE_DEBT

-- Start of DDL Script for View SMART.EXCHANGE_BUYS
-- Generated 3-Nov-2004 17:15:49 from SMART@sbDEV

CREATE OR REPLACE VIEW exchange_buys (
   buydate,
   currency,
   currencyname,
   intercode,
   buyammount,
   buyequivalent,
   buyrate,
   minbuyrate,
   maxbuyrate,
   buycount )
AS
Select 
 dat as BuyDate,
 currency,
 currencyname,
 intercode,
 sum(ammount) as BuyAmmount,
 sum(ammount)*Round(sum(rate)/count(rate),2) as BuyEquivalent,
 Round(sum(rate)/count(rate),2) as BuyRate, 
 Min(rate) as MinBuyRate,
 Max(rate) as MaxBuyRate,
 count(*) as BuyCount
From Exchange_Buy

Group by dat, currency, currencyname, intercode
/


-- End of DDL Script for View SMART.EXCHANGE_BUYS

-- Start of DDL Script for View SMART.EXCHANGE_BUY
-- Generated 3-Nov-2004 17:15:49 from SMART@sbDEV

CREATE OR REPLACE VIEW exchange_buy (
   dat,
   currencyname,
   currency,
   intercode,
   debt,
   kredit,
   ammount,
   lammount,
   rate,
   name )
AS
select 
  P.dat,
  A.val_name as CurrencyName,
  P.val_acc as Currency,
  A.valu_inter as InterCode,
  P.debt,
  P.kredit,
  P.ammount,
  P.ammount * P.rate_d as Lammount,
  P.rate_d as Rate,
  P.name   
from 
  provarch P,
  avalute A 
where 
    (P.debt in (select  ID from account where bal_cn1=(Select for_balance From SetExchange)) 
    and
    P.kredit in (select  ID from account where bal_cn1=(Select nat_balance From SetExchange)))
    and
    P.val_acc = A.valute
/


-- End of DDL Script for View SMART.EXCHANGE_BUY

-- Start of DDL Script for View SMART.EXCHANGE
-- Generated 3-Nov-2004 17:15:49 from SMART@sbDEV

CREATE OR REPLACE VIEW exchange (
   dat,
   currency,
   currencyname,
   intercode,
   buyrate,
   buyammount,
   buyequivalent,
   minbuyrate,
   maxbuyrate,
   buycount,
   sellrate,
   sellammount,
   sellequivalent,
   minsellrate,
   maxsellrate,
   sellcount )
AS
select 
   B.BuyDate as Dat,
   B.Currency,
   B.CurrencyName,
   B.InterCode,
   B.BuyRate,
   B.BuyAmmount,
   B.BuyEquivalent,
   B.MinBuyRate,
   B.MaxBuyRate,
   B.BuyCount,
   S.SellRate,
   S.SellAmmount,
   S.SellEquivalent,
   S.MinSellRate,
   S.MaxSellRate,
   S.SellCount
from
   Exchange_Buys B,
   Exchange_Sells S
where
   B.Currency = S.Currency (+) 
   and
   B.BuyDate = S.SellDate (+)
   
UNION

select 
   S.SellDate as Dat,
   S.Currency,
   S.CurrencyName,
   S.InterCode,
   B.BuyRate,
   B.BuyAmmount,
   B.BuyEquivalent,
   B.MinBuyRate,
   B.MaxBuyRate,
   B.BuyCount,
   S.SellRate,
   S.SellAmmount,
   S.SellEquivalent,
   S.MinSellRate,
   S.MaxSellRate,
   S.SellCount
from
   Exchange_Buys B,
   Exchange_Sells S
where
   B.Currency (+) = S.Currency
   and
   B.BuyDate (+) = S.SellDate
/


-- End of DDL Script for View SMART.EXCHANGE

-- Start of DDL Script for View SMART.CONVERTSELL
-- Generated 3-Nov-2004 17:15:49 from SMART@sbDEV

CREATE OR REPLACE VIEW convertsell (
   val_acc,
   dat,
   val_name,
   infs,
   sups,
   averages,
   sums,
   counts )
AS
Select
   val_acc,
   dat,
   A.val_name,
   min(rate_d) as infS,
   max(rate_d) as supS,
   sum(rate_d*ammount)/sum(ammount) as averageS,
   sum(ammount) / 1000 as SumS ,
   count(*)  as countS
From
   ExConvert,
   Avalute A
Where
   val_acc<>0 and
     A.valute=val_acc 

Group by val_acc,dat,A.val_name
/

-- Grants for View
GRANT SELECT ON convertsell TO sbr_exchange
/

-- End of DDL Script for View SMART.CONVERTSELL

-- Start of DDL Script for View SMART.CONVERTBUY
-- Generated 3-Nov-2004 17:15:49 from SMART@sbDEV

CREATE OR REPLACE VIEW convertbuy (
   currencyid_c,
   dat,
   val_name,
   infb,
   supb,
   averageb,
   sumb,
   countb )
AS
Select
   currencyID_c,
   dat,
   A.val_name,
   min(rate_c) as infB,
   max(rate_c) as supB,
   sum(rate_c*ammount_c)/sum(ammount_c) as averageB,
   sum(ammount_c) / 1000 as SumB,
   count(*) as countB
From
  ExConvert,
  Avalute A
Where
   currencyID_c<>0 and
    A.valute=currencyID_c

Group by currencyID_c,dat,A.val_name
/

-- Grants for View
GRANT SELECT ON convertbuy TO sbr_exchange
/

-- End of DDL Script for View SMART.CONVERTBUY

-- Start of DDL Script for View SMART.CONVERTATION_1
-- Generated 3-Nov-2004 17:15:49 from SMART@sbDEV

CREATE OR REPLACE VIEW convertation_1 (
   id,
   dat,
   debt,
   kredit,
   debitaccount,
   debitcurrency,
   debitcurrencyname,
   debitrate,
   creditaccount,
   creditcurrency,
   creditcurrencyname,
   creditrate,
   debitamount,
   creditamount,
   lammount,
   operationrate,
   name,
   fullpath,
   status )
AS
select 
   transactionAA.ID  
  ,transactionAA.dat
  ,transactionAA.debt
  ,transactionAA.kredit
  ,debit.acc_no as debitaccount
  ,debit.val_acc as debitcurrency
  ,DebitCurrency.val_name as debitcurrencyname
  ,transactionAA.rate_d as DebitRate
  ,Credit.acc_no as creditaccount
  ,Credit.val_acc as creditcurrency
  ,CreditCurrency.val_name as creditcurrencyname
  ,transactionAA.rate_c as CreditRate
  ,transactionAA.ammount as debitamount  
  ,transactionAA.ammount_c as creditamount  
  ,transactionAA.lammount  
  ,decode(transactionAA.val_acc,0,rate_c,rate_d) as operationrate
  ,transactionAA.Name
  ,assignments.Fullpath
  ,decode(transactionAA.currencyID_c,0,'BUY','SELL') as status
from 
  provarch transactionAA
 ,convert_assignments Assignments
 ,Account Debit
 ,Account Credit
 ,Avalute DebitCurrency
 ,Avalute CreditCurrency 
where 
  transactionAA.debt = debit.ID
   and transactionAA.kredit = credit.ID  
   and transactionAA.kassa_z = Assignments.ID
   and transactionAA.val_acc = DebitCurrency.valute 
   and transactionAA.currencyID_c = CreditCurrency.valute 
   and transactionAA.val_acc <>transactionAA.currencyID_c --Ia?u i?aainoi?i?iinoe  

order by 
  transactionAA.dat
 ,creditcurrency
/


-- End of DDL Script for View SMART.CONVERTATION_1

-- Start of DDL Script for View SMART.CONVERTATION
-- Generated 3-Nov-2004 17:15:49 from SMART@sbDEV

CREATE OR REPLACE VIEW convertation (
   id,
   cid,
   dat,
   debt,
   kredit,
   debitaccount,
   debitcurrency,
   debitcurrencyname,
   debitrate,
   creditaccount,
   creditcurrency,
   creditcurrencyyname,
   creditrate,
   debitamount,
   creditamount,
   lammount,
   operationrate,
   name,
   fullpath,
   status )
AS
select 
   transaction.ID
  ,transaction.kassa_z as cID   
  ,transaction.dat
  ,transaction.debt
  ,transaction.kredit
  ,debit.acc_no as debitaccount
  ,debit.val_acc as DebitCurrency
  ,DebitCurrency.val_name as DebitCurrencyname
  ,transaction.rate_d as DebitRate
  ,Credit.acc_no as creditaccount
  ,Credit.val_acc as CreditCurrency
  ,CreditCurrency.val_name as CreditCurrencyyname
  ,transaction.rate_c as CreditRate
  ,transaction.ammount as debitamount  
  ,transaction.ammount_c as creditamount  
  ,transaction.lammount  
  ,decode(transaction.val_acc,0,rate_c,rate_d) as operationrate
  ,transaction.Name
  ,assignments.Fullpath
  ,decode(transaction.currencyID_c,0,'BUY','SELL') as status
from 
  provarch transaction
 ,convert_assignments Assignments
 ,Account Debit
 ,Account Credit
 ,Avalute DebitCurrency
 ,Avalute CreditCurrency
where 
  transaction.debt = debit.ID
   and transaction.kredit = credit.ID  
   and Debit.bal_cn1 in(Select bal_cn From bal_spr1 Where cashincoming =0)
   and Credit.bal_cn1 in(Select bal_cn From bal_spr1 Where cashincoming =0)
   and transaction.kassa_z = Assignments.ID
   and transaction.val_acc = DebitCurrency.valute 
   and transaction.currencyID_c = CreditCurrency.valute 
   and transaction.val_acc <>transaction.currencyID_c --Dangerous  

order by 
  transaction.dat
 ,Credit.val_acc
 ,transaction.kassa_z
/


-- End of DDL Script for View SMART.CONVERTATION

-- Start of DDL Script for View SMART.COMMON_EXCHANGE
-- Generated 3-Nov-2004 17:15:49 from SMART@sbDEV

CREATE OR REPLACE VIEW common_exchange (
   transactionid,
   operationdate,
   daccid,
   daccount,
   dbalance,
   dcurrency,
   dvalname,
   caccid,
   caccount,
   cbalance,
   ccurrency,
   cvalname,
   ammount,
   ammount_c,
   lammount,
   drate,
   crate,
   course )
AS
Select
  Transactions.ID TransactionID,
   Transactions.dat OperationDate,
    Debt.ID DAccID,Debt.acc_no DAccount,Debt.bal_cn1 DBalance,Transactions.val_acc DCurrency,DValute.val_name DValname,
     Credit.ID CAccID,Credit.acc_no CAccount,Credit.bal_cn1 CBalance,Transactions.currencyID_c CCurrency,CValute.val_name CValname,
      Transactions.Ammount,Transactions.Ammount_c,Transactions.Lammount,
       Transactions.Rate_d DRate,Transactions.Rate_c CRate,Courses.Ostat Course
From
   Provarch  Transactions
  ,Account  Debt
  ,Account  Credit
  ,Avalute DValute
  ,Avalute CValute
  ,Operkurs Courses
Where
  Transactions.debt = Debt.ID and
   Transactions.kredit = Credit.ID and
    (Transactions.dat = Courses.dat) and
     (Debt.bal_cn1 = (select nat_balance from SetExchange) or
       Debt.bal_cn1 = (select for_balance from SetExchange)) and
       (Credit.bal_cn1 = (select nat_balance from SetExchange) or
         Credit.bal_cn1 = (select for_balance from SetExchange)) and
          (Transactions.val_acc=DValute.valute and Transactions.currencyID_c=CValute.valute) and
           ((Transactions.val_acc = Courses.val_kod and Courses.ostat <> 1 )or
            (Transactions.currencyID_c = Courses.val_kod and Courses.ostat <> 1)) --and
            -- (Transactions.dat>=:BeginDate) and (Transactions.dat<=:EndDate)
Order by
   Transactions.dat
    ,Transactions.Lammount
/


-- End of DDL Script for View SMART.COMMON_EXCHANGE

-- Start of DDL Script for View SMART.CLOSE_PROFITS_ACCS
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW close_profits_accs (
   id,
   acc_no,
   val_acc,
   val_name,
   f5501p,
   f5501v,
   ostat,
   pok_ostat,
   bal_cn1 )
AS
SELECT
  a.id
, a.acc_no
, a.val_acc
, v.val_name
, v.f5501p
, v.f5501v
, t.ostat
, t.pok_ostat
, a.BAL_CN1
FROM
  ACCOUNT a
, Tenostat t
, BAL_SPR1 B
, avalute v

WHERE
    a.id=t.acc_id
and t.ostat<>0
and a.BAL_CN1 = b.BAL_CN
and b.CloseBalance = 1
and a.close_dat is Null
and a.Val_acc=v.valute
/

-- Grants for View
GRANT SELECT ON close_profits_accs TO sbr_profitclosing
/

-- End of DDL Script for View SMART.CLOSE_PROFITS_ACCS

-- Start of DDL Script for View SMART.CLOSE_PROFITS_ACCS_OLD
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW close_profits_accs_old (
   id,
   acc_no,
   val_acc,
   val_name,
   f5501p,
   f5501v,
   ostat,
   pok_ostat,
   bal_cn1 )
AS
SELECT
  a.id
, a.acc_no
, a.val_acc
, v.val_name
, v.f5501p
, v.f5501v
, t.ostat
, t.pok_ostat
, a.BAL_CN1
FROM
  ACCOUNT partition (ActivAcc) a
, Tenostat t
, BAL_SPR1 B
, avalute v

WHERE
    a.id=t.acc_id
and t.ostat<>0
and a.BAL_CN1 = b.BAL_CN
and b.CloseBalance = 1
--and a.close_dat is Null 
and a.Val_acc=v.valute
/


-- End of DDL Script for View SMART.CLOSE_PROFITS_ACCS_OLD

-- Start of DDL Script for View SMART.BUY
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW buy (
   bvalyuta_kodu,
   mbcod,
   btarix,
   bxarici_valyuta,
   bmanat_ekvivalenti,
   alish_kursu,
   buycount )
AS
Select 
 val_acc as BValyuta_kodu,
 valu_inter as MBcod,	
 dat as BTarix,
 sum(ammount) as BXarici_valyuta,
 sum(ammount)*sum(rate_d)/count(rate_d) as BManat_ekvivalenti,
 sum(rate_d)/count(rate_d)as Alish_kursu, 
 count(*) as BuyCount
From Exchange_debt

Group by val_acc,valu_inter,dat
/

-- Grants for View
GRANT SELECT ON buy TO sbr_exchange
/

-- End of DDL Script for View SMART.BUY

-- Start of DDL Script for View SMART.AGIL_ACCOUNTS
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW agil_accounts (
   id,
   kli_id,
   op_id,
   user_name,
   acc_no,
   val_acc,
   valute,
   name,
   open_dat,
   close_dat,
   bal_cn1,
   bal_cn2,
   bal_cn3,
   bal_cn4,
   filial,
   sim_otchet,
   tipacc,
   limit,
   old_acc_no,
   pair_acc,
   insider,
   sid# )
AS
SELECT 
   a.id, kli_id, op_id, u.name, acc_no, val_acc, v.val_name, a.name, open_dat, close_dat, bal_cn1, bal_cn2, bal_cn3,
   bal_cn4, filial, sim_otcet, tipacc, a.limit, old_acc_no, pair_acc, insider, sid#
FROM 
   ACCOUNT a, USER$ u, AVALUTE v
WHERE
   u.ID = a.OP_ID
AND 
   a.VAL_ACC = v.VALUTE
ORDER BY 
   a.ID desc
/


-- End of DDL Script for View SMART.AGIL_ACCOUNTS

-- Start of DDL Script for View SMART.ACCOUNT_ALL
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW account_all (
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
/


-- End of DDL Script for View SMART.ACCOUNT_ALL

-- Start of DDL Script for View SMART.ACCOUNTS_OWN
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW accounts_own (
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
select
 "ID","KLI_ID","OP_ID","ACC_NO","VAL_ACC","NAME","OPEN_DAT","CLOSE_DAT","BAL_CN1","BAL_CN2","BAL_CN3","BAL_CN4","FILIAL","SIM_OTCET","TIPACC","LIMIT","OLD_ACC_NO","PAIR_ACC","INSIDER","SID#"
from account
where 
filial = 62
/


-- End of DDL Script for View SMART.ACCOUNTS_OWN

-- Start of DDL Script for View SMART.ACCOUNTS_MAIN_OFFICE
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW accounts_main_office (
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
select
 "ID","KLI_ID","OP_ID","ACC_NO","VAL_ACC","NAME","OPEN_DAT","CLOSE_DAT","BAL_CN1","BAL_CN2","BAL_CN3","BAL_CN4","FILIAL","SIM_OTCET","TIPACC","LIMIT","OLD_ACC_NO","PAIR_ACC","INSIDER","SID#"
from account
where 
filial = 0
/


-- End of DDL Script for View SMART.ACCOUNTS_MAIN_OFFICE

-- Start of DDL Script for View SMART.ACCOUNTS_FOR_CLOSE_BALANSE
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW accounts_for_close_balanse (
   id,
   acc_no,
   val_acc,
   val_name,
   f5501p,
   f5501v,
   ostat,
   pok_ostat,
   bal_cn1 )
AS
SELECT
  a.id
, a.acc_no
, a.val_acc
, v.val_name
, v.f5501p
, v.f5501v
, t.ostat
, t.pok_ostat
, a.BAL_CN1
FROM
  ACCOUNT a
, Tenostat t
, BAL_SPR1 B
, avalute v

WHERE
    a.id=t.acc_id
and t.ostat<>0
and a.BAL_CN1 = b.BAL_CN
and b.CloseBalance = 1
and a.close_dat is Null
and a.Val_acc=v.valute
/


-- End of DDL Script for View SMART.ACCOUNTS_FOR_CLOSE_BALANSE

-- Start of DDL Script for View SMART.CUSTOMERS_OWN
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW customers_own (
   id,
   op_id,
   open_dat,
   close_dat,
   nerezident,
   prinad_kod,
   name,
   short_name,
   group_klie,
   vid_sob,
   org_sob,
   sfera_dey,
   otrasl,
   nalog_kod,
   kod_okpro,
   inn,
   dat_nal,
   dat_ustav,
   bik,
   otv_lico,
   otv_passport,
   otv_issued,
   otv_isdate )
AS
select
  "ID","OP_ID","OPEN_DAT","CLOSE_DAT","NEREZIDENT","PRINAD_KOD","NAME","SHORT_NAME","GROUP_KLIE","VID_SOB","ORG_SOB","SFERA_DEY","OTRASL","NALOG_KOD","KOD_OKPRO","INN","DAT_NAL","DAT_USTAV","BIK","OTV_LICO","OTV_PASSPORT","OTV_ISSUED","OTV_ISDATE"
from customers where op_id = sblogin.userid
/


-- End of DDL Script for View SMART.CUSTOMERS_OWN

-- Start of DDL Script for View SMART.FILIAL_ACCOUNTS
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW filial_accounts (
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
Select 
  A.* 
from
	Account A
where 
  A.filial = 0--Only Smart's accounts!
/


-- End of DDL Script for View SMART.FILIAL_ACCOUNTS

-- Start of DDL Script for View SMART.GROUP$
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW group$ (
   id,
   name,
   description,
   create_date,
   created_by_user,
   flags,
   sid# )
AS
select ID, Name, Description, CREATE_DATE, CREATED_BY_USER, FLAGS, SID#
from security_clients$
where type#=2
/


-- End of DDL Script for View SMART.GROUP$

-- Start of DDL Script for View SMART.MAINOFIS_CUSTOMERS
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW mainofis_customers (
   id,
   op_id,
   open_dat,
   close_dat,
   nerezident,
   prinad_kod,
   name,
   short_name,
   group_klie,
   vid_sob,
   org_sob,
   sfera_dey,
   otrasl,
   nalog_kod,
   kod_okpro,
   inn,
   dat_nal,
   dat_ustav,
   bik,
   otv_lico,
   otv_passport,
   otv_issued,
   otv_isdate )
AS
select 
"ID","OP_ID","OPEN_DAT","CLOSE_DAT","NEREZIDENT","PRINAD_KOD","NAME","SHORT_NAME","GROUP_KLIE","VID_SOB","ORG_SOB","SFERA_DEY","OTRASL","NALOG_KOD","KOD_OKPRO","INN","DAT_NAL","DAT_USTAV","BIK","OTV_LICO","OTV_PASSPORT","OTV_ISSUED","OTV_ISDATE"
from customers
/


-- End of DDL Script for View SMART.MAINOFIS_CUSTOMERS

-- Start of DDL Script for View SMART.PAYMENTDECREE_OWN
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW paymentdecree_own (
   id,
   pdate,
   pnum,
   dbname,
   dbcod,
   dbinn,
   dbcoracc,
   dbswift,
   dacc_no,
   daccname,
   daccinn,
   kbname,
   kbcod,
   kbinn,
   kbcoracc,
   kbswift,
   kacc_no,
   kaccname,
   kaccinn,
   ammount,
   assignment,
   extra,
   sid# )
AS
select "ID","PDATE","PNUM","DBNAME","DBCOD","DBINN","DBCORACC","DBSWIFT","DACC_NO","DACCNAME","DACCINN","KBNAME","KBCOD","KBINN","KBCORACC","KBSWIFT","KACC_NO","KACCNAME","KACCINN","AMMOUNT","ASSIGNMENT","EXTRA","SID#" from paymentdecree
where sid# = sblogin.userid
/


-- End of DDL Script for View SMART.PAYMENTDECREE_OWN

-- Start of DDL Script for View SMART.PAYMENT_FIQNYA
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW payment_fiqnya (
   id,
   pdate,
   pnum,
   dbname,
   dbcod,
   dbinn,
   dbcoracc,
   dbswift,
   dacc_no,
   daccname,
   daccinn,
   kbname,
   kbcod,
   kbinn,
   kbcoracc,
   kbswift,
   kacc_no,
   kaccname,
   kaccinn,
   ammount,
   assignment,
   extra,
   sid# )
AS
select "ID","PDATE","PNUM","DBNAME","DBCOD","DBINN","DBCORACC","DBSWIFT","DACC_NO","DACCNAME","DACCINN","KBNAME","KBCOD","KBINN","KBCORACC","KBSWIFT","KACC_NO","KACCNAME","KACCINN","AMMOUNT","ASSIGNMENT","EXTRA","SID#" from paymentdecree where not sid# IN(137,138)
/


-- End of DDL Script for View SMART.PAYMENT_FIQNYA

-- Start of DDL Script for View SMART.PROVARCH_FILIAL
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW provarch_filial (
   id,
   op_id,
   no_prov,
   dat,
   debt,
   kredit,
   val_acc,
   vid_op,
   ammount,
   lammount,
   tim,
   shifr,
   no_pack,
   kassa_b,
   kassa_z,
   no_filial,
   sloj_prov,
   bank_d,
   bank_k,
   no_doc,
   no_mem,
   d1,
   k1,
   rate_d,
   rate_c,
   parentid,
   currencyid_c,
   ammount_c,
   name,
   commit_opid )
AS
select
  p.*
from
  provarch p ,
  account d ,
  account c 
where 
  p.debt = d.id and 
  p.kredit = c.id and 
  ((d.filial = 42)or(c.filial = 42))
/


-- End of DDL Script for View SMART.PROVARCH_FILIAL

-- Start of DDL Script for View SMART.PROVDOC
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW provdoc (
   id,
   op_id,
   no_prov,
   dat,
   debt,
   kredit,
   val_acc,
   vid_op,
   ammount,
   lammount,
   tim,
   shifr,
   no_pack,
   kassa_b,
   kassa_z,
   no_filial,
   sloj_prov,
   bank_d,
   bank_k,
   no_doc,
   no_mem,
   d1,
   k1,
   rate_d,
   rate_c,
   parentid,
   currencyid_c,
   ammount_c,
   name,
   commit_opid )
AS
SELECT
   id, op_id, no_prov, dat, debt, kredit, val_acc, vid_op, ammount,
       lammount, tim, shifr, no_pack, kassa_b, kassa_z, no_filial,
       sloj_prov, bank_d, bank_k, no_doc, no_mem, d1, k1, rate_d,
       rate_c, parentid, currencyid_c, ammount_c, name, commit_opid
FROM
   provarch  partition (Today)
/

-- Grants for View
GRANT SELECT ON provdoc TO sbr_todaybalance
/

-- End of DDL Script for View SMART.PROVDOC

-- Start of DDL Script for View SMART.PROV_ALL
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW prov_all (
   acc_id,
   acc_no,
   pairacc_id,
   name,
   kli_id,
   prov_date,
   debit,
   kredit,
   ldebit,
   lkredit,
   val_name,
   val_acc,
   bal_cn1,
   bal_cn2,
   bal_cn3,
   bal_cn4 )
AS
SELECT "ACC_ID","ACC_NO","PAIRACC_ID","NAME","KLI_ID","PROV_DATE","DEBIT","KREDIT","LDEBIT","LKREDIT","VAL_NAME","VAL_ACC","BAL_CN1","BAL_CN2","BAL_CN3","BAL_CN4"  FROM PROV_DEBIT
UNION
SELECT"ACC_ID","ACC_NO","PAIRACC_ID","NAME","KLI_ID","PROV_DATE","DEBIT","KREDIT","LDEBIT","LKREDIT","VAL_NAME","VAL_ACC","BAL_CN1","BAL_CN2","BAL_CN3","BAL_CN4" FROM PROV_KREDIT
/


-- End of DDL Script for View SMART.PROV_ALL

-- Start of DDL Script for View SMART.PROV_DEBIT
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW prov_debit (
   acc_id,
   acc_no,
   pairacc_id,
   name,
   kli_id,
   prov_date,
   debit,
   kredit,
   ldebit,
   lkredit,
   val_name,
   val_acc,
   bal_cn1,
   bal_cn2,
   bal_cn3,
   bal_cn4 )
AS
SELECT  A.ID ACC_ID,A.ACC_NO ACC_NO, P.KREDIT PAIRACC_ID,A.NAME NAME, A.KLI_ID KLI_ID, P.DAT PROV_DATE, 
        P.AMMOUNT DEBIT, 0 KREDIT, P.LAMMOUNT LDEBIT, 0 LKREDIT,V.VAL_NAME VAL_NAME,P.VAL_ACC VAL_ACC,
        A.BAL_CN1 BAL_CN1, A.BAL_CN2 BAL_CN2,
        A.BAL_CN3 BAL_CN3, A.BAL_CN4 BAL_CN4
FROM
      SMART.ACCOUNT  A,
      SMART.AVALUTE  V,
      SMART.PROVARCH P
WHERE ( P.DEBT = A.ID ) AND
      ( P.VAL_ACC = V.VALUTE )
/


-- End of DDL Script for View SMART.PROV_DEBIT

-- Start of DDL Script for View SMART.PROV_KREDIT
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW prov_kredit (
   acc_id,
   acc_no,
   pairacc_id,
   name,
   kli_id,
   prov_date,
   debit,
   kredit,
   ldebit,
   lkredit,
   val_name,
   val_acc,
   bal_cn1,
   bal_cn2,
   bal_cn3,
   bal_cn4 )
AS
SELECT  A.ID ACC_ID, A.ACC_NO ACC_NO, P.DEBT PAIRACC_ID, A.NAME NAME,A.KLI_ID KLI_ID,P.DAT PROV_DATE, 
        0 DEBIT, P.AMMOUNT KREDIT, 0 LDEBIT, P.LAMMOUNT LKREDIT,V.VAL_NAME VAL_NAME,P.VAL_ACC VAL_ACC,
        A.BAL_CN1 BAL_CN1, A.BAL_CN2 BAL_CN2,
        A.BAL_CN3 BAL_CN3, A.BAL_CN4 BAL_CN4 
FROM
      SMART.ACCOUNT  A,
      SMART.AVALUTE  V,    
      SMART.PROVARCH P
WHERE ( P.KREDIT = A.ID) AND
      ( P.VAL_ACC = V.VALUTE )
/


-- End of DDL Script for View SMART.PROV_KREDIT

-- Start of DDL Script for View SMART.RATECHECK
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW ratecheck (
   val_acc,
   ratepr,
   d$,
   ratetr,
   delta )
AS
select 
pr.*
,tr.*
,ratepr-ratetr Delta
from
(
select val_acc,max(rate_d) RatePr from provdoc
where
(id not in (select parentid from provdoc where parentid>0)) and
val_acc<>0
group by val_acc) pr,
(select val_kod D$,ostat RateTr from temprate) tr
where pr.val_acc --(+) 
=tr.D$

/*
select 
pr.*
,tr.*
,ratepr-ratetr Delta
from
(
select val_acc,max(rate_d) RatePr from provdoc
where
val_acc=currencyid_c 
and val_acc<>0 
group by val_acc
) pr,
(select val_kod D$,ostat RateTr from temprate) tr
where pr.val_acc --(+) 
=tr.D$

*/
/


-- End of DDL Script for View SMART.RATECHECK

-- Start of DDL Script for View SMART.RATEDIFFERENCE
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW ratedifference (
   id,
   acccurrencyid,
   currencyid,
   debet,
   kredit,
   o1,
   o2,
   ostat,
   deltarate,
   sum_transaction )
AS
SELECT
  a.id as id ,
  a.val_acc as ACCCURRENCYID,
  v.valute as CURRENCYID,
  v.debet as DEBET,
  v.kredit as KREDIT,
  o.ostat as o1,
  o2.ostat as o2,
  t.ostat as Ostat,
  o.ostat - o2.ostat as deltarate,
  Abs(t.ostat * o.ostat - t.pok_ostat) as sum_transaction
--  Abs(t.ostat * o.ostat - t.ostat * o2.ostat)
FROM
  ACCOUNT partition (ActivAcc)  a,
  Archost partition (YesterDay) t,
  bal_spr1 b,
  operkurs partition (ToDay) o,
  operkurs partition (YesterDay) o2,
  avalute v,
  sysdat s
WHERE
  (a.val_acc <> 0)
-- 	and (t.datdate = (select pred_dat from sysdat))
  AND (t.acc_id = a.id)
  AND (a.bal_cn1 = b.bal_cn)
  AND (b.RateDifference = 1)
--  AND (a.close_dat IS NULL)
  AND (a.val_acc = v.valute)
  AND (o.val_kod = a.val_acc)
  AND (o.val_kod = o2.val_kod)
  AND (t.ostat <>0)
  AND (o.ostat - o2.ostat<>0) 

--  AND (o.dat = (SELECT tek_dat FROM sysdat))
--  AND (o2.dat = (SELECT pred_dat FROM sysdat))
/


-- End of DDL Script for View SMART.RATEDIFFERENCE

-- Start of DDL Script for View SMART.RATEDIFFERENCE_OLD
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW ratedifference_old (
   id,
   acccurrencyid,
   currencyid,
   debet,
   kredit,
   o1,
   o2,
   ostat,
   deltarate,
   sum_transaction )
AS
SELECT
  a.id as id ,
  a.val_acc as ACCCURRENCYID,
  v.valute as CURRENCYID,
  v.debet as DEBET,
  v.kredit as KREDIT,
  o.ostat as o1,
  o2.ostat as o2,
  t.ostat as Ostat,
  o.ostat - o2.ostat as deltarate,
  Abs(t.ostat * o.ostat - t.pok_ostat) as sum_transaction
--  Abs(t.ostat * o.ostat - t.ostat * o2.ostat)
FROM
  ACCOUNT partition (ActivAcc)  a,
  Archost partition (YesterDay) t,
  bal_spr1 b,
  operkurs partition (ToDay) o,
  operkurs partition (YesterDay) o2,
  avalute v,
  sysdat s
WHERE
  (a.val_acc <> 0)
-- 	and (t.datdate = (select pred_dat from sysdat))
  AND (t.acc_id = a.id)
  AND (a.bal_cn1 = b.bal_cn)
  AND (b.RateDifference = 1)
--  AND (a.close_dat IS NULL)
  AND (a.val_acc = v.valute)
  AND (o.val_kod = a.val_acc)
  AND (o.val_kod = o2.val_kod)
  AND (t.ostat <>0)
  AND (o.ostat - o2.ostat<>0) 

--  AND (o.dat = (SELECT tek_dat FROM sysdat))
--  AND (o2.dat = (SELECT pred_dat FROM sysdat))
/


-- End of DDL Script for View SMART.RATEDIFFERENCE_OLD

-- Start of DDL Script for View SMART.REST_CORRECTOR
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW rest_corrector (
   acc_no,
   name,
   val_acc,
   val_name,
   ostat,
   pok_ostat )
AS
select
   ac.acc_no ,
   ac.name ,
   ac.val_acc ,
   av.val_name,
   ar.ostat ,
   ar.pok_ostat
   
  from
  Account Ac ,
  Archost Ar ,
  avalute av  
 where
   av.valute = ac.val_acc and
   ar.datdate = '27-Feb-2004' and
   ac.id = ar.acc_id
/


-- End of DDL Script for View SMART.REST_CORRECTOR

-- Start of DDL Script for View SMART.SBA_ACCOUNT
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW sba_account (
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
Select 
"ID","KLI_ID","OP_ID","ACC_NO","VAL_ACC","NAME","OPEN_DAT","CLOSE_DAT","BAL_CN1","BAL_CN2","BAL_CN3","BAL_CN4","FILIAL","SIM_OTCET","TIPACC","LIMIT","OLD_ACC_NO","PAIR_ACC","INSIDER","SID#"from smart.account
where
(op_id<>-1 and 
not EXISTS(select SUSER from sba_userman where MUSER=uid and (type#=2 or type#=0)))
or
(op_id in(select SUSER from sba_userman where MUSER=uid and (type#=2 or type#=0)))
/

-- Grants for View
GRANT SELECT ON sba_account TO sbr_accounts
/
GRANT SELECT ON sba_account TO sbr_accountsforperiod
/
GRANT SELECT ON sba_account TO sbr_avalute
/
GRANT SELECT ON sba_account TO sbr_cashdesk
/
GRANT SELECT ON sba_account TO sbr_controltape
/
GRANT SELECT ON sba_account TO sbr_creditmanager
/
GRANT SELECT ON sba_account TO sbr_customers
/
GRANT SELECT ON sba_account TO sbr_customers_informations
/
GRANT SELECT ON sba_account TO sbr_exchange
/
GRANT SELECT ON sba_account TO sbr_expertanalys
/
GRANT SELECT ON sba_account TO sbr_incomesandexpenses
/
GRANT SELECT ON sba_account TO sbr_mainfacilities
/
GRANT SELECT ON sba_account TO sbr_order
/
GRANT SELECT ON sba_account TO sbr_paymentdecreex
/
GRANT SELECT ON sba_account TO sbr_profitclosing
/
GRANT SELECT ON sba_account TO sbr_ratemanagement
/
GRANT SELECT ON sba_account TO sbr_swift
/
GRANT SELECT ON sba_account TO sbr_todaybalance
/
GRANT SELECT ON sba_account TO sbr_transaction
/
GRANT SELECT ON sba_account TO sbr_transactionsviewer
/
GRANT SELECT ON sba_account TO sbr_tuningtransactions
/
GRANT SELECT ON sba_account TO sbr_turnoversforperiod
/

-- End of DDL Script for View SMART.SBA_ACCOUNT

-- Start of DDL Script for View SMART.RESULT
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW result (
   btarix,
   val_name,
   valu_inter,
   currency,
   alish_kursu,
   bxarici_valyuta,
   bmanat_ekvivalenti,
   buycount,
   satish_kursu,
   sxarici_valyuta,
   smanat_ekvivalenti,
   sellcount )
AS
select s.starix as tarix, a.val_name, a.valu_inter, a.valute as currency,
       B.alish_kursu, B.bxarici_valyuta, b.bmanat_ekvivalenti, b.BuyCount,
       S.satish_kursu, s.sxarici_valyuta,S.smanat_ekvivalenti, s.SellCount
       
from Buy B,Sell S,Avalute A
where 
  (B.BTarix(+)=S.STarix)and 
    (B.bvalyuta_kodu(+)=S.svalyuta_kodu) and
      (A.valute=s.svalyuta_kodu)


union  

select b.btarix as tarix, a.val_name, a.valu_inter, a.valute as currency,
       B.alish_kursu, B.bxarici_valyuta, b.bmanat_ekvivalenti, b.BuyCount,
       S.satish_kursu, s.sxarici_valyuta, S.smanat_ekvivalenti, s.SellCount
       
from Buy B,Sell S,Avalute A
where 
  (B.BTarix=S.STarix(+))and 
    (B.bvalyuta_kodu=S.svalyuta_kodu(+)) and
      (A.valute=B.bvalyuta_kodu)

order by tarix
/

-- Grants for View
GRANT SELECT ON result TO sbr_exchange
/

-- End of DDL Script for View SMART.RESULT

-- Start of DDL Script for View SMART.SBA_CUSTOMERS
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW sba_customers (
   id,
   op_id,
   open_dat,
   close_dat,
   nerezident,
   prinad_kod,
   name,
   short_name,
   group_klie,
   vid_sob,
   org_sob,
   sfera_dey,
   otrasl,
   nalog_kod,
   kod_okpro,
   inn,
   dat_nal,
   dat_ustav,
   bik,
   otv_lico,
   otv_passport,
   otv_issued,
   otv_isdate )
AS
Select "ID","OP_ID","OPEN_DAT","CLOSE_DAT","NEREZIDENT","PRINAD_KOD","NAME","SHORT_NAME","GROUP_KLIE","VID_SOB","ORG_SOB","SFERA_DEY","OTRASL","NALOG_KOD","KOD_OKPRO","INN","DAT_NAL","DAT_USTAV","BIK","OTV_LICO","OTV_PASSPORT","OTV_ISSUED","OTV_ISDATE"
from smart.CUSTOMERS
where
(op_id<>-1 and 
not EXISTS(select SUSER from sba_userman where MUSER=uid and (type#=3 or type#=0)))
or
(op_id in(select SUSER from sba_userman where MUSER=uid and (type#=3 or type#=0)))
/

-- Grants for View
GRANT SELECT ON sba_customers TO sbr_accounts
/
GRANT SELECT ON sba_customers TO sbr_accountsforperiod
/
GRANT SELECT ON sba_customers TO sbr_creditmanager
/
GRANT DELETE ON sba_customers TO sbr_customers
/
GRANT INSERT ON sba_customers TO sbr_customers
/
GRANT SELECT ON sba_customers TO sbr_customers
/
GRANT UPDATE ON sba_customers TO sbr_customers
/
GRANT SELECT ON sba_customers TO sbr_customers_informations
/
GRANT SELECT ON sba_customers TO sbr_swift
/

-- End of DDL Script for View SMART.SBA_CUSTOMERS

-- Start of DDL Script for View SMART.SBA_PAYMENTDECREE
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW sba_paymentdecree (
   id,
   pdate,
   pnum,
   dbname,
   dbcod,
   dbinn,
   dbcoracc,
   dbswift,
   dacc_no,
   daccname,
   daccinn,
   kbname,
   kbcod,
   kbinn,
   kbcoracc,
   kbswift,
   kacc_no,
   kaccname,
   kaccinn,
   ammount,
   assignment,
   extra,
   sid# )
AS
SELECT id, pdate, pnum, dbname, dbcod, dbinn, dbcoracc, dbswift,
       dacc_no, daccname, daccinn, kbname, kbcod, kbinn, kbcoracc,
       kbswift, kacc_no, kaccname, kaccinn, ammount, assignment, extra,
       sid# 
  FROM smart.paymentdecree
--  where sid# = uid
/* WHERE
       (sid#<>-1
   AND 
not EXISTS(select SUSER from sba_userman where MUSER=uid and (type#=2 or type#=0)))
or
(sid# in(select SUSER from sba_userman where MUSER=uid and (type#=2 or type#=0)))*/
/


-- End of DDL Script for View SMART.SBA_PAYMENTDECREE

-- Start of DDL Script for View SMART.SBA_TRANSACTIONS
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW sba_transactions (
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

-- Grants for View
GRANT SELECT ON sba_transactions TO sbr_transaction
/

-- End of DDL Script for View SMART.SBA_TRANSACTIONS

-- Start of DDL Script for View SMART.SB_$OBJECTS
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW sb_$objects (
   type,
   objid,
   sid# )
AS
select
  'MODULE',
  ID,
  sid#
from modules

union

/* accounts */

select 
  'ACCOUNT', 
  ID, 
  sid#
from account

union

/* customers */

select
  'CUSTOMER',
  ID,
  0 --sid#
from customers
/


-- End of DDL Script for View SMART.SB_$OBJECTS

-- Start of DDL Script for View SMART.SELL
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW sell (
   svalyuta_kodu,
   starix,
   sxarici_valyuta,
   smanat_ekvivalenti,
   satish_kursu,
   sellcount )
AS
Select 
  currencyid_c as SValyuta_kodu,
  dat as STarix,sum(ammount_c) as SXarici_valyuta,
  sum(ammount_c)*sum(rate_c)/count(rate_c) SManat_ekvivalenti,
  sum(rate_c)/count(rate_c) as Satish_kursu, 
  count(*) as SellCount
From Exchange_kredit

Group by currencyid_c,dat
/

-- Grants for View
GRANT SELECT ON sell TO sbr_exchange
/

-- End of DDL Script for View SMART.SELL

-- Start of DDL Script for View SMART.SWIFTVALUTE
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW swiftvalute (
   val_name,
   valute,
   valu_name,
   name )
AS
select 
   distinct
   v.val_name,
   v.valute,
   v.valu_name,
   '[ '||sc.name||' ]' AS  NAME
from 
    avalute V,
    swiftcurrency sc
where  
    v.val_name = sc.currency AND
    SC.SHORTCOUNTRY = SUBSTR(SC.CURRENCY,1,2)
ORDER BY 
    V.VAL_NAME
/


-- End of DDL Script for View SMART.SWIFTVALUTE

-- Start of DDL Script for View SMART.SWIFT_COUNTRYRULES_33B
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW swift_countryrules_33b (
   id,
   shortname,
   name )
AS
SELECT 
 "ID","SHORTNAME","NAME"
FROM 
   swiftcountry
where 

SHORTNAME ='AD'or
SHORTNAME ='AT'or
SHORTNAME ='BE'or
SHORTNAME ='BV'or
SHORTNAME ='CH'or
SHORTNAME ='DE'or
SHORTNAME ='DK'or
SHORTNAME ='ES'or
SHORTNAME ='FI'or
SHORTNAME ='FR'or
SHORTNAME ='GB'or
SHORTNAME ='GF'or
SHORTNAME ='GI'or
SHORTNAME ='GP'or
SHORTNAME ='GR'or
SHORTNAME ='IE'or
SHORTNAME ='IS'or
SHORTNAME ='IT'or
SHORTNAME ='LI'or
SHORTNAME ='LU'or
SHORTNAME ='MC'or
SHORTNAME ='MQ'or
SHORTNAME ='NL'or
SHORTNAME ='NO'or
SHORTNAME ='PM'or
SHORTNAME ='PT'or
SHORTNAME ='RE'or
SHORTNAME ='SE'or
SHORTNAME ='SJ'or
SHORTNAME ='SM'or
SHORTNAME ='TF'or
SHORTNAME ='VA'
/


-- End of DDL Script for View SMART.SWIFT_COUNTRYRULES_33B

-- Start of DDL Script for View SMART.TEMPOST
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW tempost (
   id_number,
   acc_id,
   ostat,
   pok_ostat,
   datdate,
   obr_d,
   obr_k,
   pok_obr_d,
   pok_obr_k,
   lastopdate )
AS
select "ID_NUMBER","ACC_ID","OSTAT","POK_OSTAT","DATDATE","OBR_D","OBR_K","POK_OBR_D","POK_OBR_K","LASTOPDATE"
 from archost partition (Yesterday)
/

-- Grants for View
GRANT SELECT ON tempost TO sbr_accounts
/

-- End of DDL Script for View SMART.TEMPOST

-- Start of DDL Script for View SMART.TEMPRATE
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW temprate (
   val_kod,
   ostat,
   dat,
   shifr )
AS
Select "VAL_KOD","OSTAT","DAT","SHIFR" from OperKurs partition (ToDay)
--order by "VAL_KOD"
/

-- Grants for View
GRANT DELETE ON temprate TO sbr_ratemanagement
/
GRANT INSERT ON temprate TO sbr_ratemanagement
/
GRANT SELECT ON temprate TO sbr_ratemanagement
/
GRANT UPDATE ON temprate TO sbr_ratemanagement
/
GRANT SELECT ON temprate TO sbr_transaction
/

-- End of DDL Script for View SMART.TEMPRATE

-- Start of DDL Script for View SMART.TEMP_ARCHOST_VIEWER
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW temp_archost_viewer (
   currency,
   accountno,
   name,
   rest,
   restinnational,
   debtturn,
   creditturn,
   debtturninnational,
   credturninnational )
AS
Select
  Av.Val_Name as Currency
 ,Ac.Acc_No as AccountNo
 ,Ac.Name as Name
 --,Ar.DatDate as CurrentDate
 ,Ar.Ostat as  Rest
 ,Ar.POK_Ostat as RestInNational
 ,Ar.Obr_D as DebtTurn
 ,Ar.Obr_K as CreditTurn
 ,Ar.Pok_Obr_D as DebtTurnInNational
 ,Ar.Pok_Obr_K as CredTurnInNational 
 From  Account AC,Archost Ar,AValute Av
 Where Ac.Val_Acc = Av.Valute and Ac.ID = Ar.acc_id
    and datDate=(Select TEK_Dat from SysDat)
/


-- End of DDL Script for View SMART.TEMP_ARCHOST_VIEWER

-- Start of DDL Script for View SMART.TENOSTAT
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW tenostat (
   id_number,
   acc_id,
   ostat,
   pok_ostat,
   datdate,
   obr_d,
   obr_k,
   pok_obr_d,
   pok_obr_k,
   lastopdate )
AS
SELECT "ID_NUMBER", "ACC_ID", "OSTAT", "POK_OSTAT", "DATDATE", "OBR_D",
       "OBR_K", "POK_OBR_D", "POK_OBR_K", "LASTOPDATE"
 FROM archost  partition (Today)
/

-- Grants for View
GRANT SELECT ON tenostat TO sbr_accounts
/
GRANT SELECT ON tenostat TO sbr_customers
/
GRANT SELECT ON tenostat TO sbr_customers_informations
/
GRANT SELECT ON tenostat TO sbr_todaybalance
/
GRANT SELECT ON tenostat TO sbr_transaction
/

-- End of DDL Script for View SMART.TENOSTAT

-- Start of DDL Script for View SMART.TEST_CONVERT
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW test_convert (
   id,
   dat,
   kassa_z,
   debt,
   kredit,
   val_acc,
   currencyid_c,
   ammount,
   ammount_c,
   lammount,
   rate_d,
   rate_c,
   dacc_no,
   kacc_no,
   ostat )
AS
Select
 distinct
  Pr.ID,
  Pr.dat,
  Pr. kassa_z,
  Pr.debt,
  Pr.kredit,
  Pr.val_acc,
  Pr.currencyID_c,
  Pr.ammount,
  Pr.ammount_c,
  Pr.lammount,
  Pr.rate_d,
  Pr.rate_c,
  A1.acc_no as DAcc_no,
  A2.acc_no as Kacc_no,
  Op.ostat
From
 Provarch Pr,
 Account A1,
 Account A2,
 Operkurs Op
Where
 Pr.dat=Op.dat and
  (Pr.val_acc=Op.val_kod or Pr.currencyid_c=Op.val_kod) and
   (Pr.val_acc<>Pr.currencyid_c)and
    Pr.rate_d<>Op.ostat and
     Pr.rate_c<>Op.ostat and
      Pr.debt=A1.id and Pr.kredit=A2.id and
       A1.bal_cn1 in(Select bal_cn From bal_spr1 Where cashincoming =0)and
        A2.bal_cn1 in(Select bal_cn From bal_spr1 Where cashincoming =0)--and
         --Pr.dat>'1-dec-2002' and Pr.dat<'19-dec-2002'

Order by pr.dat
/


-- End of DDL Script for View SMART.TEST_CONVERT

-- Start of DDL Script for View SMART.TODAY_TRANSACTIONS
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW today_transactions (
   id,
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
   status,
   reject_reason )
AS
SELECT
  p.ID,
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


-- End of DDL Script for View SMART.TODAY_TRANSACTIONS

-- Start of DDL Script for View SMART.TODAY_TRANSACTIONS_ALL
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

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

-- Start of DDL Script for View SMART.TRANSACTIONS
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW transactions (
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
SELECT
  p.ID,
	p.OP_ID as OperatorID,
  p.dat as TransactionDate,
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
  p.Name,
	0 as Flags,
	2 as status,
	'' as REJECT_REASON
FROM
  provarch p,
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
  p.dat as TransactionDate,
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
/


-- End of DDL Script for View SMART.TRANSACTIONS

-- Start of DDL Script for View SMART.TRANSACTIONS_ALL
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW transactions_all (
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
SELECT
  p.ID,
	p.OP_ID as OperatorID,
  p.dat as TransactionDate,
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
  p.Name,
	0 as Flags,
	2 as status,
	'' as REJECT_REASON
FROM
  provarch p,
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
  p.dat as TransactionDate,
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
/


-- End of DDL Script for View SMART.TRANSACTIONS_ALL

-- Start of DDL Script for View SMART.TRANSACTIONS_OWN
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW transactions_own (
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
SELECT "ID", "OPERATORID", "TRANSACTIONDATE", "DEBITID", "DEBITACCNO",
       "DEBITCURRENCYID", "DEBITCURRENCYSNAME", "CREDITID", "CREDITACCNO",
       "CREDITCURRENCYID", "CREDITCURRENCYSNAME", "DEBITAMOUNT",
       "CREDITAMOUNT", "LAMOUNT", "DEBITRATE", "CREDITRATE", "DEBITBANK",
       "CREDITBANK", "PACKAGENUMBER", "CYPHERCODE", "OPERATIONCODE",
       "INBALANCECHAR", "OUTBALANCECHAR", "FILIALID", "DEBITBALANCE", "NAME",
       "FLAGS", "STATUS", "REJECT_REASON"
  FROM smart.transactions
 WHERE operatorid = sblogin.userid
/


-- End of DDL Script for View SMART.TRANSACTIONS_OWN

-- Start of DDL Script for View SMART.TRANSACTIONS_OWNED
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW transactions_owned (
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
SELECT "ID", "OPERATORID", "TRANSACTIONDATE", "DEBITID", "DEBITACCNO",
       "DEBITCURRENCYID", "DEBITCURRENCYSNAME", "CREDITID", "CREDITACCNO",
       "CREDITCURRENCYID", "CREDITCURRENCYSNAME", "DEBITAMOUNT",
       "CREDITAMOUNT", "LAMOUNT", "DEBITRATE", "CREDITRATE", "DEBITBANK",
       "CREDITBANK", "PACKAGENUMBER", "CYPHERCODE", "OPERATIONCODE",
       "INBALANCECHAR", "OUTBALANCECHAR", "FILIALID", "DEBITBALANCE", "NAME",
       "FLAGS", "STATUS", "REJECT_REASON"
  FROM smart.transactions
 WHERE operatorid = sblogin.userid
/


-- End of DDL Script for View SMART.TRANSACTIONS_OWNED

-- Start of DDL Script for View SMART.TRANSACTION_OWN
-- Generated 3-Nov-2004 17:15:50 from SMART@sbDEV

CREATE OR REPLACE VIEW transaction_own (
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
SELECT "ID", "OPERATORID", "TRANSACTIONDATE", "DEBITID", "DEBITACCNO",
       "DEBITCURRENCYID", "DEBITCURRENCYSNAME", "CREDITID", "CREDITACCNO",
       "CREDITCURRENCYID", "CREDITCURRENCYSNAME", "DEBITAMOUNT",
       "CREDITAMOUNT", "LAMOUNT", "DEBITRATE", "CREDITRATE", "DEBITBANK",
       "CREDITBANK", "PACKAGENUMBER", "CYPHERCODE", "OPERATIONCODE",
       "INBALANCECHAR", "OUTBALANCECHAR", "FILIALID", "DEBITBALANCE", "NAME",
       "FLAGS", "STATUS", "REJECT_REASON"
  FROM smart.transactions
 WHERE operatorid = sblogin.userid
/


-- End of DDL Script for View SMART.TRANSACTION_OWN

-- Start of DDL Script for View SMART.USER$
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

CREATE OR REPLACE VIEW user$ (
   id,
   name,
   ctime )
AS
select 
USER# as ID
,name
,CTIME
from sys.user$
where datats#<>0
and datats#<>
(select datats# from sys.user$ where NAME='SYSTEM')
/

-- Grants for View
GRANT SELECT ON user$ TO sbr_accountsforperiod
/
GRANT SELECT ON user$ TO sbr_standart
/
GRANT SELECT ON user$ TO sbr_transaction
/

-- End of DDL Script for View SMART.USER$

-- Start of DDL Script for View SMART.VIEW_TBALANCE1
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

CREATE OR REPLACE VIEW view_tbalance1 (
   id,
   acc_no,
   name,
   val_acc,
   val_name,
   valute,
   close_dat,
   bal_cn1,
   balname,
   datdate,
   typeid,
   ostat,
   pok_ostat,
   obr_d,
   obr_k,
   pok_obr_d,
   pok_obr_k )
AS
select ac.id, ac.acc_no,ac.name ,ac.val_acc,
av.val_name,av.valute,ac.CLOSE_DAT,
ac.bal_cn1,b.balname,ar.datdate,b.TypeId,
ar.ostat, ar.pok_ostat, ar.obr_d, ar.obr_k, ar.pok_obr_d, ar.pok_obr_k
from account ac, tenostat ar, avalute av, bal_spr1 b
where ac.id=ar.acc_id and ac.val_acc=av.valute and ac.bal_cn1=b.bal_cn
/


-- End of DDL Script for View SMART.VIEW_TBALANCE1

-- Start of DDL Script for View SMART.V_ACCARCVAL
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

CREATE OR REPLACE VIEW v_accarcval (
   customername,
   customerid,
   accountname,
   accountnumber,
   accountid,
   currencyid,
   currencyname,
   bal_cn1,
   balname,
   ratedifference,
   typeid,
   saldo,
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
, ac.kli_id    CustomerId
, ac.name      AccountName
, ac.acc_no    AccountNumber
, ac.id        AccountId
, ac.val_acc   CurrencyId
, av.val_name  CurrencyName
, ac.bal_cn1
, b.BalName
, b.ratedifference
, b.typeid
, b.saldo
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


-- End of DDL Script for View SMART.V_ACCARCVAL

-- Start of DDL Script for View SMART.V_ACCOUNT1
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

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


-- End of DDL Script for View SMART.V_ACCOUNT1

-- Start of DDL Script for View SMART.V_ACCOUNT_BARNCH
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

CREATE OR REPLACE VIEW v_account_barnch (
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
and ac.filial = 0
/


-- End of DDL Script for View SMART.V_ACCOUNT_BARNCH

-- Start of DDL Script for View SMART.V_ACCTENVAL
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

CREATE OR REPLACE VIEW v_acctenval (
   id,
   acc_no,
   val_acc,
   val_name,
   bal_cn1,
   datdate,
   ostat,
   pok_ostat,
   obr_d,
   obr_k,
   pok_obr_d,
   pok_obr_k )
AS
select ac.id, ac.acc_no, ac.val_acc,av.val_name ,ac.bal_cn1,ar.datdate, ar.ostat, ar.pok_ostat, ar.obr_d, ar.obr_k, ar.pok_obr_d, ar.pok_obr_k
from account ac, tenostat ar, avalute av, customers c
where ac.id=ar.acc_id and ac.val_acc = av.valute and ac.kli_id = c.id
/


-- End of DDL Script for View SMART.V_ACCTENVAL

-- Start of DDL Script for View SMART.V_BALANCE
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

CREATE OR REPLACE VIEW v_balance (
   id,
   acc_no,
   name,
   val_acc,
   val_name,
   valute,
   close_dat,
   bal_cn1,
   balname,
   datdate,
   ostat,
   pok_ostat,
   obr_d,
   obr_k,
   pok_obr_d,
   pok_obr_k,
   bal_cn2,
   bal_cn3,
   bal_cn4 )
AS
select ac.id, ac.acc_no,ac.name ,ac.val_acc,
av.val_name,av.valute,ac.CLOSE_DAT,
ac.bal_cn1,b.balname,ar.datdate,
ar.ostat, ar.pok_ostat, ar.obr_d, ar.obr_k, ar.pok_obr_d, ar.pok_obr_k,ac.Bal_cn2,ac.Bal_cn3,ac.Bal_cn4
from account ac, archost ar, avalute av, bal_spr1 b
 where ac.id=ar.acc_id and ac.val_acc=av.valute and ac.bal_cn1=b.bal_cn
--order by ar.acc_id;
/


-- End of DDL Script for View SMART.V_BALANCE

-- Start of DDL Script for View SMART.V_BALANCE$1
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

CREATE OR REPLACE VIEW v_balance$1 (
   datdate,
   balancecode,
   currencyname,
   ostat,
   pok_ostat,
   activ,
   pok_activ,
   passiv,
   pok_passiv,
   obr_d,
   pok_obr_d,
   obr_k,
   pok_obr_k,
   id,
   id$,
   filial )
AS
select 
datdate, balancecode, currencyname
, Sum(ostat) Ostat
, Sum(Pok_Ostat) Pok_Ostat
 
, sum(sb_mtoutview.active (Ostat, typeid, Additionaltypeid ))    Activ
, sum(sb_mtoutview.active (Pok_ostat, Typeid, Additionaltypeid)) Pok_Activ
, sum(sb_mtoutview.passiv (Ostat, typeid, Additionaltypeid))     Passiv
, sum(sb_mtoutview.passiv (Pok_ostat, Typeid, Additionaltypeid)) Pok_Passiv

, Sum(obr_d)       Obr_D
, sum(pok_obr_d)   Pok_Obr_D
, sum(obr_k)       Obr_K
, sum(pok_obr_k)   Pok_Obr_K
, to_char(balancecode) ||'_'|| to_char(datdate,'dd/mm/yy') ID
, currencyname || to_char(balancecode) || '_'|| to_char(datdate,'dd/mm/yy')  ID$
, max(Filial) Filial
 from v_balance1 
-- where datdate='6-jan-4'
-- and currencyid=1
 group by datdate, balancecode, currencyname
 order by datdate, balancecode, currencyname
/


-- End of DDL Script for View SMART.V_BALANCE$1

-- Start of DDL Script for View SMART.V_BALANCE1
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

CREATE OR REPLACE VIEW v_balance1 (
   customername,
   customervoin,
   customerid,
   accountname,
   accountnumber,
   accountid,
   currencyid,
   filial,
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
, ac.filial    Filial
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


-- End of DDL Script for View SMART.V_BALANCE1

-- Start of DDL Script for View SMART.V_BALANCE2
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

CREATE OR REPLACE VIEW v_balance2 (
   customername,
   customerid,
   accountname,
   accountnumber,
   accountid,
   currencyid,
   currencyname,
   balancecode,
   balancename,
   close_dat,
   ratedifference,
   typeid,
   additionaltypeid,
   saldo,
   datdate,
   lastopdate,
   ostat,
   pok_ostat,
   obr_d,
   obr_k,
   pok_obr_d,
   pok_obr_k )
AS
select
  c.name       CustomerName
, ac.kli_id    CustomerId
, ac.name      AccountName
, ac.acc_no    AccountNumber
, ac.id        AccountId
, ac.val_acc   CurrencyId
, av.val_name  CurrencyName
, ac.bal_cn2   BalanceCode
, b.BalName    BalanceName
, ac.close_dat
, b.ratedifference
, b.typeid
, b.additionaltypeid
, b.saldo
, ar.datdate
, ar.lastopdate
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
, bal_spr2 b
, customers c

where
    ac.id=ar.acc_id
and ac.val_acc = av.valute
and ac.bal_cn2=b.bal_cn
and ac.kli_id=c.id
/


-- End of DDL Script for View SMART.V_BALANCE2

-- Start of DDL Script for View SMART.V_BALANCE3
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

CREATE OR REPLACE VIEW v_balance3 (
   customername,
   customerid,
   accountname,
   accountnumber,
   accountid,
   currencyid,
   currencyname,
   balancecode,
   balancename,
   close_dat,
   ratedifference,
   typeid,
   additionaltypeid,
   saldo,
   datdate,
   lastopdate,
   ostat,
   pok_ostat,
   obr_d,
   obr_k,
   pok_obr_d,
   pok_obr_k )
AS
select
  c.name       CustomerName
, ac.kli_id    CustomerId
, ac.name      AccountName
, ac.acc_no    AccountNumber
, ac.id        AccountId
, ac.val_acc   CurrencyId
, av.val_name  CurrencyName
, ac.bal_cn3   BalanceCode
, b.BalName    BalanceName
, ac.close_dat
, b.ratedifference
, b.typeid
, b.additionaltypeid
, b.saldo
, ar.datdate
, ar.lastopdate
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
, bal_spr3 b
, customers c

where
    ac.id=ar.acc_id
and ac.val_acc = av.valute
and ac.bal_cn3=b.bal_cn
and ac.kli_id=c.id
/


-- End of DDL Script for View SMART.V_BALANCE3

-- Start of DDL Script for View SMART.V_BALANCE4
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

CREATE OR REPLACE VIEW v_balance4 (
   customername,
   customerid,
   accountname,
   accountnumber,
   accountid,
   currencyid,
   currencyname,
   balancecode,
   balancename,
   close_dat,
   ratedifference,
   typeid,
   additionaltypeid,
   saldo,
   datdate,
   lastopdate,
   ostat,
   pok_ostat,
   obr_d,
   obr_k,
   pok_obr_d,
   pok_obr_k )
AS
select
  c.name       CustomerName
, ac.kli_id    CustomerId
, ac.name      AccountName
, ac.acc_no    AccountNumber
, ac.id        AccountId
, ac.val_acc   CurrencyId
, av.val_name  CurrencyName
, ac.bal_cn4   BalanceCode
, b.BalName    BalanceName
, ac.close_dat
, b.ratedifference
, b.typeid
, b.additionaltypeid
, b.saldo
, ar.datdate
, ar.lastopdate
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
, bal_spr4 b
, customers c

where
    ac.id=ar.acc_id
and ac.val_acc = av.valute
and ac.bal_cn4=b.bal_cn
and ac.kli_id=c.id
/


-- End of DDL Script for View SMART.V_BALANCE4

-- Start of DDL Script for View SMART.V_GZ1
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

CREATE OR REPLACE VIEW v_gz1 (
   dat,
   balance,
   s1,
   s2,
   dif,
   id )
AS
select 
  g1.dat
, g1.c_bal Balance
, g1.s1 s1 
-- ,g2.d_bal, 
, g2.s1 s2
, g1.s1-decode(g2.s1, null, 0,g2.s1) dif 
, to_char(g1.c_bal)||'_'||to_char(g1.dat,'dd/mm/yy') id
from
(
select dat, c_bal, sum(lamount) s1 from v_provarch1 where d_bal<>5501 and c_bal>=6000 and c_bal<8000 group by dat,c_bal 
) g1
,
(
select dat, d_bal, sum(lamount) s1 from v_provarch1 where c_bal<>5501 and d_bal>=6000 and d_bal<8000 group by dat,d_bal 
) g2

where g1.dat=g2.dat (+) and g1.c_bal =g2.d_bal (+)

union

select 
  g1.dat
, g1.d_bal 
, g1.s1 s1
--, g2.c_bal
, g2.s1 s2
, g1.s1-decode(g2.s1, null, 0,g2.s1) dif 
, to_char(g1.d_bal)||'_'||to_char(g1.dat,'dd/mm/yy') id
from
(
select dat,d_bal, sum(lamount) s1 from v_provarch1 where c_bal<>5501 and d_bal>=8000 group by dat, d_bal 
) g1
,
(
select dat,c_bal, sum(lamount) s1 from v_provarch1 where d_bal<>5501 and c_bal>=8000 group by dat, c_bal 
) g2
where g1.dat=g2.dat (+) and g1.d_bal =g2.c_bal (+)
/


-- End of DDL Script for View SMART.V_GZ1

-- Start of DDL Script for View SMART.V_MEMO
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

CREATE OR REPLACE VIEW v_memo (
   kreditcurrency,
   balkred,
   kreditor,
   kredit,
   debt,
   baldebt,
   debitor,
   ammount,
   lammount,
   name )
AS
select
p.CURRENCYID_C KreditCurrency
, a1.bal_cn1 BalKred
, a1.acc_no kreditor
--, p.id
, p.kredit
, p.debt
, a2.bal_cn1 BalDebt
, a2.acc_no Debitor
--, p.VID_OP
, p.AMMOUNT
, p.LAMMOUNT
, p.NAME
from PROVARCH p,account a1, account a2

where a1.id=p.kredit and a2.id=p.debt
/


-- End of DDL Script for View SMART.V_MEMO

-- Start of DDL Script for View SMART.V_MEMORIAL
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

CREATE OR REPLACE VIEW v_memorial (
   kreditcurrency,
   balkred,
   kreditor,
   kredit,
   debt,
   ammount,
   lammount,
   name,
   baldebt,
   debitor,
   debtcurrency )
AS
select s.*
, ac.bal_cn1 BalDebt
, ac.acc_no Debitor
, ac.VAL_ACC DebtCurrency
from account ac,
(select
p.CURRENCYID_C KreditCurrency
, a.bal_cn1 BalKred
, a.acc_no kreditor
--, p.id
, p.kredit
, p.debt
--, p.VID_OP
, p.AMMOUNT
, p.LAMMOUNT
, p.NAME
from PROVARCH p,account a where a.id=p.kredit) s
where ac.id=s.debt
/


-- End of DDL Script for View SMART.V_MEMORIAL

-- Start of DDL Script for View SMART.V_MIS1
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

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
 ,avalute v
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

-- Start of DDL Script for View SMART.V_PROVARCH1
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

CREATE OR REPLACE VIEW v_provarch1 (
   id,
   username,
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
   ,u.name UserName
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
 , user$ u
   where 
     p.debt=a1.id 
 and p.kredit=a2.id
 and ar1.datdate=p.dat
 and ar2.datdate=p.dat
 and ar1.Acc_id=p.debt
 and ar2.Acc_id=p.kredit
 and p.val_acc=av1.valute
 and p.currencyid_c=av2.valute
 and p.op_id=u.id
/


-- End of DDL Script for View SMART.V_PROVARCH1

-- Start of DDL Script for View SMART.V_STATEMENT_1
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

CREATE OR REPLACE VIEW v_statement_1 (
   acc_id,
   acc_no,
   val_name,
   name,
   kli_id )
AS
select a.id as acc_id, a.acc_no, v.val_name, a.name, a.kli_id
from ACCOUNT a, AVALUTE v
where v.valute = a.val_acc
/


-- End of DDL Script for View SMART.V_STATEMENT_1

-- Start of DDL Script for View SMART.WARES_OWN
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

CREATE OR REPLACE VIEW wares_own (
   id,
   groupsid,
   name,
   inventar,
   inventar_date,
   first_price,
   balance_price,
   in_date,
   in_num,
   amort,
   producer_plane,
   fxm,
   sector_cod,
   close_format,
   remainder,
   allamort,
   taxamort,
   alltaxamort,
   amort_date,
   tax,
   taxpercentprice,
   sid# )
AS
select "ID","GROUPSID","NAME","INVENTAR","INVENTAR_DATE","FIRST_PRICE","BALANCE_PRICE","IN_DATE","IN_NUM","AMORT","PRODUCER_PLANE","FXM","SECTOR_COD","CLOSE_FORMAT","REMAINDER","ALLAMORT","TAXAMORT","ALLTAXAMORT","AMORT_DATE","TAX","TAXPERCENTPRICE","SID#" from wares
where sid#=sblogin.userid
/


-- End of DDL Script for View SMART.WARES_OWN

-- Start of DDL Script for View SMART.XS_READYBATCHS
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

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

-- Start of DDL Script for View SMART.XS_SENDINGBATCHS
-- Generated 3-Nov-2004 17:15:51 from SMART@sbDEV

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


