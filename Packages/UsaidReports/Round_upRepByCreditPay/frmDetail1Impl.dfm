object frmDetail1: TfrmDetail1
  Left = 152
  Top = 146
  Caption = 'frmDetail1'
  ClientHeight = 352
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 850
    Height = 87
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 2
      Top = 19
      Width = 846
      Height = 19
      Align = alTop
      Alignment = taCenter
      Caption = #1050#1088#1077#1076#1080#1090#1080#1085' '#1102#1076#1103#1085#1080#1096#1080' '#1094#1079#1088#1103'  '#1097#1077#1089#1072#1073#1072#1090#1099' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 304
    end
    object Label2: TLabel
      Left = 2
      Top = 2
      Width = 846
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = #1069#1077#1078#1080#1082#1084#1080#1096' '#1102#1076#1103#1085#1080#1096#1083#1103#1088' '#1094#1079#1088#1103' '#1084#1094#1092#1103#1089#1089#1103#1083' '#1080#1085#1092#1086#1088#1084#1072#1089#1080#1081#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 362
    end
    object Label3: TLabel
      Left = 9
      Top = 60
      Width = 44
      Height = 14
      Caption = #1060#1080#1083#1080#1072#1083': '
    end
    object Label4: TLabel
      Left = 210
      Top = 60
      Width = 82
      Height = 14
      Caption = #1050#1088#1077#1076#1080#1090#1080#1085' '#1090#1080#1087#1080' :'
    end
    object Label5: TLabel
      Left = 447
      Top = 60
      Width = 49
      Height = 14
      Caption = #1042#1072#1083#1081#1091#1090#1072': '
    end
    object Label6: TLabel
      Left = 578
      Top = 60
      Width = 33
      Height = 14
      Caption = #1058#1072#1088#1080#1093':'
    end
    object DBEditEh1: TDBEditEh
      Left = 38
      Top = 56
      Width = 167
      Height = 22
      DataField = 'FILIALNAME'
      DataSource = dmRepByCreditPay.DetailInf1ds
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object DBEditEh2: TDBEditEh
      Left = 276
      Top = 56
      Width = 167
      Height = 22
      DataField = 'DESCRIPTION'
      DataSource = dmRepByCreditPay.DetailInf1ds
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object DBEditEh3: TDBEditEh
      Left = 492
      Top = 56
      Width = 81
      Height = 22
      DataField = 'VALU_NAME'
      DataSource = dmRepByCreditPay.DetailInf1ds
      EditButtons = <>
      TabOrder = 2
      Visible = True
    end
    object DTP: TDateTimePicker
      Left = 615
      Top = 55
      Width = 96
      Height = 21
      Date = 39785.574284213000000000
      Time = 39785.574284213000000000
      Enabled = False
      TabOrder = 3
    end
    object BitBtnexp: TBitBtn
      Left = 712
      Top = 52
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
      TabOrder = 4
      OnClick = BitBtnexpClick
    end
  end
  object SearchPanel: TGroupBox
    Left = 0
    Top = 291
    Width = 850
    Height = 61
    Align = alBottom
    Caption = #1040#1093#1090#1072#1088#1099#1096' '#1055#1072#1085#1077#1083#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Panel4: TPanel
      Left = 2
      Top = 17
      Width = 148
      Height = 42
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object StaticText1: TStaticText
        Left = 1
        Top = 1
        Width = 146
        Height = 18
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #1052#1094#1075'.'
        Color = clSilver
        ParentColor = False
        TabOrder = 0
      end
      object EditNUMBEROFCREDIT: TEdit
        Left = 2
        Top = 17
        Width = 143
        Height = 23
        TabOrder = 1
        OnExit = EditNUMBEROFCREDITExit
        OnKeyPress = EditNUMBEROFCREDITKeyPress
      end
    end
    object Panel7: TPanel
      Left = 150
      Top = 17
      Width = 147
      Height = 42
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object StaticText2: TStaticText
        Left = 1
        Top = 1
        Width = 145
        Height = 18
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #1052#1094'.'#1072#1076#1099
        Color = clSilver
        ParentColor = False
        TabOrder = 0
      end
      object EditNAME: TEdit
        Left = 2
        Top = 17
        Width = 143
        Height = 23
        TabOrder = 1
        OnExit = EditNUMBEROFCREDITExit
        OnKeyPress = EditNUMBEROFCREDITKeyPress
      end
    end
    object Panel8: TPanel
      Left = 297
      Top = 17
      Width = 148
      Height = 42
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object StaticText3: TStaticText
        Left = 1
        Top = 1
        Width = 146
        Height = 18
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #1042#1077#1088'.'#1084#1103#1073'.'
        Color = clSilver
        ParentColor = False
        TabOrder = 0
      end
      object EditTRAMT: TEdit
        Left = 2
        Top = 17
        Width = 143
        Height = 23
        TabOrder = 1
        OnExit = EditNUMBEROFCREDITExit
        OnKeyPress = EditNUMBEROFCREDITKeyPress
      end
    end
  end
  object DetailInf1Grid: TDBGridEh
    Left = 0
    Top = 87
    Width = 850
    Height = 204
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = dmRepByCreditPay.DetailInf1ds
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = RUSSIAN_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Azl Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDblClickOptimizeColWidth, dghColumnResize, dghColumnMove]
    RowDetailPanel.Color = clBtnFace
    TabOrder = 2
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    OnDblClick = DetailInf1GridDblClick
    OnTitleBtnClick = DetailInf1GridTitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NUMBEROFCREDIT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 183
      end
      item
        EditButtons = <>
        FieldName = 'TRDAT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'TRAMT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 72
      end
      item
        EditButtons = <>
        FieldName = 'PERIOD'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'ANNUALYINTERESTRATE'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'REST'
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
        FieldName = 'PLANINTEREST'
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
        FieldName = 'SUMPLANPAY'
        Footers = <>
        Title.Caption = #1058#1072#1084' '#1102#1076#1103#1085#1080#1096
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'THISMONTHSPAYDAT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'THISMONTHSPRINCIPAL'
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
        FieldName = 'THISMONTHSINTEREST'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'THISMONTHSPENALTY'
        Footers = <>
        Title.Caption = #1041'.'#1040' '#1102#1076'.'#1087#1077#1085
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'smthismonthpay'
        Footers = <>
        Title.Caption = #1069#1088'/'#1078#1103#1084
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'PAYREST'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'PAYINTREST'
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
        FieldName = 'PAYPEN'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'SUMREALPAY'
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
        FieldName = 'PERCENT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'EXDATCOUNT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 36
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object ActionList1: TActionList
    Left = 144
    Top = 160
    object ActionSearch: TAction
      Caption = 'ActionSearch'
      OnExecute = ActionSearchExecute
    end
  end
  object expODSmaincprd: TCMExcelExport
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
    Left = 760
    Top = 104
  end
end
