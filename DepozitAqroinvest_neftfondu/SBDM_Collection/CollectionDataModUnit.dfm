object CollectionDataMod: TCollectionDataMod
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 203
  Top = 107
  Height = 480
  Width = 696
  object CollectionData: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   *  From SBCM_Collection'
      '  where '
      '     ID# = :ID#'
      'order by HDate')
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
    Left = 136
    Top = 80
    object CollectionDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CollectionDataID2: TFloatField
      FieldName = 'ID#'
    end
    object CollectionDataHDATE: TDateTimeField
      FieldName = 'HDATE'
    end
    object CollectionDataAMOUNT: TFloatField
      FieldName = 'AMOUNT'
      currency = True
    end
    object CollectionDataPERCENT: TFloatField
      FieldName = 'PERCENT'
      currency = True
    end
  end
  object DataSrcCollection: TDataSource
    DataSet = CollectionData
    Left = 232
    Top = 184
  end
end
