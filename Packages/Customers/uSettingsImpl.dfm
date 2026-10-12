object frmSettings: TfrmSettings
  Left = 192
  Top = 107
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Settings'
  ClientHeight = 278
  ClientWidth = 461
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    461
    278)
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 17
    Top = 9
    Width = 433
    Height = 14
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = #1057#1077#1095#1084#1103#1083#1103#1088
  end
  object DBComboBox1: TDBLookupComboBox
    Left = 17
    Top = 34
    Width = 433
    Height = 22
    Anchors = [akLeft, akTop, akRight]
    KeyField = 'SETTINGSNAME'
    ListField = 'SETTINGSNAME'
    ListSource = Settingsd
    TabOrder = 0
    OnClick = DBComboBox1Change
    OnCloseUp = DBComboBox1Change
  end
  object DBGrid1: TDBGrid
    Left = 17
    Top = 69
    Width = 432
    Height = 170
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = Sets
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 17
    Top = 239
    Width = 430
    Height = 27
    DataSource = Sets
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
  end
  object ODSSettings: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      '  FROM ip_settings')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000200000018000000530045005400540049004E00470053004E004100
      4D0045000100000000000A00000051005500450052005900010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 200
    Top = 96
  end
  object ODSSets: TOracleDataSet
    Optimize = False
    Session = sboapiDataModule.SBSession
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
