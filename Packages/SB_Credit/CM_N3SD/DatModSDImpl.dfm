object DatModSD: TDatModSD
  OldCreateOrder = False
  Left = 214
  Top = 148
  Height = 388
  Width = 681
  object Rests: TOracleDataSet
    SQL.Strings = (
      
        'SELECT dateofcredit, namount, navgintamount, famount, favgintamo' +
        'unt,'
      '       fnamount, fnavgintamount'
      '  FROM cm_rests_sd')
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
    Left = 40
    Top = 16
    object RestsDATEOFCREDIT: TWideStringField
      DisplayLabel = 'Мцддятляр цзря'
      FieldName = 'DATEOFCREDIT'
      Required = True
      Size = 25
    end
    object RestsNAMOUNT: TFloatField
      DisplayLabel = 'Милли валйутада .м'
      FieldName = 'NAMOUNT'
    end
    object RestsNAVGINTAMOUNT: TFloatField
      DisplayLabel = 'Милли валйутада  орта %'
      FieldName = 'NAVGINTAMOUNT'
    end
    object RestsFAMOUNT: TFloatField
      DisplayLabel = 'СДВ валйутада .м'
      FieldName = 'FAMOUNT'
    end
    object RestsFAVGINTAMOUNT: TFloatField
      DisplayLabel = 'СДВ валйутада  орта %'
      FieldName = 'FAVGINTAMOUNT'
    end
    object RestsFNAMOUNT: TFloatField
      DisplayLabel = 'ГДВ валйутада .м'
      FieldName = 'FNAMOUNT'
    end
    object RestsFNAVGINTAMOUNT: TFloatField
      DisplayLabel = 'ГДВ валйутада  орта %'
      FieldName = 'FNAVGINTAMOUNT'
    end
  end
  object CM_SD1: TOraclePackage
    Session = CMDataModule.CMSession
    Debug = False
    PackageName = 'CM_SD1'
    ParameterMode = pmPositional
    Cursor = crSQLWait
    Optimize = True
    Left = 40
    Top = 96
  end
  object DatScrRsts: TDataSource
    DataSet = Rests
    Left = 144
    Top = 8
  end
end
