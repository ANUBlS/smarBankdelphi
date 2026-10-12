object DataModWU: TDataModWU
  OldCreateOrder = False
  Left = 199
  Top = 107
  Height = 480
  Width = 696
  object DataWUIncoming: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  w.RowID,'
      '  w.*,'
      '  v.val_name as valute,'
      '  wb.BranchName,'
      '  wb.BranchID'
      'From'
      '  WU_Incoming w,'
      '  avalute v,'
      '  wu_branch wb'
      'where'
      '  w.currency = v.valute(+) and'
      '  w.branch = wb.symbol(+) and'
      '  incomdate'
      '  between :stDate and :EnDate'
      '  order by :Title'
      ' '
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000070000003A5354444154450C000000000000000000000007
      0000003A454E444154450C0000000000000000000000060000003A5449544C45
      0100000005000000772E69640000000000}
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
    Left = 160
    Top = 72
  end
  object DSWesternUnion: TDataSource
    DataSet = DataWUIncoming
    Left = 160
    Top = 16
  end
  object TempPack: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'WU_CONTROL'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 408
    Top = 328
  end
  object DataTempFile: TOracleDataSet
    SQL.Strings = (
      'Select '
      '    wt.RowID,wt.*'
      'From'
      ' WU_TEMPFILE wt')
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
    Left = 152
    Top = 136
  end
  object DataAccount: TOracleDataSet
    SQL.Strings = (
      'Select '
      '   *'
      'from '
      '  Account '
      'where '
      '  close_dat is null ')
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
    Top = 72
  end
  object DSAccount: TDataSource
    DataSet = DataAccount
    Left = 240
    Top = 16
  end
  object DataValute: TOracleDataSet
    SQL.Strings = (
      'Select '
      '   *'
      'from '
      '  AVALUTE')
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
    Left = 392
    Top = 72
  end
  object DSValute: TDataSource
    DataSet = DataValute
    Left = 392
    Top = 16
  end
  object DataConfig: TOracleDataSet
    SQL.Strings = (
      'Select '
      '   *'
      'from '
      '  wu_config')
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
    Active = True
    Left = 32
    Top = 320
  end
  object DSConfig: TDataSource
    DataSet = DataConfig
    Left = 32
    Top = 264
  end
  object DataBranch: TOracleDataSet
    SQL.Strings = (
      'Select '
      '   *'
      'from '
      '  wu_branch')
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
    Left = 104
    Top = 320
  end
  object DSBranch: TDataSource
    DataSet = DataBranch
    Left = 104
    Top = 264
  end
  object DataReport: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  w.Kind "Эял-Эед",'
      '  incomdate "Тарих",'
      '  reference "Гейдиййат №",'
      '  principial "Мябляь",'
      '  revenue "Эялир",'
      '  v.val_name  "Валута",'
      '  wb.BranchName "Филиал",'
      '  wb.BranchId  BranchId'
      'From'
      '  WU_Incoming w,'
      '  avalute v,'
      '  wu_branch wb'
      'where'
      '  w.currency = v.valute(+) and'
      '  w.branch = wb.symbol(+)and'
      '  incomdate'
      '  between :stDate and :EnDate'
      ''
      'order by wb.BranchName, w.Kind')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000070000003A5354444154450C000000000000000000000007
      0000003A454E444154450C0000000000000000000000}
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
    Filtered = True
    OnDeleteError = DataReportEditError
    OnEditError = DataReportEditError
    OnPostError = DataReportEditError
    Left = 176
    Top = 320
    object DataReportDSDesigner7: TStringField
      FieldName = 'Эял-Эед'
      Size = 2
    end
    object DataReportDSDesigner: TDateTimeField
      FieldName = 'Тарих'
    end
    object DataReportDSDesigner2: TStringField
      FieldName = 'Гейдиййат №'
      Required = True
    end
    object DataReportDSDesigner3: TFloatField
      FieldName = 'Мябляь'
    end
    object DataReportDSDesigner4: TFloatField
      FieldName = 'Эялир'
    end
    object DataReportDSDesigner5: TStringField
      FieldName = 'Валута'
      Size = 10
    end
    object DataReportDSDesigner6: TStringField
      FieldName = 'Филиал'
    end
    object DataReportBRANCHID: TFloatField
      FieldName = 'BRANCHID'
    end
  end
  object DSReport: TDataSource
    DataSet = DataReport
    Left = 184
    Top = 264
  end
  object DataReportComplex: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   nom "№",'
      '   branch "Бюлмянин ады",'
      '   transcount "Ямялиййатларын сайы",'
      '   amount_i "Юдянилмиш мябляь",'
      '   amount_o "Гябул олунмуш мябляь",'
      '   revenue "Гялир"'
      'From'
      '  WU_REPORT'
      'order by '
      '  nom'
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
    Active = True
    Filtered = True
    OnDeleteError = DataReportEditError
    OnEditError = DataReportEditError
    OnPostError = DataReportEditError
    Left = 312
    Top = 312
  end
  object DSReportComplex: TDataSource
    DataSet = DataReportComplex
    Left = 312
    Top = 264
  end
end
