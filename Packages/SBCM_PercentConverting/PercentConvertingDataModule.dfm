object DataModPercentConv: TDataModPercentConv
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 156
  Top = 86
  Height = 375
  Width = 544
  object CalcedPercents: TOracleDataSet
    SQL.Strings = (
      'Select'
      ''
      '   CalcedPercents.RowID'
      '  ,CalcedPercents.*'
      ''
      '  From'
      ''
      '   SBCM_Calced_Percents_Viewer  CalcedPercents'
      ''
      '  Order By      :OrderClause '
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000010000000C0000003A4F52444552434C415553450100000000000000
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
    AfterPost = CalcedPercentsAfterPost
    BeforeDelete = CalcedPercentsBeforeDelete
    Left = 40
    Top = 152
    object CalcedPercentsCONTRACTID: TFloatField
      FieldName = 'CONTRACTID'
      Required = True
    end
    object CalcedPercentsCONTRACTCURRENCYID: TFloatField
      FieldName = 'CONTRACTCURRENCYID'
    end
    object CalcedPercentsCONTRACTCURRENCYNAME: TStringField
      FieldName = 'CONTRACTCURRENCYNAME'
      Size = 4000
    end
    object CalcedPercentsCONTRACTNO: TStringField
      FieldName = 'CONTRACTNO'
      Size = 64
    end
    object CalcedPercentsCONTRACTACCNO: TStringField
      FieldName = 'CONTRACTACCNO'
      Size = 4000
    end
    object CalcedPercentsCONTRACTACCNAME: TStringField
      FieldName = 'CONTRACTACCNAME'
      Size = 4000
    end
    object CalcedPercentsFACTICALDEBT: TFloatField
      FieldName = 'FACTICALDEBT'
      currency = True
    end
    object CalcedPercentsFACTICALINTERESTDEBT: TFloatField
      FieldName = 'FACTICALINTERESTDEBT'
      currency = True
    end
    object CalcedPercentsINTERESTBALANCE: TFloatField
      FieldName = 'INTERESTBALANCE'
      currency = True
    end
    object CalcedPercentsCALCEDMAINDEBT: TFloatField
      FieldName = 'CALCEDMAINDEBT'
      currency = True
    end
    object CalcedPercentsCALCEDOVERDUEDEBT: TFloatField
      FieldName = 'CALCEDOVERDUEDEBT'
      currency = True
    end
    object CalcedPercentsOVERDUEDEBT: TFloatField
      FieldName = 'OVERDUEDEBT'
      currency = True
    end
    object CalcedPercentsOVERDUEINTERESTDEBT: TFloatField
      FieldName = 'OVERDUEINTERESTDEBT'
      currency = True
    end
  end
  object DataSrcCalcedPercents: TDataSource
    DataSet = CalcedPercents
    Left = 160
    Top = 96
  end
  object CalcedPercentsPack: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBCM_PERCENT_CONVERTING'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 40
    Top = 8
  end
end
