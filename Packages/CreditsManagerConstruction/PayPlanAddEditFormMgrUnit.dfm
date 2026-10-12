object PayPlanAddEditForm: TPayPlanAddEditForm
  Left = 387
  Top = 165
  BorderIcons = [biSystemMenu]
  Caption = 'PayPlanAddEditForm'
  ClientHeight = 138
  ClientWidth = 258
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText1: TStaticText
    Left = 8
    Top = 16
    Width = 40
    Height = 17
    Caption = #1058#1072#1088#1080#1093' :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    TabOrder = 0
  end
  object DBDateTimeEditEh1: TDBDateTimeEditEh
    Left = 130
    Top = 12
    Width = 121
    Height = 21
    DataField = 'PAYMENTDATE'
    DataSource = PaymentPlaneForm.PlanInfoDatSrc
    EditButtons = <>
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkDateEh
    ParentFont = False
    TabOrder = 1
    Visible = True
  end
  object StaticText2: TStaticText
    Left = 8
    Top = 56
    Width = 45
    Height = 17
    Caption = #1052#1103#1073#1083#1103#1075
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    TabOrder = 2
  end
  object DBEditEh1: TDBEditEh
    Left = 83
    Top = 52
    Width = 169
    Height = 21
    DataField = 'MAINAMT'
    DataSource = PaymentPlaneForm.PlanInfoDatSrc
    EditButtons = <>
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = True
  end
  object Button1: TButton
    Left = 97
    Top = 105
    Width = 75
    Height = 25
    Caption = #1043#1103#1073#1091#1083
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 177
    Top = 105
    Width = 75
    Height = 25
    Caption = #1048#1084#1090#1080#1085#1072
    ModalResult = 2
    TabOrder = 5
  end
end
