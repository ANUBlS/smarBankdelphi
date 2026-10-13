"""Verbatim SQL of Packages/Out_transaction_manager (generated from DFM SQL.Strings, do not hand-edit).
Source: TransactionDataModuleUnit.dfm and out_TransactionDestinationForm.dfm."""

# TransactionDataModuleUnit.dfm:5 Sysdat
SQL_SYSDAT = 'select tek_dat from sysdat'
# TransactionDataModuleUnit.dfm:29 DebitCurrencyData (DebitCurrencyData (= CreditCurrencyData))
SQL_CURRENCIES = 'select\n  currency.valute as ID,\n  currency.val_name as SName,\n  currency.valu_name as Name,\n  rates.OSTAT as Rate\nfrom\n  avalute currency,\n  TEMPRATE rates\nwhere\n  rates.VAL_KOD = currency.VALUTE\norder by currency.valute'
# TransactionDataModuleUnit.dfm:119 DebitAccData (DebitAccData (CreditAccData similar))
SQL_ACCOUNTS = 'SELECT\n   ID,\n   ACC_NO,\n  VAL_ACC,\n   NAME,\n p.cashincoming as ISCACHEACCOUNT\nFROM \n  OUT_ACCOUNT   PARTITION ( ACTIVACC ) a, out_bal_spr1 p \nwhere close_dat is null and a.bal_cn1=p.bal_cn and a.kli_id=:v_custid\nORDER BY name\n\n\n\n\n/*\n\nSELECT\n  ID,\n  ACC_NO,\n  VAL_ACC,\n  NAME,\n  OUT_ISCASHBALANCE(BAL_CN1) AS ISCACHEACCOUNT\nFROM\n  OUT_ACCOUNT --PARTITION ( ACTIVACC ) \nwhere close_dat is null\nORDER BY name\n*/\n/*\nCREATE OR REPLACE\nFUNCTION iscashbalance( BALANCE out_BAL_SPR1.BAL_CN%TYPE ) RETURN  out_BAL_SPR1.CASHINCOMING%TYPE\nIS\n  RESULT out_BAL_SPR1.CASHINCOMING%TYPE;\nBEGIN\n  SELECT CASHINCOMING INTO RESULT FROM out_BAL_SPR1 WHERE BAL_CN = BALANCE;\n  RETURN RESULT;\nEND;\n*/'
# TransactionDataModuleUnit.dfm:300 ConvertationSymbols
SQL_CONVERT_SYMBOLS = 'select * from CONVERT_ASSIGNMENTS\norder by ID\n'
# TransactionDataModuleUnit.dfm:316 CashSymbols
SQL_CASH_SYMBOLS = 'SELECT\n  symbol,\n  name,\n  mediocrity\nFROM\n  kassa_b\norder by symbol '
# TransactionDataModuleUnit.dfm:336 Currency
SQL_CURRENCY_CHECK = 'Select valute from Avalute'
# TransactionDataModuleUnit.dfm:345 OperationTypes
SQL_OPERATION_TYPES = 'select\n  *\nfrom\n  vid_op\nwhere\n  id>=0\norder by id'
# TransactionDataModuleUnit.dfm:365 Transactions (TransactionDataModuleUnit.dfm Transactions)
SQL_TRANSACTIONS = "SELECT\n  p.ID,\n  P.rowid,\n  p.OP_ID as OperatorID,\n  p.no_prov as OperationNo,\n  p.dat as TransactionDate,\n  p.DEBT as DebitID,\n  ad.ACC_NO as DebitAccNo,\n  p.VAL_ACC as DebitCurrencyID,\n  dc.val_name as DebitCurrencySName,\n  ad.filial as DebitBranch,\n  p.KREDIT as CreditID,\n  ac.ACC_NO as CreditAccNo,\n  p.CurrencyID_C as CreditCurrencyID,\n  cc.val_name as CreditCurrencySName,\n  ac.filial as CreditBranch,\n  p.ammount as DebitAmount,\n  p.Ammount_C as CreditAmount,\n  p.LAmmount as LAmount,\n  p.Rate_D as DebitRate,\n  p.Rate_C as CreditRate,\n  p.Bank_D as DebitBank,\n  p.Bank_K as CreditBank,\n  p.NO_PACK as PackageNumber,\n  p.SHIFR as CYPHERCODE,\n  sb_expertanalyse.getoperationtype(p.vid_op, p.val_acc, p.currencyID_c) as OPERATIONCODE,\n  p.Kassa_B as INBALANCECHAR,\n  p.Kassa_Z as OUTBALANCECHAR,\n  p.NO_FILIAL as FilialID,\n  ad.bal_cn1 as DebitBalance,\n  p.Name,\n  sb_aca.getuserbyid(p.op_id) as usr ,\n  sb_aca.getuserbyid(p.commit_opid) as usrcommit ,\n  0 as Flags,\n  2 as status,\n  '' as REJECT_REASON,\n  ad.kli_id dcustid,\n  ac.kli_id ccustid\nFROM\n    out_account ad,\n    out_account ac,\n    avalute dc,\n    avalute cc,\n    out_provarch p\nwhere\n    p.dat =:TransactionDate\n    and (ad.ID = p.DEBT)\n    and (ac.ID = p.KREDIT)\n    and (ad.val_acc = p.val_acc)\n    and (ac.val_acc = p.CurrencyID_C)\n    and (dc.VALUTE = p.val_acc)\n    and (cc.VALUTE = p.CurrencyID_C)\n--    and ((P.OP_ID<>-1 and\n  --        not EXISTS(select SUSER from sba_userman where MUSER=uid and (type#=1 or type#=0)))\n    --      or\n      --    (P.OP_ID in(select SUSER from sba_userman where MUSER=uid and (type#=1 or type#=0))))\n\nunion all\n\nSELECT\n  p.ID,\n  P.rowid,\n  p.OP_ID as OperatorID,\n  p.no_prov as OperationNo,\n  p.dat as TransactionDate,\n  p.DEBT as DebitID,\n  ad.ACC_NO as DebitAccNo,\n  p.VAL_ACC as DebitCurrencyID,\n  dc.val_name as DebitCurrencySName,\n  ad.filial as DebitBranch,\n  p.KREDIT as CreditID,\n  ac.ACC_NO as CreditAccNo,\n  p.CurrencyID_C as CreditCurrencyID,\n  cc.val_name as CreditCurrencySName,\n  ac.filial as CreditBranch,\n  p.ammount as DebitAmount,\n  p.Ammount_C as CreditAmount,\n  p.LAmmount as LAmount,\n  p.Rate_D as DebitRate,\n  p.Rate_C as CreditRate,\n  p.Bank_D as DebitBank,\n  p.Bank_K as CreditBank,\n  p.NO_PACK as PackageNumber,\n  p.SHIFR as CYPHERCODE,\n  sb_expertanalyse.getoperationtype(p.vid_op, p.val_acc, p.currencyID_c) as OPERATIONCODE,\n  p.Kassa_B as INBALANCECHAR,\n  p.Kassa_Z as OUTBALANCECHAR,\n  p.NO_FILIAL as FilialID,\n  ad.bal_cn1 as DebitBalance,\n  p.Name,\n  sb_aca.getuserbyid(p.op_id) as usr ,\n  '' as usrcommit , \n  0 as Flags,\n  decode(Rejected, 0, 1, 3) as status,\n  RejectReason as REJECT_REASON,\nad.kli_id dcustid,\n  ac.kli_id ccustid\nFROM\n    out_account ad,\n    out_account ac,\n    avalute dc,\n    avalute cc,\n    out_LAZYTRANSACTION p\nwhere\n    p.dat =:TransactionDate\n    and (ad.ID = p.DEBT)\n    and (ac.ID = p.KREDIT)\n    and (dc.VALUTE = p.val_acc)\n    and (cc.VALUTE = p.CurrencyID_C)\n  --  and ((P.OP_ID<>-1 and\n    --      not EXISTS(select SUSER from sba_userman where MUSER=uid and (type#=1 or type#=0)))\n      --    or\n        --  (P.OP_ID in(select SUSER from sba_userman where MUSER=uid and (type#=1 or type#=0))))\n\n"
# TransactionDataModuleUnit.dfm:655 DebitBranch (DebitBranch (= CreditBranch))
SQL_BRANCHES = 'select * from filial order by ID'
# TransactionDataModuleUnit.dfm:688 Users
SQL_USERS = 'select * from user$'
# TransactionDataModuleUnit.dfm:697 Operations
SQL_OPERATIONS = 'SELECT \n   id, name\nFROM \n   vid_op\nOrder by\n   ID\n'
# TransactionDataModuleUnit.dfm:713 Valute
SQL_VALUTE = 'select valute,valu_name from avalute order by valute'
# TransactionDataModuleUnit.dfm:730 Commission
SQL_COMMISSION = 'select\n    id\n   ,name\n   ,debt\n   ,out_sb_complex_transactions.getaccountnumber(debt) as DebitAccount\n   ,out_sb_complex_transactions.GetAccountCurrency(debt) as DebitCurrency\n   ,out_sb_complex_transactions.getaccountcurrencyid(debt) as DebitCurrencyID\n   ,credit\n   ,out_sb_complex_transactions.getaccountnumber(credit) as CreditAccount\n   ,out_sb_complex_transactions.GetAccountCurrency(credit) as CreditCurrency\n   ,out_sb_complex_transactions.getaccountcurrencyid(credit) as CreditCurrencyID   \n   ,additionalDebt\n   ,out_sb_complex_transactions.getaccountnumber(additionalDebt) as ADebitAccount\n   ,out_sb_complex_transactions.GetAccountCurrency(additionalDebt) as ADebitCurrency\n   ,out_sb_complex_transactions.getaccountcurrencyid(additionalDebt) as AddDebitCurrencyID      \n   ,additionalCredit\n   ,out_sb_complex_transactions.getaccountnumber(additionalCredit) as ACreditAccount\n   ,out_sb_complex_transactions.GetAccountCurrency(additionalCredit) as ACreditCurrency\n   ,out_sb_complex_transactions.getaccountcurrencyid(additionalCredit) as AddCreditCurrencyID         \n   ,assignment\n   ,commisionassignment\n   ,UserID   \nfrom\n    commision_trans\nwhere\n   UserID = 0 or\n    UserID = (SBLogin.UserID)\norder by\n    name  '
# TransactionDataModuleUnit.dfm:901 Destinations
SQL_DESTINATIONS = 'select d.*, d.rowid from OUT_TRDESTINATION d\norder by name'
# TransactionDataModuleUnit.dfm:918 DebitAccRestData (DebitAccRestData (= CreditAccRestData))
SQL_ACC_REST = 'Select\n  ACC_ID\n ,Ostat\n ,Pok_ostat\nfrom\n  out_Tenostat\nwhere\n  acc_id =:acc_id\n \n '
# out_TransactionDestinationForm.dfm:117 TrDest
SQL_TRDEST = 'select d.*, d.rowid from OUT_TRDESTINATION d\norder by ID\n'

# Lookup single OUT_ACCOUNT by id (validation helper; not a DFM dataset)

# Lookup single OUT_ACCOUNT by id (validation helper; not a DFM dataset)
SQL_ACCOUNT_BY_ID = """SELECT ID, ACC_NO, VAL_ACC, NAME, p.cashincoming as ISCACHEACCOUNT
FROM OUT_ACCOUNT a, out_bal_spr1 p
where a.id=:id and a.bal_cn1=p.bal_cn"""
