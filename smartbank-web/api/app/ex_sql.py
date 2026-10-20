"""Verbatim SQL of Packages/Exchange (TFrmExchange), generated from the DFMs by migration/tools/gensql.py (file:line of the dataset object).
Line structure = Delphi TStrings (SQL[i] indices). Do not edit."""

# Exchange/ExcangeDataModule.dfm:11 ForMoney (TOracleDataSet)
SQL_EX_FORMONEY = 'Select\n       Valute,\n       Valu_Name\nFrom\n       Avalute\n '

# Exchange/ExcangeDataModule.dfm:24 ExAccount (TOracleDataSet)
SQL_EX_EXACCOUNT = 'Select \n       acc_no  \nFrom \n       Account\nWhere \n       val_acc=:cod and\n           (bal_cn1=1013 or bal_cn1=1003) '

# Exchange/ExcangeDataModule.dfm:44 TakeAccountID (TOracleDataSet)
SQL_EX_TAKEACCOUNTID = 'Select\n       ID \nFrom \n       Account\nWhere  \n       acc_no=:acc_cod'

# Exchange/ExcangeDataModule.dfm:65 ViewGrid (TOracleDataSet)
SQL_EX_VIEWGRID = 'Select \n       Ex.*\nFrom  \n       Exchanges  Ex\n'

# Exchange/ExcangeDataModule.dfm:96 Grid2 (TOracleDataSet)
SQL_EX_GRID2 = 'Select\n    Av.val_name,\n    Ac.acc_no,\n    Exs.ID,\n    Exs.ExNUM,\n    Ex.accountID\nFrom\n    Account Ac,\n    Avalute Av,\n    ExcAccount Ex,\n    Exchanges Exs\nwhere\n    (Ac.Id=Ex.accountID) and\n      (Ac.val_acc=Av.valute) and\n        (Exs.ID=Ex.EXCHANGEID)\n\n '

# Exchange/ExcangeDataModule.dfm:156 ODSConvertation (TOracleDataSet)
SQL_EX_ODSCONVERTATION = '\n\n SELECT   CONVERT.DAt,a1.val_name doffical,CONVERT.Ammount,CONVERT.Ammount_c,CONVERT.lammount,CONVERT.rate_d,CONVERT.rate_c,CONVERT.dacc_no,CONVERT.kacc_no , assignment.fullpath, \n          a2.val_name kcurrency,CONVERT.val_acc, a2.val_name coffical, assignment.shortname,  assignment.shortname Extra\n         ,(select ostat from operkurs where dat=CONVERT.dat and  val_kod=coalesce(decode(CONVERT.val_acc,0,null,CONVERT.val_acc),decode(CONVERT.currencyid_c,0,null,CONVERT.currencyid_c))) as Mbankkurs\n    FROM exconvert CONVERT,\n         convert_assignments assignment,\n         avalute a1,\n         avalute a2\n\n   WHERE\n      dat >= :begindate\n     AND dat <= :enddate  and\n     CONVERT.kassa_z = assignment.id\n     AND CONVERT.val_acc = a1.valute\n     AND CONVERT.currencyid_c = a2.valute\n\n    ORDER BY :title\n\n\n '

# Exchange/ExcangeDataModule.dfm:293 ODSTooling (TOracleDataSet)
SQL_EX_ODSTOOLING = 'Select\n  SE.RowID,\n  SE.nat_balance,\n  SE.for_balance\nFrom\n   SetExchange  SE'

# Exchange/ExcangeDataModule.dfm:311 ODSConvertDetail (TOracleDataSet)
SQL_EX_ODSCONVERTDETAIL = 'Select\n   CB.*,\n   CS.*\nFrom\n  ConvertBuy CB,\n     ConvertSell CS\nWhere\n    CB.dat = CS.dat and\n      CB.currencyid_c = CS.Val_acc and\n        ( CB.dat>=:BeginDate and CB.dat<=:EndDate )\nOrder by CB.dat\n\n\n\n'

# Exchange/ExcangeDataModule.dfm:387 ODSConvertBuy (TOracleDataSet)
SQL_EX_ODSCONVERTBUY = 'Select\n  *\nFrom\n  ConvertBuy\nWhere\n     dat>=:BeginDate and\n        dat<=:EndDate\n\nOrder by   dat\n        \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n'

# Exchange/ExcangeDataModule.dfm:588 ODSBankCode (TOracleDataSet)
SQL_EX_ODSBANKCODE = 'Select\n   Val_Mov as NB\nFrom\n   BankInfo'

# Exchange/ExcangeDataModule.dfm:599 Avalute (TOracleDataSet)
SQL_EX_AVALUTE = 'Select valute,val_name  from  Avalute\norder by valute'

# Exchange/ExcangeDataModule.dfm:616 ODSConvertSell (TOracleDataSet)
SQL_EX_ODSCONVERTSELL = 'Select\n  *\nFrom\n  ConvertSell\nWhere\n     dat>=:BeginDate and\n        dat<=:EndDate\n\nOrder by   dat\n        \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n'

# Exchange/ExcangeDataModule.dfm:818 Exchange (TOracleDataSet)
SQL_EX_EXCHANGE = 'SELECT\n       dat, currency, currencyname, intercode, buyrate, buyammount,\n       buyequivalent, minbuyrate, maxbuyrate, buycount, sellrate,\n       sellammount, sellequivalent, minsellrate, maxsellrate, sellcount\nFROM\n      exchange\nWHERE\n    Dat>=:BeginDate\n    and\n    Dat<=:EndDate\n\nOrder by :Title  ,currency'

# Exchange/ExcangeDataModule.dfm:924 TotalExchangeReport (TOracleDataSet)
SQL_EX_TOTALEXCHANGEREPORT = 'select\n  Currency,\n  max(CurrencyName) as CurrencyName,\n  sum(BuyCount) as BuyCount,\n  sum(SellCount) as SellCount,\n  sum(BuyAmmount)/1000 as BuyAmmount,\n  sum(SellAmmount)/1000 as SellAmmount,\n  round(sum(BuyEquivalent)/sum(BuyAmmount), 4) as AverageBuyRate,\n  round(sum(SellEquivalent)/sum(SellAmmount), 4) as AverageSellRate,\n  min(MinBuyRate) as MinBuyRate,\n  min(MinSellRate) as MinSellRate,\n  max(MaxBuyRate) as MaxBuyRate,\n  max(MaxSellRate) as MaxSellRate\nfrom \n  exchange\nwhere\n  dat between :BeginDate and :EndDate\ngroup by\n  currency\norder by\n  currency    \n \n '

# Exchange/ExcangeDataModule.dfm:1011 Convertation (TOracleDataSet)
SQL_EX_CONVERTATION = "select * from\n(\nselect\n   dat\n  ,debitcurrency as currency\n  ,cID\n  ,max(fullpath) as fullpath\n  ,sum(debitrate)/count(*)  as AverageRate\n  ,sum(debitamount) as AverageAmount\n  ,max(status) as status\nfrom\n  convertation\nwhere\n  status = 'BUY'\ngroup by\n   dat, debitcurrency, cID\n\nUNION\n\nselect\n   dat\n  ,creditcurrency as currency\n  ,cID\n  ,max(fullpath) as fullpath\n  ,sum(creditrate)/count(*) as AverageRate\n  ,sum(creditamount) as AverageAmount\n  ,max(status) as status\nfrom\n  convertation\nwhere\n  status = 'SELL'\ngroup by\n   dat, creditcurrency, cID\n\nOrder by\n  dat, status)\nwhere\n dat between :BeginDate and :EndDate\n    and status =:status\nOrder by\n  cID,currency,dat\n \n \n"

# Exchange/ExcangeDataModule.dfm:1097 Fullexcel (TOracleDataSet)
SQL_EX_FULLEXCEL = "select r1,Orta,AverageRate,AverageAmount,z2.fullpath,AverageRate*AverageAmount as ekv,say1,valname1\nfrom\n((\nselect 'Orta kurs' Orta ,AverageRate ,AverageAmount,rownum r1,say1,valname1 from\n(\nselect\n   dat\n  ,debitcurrency as currency\n  ,cID\n  ,max(fullpath) as fullpath\n  ,sum (debitrate*debitamount)/sum (debitamount)  as AverageRate\n  ,sum(debitamount) as AverageAmount\n  ,max(status) as status\n  ,count(*) as say1\n  ,DEBITCURRENCYNAME as valname1\nfrom\n  convertation\nwhere\n  status = 'BUY'\ngroup by\n   dat, debitcurrency, cID,DEBITCURRENCYNAME\n\nUNION\n\nselect\n   dat\n  ,creditcurrency as currency\n  ,cID\n  ,max(fullpath) as fullpath\n  ,sum (creditrate*creditamount)/sum (creditamount) as AverageRate\n  ,sum(creditamount) as AverageAmount\n  ,max(status) as status\n  ,count(*) as say1\n  ,CREDITCURRENCYYNAME as valname1\nfrom\n  convertation\nwhere\n  status = 'SELL'\ngroup by\n   dat, creditcurrency, cID,CREDITCURRENCYYNAME\n   Order by\n  dat, status)\nwhere\n dat between :BEGINDATE and :ENDDATE\n    and status =:status\nOrder by\n  cID,currency,dat   \n)) Z1\n\njoin\n\n(\nselect fullpath,a1,a3,rownum r2,say2,valname2 from\n\n(\nselect \nfullpath,\nSUM(AVERAGERATE*AVERAGEAMOUNT) / SUM(AVERAGEAMOUNT) a1 ,\nSUM(AVERAGEAMOUNT) a3,\nsay2,\nvalname2\nfrom\n\n(\n\nselect * from\n(\nselect\n   dat\n  ,debitcurrency as currency\n  ,cID\n  ,max(fullpath) as fullpath\n  ,sum (debitrate*debitamount)/sum (debitamount)  as AverageRate\n  ,sum(debitamount) as AverageAmount\n  ,max(status) as status\n  ,count(*) as say2\n  ,DEBITCURRENCYNAME as valname2\nfrom\n  convertation\nwhere\n  status = 'BUY'\ngroup by\n   dat, debitcurrency, cID,DEBITCURRENCYNAME\n\nUNION\n\nselect\n   dat\n  ,creditcurrency as currency\n  ,cID\n  ,max(fullpath) as fullpath\n  ,sum (creditrate*creditamount)/sum (creditamount) as AverageRate\n  ,sum(creditamount) as AverageAmount\n  ,max(status) as status\n  ,count(*) as say2\n  ,CREDITCURRENCYYNAME as valname2\nfrom\n  convertation\nwhere\n  status = 'SELL'\ngroup by\n   dat, creditcurrency, cID,CREDITCURRENCYYNAME\n\nOrder by\n  dat, status)\nwhere\n dat between :BEGINDATE and :ENDDATE\n    and status =:status\nOrder by\n  cID,currency,dat\n\n\n) group by fullpath,say2,valname2\n \n )) Z2\n \n on (Z1.r1=Z2.r2)"
