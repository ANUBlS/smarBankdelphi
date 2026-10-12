object ProgressForm: TProgressForm
  Left = 192
  Top = 107
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Converting Percents'
  ClientHeight = 358
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 460
    Height = 232
    Align = alTop
    TabOrder = 0
    object StaticText1: TStaticText
      Left = 8
      Top = 16
      Width = 93
      Height = 17
      Caption = 'Депозит Мцгавиляси'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object CurrentDeposit: TStaticText
      Left = 112
      Top = 16
      Width = 127
      Height = 17
      Caption = '                                         '
      TabOrder = 1
    end
    object ProgressBar: TProgressBar
      Left = 8
      Top = 56
      Width = 353
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 2
    end
    object BtnDetails: TButton
      Left = 199
      Top = 84
      Width = 75
      Height = 25
      Caption = '&Гейдляр ...'
      Enabled = False
      TabOrder = 3
      OnClick = BtnDetailsClick
    end
    object BtnClose: TButton
      Left = 287
      Top = 84
      Width = 75
      Height = 25
      Caption = 'Б&аьла'
      TabOrder = 4
      OnClick = BtnCloseClick
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 120
      Width = 458
      Height = 111
      Align = alBottom
      Caption = 'Щесабламаларн нятижяляри'
      TabOrder = 5
      object LblResult: TLabel
        Left = 9
        Top = 21
        Width = 162
        Height = 13
        Caption = '12121212121212121212121'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object STCapitalizationsCount: TStaticText
        Left = 9
        Top = 48
        Width = 113
        Height = 17
        BorderStyle = sbsSunken
        Caption = 'STCapitalizationsCount'
        TabOrder = 0
      end
      object STWithdrawsCount: TStaticText
        Left = 9
        Top = 67
        Width = 96
        Height = 17
        BorderStyle = sbsSunken
        Caption = 'STWithdrawsCount'
        TabOrder = 1
      end
      object STContractsCount: TStaticText
        Left = 298
        Top = 89
        Width = 114
        Height = 14
        Caption = 'jhfgjgfjuguiggguygu'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object DetailsMemo: TMemo
    Left = 0
    Top = 232
    Width = 460
    Height = 126
    Align = alTop
    Color = clScrollBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 1
    Visible = False
  end
end
