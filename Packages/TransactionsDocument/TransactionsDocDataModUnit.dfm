object TransactionsDocDataMod: TTransactionsDocDataMod
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 173
  Top = 136
  Height = 375
  Width = 544
  object ProvarchData: TOracleDataSet
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
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 40
    Top = 80
    object ProvarchDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ProvarchDataOP_ID: TFloatField
      FieldName = 'OP_ID'
    end
    object ProvarchDataNO_PROV: TStringField
      FieldName = 'NO_PROV'
      Size = 8
    end
    object ProvarchDataDAT: TDateTimeField
      FieldName = 'DAT'
    end
    object ProvarchDataDEBT: TFloatField
      FieldName = 'DEBT'
    end
    object ProvarchDataKREDIT: TFloatField
      FieldName = 'KREDIT'
    end
    object ProvarchDataVAL_ACC: TFloatField
      FieldName = 'VAL_ACC'
    end
    object ProvarchDataVID_OP: TIntegerField
      FieldName = 'VID_OP'
    end
    object ProvarchDataAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ProvarchDataLAMMOUNT: TFloatField
      FieldName = 'LAMMOUNT'
    end
    object ProvarchDataTIM: TDateTimeField
      FieldName = 'TIM'
    end
    object ProvarchDataSHIFR: TIntegerField
      FieldName = 'SHIFR'
    end
    object ProvarchDataNO_PACK: TIntegerField
      FieldName = 'NO_PACK'
    end
    object ProvarchDataKASSA_B: TIntegerField
      FieldName = 'KASSA_B'
    end
    object ProvarchDataKASSA_Z: TIntegerField
      FieldName = 'KASSA_Z'
    end
    object ProvarchDataNO_FILIAL: TIntegerField
      FieldName = 'NO_FILIAL'
    end
    object ProvarchDataSLOJ_PROV: TIntegerField
      FieldName = 'SLOJ_PROV'
    end
    object ProvarchDataBANK_D: TFloatField
      FieldName = 'BANK_D'
    end
    object ProvarchDataBANK_K: TFloatField
      FieldName = 'BANK_K'
    end
    object ProvarchDataNO_DOC: TIntegerField
      FieldName = 'NO_DOC'
    end
    object ProvarchDataNO_MEM: TIntegerField
      FieldName = 'NO_MEM'
    end
    object ProvarchDataD1: TStringField
      FieldName = 'D1'
    end
    object ProvarchDataK1: TStringField
      FieldName = 'K1'
    end
    object ProvarchDataRATE_D: TFloatField
      FieldName = 'RATE_D'
    end
    object ProvarchDataRATE_C: TFloatField
      FieldName = 'RATE_C'
    end
    object ProvarchDataPARENTID: TIntegerField
      FieldName = 'PARENTID'
    end
    object ProvarchDataCURRENCYID_C: TIntegerField
      FieldName = 'CURRENCYID_C'
    end
    object ProvarchDataAMMOUNT_C: TFloatField
      FieldName = 'AMMOUNT_C'
    end
    object ProvarchDataNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object ProvarchDataDEBIT: TStringField
      FieldName = 'DEBIT'
    end
    object ProvarchDataCREDIT: TStringField
      FieldName = 'CREDIT'
    end
    object ProvarchDataCURRENCYDEB: TStringField
      FieldName = 'CURRENCYDEB'
      Size = 10
    end
    object ProvarchDataCURRENCYCRED: TStringField
      FieldName = 'CURRENCYCRED'
      Size = 10
    end
  end
  object ProvarchSource: TDataSource
    DataSet = ProvarchData
    Left = 136
    Top = 80
  end
  object TransDocPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SB_TRANSACTIONSDOC'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 40
    Top = 16
  end
  object SysdatData: TOracleDataSet
    SQL.Strings = (
      'select *'
      'from sysdat')
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
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 40
    Top = 152
  end
end
