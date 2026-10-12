object DataModPayments: TDataModPayments
  OldCreateOrder = False
  Left = 256
  Top = 142
  Height = 570
  Width = 661
  object PaymentsPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBCM_Payment'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 40
    Top = 16
  end
  object AccountRests: TOracleDataSet
    SQL.Strings = (
      'Select'
      '     Ostat'
      '  '#9' ,Pok_Ostat From Archost'
      '  Where   Acc_ID = :AccID'
      #9'   '#9' and DatDate =:HDate')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000060000003A41434349440300000000000000000000000600
      00003A48444154450C0000000000000000000000}
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
    Left = 144
    Top = 16
    object AccountRestsOSTAT: TFloatField
      FieldName = 'OSTAT'
      currency = True
    end
    object AccountRestsPOK_OSTAT: TFloatField
      FieldName = 'POK_OSTAT'
      currency = True
    end
  end
  object DataSrcRests: TDataSource
    DataSet = AccountRests
    Left = 144
    Top = 64
  end
  object ClentAccData: TOracleDataSet
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
    object ClentAccDataCLIENTACCNO: TStringField
      FieldName = 'CLIENTACCNO'
    end
    object ClentAccDataCLIENTACCNAME: TStringField
      FieldName = 'CLIENTACCNAME'
      Size = 90
    end
    object ClentAccDataCLIENTCURRENCY: TStringField
      FieldName = 'CLIENTCURRENCY'
      Size = 10
    end
  end
  object DataSrcClientAccData: TDataSource
    DataSet = ClentAccData
    Left = 192
    Top = 200
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
  object OInterestAccData: TOracleDataSet
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
    Left = 336
    Top = 296
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
  object DataSrcOInterestAccData: TDataSource
    DataSet = OInterestAccData
    Left = 344
    Top = 344
  end
  object InterestAccData: TOracleDataSet
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
    Left = 32
    Top = 160
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
  object DataSrcInterestAccData: TDataSource
    DataSet = InterestAccData
    Left = 32
    Top = 208
  end
end
