object frmReportOfturnoverDeposit: TfrmReportOfturnoverDeposit
  Left = 146
  Top = 121
  Width = 864
  Height = 553
  Caption = 'frmReportOfturnoverDeposit'
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 864
    Height = 316
    Align = alTop
    Caption = #1046#1103#1083#1073' '#1086#1083#1091#1085#1084#1091#1096' '#1074#1103#1089#1072#1080#1090#1083#1103#1088#1080#1085' '#1076#1102#1074#1088#1080#1081#1081#1103#1089#1080' '#1097#1072#1075#1075#1099#1085#1076#1072' '#1097#1077#1089#1072#1073#1072#1090
    TabOrder = 0
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
      Width = 860
      Height = 149
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      object GroupBox2: TGroupBox
        Left = 185
        Top = 2
        Width = 183
        Height = 145
        Align = alLeft
        Caption = #1052#1103#1085#1073#1103
        TabOrder = 0
        object ESource: TEvanescence
          Left = 2
          Top = 32
          Width = 176
          Height = 109
          ItemHeight = 14
          TabOrder = 0
          DataSource = dmReportOfturnoverDeposit.SourceMDds
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
        TabOrder = 1
        object EFilial: TEvanescence
          Left = 2
          Top = 32
          Width = 176
          Height = 109
          ItemHeight = 14
          TabOrder = 0
          DataSource = dmReportOfturnoverDeposit.FilialMDds
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
      object GroupBox3: TGroupBox
        Left = 368
        Top = 2
        Width = 180
        Height = 145
        Align = alLeft
        TabOrder = 2
        object Label1: TLabel
          Left = 3
          Top = 6
          Width = 82
          Height = 14
          Caption = #1044#1102#1074#1088#1094#1085' '#1103#1074#1074#1103#1083#1080
        end
        object Label2: TLabel
          Left = 4
          Top = 46
          Width = 68
          Height = 14
          Caption = #1044#1102#1074#1088#1094#1085' '#1089#1086#1085#1091
        end
        object DTPBegin: TDateTimePicker
          Left = 3
          Top = 22
          Width = 125
          Height = 21
          Date = 39784.691438078700000000
          Time = 39784.691438078700000000
          TabOrder = 0
        end
        object DTPEnd: TDateTimePicker
          Left = 4
          Top = 61
          Width = 125
          Height = 21
          Date = 39784.691438078700000000
          Time = 39784.691438078700000000
          TabOrder = 1
        end
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
        DataSource = dmReportOfturnoverDeposit.ValuteMDds
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
        DataSource = dmReportOfturnoverDeposit.TypeMDds
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
        DataSource = dmReportOfturnoverDeposit.CalcStatusMDds
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
      Left = 375
      Top = 103
      Width = 81
      Height = 27
      DoubleBuffered = True
      Kind = bkOK
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 7
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 375
      Top = 132
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
      TabOrder = 8
      OnClick = BitBtn2Click
    end
    object Memo1: TMemo
      Left = 551
      Top = 172
      Width = 217
      Height = 131
      Lines.Strings = (
        'Memo1')
      TabOrder = 9
      Visible = False
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 473
    Width = 864
    Height = 80
    Align = alBottom
    Caption = #1046#1103#1084
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 16
      Width = 860
      Height = 62
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = dmReportOfturnoverDeposit.SumMDTds
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
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'BCOUNTDEP'
          Footers = <>
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Title.TitleButton = True
          Width = 70
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
          Title.TitleButton = True
          Width = 102
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
          Title.TitleButton = True
          Width = 103
        end
        item
          EditButtons = <>
          FieldName = 'TRCOUNTDEP'
          Footers = <>
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Title.TitleButton = True
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'TRAMOUNT'
          Footers = <>
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Title.TitleButton = True
          Width = 102
        end
        item
          EditButtons = <>
          FieldName = 'CAPAMOUNT'
          Footers = <>
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Title.TitleButton = True
          Width = 102
        end
        item
          EditButtons = <>
          FieldName = 'PAYCOUNTDEP'
          Footers = <>
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Title.TitleButton = True
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'MAINPAY'
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
          FieldName = 'INTPAY'
          Footers = <>
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Title.TitleButton = True
          Width = 102
        end
        item
          EditButtons = <>
          FieldName = 'ECOUNTDEP'
          Footers = <>
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Title.TitleButton = True
          Width = 70
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
          Title.TitleButton = True
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
          Title.TitleButton = True
          Width = 102
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object MainGridMDR: TDBGridEh
    Left = 0
    Top = 316
    Width = 864
    Height = 157
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = dmReportOfturnoverDeposit.MainMDTds
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
    TabOrder = 2
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    OnDblClick = MainGridMDRDblClick
    Columns = <
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
        Width = 178
      end
      item
        EditButtons = <>
        FieldName = 'BCOUNTDEP'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 70
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
        Title.TitleButton = True
        Width = 102
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
        Title.TitleButton = True
        Width = 102
      end
      item
        EditButtons = <>
        FieldName = 'TRCOUNTDEP'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'TRAMOUNT'
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
        FieldName = 'CAPAMOUNT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 102
      end
      item
        EditButtons = <>
        FieldName = 'PAYCOUNTDEP'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'MAINPAY'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 102
      end
      item
        EditButtons = <>
        FieldName = 'INTPAY'
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
        FieldName = 'ECOUNTDEP'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 70
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
        Title.TitleButton = True
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
        Title.TitleButton = True
        Width = 102
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object EEMDT: TCMExcelExport
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
    Left = 464
    Top = 105
  end
end
