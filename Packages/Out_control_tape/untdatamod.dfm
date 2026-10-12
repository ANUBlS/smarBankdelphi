object control_tape_mod: Tcontrol_tape_mod
  OldCreateOrder = False
  Height = 177
  Width = 447
  object ForMoney: TOracleDataSet
    SQL.Strings = (
      'Select Valute,Valu_Name from avalute')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 192
    Top = 16
  end
  object ForTable: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  a.bal_cn1,'
      '   Sum(p.Ammount) as AMMOUNTS,'
      '    Sum(p.lammount)  as  LAMMOUNTS'
      'From'
      '  out_provarch p,'
      '   out_account a'
      'Where'
      '  a.id=p.debt'
      '    and  p.dat=:ADate'
      ''
      'Group by Bal_cn1'
      ''
      ' '
      ''
      ' ')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00410044004100540045000C00000000000000
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 16
    Top = 16
    object ForTableBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
    end
    object ForTableAMMOUNTS: TFloatField
      FieldName = 'AMMOUNTS'
      DisplayFormat = '#,##.00'
    end
    object ForTableLAMMOUNTS: TFloatField
      FieldName = 'LAMMOUNTS'
      DisplayFormat = '#,##.00'
    end
  end
  object DataSource1: TDataSource
    DataSet = ForTable
    Left = 88
    Top = 16
  end
  object BanksName: TOracleDataSet
    SQL.Strings = (
      'select bank from bankinfo')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 272
    Top = 8
  end
  object Group: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  a.bal_cn1'
      ' ,p.val_acc'
      
        ' ,out_sb_complex_transactions.getcurrencyname(p.val_acc) as curr' +
        'encyname'
      ' ,p.Ammount'
      ' ,p.lammount'
      'From'
      ' out_provarch p,'
      ' out_account a'
      'Where'
      ' a.id=p.debt'
      ' and p.dat=:ADate'
      ''
      'Order by'
      '   a.Bal_Cn1,p.val_acc'
      ''
      ''
      ''
      ' '
      ' ')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00410044004100540045000C00000000000000
      00000000}
    Session = sboapiDataModule.SBSession
    OnCalcFields = GroupCalcFields
    Left = 16
    Top = 64
    object GroupBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
    end
    object GroupAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object GroupLAMMOUNT: TFloatField
      FieldName = 'LAMMOUNT'
    end
    object GroupVAL_ACC: TFloatField
      FieldName = 'VAL_ACC'
    end
    object GroupCURRENCYNAME: TWideStringField
      FieldName = 'CURRENCYNAME'
      Size = 4000
    end
    object GroupOperationDate: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'OperationDate'
      Calculated = True
    end
  end
  object OraclePackage1: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'Out_SB_Balance'
    Left = 88
    Top = 72
  end
  object ODSTransactionView: TOracleDataSet
    SQL.Strings = (
      'Select'
      '    d.bal_cn1 BalanceAccount,'
      '      d.acc_no Debit,'
      '       d.val_acc DebitCurrency,'
      '        dc.val_name DValName,'
      '         c.acc_no Credit,'
      '         c.val_acc CreditCurrency,'
      '          cc.val_name CValName,'
      '           p.ammount DebitAmmount,'
      '            p.ammount_c CreditAmmount,'
      '             p.lammount CommonAmmount,'
      '              p.name '
      ' From '
      '    out_Provarch p,'
      '     out_Account d,'
      '      out_Account c,'
      '       Avalute dc,'
      '        Avalute cc'
      'Where'
      '   p.debt = d.id and'
      '     p.kredit = c.id and'
      '      d.val_acc = dc.valute and'
      '        c.val_acc = cc.valute and'
      '          p.dat =:TransactionDate'
      'Order by d.bal_cn1')
    Optimize = False
    Variables.Data = {
      0400000001000000200000003A005400520041004E0053004100430054004900
      4F004E0044004100540045000C0000000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 192
    Top = 80
    object ODSTransactionViewBALANCEACCOUNT: TFloatField
      FieldName = 'BALANCEACCOUNT'
    end
    object ODSTransactionViewDEBIT: TWideStringField
      FieldName = 'DEBIT'
    end
    object ODSTransactionViewDEBITCURRENCY: TIntegerField
      FieldName = 'DEBITCURRENCY'
    end
    object ODSTransactionViewDVALNAME: TWideStringField
      FieldName = 'DVALNAME'
      Size = 10
    end
    object ODSTransactionViewCREDIT: TWideStringField
      FieldName = 'CREDIT'
    end
    object ODSTransactionViewCREDITCURRENCY: TIntegerField
      FieldName = 'CREDITCURRENCY'
    end
    object ODSTransactionViewCVALNAME: TWideStringField
      FieldName = 'CVALNAME'
      Size = 10
    end
    object ODSTransactionViewDEBITAMMOUNT: TFloatField
      FieldName = 'DEBITAMMOUNT'
    end
    object ODSTransactionViewCREDITAMMOUNT: TFloatField
      FieldName = 'CREDITAMMOUNT'
    end
    object ODSTransactionViewCOMMONAMMOUNT: TFloatField
      FieldName = 'COMMONAMMOUNT'
    end
    object ODSTransactionViewNAME: TWideStringField
      FieldName = 'NAME'
      Size = 255
    end
  end
  object Branch: TOracleDataSet
    SQL.Strings = (
      'select -1 as ID, '#39'B'#252't'#252'n filiallar'#39' as Name from Dual'
      'Union'
      'select ID, name from filial')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 344
    Top = 8
  end
  object BranchData: TDataSource
    DataSet = Branch
    Left = 344
    Top = 72
  end
end
