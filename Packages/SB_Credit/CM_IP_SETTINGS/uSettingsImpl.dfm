object frmSettings: TfrmSettings
  Left = 263
  Top = 180
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Settings'
  ClientHeight = 324
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 487
    Height = 13
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Сечмяляр'
  end
  object DBComboBox1: TDBLookupComboBox
    Left = 16
    Top = 32
    Width = 491
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    KeyField = 'SETTINGSNAME'
    ListField = 'SETTINGSNAME'
    ListSource = Settingsd
    TabOrder = 0
    OnClick = DBComboBox1Change
    OnCloseUp = DBComboBox1Change
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 64
    Width = 490
    Height = 224
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = Sets
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 290
    Width = 490
    Height = 25
    DataSource = Sets
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
  end
  object ODSSettings: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      '  FROM smart.ip_settings')
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
    Left = 200
    Top = 96
  end
  object ODSSets: TOracleDataSet
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
    AfterPost = ODSSetsAfterPost
    Left = 200
    Top = 128
  end
  object Settingsd: TDataSource
    DataSet = ODSSettings
    Left = 232
    Top = 96
  end
  object Sets: TDataSource
    DataSet = ODSSets
    Left = 232
    Top = 128
  end
end
