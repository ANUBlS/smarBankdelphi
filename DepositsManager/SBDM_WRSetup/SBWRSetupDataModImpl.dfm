object SBWRSetupDataMod: TSBWRSetupDataMod
  OldCreateOrder = False
  Left = 217
  Top = 201
  Height = 480
  Width = 696
  object SBWRTemplatesDSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT T.RowID , T.*'
      '  FROM SBCM_WR_TEMPLATES T')
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
    CountAllRecords = True
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Filtered = True
    Left = 48
    Top = 24
    object SBWRTemplatesDSetID: TFloatField
      FieldName = 'ID'
    end
    object SBWRTemplatesDSetNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 255
    end
    object SBWRTemplatesDSetPATH: TStringField
      FieldName = 'PATH'
      Size = 4000
    end
  end
  object SBWRTemplatesDSrc: TDataSource
    DataSet = SBWRTemplatesDSet
    Left = 48
    Top = 80
  end
  object SBCM_WR_TOOLS: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBCM_WR_TOOLS'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 48
    Top = 168
  end
  object SBWRBookmarksDSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT rowid,ID, TEMPLATEID, FIELDID, BOOKMARKNAME'
      '  FROM SBCM_WR_BOOKMARKS'
      'where templateid = :templateid')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000010000000B0000003A54454D504C4154454944040000000000000000
      000000}
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
    Master = SBWRTemplatesDSet
    MasterFields = 'ID'
    DetailFields = 'TEMPLATEID'
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = True
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Filtered = True
    Left = 168
    Top = 24
    object SBWRBookmarksDSetID: TFloatField
      FieldName = 'ID'
    end
    object SBWRBookmarksDSetTEMPLATEID: TFloatField
      FieldName = 'TEMPLATEID'
    end
    object SBWRBookmarksDSetFIELDID: TFloatField
      FieldName = 'FIELDID'
    end
    object SBWRBookmarksDSetBOOKMARKNAME: TStringField
      FieldName = 'BOOKMARKNAME'
      Size = 255
    end
  end
  object SBWRBookmarksDSrc: TDataSource
    DataSet = SBWRBookmarksDSet
    Left = 168
    Top = 80
  end
  object SBWRFieldsDSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT ID, FIELDNAME, DESCRIPTION'
      '  FROM SBCM_WR_FIELDS')
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
    Left = 280
    Top = 24
  end
  object SBWRFieldsDSrc: TDataSource
    DataSet = SBWRFieldsDSet
    Left = 280
    Top = 80
  end
  object OpenDlg: TOpenDialog
    Filter = 'Word Templates(*.dot)|*.dot'
    Left = 184
    Top = 168
  end
  object SBOracleDSetTamplates: TOracleDataSet
    SQL.Strings = (
      'SELECT T.*'
      '  FROM SBCM_WR_TEMPLATES T')
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
    Left = 408
    Top = 24
    object SBOracleDSetTamplatesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object SBOracleDSetTamplatesNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 255
    end
    object SBOracleDSetTamplatesPATH: TStringField
      FieldName = 'PATH'
      Size = 4000
    end
  end
  object SBDSourceTamplates: TDataSource
    DataSet = SBOracleDSetTamplates
    Left = 408
    Top = 88
  end
  object SBDMInfoDataSet: TOracleDataSet
    Tag = 2
    SQL.Strings = (
      
        'SELECT a.id, a.type#, a.opendate, a.closedate, a.amount, a.contr' +
        'actno,'
      
        '       a.contracttype, a.pledgetype, a.reliabilityid, a.clientty' +
        'pe,'
      
        '       a.pledgeprice, a.sid#, a.overduereliabilityid, a.branchid' +
        ','
      '       a.personaltype, a.currency'
      '  FROM sbcm_contracts a'
      ' where id = :conid')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000060000003A434F4E4944030000000000000000000000}
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
    Left = 48
    Top = 272
    object SBDMInfoDataSetCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object SBDMInfoDataSetBOOROWERID: TFloatField
      FieldName = 'BOOROWERID'
      Required = True
    end
    object SBDMInfoDataSetBOOROWERNAME: TStringField
      FieldName = 'BOOROWERNAME'
      Size = 90
    end
    object SBDMInfoDataSetDATEOFCONCLUSION: TDateTimeField
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object SBDMInfoDataSetCREDITLINEAMOUNT: TFloatField
      FieldName = 'CREDITLINEAMOUNT'
      Required = True
    end
    object SBDMInfoDataSetANNUALYINTERESTRATE: TFloatField
      FieldName = 'ANNUALYINTERESTRATE'
      Required = True
    end
    object SBDMInfoDataSetANNUALYOVERDUERATE: TFloatField
      FieldName = 'ANNUALYOVERDUERATE'
      Required = True
    end
    object SBDMInfoDataSetDUEDATEFIRSTCONTRACT: TDateTimeField
      FieldName = 'DUEDATEFIRSTCONTRACT'
      Required = True
    end
    object SBDMInfoDataSetNUMBEROFCREDIT: TStringField
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object SBDMInfoDataSetPERSONALTYPE: TStringField
      FieldName = 'PERSONALTYPE'
      Required = True
      Size = 32
    end
  end
  object SBDMInfoDataSrc: TDataSource
    DataSet = SBDMInfoDataSet
    Left = 48
    Top = 336
  end
  object SBReplaceDataSet: TOracleDataSet
    Tag = 2
    SQL.Strings = (
      'SELECT'
      '   B.TEMPLATEID , B.BOOKMARKNAME , A.FIELDNAME'
      'FROM'
      '   SMART.SBCM_WR_BOOKMARKS B'
      ' , SMART.SBCM_WR_FIELDS A'
      'WHERE'
      '     (B.FIELDID = A.ID)'
      '   AND templateid = :tid'
      '   AND bookmarkname = :bname')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A54494403000000000000000000000006000000
      3A424E414D45050000000000000000000000}
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
    Left = 216
    Top = 272
  end
end
