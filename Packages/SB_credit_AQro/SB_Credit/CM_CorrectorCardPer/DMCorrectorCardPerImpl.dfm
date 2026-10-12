object DMCorrectorCardPer: TDMCorrectorCardPer
  OldCreateOrder = False
  Left = 201
  Top = 161
  Height = 480
  Width = 696
  object TranchesDatSrc: TDataSource
    DataSet = Tranches
    Left = 32
    Top = 24
  end
  object Tranches: TOracleDataSet
    SQL.Strings = (
      '/* Formatted on 2007/06/10 23:21 (Formatter Plus v4.8.6) */'
      'SELECT ID, tranchedate, trancheamount'
      '  FROM cm_tranches'
      ' WHERE creditid = :crdid'
      '')
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
    Left = 112
    Top = 25
    object TranchesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object TranchesTRANCHEDATE: TDateTimeField
      FieldName = 'TRANCHEDATE'
      Required = True
    end
    object TranchesTRANCHEAMOUNT: TFloatField
      FieldName = 'TRANCHEAMOUNT'
      Required = True
    end
  end
  object RestsDatSrc: TDataSource
    DataSet = Rests
    Left = 32
    Top = 90
  end
  object Rests: TOracleDataSet
    SQL.Strings = (
      '/* Formatted on 2007/06/10 23:39 (Formatter Plus v4.8.6) */'
      'SELECT rowid,hdate,tranchid, rest, intrest,partkey,cardid'
      '  FROM cm_cardrest_curr_state'
      ' WHERE tranchid = :trid'
      'UNION'
      'SELECT rowid,hdate,tranchid, rest, intrest,partkey,cardid'
      '  FROM cm_cardrest_prev_state'
      ' WHERE tranchid = :trid'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000050000003A54524944030000000000000000000000}
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
    BeforePost = RestsBeforePost
    Left = 112
    Top = 90
    object RestsHDATE: TDateTimeField
      FieldName = 'HDATE'
    end
    object RestsTRANCHID: TFloatField
      FieldName = 'TRANCHID'
    end
    object RestsREST: TFloatField
      FieldName = 'REST'
    end
    object RestsINTREST: TFloatField
      FieldName = 'INTREST'
    end
    object RestsPARTKEY: TFloatField
      FieldName = 'PARTKEY'
    end
    object RestsCARDID: TFloatField
      FieldName = 'CARDID'
    end
    object Restscardsort: TStringField
      FieldKind = fkLookup
      FieldName = 'cardsort'
      LookupDataSet = cardsorts
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIPTION'
      KeyFields = 'CARDID'
      Lookup = True
    end
  end
  object Int: TOracleDataSet
    SQL.Strings = (
      '/* Formatted on 2007/06/10 23:53 (Formatter Plus v4.8.6) */'
      'SELECT rowid,hdate, tranchid, interest,partkey,cardid'
      '  FROM cm_cardintrest_curr_state'
      ' where  tranchid = :trid'
      'UNION'
      'SELECT rowid,hdate, tranchid, interest,partkey,cardid'
      '  FROM cm_cardintrest_prev_state'
      'where tranchid = :trid'
      ''
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000050000003A54524944030000000000000000000000}
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
    BeforePost = IntBeforePost
    Left = 112
    Top = 152
    object IntHDATE: TDateTimeField
      FieldName = 'HDATE'
    end
    object IntTRANCHID: TFloatField
      FieldName = 'TRANCHID'
    end
    object IntINTEREST: TFloatField
      FieldName = 'INTEREST'
    end
    object IntPARTKEY: TFloatField
      FieldName = 'PARTKEY'
    end
    object IntCARDID: TFloatField
      FieldName = 'CARDID'
    end
    object Intcardsort: TStringField
      FieldKind = fkLookup
      FieldName = 'cardsort'
      LookupDataSet = cardsorts
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIPTION'
      KeyFields = 'CARDID'
      Lookup = True
    end
  end
  object IntDatSrc: TDataSource
    DataSet = Int
    Left = 32
    Top = 152
  end
  object cardsorts: TOracleDataSet
    SQL.Strings = (
      'SELECT id,description'
      '  FROM cm_calc_cardsorts')
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
    Active = True
    Left = 264
    Top = 24
    object cardsortsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object cardsortsDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Required = True
      Size = 90
    end
  end
  object cardsortsDatSrc: TDataSource
    DataSet = cardsorts
    Left = 192
    Top = 24
  end
end
