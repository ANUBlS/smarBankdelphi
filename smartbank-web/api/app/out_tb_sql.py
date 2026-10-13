"""Verbatim SQL of Packages/Out_todaybalance (TFrmTodayBalance), generated from the DFMs by migration/tools/gensql.py (file:line of the dataset object).
Line structure = Delphi TStrings (SQL[i] indices). Do not edit."""

# Out_todaybalance/ocx/TB_DataModuleImpl.dfm:5 BalanceData (TOracleDataSet)
SQL_OTB_BALANCEDATA = 'select\n  b.bal_cn as AccountNumber ,\n  SUM (\n     out_sb_mtoutview.active (\n       ar.%sostat,            /*4*/\n       b.typeid,\n       b.additionaltypeid\n     )\n  ) Active,\n  SUM (\n     out_sb_mtoutview.passiv (\n        ar.%sostat,           /*11*/\n        b.typeid,\n        b.additionaltypeid\n     )\n  ) Passive,\n  SUM (ar.%sObr_D) as DTurnOver , /*16*/\n  SUM (ar.%sObr_K) as CTurnOver , /*17*/\n  MIN (b.balname) as AccountName\nfrom\n  out_archost ar ,        /*20*/\n  out_account ac ,\n  out_bal_spr1 b\nwhere\n (ac.filial = %d) and        /*24  -- Branch   */\n (ac.val_acc = %d) and       /*25  -- Currency */\n (ac.bal_cn1 in (%s)) and    /*26  -- By Selected Accounts */\n (ar.acc_id = ac.id) and\n (ac.bal_cn1 = b.bal_cn) and\n (ar.datdate = :TargetDate)\ngroup by b.bal_cn\norder by b.bal_cn\n\n\n\n\n \n '

# Out_todaybalance/ocx/TB_DataModuleImpl.dfm:53 AccountData (TOracleDataSet)
SQL_OTB_ACCOUNTDATA = 'select\n  ac.acc_no   as AccNumber ,\n  av.val_name as AccCurrency ,\n  out_sb_mtoutview.active (\n    ar.ostat,            /*4*/\n    b.typeid,\n    b.additionaltypeid\n  ) as Active ,\n\n  out_sb_mtoutview.passiv (\n     ar.ostat,           /*10*/\n     b.typeid,\n     b.additionaltypeid\n  ) as Passive ,\n\n  ac.bal_cn1 as AccountNumber ,\n  ac.ID as AccID ,\n  ar.Obr_D as DTurnOver , /*17*/\n  ar.Obr_K as CTurnOver , /*18*/\n  ac.name as AccountName\nfrom\n  out_archost ar ,        /*21*/\n  out_account ac ,\n  out_bal_spr1 b ,\n  avalute av\nwhere\n (ac.filial = %d) and        /*26  -- Branch   */\n (ac.val_acc = %d) and       /*27  -- Currency */\n (ac.bal_cn1 = :AccountNumber) and\n (ar.acc_id = ac.id) and\n (ac.bal_cn1 = b.bal_cn) and\n (ar.datdate = :TargetDate) and\n (ac.val_acc = av.valute) and\n ((ac.Close_Dat is null)or(ac.close_dat > :TargetDate))\n\n\n\n\n\n \n \n \n \n \n \n '

# Out_todaybalance/ocx/TB_DataModuleImpl.dfm:124 SYSDAT (TOracleDataSet)
SQL_OTB_SYSDAT = 'select TEK_DAT as CurrentDate from SMART.SYSDAT'

# Out_todaybalance/ocx/TB_DataModuleImpl.dfm:139 BankInfo (TOracleDataSet)
SQL_OTB_BANKINFO = 'select\n  Bank ,\n  INN ,\n  SEDR ,\n  BUHALTR ,\n  ManagerTitle ,\n  AccountantTitle ,\n  Logo\nfrom\n  Bankinfo'

# Out_todaybalance/ocx/TB_DataModuleImpl.dfm:191 CurrencyInfo (TOracleDataSet)
SQL_OTB_CURRENCYINFO = 'select\n  Valute as Currency ,\n  Valu_Name as CurrLName \nfrom\n  Avalute\norder by valute'

# Out_todaybalance/ocx/TB_DataModuleImpl.dfm:220 BranchesInfo (TOracleDataSet)
SQL_OTB_BRANCHESINFO = 'select\n  ID as BranchID ,\n  Name as BranchName \nfrom\n  Filial'

# Out_todaybalance/ocx/TB_DataModuleImpl.dfm:248 TransactionsData (TOracleDataSet)
SQL_OTB_TRANSACTIONSDATA = 'SELECT\n  p.ID,\n  ad.ID as DebitAccID ,\n  ac.ID as CreditAccID ,\n \tsbsec.getusername(p.OP_ID) as OperatorID,\n  p.dat as TransactionDate,\n  ad.ACC_NO as DebitAccNo,\n  dc.val_name as DebitCurrencySName,\n  ac.ACC_NO as CreditAccNo,\n  cc.val_name as CreditCurrencySName,\n  p.ammount as DebitAmount,\n  p.Ammount_C as CreditAmount,\n  p.LAmmount as LAmount,\n  p.Name as TrDescription\nFROM\n  out_provarch p, /*15*/\n\tout_account ad,\n\tout_account ac,\n\tavalute dc,\n\tavalute cc\nwhere\n (ad.ID = p.DEBT) and\n (ac.ID = p.KREDIT) and\n (ad.val_acc = p.val_acc) and\n (ac.val_acc = p.CurrencyID_C) and\n (dc.VALUTE = p.val_acc) and\n (cc.VALUTE = p.CurrencyID_C) and\n (p.dat = :TargetDate)\n\n\n '

# Out_todaybalance/ocx/TB_DataModuleImpl.dfm:355 WorkDateData (TOracleDataSet)
SQL_OTB_WORKDATEDATA = 'select \n  max(dat) as WorkDate\nfrom Operkurs\nwhere \n   dat<=:RealDate'
