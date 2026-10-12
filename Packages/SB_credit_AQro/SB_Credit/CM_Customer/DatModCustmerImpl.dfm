object DatModCustmer: TDatModCustmer
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 254
  Top = 135
  Height = 480
  Width = 696
  object RelationData: TOracleDataSet
    SQL.Strings = (
      'select * from PRINAD')
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 408
    Top = 8
    object RelationDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object RelationDataNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object Relation: TDataSource
    DataSet = RelationData
    Left = 304
    Top = 8
  end
  object ClientGroupData: TOracleDataSet
    SQL.Strings = (
      'select * from QRP_KLIE')
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 408
    Top = 56
    object ClientGroupDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ClientGroupDataNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object ClientGroup: TDataSource
    DataSet = ClientGroupData
    Left = 304
    Top = 56
  end
  object EstateTypeData: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM VID_SOB')
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 408
    Top = 104
    object EstateTypeDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object EstateTypeDataNAME: TStringField
      FieldName = 'NAME'
      Size = 60
    end
  end
  object EstateType: TDataSource
    DataSet = EstateTypeData
    Left = 304
    Top = 104
  end
  object OrganizationTypeData: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM ORG_PRAV')
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 408
    Top = 152
    object OrganizationTypeDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OrganizationTypeDataNAME: TStringField
      FieldName = 'NAME'
      Size = 60
    end
  end
  object OrganizationType: TDataSource
    DataSet = OrganizationTypeData
    Left = 304
    Top = 152
  end
  object ActionAreaData: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM SFERADEY')
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 408
    Top = 200
    object ActionAreaDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ActionAreaDataNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object ActionArea: TDataSource
    DataSet = ActionAreaData
    Left = 304
    Top = 200
  end
  object BranchData: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM OTRASLI')
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 408
    Top = 248
    object BranchDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object BranchDataNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object Branch: TDataSource
    DataSet = BranchData
    Left = 304
    Top = 248
  end
  object TaxAreaData: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM NALOG')
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 408
    Top = 304
    object TaxAreaDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object TaxAreaDataNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object TaxArea: TDataSource
    DataSet = TaxAreaData
    Left = 304
    Top = 304
  end
  object FilialsData: TOracleDataSet
    SQL.Strings = (
      'select *'
      'from sb_FILIAL')
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 408
    Top = 352
  end
  object Filials: TDataSource
    DataSet = FilialsData
    Left = 304
    Top = 352
  end
  object Customers: TDataSource
    DataSet = ActiveCustomerList
    Left = 16
    Top = 8
  end
  object ActiveCustomerList: TOracleDataSet
    SQL.Strings = (
      'select C.*, C.rowid from cm_sb_CUSTOMERS C'
      'where CLOSE_DAT IS NULL'
      'order by C.ID')
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 96
    Top = 8
    object ActiveCustomerListID: TIntegerField
      FieldName = 'ID'
    end
    object ActiveCustomerListOP_ID: TFloatField
      FieldName = 'OP_ID'
    end
    object ActiveCustomerListOPEN_DAT: TDateTimeField
      FieldName = 'OPEN_DAT'
    end
    object ActiveCustomerListCLOSE_DAT: TDateTimeField
      FieldName = 'CLOSE_DAT'
    end
    object ActiveCustomerListNEREZIDENT: TFloatField
      FieldName = 'NEREZIDENT'
    end
    object ActiveCustomerListPRINAD_KOD: TFloatField
      FieldName = 'PRINAD_KOD'
    end
    object ActiveCustomerListNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object ActiveCustomerListSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 50
    end
    object ActiveCustomerListGROUP_KLIE: TFloatField
      FieldName = 'GROUP_KLIE'
    end
    object ActiveCustomerListVID_SOB: TFloatField
      FieldName = 'VID_SOB'
    end
    object ActiveCustomerListORG_SOB: TFloatField
      FieldName = 'ORG_SOB'
    end
    object ActiveCustomerListSFERA_DEY: TFloatField
      FieldName = 'SFERA_DEY'
    end
    object ActiveCustomerListOTRASL: TFloatField
      FieldName = 'OTRASL'
    end
    object ActiveCustomerListNALOG_KOD: TFloatField
      FieldName = 'NALOG_KOD'
    end
    object ActiveCustomerListKOD_OKPRO: TFloatField
      FieldName = 'KOD_OKPRO'
    end
    object ActiveCustomerListDAT_NAL: TDateTimeField
      FieldName = 'DAT_NAL'
    end
    object ActiveCustomerListDAT_USTAV: TDateTimeField
      FieldName = 'DAT_USTAV'
    end
    object ActiveCustomerListBIK: TFloatField
      FieldName = 'BIK'
    end
    object ActiveCustomerListRealINN: TStringField
      FieldKind = fkCalculated
      FieldName = 'RealINN'
      Calculated = True
    end
    object ActiveCustomerListOTV_LICO: TStringField
      FieldName = 'OTV_LICO'
      Size = 40
    end
    object ActiveCustomerListOTV_PASSPORT: TStringField
      FieldName = 'OTV_PASSPORT'
    end
    object ActiveCustomerListOTV_ISSUED: TStringField
      FieldName = 'OTV_ISSUED'
      Size = 40
    end
    object ActiveCustomerListOTV_ISDATE: TDateTimeField
      FieldName = 'OTV_ISDATE'
    end
    object ActiveCustomerListINN: TStringField
      FieldName = 'INN'
    end
  end
  object cm_credit: TOraclePackage
    Session = CMDataModule.CMSession
    Debug = False
    PackageName = 'cm_credit'
    ParameterMode = pmNamed
    Cursor = crSQLWait
    Optimize = True
    Left = 88
    Top = 72
  end
end
