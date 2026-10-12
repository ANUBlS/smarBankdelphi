object AddEditForm: TAddEditForm
  Left = 408
  Top = 229
  BorderIcons = [biSystemMenu]
  Caption = #1070#1076#1103#1084#1103' '#1087#1083#1072#1085#1099
  ClientHeight = 149
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object StaticText1: TStaticText
    Left = 9
    Top = 17
    Width = 45
    Height = 19
    Caption = #1058#1072#1088#1080#1093' :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    TabOrder = 0
  end
  object DBDateTimeEditEh1: TDBDateTimeEditEh
    Left = 132
    Top = 13
    Width = 131
    Height = 22
    DataField = 'PAYMENTDATE'
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 1
    Visible = True
  end
  object StaticText2: TStaticText
    Left = 9
    Top = 60
    Width = 100
    Height = 19
    Caption = #1071#1089#1072#1089' '#1084#1103#1073#1083#1103#1075#1076#1103#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    TabOrder = 2
  end
  object DBEditEh1: TDBEditEh
    Left = 132
    Top = 56
    Width = 182
    Height = 22
    DataField = 'PRINCIPAL'
    EditButtons = <>
    TabOrder = 3
    Visible = True
  end
  object StaticText3: TStaticText
    Left = 9
    Top = 103
    Width = 130
    Height = 19
    Caption = #1065#1077#1089#1072#1073#1083#1072#1085#1084#1099#1096' %-'#1076#1103#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    TabOrder = 4
  end
  object DBEditEh2: TDBEditEh
    Left = 132
    Top = 99
    Width = 182
    Height = 22
    DataField = 'INTEREST'
    EditButtons = <>
    TabOrder = 5
    Visible = True
  end
  object Button1: TButton
    Left = 148
    Top = 129
    Width = 80
    Height = 27
    Caption = #1043#1103#1073#1091#1083
    ModalResult = 1
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 234
    Top = 129
    Width = 80
    Height = 27
    Caption = #1048#1084#1090#1080#1085#1072
    ModalResult = 2
    TabOrder = 7
    OnClick = Button2Click
  end
  object Localizer: TNLSLocalizer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 264
    Top = 16
  end
end
