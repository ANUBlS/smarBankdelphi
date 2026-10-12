object PeriodReportForm: TPeriodReportForm
  Left = 206
  Top = 239
  Width = 662
  Height = 188
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 654
    Height = 60
    Align = alTop
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 216
      Height = 58
      Align = alLeft
      Caption = 'Валйута'
      TabOrder = 0
      object CheckBox1: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 204
        Height = 21
        EditButtons = <>
        KeyField = 'VALUTE'
        ListField = 'VALU_NAME'
        ListSource = DSCurrencys
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox2: TGroupBox
      Left = 433
      Top = 1
      Width = 220
      Height = 58
      Align = alClient
      Caption = 'Истифадячи групу'
      TabOrder = 1
      object DBLookupComboboxEh3: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 204
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = DSUserGroups
        TabOrder = 0
        Visible = True
      end
      object CheckBox3: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 217
      Top = 1
      Width = 216
      Height = 58
      Align = alLeft
      Caption = 'Филиал'
      TabOrder = 2
      object DBLookupComboboxEh2: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 204
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = DSBranches
        TabOrder = 0
        Visible = True
      end
      object CheckBox2: TCheckBox
        Left = 6
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 1
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 60
    Width = 654
    Height = 60
    Align = alTop
    TabOrder = 1
    object GroupBox7: TGroupBox
      Left = 1
      Top = 1
      Width = 216
      Height = 58
      Align = alLeft
      Caption = 'Боржаланын типи'
      TabOrder = 0
      object CheckBox7: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object DBLookupComboboxEh7: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 204
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPION'
        ListSource = DSPersons
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox9: TGroupBox
      Left = 217
      Top = 1
      Width = 216
      Height = 58
      Align = alLeft
      Caption = 'Боржаланын категорйасы'
      TabOrder = 1
      object CheckBox8: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object DBLookupComboboxEh8: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 204
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = DSCategories
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox4: TGroupBox
      Left = 433
      Top = 1
      Width = 216
      Height = 58
      Align = alLeft
      Caption = 'Щесабат аралыьы'
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 66
        Height = 13
        Caption = 'Дюврцн яввяли'
      end
      object Label2: TLabel
        Left = 8
        Top = 38
        Width = 61
        Height = 13
        Caption = 'Дюврцн сону'
      end
      object BDateP: TDateTimePicker
        Left = 83
        Top = 12
        Width = 126
        Height = 21
        CalAlignment = dtaLeft
        Date = 38477.5930607986
        Time = 38477.5930607986
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
      object EDateP: TDateTimePicker
        Left = 83
        Top = 34
        Width = 126
        Height = 21
        CalAlignment = dtaLeft
        Date = 38477.5930689352
        Time = 38477.5930689352
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
    end
  end
  object Button1: TButton
    Left = 481
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Гябул'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 561
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Баьла'
    ModalResult = 2
    TabOrder = 3
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = 'Период щесабаты (СД1)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 264
    Top = 128
  end
  object CreditsDS: TOracleDataSet
    SQL.Strings = (
      'select ID '
      '  from CM_PORTFOLIO'
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
    Left = 216
    Top = 96
  end
  object CM_AK_REPORTS: TOraclePackage
    Session = CMDataModule.CMSession
    Debug = False
    PackageName = 'CM_AK_REPORTS'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Optimize = True
    Left = 344
    Top = 128
  end
  object DSCurrencys: TDataSource
    DataSet = Currencys
    Left = 8
    Top = 128
  end
  object Currencys: TOracleDataSet
    SQL.Strings = (
      'SELECT valute,  valu_name'
      '  FROM SB_AVALUTE'
      'ORDER BY VALUTE')
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
    Left = 8
    Top = 96
  end
  object DSBranches: TDataSource
    DataSet = Branches
    Left = 48
    Top = 128
  end
  object Branches: TOracleDataSet
    SQL.Strings = (
      'SELECT id, name'
      '  FROM SB_filial')
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
    Left = 48
    Top = 96
  end
  object DSUserGroups: TDataSource
    DataSet = UserGroups
    Left = 168
    Top = 128
  end
  object UserGroups: TOracleDataSet
    SQL.Strings = (
      'SELECT id, description'
      '  FROM cm_usergroups')
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
    Left = 168
    Top = 96
  end
  object DSPersons: TDataSource
    DataSet = Persons
    Left = 88
    Top = 128
  end
  object Persons: TOracleDataSet
    SQL.Strings = (
      'SELECT id,  descripion'
      '  FROM cm_persons')
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
    Left = 88
    Top = 96
  end
  object DSCategories: TDataSource
    DataSet = Categories
    Left = 128
    Top = 128
  end
  object Categories: TOracleDataSet
    SQL.Strings = (
      'SELECT id, description'
      '  FROM cm_categories')
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
    Left = 128
    Top = 96
  end
  object ResultDS: TOracleDataSet
    SQL.Strings = (
      'SELECT p.numberofcredit, '
      '      r.*, '
      '      CM_AK_REPORTS.get_balcn(r.contractno) as balcn,'
      '       b.name,'
      '       h.descripion person,'
      '       g.description project,'
      '       --f.name filial ,'
      '       get_filialname(p.branchid) filial,'
      '       V.Val_name,'
      '       p.DATEOFCONCLUSION,'
      '       p.DUEDATEFIRSTCONTRACT'
      ' FROM CM_REPORT_SD1 r,'
      '      cm_boorowerinfo b,'
      '      cm_portfolio p,'
      '      cm_persons h,'
      '      cm_usergroups g,'
      '  --    sb_filial f,'
      '      SB_AVALUTE V'
      ' where '
      '      r.creditid = b.creditid'
      '   and r.creditid = p.id'
      '   and  v.Valute = p.Currency'
      '   and h.id = p.personaltype'
      '   and g.id = p.usrgroup'
      ' --  and f.id = p.branchid  '
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
    Left = 216
    Top = 128
    object ResultDSNUMBEROFCREDIT: TStringField
      DisplayLabel = 'Мцг. №'
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object ResultDSNAME: TStringField
      DisplayLabel = 'Боржалан'
      FieldName = 'NAME'
      Size = 64
    end
    object ResultDSDATEOFCONCLUSION: TDateTimeField
      DisplayLabel = 'Ачылма тарихи'
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object ResultDSDUEDATEFIRSTCONTRACT: TDateTimeField
      DisplayLabel = 'Баьланма тарихи'
      FieldName = 'DUEDATEFIRSTCONTRACT'
      Required = True
    end
    object ResultDSCONTRACTNO: TStringField
      DisplayLabel = 'Ссуда Щесабын №-си'
      FieldName = 'CONTRACTNO'
    end
    object ResultDSVAL_NAME: TStringField
      DisplayLabel = 'Валйута'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object ResultDSBALCN: TFloatField
      DisplayLabel = 'Баланс Щесабы'
      FieldName = 'BALCN'
    end
    object ResultDSINTERESTACCNO: TStringField
      DisplayLabel = 'Фаиз Щесабын №-си'
      FieldName = 'INTERESTACCNO'
    end
    object ResultDSDUELOANACCNO: TStringField
      DisplayLabel = 'Ьеж Ссуда Щесабын №-си'
      FieldName = 'DUELOANACCNO'
    end
    object ResultDSDUEINTERESTACCNO: TStringField
      DisplayLabel = 'Ьеж Фаиз Щесабын №-си'
      FieldName = 'DUEINTERESTACCNO'
    end
    object ResultDSPRESACCNO: TStringField
      DisplayLabel = 'Ещтиййат Щесабын №-си'
      FieldName = 'PRESACCNO'
    end
    object ResultDSSECRESTACCNO: TStringField
      DisplayLabel = 'Мяг Ещтиййат Щесабын №-си'
      FieldName = 'SECRESTACCNO'
    end
    object ResultDSPBMAIN: TFloatField
      DisplayLabel = 'Д.Я.Ясас б.'
      FieldName = 'PBMAIN'
      Required = True
    end
    object ResultDSPEBMAIN: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'PEBMAIN'
      Required = True
    end
    object ResultDSPBINT: TFloatField
      DisplayLabel = 'Д.Я. Фаиз б'
      FieldName = 'PBINT'
      Required = True
    end
    object ResultDSPEBINT: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'PEBINT'
      Required = True
    end
    object ResultDSPBDUEMAIN: TFloatField
      DisplayLabel = 'Д.Я. Эеж. ясас б'
      FieldName = 'PBDUEMAIN'
      Required = True
    end
    object ResultDSPEBDUEMAIN: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'PEBDUEMAIN'
      Required = True
    end
    object ResultDSPBDUEINT: TFloatField
      DisplayLabel = 'Д.Я. Эеж фаиз б'
      FieldName = 'PBDUEINT'
      Required = True
    end
    object ResultDSPEBDUEINT: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'PEBDUEINT'
      Required = True
    end
    object ResultDSPAYMAIN: TFloatField
      DisplayLabel = 'Юдян. Ясас б'
      FieldName = 'PAYMAIN'
      Required = True
    end
    object ResultDSEPAYMAIN: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'EPAYMAIN'
      Required = True
    end
    object ResultDSPAYINT: TFloatField
      DisplayLabel = 'Юдян. Фаиз б'
      FieldName = 'PAYINT'
      Required = True
    end
    object ResultDSEPAYINT: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'EPAYINT'
      Required = True
    end
    object ResultDSPAYDUE: TFloatField
      DisplayLabel = 'Юдян. Эеж. Ясас б'
      FieldName = 'PAYDUE'
      Required = True
    end
    object ResultDSEPAYDUE: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'EPAYDUE'
      Required = True
    end
    object ResultDSPAYDUEINT: TFloatField
      DisplayLabel = 'Юдян. Эеж фаиз б'
      FieldName = 'PAYDUEINT'
      Required = True
    end
    object ResultDSEPAYDUEINT: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'EPAYDUEINT'
      Required = True
    end
    object ResultDSTRANCHEMAIN: TFloatField
      DisplayLabel = 'Верилмиш мяб.'
      FieldName = 'TRANCHEMAIN'
      Required = True
    end
    object ResultDSETRANCHEMAIN: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'ETRANCHEMAIN'
      Required = True
    end
    object ResultDSPEMAIN: TFloatField
      DisplayLabel = 'Д.С.Ясас б.'
      FieldName = 'PEMAIN'
      Required = True
    end
    object ResultDSEPEMAIN: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'EPEMAIN'
      Required = True
    end
    object ResultDSPEINT: TFloatField
      DisplayLabel = 'Д.С.Фаиз б.'
      FieldName = 'PEINT'
      Required = True
    end
    object ResultDSEPEINT: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'EPEINT'
      Required = True
    end
    object ResultDSPEDUEMAIN: TFloatField
      DisplayLabel = 'Д.С. Эеж Ясас б.'
      FieldName = 'PEDUEMAIN'
      Required = True
    end
    object ResultDSEPEDUEMAIN: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'EPEDUEMAIN'
      Required = True
    end
    object ResultDSPEDUEINT: TFloatField
      DisplayLabel = 'Д.С. Эеж Фаиз б.'
      FieldName = 'PEDUEINT'
      Required = True
    end
    object ResultDSEPEDUEINT: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'EPEDUEINT'
      Required = True
    end
    object ResultDSCRDPERIOD: TFloatField
      DisplayLabel = 'Мцддят'
      FieldName = 'CRDPERIOD'
      Required = True
    end
    object ResultDSPERSON: TStringField
      DisplayLabel = 'Мцштяринин катеьорийасы'
      FieldName = 'PERSON'
      Size = 64
    end
    object ResultDSPROJECT: TStringField
      DisplayLabel = 'Лайищя'
      FieldName = 'PROJECT'
      Size = 255
    end
    object ResultDSFILIAL: TStringField
      DisplayLabel = 'Филиал'
      FieldName = 'FILIAL'
      Size = 4000
    end
  end
  object Kera: TCMExcelExport
    ConnectTo = ctNewInstance
    StyleColumnWidth = cwAutoFit
    ColumnWidth = 0
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clGreen
    FontTitles.Height = -11
    FontTitles.Name = 'Azl Sans Serif'
    FontTitles.Style = [fsBold]
    OrientationTitles = 0
    FontData.Charset = RUSSIAN_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Azl Sans Serif'
    FontData.Style = []
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Azl Sans Serif'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 376
    Top = 8
  end
end
