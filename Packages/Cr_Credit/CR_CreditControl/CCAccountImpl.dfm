object FormContractAccounts: TFormContractAccounts
  Left = 273
  Top = 180
  BorderIcons = [biSystemMenu]
  Caption = 'FormContractAccounts'
  ClientHeight = 238
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 0
    Top = 53
    Width = 340
    Height = 47
    Align = alTop
    Caption = #1057#1089#1091#1076#1072' '#1097#1077#1089#1072#1073#1099
    TabOrder = 0
    ExplicitWidth = 327
    object Label1: TLabel
      Left = 152
      Top = 17
      Width = 40
      Height = 14
      Caption = #1043#1072#1083#1099#1100#1099
    end
    object DBEdit1: TDBEdit
      Left = 9
      Top = 17
      Width = 130
      Height = 22
      DataField = 'LOANACCNO'
      TabOrder = 0
    end
    object DBEdit8: TDBEdit
      Left = 190
      Top = 16
      Width = 121
      Height = 22
      DataField = 'LOANREST'
      TabOrder = 1
    end
    object CBLoan: TCheckBox
      Left = 321
      Top = 19
      Width = 25
      Height = 19
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 150
    Width = 340
    Height = 49
    Align = alTop
    Caption = #1060#1072#1080#1079' '#1097#1077#1089#1072#1073#1099
    TabOrder = 1
    ExplicitWidth = 327
    object Label4: TLabel
      Left = 152
      Top = 19
      Width = 40
      Height = 14
      Caption = #1043#1072#1083#1099#1100#1099
    end
    object DBEdit4: TDBEdit
      Left = 9
      Top = 17
      Width = 130
      Height = 22
      DataField = 'INTERESTACCNO'
      TabOrder = 0
    end
    object DBEdit11: TDBEdit
      Left = 190
      Top = 16
      Width = 120
      Height = 22
      DataField = 'DUEINTERESTREST'
      TabOrder = 1
    end
    object CBInt: TCheckBox
      Left = 322
      Top = 19
      Width = 20
      Height = 19
      TabOrder = 2
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 100
    Width = 340
    Height = 50
    Align = alTop
    Caption = #1040#1076#1080' '#1077#1097#1090#1080#1081#1072#1090' '#1097#1077#1089#1072#1073#1099
    TabOrder = 2
    ExplicitWidth = 327
    object Label3: TLabel
      Left = 151
      Top = 17
      Width = 40
      Height = 14
      Caption = #1043#1072#1083#1099#1100#1099
    end
    object DBEdit3: TDBEdit
      Left = 9
      Top = 17
      Width = 130
      Height = 22
      DataField = 'PRIMARYRESACCNO'
      TabOrder = 0
    end
    object DBEdit10: TDBEdit
      Left = 188
      Top = 16
      Width = 123
      Height = 22
      DataField = 'PRIMARYRESREST'
      TabOrder = 1
    end
    object CBPrRes: TCheckBox
      Left = 322
      Top = 19
      Width = 22
      Height = 19
      TabOrder = 2
    end
  end
  object BitBtn3: TBitBtn
    Left = 152
    Top = 207
    Width = 81
    Height = 27
    Caption = #1043#1103#1073#1091#1083
    DoubleBuffered = True
    Kind = bkOK
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 253
    Top = 207
    Width = 81
    Height = 27
    Caption = #1048#1084#1090#1080#1085#1072
    DoubleBuffered = True
    Kind = bkCancel
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 4
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 0
    Width = 340
    Height = 53
    Align = alTop
    Caption = #1052#1094#1096#1090#1103#1088#1080
    TabOrder = 5
    ExplicitWidth = 327
    object DBEdit2: TDBEdit
      Left = 9
      Top = 17
      Width = 296
      Height = 22
      DataField = 'NAME'
      TabOrder = 0
    end
    object CBCust: TCheckBox
      Left = 319
      Top = 18
      Width = 27
      Height = 19
      TabOrder = 1
    end
  end
end
