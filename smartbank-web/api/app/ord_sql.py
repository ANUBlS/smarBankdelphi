"""Verbatim SQL of Packages/Order (TOrderForm), generated from the DFMs by migration/tools/gensql.py (file:line of the dataset object).
Line structure = Delphi TStrings (SQL[i] indices). Do not edit."""

# Order/OrderDataModuleUnit.dfm:7 SYSDAT (TOracleDataSet)
SQL_ORD_SYSDAT = 'select\n  TEK_DAT\nfrom \n  SYSDAT'

# Order/OrderDataModuleUnit.dfm:22 CurrencyData (TOracleDataSet)
SQL_ORD_CURRENCYDATA = 'select\n  Valute ,\n  Val_Name ,\n  Valu_Name ,\n  Valu_Bala\nfrom \n  AVALUTE'

# Order/OrderDataModuleUnit.dfm:62 ContractAccs (TOracleDataSet)
SQL_ORD_CONTRACTACCS = 'select\n  Val_Acc ,\n  Acc_No ,\n  KLI_ID ,\n  Name\nfrom\n  Account\nwhere\n  Val_acc = :Val_Acc\norder by\n  Acc_No    '

# Order/OrderDataModuleUnit.dfm:104 ClientAccs (TOracleDataSet)
SQL_ORD_CLIENTACCS = 'select\n  Val_Acc ,\n  KLI_ID ,\n  Acc_No ,\n  Name\nfrom\n  Account\nwhere\n  Val_acc = :Val_Acc\n\norder by\n  Acc_No    \n \n '

# Order/OrderDataModuleUnit.dfm:149 ReserveAccs (TOracleDataSet)
SQL_ORD_RESERVEACCS = "select\n  Val_Acc ,\nKLI_ID ,\n  Acc_No ,\n  Name\nfrom\n  Account  ac ,\n  archost ar\nwhere\n  Val_acc = :Val_Acc and\n       ar.datdate =(select TEK_DAT from sysdat)\n    and ar.acc_id = ac.id\n    and ar.pok_ostat>0\n    and\n  (BAL_CN1 in\n    (select ACCGROUP from SBCM_ACC_ZONE_INFO\n    where zoneid = (select zoneid from sbcm_acc_zones where name = 'Reserv')))\n\norder by\n  Acc_No    \n \n \n "

# Order/OrderDataModuleUnit.dfm:220 BankInfoData (TOracleDataSet)
SQL_ORD_BANKINFODATA = 'select\n  Bank \nfrom BankInfo'
