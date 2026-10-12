object ScheduleDataModule: TScheduleDataModule
  OldCreateOrder = False
  Left = 232
  Top = 181
  Height = 480
  Width = 696
  object DataSrcScheduleData: TDataSource
    DataSet = ScheduleData
    Left = 64
    Top = 32
  end
  object ScheduleData: TOracleDataSet
    SQL.Strings = (
      'SELECT Z.RowID,Z.*'
      '  FROM CM_PAYMENTSCHEDULE Z'
      'WHERE Z.CREDITID=:CREDITID'
      'ORDER BY PAYMENTDATE')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000090000003A43524544495449440300000000000000000000
      00}
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
    AutoCalcFields = False
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    OnApplyRecord = ScheduleDataApplyRecord
    CommitOnPost = False
    CachedUpdates = True
    QBEMode = False
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    OnCalcFields = ScheduleDataCalcFields
    Left = 64
    Top = 80
    object ScheduleDataSeqNo: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'SeqNo'
      OnGetText = ScheduleDataSeqNoGetText
      Calculated = True
    end
    object ScheduleDataID: TFloatField
      FieldName = 'ID'
    end
    object ScheduleDataCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object ScheduleDataPAYMENTDATE: TDateTimeField
      DisplayLabel = '“арих'
      FieldName = 'PAYMENTDATE'
      Required = True
    end
    object ScheduleDataREST: TFloatField
      FieldName = 'REST'
      DisplayFormat = '#,##0.00'
    end
    object ScheduleDataPRINCIPAL: TFloatField
      DisplayLabel = 'ясас борждан'
      FieldName = 'PRINCIPAL'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object ScheduleDataINTEREST: TFloatField
      DisplayLabel = 'ўесабланмыш фаизд€н'
      FieldName = 'INTEREST'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object ScheduleDataTOTALPAY: TFloatField
      DisplayLabel = '∆€ми'
      FieldKind = fkCalculated
      FieldName = 'TOTALPAY'
      DisplayFormat = '#,#0.00'
      Calculated = True
    end
  end
  object BoorowerInfo: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   bi.NAME,'
      '   cm_common.AccountNumber_Get(a.booroweraccid) as custaccno,'
      '   cm_common.AccountNumber_Get(a.Loanaccid) as loanaccno ,'
      
        '   cm_common.accountrest_get(a.booroweraccid) as booroweraccrest' +
        ','
      '   a.booroweraccid'
      'FROM'
      '  CM_BOOROWERINFO bi, cm_accounts a'
      'WHERE bi.CreditID=:CREDITID'
      'and a.creditid = :CREDITID')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000090000003A43524544495449440300000000000000000000
      00}
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
    Left = 64
    Top = 192
    object BoorowerInfoNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object BoorowerInfoCUSTACCNO: TStringField
      FieldName = 'CUSTACCNO'
      Size = 4000
    end
    object BoorowerInfoLOANACCNO: TStringField
      FieldName = 'LOANACCNO'
      Size = 4000
    end
    object BoorowerInfoBOOROWERACCREST: TFloatField
      FieldName = 'BOOROWERACCREST'
    end
    object BoorowerInfoBOOROWERACCID: TFloatField
      FieldName = 'BOOROWERACCID'
    end
  end
  object DSBoorowerInfo: TDataSource
    DataSet = BoorowerInfo
    Left = 184
    Top = 184
  end
  object CreditInfo: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      
        '   A.ID , A.CURRENCY , A.CREDITLINEAMOUNT , A.ANNUALYINTERESTRAT' +
        'E , A.DATEOFCONCLUSION'
      ' , A.DUEDATEFIRSTCONTRACT , '
      '   A.CREDITTYPE,'
      
        '   TRUNC (MONTHS_BETWEEN (A.DUEDATEFIRSTCONTRACT ,A.DATEOFCONCLU' +
        'SION)) as period,'
      '   c.rest'
      'FROM'
      '   CM_ACTIVE_CREDITS A,'
      '   cm_curr_state c'
      'WHERE a.ID=:ID'
      'and c.creditid = :ID')
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
    Left = 184
    Top = 80
    object FloatField1: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FloatField2: TFloatField
      FieldName = 'CURRENCY'
      Required = True
    end
    object FloatField3: TFloatField
      FieldName = 'CREDITLINEAMOUNT'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object FloatField4: TFloatField
      FieldName = 'ANNUALYINTERESTRATE'
      Required = True
      DisplayFormat = '#,#0.0000'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DUEDATEFIRSTCONTRACT'
      Required = True
    end
    object FloatField5: TFloatField
      FieldName = 'CREDITTYPE'
      Required = True
    end
    object CreditInfoPERIOD: TFloatField
      FieldName = 'PERIOD'
    end
    object CreditInfoREST: TFloatField
      FieldName = 'REST'
      Required = True
    end
  end
  object DataSrcCreditInfo: TDataSource
    DataSet = CreditInfo
    Left = 184
    Top = 32
  end
  object CM_SCHEDULE: TOraclePackage
    Session = CMDataModule.CMSession
    Debug = False
    PackageName = 'CM_SCHEDULE'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Optimize = True
    Left = 184
    Top = 136
  end
  object ExportData: TOracleDataSet
    SQL.Strings = (
      'SELECT  paymentdate, principal, interest,rest'
      '  FROM cm_paymentschedule'
      'where Creditid=:CREDITID'
      'ORDER BY PAYMENTDATE')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000090000003A43524544495449440300000000000000000000
      00}
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
    Left = 64
    Top = 144
    object ExportDataPAYMENTDATE: TDateTimeField
      DisplayLabel = '“арих'
      FieldName = 'PAYMENTDATE'
      Required = True
    end
    object ExportDataREST: TFloatField
      DisplayLabel = '√алыг'
      FieldName = 'REST'
    end
    object ExportDataPRINCIPAL: TFloatField
      DisplayLabel = 'ясас ћ€бл€ь'
      FieldName = 'PRINCIPAL'
      Required = True
    end
    object ExportDataINTEREST: TFloatField
      DisplayLabel = '‘аиз'
      FieldName = 'INTEREST'
      Required = True
    end
  end
  object BankInfo: TOracleDataSet
    SQL.Strings = (
      'select BANK,logo from smart.bankinfo')
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
    Left = 304
    Top = 40
    object BankInfoLOGO: TBlobField
      FieldName = 'LOGO'
      BlobType = ftBlob
    end
    object BankInfoBANK: TStringField
      FieldName = 'BANK'
      Size = 80
    end
  end
end
