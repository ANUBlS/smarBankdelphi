object DataModuleNewDeposit: TDataModuleNewDeposit
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 148
  Top = 134
  Height = 480
  Width = 696
  object DepositAccs: TOracleDataSet
    SQL.Strings = (
      'Select'
      '    Ac.ID as  ID'
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
      '                               Upper(Name) = '#39'DEPOSIT'#39
      '                             )'
      '           )'
      '         )'
      '        AND (Ac.Close_Dat is null) '
      '     order by  AccNo'
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
    Master = Currencys
    MasterFields = 'Valute'
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
    Left = 16
    Top = 128
    object DepositAccsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DepositAccsACCNO: TStringField
      FieldName = 'ACCNO'
    end
    object DepositAccsCLIENTNAME: TStringField
      FieldName = 'CLIENTNAME'
      Size = 90
    end
    object DepositAccsVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
  end
  object DataSrcDepositAccs: TDataSource
    DataSet = DepositAccs
    Left = 56
    Top = 128
  end
  object ClientAccs: TOracleDataSet
    SQL.Strings = (
      'Select'
      '    Ac.ID as  ID'
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
      '                               Upper(Name) = '#39'ACCOUNT'#39
      '                             )'
      '           )'
      '         )'
      '        AND (Ac.Close_Dat is null) '
      '     order by  AccNo'
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
    Master = Currencys
    MasterFields = 'Valute'
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
    Left = 16
    Top = 184
    object ClientAccsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ClientAccsACCNO: TStringField
      FieldName = 'ACCNO'
    end
    object ClientAccsCLIENTNAME: TStringField
      FieldName = 'CLIENTNAME'
      Size = 90
    end
    object ClientAccsVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
  end
  object DataSrcClientAccs: TDataSource
    DataSet = ClientAccs
    Left = 56
    Top = 184
  end
  object InterestAccs: TOracleDataSet
    SQL.Strings = (
      'Select'
      '    Ac.ID as  ID'
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
      '                               Upper(Name) = '#39'PERCENT'#39
      '                             )'
      '           )'
      '         )'
      '      AND (Ac.Close_Dat is null)   '
      '     order by  AccNo'
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
    Master = Currencys
    MasterFields = 'Valute'
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
    Left = 16
    Top = 240
    object InterestAccsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object InterestAccsACCNO: TStringField
      FieldName = 'ACCNO'
    end
    object InterestAccsCLIENTNAME: TStringField
      FieldName = 'CLIENTNAME'
      Size = 90
    end
    object InterestAccsVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
  end
  object DataSrcInterestAccs: TDataSource
    DataSet = InterestAccs
    Left = 56
    Top = 240
  end
  object ClientCategoriesDataSet: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  ID'
      ' ,CATEGORY'
      ' From'
      '  SBCM_CATEGORIES'
      ' Order By ID')
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
    Left = 288
    Top = 136
  end
  object DataSrcClientCategories: TDataSource
    DataSet = ClientCategoriesDataSet
    Left = 328
    Top = 136
  end
  object DepositTypes: TOracleDataSet
    SQL.Strings = (
      'Select '
      '   ID'
      '  ,Type'
      ' From SBCM_Deposit_Types'
      ' Order By ID ')
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
    Left = 288
    Top = 96
  end
  object DataSrcdepositTypes: TDataSource
    DataSet = DepositTypes
    Left = 328
    Top = 96
  end
  object Currencys: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   Valute'
      '  ,Valu_Name'
      '  From '
      '     AValute ')
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
    Left = 16
    object CurrencysVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object CurrencysVALU_NAME: TStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
  end
  object DataSrcCurrencys: TDataSource
    DataSet = Currencys
    Left = 48
  end
  object DepositProperties: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBCM_CONTRACT'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 336
    Top = 312
  end
end
