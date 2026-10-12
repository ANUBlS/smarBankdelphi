object Custominformesin: TCustominformesin
  Left = 351
  Top = 260
  Caption = 'Custominformesin'
  ClientHeight = 68
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 342
    Height = 34
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = -6
      Top = 9
      Width = 103
      Height = 18
      Caption = '   Tarix aral'#305#287#305'  '
      Color = clWindowFrame
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 213
      Top = 9
      Width = 3
      Height = 13
      Caption = '-'
      Color = clBtnText
      ParentColor = False
      Transparent = True
    end
    object DateTimePicker1: TDateTimePicker
      Left = 97
      Top = 6
      Width = 115
      Height = 21
      Date = 40605.483697916700000000
      Time = 40605.483697916700000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 222
      Top = 6
      Width = 115
      Height = 21
      Date = 40605.483729919000000000
      Time = 40605.483729919000000000
      TabOrder = 1
    end
  end
  object Button1: TButton
    Left = 80
    Top = 41
    Width = 80
    Height = 25
    Caption = 'Hesabat 1'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 166
    Top = 41
    Width = 75
    Height = 25
    Caption = 'Hesabat 2'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 250
    Top = 41
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = Button3Click
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 168
  end
end
