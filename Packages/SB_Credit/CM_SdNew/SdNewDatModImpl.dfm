object DatModSdNew: TDatModSdNew
  OldCreateOrder = False
  Left = 222
  Top = 133
  Height = 461
  Width = 696
  object Rests: TOracleDataSet
    SQL.Strings = (
      'SELECT id,'
      '       dateofcredit, '
      '       sum(namount), '
      '       sum(navgintamount), '
      '       sum(famount), '
      '       sum(favgintamount),'
      '       sum(fnamount), '
      '       sum(fnavgintamount)'
      '  FROM cm_rests_sd'
      'group by id , dateofcredit'
      ''
      '')
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
    CommitOnPost = False
    CachedUpdates = False
    QBEMode = False
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 32
    Top = 16
    object RestsID: TFloatField
      FieldName = 'ID'
    end
    object RestsDATEOFCREDIT: TStringField
      DisplayLabel = 'Мцддятляр цзря'
      FieldName = 'DATEOFCREDIT'
      Required = True
      Size = 25
    end
    object RestsSUMNAMOUNT: TFloatField
      DisplayLabel = 'Милли валйутада мябляь'
      FieldName = 'SUM(NAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object RestsSUMNAVGINTAMOUNT: TFloatField
      DisplayLabel = 'Милли валйутада орта%'
      FieldName = 'SUM(NAVGINTAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object RestsSUMFAMOUNT: TFloatField
      DisplayLabel = 'СДВ валйутда  мябляь'
      FieldName = 'SUM(FAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object RestsSUMFAVGINTAMOUNT: TFloatField
      DisplayLabel = 'СДВ валйутда орта%'
      FieldName = 'SUM(FAVGINTAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object RestsSUMFNAMOUNT: TFloatField
      DisplayLabel = 'ГДВ валйутда  мябляь'
      FieldName = 'SUM(FNAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object RestsSUMFNAVGINTAMOUNT: TFloatField
      DisplayLabel = 'ГДВ валйутда  орта%'
      FieldName = 'SUM(FNAVGINTAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
  end
  object CM_SD: TOraclePackage
    Session = CMDataModule.CMSession
    Debug = False
    PackageName = 'CM_SD'
    ParameterMode = pmNamed
    Cursor = crSQLWait
    Optimize = True
    Left = 216
    Top = 16
  end
  object CrdInfo: TOracleDataSet
    SQL.Strings = (
      '')
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
    Left = 152
    Top = 16
  end
  object Tranches: TOracleDataSet
    SQL.Strings = (
      'SELECT id,'
      '       dateofcredit, '
      '       sum(namount), '
      '       sum(navgintamount), '
      '       sum(famount), '
      '       sum(favgintamount),'
      '       sum(fnamount), '
      '       sum(fnavgintamount)'
      '  FROM cm_tranches_sd'
      'group by id , dateofcredit'
      ''
      '')
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
    Top = 72
    object TranchesID: TFloatField
      FieldName = 'ID'
    end
    object TranchesDATEOFCREDIT: TStringField
      DisplayLabel = 'Мцддятляр цзря'
      FieldName = 'DATEOFCREDIT'
      Required = True
      Size = 25
    end
    object TranchesSUMNAMOUNT: TFloatField
      DisplayLabel = 'Милли валйутада мябляь'
      FieldName = 'SUM(NAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object TranchesSUMNAVGINTAMOUNT: TFloatField
      DisplayLabel = 'Милли валйутада орта%'
      FieldName = 'SUM(NAVGINTAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object TranchesSUMFAMOUNT: TFloatField
      DisplayLabel = 'СДВ валйутда  мябляь'
      FieldName = 'SUM(FAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object TranchesSUMFAVGINTAMOUNT: TFloatField
      DisplayLabel = 'СДВ валйутда орта%'
      FieldName = 'SUM(FAVGINTAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object TranchesSUMFNAMOUNT: TFloatField
      DisplayLabel = 'ГДВ валйутда  мябляь'
      FieldName = 'SUM(FNAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object TranchesSUMFNAVGINTAMOUNT: TFloatField
      DisplayLabel = 'ГДВ валйутда  орта%'
      FieldName = 'SUM(FNAVGINTAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
  end
  object payments: TOracleDataSet
    SQL.Strings = (
      'SELECT id,'
      '       dateofcredit, '
      '       sum(namount), '
      '       sum(navgintamount), '
      '       sum(famount), '
      '       sum(favgintamount),'
      '       sum(fnamount), '
      '       sum(fnavgintamount)'
      '  FROM cm_payments_sd'
      'group by id , dateofcredit'
      '')
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
    Left = 88
    Top = 16
    object paymentsID: TFloatField
      FieldName = 'ID'
    end
    object paymentsDATEOFCREDIT: TStringField
      DisplayLabel = 'Мцддятляр цзря'
      FieldName = 'DATEOFCREDIT'
      Required = True
      Size = 25
    end
    object paymentsSUMNAMOUNT: TFloatField
      DisplayLabel = 'Милли валйутада мябляь'
      FieldName = 'SUM(NAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object paymentsSUMNAVGINTAMOUNT: TFloatField
      DisplayLabel = 'Милли валйутада орта%'
      FieldName = 'SUM(NAVGINTAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object paymentsSUMFAMOUNT: TFloatField
      DisplayLabel = 'СДВ валйутда орта%'
      FieldName = 'SUM(FAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object paymentsSUMFAVGINTAMOUNT: TFloatField
      DisplayLabel = 'ГДВ валйутда  мябляь'
      FieldName = 'SUM(FAVGINTAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object paymentsSUMFNAMOUNT: TFloatField
      DisplayLabel = 'ГДВ валйутда  мябляь'
      FieldName = 'SUM(FNAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object paymentsSUMFNAVGINTAMOUNT: TFloatField
      DisplayLabel = 'ГДВ валйутда  орта%'
      FieldName = 'SUM(FNAVGINTAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
  end
  object Obligations: TOracleDataSet
    SQL.Strings = (
      'SELECT id,'
      '       dateofcredit, '
      '       sum(namount), '
      '       sum(navgintamount), '
      '       sum(famount), '
      '       sum(favgintamount),'
      '       sum(fnamount), '
      '       sum(fnavgintamount)'
      '  FROM cm_obligations_sd'
      'group by id , dateofcredit'
      '')
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
    Left = 88
    Top = 72
    object ObligationsID: TFloatField
      FieldName = 'ID'
    end
    object ObligationsDATEOFCREDIT: TStringField
      DisplayLabel = 'Мцддятляр цзря'
      FieldName = 'DATEOFCREDIT'
      Required = True
      Size = 25
    end
    object ObligationsSUMNAMOUNT: TFloatField
      DisplayLabel = 'Милли валйутада мябляь'
      FieldName = 'SUM(NAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object ObligationsSUMNAVGINTAMOUNT: TFloatField
      DisplayLabel = 'Милли валйутада орта%'
      FieldName = 'SUM(NAVGINTAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object ObligationsSUMFAMOUNT: TFloatField
      DisplayLabel = 'СДВ валйутда  мябляь'
      FieldName = 'SUM(FAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object ObligationsSUMFAVGINTAMOUNT: TFloatField
      DisplayLabel = 'СДВ валйутда орта%'
      FieldName = 'SUM(FAVGINTAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object ObligationsSUMFNAMOUNT: TFloatField
      DisplayLabel = 'ГДВ валйутда  мябляь'
      FieldName = 'SUM(FNAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object ObligationsSUMFNAVGINTAMOUNT: TFloatField
      DisplayLabel = 'ГДВ валйутда  орта%'
      FieldName = 'SUM(FNAVGINTAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
  end
  object DueRests: TOracleDataSet
    SQL.Strings = (
      'SELECT id,'
      '       dateofcredit, '
      '       sum(namount), '
      '       sum(navgintamount), '
      '       sum(famount), '
      '       sum(favgintamount),'
      '       sum(fnamount), '
      '       sum(fnavgintamount)'
      '  FROM cm_duerests_sd'
      'group by id , dateofcredit'
      '')
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
    Left = 152
    Top = 72
    object DueRestsID: TFloatField
      FieldName = 'ID'
    end
    object DueRestsDATEOFCREDIT: TStringField
      DisplayLabel = 'Мцддятляр цзря'
      FieldName = 'DATEOFCREDIT'
      Required = True
      Size = 25
    end
    object DueRestsSUMNAMOUNT: TFloatField
      DisplayLabel = 'Милли валйутада мябляь'
      FieldName = 'SUM(NAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object DueRestsSUMNAVGINTAMOUNT: TFloatField
      DisplayLabel = 'Милли валйутада орта%'
      FieldName = 'SUM(NAVGINTAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object DueRestsSUMFAMOUNT: TFloatField
      DisplayLabel = 'СДВ валйутда  мябляь'
      FieldName = 'SUM(FAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object DueRestsSUMFAVGINTAMOUNT: TFloatField
      DisplayLabel = 'СДВ валйутда орта%'
      FieldName = 'SUM(FAVGINTAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object DueRestsSUMFNAMOUNT: TFloatField
      DisplayLabel = 'ГДВ валйутда  мябляь'
      FieldName = 'SUM(FNAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object DueRestsSUMFNAVGINTAMOUNT: TFloatField
      DisplayLabel = 'ГДВ валйутда  орта%'
      FieldName = 'SUM(FNAVGINTAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
  end
  object Filial: TOracleDataSet
    SQL.Strings = (
      'select id,name from sb_filial')
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
    Left = 216
    Top = 72
  end
  object FilialDatSrc: TDataSource
    DataSet = Filial
    Left = 288
    Top = 16
  end
  object DataSetSD: TOracleDataSet
    SQL.Strings = (
      'select 1 ,'
      '       '#39'Щесабат дюврцнцн яввялиня кредитляр - жями'#39' ,'
      '       sum(namount), '
      '       sum(navgintamount)/cm_sd.get_divzero(sum(namount)), '
      '       sum(famount), '
      '       sum(favgintamount)/cm_sd.get_divzero(sum(famount)),'
      '       sum(fnamount), '
      '       sum(fnavgintamount)/cm_sd.get_divzero(sum(fnamount))'
      '  FROM cm_rests_sd'
      ' '
      ''
      'union all'
      ''
      'SELECT id,'
      '       dateofcredit, '
      '       sum(namount), '
      '       sum(navgintamount)/cm_sd.get_divzero(sum(namount)), '
      '       sum(famount), '
      '       sum(favgintamount)/cm_sd.get_divzero(sum(famount)),'
      '       sum(fnamount), '
      '       sum(fnavgintamount)/cm_sd.get_divzero(sum(fnamount))'
      '  FROM cm_rests_sd'
      'group by id , dateofcredit'
      ''
      'union all'
      ''
      'select 2,'
      '       '#39'Щесабат дюврц ярзиндя верилмиш кредитляр - жями'#39' ,'
      '       sum(namount), '
      '       sum(navgintamount)/cm_sd.get_divzero(sum(namount)), '
      '       sum(famount), '
      '       sum(favgintamount)/cm_sd.get_divzero(sum(famount)),'
      '       sum(fnamount), '
      '       sum(fnavgintamount)/cm_sd.get_divzero(sum(fnamount))'
      '  FROM cm_tranches_sd'
      ' '
      ''
      ''
      'union all '
      ''
      'SELECT id,'
      '       dateofcredit, '
      '       sum(namount), '
      '       sum(navgintamount)/cm_sd.get_divzero(sum(namount)), '
      '       sum(famount), '
      '       sum(favgintamount)/cm_sd.get_divzero(sum(famount)),'
      '       sum(fnamount), '
      '       sum(fnavgintamount)/cm_sd.get_divzero(sum(fnamount))'
      '  FROM cm_tranches_sd'
      'group by id , dateofcredit'
      ''
      'union all'
      'select 3,'
      '       '#39'Щесабат дюврц ярзиндя юдянилмиш кредитляр - жями'#39' ,'
      '       sum(namount), '
      '       sum(navgintamount)/cm_sd.get_divzero(sum(namount)), '
      '       sum(famount), '
      '       sum(favgintamount)/cm_sd.get_divzero(sum(famount)),'
      '       sum(fnamount), '
      '       sum(fnavgintamount)/cm_sd.get_divzero(sum(fnamount))'
      '  FROM cm_payments_sd'
      '  '
      'union all'
      ''
      'SELECT id,'
      '       dateofcredit, '
      '       sum(namount), '
      '       sum(navgintamount)/cm_sd.get_divzero(sum(namount)), '
      '       sum(famount), '
      '       sum(favgintamount)/cm_sd.get_divzero(sum(famount)),'
      '       sum(fnamount), '
      '       sum(fnavgintamount)/cm_sd.get_divzero(sum(fnamount))'
      '  FROM cm_payments_sd'
      'group by id , dateofcredit'
      ''
      'union all'
      'select 4,'
      '       '#39'Щесабат дюврцнцн сонуна кредитляр - жями'#39' ,'
      '       sum(namount), '
      '       sum(navgintamount)/cm_sd.get_divzero(sum(namount)), '
      '       sum(famount), '
      '       sum(favgintamount)/cm_sd.get_divzero(sum(famount)),'
      '       sum(fnamount), '
      '       sum(fnavgintamount)/cm_sd.get_divzero(sum(fnamount))'
      '  FROM cm_obligations_sd'
      ' '
      ''
      'union all '
      ''
      'SELECT id,'
      '       dateofcredit, '
      '       sum(namount), '
      '       sum(navgintamount)/cm_sd.get_divzero(sum(namount)), '
      '       sum(famount), '
      '       sum(favgintamount)/cm_sd.get_divzero(sum(famount)),'
      '       sum(fnamount), '
      '       sum(fnavgintamount)/cm_sd.get_divzero(sum(fnamount))'
      '  FROM cm_obligations_sd'
      'group by id , dateofcredit'
      ''
      'union all'
      'select 5,'
      '       '#39'Щесабат дюврц ярзиндя Ь.Баид едилян кредитляр - жями'#39' ,'
      '       sum(namount), '
      '       sum(navgintamount)/cm_sd.get_divzero(sum(namount)), '
      '       sum(famount), '
      '       sum(favgintamount)/cm_sd.get_divzero(sum(famount)),'
      '       sum(fnamount), '
      '       sum(fnavgintamount)/cm_sd.get_divzero(sum(fnamount))'
      '  FROM cm_duerests_sd'
      '  '
      ''
      'union all'
      ''
      'SELECT id,'
      '       dateofcredit, '
      '       sum(namount), '
      '       sum(navgintamount)/cm_sd.get_divzero(sum(namount)), '
      '       sum(famount), '
      '       sum(favgintamount)/cm_sd.get_divzero(sum(famount)),'
      '       sum(fnamount), '
      '       sum(fnavgintamount)/cm_sd.get_divzero(sum(fnamount))'
      '  FROM cm_duerests_sd'
      'group by id , dateofcredit'
      ''
      ''
      '')
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
    Left = 288
    Top = 72
    object DataSetSDDSDesigner1: TFloatField
      FieldName = '1'
    end
    object DataSetSDYYY: TStringField
      DisplayLabel = 'Мцддятляр цзря'
      FieldName = #39'ЩЕСАБАТДЮВРЦНЦНYВВYЛИНYКРЕДИТ'
      Size = 79
    end
    object DataSetSDSUMNAMOUNT: TFloatField
      DisplayLabel = 'Милли валйутада мябляь'
      FieldName = 'SUM(NAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object DataSetSDSUMNAVGINTAMOUNTCM_SDGET_D: TFloatField
      DisplayLabel = 'Милли валйутада орта%'
      FieldName = 'SUM(NAVGINTAMOUNT)/CM_SD.GET_D'
      DisplayFormat = '#,#0.00'
    end
    object DataSetSDSUMFAMOUNT: TFloatField
      DisplayLabel = 'СДВ валйутда  мябляь'
      FieldName = 'SUM(FAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object DataSetSDSUMFAVGINTAMOUNTCM_SDGET_D: TFloatField
      DisplayLabel = 'СДВ валйутда орта%'
      FieldName = 'SUM(FAVGINTAMOUNT)/CM_SD.GET_D'
      DisplayFormat = '#,#0.00'
    end
    object DataSetSDSUMFNAMOUNT: TFloatField
      DisplayLabel = 'ГДВ валйутда  мябляь'
      FieldName = 'SUM(FNAMOUNT)'
      DisplayFormat = '#,#0.00'
    end
    object DataSetSDSUMFNAVGINTAMOUNTCM_SDGET_: TFloatField
      DisplayLabel = 'ГДВ валйутда  орта%'
      FieldName = 'SUM(FNAVGINTAMOUNT)/CM_SD.GET_'
      DisplayFormat = '#,#0.00'
    end
  end
end
