object frmImpPayments: TfrmImpPayments
  Left = 268
  Top = 302
  Width = 437
  Height = 159
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 429
    Height = 42
    Align = alTop
    Caption = 'файл'
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 400
      Top = 16
      Width = 23
      Height = 22
      Hint = 'Дискдян сечмяк'
      Caption = '...'
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object SavePathEdit: TEdit
      Left = 9
      Top = 16
      Width = 386
      Height = 21
      Color = clInfoBk
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 42
    Width = 429
    Height = 54
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 81
      Height = 13
      Caption = 'Ямялиййат  тарихи : '
    end
    object DTPImpDate: TDateTimePicker
      Left = 90
      Top = 3
      Width = 97
      Height = 21
      CalAlignment = dtaLeft
      Date = 38376.5433525
      Time = 38376.5433525
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object ProgressShower: TProgressBar
      Left = 8
      Top = 30
      Width = 385
      Height = 16
      Min = 0
      Max = 100
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 400
      Top = 27
      Width = 27
      Height = 23
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        000000000000000000000000000000000000FF00FF00FF00FF00000000000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF000000
        000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00C0C0C00000FF
        FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000C0C0
        C00000FFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF008080
        8000C0C0C00000FFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000
        000000000000C0C0C00000FFFF000000000000000000FF00FF00FF00FF000000
        0000000000000000000000000000FF00FF00FF00FF0080808000C0C0C00000FF
        FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000C0C0
        C00000FFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF008080
        8000C0C0C00000FFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
        8000C0C0C000FFFFFF0000FFFF000000000000000000FF00FF00FF00FF000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF0080808000C0C0C000FFFFFF0000FFFF000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0080808000C0C0C000FFFFFF0000FFFF0000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
  end
  object BitBtn2: TBitBtn
    Left = 344
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Баьла'
    TabOrder = 2
    OnClick = BitBtn2Click
    Kind = bkClose
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = 'Кредит ямялиййатларынын идхалы'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Top = 102
  end
  object SaveDlg: TOpenDialog
    Filter = '*.xls|*.xls'
    Left = 29
    Top = 102
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 128
    Top = 103
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 96
    Top = 103
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 60
    Top = 102
  end
end
