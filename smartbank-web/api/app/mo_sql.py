"""Verbatim SQL of Packages/MemorialOrder (TfrmMemorialOrder), generated from the DFMs by migration/tools/gensql.py (file:line of the dataset object).
Line structure = Delphi TStrings (SQL[i] indices). Do not edit."""

# MemorialOrder/MOrdDataModImpl.dfm:14 Transactions (TOracleDataSet)
SQL_MO_TRANSACTIONS = 'select\n  P.ID as TransID ,\n  P.OP_ID as OperID ,\n  P.Dat as TransDate ,\n  DA.Acc_No as DebitAccount ,     --Debitor\n  DA.Name as DebitAccName ,       --Debit Account Name\n  DV.Val_Name as DebitCurrency ,\n  DC.INN as DebitTaxID ,\n  CA.Acc_No as CreditAccount ,    --Creditor\n  CA.Name as CreditAccName ,      --Credit Account Name\n  CV.Val_Name as CreditCurrency ,\n  CC.INN as CreditTaxID ,\n\n  P.Rate_D as DebitRate ,\n  P.Rate_C as CreditRate ,\n\n  P.Ammount as DebitAmount ,\n  P.Ammount_C as CreditAmount ,\n  P.LAmmount as LAmount\nfrom\n  Provarch P ,\n  Account DA ,\n  Account CA ,\n  Customers DC ,\n  Customers CC ,\n  Avalute DV ,\n  Avalute CV\nwhere\n  P.DAT between :FirstDate and :LastDate and\n  P.Debt = DA.ID and\n  P.Kredit = CA.ID and\n  DA.KLI_ID = DC.ID and\n  CA.KLI_ID = CC.ID and\n  DA.Val_Acc = DV.Valute and\n  CA.Val_Acc = CV.Valute and'

# MemorialOrder/MOrdDataModImpl.dfm:80 CurrencysData (TOracleDataSet)
SQL_MO_CURRENCYSDATA = 'select\n  valute as CurrencyID ,\n  valu_name as CurrencyLName\nfrom\n  Avalute'

# MemorialOrder/MOrdDataModImpl.dfm:134 Branches (TOracleDataSet)
SQL_MO_BRANCHES = 'select\n  ID as BranchID,\n  NAME as BranchName\nfrom\n FILIAL'

# MemorialOrder/MOrdDataModImpl.dfm:178 BankInfo (TOracleDataSet)
SQL_MO_BANKINFO = 'select\n  Az_Name as BankLName ,\n  INN     as TaxID ,\n  ManagerTitle ,\n  AccountantTitle ,\n  Sedr as Manager ,\n  Buhaltr as Accountant\nfrom\n  BankInfo '

# MemorialOrder/MOrdDataModImpl.dfm:240 Memorial (TOracleDataSet)
SQL_MO_MEMORIAL = 'select M.RowID ,M.BALANCE from Memorial M\n '

# MemorialOrder/MOrdDataModImpl.dfm:282 Sysdat (TOracleDataSet)
SQL_MO_SYSDAT = 'select\n TEK_DAT\nfrom SYSDAT'

# MemorialOrder/MOrdDataModImpl.dfm:325 Users (TOracleDataSet)
SQL_MO_USERS = 'select \n  ID UserID ,\n  Name as UserName\nfrom \n  user$'
