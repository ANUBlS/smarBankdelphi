object ScheduleDataModule: TScheduleDataModule
  OldCreateOrder = False
  Left = 70
  Top = 188
  Height = 479
  Width = 741
  object DataSrcScheduleData: TDataSource
    DataSet = ScheduleData
    Left = 64
    Top = 32
  end
  object ScheduleData: TOracleDataSet
    SQL.Strings = (
      'SELECT Z.RowID,Z.*'
      '  FROM CM_PAYMENT_SCHEDULE Z'
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
    Cursor = crDefault
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
      DisplayLabel = 'Тарих'
      FieldName = 'PAYMENTDATE'
      Required = True
    end
    object ScheduleDataPRINCIPAL: TFloatField
      DisplayLabel = 'Ясас борждан'
      FieldName = 'PRINCIPAL'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object ScheduleDataINTEREST: TFloatField
      DisplayLabel = 'Щесабланмыш фаиздян'
      FieldName = 'INTEREST'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object ScheduleDataTOTALPAY: TFloatField
      DisplayLabel = 'Жями'
      FieldKind = fkCalculated
      FieldName = 'TOTALPAY'
      DisplayFormat = '#,#0.00'
      Calculated = True
    end
    object ScheduleDataTOTALPAYIP: TFloatField
      DisplayLabel = 'Жями'
      FieldKind = fkCalculated
      FieldName = 'TOTALPAYIP'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object ScheduleDataIPINTEREST: TFloatField
      FieldName = 'IPINTEREST'
      DisplayFormat = '#,##0.00'
    end
  end
  object BoorowerInfo: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   NAME'
      'FROM'
      '  CM_BOOROWERINFO'
      'WHERE CreditID=:CREDITID')
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
    Top = 192
    object BoorowerInfoNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
  end
  object DSBoorowerInfo: TDataSource
    DataSet = BoorowerInfo
    Left = 64
    Top = 136
  end
  object CreditInfo: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      
        '   A.ID , A.CURRENCY , A.CREDITLINEAMOUNT , A.ANNUALYINTERESTRAT' +
        'E,a.ANNUALBANKRATE , A.DATEOFCONCLUSION'
      ' , A.DUEDATEFIRSTCONTRACT , A.CREDITTYPE,A.newfinanceamount,'
      '  c.rest'
      'FROM'
      '   CM_ACTIVE_CREDITS A,'
      '   cm_curr_state c'
      'WHERE ID=:ID'
      'and a.id =c.creditid')
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
    object CreditInfoANNUALBANKRATE: TFloatField
      FieldName = 'ANNUALBANKRATE'
      DisplayFormat = '#,#0.0000'
    end
    object CreditInfoNEWFINANCEAMOUNT: TFloatField
      FieldName = 'NEWFINANCEAMOUNT'
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
    PackageName = 'CM_IP_SCHEDULE'
    ParameterMode = pmNamed
    Cursor = crDefault
    Optimize = True
    Left = 176
    Top = 256
  end
  object Exportdata: TOracleDataSet
    SQL.Strings = (
      'select paymentdate, principal, interest, ipinterest'
      '  FROM cm_payment_schedule'
      'where creditid=:crdid'
      'order by paymentdate')
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
    Active = False
    OnCalcFields = ExportdataCalcFields
    Left = 56
    Top = 248
    object ExportdataPAYMENTDATE: TDateTimeField
      DisplayLabel = 'Тарих'
      FieldName = 'PAYMENTDATE'
      Required = True
    end
    object ExportdataPRINCIPAL: TFloatField
      DisplayLabel = 'Ясас борждан'
      FieldName = 'PRINCIPAL'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object ExportdataINTEREST: TFloatField
      DisplayLabel = 'Щесабланмыш фаиздян'
      FieldName = 'INTEREST'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object ExportdataIPINTEREST: TFloatField
      DisplayLabel = 'ИП. Щесабланмыш фаиздян'
      FieldName = 'IPINTEREST'
      DisplayFormat = '#,##0.00'
    end
    object ExportdataTotal: TFloatField
      DisplayLabel = 'Жями'
      FieldKind = fkCalculated
      FieldName = 'Total'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
  end
  object IPInfo: TOracleDataSet
    SQL.Strings = (
      'SELECT  bankopendate, bankclosedate'
      '  FROM cm_ip_info'
      'where creditid =:CrdID')
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
    Active = False
    Left = 184
    Top = 192
    object IPInfoBANKOPENDATE: TDateTimeField
      FieldName = 'BANKOPENDATE'
    end
    object IPInfoBANKCLOSEDATE: TDateTimeField
      FieldName = 'BANKCLOSEDATE'
    end
  end
  object IPInfoDatSrc: TDataSource
    DataSet = IPInfo
    Left = 184
    Top = 136
  end
end
