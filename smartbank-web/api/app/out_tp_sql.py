"""Verbatim SQL of Packages/Out_turn_over_for_period (TTurnOvers_Form), generated from the DFMs by migration/tools/gensql.py (file:line of the dataset object).
Line structure = Delphi TStrings (SQL[i] indices). Do not edit."""

# Out_turn_over_for_period/ocx/TurnOversDataMod.dfm:5 CurrencyData (TOracleDataSet)
SQL_OTP_CURRENCYDATA = 'select\n  valute as CurrencyID ,\n  valu_name as CurrLName \nfrom\n  avalute'

# Out_turn_over_for_period/ocx/TurnOversDataMod.dfm:29 BranchData (TOracleDataSet)
SQL_OTP_BRANCHDATA = 'select \n  id as BranchID ,\n  name as BranchName\nfrom filial'

# Out_turn_over_for_period/ocx/TurnOversDataMod.dfm:61 TurnOversData (TOracleDataSet)
SQL_OTP_TURNOVERSDATA = 'select\n  RestForLastPeriod.AccountID, RestForLastPeriod.ClientID ,\n  RestForLastPeriod.AccNo , RestForLastPeriod.AccName as ACC_NAME ,\n  RestForLastPeriod.CurrencyID ,\n  RestForLastPeriod.BranchID ,\n  RestForLastPeriod.BalanceNo ,\n  RestForFirstPeriod.Active as BeginActive ,\n  RestForFirstPeriod.Passive as BeginPassive ,\n  RestForFirstPeriod.LActive as LBeginActive ,\n  RestForFirstPeriod.LPassive as LBeginPassive ,\n  TurnOvers.DTurnOver ,\n  TurnOvers.CTurnOver ,\n  TurnOvers.LDTurnOver ,\n  TurnOvers.LCTurnOver ,\n  RestForLastPeriod.Active as EndActive ,\n  RestForLastPeriod.Passive as EndPassive ,\n  RestForLastPeriod.LActive as LEndActive ,\n  RestForLastPeriod.LPassive as LEndPassive ,  RestForLastPeriod.expert as expert\nfrom\n\n(select\n  ac.ID as AccountID ,\n  ac.acc_no as AccNo ,\n  b.bal_cn  as BalanceNo ,\n\n  out_sb_mtoutview.active (\n    ar.ostat,\n    b.typeid,\n    b.additionaltypeid\n  ) as Active ,\n\n  out_sb_mtoutview.passiv (\n     ar.ostat,\n     b.typeid,\n     b.additionaltypeid\n  ) as Passive ,\n\n  out_sb_mtoutview.active (\n    ar.pok_ostat,\n    b.typeid,\n    b.additionaltypeid\n  ) as LActive ,\n\n  out_sb_mtoutview.passiv (\n     ar.pok_ostat,\n     b.typeid,\n     b.additionaltypeid\n  ) as LPassive\n\nfrom\n  out_account ac ,\n  out_archost ar ,\n  out_bal_spr%d b  /*52*/\nwhere\n  ar.acc_id = ac.id and\n  ac.bal_cn%d = b.bal_cn and     /*55*/\n  ar.DatDate = :BeginPeriod and\n  ((ac.Close_Dat is null)or(ac.Close_Dat > :BeginPeriod))\n) RestForFirstPeriod ,\n\n(select\n  ac.ID as AccountID, ac.kli_ID as ClientID,(select name from cm_expert where id=ac.tempid)as expert,\n  ac.acc_no as AccNo , ac.name as AccName ,\n  ac.val_acc as CurrencyID ,\n  ac.filial as BranchID ,\n  b.bal_cn  as BalanceNo ,\n\n  out_sb_mtoutview.active (\n    ar.ostat,\n    b.typeid,\n    b.additionaltypeid\n  ) as Active ,\n\n  out_sb_mtoutview.passiv (\n     ar.ostat,\n     b.typeid,\n     b.additionaltypeid\n  ) as Passive ,\n\n  out_sb_mtoutview.active (\n    ar.pok_ostat,\n    b.typeid,\n    b.additionaltypeid\n  ) as LActive ,\n\n  out_sb_mtoutview.passiv (\n     ar.pok_ostat,\n     b.typeid,\n     b.additionaltypeid\n  ) as LPassive\n\nfrom\n  out_account ac ,\n  out_archost ar ,\n  out_bal_spr%d b  /*94*/\nwhere\n  ar.acc_id = ac.id and\n  ac.bal_cn%d = b.bal_cn and  /*97*/\n  ar.DatDate = :EndDate and\n  ((ac.Close_Dat is null)or(ac.Close_Dat > :EndDate))\n) RestForLastPeriod ,\n\n(select\n  ac.ID as AccountID ,\n  min(ac.acc_no) as AccNo,\n  min(b.bal_cn)  as BalanceNo ,\n  sum(ar.Obr_D) as DTurnOver ,\n  sum(ar.Obr_K) as CTurnOver ,\n  sum(ar.Pok_Obr_D) as LDTurnOver ,\n  sum(ar.Pok_Obr_K) as LCTurnOver\n\nfrom\n  out_account ac ,\n  out_archost ar ,\n  out_bal_spr%d b  /*114*/\nwhere\n  ar.acc_id = ac.id and\n  ac.bal_cn%d = b.bal_cn and /*117*/\n  ar.DatDate between :BeginDate and :EndDate\ngroup by\n  ac.ID\n) TurnOvers\n\nwhere\n  (RestForLastPeriod.BalanceNo in (%s)) and /*124*/\n  RestForLastPeriod.CurrencyID = %d and /*125*/\n  RestForLastPeriod.BranchID = %d and /*126*/\n  RestForLastPeriod.AccountID = RestForFirstPeriod.AccountID  (+) and\n  RestForLastPeriod.AccountID = TurnOvers.AccountID\n\norder by\n  RestForLastPeriod.AccNo\n'

# Out_turn_over_for_period/ocx/TurnOversDataMod.dfm:303 SYSDAT (TOracleDataSet)
SQL_OTP_SYSDAT = 'select tek_dat from sysdat'

# Out_turn_over_for_period/ocx/TurnOversDataMod.dfm:315 PeriodPrefixData (TOracleDataSet)
SQL_OTP_PERIODPREFIXDATA = 'select \n  MAX(DAT) as PeriodPrefix\nfrom \n  Operkurs\nwhere \n  DAT<:ADATE'

# Out_turn_over_for_period/ocx/TurnOversDataMod.dfm:334 BankInfo (TOracleDataSet)
SQL_OTP_BANKINFO = 'select\n  Bank ,\n  INN ,\n  Logo ,\n  ManagerTitle ,\n  AccountantTitle ,\n  Sedr as Manager ,\n  Buhaltr as Accountant\nfrom BankInfo\n \n '

# Out_turn_over_for_period/ocx/TurnOversDataMod.dfm:387 DSout_achost (TOracleDataSet)
SQL_OTP_DSOUT_ACHOST = 'select max(datdate) as dat from out_archost\nwhere datdate<=:p_dat'

# Out_turn_over_for_period/ocx/TurnOversDataMod.dfm:403 DSout_achost1 (TOracleDataSet)
SQL_OTP_DSOUT_ACHOST1 = 'select max(datdate) as dat from out_archost\nwhere datdate<:p_dat'
