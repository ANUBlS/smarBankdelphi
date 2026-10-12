object Form1: TForm1
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'Free Accounts'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 608
    Top = 224
    Width = 75
    Height = 25
    Caption = '√€бул'
    Default = True
    TabOrder = 0
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 688
    Height = 105
    Align = alTop
    Caption = 'ј “»¬Ћя–'
    Color = clSilver
    ParentColor = False
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 21
      Width = 327
      Height = 20
      Caption = 'јктив щесабларын баьланмасы цчцн щесаб:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 55
      Width = 155
      Height = 20
      Caption = 'ям€лиййатын т€йинаты'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SearchEdit1: TSearchEdit
      Left = 352
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
      DataSource = Activ
      SearchField = 'acc_no'
    end
    object EditActivTrDesc: TEdit
      Left = 184
      Top = 56
      Width = 497
      Height = 21
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 105
    Width = 688
    Height = 105
    Align = alTop
    Caption = 'ѕј——»¬Ћя–'
    Color = clSilver
    ParentColor = False
    TabOrder = 2
    object Label3: TLabel
      Left = 16
      Top = 21
      Width = 339
      Height = 20
      Caption = 'ѕассив щесабларын баьланмасы цчцн щесаб:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 55
      Width = 155
      Height = 20
      Caption = 'ям€лиййатын т€йинаты'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SearchEdit2: TSearchEdit
      Left = 360
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
      DataSource = Passiv
      SearchField = 'acc_no'
    end
    object EditPassivTrDesc: TEdit
      Left = 184
      Top = 56
      Width = 497
      Height = 21
      TabOrder = 1
    end
  end
  object OraclePackage: TOraclePackage
    Session = OracleSession
    Debug = False
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 136
    Top = 336
  end
  object Activ: TDataSource
    DataSet = ActiveData
    Left = 64
    Top = 224
  end
  object ActiveData: TOracleDataSet
    SQL.Strings = (
      'select * from account order by acc_no')
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
    Session = OracleSession
    DesignActivation = False
    Active = False
    Left = 104
    Top = 224
  end
  object PassivData: TOracleDataSet
    SQL.Strings = (
      'select * from account order by acc_no')
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
    Session = OracleSession
    DesignActivation = False
    Active = False
    Left = 208
    Top = 224
  end
  object Passiv: TDataSource
    DataSet = PassivData
    Left = 248
    Top = 224
  end
  object OracleLogon: TOracleLogon
    Session = OracleSession
    Retries = 2
    Options = [ldDatabase, ldDatabaseList]
    AliasDropDownCount = 8
    HistorySize = 6
    HistoryWithPassword = False
    Left = 80
    Top = 360
  end
  object OracleSession: TOracleSession
    Cursor = crHourGlass
    DesignConnection = True
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
    Left = 32
    Top = 360
  end
end
