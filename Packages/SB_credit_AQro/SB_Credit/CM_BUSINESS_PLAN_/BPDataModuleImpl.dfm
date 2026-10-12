object BPDataModule: TBPDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 278
  Top = 109
  Height = 480
  Width = 696
  object CreditInfo: TOracleDataSet
    SQL.Strings = (
      'Select '
      '   Name'
      'From '
      '  CM_BOOROWERINFO '
      'Where '
      '   CreditID=:CreditID'
      '   ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000090000003A43524544495449440300000000000000000000
      00}
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
    Left = 24
    Top = 16
  end
  object DSCreditInfo: TDataSource
    DataSet = CreditInfo
    Left = 104
    Top = 16
  end
  object BPData: TOracleDataSet
    SQL.Strings = (
      'SELECT b.RowID,b.*'
      '  FROM cm_business_plan b'
      'WHERE b.CreditID =:CreditID ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000090000003A43524544495449440300000000000000000000
      00}
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
    OnApplyRecord = BPDataApplyRecord
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 24
    Top = 72
    object BPDataCREDITID: TFloatField
      FieldName = 'CREDITID'
    end
    object BPDataPROJECTCOST: TFloatField
      FieldName = 'PROJECTCOST'
    end
    object BPDataGIVENCREDIT: TFloatField
      FieldName = 'GIVENCREDIT'
    end
    object BPDataCONCESSIONPERIOD: TFloatField
      FieldName = 'CONCESSIONPERIOD'
    end
    object BPDataPURPOSE: TFloatField
      FieldName = 'PURPOSE'
    end
    object BPDataSOURCE: TStringField
      FieldName = 'SOURCE'
      Size = 10
    end
    object BPDataTYPE: TFloatField
      FieldName = 'TYPE'
    end
    object BPDataUNTMEANSOFPRODUCTION: TStringField
      FieldName = 'UNTMEANSOFPRODUCTION'
      Size = 10
    end
    object BPDataNUMBEROFPRODUCTION: TFloatField
      FieldName = 'NUMBEROFPRODUCTION'
    end
    object BPDataUNTPRODUCTION: TStringField
      FieldName = 'UNTPRODUCTION'
      Size = 10
    end
    object BPDataPRODUCTION: TFloatField
      FieldName = 'PRODUCTION'
    end
    object BPDataPRODUCTIVITY: TFloatField
      FieldName = 'PRODUCTIVITY'
    end
    object BPDataPRODUCTIONCOST: TFloatField
      FieldName = 'PRODUCTIONCOST'
    end
    object BPDataSUMPROFIT: TFloatField
      FieldName = 'SUMPROFIT'
    end
    object BPDataBOUGHTMATERIAL: TFloatField
      FieldName = 'BOUGHTMATERIAL'
    end
    object BPDataOPERATIONEXPENSE: TFloatField
      FieldName = 'OPERATIONEXPENSE'
    end
    object BPDataTAXEXPENSE: TFloatField
      FieldName = 'TAXEXPENSE'
    end
    object BPDataOTHEREXPENCE: TFloatField
      FieldName = 'OTHEREXPENCE'
    end
    object BPDataSUMEXPENSE: TFloatField
      FieldName = 'SUMEXPENSE'
    end
  end
  object DSBPData: TDataSource
    DataSet = BPData
    Left = 104
    Top = 72
  end
  object BPPurposes: TOracleDataSet
    SQL.Strings = (
      'SELECT id, purposedesc'
      '  FROM cm_bp_purposes')
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
    Left = 24
    Top = 136
  end
  object DSBPPurposes: TDataSource
    DataSet = BPPurposes
    Left = 104
    Top = 136
  end
  object BPTypes: TOracleDataSet
    SQL.Strings = (
      'SELECT id, typedesc'
      '  FROM cm_bp_types')
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
    Left = 24
    Top = 192
  end
  object DSBPTypes: TDataSource
    DataSet = BPTypes
    Left = 104
    Top = 192
  end
  object CM_CREDIT: TOraclePackage
    Session = CMDataModule.CMSession
    Debug = False
    PackageName = 'CM_CREDIT'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Optimize = True
    Left = 264
    Top = 104
  end
end
