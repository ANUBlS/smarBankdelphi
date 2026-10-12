object frmCalcPerProgress: TfrmCalcPerProgress
  Left = 227
  Top = 192
  AutoSize = True
  BorderIcons = [biSystemMenu]
  ClientHeight = 297
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 455
    Height = 162
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object StaticText1: TStaticText
      Left = 9
      Top = 8
      Width = 121
      Height = 19
      Caption = #1044#1077#1087#1086#1079#1080#1090' '#1052#1094#1075#1072#1074#1080#1083#1103#1089#1080
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
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
      Caption = '&'#1043#1077#1081#1076#1083#1103#1088' ...'
      Enabled = False
      TabOrder = 3
      OnClick = BtnDetailsClick
    end
    object BtnClose: TButton
      Left = 340
      Top = 51
      Width = 81
      Height = 27
      Caption = #1041'&'#1072#1100#1083#1072
      TabOrder = 4
      OnClick = BtnCloseClick
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 81
      Width = 451
      Height = 79
      Align = alBottom
      Caption = #1065#1077#1089#1072#1073#1083#1072#1084#1072#1083#1072#1088#1085' '#1085#1103#1090#1080#1078#1103#1083#1103#1088#1080
      TabOrder = 5
      object LblResult: TLabel
        Left = 10
        Top = 14
        Width = 161
        Height = 15
        Caption = '12121212121212121212121'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object STCapitalizationsCount: TStaticText
        Left = 10
        Top = 31
        Width = 114
        Height = 18
        BorderStyle = sbsSunken
        Caption = 'STCapitalizationsCount'
        TabOrder = 0
      end
      object STWithdrawsCount: TStaticText
        Left = 10
        Top = 54
        Width = 98
        Height = 18
        BorderStyle = sbsSunken
        Caption = 'STWithdrawsCount'
        TabOrder = 1
      end
      object STContractsCount: TStaticText
        Left = 321
        Top = 59
        Width = 84
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
    Top = 162
    Width = 455
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
