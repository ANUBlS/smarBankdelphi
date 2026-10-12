object MainTraffics: TMainTraffics
  Left = 12
  Top = 28
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Traffics By Balances'
  ClientHeight = 510
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object TrafficsViewer: TDBGrid
    Left = 0
    Top = 0
    Width = 780
    Height = 470
    Align = alClient
    DataSource = ExpertDataModul.TotalTrafficsData
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'RecordN'
        Title.Alignment = taRightJustify
        Title.Caption = #8470
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 35
        Visible = True
      end
      item
        Color = clGray
        Expanded = False
        FieldName = 'BAL_CN1'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = #1041#1072#1083#1072#1085#1089
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clSilver
        Expanded = False
        FieldName = 'TYPE'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OSTAT'
        Title.Caption = #1043#1072#1083#1099#1075
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POK_OSTAT'
        Title.Caption = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBTTURNOVER'
        Title.Caption = #1044'.'#1044#1102#1074#1088#1080#1081#1081#1103
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBTPOKTURNOVER'
        Title.Caption = #1044'.'#1044#1102#1074#1088#1080#1081#1081#1103'('#1040#1079')'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREDITTURNOVER'
        Title.Caption = #1050'.'#1044#1102#1074#1088#1080#1081#1081#1103
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREDITPOKTURNOVER'
        Title.Caption = #1050'.'#1044#1102#1074#1088#1080#1081#1081#1103'('#1040#1079')'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 470
    Width = 780
    Height = 40
    Align = alBottom
    TabOrder = 1
    object DBEdit1: TDBEdit
      Left = 2
      Top = 15
      Width = 776
      Height = 23
      Align = alClient
      Color = clSilver
      DataField = 'BALNAME'
      DataSource = ExpertDataModul.TotalTrafficsData
      ReadOnly = True
      TabOrder = 0
      ExplicitTop = 8
      ExplicitWidth = 835
      ExplicitHeight = 21
    end
  end
end
