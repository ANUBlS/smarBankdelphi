object sboapiDataModule: TsboapiDataModule
  OldCreateOrder = False
  Left = 291
  Top = 179
  Height = 480
  Width = 696
  object SBSession: TOracleSession
    Cursor = crSQLWait
    DesignConnection = True
    LogonUsername = 'smart'
    LogonPassword = 'sm'
    LogonDatabase = 'SB-CURRENT'
    ThreadSafe = False
    Preferences.FloatPrecision = 0
    Preferences.IntegerPrecision = 0
    Preferences.SmallIntPrecision = -1
    Preferences.UseOCI7 = False
    Preferences.ConvertCRLF = True
    Preferences.TrimStringFields = True
    Preferences.MaxStringFieldSize = 0
    Preferences.ZeroDateIsNull = True
    Connected = True
    RollbackOnDisconnect = False
    NullValue = nvUnAssigned
    SQLTrace = stUnchanged
    OptimizerGoal = ogUnchanged
    IsolationLevel = ilReadCommitted
    BytesPerCharacter = bc1Byte
    Left = 48
    Top = 8
  end
  object SBLogon: TOracleLogon
    Session = SBSession
    Retries = 2
    Options = [ldDatabase]
    AliasDropDownCount = 8
    HistorySize = 6
    HistoryWithPassword = False
    Left = 128
    Top = 8
  end
  object SBOperationDay: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBOP'
    ParameterMode = pmNamed
    Cursor = crSQLWait
    Optimize = True
    Left = 48
    Top = 192
  end
  object GetCustomer: TOracleDataSet
    SQL.Strings = (
      'select * from SMART.CUSTOMERS'
      'where ID = :CustomerID')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000010000000B0000003A435553544F4D45524944030000000000000000
      000000}
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
    Session = SBSession
    DesignActivation = False
    Active = False
    Left = 288
    Top = 8
  end
  object SBSecurity: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBSEC'
    ParameterMode = pmPositional
    Cursor = crSQLWait
    Optimize = True
    Left = 48
    Top = 248
  end
  object SBReferences: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBREF'
    ParameterMode = pmNamed
    Cursor = crDefault
    Optimize = True
    Left = 136
    Top = 192
  end
  object SBReport: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBREP'
    ParameterMode = pmNamed
    Cursor = crDefault
    Optimize = True
    Left = 216
    Top = 192
  end
  object SBRateManagement: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBRM'
    ParameterMode = pmNamed
    Cursor = crDefault
    Optimize = True
    Left = 296
    Top = 192
  end
  object SBSystem: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBSYS'
    ParameterMode = pmNamed
    Cursor = crDefault
    Optimize = True
    Left = 136
    Top = 248
  end
  object SBUtil: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBUTIL'
    ParameterMode = pmNamed
    Cursor = crDefault
    Optimize = True
    Left = 216
    Top = 248
  end
  object SBInstallation: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBInstall'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 296
    Top = 248
  end
end
