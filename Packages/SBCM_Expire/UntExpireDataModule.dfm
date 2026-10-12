object DataModExpire: TDataModExpire
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 200
  Top = 112
  Height = 534
  Width = 722
  object ExpirePackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBCM_Expire'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 32
    Top = 24
  end
  object ReliabilityPercentData: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   ID'
      '  ,Percent'
      '  From'
      '    SBCM_Reliability'
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
    Left = 376
    Top = 264
  end
  object DataSrcReliability: TDataSource
    DataSet = ReliabilityPercentData
    Left = 376
    Top = 312
  end
  object DataSrcMainReserve: TDataSource
    DataSet = MainReserve
    Left = 272
    Top = 16
  end
  object MainReserve: TOracleDataSet
    SQL.Strings = (
      'select'
      '   RELIABILITY,percent,id'
      'from'
      '  SBCM_Reliability'
      'where'
      
        '   ID = (select c.reliabilityid from sbcm_contracts c where c.id' +
        ' =:id)')
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
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 272
    Top = 64
  end
  object DataSrcExpiredReserve: TDataSource
    DataSet = ExpiredReserve
    Left = 160
    Top = 16
  end
  object ExpiredReserve: TOracleDataSet
    SQL.Strings = (
      'select'
      '  RELIABILITY,percent,id'
      'from'
      '  SBCM_Reliability'
      'where'
      
        '   ID = (select c.overduereliabilityid from sbcm_contracts c whe' +
        're c.id =:id)'
      ' ')
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
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 160
    Top = 64
  end
  object OverdueReserveData: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   ID'
      '  ,Percent'
      '  From'
      '    SBCM_Reliability')
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
    Left = 264
    Top = 264
  end
  object DataSrcOverdueReserve: TDataSource
    DataSet = OverdueReserveData
    Left = 264
    Top = 312
  end
  object ReserveCont: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBCM_RESERVE_CONT'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 32
    Top = 88
  end
  object OverdueAccData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  Ac.Acc_No as ClientAccNo ,'
      '  Ac.Name  as ClientAccName ,'
      '  av.val_Name as ClientCurrency'
      'from'
      '  AValute Av ,'
      '  Account Ac '
      'where '
      '  Ac.val_acc = av.valute and'
      '  Ac.ID = :ClientAccID'
      '  '
      '  ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000010000000C0000003A434C49454E5441434349440300000000000000
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
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 64
    Top = 296
    object StringField1: TStringField
      FieldName = 'CLIENTACCNO'
    end
    object StringField2: TStringField
      FieldName = 'CLIENTACCNAME'
      Size = 90
    end
    object StringField3: TStringField
      FieldName = 'CLIENTCURRENCY'
      Size = 10
    end
  end
  object DataSrcOverdueAccData: TDataSource
    DataSet = OverdueAccData
    Left = 72
    Top = 344
  end
  object ClientAccData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  Ac.Acc_No as ClientAccNo ,'
      '  Ac.Name  as ClientAccName ,'
      '  av.val_Name as ClientCurrency'
      'from'
      '  AValute Av ,'
      '  Account Ac '
      'where '
      '  Ac.val_acc = av.valute and'
      '  Ac.ID = :ClientAccID'
      '  '
      '  ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000010000000C0000003A434C49454E5441434349440300000000000000
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
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 408
    Top = 128
    object ClientAccDataCLIENTACCNO: TStringField
      FieldName = 'CLIENTACCNO'
    end
    object ClientAccDataCLIENTACCNAME: TStringField
      FieldName = 'CLIENTACCNAME'
      Size = 90
    end
    object ClientAccDataCLIENTCURRENCY: TStringField
      FieldName = 'CLIENTCURRENCY'
      Size = 10
    end
  end
  object DataSrcClientAccData: TDataSource
    DataSet = ClientAccData
    Left = 416
    Top = 176
  end
  object SReserveData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  Ac.Acc_No as ClientAccNo ,'
      '  Ac.Name  as ClientAccName ,'
      '  av.val_Name as ClientCurrency'
      'from'
      '  AValute Av ,'
      '  Account Ac '
      'where '
      '  Ac.val_acc = av.valute and'
      '  Ac.ID = :ClientAccID'
      '  '
      '  ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000010000000C0000003A434C49454E5441434349440300000000000000
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
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 40
    Top = 160
    object StringField4: TStringField
      FieldName = 'CLIENTACCNO'
    end
    object StringField5: TStringField
      FieldName = 'CLIENTACCNAME'
      Size = 90
    end
    object StringField6: TStringField
      FieldName = 'CLIENTCURRENCY'
      Size = 10
    end
  end
  object DataSrcSReserveData: TDataSource
    DataSet = SReserveData
    Left = 32
    Top = 208
  end
  object PReserveData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  Ac.Acc_No as ClientAccNo ,'
      '  Ac.Name  as ClientAccName ,'
      '  av.val_Name as ClientCurrency'
      'from'
      '  AValute Av ,'
      '  Account Ac '
      'where '
      '  Ac.val_acc = av.valute and'
      '  Ac.ID = :ClientAccID'
      '  '
      '  ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000010000000C0000003A434C49454E5441434349440300000000000000
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
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 184
    Top = 152
    object StringField7: TStringField
      FieldName = 'CLIENTACCNO'
    end
    object StringField8: TStringField
      FieldName = 'CLIENTACCNAME'
      Size = 90
    end
    object StringField9: TStringField
      FieldName = 'CLIENTCURRENCY'
      Size = 10
    end
  end
  object DataSrcPReserveData: TDataSource
    DataSet = PReserveData
    Left = 192
    Top = 200
  end
end
