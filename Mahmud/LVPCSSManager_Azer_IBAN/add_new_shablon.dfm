object Add_new: TAdd_new
  Left = 659
  Top = 609
  AutoSize = True
  Caption = 'Add New'
  ClientHeight = 81
  ClientWidth = 185
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 185
    Height = 81
    Caption = #1064#1072#1073#1083#1086#1085#1072' '#1072#1076' '#1074#1077#1088
    TabOrder = 0
    object Edit_New_Shablon_name: TEdit
      Left = 32
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Button_New_shablon: TButton
      Left = 56
      Top = 49
      Width = 75
      Height = 25
      Caption = #1058#1103#1089#1076#1080#1075' '#1077#1090
      Default = True
      TabOrder = 1
      OnClick = Button_New_shablonClick
    end
  end
end
