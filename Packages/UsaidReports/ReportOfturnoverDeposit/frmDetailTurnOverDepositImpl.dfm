object frmDetailTurnOverDeposit: TfrmDetailTurnOverDeposit
  Left = 47
  Top = 159
  Caption = 'frmDetailTurnOverDeposit'
  ClientHeight = 351
  ClientWidth = 848
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
    Width = 848
    Height = 87
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 2
      Top = 2
      Width = 844
      Height = 19
      Align = alTop
      Alignment = taCenter
      Caption = #1046#1103#1083#1073' '#1086#1083#1091#1085#1084#1091#1096' '#1074#1103#1089#1072#1080#1090#1083#1103#1088#1080#1085' '#1076#1102#1074#1088#1080#1081#1081#1103#1089#1080' '#1097#1072#1075#1075#1099#1085#1076#1072' '#1097#1077#1089#1072#1073#1072#1090
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 509
    end
    object Label2: TLabel
      Left = 2
      Top = 21
      Width = 844
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = #1052#1094#1092#1103#1089#1089#1103#1083' '#1080#1085#1092#1086#1088#1084#1072#1089#1080#1081#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 168
    end
    object Label3: TLabel
      Left = 9
      Top = 60
      Width = 44
      Height = 14
      Caption = #1060#1080#1083#1080#1072#1083': '
    end
    object Label4: TLabel
      Left = 204
      Top = 60
      Width = 38
      Height = 14
      Caption = #1052#1103#1085#1073#1103' :'
    end
    object Label5: TLabel
      Left = 418
      Top = 60
      Width = 49
      Height = 14
      Caption = #1042#1072#1083#1081#1091#1090#1072': '
    end
    object DBEditEh1: TDBEditEh
      Left = 34
      Top = 56
      Width = 162
      Height = 22
      DataField = 'FILIALNAME'
      DataSource = dmReportOfturnoverDeposit.DetailTOds
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object DBEditEh2: TDBEditEh
      Left = 250
      Top = 56
      Width = 161
      Height = 22
      DataField = 'SRCNAME'
      DataSource = dmReportOfturnoverDeposit.DetailTOds
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object DBEditEh3: TDBEditEh
      Left = 466
      Top = 56
      Width = 85
      Height = 22
      DataField = 'VAL_NAME'
      DataSource = dmReportOfturnoverDeposit.DetailTOds
      EditButtons = <>
      TabOrder = 2
      Visible = True
    end
    object BitBtnexp: TBitBtn
      Left = 566
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
      TabOrder = 3
      OnClick = BitBtnexpClick
    end
  end
  object MainGriddetail: TDBGridEh
    Left = 0
    Top = 87
    Width = 848
    Height = 203
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = dmReportOfturnoverDeposit.DetailTOds
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
    TabOrder = 1
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ACC_NO'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'CUSTNAME'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 133
      end
      item
        EditButtons = <>
        FieldName = 'BEGINREST'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 103
      end
      item
        EditButtons = <>
        FieldName = 'BEGININTREST'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 102
      end
      item
        EditButtons = <>
        FieldName = 'KREDITTO'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 102
      end
      item
        EditButtons = <>
        FieldName = 'DEBETTO'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 103
      end
      item
        EditButtons = <>
        FieldName = 'DEBETINTTO'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 102
      end
      item
        EditButtons = <>
        FieldName = 'ENDREST'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 102
      end
      item
        EditButtons = <>
        FieldName = 'ENDINTREST'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 103
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object SearchPanel: TGroupBox
    Left = 0
    Top = 290
    Width = 848
    Height = 61
    Align = alBottom
    Caption = #1040#1093#1090#1072#1088#1099#1096' '#1055#1072#1085#1077#1083#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Panel7: TPanel
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
      object StaticText2: TStaticText
        Left = 1
        Top = 1
        Width = 146
        Height = 18
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #1065#1077#1089#1072#1073'.'#8470
        Color = clSilver
        ParentColor = False
        TabOrder = 0
      end
      object EditACC_NO: TEdit
        Left = 2
        Top = 17
        Width = 143
        Height = 23
        TabOrder = 1
      end
    end
    object Panel8: TPanel
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
      object StaticText3: TStaticText
        Left = 1
        Top = 1
        Width = 145
        Height = 18
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099
        Color = clSilver
        ParentColor = False
        TabOrder = 0
      end
      object EditCUSTNAME: TEdit
        Left = 2
        Top = 17
        Width = 143
        Height = 23
        TabOrder = 1
      end
    end
    object Panel10: TPanel
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
      object StaticText5: TStaticText
        Left = 1
        Top = 1
        Width = 146
        Height = 18
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #1048#1083#1083#1080#1082' %'
        Color = clSilver
        ParentColor = False
        TabOrder = 0
      end
      object EditANNUALYINTERESTRATE: TEdit
        Left = 2
        Top = 17
        Width = 143
        Height = 23
        TabOrder = 1
      end
    end
  end
  object rexpdetailsto: TCMExcelExport
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontTitles.Charset = RUSSIAN_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'Azl Sans Serif'
    FontTitles.Style = []
    OrientationTitles = 0
    FontData.Charset = RUSSIAN_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Azl Sans Serif'
    FontData.Style = []
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'MS Sans Serif'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 648
    Top = 120
  end
end
