object BriefcaseQRepDataMod: TBriefcaseQRepDataMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 195
  Top = 142
  Height = 480
  Width = 696
  object ExportDataSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT'
      '    C.ID as CUSTOMERID'
      '   ,C.NAME as CUSTOMERNAME'
      '  FROM'
      '    CREDITSMGR.CM_PORTFOLIO P'
      '   ,CREDITSMGR.SB_CUSTOMERS C'
      ' WHERE'
      '    P.BOOROWERID = C.ID')
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
    Left = 32
    Top = 32
  end
end
