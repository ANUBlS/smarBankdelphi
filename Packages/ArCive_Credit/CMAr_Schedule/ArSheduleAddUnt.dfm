object AddEditForm: TAddEditForm
  Left = 579
  Top = 246
  BorderIcons = [biSystemMenu]
  Caption = #1070#1076#1103#1084#1103' '#1087#1083#1072#1085#1099
  ClientHeight = 160
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText1: TStaticText
    Left = 9
    Top = 17
    Width = 41
    Height = 18
    Caption = 'Tarix :'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    TabOrder = 0
  end
  object DBDateTimeEditEh1: TDBDateTimeEditEh
    Left = 132
    Top = 16
    Width = 183
    Height = 21
    DataField = 'PAYMENTDATE'
    DataSource = ArScheduleDataModule.DataSrcScheduleData
    EditButtons = <>
    TabOrder = 1
    Visible = True
    EditFormat = ''
  end
  object StaticText2: TStaticText
    Left = 9
    Top = 60
    Width = 96
    Height = 18
    Caption = #399'sas m'#601'bl'#287'd'#601'n'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    TabOrder = 2
  end
  object DBEditEh1: TDBEditEh
    Left = 132
    Top = 56
    Width = 182
    Height = 21
    DataField = 'PRINCIPAL'
    DataSource = ArScheduleDataModule.DataSrcScheduleData
    EditButtons = <>
    TabOrder = 3
    Visible = True
  end
  object StaticText3: TStaticText
    Left = 9
    Top = 103
    Width = 126
    Height = 18
    Caption = 'Hesablanm '#351' %-d'#601'n'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    TabOrder = 4
  end
  object DBEditEh2: TDBEditEh
    Left = 132
    Top = 99
    Width = 182
    Height = 21
    DataField = 'INTEREST'
    DataSource = ArScheduleDataModule.DataSrcScheduleData
    EditButtons = <>
    TabOrder = 5
    Visible = True
  end
  object Button1: TButton
    Left = 148
    Top = 129
    Width = 80
    Height = 27
    Caption = 'Q'#601'bul'
    ModalResult = 1
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 234
    Top = 129
    Width = 80
    Height = 27
    Caption = #304'mtina'
    ModalResult = 2
    TabOrder = 7
    OnClick = Button2Click
  end
end
