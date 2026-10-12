object Correct_Tr_Py_DatMod: TCorrect_Tr_Py_DatMod
  OldCreateOrder = False
  Left = 211
  Top = 155
  Height = 480
  Width = 696
  object TranchesDatSet: TOracleDataSet
    SQL.Strings = (
      'select id,tranchedate, trancheamount'
      'from cm_tranches'
      'where CreditID =:CrdID')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000060000003A4352444944030000000000000000000000}
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
    Left = 40
    Top = 32
  end
  object PaymentsDatSet: TOracleDataSet
    SQL.Strings = (
      'select paydate, payedamt, payedintamt, payeddueamt,'
      '       payeddueintamt, payedpenaltyamt'
      'from cm_payments'
      'where creditID =:CrdID')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000060000003A4352444944030000000000000000000000}
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
    Left = 32
    Top = 112
  end
  object TranchesDatSrc: TDataSource
    DataSet = TranchesDatSet
    Left = 128
    Top = 32
  end
  object PaymentsDatSrc: TDataSource
    DataSet = PaymentsDatSet
    Left = 128
    Top = 112
  end
  object CM_CORRECT_TRANCH_PAYM: TOraclePackage
    Session = CMDataModule.CMSession
    Debug = False
    PackageName = 'CM_CORRECT_TRANCH_PAYM'
    ParameterMode = pmNamed
    Cursor = crDefault
    Optimize = True
    Left = 288
    Top = 40
  end
end
