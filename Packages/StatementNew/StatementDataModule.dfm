object StatementDataModNew: TStatementDataModNew
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 319
  Top = 166
  Height = 500
  Width = 670
  object P_Extraction_OP: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'smart.p_statement'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 32
    Top = 16
  end
  object Extraction_ODSt: TOracleDataSet
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
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 128
    Top = 16
    object Extraction_ODStCUSTOMERNAME: TStringField
      FieldName = 'CUSTOMERNAME'
      Size = 90
    end
    object Extraction_ODStCUSTOMERID: TFloatField
      FieldName = 'CUSTOMERID'
    end
    object Extraction_ODStACCOUNTNAME: TStringField
      FieldName = 'ACCOUNTNAME'
      Size = 90
    end
    object Extraction_ODStACCOUNTNUMBER: TStringField
      FieldName = 'ACCOUNTNUMBER'
    end
    object Extraction_ODStACCOUNTID: TFloatField
      FieldName = 'ACCOUNTID'
      Required = True
    end
    object Extraction_ODStCURRENCYID: TIntegerField
      FieldName = 'CURRENCYID'
    end
    object Extraction_ODStCURRENCYNAME: TStringField
      FieldName = 'CURRENCYNAME'
      Size = 10
    end
    object Extraction_ODStBALANCECODE: TFloatField
      FieldName = 'BALANCECODE'
    end
    object Extraction_ODStCLOSE_DAT: TDateTimeField
      FieldName = 'CLOSE_DAT'
    end
    object Extraction_ODStLASTOPDATE: TDateTimeField
      FieldName = 'LASTOPDATE'
    end
    object Extraction_ODStDATDATE: TDateTimeField
      FieldName = 'DATDATE'
    end
    object Extraction_ODStOSTAT: TFloatField
      FieldName = 'OSTAT'
    end
    object Extraction_ODStPOK_OSTAT: TFloatField
      FieldName = 'POK_OSTAT'
    end
    object Extraction_ODStOBR_D: TFloatField
      FieldName = 'OBR_D'
    end
    object Extraction_ODStOBR_K: TFloatField
      FieldName = 'OBR_K'
    end
    object Extraction_ODStPOK_OBR_D: TFloatField
      FieldName = 'POK_OBR_D'
    end
    object Extraction_ODStPOK_OBR_K: TFloatField
      FieldName = 'POK_OBR_K'
    end
    object Extraction_ODStAP_BEG: TStringField
      FieldName = 'AP_BEG'
      Size = 3
    end
    object Extraction_ODStENDDATE: TDateTimeField
      FieldName = 'ENDDATE'
    end
    object Extraction_ODStENDOSTAT: TFloatField
      FieldName = 'ENDOSTAT'
    end
    object Extraction_ODStENDPOK_OSTAT: TFloatField
      FieldName = 'ENDPOK_OSTAT'
    end
    object Extraction_ODStENDOBR_D: TFloatField
      FieldName = 'ENDOBR_D'
    end
    object Extraction_ODStENDOBR_K: TFloatField
      FieldName = 'ENDOBR_K'
    end
    object Extraction_ODStENDPOK_OBR_D: TFloatField
      FieldName = 'ENDPOK_OBR_D'
    end
    object Extraction_ODStENDPOK_OBR_K: TFloatField
      FieldName = 'ENDPOK_OBR_K'
    end
    object Extraction_ODStAP_END: TStringField
      FieldName = 'AP_END'
      Size = 3
    end
    object Extraction_ODStCUSTOMERVOIN: TFloatField
      FieldName = 'CUSTOMERVOIN'
    end
    object Extraction_ODStOPENDATE: TDateTimeField
      FieldName = 'OPENDATE'
    end
  end
  object ExtractionTrans_ODSt: TOracleDataSet
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000010000000D0000003A4F574E4143434F554E54494403000000040000
      000100000000000000}
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
    Master = Extraction_ODSt
    MasterFields = 'ACCOUNTID'
    DetailFields = 'OWNACCOUNTID'
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
    Filtered = True
    Left = 128
    Top = 72
    object ExtractionTrans_ODStID: TFloatField
      FieldName = 'ID'
    end
    object ExtractionTrans_ODStDAT: TDateTimeField
      FieldName = 'DAT'
    end
    object ExtractionTrans_ODStTIM: TDateTimeField
      FieldName = 'TIM'
    end
    object ExtractionTrans_ODStCURRENCYID: TIntegerField
      FieldName = 'CURRENCYID'
    end
    object ExtractionTrans_ODStOWNACCOUNTID: TFloatField
      FieldName = 'OWNACCOUNTID'
    end
    object ExtractionTrans_ODStPAIRACCOUNTID: TFloatField
      FieldName = 'PAIRACCOUNTID'
    end
    object ExtractionTrans_ODStPAIRACCOUNTNAME: TStringField
      FieldName = 'PAIRACCOUNTNAME'
    end
    object ExtractionTrans_ODStPAIRCURRENCYID: TFloatField
      FieldName = 'PAIRCURRENCYID'
    end
    object ExtractionTrans_ODStDEBIT: TFloatField
      FieldName = 'DEBIT'
    end
    object ExtractionTrans_ODStKREDIT: TFloatField
      FieldName = 'KREDIT'
    end
    object ExtractionTrans_ODStLDEBIT: TFloatField
      FieldName = 'LDEBIT'
    end
    object ExtractionTrans_ODStLKREDIT: TFloatField
      FieldName = 'LKREDIT'
    end
    object ExtractionTrans_ODStNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
  end
  object Bankinfo_ODSt: TOracleDataSet
    SQL.Strings = (
      
        'SELECT kod_b, bank, az_name, krno, inn, seher, adress, sedr, buh' +
        'altr,'
      '       tel, fax, swift, telex, email, post_in, kod_fil, filial,'
      
        '       adres_fil, tel_fil, fax_fil, swift_fil, telex_fil, postin' +
        '_fil,'
      
        '       seher_fil, inn_fil, krno_fil, sedrfil, buhal_fil, kod_bfi' +
        'l, nb,'
      '       val_mov  FROM bankinfo')
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
    Active = True
    Left = 128
    Top = 128
  end
  object DataSource1: TDataSource
    DataSet = Extraction_ODSt
    Left = 232
    Top = 152
  end
  object ODSSysKod: TOracleDataSet
    SQL.Strings = (
      'select  valu_name ,valute from avalute')
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
    Left = 129
    Top = 190
  end
  object DataSrcSysKod: TDataSource
    DataSet = ODSSysKod
    Left = 235
    Top = 14
  end
  object DataSrcCurrency: TDataSource
    DataSet = Currency_ODSt
    Left = 50
    Top = 264
  end
  object Currency_ODSt: TOracleDataSet
    SQL.Strings = (
      'select *'
      'from avalute')
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
    Active = True
    Left = 136
    Top = 256
  end
  object RatesDataSet: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   Val_Kod'
      '  ,Dat'
      ' ,Ostat'
      '  From Operkurs'
      'Where   Val_Kod = :Val_Kod and Dat =:Dat')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000080000003A56414C5F4B4F44030000000000000000000000
      040000003A4441540C0000000000000000000000}
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
    Master = Extraction_ODSt
    MasterFields = 'CurrencyID;enddate'
    DetailFields = 'Val_Kod;Dat'
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
    Top = 72
    object RatesDataSetVAL_KOD: TIntegerField
      FieldName = 'VAL_KOD'
      Required = True
    end
    object RatesDataSetDAT: TDateTimeField
      FieldName = 'DAT'
      Required = True
    end
    object RatesDataSetOSTAT: TFloatField
      FieldName = 'OSTAT'
    end
  end
  object RatesDataSetBegin: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   Val_Kod'
      '  ,Dat'
      ' ,Ostat'
      '  From Operkurs'
      'Where   Val_Kod = :Val_Kod and Dat =:Dat')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000080000003A56414C5F4B4F44030000000000000000000000
      040000003A4441540C0000000000000000000000}
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
    Master = Extraction_ODSt
    MasterFields = 'CurrencyID;datdate'
    DetailFields = 'Val_Kod;Dat'
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
    Top = 136
    object IntegerField1: TIntegerField
      FieldName = 'VAL_KOD'
      Required = True
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DAT'
      Required = True
    end
    object FloatField1: TFloatField
      FieldName = 'OSTAT'
    end
  end
  object FilialODS: TOracleDataSet
    SQL.Strings = (
      'select * from filial order by id')
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
    Active = True
    Left = 120
    Top = 352
  end
  object DsFials: TDataSource
    DataSet = FilialODS
    Left = 216
    Top = 360
  end
  object DSUser: TDataSource
    DataSet = UserODS
    Left = 296
    Top = 352
  end
  object UserODS: TOracleDataSet
    SQL.Strings = (
      'select * from user$')
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
    Active = True
    Left = 336
    Top = 352
  end
  object OraPackVExtraction: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'V_Extraction'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 384
    Top = 216
  end
  object OraDataSetMainExell: TOracleDataSet
    SQL.Strings = (
      
        'select sel.acc_no, sel.val_name, TO_Char(sel.dat, '#39'dd/mm/yyyy'#39') ' +
        'dat, sel.name, '
      
        'Round(ABS(decode (sel.Prefix, '#39'D'#39', :ByValD, '#39'K'#39', 0) ),2) AS Debe' +
        't,  '
      
        'Round(ABS(decode (sel.Prefix, '#39'K'#39', :ByValK , '#39'D'#39', 0)),2) AS Kred' +
        'it, ammount, lammount, ammount_c'
      'from ('
      
        'select acc.acc_no, val.val_name, prov.dat, prov.ammount, prov.la' +
        'mmount, prov.ammount_c, prov.name, ('#39'D'#39') as Prefix'
      'from provarch prov, account acc, avalute val'
      'where prov.debt = :acc_id'
      'and acc.id = prov.kredit'
      'and val.valute = acc.val_acc'
      'and prov.dat >= :BeginDat'
      'and prov.dat <= :EndDat'
      'union all'
      
        'select acc.acc_no, val.val_name, prov.dat,  prov.ammount, prov.l' +
        'ammount, prov.ammount_c, prov.name , ('#39'K'#39') as Prefix'
      'from provarch prov, account acc, avalute val'
      'where prov.kredit = :acc_id'
      'and acc.id = prov.debt '
      'and val.valute = prov.val_acc'
      'and prov.dat >=:BeginDat'
      'and prov.dat <= :EndDat) sel'
      'order by sel.dat, sel.prefix, sel.val_name'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000005000000070000003A4143435F494404000000000000000000000009
      0000003A424547494E4441540C0000000000000000000000070000003A454E44
      4441540C0000000000000000000000070000003A425956414C44010000000000
      000000000000070000003A425956414C4B010000000000000000000000}
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
    Left = 384
    Top = 264
    object OraDataSetMainExellDAT: TStringField
      DisplayLabel = 'Тарих'
      FieldName = 'DAT'
      Size = 10
    end
    object OraDataSetMainExellVAL_NAME: TStringField
      DisplayLabel = 'Вал.'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object OraDataSetMainExellACC_NO: TStringField
      DisplayLabel = 'Гаршы щесаб'
      FieldName = 'ACC_NO'
    end
    object OraDataSetMainExellDEBET: TFloatField
      DisplayLabel = 'Дебет'
      FieldName = 'DEBET'
    end
    object OraDataSetMainExellKREDIT: TFloatField
      DisplayLabel = 'Кредит'
      FieldName = 'KREDIT'
    end
    object OraDataSetMainExellNAME: TStringField
      DisplayLabel = 'Тяйинат'
      FieldName = 'NAME'
      Size = 255
    end
    object OraDataSetMainExellAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object OraDataSetMainExellLAMMOUNT: TFloatField
      FieldName = 'LAMMOUNT'
    end
    object OraDataSetMainExellAMMOUNT_C: TFloatField
      FieldName = 'AMMOUNT_C'
    end
  end
  object OraDataSetBalcns: TOracleDataSet
    SQL.Strings = (
      'select acc.acc_no from account acc'
      'where acc.bal_cn1 = :balcn'
      'order by acc.acc_no')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000060000003A42414C434E050000000000000000000000}
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
    Left = 392
    Top = 368
  end
  object OraDataSetTurnBals: TOracleDataSet
    SQL.Strings = (
      'select distinct bal_cn1 from account'
      'where (id, id) in '
      '(select d.debt, k.kredit from '
      '(select debt from provdoc) d,'
      '(select  kredit from provdoc) k)')
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
    Left = 384
    Top = 312
    object OraDataSetTurnBalsBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
      Required = True
    end
  end
end
