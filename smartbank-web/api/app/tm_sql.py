"""Verbatim SQL of Packages/TransactionManager (generated from the DFM SQL.Strings, do not hand-edit).
Source: TransactionDataModuleUnit.dfm (line = object declaration) and TransactionDestinationImpl.dfm."""

# TransactionDataModuleUnit.dfm:339 Transactions
SQL_TRANSACTIONS = "SELECT\n  p.ID,\n  P.rowid,\n  p.OP_ID as OperatorID,\n  p.no_prov as OperationNo,\n  p.dat as TransactionDate,\n  p.DEBT as DebitID,\n  ad.ACC_NO as DebitAccNo,\n  p.VAL_ACC as DebitCurrencyID,\n  dc.val_name as DebitCurrencySName,\n  ad.filial as DebitBranch,\n  p.KREDIT as CreditID,\n  ac.ACC_NO as CreditAccNo,\n  p.CurrencyID_C as CreditCurrencyID,\n  cc.val_name as CreditCurrencySName,\n  ac.filial as CreditBranch,\n  p.ammount as DebitAmount,\n  p.Ammount_C as CreditAmount,\n  p.LAmmount as LAmount,\n  p.Rate_D as DebitRate,\n  p.Rate_C as CreditRate,\n  p.Bank_D as DebitBank,\n  p.Bank_K as CreditBank,\n  p.NO_PACK as PackageNumber,\n  p.SHIFR as CYPHERCODE,\n\n  sb_expertanalyse.getoperationtype(p.vid_op, p.val_acc, p.currencyID_c) as OPERATIONCODE,\n  p.Kassa_B as INBALANCECHAR,\n  p.Kassa_Z as OUTBALANCECHAR,\n  p.NO_FILIAL as FilialID,\n  ad.bal_cn1 as DebitBalance,\n  p.Name,\n  sb_aca.getuserbyid(p.op_id) as usr ,\n  sb_aca.getuserbyid(p.commit_opid) as usrcommit ,\n  0 as Flags,\n  2 as status,\n  '' as REJECT_REASON,\n  p.reportid,\n  p.countrid\n\nFROM\n    account ad,\n    account ac,\n    avalute dc,\n    avalute cc,\n    provarch p\nwhere\n    p.dat =:TransactionDate\n    and (ad.ID = p.DEBT)\n    and (ac.ID = p.KREDIT)\n    and (ad.val_acc = p.val_acc)\n    and (ac.val_acc = p.CurrencyID_C)\n    and (dc.VALUTE = p.val_acc)\n    and (cc.VALUTE = p.CurrencyID_C)\n    and ((P.OP_ID<>-1 and\n\n          not EXISTS(select SUSER from sba_userman where MUSER=uid and (type#=1 or type#=0)))\n          or\n\n          (P.OP_ID in(select SUSER from sba_userman where MUSER=uid and (type#=1 or type#=0))))\n\nunion all\n\nSELECT\n  p.ID,\n  P.rowid,\n  p.OP_ID as OperatorID,\n  p.no_prov as OperationNo,\n  p.dat as TransactionDate,\n  p.DEBT as DebitID,\n  ad.ACC_NO as DebitAccNo,\n  p.VAL_ACC as DebitCurrencyID,\n  dc.val_name as DebitCurrencySName,\n  ad.filial as DebitBranch,\n  p.KREDIT as CreditID,\n  ac.ACC_NO as CreditAccNo,\n  p.CurrencyID_C as CreditCurrencyID,\n  cc.val_name as CreditCurrencySName,\n  ac.filial as CreditBranch,\n  p.ammount as DebitAmount,\n  p.Ammount_C as CreditAmount,\n  p.LAmmount as LAmount,\n  p.Rate_D as DebitRate,\n  p.Rate_C as CreditRate,\n  p.Bank_D as DebitBank,\n  p.Bank_K as CreditBank,\n  p.NO_PACK as PackageNumber,\n  p.SHIFR as CYPHERCODE,\n\n  sb_expertanalyse.getoperationtype(p.vid_op, p.val_acc, p.currencyID_c) as OPERATIONCODE,\n  p.Kassa_B as INBALANCECHAR,\n  p.Kassa_Z as OUTBALANCECHAR,\n  p.NO_FILIAL as FilialID,\n  ad.bal_cn1 as DebitBalance,\n  p.Name,\n  sb_aca.getuserbyid(p.op_id) as usr ,\n  '' as usrcommit ,\n\n  0 as Flags,\n  decode(Rejected, 0, 1, 3) as status,\n  RejectReason as REJECT_REASON,\n  p.reportid,\n  p.countrid\n\n\nFROM\n    account ad,\n    account ac,\n    avalute dc,\n    avalute cc,\n    LAZYTRANSACTION p\nwhere\n    p.dat =:TransactionDate\n    and (ad.ID = p.DEBT)\n    and (ac.ID = p.KREDIT)\n    and (dc.VALUTE = p.val_acc)\n    and (cc.VALUTE = p.CurrencyID_C)\n  and ((P.OP_ID<>-1 and\n\n        not EXISTS(select SUSER from sba_userman where MUSER=uid and (type#=1 or type#=0)))\n        or\n\n        (P.OP_ID in(select SUSER from sba_userman where MUSER=uid and (type#=1 or type#=0))))\n\nOrder by :Title"
# TransactionDataModuleUnit.dfm:5 Sysdat
SQL_SYSDAT = 'select tek_dat from sysdat'
# TransactionDataModuleUnit.dfm:29 DebitCurrencyData (= CreditCurrencyData :75)
SQL_CURRENCIES = 'select\n  currency.valute as ID,\n  currency.val_name as SName,\n  currency.valu_name as Name,\n  rates.OSTAT as Rate\nfrom\n  avalute currency,\n  TEMPRATE rates\nwhere\n  rates.VAL_KOD = currency.VALUTE\norder by currency.valute'
# TransactionDataModuleUnit.dfm:121 DebitAccData (CreditAccData :195 is the same text but for one blank line)
SQL_ACCOUNTS = 'SELECT\n  A.ID,\n  A.ACC_NO,\n  SUBSTR(acc_no,:src_pos,30) as ACC_No_Search,\n  A.VAL_ACC,\n  A.NAME,\n  B.CASHINCOMING AS ISCACHEACCOUNT\nFROM\n  ACCOUNT A\n ,BAL_SPR1 B \nWHERE\n  A.BAL_CN1 = B.BAL_CN\n  AND\n  A.CLOSE_DAT IS NULL\nORDER BY ACC_NO\n '
# TransactionDataModuleUnit.dfm:274 ConvertationSymbols
SQL_CONVERT_SYMBOLS = 'select * from CONVERT_ASSIGNMENTS\norder by ID\n'
# TransactionDataModuleUnit.dfm:290 CashSymbols
SQL_CASH_SYMBOLS = 'SELECT\n  symbol,\n  name,\n  mediocrity\nFROM\n  kassa_b\norder by symbol '
# TransactionDataModuleUnit.dfm:310 Currency
SQL_CURRENCY_CHECK = 'Select valute from Avalute'
# TransactionDataModuleUnit.dfm:319 OperationTypes
SQL_OPERATION_TYPES = 'select\n  *\nfrom\n  vid_op\nwhere\n  id>=0\norder by id'
# TransactionDataModuleUnit.dfm:650 DebitBranch (= CreditBranch :664)
SQL_BRANCHES = 'select * from filial order by ID'
# TransactionDataModuleUnit.dfm:683 Users
SQL_USERS = 'select * from user$\nwhere sb_aca.checkLockUser_num(name)=0\n      order by name'
# TransactionDataModuleUnit.dfm:694 Operations
SQL_OPERATIONS = 'SELECT \n   id, name\nFROM \n   vid_op\nOrder by\n   ID\n'
# TransactionDataModuleUnit.dfm:710 Valute
SQL_VALUTE = 'select valute,valu_name from avalute order by valute'
# TransactionDataModuleUnit.dfm:727 Commission
SQL_COMMISSION = 'select\n    id\n   ,name\n   ,debt\n\n   ,sb_complex_transactions.getaccountnumber(debt) as DebitAccount\n\n   ,sb_complex_transactions.GetAccountCurrency(debt) as DebitCurrency\n\n   ,sb_complex_transactions.getaccountcurrencyid(debt) as DebitCurrencyID\n   ,credit\n\n   ,sb_complex_transactions.getaccountnumber(credit) as CreditAccount\n\n   ,sb_complex_transactions.GetAccountCurrency(credit) as CreditCurrency\n\n   ,sb_complex_transactions.getaccountcurrencyid(credit) as CreditCurrencyID   \n   ,additionalDebt\n\n   ,sb_complex_transactions.getaccountnumber(additionalDebt) as ADebitAccount\n\n   ,sb_complex_transactions.GetAccountCurrency(additionalDebt) as ADebitCurrency\n\n   ,sb_complex_transactions.getaccountcurrencyid(additionalDebt) as AddDebitCurrencyID      \n   ,additionalCredit\n\n   ,sb_complex_transactions.getaccountnumber(additionalCredit) as ACreditAccount\n\n   ,sb_complex_transactions.GetAccountCurrency(additionalCredit) as ACreditCurrency\n\n   ,sb_complex_transactions.getaccountcurrencyid(additionalCredit) as AddCreditCurrencyID         \n   ,assignment\n   ,commisionassignment\n   ,UserID   \nfrom\n    commision_trans\nwhere\n   UserID = 0 or\n    UserID = (SBLogin.UserID)\norder by\n    name  '
# TransactionDataModuleUnit.dfm:898 Destinations
SQL_DESTINATIONS = 'select d.*, d.rowid from TRDESTINATION d\norder by name'
# TransactionDataModuleUnit.dfm:912 DebitAccRestData (= CreditAccRestData :936)
SQL_ACC_REST = 'Select\n  ACC_ID\n ,Ostat\n ,Pok_ostat\nfrom\n  Tenostat\nwhere\n  acc_id =:acc_id\n \n '
# TransactionDataModuleUnit.dfm:960 ReportDesc
SQL_REPORT_DESCS = 'select d.*, d.rowid from reportdescs d\norder by name'
# TransactionDataModuleUnit.dfm:977 Country
SQL_COUNTRIES = 'select d.*, d.rowid from provcountries d\norder by name'
# TransactionDataModuleUnit.dfm:1055 ODS_StatusT
SQL_STATUST = "select s.RowID, s.* from Settings s\nwhere upper(name)='TRANSACTION_STATUST'"
# TransactionDataModuleUnit.dfm:1071 ODS_VidOPTrDel
SQL_VIDOP_TRDEL = 'select count(0) Cnt from vid_OP\nwhere ID =:v_ID and TrDelete =1'
# TransactionDataModuleUnit.dfm:1083 ODS_Settings
SQL_SRC_POS = "select value from settings\n where name='AccNoSearchPos'"
# TransactionDestinationImpl.dfm:98 TrDest (F3 destination picker, by ID)
SQL_TRDEST = 'select d.*, d.rowid from TRDESTINATION d\norder by ID\n'
