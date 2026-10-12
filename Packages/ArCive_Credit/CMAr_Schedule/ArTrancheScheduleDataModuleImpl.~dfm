object TrancheSheduleDataMod: TTrancheSheduleDataMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 211
  Top = 144
  Height = 480
  Width = 696
  object AboutContractDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT V.VAL_NAME as CURRENCY'
      '     , C.NAME as CUSTNAME'
      '     , P.CREDITLINEAMOUNT as AMOUNT'
      '  FROM CM_ACTIVE_CREDITS P'
      '      ,CM_BOOROWERINFO C'
      '      ,SB_AVALUTE V'
      ' WHERE P.ID = C.CREDITID'
      '   AND P.CURRENCY = V.VALUTE'
      '   AND ID = :ID')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 48
    Top = 72
  end
  object AboutContractsDataSrc: TDataSource
    DataSet = AboutContractDataSet
    Left = 48
    Top = 120
  end
  object TrancheScheduleDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT T.RowID, T.*'
      '  FROM CM_TRANCHE_SCHEDULE T'
      ' WHERE T.CREDITID = :CREDITID')
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
    Cursor = crDefault
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
    Left = 184
    Top = 72
    object TrancheScheduleDataSetID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object TrancheScheduleDataSetCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object TrancheScheduleDataSetTRCHDATE: TDateTimeField
      FieldName = 'TRCHDATE'
      Required = True
    end
    object TrancheScheduleDataSetTRCHAMOUNT: TFloatField
      FieldName = 'TRCHAMOUNT'
    end
  end
  object TrancheScheduleDataSrc: TDataSource
    DataSet = TrancheScheduleDataSet
    Left = 184
    Top = 120
  end
  object CM_SCHEDULE: TOraclePackage
    Session = CMDataModule.CMSession
    Debug = False
    PackageName = 'CM_SCHEDULE'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 304
    Top = 208
  end
end
