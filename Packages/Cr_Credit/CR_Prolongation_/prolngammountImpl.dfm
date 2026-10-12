object Form2: TForm2
  Left = 519
  Top = 332
  ClientHeight = 103
  ClientWidth = 277
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCanResize = FormCanResize
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 277
    Height = 50
    Align = alClient
    Caption = #1071#1074#1074#1103#1083#1082#1080' '#1084#1103#1073#1083#1103#1100
    TabOrder = 0
    ExplicitWidth = 260
    ExplicitHeight = 49
    object DBEdit1: TDBEdit
      Left = 9
      Top = 19
      Width = 130
      Height = 21
      DataField = 'DUEAMMOUNT'
      DataSource = ProlongDataMod.DSCreditInfo
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 50
    Width = 277
    Height = 53
    Align = alBottom
    Caption = #1049#1077#1085#1080'  '#1084#1103#1073#1083#1103#1100
    TabOrder = 1
    ExplicitTop = 49
    ExplicitWidth = 260
    object ButtonOK: TButton
      Left = 188
      Top = 19
      Width = 81
      Height = 27
      Caption = #1043#1103#1073#1091#1083
      TabOrder = 0
      OnClick = ButtonOKClick
    end
    object Edit1: TEdit
      Left = 8
      Top = 20
      Width = 130
      Height = 21
      TabOrder = 1
      Text = 'Edit1'
    end
  end
end
