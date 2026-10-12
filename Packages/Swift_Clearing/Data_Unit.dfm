object DataMod: TDataMod
  OldCreateOrder = False
  Left = 230
  Top = 100
  Height = 480
  Width = 696
  object Account_data: TOracleDataSet
    SQL.Strings = (
      'select'
      'a.id,a.acc_no,a.name,a.val_acc,c.inn,ac.pok_ostat,ac.ostat'
      'from'
      'account a,customers c,archost ac'
      'where'
      '(a.kli_ID=c.id)and(a.id=ac.acc_id)and(ac.datdate=sbop.get_date)'
      ' ')
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
    Left = 24
    Top = 8
  end
  object Account_Source: TDataSource
    DataSet = Account_data
    Left = 104
    Top = 8
  end
  object DataSet_View: TOracleDataSet
    SQL.Strings = (
      'select * from account')
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
    Left = 24
    Top = 72
  end
  object DataSource_View: TDataSource
    DataSet = Account_data
    Left = 104
    Top = 72
  end
  object DataSource_BankInfo: TDataSource
    DataSet = Account_data
    Left = 104
    Top = 136
  end
  object BankInfo: TOracleDataSet
    SQL.Strings = (
      'select * from bankinfo')
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
    Left = 16
    Top = 136
    object BankInfoKOD_B: TFloatField
      FieldName = 'KOD_B'
    end
    object BankInfoBANK: TStringField
      FieldName = 'BANK'
      Size = 80
    end
    object BankInfoAZ_NAME: TStringField
      FieldName = 'AZ_NAME'
      Size = 80
    end
    object BankInfoKRNO: TFloatField
      FieldName = 'KRNO'
    end
    object BankInfoINN: TStringField
      FieldName = 'INN'
      Size = 15
    end
    object BankInfoSEHER: TStringField
      FieldName = 'SEHER'
    end
    object BankInfoADRESS: TStringField
      FieldName = 'ADRESS'
      Size = 50
    end
    object BankInfoSEDR: TStringField
      FieldName = 'SEDR'
    end
    object BankInfoBUHALTR: TStringField
      FieldName = 'BUHALTR'
    end
    object BankInfoTEL: TStringField
      FieldName = 'TEL'
    end
    object BankInfoFAX: TStringField
      FieldName = 'FAX'
    end
    object BankInfoSWIFT: TStringField
      FieldName = 'SWIFT'
    end
    object BankInfoTELEX: TStringField
      FieldName = 'TELEX'
    end
    object BankInfoEMAIL: TStringField
      FieldName = 'EMAIL'
    end
    object BankInfoPOST_IN: TStringField
      FieldName = 'POST_IN'
    end
    object BankInfoKOD_FIL: TIntegerField
      FieldName = 'KOD_FIL'
    end
    object BankInfoFILIAL: TStringField
      FieldName = 'FILIAL'
      Size = 80
    end
    object BankInfoADRES_FIL: TStringField
      FieldName = 'ADRES_FIL'
      Size = 50
    end
    object BankInfoTEL_FIL: TStringField
      FieldName = 'TEL_FIL'
    end
    object BankInfoFAX_FIL: TStringField
      FieldName = 'FAX_FIL'
    end
    object BankInfoSWIFT_FIL: TStringField
      FieldName = 'SWIFT_FIL'
    end
    object BankInfoTELEX_FIL: TStringField
      FieldName = 'TELEX_FIL'
    end
    object BankInfoPOSTIN_FIL: TStringField
      FieldName = 'POSTIN_FIL'
    end
    object BankInfoSEHER_FIL: TStringField
      FieldName = 'SEHER_FIL'
    end
    object BankInfoINN_FIL: TStringField
      FieldName = 'INN_FIL'
      Size = 15
    end
    object BankInfoKRNO_FIL: TFloatField
      FieldName = 'KRNO_FIL'
    end
    object BankInfoSEDRFIL: TStringField
      FieldName = 'SEDRFIL'
    end
    object BankInfoBUHAL_FIL: TStringField
      FieldName = 'BUHAL_FIL'
    end
    object BankInfoKOD_BFIL: TFloatField
      FieldName = 'KOD_BFIL'
    end
    object BankInfoNB: TIntegerField
      FieldName = 'NB'
    end
    object BankInfoVAL_MOV: TFloatField
      FieldName = 'VAL_MOV'
    end
    object BankInfoLOGO: TBlobField
      FieldName = 'LOGO'
      BlobType = ftBlob
    end
    object BankInfoLINK: TStringField
      FieldName = 'LINK'
      Size = 220
    end
    object BankInfoSDV: TFloatField
      FieldName = 'SDV'
    end
    object BankInfoSVM: TFloatField
      FieldName = 'SVM'
    end
    object BankInfoBF: TFloatField
      FieldName = 'BF'
    end
  end
  object BankM: TOracleDataSet
    SQL.Strings = (
      'select * from bankm')
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
    Left = 16
    Top = 192
  end
  object BankM_DataSource: TDataSource
    DataSet = Account_data
    Left = 104
    Top = 200
  end
  object AValute: TOracleDataSet
    SQL.Strings = (
      'select * from Avalute')
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
    Left = 224
    Top = 240
  end
  object TransTypeCode: TOracleDataSet
    SQL.Strings = (
      'select * from hoxtranstype_code')
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
    Left = 24
    Top = 328
  end
  object Hox102_out: TOracleDataSet
    SQL.Strings = (
      'select'
      '  h.*,a.acc_no,a.name,v.val_name,h.amount/k.ostat as lamount'
      'from'
      '  hox102_out h,account a,avalute v,operkurs k'
      'where'
      '  h.acc_id = a.id and'
      '  v.valute=a.val_acc and'
      ' (transdate>=:BeginDate and'
      '  transdate<=:EndDate)AND'
      ' ((a.val_acc=k.val_kod)and(k.dat=h.transdate)) '
      ' order by'
      '  h.id,h.status desc'
      ' '
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000020000000A0000003A424547494E444154450C000000000000000000
      0000080000003A454E44444154450C0000000000000000000000}
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
    AfterScroll = Hox102_outAfterScroll
    Left = 200
    Top = 8
    object Hox102_outID: TFloatField
      FieldName = 'ID'
    end
    object Hox102_outF_ID: TFloatField
      FieldName = 'F_ID'
    end
    object Hox102_outOPERCODE: TStringField
      FieldName = 'OPERCODE'
      Size = 6
    end
    object Hox102_outACC_ID: TFloatField
      FieldName = 'ACC_ID'
    end
    object Hox102_outCLIENT_NAME: TStringField
      FieldName = 'CLIENT_NAME'
      Size = 70
    end
    object Hox102_outCLIENT_CODE: TStringField
      FieldName = 'CLIENT_CODE'
      Size = 70
    end
    object Hox102_outTRANS_REF: TStringField
      FieldName = 'TRANS_REF'
      Size = 16
    end
    object Hox102_outAMOUNT: TFloatField
      FieldName = 'AMOUNT'
      currency = True
    end
    object Hox102_outVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object Hox102_outTRANSDATE: TDateTimeField
      FieldName = 'TRANSDATE'
    end
    object Hox102_outSEND: TIntegerField
      FieldName = 'SEND'
    end
    object Hox102_outSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object Hox102_outACC_NO: TStringField
      FieldName = 'ACC_NO'
    end
    object Hox102_outNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object Hox102_outVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object Hox102_outLAMOUNT: TFloatField
      FieldName = 'LAMOUNT'
      currency = True
    end
  end
  object Hox102_DataSource: TDataSource
    DataSet = Hox102_out
    Left = 304
    Top = 8
  end
  object Ins: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'HOXPACK'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 432
    Top = 344
  end
  object ForCHECK: TOracleDataSet
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
    Left = 224
    Top = 344
  end
  object HoxMessages_out: TOracleDataSet
    SQL.Strings = (
      'select m.*, v.val_name'
      '                           from '
      'hoxMessage_out m, avalute v'
      '                         where '
      '           (m.mt102_id=:id)and'
      '           (m.val_cod=v.valute)')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000030000003A494405000000040000003232390000000000}
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
    Master = Hox102_out
    MasterFields = 'ID'
    DetailFields = 'ID'
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
    AfterScroll = HoxMessages_outAfterScroll
    Left = 32
    Top = 256
    object HoxMessages_outID: TFloatField
      FieldName = 'ID'
    end
    object HoxMessages_outMT102_ID: TFloatField
      FieldName = 'MT102_ID'
    end
    object HoxMessages_outREC_BANK_ID: TFloatField
      FieldName = 'REC_BANK_ID'
    end
    object HoxMessages_outREC_BANK_SUB_ACC: TFloatField
      FieldName = 'REC_BANK_SUB_ACC'
    end
    object HoxMessages_outCLIENT_ACC_NO: TStringField
      FieldName = 'CLIENT_ACC_NO'
      Size = 34
    end
    object HoxMessages_outCLIENT_NAME: TStringField
      FieldName = 'CLIENT_NAME'
      Size = 70
    end
    object HoxMessages_outCLIENT_CODE: TStringField
      FieldName = 'CLIENT_CODE'
      Size = 70
    end
    object HoxMessages_outCLIENT_INN: TFloatField
      FieldName = 'CLIENT_INN'
    end
    object HoxMessages_outREMIT_INF: TStringField
      FieldName = 'REMIT_INF'
      Size = 140
    end
    object HoxMessages_outTRANS_COD: TIntegerField
      FieldName = 'TRANS_COD'
    end
    object HoxMessages_outADD_INF: TStringField
      FieldName = 'ADD_INF'
      Size = 105
    end
    object HoxMessages_outVAL_DATE: TDateTimeField
      FieldName = 'VAL_DATE'
    end
    object HoxMessages_outVAL_COD: TIntegerField
      FieldName = 'VAL_COD'
    end
    object HoxMessages_outMESS_REFERENCE: TStringField
      FieldName = 'MESS_REFERENCE'
      Size = 16
    end
    object HoxMessages_outAMOUNT: TFloatField
      FieldName = 'AMOUNT'
      currency = True
    end
    object HoxMessages_outBNFCOUNT: TIntegerField
      FieldName = 'BNFCOUNT'
    end
    object HoxMessages_outSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object HoxMessages_outVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
  end
  object Mess_out_DataSource: TDataSource
    DataSet = HoxMessages_out
    Left = 120
    Top = 256
  end
  object DEL: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'HOXPACK'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 376
    Top = 328
  end
  object Reference: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'HOXPACK'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 368
    Top = 272
  end
  object HoxSw_Proper: TOracleDataSet
    SQL.Strings = (
      'select * from hoxSw_proper')
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
    Left = 200
    Top = 72
  end
  object TransCodeDataSource: TDataSource
    DataSet = TransTypeCode
    Left = 120
    Top = 320
  end
  object CHECK_Pack: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'HOXPACK'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 432
    Top = 272
  end
  object ForAll: TOracleDataSet
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
    Left = 224
    Top = 296
  end
  object HoxMessages_IN: TOracleDataSet
    SQL.Strings = (
      'select'
      '   hoxmessage_in.*,hoxmessage_in.rowid'
      'from'
      '   HoxMessage_in'
      ' ')
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
    Left = 344
    Top = 64
  end
  object HoxMessages_IN_view: TOracleDataSet
    SQL.Strings = (
      'select'
      '   h.*,v.val_name,b.name'
      'from'
      '   HoxMessage_in h,avalute v,bankm b'
      'where'
      '   (h.val_cod=v.valute)and(h.sen_bank_id=b.id) and'
      '   (trans_date>=:BeginDate and trans_date<=:EndDate)'
      'order by h.id'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000020000000A0000003A424547494E444154450C000000000000000000
      0000080000003A454E44444154450C0000000000000000000000}
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
    Left = 344
    Top = 176
    object HoxMessages_IN_viewID: TFloatField
      FieldName = 'ID'
    end
    object HoxMessages_IN_viewREFERENCE: TStringField
      FieldName = 'REFERENCE'
      Size = 16
    end
    object HoxMessages_IN_viewVAL_COD: TIntegerField
      FieldName = 'VAL_COD'
    end
    object HoxMessages_IN_viewAMOUNT: TFloatField
      FieldName = 'AMOUNT'
      currency = True
    end
    object HoxMessages_IN_viewSEN_ACC: TStringField
      FieldName = 'SEN_ACC'
      Size = 34
    end
    object HoxMessages_IN_viewSEN_NAME: TStringField
      FieldName = 'SEN_NAME'
      Size = 70
    end
    object HoxMessages_IN_viewSEN_INN: TFloatField
      FieldName = 'SEN_INN'
    end
    object HoxMessages_IN_viewSEN_BANK_ID: TFloatField
      FieldName = 'SEN_BANK_ID'
    end
    object HoxMessages_IN_viewSEN_BANK_SUBACC: TFloatField
      FieldName = 'SEN_BANK_SUBACC'
    end
    object HoxMessages_IN_viewREC_BANK_SUBACC: TFloatField
      FieldName = 'REC_BANK_SUBACC'
    end
    object HoxMessages_IN_viewREC_BANK_BIK: TStringField
      FieldName = 'REC_BANK_BIK'
      Size = 11
    end
    object HoxMessages_IN_viewREC_CLIENT_ACC: TStringField
      FieldName = 'REC_CLIENT_ACC'
      Size = 34
    end
    object HoxMessages_IN_viewREC_CLIENT_ACC_ID: TFloatField
      FieldName = 'REC_CLIENT_ACC_ID'
    end
    object HoxMessages_IN_viewREC_CLIENT_NAME: TStringField
      FieldName = 'REC_CLIENT_NAME'
      Size = 70
    end
    object HoxMessages_IN_viewREC_CLIENT_INN: TFloatField
      FieldName = 'REC_CLIENT_INN'
    end
    object HoxMessages_IN_viewREMIT_INF: TStringField
      FieldName = 'REMIT_INF'
      Size = 140
    end
    object HoxMessages_IN_viewTYPECODE: TIntegerField
      FieldName = 'TYPECODE'
    end
    object HoxMessages_IN_viewADD_INF: TStringField
      FieldName = 'ADD_INF'
      Size = 105
    end
    object HoxMessages_IN_viewTRANS_DATE: TDateTimeField
      FieldName = 'TRANS_DATE'
    end
    object HoxMessages_IN_viewSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object HoxMessages_IN_viewVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object HoxMessages_IN_viewNAME: TStringField
      FieldName = 'NAME'
      Size = 256
    end
  end
  object Message_in_DataSource: TDataSource
    DataSet = HoxMessages_IN_view
    Left = 336
    Top = 120
  end
  object GetSysDate: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBOP'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 320
    Top = 320
  end
end
