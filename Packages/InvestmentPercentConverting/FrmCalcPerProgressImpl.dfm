object FrmCalcPerProgress: TFrmCalcPerProgress
  Left = 227
  Top = 192
  AutoSize = True
  BorderIcons = [biSystemMenu]
  ClientHeight = 297
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 490
    Height = 162
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object StaticText1: TStaticText
      Left = 9
      Top = 8
      Width = 101
      Height = 18
      Caption = 'Depozit M'#252'qavil'#601'si'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object CurrentDeposit: TStaticText
      Left = 121
      Top = 17
      Width = 127
      Height = 18
      Caption = '                                         '
      TabOrder = 1
    end
    object ProgressBar: TProgressBar
      Left = 9
      Top = 29
      Width = 478
      Height = 17
      Step = 1
      TabOrder = 2
    end
    object BtnDetails: TButton
      Left = 246
      Top = 51
      Width = 80
      Height = 27
      Caption = '&Qeydl'#601'r ...'
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BtnDetailsClick
    end
    object BtnClose: TButton
      Left = 340
      Top = 51
      Width = 81
      Height = 27
      Caption = 'Ba'#287'la'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BtnCloseClick
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 81
      Width = 486
      Height = 79
      Align = alBottom
      Caption = 'Hesablamal'#305'n n'#601'tic'#601'l'#601'ri'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object LblResult: TLabel
        Left = 10
        Top = 14
        Width = 184
        Height = 14
        Caption = '12121212121212121212121'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object STCapitalizationsCount: TStaticText
        Left = 9
        Top = 29
        Width = 126
        Height = 18
        BorderStyle = sbsSunken
        Caption = 'STCapitalizationsCount'
        TabOrder = 0
      end
      object STWithdrawsCount: TStaticText
        Left = 10
        Top = 54
        Width = 110
        Height = 18
        BorderStyle = sbsSunken
        Caption = 'STWithdrawsCount'
        TabOrder = 1
      end
      object STContractsCount: TStaticText
        Left = 321
        Top = 59
        Width = 105
        Height = 15
        Caption = 'jhfgjgfjuguiggguygu'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object DetailsMemo: TMemo
    Left = 0
    Top = 162
    Width = 490
    Height = 135
    Align = alTop
    Color = clScrollBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 1
    Visible = False
  end
end
