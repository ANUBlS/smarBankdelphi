object out_DataModule: Tout_DataModule
  OldCreateOrder = False
  Height = 0
  Width = 0
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
      ' '
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000060000003A41444154450C0000000000000000000000}
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 56
    Top = 232
  end
  object DataSource1: TDataSource
    DataSet = ForTable
    Left = 120
    Top = 232
  end
  object ForMoney: TOracleDataSet
    SQL.Strings = (
      'Select Valute,Valu_Name from avalute'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 72
    Top = 8
  end
  object OraclePackage1: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'Out_SB_Balance'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 120
    Top = 80
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
      ' '
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000060000003A41444154450C0000000000000000000000}
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 96
    Top = 152
  end
  object BanksName: TOracleDataSet
    SQL.Strings = (
      'select bank from bankinfo'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 232
    Top = 32
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
      'Order by d.bal_cn1'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000100000003A5452414E53414354494F4E444154450C000000
      0000000000000000}
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 232
    Top = 104
  end
  object Branch: TOracleDataSet
    SQL.Strings = (
      'select -1 as ID, '#39'ֱצעצם פטכטאככאנ'#39' as Name from Dual'
      'Union'
      'select ID, name from filial'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 232
    Top = 232
  end
  object BranchData: TDataSource
    DataSet = Branch
    Left = 320
    Top = 248
  end
end
