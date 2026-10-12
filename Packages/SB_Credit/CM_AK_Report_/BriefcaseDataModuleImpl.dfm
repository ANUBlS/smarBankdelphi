object BriefcaseDataMod: TBriefcaseDataMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 138
  Top = 241
  Height = 480
  Width = 696
  object ReportNameDataSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select id, name'
      '  from creditsmgr.cm_bc_reports')
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
    Left = 40
    Top = 16
  end
  object ReportNameDataSrc: TDataSource
    DataSet = ReportNameDataSet
    Left = 40
    Top = 72
  end
  object BPTypesDataSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select id, typedesc'
      '  from creditsmgr.cm_bp_types'
      'union'
      'select 0, '#39' ўамысы'#39
      '  from dual'
      'order by id')
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
    Left = 144
    Top = 16
  end
  object BPTypesDataSrc: TDataSource
    DataSet = BPTypesDataSet
    Left = 144
    Top = 72
  end
  object DistrictsDataSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select id, name'
      '  from smart.otrasli'
      ' where id>160'
      'union'
      'select 0, '#39' ўамысы'#39
      '  from dual'
      'order by name'
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 232
    Top = 16
  end
  object DistrictsDataSrc: TDataSource
    DataSet = DistrictsDataSet
    Left = 232
    Top = 72
  end
  object VillagesDataSet: TOracleDataSet
    SQL.Strings = (
      'select id, name'
      '  from smart.nalog'
      ' where districtid = :DISTRICT_ID'
      'union'
      'select 0, '#39' ўамысы'#39
      '  from dual'
      'order by name'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000010000000C0000003A44495354524943545F49440300000000000000
      00000000}
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
    Left = 312
    Top = 16
  end
  object VillagesDataSrc: TDataSource
    DataSet = VillagesDataSet
    Left = 312
    Top = 72
  end
  object UsersDataSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select *'
      '  from creditsmgr.cm_users')
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
    Left = 40
    Top = 128
  end
  object UsersDataSrc: TDataSource
    DataSet = UsersDataSet
    Left = 40
    Top = 176
  end
  object CustomersDataSet: TOracleDataSet
    SQL.Strings = (
      'select *'
      '  from smart.customers'
      ' where op_id = uid'
      '   and nalog_kod = :VILLAGEID'
      '--   and otrasl = :DISTRICTID'
      '    ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000010000000A0000003A56494C4C414745494403000000000000000000
      0000}
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
    Left = 400
    Top = 16
  end
  object CustomersDataSrc: TDataSource
    DataSet = CustomersDataSet
    Left = 400
    Top = 72
  end
  object BPPurposesDataSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select id, purposedesc'
      '  from creditsmgr.cm_bp_purposes'
      'union'
      'select 0, '#39' ўамысы'#39
      '  from dual'
      ' order by purposedesc')
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
    Left = 144
    Top = 128
  end
  object BPPurposesDataSrc: TDataSource
    DataSet = BPPurposesDataSet
    Left = 144
    Top = 176
  end
  object ExportDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   P.ID '
      ' , U.NAME as OWNER'
      ' , C.NAME as BOOROWER'
      ' , V.VALU_NAME as CURRENCY'
      ' , P.INITIALAMOUNT '
      ' , P.CREDITLINEAMOUNT '
      ' , P.ANNUALYINTERESTRATE '
      ' , P.ANNUALYOVERDUERATE'
      ' , P.ANNUALYPENALTYRATE '
      ' , P.DATEOFCONCLUSION '
      ' , P.DATEOFGRANT '
      ' , P.DUEDATEFIRSTCONTRACT '
      ' , P.DUEDATELASTCONTRACT'
      ' , P.CLOSEDATE '
      ' , P.NUMBEROFCREDIT '
      ' , P.PURPOSEOFCREDIT '
      ' , P.CUSTOMERTYPE '
      ' , T.TYPEDESC  as CREDITTYPE'
      ' , P.USRGROUP '
      ' , B.NAME as BRANCH'
      'FROM'
      '   CREDITSMGR.CM_PORTFOLIO P'
      ' , SMART.CUSTOMERS C'
      ' , SMART.AVALUTE V'
      ' , CREDITSMGR.CM_BP_TYPES T'
      ' , CREDITSMGR.CM_USERS U'
      ' , SMART.FILIAL B'
      ' , CREDITSMGR.cm_business_plan BP'
      'WHERE'
      '     (C.ID = P.BOOROWERID)'
      ' AND (V.VALUTE = P.CURRENCY)'
      ' AND (U.ID = P.USID)'
      ' AND (B.ID = P.BRANCHID)'
      ' AND (BP.CREDITID = P.ID)'
      ' AND (BP.TYPE = T.ID)')
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
    Active = True
    Left = 240
    Top = 128
  end
end
