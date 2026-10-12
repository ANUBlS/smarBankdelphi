object MainDataModule: TMainDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 195
  Top = 135
  Height = 516
  Width = 763
  object DataSrcContracts: TDataSource
    DataSet = Contracts
    Left = 32
    Top = 8
  end
  object Contracts: TOracleDataSet
    SQL.Strings = (
      'Select  *'
      'From'
      ' Active_Credits'
      'Order By'
      '          Status  ,'
      '         :OrderKind'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000010000000A0000003A4F524445524B494E4401000000000000000000
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
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 64
    Top = 8
    object ContractsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ContractsCONTRACTNO: TStringField
      FieldName = 'CONTRACTNO'
      Size = 56
    end
    object ContractsOPENDATE: TDateTimeField
      FieldName = 'OPENDATE'
      Required = True
    end
    object ContractsCLOSEDATE: TDateTimeField
      FieldName = 'CLOSEDATE'
      Required = True
    end
    object ContractsAMOUNT: TFloatField
      FieldName = 'AMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object ContractsCONTRACTTYPE: TIntegerField
      FieldName = 'CONTRACTTYPE'
    end
    object ContractsPLEDGETYPE: TFloatField
      FieldName = 'PLEDGETYPE'
    end
    object ContractsRELIABILITYID: TIntegerField
      FieldName = 'RELIABILITYID'
    end
    object ContractsCONTRACTACCID: TFloatField
      FieldName = 'CONTRACTACCID'
      Required = True
    end
    object ContractsCLIENTTYPE: TFloatField
      FieldName = 'CLIENTTYPE'
    end
    object ContractsCLIENTACCID: TFloatField
      FieldName = 'CLIENTACCID'
    end
    object ContractsRESERVEACCID: TFloatField
      FieldName = 'RESERVEACCID'
    end
    object ContractsINTERESTACCID: TFloatField
      FieldName = 'INTERESTACCID'
    end
    object ContractsOVERDUEACCID: TFloatField
      FieldName = 'OVERDUEACCID'
    end
    object ContractsOVERDUEINTERESTACCID: TFloatField
      FieldName = 'OVERDUEINTERESTACCID'
    end
    object ContractsFACTICALDEBT: TFloatField
      FieldName = 'FACTICALDEBT'
      DisplayFormat = '#,##0.00'
    end
    object ContractsFACTICALINTERESTDEBT: TFloatField
      FieldName = 'FACTICALINTERESTDEBT'
      DisplayFormat = '#,##0.00'
    end
    object ContractsOVERDUEDEBT: TFloatField
      FieldName = 'OVERDUEDEBT'
      DisplayFormat = '#,##0.00'
    end
    object ContractsOVERDUEINTERESTDEBT: TFloatField
      FieldName = 'OVERDUEINTERESTDEBT'
      DisplayFormat = '#,##0.00'
    end
    object ContractsSTOPCALCULATIONDATE: TDateTimeField
      FieldName = 'STOPCALCULATIONDATE'
    end
    object ContractsCALCULATIONENABLED: TFloatField
      FieldName = 'CALCULATIONENABLED'
      Required = True
    end
    object ContractsREGUIREDAMOUNTDEC: TFloatField
      FieldName = 'REGUIREDAMOUNTDEC'
      DisplayFormat = '#,##0.00'
    end
    object ContractsREGUIREDPERCENTDEC: TFloatField
      FieldName = 'REGUIREDPERCENTDEC'
      DisplayFormat = '#,##0.00'
    end
    object ContractsLASTPROCESSDATE: TDateTimeField
      FieldName = 'LASTPROCESSDATE'
    end
    object ContractsCONTRACTACCNO: TStringField
      FieldName = 'CONTRACTACCNO'
      Size = 4000
    end
    object ContractsCONTRACTACCNAME: TStringField
      FieldName = 'CONTRACTACCNAME'
      Size = 4000
    end
    object ContractsCONTRACTCURRENCYID: TFloatField
      FieldName = 'CONTRACTCURRENCYID'
    end
    object ContractsRESIDUARYAMOUNT: TFloatField
      FieldName = 'RESIDUARYAMOUNT'
      DisplayFormat = '#,##0.00'
      currency = True
    end
    object ContractsSTATUS: TFloatField
      FieldName = 'STATUS'
      Visible = False
    end
    object ContractsPLEDGEPRICE: TFloatField
      FieldName = 'PLEDGEPRICE'
      currency = True
    end
    object ContractsMONTHDAY: TStringField
      FieldName = 'MONTHDAY'
      Size = 2
    end
    object ContractsOVERDUERELIABILITYID: TFloatField
      FieldName = 'OVERDUERELIABILITYID'
    end
    object ContractsOVERDUERESERVEACCID: TFloatField
      FieldName = 'OVERDUERESERVEACCID'
    end
    object ContractsCONTRACTCURRENCY: TStringField
      FieldName = 'CONTRACTCURRENCY'
      Size = 4000
    end
    object ContractsINTERESTACCNO: TStringField
      FieldName = 'INTERESTACCNO'
      Size = 4000
    end
    object ContractsINTERESTBALANCE: TFloatField
      FieldName = 'INTERESTBALANCE'
      currency = True
    end
    object ContractsCLIENTBALANCE: TFloatField
      FieldName = 'CLIENTBALANCE'
      currency = True
    end
  end
  object DataSrcInterests: TDataSource
    DataSet = Interests
    Left = 240
    Top = 8
  end
  object Interests: TOracleDataSet
    SQL.Strings = (
      'Select'
      '    ID#'
      '  ,HDate'
      '  ,Interest'
      '  From'
      '   SBCM_Interests'
      '  Where '
      '     ID# = :ID#')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A494423030000000000000000000000}
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
    Master = Contracts
    MasterFields = 'ID'
    DetailFields = 'ID#'
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
    Top = 8
    object InterestsID: TFloatField
      FieldName = 'ID#'
      Required = True
    end
    object InterestsHDATE: TDateTimeField
      FieldName = 'HDATE'
      Required = True
    end
    object InterestsINTEREST: TFloatField
      FieldName = 'INTEREST'
      Required = True
    end
  end
  object DataSrcOverdueInterests: TDataSource
    DataSet = OverdueInterests
    Left = 240
    Top = 56
  end
  object OverdueInterests: TOracleDataSet
    SQL.Strings = (
      'Select'
      '    ID#'
      '  ,HDate'
      '  ,OverdueInterest'
      '  From'
      '   SBCM_OverdueInterests'
      '  Where '
      '     ID# = :ID#'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A494423030000000000000000000000}
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
    Master = Contracts
    MasterFields = 'ID'
    DetailFields = 'ID#'
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
    Top = 56
    object OverdueInterestsID: TFloatField
      FieldName = 'ID#'
      Required = True
    end
    object OverdueInterestsHDATE: TDateTimeField
      FieldName = 'HDATE'
      Required = True
    end
    object OverdueInterestsOVERDUEINTEREST: TFloatField
      FieldName = 'OVERDUEINTEREST'
      Required = True
    end
  end
  object DataSrcCategories: TDataSource
    DataSet = Categories
    Left = 392
    Top = 24
  end
  object Categories: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   ID'
      '  ,Category'
      '  From'
      '  SBCM_Categories'
      '   Where '
      '       ID =:ID')
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
    Master = Contracts
    MasterFields = 'ClientType'
    DetailFields = 'ID'
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
    Left = 424
    Top = 24
  end
  object DataSrcReliability: TDataSource
    DataSet = Reliability
    Left = 400
    Top = 152
  end
  object Reliability: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   ID'
      '  ,Reliability'
      '  ,Percent'
      '  From '
      '   SBCM_Reliability'
      '  Where ID = :ID')
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
    Master = Contracts
    MasterFields = 'ReliabilityID'
    DetailFields = 'ID'
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
    Left = 440
    Top = 152
    object ReliabilityID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ReliabilityRELIABILITY: TStringField
      FieldName = 'RELIABILITY'
      Required = True
      Size = 132
    end
    object ReliabilityPERCENT: TIntegerField
      FieldName = 'PERCENT'
      Required = True
    end
  end
  object DataSrcPledgetypes: TDataSource
    DataSet = Pledges
    Left = 416
    Top = 256
  end
  object Pledges: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   ID'
      '  ,Type'
      '  From'
      '   SBCM_PledgeTypes'
      '  Where '
      '   ID = :ID')
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
    Master = Contracts
    MasterFields = 'PledgeType'
    DetailFields = 'ID'
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
    Left = 448
    Top = 256
  end
  object DataSrcContractType: TDataSource
    DataSet = ContractType
    Left = 216
    Top = 336
  end
  object ContractType: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  ID'
      ' ,Type'
      ' From'
      '  SBCM_Credit_Types'
      ' Where '
      '    ID=:ID'
      '    ')
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
    Master = Contracts
    MasterFields = 'ContractType'
    DetailFields = 'ID'
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
    Left = 216
    Top = 288
  end
  object OverdueReliability: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   ID'
      '  ,Reliability'
      '  ,Percent'
      '  From '
      '   SBCM_Reliability'
      '  Where ID = :ID')
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
    Master = Contracts
    MasterFields = 'OverdueReliabilityID'
    DetailFields = 'ID'
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
    Left = 96
    Top = 112
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'RELIABILITY'
      Required = True
      Size = 132
    end
    object IntegerField2: TIntegerField
      FieldName = 'PERCENT'
      Required = True
    end
  end
end
