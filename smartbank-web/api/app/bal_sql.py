"""Verbatim SQL of the balance report packages (Balance, DBDBalance, TodayBalance, BalanceAnalys, AccBalanceCheck),
generated from the DFMs (file:line of the dataset object). Line structure = Delphi TStrings (SQL[i] indices). Do not edit."""

# Balance/UnitDataMod.dfm:7 ODSMain
SQL_BAL_ODSMAIN = 'begin\n  SB_BALANCEFILIDS.OpenCursor(:ACursor,:AStrParam1,:AStrParam2);\nend;'

# Balance/UnitDataMod.dfm:83 ODSRate
SQL_BAL_RATE = 'Select  Valute,Valu_Name  From  AValute'

# Balance/UnitDataMod.dfm:91 BranchDataSet
SQL_BAL_BRANCHES = 'Select\n    ID\n   ,Name\n   From  Filial'

# Balance/UnitDataMod.dfm:102 BalanceGroups
SQL_BAL_BALANCE_GROUPS = 'Select AccGroup,Bal_cn  as  BalanceNumber \nFrom Bal_Spr1 \nOrder By Bal_CN'

# Balance/UnitDataMod.dfm:180 ODSBalance
SQL_BAL_COMP_BALANCE = 'select * from balance order by code'

# Balance/UnitDataMod.dfm:210 ODSBankInfo
SQL_BAL_BANKINFO = 'select * from bankinfo'

# Balance/UnitDataMod.dfm:258 ODS_SETTINGS
SQL_BAL_SETTINGS = "select Value from SETTINGS\nwhere upper(name) ='PRODUCT_NAME'"

# Balance/UnitDataMod.dfm:267 ODS_BALANCE_SETTINGS
SQL_BAL_BALANCE_SETTINGS = 'select b.rowID, b.code, b.balance, b.name\nfrom BALANCE_SETTINGS b'

# Balance/UnitDataMod.dfm:280 SB_BalanceFilIDs
SQL_BAL_SELECTIONS = 'begin \nSB_BalanceFilIDs.:P_Procedure(:begDate, :endDate, :BalanceType, :CurrencyID,\n      :FormatID,:Param1 , :Param2, :BranchID);\nend;'

# Balance/UnitDataMod.dfm:381 OracleDataSet1
SQL_BAL_ACCOUNT_SELECTIONS = 'select SB_BalanceFilIDs.sb_AccountSelections(:begDate,:endDate,:BalanceType,:CurrencyID,:FormatID,:BalanceID) as result from dual'

# Balance/BalanceImplUnit.dfm:419 ODSBankInfo
SQL_BAL_NBINFO = 'Select  NB,BF   From BankInfo'

# Balance/UnitAnaliz.dfm:500 ODSAcc
SQL_BAL_AN_ACC = 'begin\n  sb_balancefilids.OpenCursor(:ACursor,:AStrParam1,:AStrParam2);\nend;\n \n \n \n \n'

# Balance/UnitAnaliz.dfm:557 ODSTurnOver
SQL_BAL_AN_TURNOVER = 'begin\n  sb_balancefilids.OpenCursor(:ACursor,:AStrParam1,:AStrParam2);\nend;'

# Balance/UnitAnaliz.dfm:599 ODSSum
SQL_BAL_AN_SUM = 'begin\n  SB_BALANCEFilIDS.OpenCursor(:ACursor,:AStrParam1,:AStrParam2);\nend;'

# Balance/UnitAnaliz.dfm:648 ODSBalance
SQL_BAL_AN_BALANCE = 'begin\n  SB_BALANCEFilIDs.OpenCursor(:ACursor,:AStrParam1,:AStrParam2);\nend;\n'

# DBDBalance/UnitDayByDayBalanceImpl.dfm:671 BalanceData
SQL_DBD_BALANCE = 'SELECT a.adate,\n       a.accountnum, a.accountname, a.active, a.passive,\n       a.debt_turnover, a.credit_turnover\n  FROM dbd_balance a\n\norder by ADate ,  AccountNum\n\n\n\n\n \n \n '

# DBDBalance/UnitDayByDayBalanceImpl.dfm:740 SYSDAT
SQL_DBD_SYSDAT = 'select \n  TEK_DAT\nfrom \n  SYSDAT'

# DBDBalance/UnitDayByDayBalanceImpl.dfm:761 Branches
SQL_DBD_BRANCHES = 'select \n  ID ,\n  NAME \nfrom FILIAL'

# DBDBalance/UnitDayByDayBalanceImpl.dfm:788 DataSetSinvol
SQL_DBD_SYMBOLS = 'SELECT a.symbol,  a.description\n  FROM account_flags a'

# DBDBalance/UnitDayByDayBalanceImpl.dfm:809 DataSetValute
SQL_DBD_VALUTE = 'SELECT valute,  valu_name \n  FROM avalute_t '

# DBDBalance/UnitDayByDayBalanceImpl.dfm:909 out_dbdbalancem
SQL_DBD_OUT_BALANCE = ' select\n  adate,accountnum,accountname,sum(active) as active ,sum(passive) as passive,sum(debt_turnover) as debt_turnover,\n sum(credit_turnover) as credit_turnover\n from out_dbd_balance --where acvalacc<>0\ngroup by accountnum,adate,accountname\n\n\n\n'

# TodayBalance/TB_DataModuleImpl.dfm:5 BalanceData
SQL_TB_BALANCE = 'select\n  b.bal_cn as AccountNumber ,\n  SUM (\n     sb_mtoutview.active (\n       ar.%sostat,            /*4*/\n       b.typeid,\n       b.additionaltypeid\n     )\n  ) Active,\n  SUM (\n     sb_mtoutview.passiv (\n        ar.%sostat,           /*11*/\n        b.typeid,\n        b.additionaltypeid\n     )\n  ) Passive,\n  SUM (ar.%sObr_D) as DTurnOver , /*16*/\n  SUM (ar.%sObr_K) as CTurnOver , /*17*/\n  MIN (b.balname) as AccountName\nfrom\n  %s ar ,        /*20*/\n  account ac ,\n  bal_spr1 b\nwhere\n (ac.filial = %d) and        /*24  -- Branch   */\n (ac.val_acc = %d) and       /*25  -- Currency */\n (ac.bal_cn1 in (%s)) and    /*26  -- By Selected Accounts */\n (ar.acc_id = ac.id) and\n (ac.bal_cn1 = b.bal_cn) and\n (ar.datdate = :TargetDate)\ngroup by\n  b.bal_cn\norder by b.bal_cn'

# TodayBalance/TB_DataModuleImpl.dfm:71 AccountData
SQL_TB_ACCOUNT = 'select\n  ac.acc_no   as AccNumber ,\n  av.val_name as AccCurrency ,\n  sb_mtoutview.active (\n    ar.%sostat,            /*4*/\n    b.typeid,\n    b.additionaltypeid\n  ) as Active ,\n\n  sb_mtoutview.passiv (\n     ar.%sostat,           /*10*/\n     b.typeid,\n     b.additionaltypeid\n  ) as Passive ,\n\n  ac.bal_cn1 as AccountNumber ,\n  ac.ID as AccID ,\n  ar.%sObr_D as DTurnOver , /*17*/\n  ar.%sObr_K as CTurnOver , /*18*/\n  ac.name as AccountName\nfrom\n  %s ar ,        /*21*/\n  account ac ,\n  bal_spr1 b ,\n  avalute av\nwhere\n (ac.filial = %d) and        /*26  -- Branch   */\n (ac.val_acc = %d) and       /*27  -- Currency */\n (ac.bal_cn1 = :AccountNumber) and\n (ar.acc_id = ac.id) and\n (ac.bal_cn1 = b.bal_cn) and\n (ar.datdate = :TargetDate) and\n (ac.val_acc = av.valute) and\n ((ac.Close_Dat is null)or(ac.close_dat > :TargetDate))'

# TodayBalance/TB_DataModuleImpl.dfm:171 SYSDAT
SQL_TB_SYSDAT = 'select TEK_DAT as CurrentDate from SMART.SYSDAT'

# TodayBalance/TB_DataModuleImpl.dfm:183 BankInfo
SQL_TB_BANKINFO = "select * from(\nSELECT kod_b, 'Ümumi' bank, az_name, krno, inn, seher, adress,\n       sedr, buhaltr, tel, fax, swift, telex, email,\n       post_in, -1 kod_fil, filial, adres_fil, tel_fil,\n       fax_fil, swift_fil, telex_fil, postin_fil, seher_fil,\n       inn_fil, krno_fil, sedrfil, buhal_fil, kod_bfil, nb,\n       val_mov, logo, link, sdv, svm, bf, managertitle,\n       accountanttitle, svm_currencyid, capital, assistant,\n       assistanttitle, reg_no, license_no, fond_reg_no,\n       license_fil, rentity_id, license_date, tax_regcode\n  FROM bankinfo_t\n  where kod_fil=0\n  union all\nSELECT kod_b, bank, az_name, krno, inn, seher, adress,\n       sedr, buhaltr, tel, fax, swift, telex, email,\n       post_in, kod_fil, filial, adres_fil, tel_fil,\n       fax_fil, swift_fil, telex_fil, postin_fil, seher_fil,\n       inn_fil, krno_fil, sedrfil, buhal_fil, kod_bfil, nb,\n       val_mov, logo, link, sdv, svm, bf, managertitle,\n       accountanttitle, svm_currencyid, capital, assistant,\n       assistanttitle, reg_no, license_no, fond_reg_no,\n       license_fil, rentity_id, license_date, tax_regcode\n  FROM bankinfo_t)\n  where kod_fil=:a\n"

# TodayBalance/TB_DataModuleImpl.dfm:248 CurrencyInfo
SQL_TB_CURRENCY = 'select\n  Valute as Currency ,\n  Valu_Name as CurrLName \nfrom\n  Avalute\norder by valute'

# TodayBalance/TB_DataModuleImpl.dfm:277 BranchesInfo
SQL_TB_BRANCHES = 'select\n  ID as BranchID ,\n  Name as BranchName \nfrom\n  Filial'

# TodayBalance/TB_DataModuleImpl.dfm:305 TransactionsData
SQL_TB_TRANSACTIONS = 'SELECT\n  p.ID,\n  ad.ID as DebitAccID ,\n  ac.ID as CreditAccID ,\n    sbsec.getusername(p.OP_ID) as OperatorID,\n  p.dat as TransactionDate,\n  ad.ACC_NO as DebitAccNo,\n  dc.val_name as DebitCurrencySName,\n  ac.ACC_NO as CreditAccNo,\n  cc.val_name as CreditCurrencySName,\n  p.ammount as DebitAmount,\n  p.Ammount_C as CreditAmount,\n  p.LAmmount as LAmount,\n  p.Name as TrDescription\nFROM\n  %s p, /*15*/\n    account ad,\n    account ac,\n    avalute dc,\n    avalute cc\nwhere\n (ad.ID = p.DEBT) and\n (ac.ID = p.KREDIT) and\n (ad.val_acc = p.val_acc) and\n (ac.val_acc = p.CurrencyID_C) and\n (dc.VALUTE = p.val_acc) and\n (cc.VALUTE = p.CurrencyID_C) and\n (p.dat = :TargetDate)'

# TodayBalance/TB_DataModuleImpl.dfm:413 WorkDateData
SQL_TB_WORKDATE = 'select \n  max(dat) as WorkDate\nfrom Operkurs\nwhere \n   dat<=:RealDate'

# BalanceAnalys/DataModuleBalance.dfm:10 Balance
SQL_BA_BALANCE = '  SELECT   lastremainder.balancebill AS balanceaccount,\n         firstremainder.active AS firstactive,\n         firstremainder.passive AS firstpassive,\n         turnovers.dturnover,\n         turnovers.cturnover,\n         lastremainder.active AS lastactive,\n         lastremainder.passive AS lastpassive\n    FROM (SELECT   b.bal_cn balancebill,\n                   SUM (\n                      sb_mtoutview.active (\n                         ar.%sostat, /*10*/\n                         b.typeid,\n                         b.additionaltypeid\n                      )\n                   ) active,\n                   SUM (\n                      sb_mtoutview.passiv (\n                         ar.%sostat,     /*17*/\n                         b.typeid,\n                         b.additionaltypeid\n                      )\n                   ) passive\n              FROM archost ar, ACCOUNT ac, bal_spr%d b /*22*/\n             WHERE (ar.acc_id = ac.id)\n               AND (ac.bal_cn%d = b.bal_cn)    /*24*/\n               /*25 BRANCH and CURRENCY*/\n               AND (ar.datdate = :BeginPeriod)\n          GROUP BY\n           b.bal_cn) firstremainder,\n         (SELECT   b.bal_cn balancebill,\n                   SUM (ar.%sobr_d) dturnover,/*30*/\n                   SUM (ar.%sobr_k) cturnover /*31*/\n              FROM archost ar, ACCOUNT ac, bal_spr%d b /*32*/\n             WHERE (ar.acc_id = ac.id)\n               AND (ac.bal_cn%d = b.bal_cn)                 /*34*/\n               /*35 BRANCH and CURRENCY*/\n               AND (ar.datdate BETWEEN :BeginDate AND :EndDate)\n          GROUP BY b.bal_cn) turnovers,\n         (SELECT  b.bal_cn balancebill,\n                   SUM (\n                      sb_mtoutview.active (\n                         ar.%sostat,/*41*/\n                         b.typeid,\n                         b.additionaltypeid\n                      )\n                   ) active,\n                   SUM (\n                      sb_mtoutview.passiv (\n                         ar.%sostat,/*48*/\n                         b.typeid,\n                         b.additionaltypeid\n                      )\n                   ) passive\n              FROM archost ar, ACCOUNT ac, bal_spr%d b  /*53*/\n             WHERE (ar.acc_id = ac.id)\n               AND (ac.bal_cn%d = b.bal_cn)  /*55*/\n               /*56 BRANCH and CURRENCY*/\n               AND (ar.datdate = :EndDate)\n          GROUP BY\n           b.bal_cn) lastremainder\n   WHERE\n    lastremainder.balancebill = firstremainder.balancebill(+)\n     AND lastremainder.balancebill = turnovers.balancebill\nORDER BY lastremainder.balancebill \n\n\n\n\n\n\n\n\n\n \n \n \n '

# BalanceAnalys/DataModuleBalance.dfm:143 Account
SQL_BA_ACCOUNT = 'select\n  RestForLastPeriod.AccountID , RestForLastPeriod.Name ,\n  RestForLastPeriod.AccNo ,\n  RestForLastPeriod.CurrencyID ,\n  RestForLastPeriod.BranchID ,\n  RestForLastPeriod.BalanceNo ,\n  RestForFirstPeriod.Active as BeginActive ,\n  RestForFirstPeriod.Passive as BeginPassive ,\n  TurnOvers.DTurnOver ,\n  TurnOvers.CTurnOver ,\n  RestForLastPeriod.Active as EndActive ,\n  RestForLastPeriod.Passive as EndPassive\nfrom\n\n(select\n  ac.ID as AccountID ,\n  ac.acc_no as AccNo ,\n  b.bal_cn  as BalanceNo ,\n\n  sb_mtoutview.active (\n    ar.%sostat,  /*20*/\n    b.typeid,\n    b.additionaltypeid\n  ) as Active ,\n\n  sb_mtoutview.passiv (\n     ar.%sostat,   /*26*/\n     b.typeid,\n     b.additionaltypeid\n  ) as Passive\n\nfrom\n  account ac ,\n  archost ar ,\n  bal_spr%d b  /*34*/\nwhere\n  ar.acc_id = ac.id and\n  ac.bal_cn%d = b.bal_cn and     /*37*/\n  ar.DatDate = :BeginPeriod and\n  ((ac.Close_Dat is null)or(ac.Close_Dat > :BeginPeriod))\n) RestForFirstPeriod ,\n\n(select\n  ac.ID as AccountID , ac.name ,\n  ac.acc_no as AccNo ,\n  ac.val_acc as CurrencyID ,\n  ac.filial as BranchID ,\n  b.bal_cn  as BalanceNo ,\n\n  sb_mtoutview.active (\n    ar.%sostat,  /*50*/\n    b.typeid,\n    b.additionaltypeid\n  ) as Active ,\n\n  sb_mtoutview.passiv (\n     ar.%sostat,  /*56*/\n     b.typeid,\n     b.additionaltypeid\n  ) as Passive\n\nfrom\n  account ac ,\n  archost ar ,\n  bal_spr%d b  /*64*/\nwhere\n  ar.acc_id = ac.id and\n  ac.bal_cn%d = b.bal_cn and  /*67*/\n  ar.DatDate = :EndDate and\n  ((ac.Close_Dat is null)or(ac.Close_Dat > :EndDate))\n) RestForLastPeriod ,\n\n(select\n  ac.ID as AccountID ,\n  min(ac.acc_no) as AccNo,\n  min(b.bal_cn)  as BalanceNo ,\n  sum(ar.%sObr_D) as DTurnOver , /*76*/\n  sum(ar.%sObr_K) as CTurnOver   /*77*/\nfrom\n  account ac ,\n  archost ar ,\n  bal_spr%d b  /*81*/\nwhere\n  ar.acc_id = ac.id and\n  ac.bal_cn%d = b.bal_cn and /*84*/\n  ar.DatDate between :BeginDate and :EndDate\ngroup by\n  ac.ID\n) TurnOvers\n\nwhere\n  /* Branch & Currency*/\n  RestForLastPeriod.AccountID = RestForFirstPeriod.AccountID  (+) and\n  RestForLastPeriod.AccountID = TurnOvers.AccountID\n  --and\n  --RestForLastPeriod.BalanceNo =:BalanceNo\n\norder by\n  RestForLastPeriod.AccNo\n \n \n\n \n \n \n'

# BalanceAnalys/DataModuleBalance.dfm:324 Transaction
SQL_BA_TRANSACTION = 'select\n      t.ID,t.op_id as OperatorID, t.vid_op as OperationType,c.bal_cn1 kreditbalans,d.bal_cn1 debetbalans,\n      t.dat, t.DEBT, d.acc_no as DebtAcc, dv.val_name as DValName,\n      t.KREDIT, c.acc_no as CreditAcc, cv.val_name as CValName,\n      t.ammount, t.ammount_c, t.lammount, t.name, SB_EXPERTANALYSE.GetUserName(t.op_id) as UserName\nfrom\n      provarch t,\n      account d,\n      account c,\n      avalute dv,\n      avalute cv\nwhere\n     t.DEBT = d.ID and\n     t.KREDIT = c.ID and\n     t.val_acc = dv.valute and\n     t.currencyID_c = cv.valute and\n     /* 16 Operator & Operation Type*/\n     t.dat between :BeginDate and :EndDate\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\norder by\n     :Title\n\n \n '

# BalanceAnalys/DataModuleBalance.dfm:482 Operators
SQL_BA_OPERATORS = 'Select * from user$ order by ID'

# BalanceAnalys/DataModuleBalance.dfm:511 OperationType
SQL_BA_BRANCHES = 'select  \n   ID, Name \nfrom \n   filial \norder by ID'

# BalanceAnalys/DataModuleBalance.dfm:525 PeriodData
SQL_BA_PERIOD = 'select \n  Max(dat) as BeginPeriod\nfrom \n  Operkurs\nwhere \n  dat<:BeginDate'

# BalanceAnalys/DataModuleBalance.dfm:541 SysDat
SQL_BA_SYSDAT = 'select tek_dat from sysdat'

# BalanceAnalys/DataModuleBalance.dfm:554 Currency
SQL_BA_CURRENCY = 'select valute, valu_name from avalute order by valute\n'

# BalanceAnalys/DataModuleBalance.dfm:578 debtTransaction
SQL_BA_DEBT_TRANSACTION = 'select\n      t.ID,t.op_id as OperatorID, t.vid_op as OperationType,c.bal_cn1 kreditbalans,d.bal_cn1 debetbalans,\n      t.dat, t.DEBT, d.acc_no as DebtAcc, dv.val_name as DValName,\n      t.KREDIT, c.acc_no as CreditAcc, cv.val_name as CValName,\n      t.ammount, t.ammount_c, t.lammount, t.name, SB_EXPERTANALYSE.GetUserName(t.op_id) as UserName\nfrom\n      provarch t,\n      account d,\n      account c,\n      avalute dv,\n      avalute cv\nwhere\n     t.DEBT = d.ID and\n     t.KREDIT = c.ID and\n     t.val_acc = dv.valute and\n     t.currencyID_c = cv.valute and\n     /* 16 Operator & Operation Typ------------e*/\n     t.dat between :BeginDate and :EndDate\n\n\n\n\n\n\n\n\n\norder by\n     :Title\n\n \n '

# BalanceAnalys/DataModuleBalance.dfm:720 credTransaction
SQL_BA_CRED_TRANSACTION = 'select\n      t.ID,t.op_id as OperatorID, t.vid_op as OperationType,c.bal_cn1 kreditbalans,d.bal_cn1 debetbalans,\n      t.dat, t.DEBT, d.acc_no as DebtAcc, dv.val_name as DValName,\n      t.KREDIT, c.acc_no as CreditAcc, cv.val_name as CValName,\n      t.ammount, t.ammount_c, t.lammount, t.name, SB_EXPERTANALYSE.GetUserName(t.op_id) as UserName\nfrom\n      provarch t,\n      account d,\n      account c,\n      avalute dv,\n      avalute cv\nwhere\n     t.DEBT = d.ID and\n     t.KREDIT = c.ID and\n     t.val_acc = dv.valute and\n     t.currencyID_c = cv.valute and\n     /* 16 Operator & Operation Typ------------e*/\n     t.dat between :BeginDate and :EndDate\n\n\n\norder by\n     :Title\n\n \n '

# BalanceAnalys/DataModuleBalance.dfm:856 credbal_acc
SQL_BA_CREDBAL_ACC = '\nselect sum(t.ammount) cem,d.bal_cn1 debetbalans ,c.bal_cn1 kreditbalans\nfrom\n      provarch t,\n      account d,\n      account c\n   \nwhere\n     t.DEBT = d.ID and\n     t.KREDIT = c.ID and     \n t.dat between  :BeginDate and :EndDate and\nt.kredit= :Kredits\n\n\n\n\n\n\n    group by d.bal_cn1  ,c.bal_cn1 \n '

# BalanceAnalys/DataModuleBalance.dfm:909 debtbal_acc
SQL_BA_DEBTBAL_ACC = '\nselect sum(t.ammount) cem,d.bal_cn1 debetbalans ,c.bal_cn1 kreditbalans\nfrom\n      provarch t,\n      account d,\n      account c\n   \nwhere\n     t.DEBT = d.ID and\n     t.KREDIT = c.ID and     \n t.dat between  :BeginDate and :EndDate and\nt.debt= :debts\n\n\n\n\n\n\n    group by d.bal_cn1  ,c.bal_cn1 \n '

# AccBalanceCheck/AccBalanceCheckFormImpl.dfm:103 Accs
SQL_ABC_ACCS = 'select\n  acc.ID, acc.ACC_NO as AccountNo, acc.Name as AccName,\n  t.ostat as Amount, t.pok_ostat as LAmount, t.obr_d as DebitTurnover,\n  t.pok_obr_d as DebitLTurnover, t.obr_k as CreditTurnover, t.pok_obr_k as CreditLTurnover\nfrom\n  account acc,\n  tenostat t\nwhere\n  t.acc_id = acc.ID'
