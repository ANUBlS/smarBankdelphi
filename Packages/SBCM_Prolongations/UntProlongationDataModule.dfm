object DataModuleProlongation: TDataModuleProlongation
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 192
  Top = 107
  Height = 375
  Width = 544
  object ProlongationPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBCM_Prolongation'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 64
    Top = 8
  end
  object DataSrcProlongations: TDataSource
    DataSet = Prolongations
    Left = 24
    Top = 104
  end
  object Prolongations: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  ID'
      ' ,HDate'
      ' ,OldDate'
      ' ,NewDate'
      ' From'
      '    SBCM_Prolongations'
      '   Where'
      '       ID# =:ContractID'
      ''
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000010000000B0000003A434F4E54524143544944030000000000000000
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
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 64
    Top = 104
  end
end
