object sbovclDataModule: TsbovclDataModule
  OldCreateOrder = False
  Left = 280
  Top = 152
  Height = 480
  Width = 696
  object SBConfig: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBCONFIG'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 24
    Top = 16
  end
  object ReadSectionQuery: TOracleQuery
    SQL.Strings = (
      'begin'
      '  :sections := sbconfig.ReadSection(:Ident);'
      'end;')
    Session = sboapiDataModule.SBSession
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000060000003A4944454E540500000000000000000000000900
      00003A53454354494F4E53740000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 120
    Top = 16
  end
  object ResultQuery: TOracleQuery
    Session = sboapiDataModule.SBSession
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 224
    Top = 16
  end
  object ReadSectionValuesQuery: TOracleQuery
    SQL.Strings = (
      'begin'
      '  :sections_values := sbconfig.ReadSectionValues(:Ident);'
      'end;')
    Session = sboapiDataModule.SBSession
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000060000003A4944454E540500000000000000000000001000
      00003A53454354494F4E535F56414C554553740000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 120
    Top = 72
  end
  object SectionsData: TOracleDataSet
    SQL.Strings = (
      'begin'
      '  :Sections := sbconfig.ReadSections;'
      'end;')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000090000003A53454354494F4E537400000000000000000000
      00}
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
    Left = 224
    Top = 72
  end
  object URep: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    ParameterMode = pmNamed
    Cursor = crDefault
    Optimize = True
    Left = 120
    Top = 136
  end
end
