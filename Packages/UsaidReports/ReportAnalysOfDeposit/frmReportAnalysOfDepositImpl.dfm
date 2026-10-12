object frmReportAnalysOfDeposit: TfrmReportAnalysOfDeposit
  Left = 47
  Top = 128
  Width = 892
  Height = 554
  Caption = 'frmReportAnalysOfDeposit'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox4: TGroupBox
    Left = 0
    Top = 507
    Width = 892
    Height = 47
    Align = alBottom
    Caption = #1046#1103#1084
    TabOrder = 0
    object Label2: TLabel
      Left = 9
      Top = 22
      Width = 19
      Height = 14
      Caption = #1057#1072#1081
    end
    object Label3: TLabel
      Left = 146
      Top = 22
      Width = 73
      Height = 14
      Caption = #1048#1083#1082#1080#1085' '#1084#1103#1073#1083#1103#1100
    end
    object Label4: TLabel
      Left = 328
      Top = 23
      Width = 71
      Height = 14
      Caption = #1043#1072#1083#1099#1075' '#1084#1103#1073#1083#1103#1100
    end
    object Label5: TLabel
      Left = 510
      Top = 19
      Width = 66
      Height = 14
      Caption = #1060#1072#1080#1079' '#1084#1103#1073#1083#1103#1100
    end
    object Label6: TLabel
      Left = 687
      Top = 19
      Width = 48
      Height = 14
      Caption = #1054#1063#1060#1044'(%)'
    end
    object EdCount: TEdit
      Left = 32
      Top = 17
      Width = 108
      Height = 22
      ReadOnly = True
      TabOrder = 0
      Text = '0'
    end
    object EdIntAmt: TEdit
      Left = 213
      Top = 17
      Width = 108
      Height = 22
      ReadOnly = True
      TabOrder = 1
      Text = '0'
    end
    object EdRest: TEdit
      Left = 398
      Top = 17
      Width = 108
      Height = 22
      ReadOnly = True
      TabOrder = 2
      Text = '0'
    end
    object EdIntRest: TEdit
      Left = 576
      Top = 17
      Width = 108
      Height = 22
      ReadOnly = True
      TabOrder = 3
      Text = '0'
    end
    object EdRoundInt: TEdit
      Left = 739
      Top = 16
      Width = 107
      Height = 22
      ReadOnly = True
      TabOrder = 4
      Text = '0'
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 892
    Height = 316
    Align = alTop
    Caption = #1044#1077#1087#1086#1079#1080#1090' '#1087#1086#1088#1090#1092#1077#1083#1080#1085#1080#1085'  '#1072#1085#1072#1083#1080#1079#1080'  '#1094#1079#1088#1103'  '#1097#1077#1089#1072#1073#1072#1090' '#1092#1086#1088#1084#1072#1089#1099
    TabOrder = 1
    object DTPRAP: TDateTimePicker
      Left = 678
      Top = 81
      Width = 125
      Height = 21
      Date = 39784.691438078700000000
      Time = 39784.691438078700000000
      TabOrder = 0
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
      TabOrder = 1
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
      TabOrder = 2
    end
    object Panel2: TPanel
      Left = 2
      Top = 16
      Width = 888
      Height = 149
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      object Label1: TLabel
        Left = 551
        Top = 6
        Width = 30
        Height = 14
        Caption = #1058#1072#1088#1080#1093
      end
      object RgrSum: TRadioGroup
        Left = 368
        Top = 2
        Width = 180
        Height = 145
        Align = alLeft
        Caption = #1046#1103#1084#1083#1103#1096#1084#1103
        ItemIndex = 0
        Items.Strings = (
          #1060#1080#1083#1080#1072#1083
          #1042#1072#1083#1081#1091#1090#1072
          #1052#1094#1076#1076#1103#1090
          #1060#1072#1080#1079' '#1076#1103#1088#1103#1078#1103#1089#1080
          #1053#1102#1074)
        TabOrder = 0
      end
      object GroupBox2: TGroupBox
        Left = 185
        Top = 2
        Width = 183
        Height = 145
        Align = alLeft
        Caption = #1052#1103#1085#1073#1103
        TabOrder = 1
        object ESource: TEvanescence
          Left = 2
          Top = 32
          Width = 176
          Height = 109
          ItemHeight = 14
          TabOrder = 0
          DataSource = dmReportAnalysOfDeposit.SourceMDds
          ListField = 'name'
          KeyField = 'id'
        end
        object CheckBox1: TCheckBox
          Left = 5
          Top = 13
          Width = 105
          Height = 18
          Caption = #1065#1072#1084#1099#1089#1099#1085#1099' '#1089#1077#1095#1084#1103#1082
          TabOrder = 1
          OnClick = CheckBox1Click
        end
      end
      object GroupBox5: TGroupBox
        Left = 2
        Top = 2
        Width = 183
        Height = 145
        Align = alLeft
        Caption = #1060#1080#1083#1080#1072#1083
        TabOrder = 2
        object EFilial: TEvanescence
          Left = 2
          Top = 32
          Width = 176
          Height = 109
          ItemHeight = 14
          TabOrder = 0
          DataSource = dmReportAnalysOfDeposit.FilialMDds
          ListField = 'name'
          KeyField = 'id'
        end
        object CheckBox2: TCheckBox
          Left = 5
          Top = 13
          Width = 105
          Height = 18
          Caption = #1065#1072#1084#1099#1089#1099#1085#1099' '#1089#1077#1095#1084#1103#1082
          TabOrder = 1
          OnClick = CheckBox2Click
        end
      end
      object DTPDMR: TDateTimePicker
        Left = 550
        Top = 24
        Width = 125
        Height = 21
        Date = 39784.691438078700000000
        Time = 39784.691438078700000000
        TabOrder = 3
      end
    end
    object GroupBox11: TGroupBox
      Left = 368
      Top = 165
      Width = 183
      Height = 149
      Align = alLeft
      Caption = #1042#1072#1083#1081#1091#1090#1072
      TabOrder = 4
      object EValute: TEvanescence
        Left = 2
        Top = 32
        Width = 176
        Height = 109
        ItemHeight = 14
        TabOrder = 0
        DataSource = dmReportAnalysOfDeposit.ValuteMDds
        ListField = 'val_name'
        KeyField = 'valute'
      end
      object CheckBox3: TCheckBox
        Left = 5
        Top = 13
        Width = 105
        Height = 18
        Caption = #1065#1072#1084#1099#1089#1099#1085#1099' '#1089#1077#1095#1084#1103#1082
        TabOrder = 1
        OnClick = CheckBox3Click
      end
    end
    object GroupBox13: TGroupBox
      Left = 185
      Top = 165
      Width = 183
      Height = 149
      Align = alLeft
      Caption = #1058#1080#1087
      TabOrder = 5
      object EType: TEvanescence
        Left = 2
        Top = 32
        Width = 176
        Height = 109
        ItemHeight = 14
        TabOrder = 0
        DataSource = dmReportAnalysOfDeposit.TypeMDds
        ListField = 'name'
        KeyField = 'id'
      end
      object CheckBox4: TCheckBox
        Left = 5
        Top = 13
        Width = 105
        Height = 18
        Caption = #1065#1072#1084#1099#1089#1099#1085#1099' '#1089#1077#1095#1084#1103#1082
        TabOrder = 1
        OnClick = CheckBox4Click
      end
    end
    object GroupBox15: TGroupBox
      Left = 2
      Top = 165
      Width = 183
      Height = 149
      Align = alLeft
      Caption = '% '#1097#1077#1089#1072#1073#1083#1072#1085#1084#1072#1089#1099
      TabOrder = 6
      object ECalcMethod: TEvanescence
        Left = 2
        Top = 32
        Width = 176
        Height = 109
        ItemHeight = 14
        TabOrder = 0
        DataSource = dmReportAnalysOfDeposit.CalcStatusMDds
        ListField = 'name'
        KeyField = 'id'
      end
      object CheckBox5: TCheckBox
        Left = 5
        Top = 13
        Width = 105
        Height = 18
        Caption = #1065#1072#1084#1099#1089#1099#1085#1099' '#1089#1077#1095#1084#1103#1082
        TabOrder = 1
        OnClick = CheckBox5Click
      end
    end
    object BitBtn1: TBitBtn
      Left = 554
      Top = 99
      Width = 80
      Height = 27
      DoubleBuffered = True
      Kind = bkOK
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 7
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 554
      Top = 131
      Width = 80
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
      TabOrder = 8
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 554
      Top = 68
      Width = 80
      Height = 27
      Caption = #1057#1077#1095#1084#1103#1083#1103#1088
      DoubleBuffered = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000C40E0000C40E00000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FFFFFF00FFFFFF00000000000000000000000000000000000000
        000000000000FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FFFFFF000000000000000000000000008400000000000000840000000000
        0000840000000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FFFF
        FF00000000008400000084000000840000000000000084000000000000008400
        000000000000840000000000000000000000FFFFFF00FF00FF00FF00FF00FFFF
        FF0084000000840000008400000084000000C6C6C600C6C6C600FFFFFF00FFFF
        FF0084000000000000008400000000000000FFFFFF00FF00FF00FFFFFF008400
        00008400000084000000840000008400000084000000C6C6C600FFFFFF008400
        00008400000084000000000000000000000000000000FFFFFF00FFFFFF008400
        000084000000840000008400000084000000FF000000C6C6C600FFFFFF008400
        00008400000084000000000000008400000000000000FFFFFF00FFFFFF008400
        000084000000FF00000084000000FF00000084000000C6C6C600FFFFFF008400
        00008400000084000000840000000000000000000000FFFFFF00FFFFFF008400
        00008400000084000000FF00000084000000FF000000C6C6C600FFFFFF008400
        00008400000084000000000000008400000000000000FFFFFF00FFFFFF008400
        000084000000FF00000084000000FF000000C6C6C600C6C6C600C6C6C600FF00
        00008400000084000000840000000000000000000000FFFFFF00FFFFFF008400
        0000FF00000084000000FF000000FF000000FF000000FF000000840000008400
        00008400000084000000000000008400000000000000FFFFFF00FF00FF00FFFF
        FF0084000000FF00000084000000FF000000FF000000C6C6C600FFFFFF00FF00
        000084000000840000008400000000000000FFFFFF00FF00FF00FF00FF00FFFF
        FF008400000084000000FF0000008400000084000000C6C6C600C6C6C6008400
        000084000000840000008400000000000000FFFFFF00FF00FF00FF00FF00FF00
        FF00FFFFFF00840000008400000084000000FF00000084000000840000008400
        0000840000008400000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FFFFFF00FFFFFF00840000008400000084000000840000008400
        000084000000FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentDoubleBuffered = False
      TabOrder = 9
      OnClick = BitBtn3Click
    end
    object Memo1: TMemo
      Left = 577
      Top = 198
      Width = 199
      Height = 96
      Lines.Strings = (
        'Memo1')
      TabOrder = 10
    end
  end
  object MainGridMDR: TDBGridEh
    Left = 0
    Top = 316
    Width = 892
    Height = 191
    Align = alClient
    DataSource = dmReportAnalysOfDeposit.FilialMDRds
    FooterColor = clWindow
    FooterFont.Charset = RUSSIAN_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Azl Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDblClickOptimizeColWidth]
    TabOrder = 2
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    OnDblClick = MainGridMDRDblClick
    OnTitleBtnClick = MainGridMDRTitleBtnClick
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
        Width = 172
      end
      item
        EditButtons = <>
        FieldName = 'DPCOUNT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'CEOFCOUNT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 87
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
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'FACTICALDEBT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'CEOFFACTICALDEBT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'FACTICALINTERESTDEBT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'CEOFFACTICALINTERESTDEBT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'ROUNDINT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 87
      end>
  end
  object expSumdsMDR: TCMExcelExport
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
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'MS Sans Serif'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 696
    Top = 168
  end
end
