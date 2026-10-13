"""Verbatim SQL of Packages/Out_Balance (TOut_Balance), generated from the DFMs by migration/tools/gensql.py (file:line of the dataset object).
Line structure = Delphi TStrings (SQL[i] indices). Do not edit."""

# Out_Balance/out_UnitDataMod.dfm:7 ODSMain (TOracleDataSet)
SQL_OBAL_ODSMAIN = 'begin\n out_SB_BALANCEFILIDS.OpenCursor(:ACursor,:AStrParam1,:AStrParam2);\nend;'

# Out_Balance/out_UnitDataMod.dfm:83 ODSRate (TOracleDataSet)
SQL_OBAL_ODSRATE = 'Select  Valute,Valu_Name  From  AValute'

# Out_Balance/out_UnitDataMod.dfm:91 BranchDataSet (TOracleDataSet)
SQL_OBAL_BRANCHDATASET = 'Select\n    ID\n   ,Name\n   From  Filial'

# Out_Balance/out_UnitDataMod.dfm:102 BalanceGroups (TOracleDataSet)
SQL_OBAL_BALANCEGROUPS = 'Select AccGroup,Bal_cn  as  BalanceNumber \nFrom Bal_Spr1 \nOrder By Bal_CN'

# Out_Balance/out_UnitDataMod.dfm:119 AboutBank (TOracleDataSet)
SQL_OBAL_ABOUTBANK = 'Select\n  *\nFrom\n  BankInfo   '

# Out_Balance/out_UnitDataMod.dfm:162 OrDSFilialIDsBalance (TOracleDataSet)
SQL_OBAL_ORDSFILIALIDSBALANCE = 'Drop Table out_FilialIDsBalance\n;\nCreate Table out_FilialIDsBalance\n(FilialID Integer\n);'

# Out_Balance/out_UnitDataMod.dfm:180 ODSBalance (TOracleDataSet)
SQL_OBAL_ODSBALANCE = 'select * from balance order by code'

# Out_Balance/out_UnitDataMod.dfm:210 ODSBankInfo (TOracleDataSet)
SQL_OBAL_ODSBANKINFO = 'select * from bankinfo'

# Out_Balance/out_UnitDataMod.dfm:255 ODS_SETTINGS (TOracleDataSet)
SQL_OBAL_ODS_SETTINGS = "select Value from SETTINGS\nwhere upper(name) ='PRODUCT_NAME'"

# Out_Balance/out_UnitDataMod.dfm:264 ODS_BALANCE_SETTINGS (TOracleDataSet)
SQL_OBAL_ODS_BALANCE_SETTINGS = 'select b.rowID, b.code, b.balance, b.name\nfrom BALANCE_SETTINGS b'

# Out_Balance/out_UnitDataMod.dfm:277 OUT_SB_BalanceFilIDs (TOracleQuery)
SQL_OBAL_OUT_SB_BALANCEFILIDS = 'begin \nout_SB_BalanceFilIDs.:P_Procedure(:begDate, :endDate, :BalanceType, :CurrencyID,\n      :FormatID,:Param1 , :Param2, :BranchID);\nend;'

# Out_Balance/out_UnitDataMod.dfm:378 OracleDataSet1 (TOracleDataSet)
SQL_OBAL_ORACLEDATASET1 = 'select SB_BalanceFilIDs.sb_AccountSelections(:begDate,:endDate,:BalanceType,:CurrencyID,:FormatID,:BalanceID) as result from dual'

# Out_Balance/Out_BalanceImpl.dfm:496 ODSBankInfo (TOracleDataSet)
SQL_OBAL_ODSBANKINFO_OUT_BALANCEIMPL = 'Select  NB,BF   From BankInfo'
