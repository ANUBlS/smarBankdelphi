object FormChoice: TFormChoice
  Left = 1031
  Top = 498
  BorderIcons = [biSystemMenu]
  Caption = 'FormChoice'
  ClientHeight = 206
  ClientWidth = 138
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 125
    Height = 16
    Caption = #1058#1072#1088#1080#1093' '#1072#1088#1072#1083#1099#1101#1099#1085#1099' '#1089#1077#1095
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 87
    Height = 16
    Caption = #1041#1072#1096#1083#1072#1085#1101#1099#1078' '#1090#1072#1088#1080#1093
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 72
    Width = 51
    Height = 16
    Caption = #1057#1086#1085' '#1090#1072#1088#1080#1093
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 48
    Width = 121
    Height = 21
    Date = 40141.438865555600000000
    Time = 40141.438865555600000000
    TabOrder = 0
    OnChange = DateTimePicker1Change
  end
  object DateTimePicker2: TDateTimePicker
    Left = 8
    Top = 88
    Width = 121
    Height = 21
    Date = 40141.438955069400000000
    Time = 40141.438955069400000000
    TabOrder = 1
    OnChange = DateTimePicker2Change
  end
  object Tax: TRadioButton
    Left = 8
    Top = 120
    Width = 113
    Height = 17
    Caption = #1052#1072#1083#1080#1081#1081#1103
    Checked = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TabStop = True
  end
  object Finance: TRadioButton
    Left = 8
    Top = 144
    Width = 113
    Height = 17
    Caption = #1042#1077#1088#1101#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object ok1: TBitBtn
    Left = 8
    Top = 168
    Width = 65
    Height = 25
    Caption = #1043#1103#1073#1091#1083
    DoubleBuffered = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Glyph.Data = {
      36010000424D3601000000000000760000002800000015000000100000000100
      040000000000C000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333000333333333333333333333000338FF3FF3333333333333000338C
      F38CFF33333333333000338CF38CCCFF333333333000338CF38CCCCCFF333333
      3000338CF38CCCCCCCFF33333000338CF38CCCCCCCCCFF333000338CF38CCCCC
      CCCC88F33000338CF38CCCCCCC8833333000338CF38CCCCC883333333000338C
      F38CCC88333333333000338CF38C88333333333330003388F388333333333333
      3000333333333333333333333000333333333333333333333000}
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 4
    OnClick = ok1Click
  end
  object CMExcelExport1: TCMExcelExport
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontTitles.Charset = RUSSIAN_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'Azl Sans Serif'
    FontTitles.Style = []
    BorderTitles.Weight = bwThin
    BorderTitles.LineStyle = blLine
    OrientationTitles = 0
    FontData.Charset = RUSSIAN_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -13
    FontData.Name = 'Azl Sans Serif'
    FontData.Style = []
    FontSummary.Charset = RUSSIAN_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -14
    FontSummary.Name = 'Azl Sans Serif'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 104
    Top = 152
  end
end
