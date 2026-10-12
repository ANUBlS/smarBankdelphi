object sboapiDataModule: TsboapiDataModule
  OldCreateOrder = False
  Left = 285
  Top = 161
  Height = 479
  Width = 741
  object SBSession: TOracleSession
    Cursor = crSQLWait
    DesignConnection = True
    LogonUsername = 'smart'
    LogonPassword = 'sm'
    LogonDatabase = 'SB'
    ThreadSafe = True
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
    BytesPerCharacter = bcAutoDetect
    Left = 32
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
    Left = 32
    Top = 72
  end
  object GetCustomer: TOracleDataSet
    SQL.Strings = (
      'select * from CUSTOMERS'
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
    Left = 280
    Top = 8
  end
  object SBSecurity: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBSEC'
    ParameterMode = pmPositional
    Cursor = crSQLWait
    Optimize = True
    Left = 32
    Top = 128
  end
  object SBReferences: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBREF'
    ParameterMode = pmNamed
    Cursor = crDefault
    Optimize = True
    Left = 120
    Top = 72
  end
  object SBReport: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBREP'
    ParameterMode = pmNamed
    Cursor = crDefault
    Optimize = True
    Left = 200
    Top = 72
  end
  object SBRateManagement: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBRM'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Optimize = True
    Left = 280
    Top = 72
  end
  object SBSystem: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBSYS'
    ParameterMode = pmNamed
    Cursor = crDefault
    Optimize = True
    Left = 120
    Top = 128
  end
  object SBUtil: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBUTIL'
    ParameterMode = pmNamed
    Cursor = crDefault
    Optimize = True
    Left = 200
    Top = 128
  end
  object SBInstallation: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBInstall'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 280
    Top = 128
  end
  object SBCorrection: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBCORRECTION'
    ParameterMode = pmNamed
    Cursor = crDefault
    Optimize = True
    Left = 32
    Top = 184
  end
  object SBSettings: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBSETTINGS'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 120
    Top = 184
  end
  object SBTransaction: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SB_TRANSACTION'
    ParameterMode = pmNamed
    Cursor = crDefault
    Optimize = True
    Left = 200
    Top = 184
  end
  object SBMessage: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBMSG'
    ParameterMode = pmNamed
    Cursor = crDefault
    Optimize = True
    Left = 280
    Top = 184
  end
  object SBSessionMgr: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SB_SESSION_MGR'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 32
    Top = 240
  end
  object SBLogin: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBLOGIN'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 120
    Top = 240
  end
  object SBModules: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'SBMODULES'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 200
    Top = 240
  end
  object SBAca: TOraclePackage
    Session = SBSession
    Debug = False
    PackageName = 'sb_aca'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 280
    Top = 240
  end
end
