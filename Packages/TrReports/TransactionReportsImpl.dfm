object TransactionReports: TTransactionReports
  Left = 287
  Top = 214
  Width = 870
  Height = 640
  Caption = 'TransactionReports'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rgRepType: TRadioGroup
    Left = 0
    Top = 0
    Width = 185
    Height = 97
    Caption = 'Hesabat'
    ItemIndex = 1
    Items.Strings = (
      'Excel'
      'QReport')
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 94
    Width = 369
    Height = 56
    Caption = 'Tarix'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Button1: TButton
      Left = 291
      Top = 28
      Width = 75
      Height = 25
      Caption = 'Hesabat'
      TabOrder = 0
      OnClick = Button1Click
    end
    object dtpRep: TDBDateTimeEditEh
      Left = 6
      Top = 22
      Width = 166
      Height = 21
      EditButtons = <>
      TabOrder = 1
      Visible = True
      EditFormat = 'DD/MM/YYYY'
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 184
    Top = 1
    Width = 185
    Height = 96
    Caption = #399'm'#305'liyyatlar'
    Items.Strings = (
      'Planla'#351'd'#305'r'#305'lm'#305#351
      'T'#601'sdiqedilmi'#351
      'L'#601#287'v edilmi'#351
      'Redakt'#601' edilmi'#351)
    TabOrder = 2
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = True
    Left = 416
    Top = 120
  end
end
