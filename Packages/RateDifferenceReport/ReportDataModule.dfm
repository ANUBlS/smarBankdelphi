object MainDataModule: TMainDataModule
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 480
  Width = 696
  object DataTransactions: TDataSource
    DataSet = Transactions
    Left = 56
    Top = 32
  end
  object Transactions: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   Transactions.*'
      '  ,Debet.acc_no DebetAccount'
      '  ,DebetCurrency.val_name DCurrency'
      '  ,Credit.acc_no CreditAccount'
      '  ,CreditCurrency.val_name CCurrency'
      'From '
      '   Provarch Transactions'
      '  ,Account Debet'
      '  ,Account Credit'
      '  ,Avalute DebetCurrency'
      '  ,Avalute CreditCurrency'
      'Where'
      '   (Transactions.debt = Debet.ID)'
      '      and'
      '   (Transactions.kredit = Credit.ID)'
      '      and'
      '   (Transactions.ammount = 0 or transactions.ammount_c = 0)'
      '      and'
      '   (Transactions.val_acc=DebetCurrency.valute)'
      '      and'
      '   (Transactions.currencyid_c=CreditCurrency.valute)'
      '      and'
      '  (Transactions.dat between :BeginDate and :EndDate)'
      ''
      'Order by'
      '    :Title'
      ' '
      ' '
      ' '
      ' ')
    Variables.Data = {
      0300000003000000060000003A5449544C450100000004000000646174000000
      00000A0000003A424547494E444154450C000000000000000000000008000000
      3A454E44444154450C0000000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 136
    Top = 32
    object TransactionsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object TransactionsDAT: TDateTimeField
      FieldName = 'DAT'
    end
    object TransactionsDEBT: TFloatField
      FieldName = 'DEBT'
    end
    object TransactionsKREDIT: TFloatField
      FieldName = 'KREDIT'
    end
    object TransactionsVAL_ACC: TFloatField
      FieldName = 'VAL_ACC'
    end
    object TransactionsAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object TransactionsLAMMOUNT: TFloatField
      FieldName = 'LAMMOUNT'
      DisplayFormat = '#,##.00'
    end
    object TransactionsCURRENCYID_C: TIntegerField
      FieldName = 'CURRENCYID_C'
    end
    object TransactionsAMMOUNT_C: TFloatField
      FieldName = 'AMMOUNT_C'
    end
    object TransactionsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 255
    end
    object TransactionsDEBETACCOUNT: TWideStringField
      FieldName = 'DEBETACCOUNT'
      Size = 28
    end
    object TransactionsDCURRENCY: TWideStringField
      FieldName = 'DCURRENCY'
      Size = 10
    end
    object TransactionsCREDITACCOUNT: TWideStringField
      FieldName = 'CREDITACCOUNT'
      Size = 28
    end
    object TransactionsCCURRENCY: TWideStringField
      FieldName = 'CCURRENCY'
      Size = 10
    end
    object TransactionsRecordNo: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'RecordNo'
      OnGetText = TransactionsRecordNoGetText
      Calculated = True
    end
    object TransactionsOP_ID: TFloatField
      FieldName = 'OP_ID'
    end
    object TransactionsVID_OP: TIntegerField
      FieldName = 'VID_OP'
    end
    object TransactionsNO_FILIAL: TIntegerField
      FieldName = 'NO_FILIAL'
    end
  end
  object OraclePackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SBOP'
    Left = 224
    Top = 48
  end
  object Currency: TOracleDataSet
    SQL.Strings = (
      'Select  '
      '   *'
      'From'
      '   Avalute'
      'where '
      '  valute <> 0'
      'Order By '
      '    Valute')
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 96
  end
  object Filials: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   *'
      'from'
      '  Filial'
      'order by'
      '    ID  ')
    Session = sboapiDataModule.SBSession
    Left = 128
    Top = 96
    object FilialsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FilialsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object Operators: TOracleDataSet
    SQL.Strings = (
      'Select'
      '    *'
      'from'
      '   User$'
      'order by'
      '   ID ')
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 152
  end
end
