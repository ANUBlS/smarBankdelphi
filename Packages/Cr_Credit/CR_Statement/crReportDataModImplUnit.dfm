object ReportDataModule: TReportDataModule
  OldCreateOrder = False
  Left = 211
  Top = 195
  Height = 454
  Width = 612
  object ClientDataSet: TOracleDataSet
    SQL.Strings = (
      'select  '
      '        A.contractaccid,'
      '        v.val_name,'
      '        P.boorowerid,'
      '        P.dateofconclusion,'
      
        '        cm_common.accountnumber_get(A.booroweraccid) as clientac' +
        'cno,'
      
        '        cm_common.accountnumber_get(A.contractaccid) as contract' +
        'acccno,'
      
        '        cm_common.accountnumber_get(A.interestaccid) as interest' +
        'acccno,'
      
        '        cm_common.accountnumber_get(A.dueloanaccid) as dueloanac' +
        'cno,'
      
        '        cm_common.accountnumber_get(A.dueinterestaccid) as duein' +
        'terestaccno,'
      '        cm_common.accountnumber_get(A.loanaccid) as loanaccAccno'
      '        '
      'from  CM_ACCOUNTS A,'
      '      cm_portfolio P,'
      '      sb_avalute v     '
      '         '
      'where '
      '      ( P.id = :id)and'
      '      (A.creditid = P.id)and'
      '      (v.valute = p.currency)       ')
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 32
    Top = 24
    object ClientDataSetCONTRACTACCID: TFloatField
      FieldName = 'CONTRACTACCID'
    end
    object ClientDataSetVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object ClientDataSetBOOROWERID: TFloatField
      FieldName = 'BOOROWERID'
    end
    object ClientDataSetDATEOFCONCLUSION: TDateTimeField
      FieldName = 'DATEOFCONCLUSION'
    end
    object ClientDataSetCLIENTACCNO: TStringField
      FieldName = 'CLIENTACCNO'
      Size = 4000
    end
    object ClientDataSetCONTRACTACCCNO: TStringField
      FieldName = 'CONTRACTACCCNO'
      Size = 4000
    end
    object ClientDataSetINTERESTACCCNO: TStringField
      FieldName = 'INTERESTACCCNO'
      Size = 4000
    end
    object ClientDataSetDUEINTERESTACCNO: TStringField
      FieldName = 'DUEINTERESTACCNO'
      Size = 4000
    end
    object ClientDataSetLOANACCACCNO: TStringField
      FieldName = 'LOANACCACCNO'
      Size = 4000
    end
    object ClientDataSetDUELOANACCNO: TStringField
      FieldName = 'DUELOANACCNO'
      Size = 4000
    end
  end
  object OracleDataSet2: TOracleDataSet
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
    DesignActivation = False
    Active = False
    Left = 128
    Top = 24
  end
  object OracleDataSet3: TOracleDataSet
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
    DesignActivation = False
    Active = False
    Left = 227
    Top = 24
  end
  object ClientDataSource: TDataSource
    DataSet = ClientDataSet
    Left = 32
    Top = 72
  end
  object DataSource2: TDataSource
    Left = 128
    Top = 80
  end
  object DataSource3: TDataSource
    Left = 232
    Top = 80
  end
end
