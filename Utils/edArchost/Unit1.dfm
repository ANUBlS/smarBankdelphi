object Form1: TForm1
  Left = 200
  Top = 110
  Width = 784
  Height = 491
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 776
    Height = 41
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
    Align = alTop
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 776
    Height = 341
    Align = alClient
    DataSource = DataSource1
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Color = clSilver
        Expanded = False
        FieldName = 'ACCOUNTS'
        ReadOnly = True
        Title.Caption = 'ŸÂÒ‡·˚Ì π'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BALANCE'
        ReadOnly = True
        Title.Caption = '¡‡Î‡ÌÒ'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OSTAT'
        Title.Caption = '√‡Î˚„'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POK_OSTAT'
        Title.Caption = 'Ã‡Ì‡Ú ÂÍ‚Ë‚‡ÎÂÌÚË'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATDATE'
        Title.Caption = '“‡Ëı'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBR_D'
        Title.Caption = 'ƒ˛‚ËÈÈˇ ƒ'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBR_K'
        Title.Caption = 'ƒ˛‚ËÈÈˇ  '
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POK_OBR_D'
        Title.Caption = 'ƒ˛‚ËÈÈˇ Ï‡Ì‡Ú ƒ'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POK_OBR_K'
        Title.Caption = 'ƒ˛‚ËÈÈˇ Ï‡Ì‡Ú  '
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 423
    Width = 776
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object Button1: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '√ˇ·ÛÎ'
      Default = True
      TabOrder = 0
      OnClick = Button1Click
    end
    object EditBalance: TEdit
      Left = 112
      Top = 11
      Width = 121
      Height = 21
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object CBFilter: TCheckBox
      Left = 240
      Top = 13
      Width = 97
      Height = 17
      Caption = '‘ËÎÚÂ'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object DTP: TDateTimePicker
      Left = 304
      Top = 8
      Width = 127
      Height = 21
      CalAlignment = dtaLeft
      Date = 38212.4235375926
      Time = 38212.4235375926
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 382
    Width = 776
    Height = 41
    Align = alBottom
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = '¡¿À¿Õ— ∆ﬂÃ»:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Label1: TLabel
      Left = 488
      Top = 13
      Width = 52
      Height = 16
      Caption = '¿ıÚ‡˚¯:'
    end
    object DBEdit1: TDBEdit
      Left = 128
      Top = 8
      Width = 121
      Height = 24
      DataField = 'SUM(OSTAT)'
      DataSource = DataSumBalans
      TabOrder = 0
    end
    object EditSearch: TEdit
      Left = 560
      Top = 8
      Width = 121
      Height = 24
      TabOrder = 1
      OnChange = EditSearchChange
    end
    object DBEdit2: TDBEdit
      Left = 280
      Top = 8
      Width = 121
      Height = 24
      DataField = 'SUM(POK_OSTAT)'
      DataSource = DataSumBalans
      TabOrder = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet
    Left = 208
    Top = 152
  end
  object OracleDataSet: TOracleDataSet
    SQL.Strings = (
      'select'
      '    archost.rowID'
      '   ,sb_main_facilities.GetAccountNumber(acc_id)  as Accounts'
      '   ,sb_main_facilities.GetAccountbalance(acc_id) as balance'
      '   ,id_number'
      '   ,acc_id'
      '   ,ostat'
      '   ,pok_ostat'
      '   ,datdate'
      '   ,obr_d'
      '   ,obr_k'
      '   ,pok_obr_d'
      '   ,pok_obr_k'
      '   ,lastopdate'
      'from'
      '   archost'
      'where'
      '   datdate =:DAT'
      ''
      'order by balance, Accounts'
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A4441540C0000000000000000000000}
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
    Session = OracleSession1
    DesignActivation = False
    Active = False
    Left = 280
    Top = 152
    object OracleDataSetACCOUNTS: TStringField
      FieldName = 'ACCOUNTS'
      Size = 4000
    end
    object OracleDataSetID_NUMBER: TFloatField
      FieldName = 'ID_NUMBER'
      Required = True
    end
    object OracleDataSetACC_ID: TFloatField
      FieldName = 'ACC_ID'
    end
    object OracleDataSetOSTAT: TFloatField
      FieldName = 'OSTAT'
    end
    object OracleDataSetPOK_OSTAT: TFloatField
      FieldName = 'POK_OSTAT'
    end
    object OracleDataSetDATDATE: TDateTimeField
      FieldName = 'DATDATE'
    end
    object OracleDataSetOBR_D: TFloatField
      FieldName = 'OBR_D'
    end
    object OracleDataSetOBR_K: TFloatField
      FieldName = 'OBR_K'
    end
    object OracleDataSetPOK_OBR_D: TFloatField
      FieldName = 'POK_OBR_D'
    end
    object OracleDataSetPOK_OBR_K: TFloatField
      FieldName = 'POK_OBR_K'
    end
    object OracleDataSetLASTOPDATE: TDateTimeField
      FieldName = 'LASTOPDATE'
    end
    object OracleDataSetBALANCE: TFloatField
      FieldName = 'BALANCE'
    end
  end
  object OracleSession1: TOracleSession
    Cursor = crHourGlass
    DesignConnection = False
    LogonUsername = 'smart'
    LogonPassword = 'sm'
    LogonDatabase = 'SB'
    ThreadSafe = False
    Preferences.FloatPrecision = 0
    Preferences.IntegerPrecision = 0
    Preferences.SmallIntPrecision = -1
    Preferences.UseOCI7 = False
    Preferences.ConvertCRLF = True
    Preferences.TrimStringFields = True
    Preferences.MaxStringFieldSize = 0
    Preferences.ZeroDateIsNull = True
    Connected = False
    RollbackOnDisconnect = False
    NullValue = nvUnAssigned
    SQLTrace = stUnchanged
    OptimizerGoal = ogUnchanged
    IsolationLevel = ilUnchanged
    BytesPerCharacter = bc1Byte
    Left = 720
    Top = 409
  end
  object OracleLogon1: TOracleLogon
    Session = OracleSession1
    Retries = 2
    Options = [ldDatabase, ldDatabaseList]
    AliasDropDownCount = 8
    HistorySize = 6
    HistoryWithPassword = False
    Left = 608
    Top = 417
  end
  object SumBalans: TOracleDataSet
    SQL.Strings = (
      'select sum(ostat) ,sum(pok_ostat) from archost'
      ' where '
      ' datdate=:tdate and'
      'acc_id in (select id from account where bal_cn1=:sik)'
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A53494B03000000000000000000000006000000
      3A54444154450C0000000000000000000000}
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
    Session = OracleSession1
    DesignActivation = False
    Active = False
    Left = 352
    Top = 184
    object SumBalansSUMOSTAT: TFloatField
      FieldName = 'SUM(OSTAT)'
      DisplayFormat = '#,##0.00'
    end
    object SumBalansSUMPOK_OSTAT: TFloatField
      FieldName = 'SUM(POK_OSTAT)'
      DisplayFormat = '#,##0.00'
    end
  end
  object DataSumBalans: TDataSource
    DataSet = SumBalans
    Left = 416
    Top = 184
  end
  object Tekdat: TOracleDataSet
    SQL.Strings = (
      'select tek_dat from sysdat')
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
    Session = OracleSession1
    DesignActivation = False
    Active = False
    Left = 504
    Top = 144
    object TekdatTEK_DAT: TDateTimeField
      FieldName = 'TEK_DAT'
      Required = True
    end
  end
end
