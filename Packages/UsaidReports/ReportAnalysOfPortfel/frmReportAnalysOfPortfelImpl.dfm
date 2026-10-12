object frmReportAnalysOfPortfel: TfrmReportAnalysOfPortfel
  Left = 113
  Top = 105
  Width = 909
  Height = 541
  Caption = 'frmReportAnalysOfPortfel'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  OnDestroy = ActiveFormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox4: TGroupBox
    Left = 0
    Top = 265
    Width = 909
    Height = 42
    Align = alTop
    Caption = #1046#1103#1084
    TabOrder = 0
    ExplicitTop = 170
    object Label2: TLabel
      Left = 181
      Top = 18
      Width = 148
      Height = 14
      Caption = #1050#1088#1077#1076#1080#1090#1083#1103#1088#1080#1085' '#1075#1072#1083#1099#1075' '#1084#1103#1073#1083#1103#1100#1080':'
    end
    object Label3: TLabel
      Left = 415
      Top = 18
      Width = 99
      Height = 14
      Caption = #1050#1088#1077#1076#1080#1090#1083#1103#1088#1080#1085' '#1089#1072#1081#1099':'
    end
    object Label4: TLabel
      Left = 9
      Top = 18
      Width = 70
      Height = 14
      Caption = #1046#1103#1084' '#1084#1103#1073#1083#1103#1100':'
    end
    object Label5: TLabel
      Left = 590
      Top = 20
      Width = 68
      Height = 14
      Caption = #1054#1088#1090#1072' '#1080#1083#1083#1080#1082'%'
    end
    object EdRest: TEdit
      Left = 306
      Top = 13
      Width = 97
      Height = 22
      ReadOnly = True
      TabOrder = 0
      Text = '0'
    end
    object EdCrdCount: TEdit
      Left = 493
      Top = 13
      Width = 97
      Height = 22
      ReadOnly = True
      TabOrder = 1
      Text = '0'
    end
    object edThisAmt: TEdit
      Left = 78
      Top = 14
      Width = 96
      Height = 22
      ReadOnly = True
      TabOrder = 2
      Text = '0'
    end
    object EdRoundInt: TEdit
      Left = 646
      Top = 15
      Width = 97
      Height = 22
      ReadOnly = True
      TabOrder = 3
      Text = '0'
    end
  end
  object MainGrid: TDBGridEh
    Left = 0
    Top = 307
    Width = 909
    Height = 215
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = dmReportAnalysOfPortfel.CategoriesSumds
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = RUSSIAN_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Azl Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDblClickOptimizeColWidth, dghColumnResize, dghColumnMove]
    RowDetailPanel.Color = clBtnFace
    TabOrder = 1
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    OnDblClick = MainGridDblClick
    OnTitleBtnClick = MainGridTitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'SECTOR'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 205
      end
      item
        EditButtons = <>
        FieldName = 'CRDCOUNT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 103
      end
      item
        EditButtons = <>
        FieldName = 'ceofCEOFCOUNT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'INITIALAMOUNT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 107
      end
      item
        EditButtons = <>
        FieldName = 'ceofCEOFINITAMT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'PROQNOZ'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 108
      end
      item
        EditButtons = <>
        FieldName = 'ceofdelta'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 107
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 522
    Width = 909
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 909
    Height = 265
    Align = alTop
    Caption = #1055#1086#1088#1090#1092#1077#1083#1080#1085' '#1090#1103#1097#1083#1080#1083#1080' '#1094#1079#1088#1103'  '#1097#1077#1089#1072#1073#1072#1090' '#1092#1086#1088#1084#1072#1089#1099
    TabOrder = 3
    object Label6: TLabel
      Left = 683
      Top = 11
      Width = 102
      Height = 14
      Caption = #1055#1086#1088#1090#1092#1077#1083#1080#1085' '#1089#1090#1072#1090#1091#1089#1091
    end
    object Label1: TLabel
      Left = 681
      Top = 61
      Width = 30
      Height = 14
      Caption = #1058#1072#1088#1080#1093
    end
    object GroupBox3: TGroupBox
      Left = 2
      Top = 16
      Width = 178
      Height = 247
      Align = alLeft
      Caption = #1060#1080#1083#1080#1072#1083
      TabOrder = 0
      ExplicitHeight = 152
      object lfilial: TEvanescence
        Left = 2
        Top = 32
        Width = 176
        Height = 211
        ItemHeight = 14
        TabOrder = 0
        DataSource = dmReportAnalysOfPortfel.filialsds
        ListField = 'name'
        KeyField = 'id'
      end
      object chfilial: TCheckBox
        Left = 5
        Top = 13
        Width = 105
        Height = 18
        Caption = #1065#1072#1084#1099#1089#1099#1085#1099' '#1089#1077#1095#1084#1103#1082
        TabOrder = 1
        OnClick = chfilialClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 180
      Top = 16
      Width = 178
      Height = 247
      Align = alLeft
      Caption = #1050#1088#1077#1076#1080#1090#1080#1085' '#1090#1080#1087#1080
      TabOrder = 1
      ExplicitHeight = 152
      object lcredittypes: TEvanescence
        Left = 2
        Top = 32
        Width = 176
        Height = 211
        ItemHeight = 14
        TabOrder = 0
        DataSource = dmReportAnalysOfPortfel.CreditTypesds
        ListField = 'description'
        KeyField = 'id'
      end
      object chcrdtype: TCheckBox
        Left = 5
        Top = 13
        Width = 105
        Height = 18
        Caption = #1065#1072#1084#1099#1089#1099#1085#1099' '#1089#1077#1095#1084#1103#1082
        TabOrder = 1
        OnClick = chcrdtypeClick
      end
    end
    object GroupBox5: TGroupBox
      Left = 358
      Top = 16
      Width = 177
      Height = 247
      Align = alLeft
      Caption = #1042#1072#1083#1081#1091#1090#1072
      TabOrder = 2
      ExplicitHeight = 152
      object lvalute: TEvanescence
        Left = 2
        Top = 32
        Width = 176
        Height = 211
        ItemHeight = 14
        TabOrder = 0
        DataSource = dmReportAnalysOfPortfel.valutesds
        ListField = 'valu_name'
        KeyField = 'valute'
      end
      object chvalute: TCheckBox
        Left = 5
        Top = 13
        Width = 105
        Height = 18
        Caption = #1065#1072#1084#1099#1089#1099#1085#1099' '#1089#1077#1095#1084#1103#1082
        TabOrder = 1
        OnClick = chvaluteClick
      end
    end
    object RgrSum: TRadioGroup
      Left = 535
      Top = 16
      Width = 139
      Height = 247
      Align = alLeft
      Caption = #1046#1103#1084#1083#1103#1096#1084#1103
      ItemIndex = 0
      Items.Strings = (
        #1057#1072#1097#1103
        #1064#1103#1093#1089#1080#1085' '#1085#1102#1074#1094
        #1069#1080#1088#1086#1074
        #1042#1072#1083#1081#1091#1090#1072
        #1056#1077#1101#1080#1086#1085
        #1056#1080#1089#1082' '#1076#1103#1088#1103#1078#1103#1089#1080
        #1060#1072#1080#1079' '#1076#1103#1088#1103#1078#1103#1089#1080
        #1052#1094#1076#1076#1103#1090)
      TabOrder = 3
      ExplicitHeight = 152
    end
    object cbStatusofPort: TComboBox
      Left = 678
      Top = 33
      Width = 125
      Height = 22
      TabOrder = 4
      Text = 'B'#252't'#252'n'
      Items.Strings = (
        'B'#252't'#252'n'
        'Normal'
        'Gecikdirilmi'#351)
    end
    object DTPRAP: TDateTimePicker
      Left = 678
      Top = 81
      Width = 125
      Height = 21
      Date = 39784.691438078700000000
      Time = 39784.691438078700000000
      TabOrder = 5
    end
    object OK: TBitBtn
      Left = 687
      Top = 109
      Width = 81
      Height = 27
      DoubleBuffered = True
      Kind = bkOK
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 6
      OnClick = OKClick
    end
    object BitBtnexp: TBitBtn
      Left = 687
      Top = 138
      Width = 81
      Height = 27
      Caption = #1048#1093#1088#1072#1078' '#1077#1090
      DoubleBuffered = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000080
        0000008000000080000000800000008000000080000000800000008000000080
        00000080000000800000008000000080000000800000FF00FF00FF00FF000080
        0000008000000080000000800000008000000080000000800000008000000080
        00000080000000800000008000000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF000080000000800000008000000080000000800000008000000080
        00000080000000800000008000000080000000800000FF00FF00FF00FF000080
        0000FFFFFF000080000000800000008000000080000000800000FFFFFF000080
        00000080000000800000FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00008000000080000000800000FFFFFF00008000000080
        00000080000000800000FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF0000800000FFFFFF0000800000008000000080
        0000FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000080000000800000008000000080
        0000FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF00008000000080000000800000008000000080
        000000800000FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00008000000080000000800000FFFFFF00008000000080
        00000080000000800000FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000008000000080000000800000008000000080000000800000008000000080
        00000080000000800000008000000080000000800000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentDoubleBuffered = False
      TabOrder = 7
      OnClick = BitBtnexpClick
    end
    object BitBtn3: TBitBtn
      Left = 772
      Top = 138
      Width = 81
      Height = 27
      Caption = #1055#1088#1086#1075#1085#1086#1079
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFF00800000800000
        8000008000008000008000FFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
        FFFFFF0080000080000080000080000080000080000080000080000080000080
        00FFFFFFFF00FFFF00FFFF00FFFFFFFF00800000800000800000800000800000
        8000008000008000008000008000008000008000FFFFFFFF00FFFF00FFFFFFFF
        008000008000008000FFFFFFFFFFFFFFFFFFFFFFFF0080000080000080000080
        00008000FFFFFFFF00FFFFFFFF008000008000008000008000008000FFFFFFFF
        FFFF008000008000008000008000008000008000008000FFFFFFFFFFFF008000
        008000008000008000008000FFFFFFFFFFFF0080000080000080000080000080
        00008000008000FFFFFFFFFFFF008000008000008000008000008000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF008000008000008000008000FFFFFFFFFFFF008000
        008000008000008000008000FFFFFFFFFFFF008000008000FFFFFFFFFFFF0080
        00008000008000FFFFFFFFFFFF008000008000008000008000008000FFFFFFFF
        FFFF008000008000FFFFFFFFFFFF008000008000008000FFFFFFFFFFFF008000
        008000008000008000008000FFFFFFFFFFFF008000008000FFFFFFFFFFFF0080
        00008000008000FFFFFFFF00FFFFFFFF008000008000008000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF008000008000008000FFFFFFFF00FFFF00FFFFFFFF
        0080000080000080000080000080000080000080000080000080000080000080
        00008000FFFFFFFF00FFFF00FFFF00FFFFFFFF00800000800000800000800000
        8000008000008000008000008000008000FFFFFFFF00FFFF00FFFF00FFFF00FF
        FF00FFFFFFFFFFFFFF008000008000008000008000008000008000FFFFFFFFFF
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentDoubleBuffered = False
      TabOrder = 8
      OnClick = BitBtn3Click
    end
  end
  object expSumds: TCMExcelExport
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontTitles.Charset = RUSSIAN_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'Arial AzLat'
    FontTitles.Style = []
    OrientationTitles = 0
    FontData.Charset = RUSSIAN_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Arial AzLat'
    FontData.Style = []
    FontSummary.Charset = RUSSIAN_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Arial AzLat'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 768
    Top = 24
  end
end
