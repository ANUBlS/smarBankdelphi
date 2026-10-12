object SADataModule: TSADataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 107
  Height = 480
  Width = 696
  object AccountFlags: TOracleDataSet
    SQL.Strings = (
      'select'
      '  symbol ,'
      '  name ,'
      '  description'
      'from'
      '  account_flags')
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
    Left = 48
    Top = 32
    object AccountFlagsSYMBOL: TStringField
      FieldName = 'SYMBOL'
      Required = True
      Size = 1
    end
    object AccountFlagsNAME: TStringField
      FieldName = 'NAME'
      Size = 32
    end
    object AccountFlagsDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 64
    end
  end
  object DataSrcAccountFlags: TDataSource
    DataSet = AccountFlags
    Left = 136
    Top = 32
  end
end
