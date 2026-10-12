object TrafficDataModule: TTrafficDataModule
  OldCreateOrder = False
  Left = 203
  Top = 107
  Height = 480
  Width = 696
  object DataSrcTraffic: TDataSource
    DataSet = TrafficData
    Left = 64
    Top = 24
  end
  object TrafficData: TOracleDataSet
    SQL.Strings = (
      'Select * from   sbcm_tranches'
      'where '
      '   ID# = :ID#'
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
    Left = 144
    Top = 24
    object TrafficDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object TrafficDataID2: TFloatField
      FieldName = 'ID#'
      Required = True
    end
    object TrafficDataHDATE: TDateTimeField
      FieldName = 'HDATE'
      Required = True
    end
    object TrafficDataTOTAL: TFloatField
      FieldName = 'TOTAL'
      currency = True
    end
  end
end
