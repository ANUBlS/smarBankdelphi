"""Verbatim SQL of Packages/out_repair (RepairNewDataModule.dfm SQL.Strings, joined with CRLF like TStrings.Text). Generated, do not hand-edit."""

# RepairNewDataModule.dfm:7-55 TransactionData
SQL_TRANSACTIONS = 'SELECT\r\n  p.rowid,\r\n  p.ID,\r\n  p.OP_ID as OperatorID,\r\n  p.dat as TransactionDate,\r\n  p.DEBT as DebitID,\r\n  ad.ACC_NO as DebitAccNo,\r\n  ad.filial as DebFil,\r\n  p.VAL_ACC as DebitCurrencyID,\r\n  dc.val_name as DebitCurrencySName,\r\n  p.KREDIT as CreditID,\r\n  ac.ACC_NO as CreditAccNo,\r\n  ac.filial as CredFil,\r\n  p.CurrencyID_C as CreditCurrencyID,\r\n  cc.val_name as CreditCurrencySName,\r\n  p.ammount as DebitAmount,\r\n  p.Ammount_C as CreditAmount,\r\n  p.LAmmount as LAmount,\r\n  p.Rate_D as DebitRate,\r\n  p.Rate_C as CreditRate,\r\n  p.Bank_D as DebitBank,\r\n  p.Bank_K as CreditBank,\r\n  p.NO_PACK as PackageNumber,\r\n  p.SHIFR as CYPHERCODE,\r\n  p.VID_OP as OPERATIONCODE,\r\n  p.Kassa_B as INBALANCECHAR,\r\n  p.Kassa_Z as OUTBALANCECHAR,\r\n  p.NO_FILIAL as FilialID,\r\n  ad.bal_cn1 as DebitBalance, \r\n  p.Name,\r\n  p.Vid_op as OperationType\r\nFROM\r\n out_provarch p,\r\n out_account ad,\r\n out_account ac,\r\n avalute dc,\r\n avalute cc\r\nwhere\r\n p.dat between :DAT and :DAT2\r\n and (ad.ID = p.DEBT)\r\n and (ac.ID = p.KREDIT)\r\n and (ad.val_acc = p.val_acc)\r\n and (ac.val_acc = p.CurrencyID_C)\r\n and (dc.VALUTE = p.val_acc) \r\n and (cc.VALUTE = p.CurrencyID_C)\r\n  ORDER BY :Title\r\n\r\n \r\n'
# RepairNewDataModule.dfm:194-206 DebetRateData
SQL_RATES = 'select\r\n  currency.valute as id,\r\n  currency.val_name as Name,\r\n  currency.valu_name as Description,\r\n  rates.OSTAT as Rate\r\nfrom\r\n  avalute currency,\r\n  OperKurs rates\r\nwhere\r\n currency.VALUTE=rates.VAL_KOD\r\n and dat=:Dat\r\norder by ID\r\n'
# RepairNewDataModule.dfm:286-288 CurDebetData
SQL_CURRENCIES = 'select valute,val_name,valu_name\r\nfrom avalute\r\n'
# RepairNewDataModule.dfm:348-368 DebetAccData
SQL_DEBIT_ACCOUNTS = 'select \r\n  a.id,\r\n  a.kli_id,\r\n  a.acc_no,\r\n  a.val_acc,\r\n  a.name,\r\n  a.open_dat,\r\n  a.bal_cn1,\r\n  a.bal_cn2,\r\n  a.bal_cn3,\r\n  a.bal_cn4,\r\n  b.CashIncoming as IsCacheAccount\r\n from  \r\nout_account a , \r\n  Out_Bal_SPR1 b\r\nwhere \r\nval_acc = :val_acc and\r\n (A.CLOSE_DAT is null)\r\n and (b.bal_cn = a.bal_cn1)\r\nORDER BY ACC_NO\r\n'
# RepairNewDataModule.dfm:427-447 CreditAccData
SQL_CREDIT_ACCOUNTS = 'select \r\n  a.id,\r\n  a.kli_id,\r\n  a.acc_no,\r\n  a.val_acc,\r\n  a.name,\r\n  a.open_dat,\r\n  a.bal_cn1,\r\n  a.bal_cn2,\r\n  a.bal_cn3,\r\n  a.bal_cn4,\r\n  b.CashIncoming as IsCacheAccount\r\n from  \r\nout_account a , \r\n  out_Bal_SPR1 b\r\nwhere\r\n val_acc = :val_acc and\r\n (A.CLOSE_DAT is null)\r\n  and (b.bal_cn = a.bal_cn1)\r\nORDER BY ACC_NO\r\n'
# RepairNewDataModule.dfm:516-517 TrDescriptionData
SQL_TRDESCRIPTION = 'select * from out_trdestination\r\n'
# RepairNewDataModule.dfm:534-536 OutBalanceCharData
SQL_CONVERT = 'select * from CONVERT_ASSIGNMENTS\r\norder by ID\r\n'
# RepairNewDataModule.dfm:573-575 InBalanceCharData
SQL_KASSA = 'select * from KASSA_B\r\norder by symbol\r\n'
# RepairNewDataModule.dfm:612-613 UsersData
SQL_USERS = 'select * from user$\r\n'
# RepairNewDataModule.dfm:643-644 Valutes
SQL_VALUTES = 'select valute,valu_name from avalute\r\n'
# RepairNewDataModule.dfm:654-656 VidOp
SQL_VIDOP = 'select id,name from vid_op\r\norder by id\r\n'
# RepairNewDataModule.dfm:666-667 FilialDebetData
SQL_FILIAL = 'select * from filial\r\n'

PKG_CORRECT = "Out_Correct"   # RepairNewDataModule.dfm pcCorrect PackageName, ParameterMode = pmNamed
