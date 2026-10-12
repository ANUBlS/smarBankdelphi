object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 238
  Top = 195
  Height = 480
  Width = 696
  object Account: TOracleDataSet
    SQL.Strings = (
      'SELECT   '
      
        '   out_ACCOUNT.RowID, ID, kli_id, op_id, acc_no, val_acc, NAME, ' +
        'open_dat, close_dat,'
      
        '   DECODE (close_dat, NULL, 1, 2) AS status, bal_cn1, bal_cn2, b' +
        'al_cn3,'
      
        '   bal_cn4, filial, sim_otcet, tipacc, LIMIT, old_acc_no, pair_a' +
        'cc,'
      '   insider'
      'FROM out_ACCOUNT'
      'ORDER BY '
      '   :title'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000060000003A5449544C4501000000070000006163635F6E6F
      0000000000}
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
    OnApplyRecord = AccountApplyRecord
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 16
    Top = 16
  end
  object AccountData: TDataSource
    DataSet = Account
    Left = 16
    Top = 64
  end
  object customers: TOracleDataSet
    SQL.Strings = (
      'select * from CUSTOMERS'
      'where close_dat is null'
      'order by ID'
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
    AfterScroll = customersAfterScroll
    Left = 72
    Top = 16
  end
  object customersdata: TDataSource
    DataSet = customers
    Left = 72
    Top = 64
  end
  object users: TOracleDataSet
    SQL.Strings = (
      'select -1 as ID, '#39'ֱצעצם טסעטפאהÿקטכÿנ'#39' as Name from Dual'
      'Union All'
      'select * from '
      '('
      'select ID, Name from user$'
      'Order by name'
      ')'
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
    Left = 128
    Top = 16
  end
  object usersdata: TDataSource
    DataSet = users
    Left = 128
    Top = 64
  end
  object branches: TOracleDataSet
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
    Left = 184
    Top = 16
  end
  object branchesdata: TDataSource
    DataSet = branches
    Left = 184
    Top = 64
  end
  object currency: TOracleDataSet
    SQL.Strings = (
      'select -1 as Valute, '#39'ֱצעצם גאכיףעאכאנ'#39' as Valu_Name from Dual'
      'Union All'
      'select Valute, Valu_Name from Avalute'
      'Order by valute'
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
    Left = 240
    Top = 16
  end
  object currencydata: TDataSource
    DataSet = currency
    Left = 248
    Top = 64
  end
  object AccFlags: TOracleDataSet
    SQL.Strings = (
      'select '#39' '#39' as symbol, '#39'ֱצעצם סטלגמככאנ'#39' as Name from Dual'
      'Union All'
      'SELECT symbol, symbol||'#39'     '#39'||description as name'
      '  FROM account_flags'
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
    Left = 312
    Top = 16
  end
  object AccFlagsdata: TDataSource
    Left = 320
    Top = 72
  end
  object BalAcc: TOracleDataSet
    SQL.Strings = (
      
        'select '#39'ֱצעצם באכאםס שוסאבכאנû'#39' as Bal_cn,'#39'ֱצעצם באכאםס שוסאבכאנ' +
        'û'#39' as BalName from dual'
      'Union All'
      'select * from '
      '('
      'select to_char(bal_cn), BalName from out_bal_spr1'
      'order by bal_cn'
      ')'
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
    Left = 376
    Top = 16
  end
  object BalAccdata: TDataSource
    DataSet = branches
    Left = 384
    Top = 64
  end
  object tenostat: TOracleDataSet
    SQL.Strings = (
      'select '
      '  acc_id, ostat, pok_ostat '
      'from '
      '  out_tenostat '
      'where acc_id=:acc_id'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000070000003A4143435F4944030000000000000000000000}
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
    Left = 16
    Top = 136
  end
  object tenostatdata: TDataSource
    DataSet = tenostat
    Left = 16
    Top = 192
  end
  object Lazyrest: TOracleDataSet
    SQL.Strings = (
      'select '
      '  acc_id, ostat, pok_ostat '
      'from '
      '  out_lazyrest '
      'where acc_id=:acc_id'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000070000003A4143435F4944030000000000000000000000}
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
    Left = 80
    Top = 136
  end
  object Lazyrestdata: TDataSource
    DataSet = Lazyrest
    Left = 80
    Top = 192
  end
  object PairAccount: TOracleDataSet
    SQL.Strings = (
      'select'
      '  ID,'
      '  acc_no,'
      '  DECODE (close_dat, NULL, 1, 2) AS status'
      'from'
      '  out_Account'
      'order by acc_no'
      ' ')
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
    BeforeOpen = PairAccountBeforeOpen
    Left = 136
    Top = 136
  end
  object PairAccountdata: TDataSource
    DataSet = PairAccount
    Left = 144
    Top = 192
  end
  object sysdat: TOracleDataSet
    SQL.Strings = (
      'Select tek_dat from sysdat'
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
    Left = 216
    Top = 144
  end
  object SBUTIL: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBUTIL'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 296
    Top = 152
  end
  object OUT_SBOP: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'OUT_SBOP'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 360
    Top = 152
  end
  object ReportSymbol: TOracleDataSet
    SQL.Strings = (
      'select * from REPORT_SYMBOL')
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
    Left = 240
    Top = 200
  end
  object ReportSymboldata: TDataSource
    DataSet = ReportSymbol
    Left = 320
    Top = 208
  end
end
