object DataModContract: TDataModContract
  OldCreateOrder = False
  Left = 65532
  Top = 65532
  Height = 723
  Width = 1032
  object DataSrcCurrency: TDataSource
    DataSet = CurrencyDataSet
    Left = 128
    Top = 64
  end
  object CurrencyDataSet: TOracleDataSet
    SQL.Strings = (
      'Select '
      '    Valute as CurrencyID,'
      '    Valu_Name as CurrencyName,'
      '    Val_Name as CurrencyShortName   '
      '    From'
      '       AVALUTE'
      '     ')
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
    Left = 160
    Top = 64
  end
  object GrandAcc: TOracleDataSet
    Tag = 13
    SQL.Strings = (
      'Select'
      '    Ac.ID as  ID'
      '   ,Ac.Kli_ID as CustID'
      '   ,Ac.Acc_No as AccNo'
      '   ,Ac.Name as ClientName'
      '  ,Ac.Val_Acc'
      ' From'
      '    Account Ac'
      '    Where'
      '    Val_Acc=:Val_Acc AND'
      '       ('
      '          Ac.Bal_Cn1'
      '       In ('
      '           Select'
      '             AccGroup'
      '            From  SBCM_Acc_Zone_Info'
      '                  Where'
      '                   ZoneID = ('
      '                     Select ZoneID'
      '                       From  SBCM_Acc_Zones'
      '                             Where'
      '                               Upper(Name) = '#39'CREDIT'#39
      '                             )'
      '           )'
      '         )'
      '     order by  AccNo'
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000080000003A56414C5F414343030000000000000000000000}
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
    Master = CurrencyDataSet
    MasterFields = 'CurrencyID'
    DetailFields = 'Val_ACC'
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
    Left = 163
    Top = 138
    object GrandAccID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object GrandAccACCNO: TStringField
      FieldName = 'ACCNO'
    end
    object GrandAccCLIENTNAME: TStringField
      FieldName = 'CLIENTNAME'
      Size = 90
    end
    object GrandAccVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object GrandAccCUSTID: TFloatField
      FieldName = 'CUSTID'
    end
  end
  object DataSrcGrant: TDataSource
    DataSet = GrandAcc
    Left = 129
    Top = 139
  end
  object DataSrcClientAcc: TDataSource
    DataSet = ClientAcc
    Left = 131
    Top = 202
  end
  object ClientAcc: TOracleDataSet
    Tag = 13
    SQL.Strings = (
      'Select'
      '    Ac.ID as  ID'
      '   ,Ac.Kli_ID as CustID'
      '   ,Ac.Acc_No as AccNo'
      '   ,Ac.Name as ClientName'
      '   ,Ac.Val_Acc'
      ' From'
      '    Account Ac'
      '    Where'
      'Val_Acc = :Val_Acc  AND'
      '       ('
      '          Ac.Bal_Cn1'
      '       In ('
      '           Select'
      '             AccGroup'
      '            From  SBCM_Acc_Zone_Info'
      '                  Where                  '
      '                   ZoneID = ('
      '                     Select ZoneID'
      '                       From  SBCM_Acc_Zones'
      '                             Where'
      '                               Upper(Name) = '#39'ACCOUNT'#39
      '                             )'
      '           )'
      '         )'
      '     order by AccNo'
      ''
      ' '
      ' '
      ' '
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000080000003A56414C5F414343030000000000000000000000}
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
    Master = CurrencyDataSet
    MasterFields = 'CurrencyID'
    DetailFields = 'Val_Acc'
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
    Left = 163
    Top = 202
    object ClientAccID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ClientAccCUSTID: TFloatField
      FieldName = 'CUSTID'
    end
    object ClientAccACCNO: TStringField
      FieldName = 'ACCNO'
    end
    object ClientAccCLIENTNAME: TStringField
      FieldName = 'CLIENTNAME'
      Size = 90
    end
    object ClientAccVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
  end
  object ReserveAcc: TOracleDataSet
    Tag = 13
    SQL.Strings = (
      'Select'
      '    Ac.ID as  ID'
      '   ,Ac.Kli_ID as CustID'
      '   ,Ac.Acc_No as AccNo'
      '   ,Ac.Name as ClientName'
      '   ,Ac.Val_Acc'
      ''
      ' From'
      '    Account Ac'
      '    Where   '
      '       ('
      '          Ac.Bal_Cn1'
      '       In ('
      '           Select'
      '             AccGroup'
      '            From  SBCM_Acc_Zone_Info'
      '                  Where                '
      '                   ZoneID = ('
      '                     Select ZoneID'
      '                       From  SBCM_Acc_Zones'
      '                             Where'
      '                               Upper(Name) = '#39'RESERV'#39
      '                             )'
      '           )'
      '         )'
      '  order by AccNo'
      ''
      ''
      ' '
      ' ')
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
    Left = 131
    Top = 250
    object ReserveAccID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ReserveAccCUSTID: TFloatField
      FieldName = 'CUSTID'
    end
    object ReserveAccACCNO: TStringField
      FieldName = 'ACCNO'
    end
    object ReserveAccCLIENTNAME: TStringField
      FieldName = 'CLIENTNAME'
      Size = 90
    end
    object ReserveAccVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
  end
  object DataSrcReserveAcc: TDataSource
    DataSet = ReserveAcc
    Left = 163
    Top = 250
  end
  object DataSrcInterestAcc: TDataSource
    DataSet = InterestAcc
    Left = 131
    Top = 307
  end
  object InterestAcc: TOracleDataSet
    Tag = 13
    SQL.Strings = (
      'Select'
      '    Ac.ID as  ID'
      '   ,Ac.Kli_ID as CustID'
      '   ,Ac.Acc_No as AccNo'
      '   ,Ac.Name as ClientName'
      '  ,Ac.Val_Acc'
      ' From'
      '    Account Ac'
      '    Where '
      '       Val_Acc=:Val_Acc AND  '
      '       ('
      '          Ac.Bal_Cn1'
      '       In ('
      '           Select'
      '             AccGroup'
      '            From  SBCM_Acc_Zone_Info'
      '                  Where'
      '                   ZoneID = ('
      '                     Select ZoneID'
      '                       From  SBCM_Acc_Zones'
      '                             Where'
      '                               Upper(Name) = '#39'PERCENT'#39
      '                             )'
      '           )'
      '         )'
      '    Order By AccNo'
      ' '
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000080000003A56414C5F414343030000000000000000000000}
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
    Master = CurrencyDataSet
    MasterFields = 'CurrencyID'
    DetailFields = 'VAL_ACC'
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
    Left = 163
    Top = 307
    object InterestAccID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object InterestAccCUSTID: TFloatField
      FieldName = 'CUSTID'
    end
    object InterestAccACCNO: TStringField
      FieldName = 'ACCNO'
    end
    object InterestAccCLIENTNAME: TStringField
      FieldName = 'CLIENTNAME'
      Size = 90
    end
    object InterestAccVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
  end
  object OverdueAcc: TOracleDataSet
    Tag = 13
    SQL.Strings = (
      'Select'
      '    Ac.ID as  ID'
      '   ,Ac.Kli_ID as CustID'
      '   ,Ac.Acc_No as AccNo'
      '   ,Ac.Name as ClientName'
      '  ,Ac.Val_Acc'
      ''
      ' From'
      '    Account Ac'
      '    Where '
      'Val_Acc=:Val_Acc AND   '
      '       ('
      '          Ac.Bal_Cn1'
      '       In ('
      '           Select'
      '             AccGroup'
      '            From  SBCM_Acc_Zone_Info'
      '                  Where'
      '                   ZoneID = ('
      '                     Select ZoneID'
      '                       From  SBCM_Acc_Zones'
      '                             Where'
      '                               Upper(Name) = '#39'OVERDUE'#39
      '                             )'
      '           )'
      '         )'
      '      Order By AccNo'
      ' '
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000080000003A56414C5F414343030000000000000000000000}
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
    Master = CurrencyDataSet
    MasterFields = 'CurrencyID'
    DetailFields = 'VAL_ACC'
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
    Left = 163
    Top = 348
    object OverdueAccID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OverdueAccCUSTID: TFloatField
      FieldName = 'CUSTID'
    end
    object OverdueAccACCNO: TStringField
      FieldName = 'ACCNO'
    end
    object OverdueAccCLIENTNAME: TStringField
      FieldName = 'CLIENTNAME'
      Size = 90
    end
    object OverdueAccVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
  end
  object DataSrcOverdueAcc: TDataSource
    DataSet = OverdueAcc
    Left = 131
    Top = 348
  end
  object DataSrcOverdueInterestAcc: TDataSource
    DataSet = OverdueInterestAcc
    Left = 275
    Top = 381
  end
  object OverdueInterestAcc: TOracleDataSet
    Tag = 13
    SQL.Strings = (
      'Select'
      '    Ac.ID as  ID'
      '   ,Ac.Kli_ID as CustID'
      '   ,Ac.Acc_No as AccNo'
      '   ,Ac.Name as ClientName'
      '  ,Ac.Val_Acc'
      ''
      ' From'
      '    Account Ac'
      '    Where  '
      '      Val_Acc=:Val_Acc AND'
      ''
      '       ('
      '          Ac.Bal_Cn1'
      '       In ('
      '           Select'
      '             AccGroup'
      '            From  SBCM_Acc_Zone_Info'
      '                  Where'
      '                   ZoneID = ('
      '                     Select ZoneID'
      '                       From  SBCM_Acc_Zones'
      '                             Where'
      '                               Upper(Name) = '#39'OVERDUEINTEREST'#39
      '                             )'
      '           )'
      '         )'
      '         Order By AccNo'
      ' '
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000080000003A56414C5F414343030000000000000000000000}
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
    Master = CurrencyDataSet
    MasterFields = 'CurrencyID'
    DetailFields = 'VAL_ACC'
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
    Left = 347
    Top = 381
    object OverdueInterestAccID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OverdueInterestAccCUSTID: TFloatField
      FieldName = 'CUSTID'
    end
    object OverdueInterestAccACCNO: TStringField
      FieldName = 'ACCNO'
    end
    object OverdueInterestAccCLIENTNAME: TStringField
      FieldName = 'CLIENTNAME'
      Size = 90
    end
    object OverdueInterestAccVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
  end
  object DataSrcReliability: TDataSource
    DataSet = ReliabilityDataSet
    Left = 240
    Top = 280
  end
  object ReliabilityDataSet: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  ID'
      ' ,Reliability'
      ' ,Percent'
      '   From'
      '     SBCM_Reliability'
      '   ')
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
    Left = 280
    Top = 280
  end
  object ClientCategoriesDataSet: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  ID'
      ' ,CATEGORY'
      ' From'
      '  SBCM_CATEGORIES')
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
    Left = 280
    Top = 128
  end
  object DataSrcClientCategories: TDataSource
    DataSet = ClientCategoriesDataSet
    Left = 240
    Top = 128
  end
  object DataSrcPledgeTypes: TDataSource
    DataSet = PledgeTypesDataSet
    Left = 240
    Top = 176
  end
  object PledgeTypesDataSet: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   ID'
      ' ,Type'
      '  From SBCM_PledgeTypes')
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
    Left = 280
    Top = 176
  end
  object DataSrcCreditType: TDataSource
    DataSet = CreditTypeDataSet
    Left = 240
    Top = 224
  end
  object CreditTypeDataSet: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  ID'
      ' ,Type'
      'From '
      '    SBCM_Credit_Types')
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
    Left = 280
    Top = 224
  end
  object ContractPack: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBCM_Contract'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 400
    Top = 32
  end
  object OverdueReserveAcc: TOracleDataSet
    Tag = 13
    SQL.Strings = (
      'Select'
      '    Ac.ID as  ID'
      '   ,Ac.Kli_ID as CustID'
      '   ,Ac.Acc_No as AccNo'
      '   ,Ac.Name as ClientName'
      '   ,Ac.Val_Acc'
      ''
      ' From'
      '    Account Ac'
      '    Where   '
      '       ('
      '          Ac.Bal_Cn1'
      '       In ('
      '           Select'
      '             AccGroup'
      '            From  SBCM_Acc_Zone_Info'
      '                  Where'
      '                   ZoneID = ('
      '                     Select ZoneID'
      '                       From  SBCM_Acc_Zones'
      '                             Where'
      '                               Upper(Name) = '#39'RESERV'#39
      '                             )'
      '           )'
      '         )'
      '  order by AccNo'
      ''
      ''
      ' '
      ' '
      ' ')
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
    Left = 67
    Top = 97
    object FloatField1: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FloatField2: TFloatField
      FieldName = 'CUSTID'
    end
    object StringField1: TStringField
      FieldName = 'ACCNO'
    end
    object StringField2: TStringField
      FieldName = 'CLIENTNAME'
      Size = 90
    end
    object IntegerField1: TIntegerField
      FieldName = 'VAL_ACC'
    end
  end
  object DataSrcOverdueReserve: TDataSource
    DataSet = OverdueReserveAcc
    Left = 27
    Top = 97
  end
  object DataSrcOverdueReliability: TDataSource
    DataSet = OverdueReliabilityData
    Left = 240
    Top = 80
  end
  object OverdueReliabilityData: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  ID'
      ' ,Reliability'
      ' ,Percent'
      '   From'
      '     SBCM_Reliability'
      '   ')
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
    Left = 280
    Top = 80
  end
end
