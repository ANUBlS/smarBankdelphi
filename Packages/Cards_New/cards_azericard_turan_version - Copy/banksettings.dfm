object Bank_Settings: TBank_Settings
  Left = 466
  Top = 389
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 438
  ClientWidth = 343
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 22
    Width = 39
    Height = 13
    Caption = 'Bank ID'
  end
  object Label2: TLabel
    Left = 12
    Top = 73
    Width = 83
    Height = 13
    Caption = 'Account Close ID'
  end
  object Label3: TLabel
    Left = 12
    Top = 197
    Width = 156
    Height = 14
    Caption = #1041#1072#1085#1082#1086#1084#1072#1090' '#1103#1084#1103#1083#1080#1081#1081#1072#1090#1083#1072#1088#1099#1085#1076#1072' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label4: TLabel
    Left = 12
    Top = 219
    Width = 187
    Height = 14
    Caption = #1072#1088#1072' '#1097#1077#1089#1072#1073#1083#1072#1088#1076#1072#1085' '#1080#1089#1090#1080#1092#1072#1076#1103' '#1086#1083#1091#1085#1089#1091#1085
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label7: TLabel
    Left = 12
    Top = 114
    Width = 64
    Height = 14
    Caption = #1050#1083#1080#1088#1080#1085#1075' (25)'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 12
    Top = 155
    Width = 64
    Height = 14
    Caption = #1050#1083#1080#1088#1080#1085#1075' (45)'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 14
    Top = 208
    Width = 147
    Height = 14
    Caption = #1042#1077#1088#1080#1092#1080#1082#1072#1089#1080#1081#1092#1076#1072#1085' '#1080#1089#1090#1080#1092#1072#1076#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 106
    Top = 22
    Width = 229
    Height = 21
    DataField = 'BANKID'
    DataSource = DataMod_CARDS.settingssource
    TabOrder = 0
  end
  object Button1: TButton
    Left = 111
    Top = 367
    Width = 83
    Height = 25
    Caption = #1049#1072#1076#1076#1072' '#1089#1072#1093#1083#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 192
    Top = 207
    Width = 97
    Height = 17
    TabOrder = 2
    Visible = False
  end
  object DBEdit2: TDBEdit
    Left = 106
    Top = 68
    Width = 229
    Height = 21
    DataField = 'ACCOUNTCLOSECODE'
    DataSource = DataMod_CARDS.settingssource
    TabOrder = 3
  end
  object SearchEdit3: TSearchEdit
    Left = 106
    Top = 110
    Width = 229
    Height = 21
    TabOrder = 4
    DataSource = DataMod_CARDS.hesab1source
    SearchField = 'acc_no'
  end
  object SearchEdit4: TSearchEdit
    Left = 106
    Top = 154
    Width = 229
    Height = 21
    TabOrder = 5
    DataSource = DataMod_CARDS.hesab2source
    SearchField = 'acc_no'
  end
  object CheckBox2: TCheckBox
    Left = 192
    Top = 208
    Width = 97
    Height = 17
    TabOrder = 6
  end
  object RadioGroup1: TRadioGroup
    Left = 39
    Top = 242
    Width = 185
    Height = 105
    Caption = #1052#1102#1097#1082#1103#1084#1083#1103#1085#1076#1080#1088#1084#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Items.Strings = (
      #1062#1084#1091#1084#1080' '#1084#1103#1073#1083#1103#1100
      #1060#1103#1088#1075)
    ParentFont = False
    TabOrder = 7
  end
end
