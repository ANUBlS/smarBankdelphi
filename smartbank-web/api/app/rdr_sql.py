"""Verbatim SQL of Packages/RateDifferenceReport (TRateDifferenceReportX), generated from the DFMs by migration/tools/gensql.py (file:line of the dataset object).
Line structure = Delphi TStrings (SQL[i] indices). Do not edit."""

# RateDifferenceReport/ReportDataModule.dfm:12 Transactions (TOracleDataSet)
SQL_RDR_TRANSACTIONS = 'Select\n   Transactions.*\n  ,Debet.acc_no DebetAccount\n  ,DebetCurrency.val_name DCurrency\n  ,Credit.acc_no CreditAccount\n  ,CreditCurrency.val_name CCurrency\nFrom \n   Provarch Transactions\n  ,Account Debet\n  ,Account Credit\n  ,Avalute DebetCurrency\n  ,Avalute CreditCurrency\nWhere\n   (Transactions.debt = Debet.ID)\n      and\n   (Transactions.kredit = Credit.ID)\n      and\n   (Transactions.ammount = 0 or transactions.ammount_c = 0)\n      and\n   (Transactions.val_acc=DebetCurrency.valute)\n      and\n   (Transactions.currencyid_c=CreditCurrency.valute)\n      and\n  (Transactions.dat between :BeginDate and :EndDate)\n\nOrder by\n    :Title\n \n \n \n '

# RateDifferenceReport/ReportDataModule.dfm:123 Currency (TOracleDataSet)
SQL_RDR_CURRENCY = 'Select  \n   *\nFrom\n   Avalute\nwhere \n  valute <> 0\nOrder By \n    Valute'

# RateDifferenceReport/ReportDataModule.dfm:137 Filials (TOracleDataSet)
SQL_RDR_FILIALS = 'Select\n   *\nfrom\n  Filial\norder by\n    ID  '

# RateDifferenceReport/ReportDataModule.dfm:157 Operators (TOracleDataSet)
SQL_RDR_OPERATORS = 'Select\n    *\nfrom\n   User$\norder by\n   ID '
