object ActvDataMod: TActvDataMod
  OldCreateOrder = False
  Left = 194
  Top = 202
  Height = 328
  Width = 562
  object CreditInfo: TOracleDataSet
    SQL.Strings = (
      'select OBLIGATION , PLEDGEPRICE'
      '   from CM_ACTIVE'
      'where id=:id')
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
    Cursor = crSQLWait
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
    Left = 80
    Top = 40
  end
  object DataSrcCreditInfo: TDataSource
    DataSet = CreditInfo
    Left = 168
    Top = 40
  end
  object ActivationPckg: TOraclePackage
    Session = CMDataModule.CMSession
    Debug = False
    PackageName = 'CM_CREDIT'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Optimize = True
    Left = 80
    Top = 104
  end
end
