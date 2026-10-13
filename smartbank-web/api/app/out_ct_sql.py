"""Verbatim SQL of Packages/Out_control_tape (TFrmControlTape), generated from the DFMs by migration/tools/gensql.py (file:line of the dataset object).
Line structure = Delphi TStrings (SQL[i] indices). Do not edit."""

# Out_control_tape/untdatamod.dfm:5 ForMoney (TOracleDataSet)
SQL_OCT_FORMONEY = 'Select Valute,Valu_Name from avalute'

# Out_control_tape/untdatamod.dfm:13 ForTable (TOracleDataSet)
SQL_OCT_FORTABLE = 'Select\n  a.bal_cn1,\n   Sum(p.Ammount) as AMMOUNTS,\n    Sum(p.lammount)  as  LAMMOUNTS\nFrom\n  out_provarch p,\n   out_account a\nWhere\n  a.id=p.debt\n    and  p.dat=:ADate\n\nGroup by Bal_cn1\n\n \n\n '

# Out_control_tape/untdatamod.dfm:55 BanksName (TOracleDataSet)
SQL_OCT_BANKSNAME = 'select bank from bankinfo'

# Out_control_tape/untdatamod.dfm:63 Group (TOracleDataSet)
SQL_OCT_GROUP = 'Select\n  a.bal_cn1\n ,p.val_acc\n ,out_sb_complex_transactions.getcurrencyname(p.val_acc) as currencyname\n ,p.Ammount\n ,p.lammount\nFrom\n out_provarch p,\n out_account a\nWhere\n a.id=p.debt\n and p.dat=:ADate\n\nOrder by\n   a.Bal_Cn1,p.val_acc\n\n\n\n \n '

# Out_control_tape/untdatamod.dfm:123 ODSTransactionView (TOracleDataSet)
SQL_OCT_ODSTRANSACTIONVIEW = 'Select\n    d.bal_cn1 BalanceAccount,\n      d.acc_no Debit,\n       d.val_acc DebitCurrency,\n        dc.val_name DValName,\n         c.acc_no Credit,\n         c.val_acc CreditCurrency,\n          cc.val_name CValName,\n           p.ammount DebitAmmount,\n            p.ammount_c CreditAmmount,\n             p.lammount CommonAmmount,\n              p.name \n From \n    out_Provarch p,\n     out_Account d,\n      out_Account c,\n       Avalute dc,\n        Avalute cc\nWhere\n   p.debt = d.id and\n     p.kredit = c.id and\n      d.val_acc = dc.valute and\n        c.val_acc = cc.valute and\n          p.dat =:TransactionDate\nOrder by d.bal_cn1'

# Out_control_tape/untdatamod.dfm:194 Branch (TOracleDataSet)
SQL_OCT_BRANCH = "select -1 as ID, 'Bütün filiallar' as Name from Dual\nUnion\nselect ID, name from filial"
