object DataModDeposits: TDataModDeposits
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 189
  Top = 107
  Height = 480
  Width = 696
  object DepositsConvPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBCM_PERCENT_CONVERTING'
    ParameterMode = pmPositional
    Cursor = crHourGlass
    Optimize = True
    Left = 64
    Top = 24
  end
  object DataSrcCurrencys: TDataSource
    DataSet = CurrencysData
    Left = 168
    Top = 24
  end
  object CurrencysData: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   Valute as CurrencyID'
      '  ,Valu_Name as CurrencyLongName'
      '  From  '
      '     AVALUTE'
      '        ')
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
    Left = 168
    Top = 72
    object CurrencysDataCURRENCYID: TIntegerField
      FieldName = 'CURRENCYID'
      Required = True
    end
    object CurrencysDataCURRENCYLONGNAME: TStringField
      FieldName = 'CURRENCYLONGNAME'
      Size = 25
    end
  end
  object DataSrcDepositTypes: TDataSource
    DataSet = DepositTypes
    Left = 272
    Top = 24
  end
  object DepositTypes: TOracleDataSet
    SQL.Strings = (
      'Select'
      '    ID'
      '  ,Type'
      '  From'
      '    SBCM_Deposit_Types')
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
    Left = 272
    Top = 72
    object DepositTypesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DepositTypesTYPE: TStringField
      FieldName = 'TYPE'
      Required = True
      Size = 256
    end
  end
  object DataSrcCategories: TDataSource
    DataSet = CategoriesData
    Left = 376
    Top = 24
  end
  object CategoriesData: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   ID'
      '  ,Category '
      '   From '
      '      SBCM_Categories')
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
    Top = 72
    object CategoriesDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CategoriesDataCATEGORY: TStringField
      FieldName = 'CATEGORY'
      Size = 128
    end
  end
end
