object PlaneAddEditForm: TPlaneAddEditForm
  Left = 363
  Top = 214
  ActiveControl = DTPPaymentDate
  BorderStyle = bsDialog
  ClientHeight = 171
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DTPPaymentDate: TDateTimePicker
    Left = 16
    Top = 32
    Width = 94
    Height = 21
    CalAlignment = dtaLeft
    Date = 37785.6043712731
    Time = 37785.6043712731
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object MainDebtEdit: TCurrencyEdit
    Left = 16
    Top = 80
    Width = 169
    Height = 21
    TabOrder = 1
    Text = '0'
  end
  object PercentEdit: TCurrencyEdit
    Left = 192
    Top = 80
    Width = 153
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object StaticText1: TStaticText
    Left = 16
    Top = 16
    Width = 93
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = '        Тарих           '
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 3
  end
  object StaticText2: TStaticText
    Left = 16
    Top = 64
    Width = 170
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = '           Ясас борждан                    '
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 4
  end
  object StaticText3: TStaticText
    Left = 192
    Top = 64
    Width = 151
    Height = 17
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = '        Йыьылмыш фаиздян      '
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 5
  end
  object ApplyBtn: TButton
    Left = 176
    Top = 136
    Width = 75
    Height = 25
    Caption = '&Гябул'
    TabOrder = 7
    OnClick = ApplyBtnClick
  end
  object CancelBtn: TButton
    Left = 264
    Top = 136
    Width = 75
    Height = 25
    Caption = '&Имтина'
    ModalResult = 2
    TabOrder = 8
  end
  object CBPayed: TCheckBox
    Left = 16
    Top = 112
    Width = 97
    Height = 17
    Caption = 'Одянилмишдир'
    TabOrder = 6
  end
end
