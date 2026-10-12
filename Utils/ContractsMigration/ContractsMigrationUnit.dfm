object FormMain: TFormMain
  Left = 190
  Top = 108
  Width = 518
  Height = 354
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Contracts Migration'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 510
    Height = 69
    Align = alTop
    TabOrder = 0
    object StaticText1: TStaticText
      Left = 182
      Top = 12
      Width = 85
      Height = 17
      BorderStyle = sbsSingle
      Caption = '  Migration Date  '
      TabOrder = 0
    end
    object DTPMigrationDate: TDateTimePicker
      Left = 183
      Top = 40
      Width = 154
      Height = 21
      CalAlignment = dtaLeft
      Date = 37657.7989864931
      Time = 37657.7989864931
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object StaticText2: TStaticText
      Left = 6
      Top = 12
      Width = 83
      Height = 17
      BorderStyle = sbsSingle
      Caption = '  Contract Type  '
      TabOrder = 2
    end
    object CmbBoxTypes: TComboBox
      Left = 6
      Top = 40
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      OnChange = CmbBoxTypesChange
      Items.Strings = (
        'Credit'
        'Deposit')
    end
    object BtnMigrate: TButton
      Left = 396
      Top = 37
      Width = 105
      Height = 25
      Caption = 'Migrate Now ...'
      TabOrder = 4
      OnClick = BtnMigrateClick
    end
  end
  object LogoMemo: TMemo
    Left = 0
    Top = 189
    Width = 510
    Height = 99
    Cursor = crIBeam
    Align = alClient
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 288
    Width = 510
    Height = 20
    Align = alBottom
    TabOrder = 2
    object ProgressBar: TProgressBar
      Left = 1
      Top = 3
      Width = 508
      Height = 16
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 0
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 308
    Width = 510
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 69
    Width = 510
    Height = 120
    Align = alTop
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial AzLat'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CONTRACTNO'
        Title.Caption = 'Contract Number'
        Width = 137
        Visible = True
      end>
  end
  object OraclePackage: TOraclePackage
    Session = OracleSession
    Debug = False
    PackageName = 'CONTRACT_MIGRATION'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 224
    Top = 184
  end
  object Contracts: TOracleDataSet
    SQL.Strings = (
      'Select '
      '  ID'
      ' ,ContractNo'
      '  From '
      '   SBCM_Contracts'
      '   Where Type# =:Type# ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000060000003A5459504523030000000000000000000000}
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
    AfterOpen = ContractsAfterOpen
    AfterClose = ContractsAfterClose
    Left = 264
    Top = 184
    object ContractsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ContractsCONTRACTNO: TStringField
      FieldName = 'CONTRACTNO'
      Size = 64
    end
  end
  object OracleLogon: TOracleLogon
    Session = OracleSession
    Retries = 2
    Options = [ldDatabase, ldDatabaseList, ldLogonHistory]
    AliasDropDownCount = 8
    HistorySize = 6
    HistoryWithPassword = True
    Left = 264
    Top = 144
  end
  object OracleSession: TOracleSession
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
    Connected = True
    RollbackOnDisconnect = False
    NullValue = nvUnAssigned
    SQLTrace = stUnchanged
    OptimizerGoal = ogUnchanged
    IsolationLevel = ilUnchanged
    BytesPerCharacter = bc1Byte
    Left = 224
    Top = 144
  end
  object DataSource: TDataSource
    DataSet = Contracts
    Left = 304
    Top = 184
  end
  object CurrentBankDate: TOracleDataSet
    SQL.Strings = (
      'Select Tek_Dat from sysdat')
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
    Left = 296
    Top = 136
    object CurrentBankDateTEK_DAT: TDateTimeField
      FieldName = 'TEK_DAT'
      Required = True
    end
  end
end
