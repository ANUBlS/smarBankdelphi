object ReserveContDataMod: TReserveContDataMod
  OldCreateOrder = False
  Left = 213
  Top = 104
  Height = 480
  Width = 696
  object CM_RESERVE_CONTR: TOraclePackage
    Session = CMDataModule.CMSession
    Debug = False
    PackageName = 'CM_RESERVE_CONTR'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Optimize = True
    Left = 144
    Top = 136
  end
  object CreditsInfo: TOracleDataSet
    SQL.Strings = (
      'select ID , NumberOfCredit'
      '  from cm_active_credits'
      ' where currency <> 0')
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
    Cursor = crSQLWait
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 144
    Top = 184
    object CreditsInfoID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CreditsInfoNUMBEROFCREDIT: TStringField
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
  end
end
