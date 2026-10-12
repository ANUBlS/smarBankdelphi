object FrmAEx: TFrmAEx
  Left = 263
  Top = 97
  ClientHeight = 767
  ClientWidth = 1245
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
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1245
    Height = 43
    ButtonHeight = 37
    ButtonWidth = 126
    Caption = 'ToolBar1'
    Images = ImageList1
    ShowCaptions = True
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = ActnRefresh
      ImageIndex = 0
    end
    object ToolButton2: TToolButton
      Left = 126
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 134
      Top = 0
      Action = ActnCreditProperties
      ImageIndex = 3
    end
    object ToolButton4: TToolButton
      Left = 260
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 268
      Top = 0
      Action = ActnExport
      ImageIndex = 2
    end
    object ToolButton6: TToolButton
      Left = 394
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton13: TToolButton
      Left = 402
      Top = 0
      Action = ActnPayment
      ImageIndex = 7
    end
    object ToolButton10: TToolButton
      Left = 528
      Top = 0
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 536
      Top = 0
      Caption = #1040#1093#1090#1072#1088#1099#1096' '#1087#1072#1085#1077#1083#1080
      ImageIndex = 6
      ParentShowHint = False
      ShowHint = False
      Style = tbsCheck
      OnClick = ToolButton9Click
    end
    object ToolButton8: TToolButton
      Left = 662
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton11: TToolButton
      Left = 670
      Top = 0
      Action = ActnFilter
      ImageIndex = 1
      Style = tbsCheck
    end
    object ToolButton12: TToolButton
      Left = 796
      Top = 0
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 804
      Top = 0
      Caption = #1041#1072#1100#1083#1072
      ImageIndex = 5
      OnClick = ToolButton7Click
    end
    object ToolButton14: TToolButton
      Left = 930
      Top = 0
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object GRDate: TGroupBox
      Left = 938
      Top = 0
      Width = 154
      Height = 37
      Caption = #1058#1072#1088#1080#1093
      TabOrder = 0
      object DTPExp: TDateTimePicker
        Left = 3
        Top = 13
        Width = 145
        Height = 20
        Date = 39065.535116817090000000
        Time = 39065.535116817090000000
        TabOrder = 0
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 748
    Width = 1245
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 182
    Top = 43
    Width = 1063
    Height = 705
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object PanelSearch: TPanel
      Left = 2
      Top = 655
      Width = 1059
      Height = 48
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      Visible = False
      object Panel3: TPanel
        Left = 110
        Top = 2
        Width = 172
        Height = 44
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object StaticText5: TStaticText
          Left = 2
          Top = 2
          Width = 168
          Height = 18
          Align = alTop
          Alignment = taCenter
          Caption = #1065#1077#1089#1072#1073#1099#1085' '#8470'-'#1089#1080
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object EditContractaccno: TEdit
          Left = 2
          Top = 19
          Width = 167
          Height = 22
          TabOrder = 1
          OnExit = EditNumberofcreditExit
          OnKeyPress = EditNumberofcreditKeyPress
        end
      end
      object Panel4: TPanel
        Left = 480
        Top = 2
        Width = 144
        Height = 44
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object StaticText4: TStaticText
          Left = 2
          Top = 2
          Width = 140
          Height = 18
          Align = alTop
          Alignment = taCenter
          Caption = #1071#1089#1072#1089' '#1073#1086#1088#1078#1076#1072#1085' '
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object EditPRINCIPAL: TEdit
          Left = 2
          Top = 19
          Width = 135
          Height = 22
          TabOrder = 1
          OnExit = EditNumberofcreditExit
          OnKeyPress = EditNumberofcreditKeyPress
        end
      end
      object Panel6: TPanel
        Left = 282
        Top = 2
        Width = 198
        Height = 44
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object StaticText2: TStaticText
          Left = 2
          Top = 2
          Width = 194
          Height = 18
          Align = alTop
          Alignment = taCenter
          Caption = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object EditName: TEdit
          Left = 2
          Top = 19
          Width = 193
          Height = 22
          TabOrder = 1
          OnExit = EditNumberofcreditExit
          OnKeyPress = EditNumberofcreditKeyPress
        end
      end
      object Panel7: TPanel
        Left = 2
        Top = 2
        Width = 108
        Height = 44
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 3
        object StaticText1: TStaticText
          Left = 2
          Top = 2
          Width = 104
          Height = 18
          Align = alTop
          Alignment = taCenter
          Caption = #1052#1094#1075#1072#1074#1080#1083#1103#1085#1080#1085' '#8470'-'#1089#1080
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object EditNumberofcredit: TEdit
          Left = 2
          Top = 19
          Width = 133
          Height = 22
          TabOrder = 1
          OnExit = EditNumberofcreditExit
          OnKeyPress = EditNumberofcreditKeyPress
        end
      end
    end
    object DBGridEhMain: TDBGridEh
      Left = 2
      Top = 2
      Width = 1059
      Height = 653
      Align = alClient
      AllowedOperations = []
      DataGrouping.GroupLevels = <>
      DataSource = DatModAex.DatSrcExpCredits
      Flat = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = 'Azl Sans Serif'
      FooterFont.Style = []
      FrozenCols = 4
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDblClickOptimizeColWidth, dghColumnResize, dghColumnMove]
      ParentFont = False
      RowDetailPanel.Color = clBtnFace
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -12
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      OnTitleBtnClick = DBGridEhMainTitleBtnClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NUMBEROFCREDIT'
          Footers = <>
          Title.Color = clNavy
          Title.TitleButton = True
          Width = 96
        end
        item
          EditButtons = <>
          FieldName = 'CONTRACTACCNO'
          Footers = <>
          Title.Color = clNavy
          Title.TitleButton = True
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'VAL_NAME'
          Footers = <>
          Title.Color = clNavy
          Title.TitleButton = True
          Width = 25
        end
        item
          EditButtons = <>
          FieldName = 'OPENDATE'
          Footers = <>
          Title.Color = clNavy
          Title.TitleButton = True
          Width = 103
        end
        item
          EditButtons = <>
          FieldName = 'CLOSEDATE'
          Footers = <>
          Title.Color = clNavy
          Title.TitleButton = True
          Width = 89
        end
        item
          EditButtons = <>
          FieldName = 'ANNUALYINTERESTRATE'
          Footers = <>
          Title.Color = clNavy
          Title.TitleButton = True
          Width = 52
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Footers = <>
          Title.Caption = 'M'#252#351't'#601'rinin ad'#305
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Title.TitleButton = True
          Width = 192
        end
        item
          EditButtons = <>
          FieldName = 'FILIAL'
          Footers = <>
          Title.Caption = 'Filial'
          Width = 212
        end
        item
          EditButtons = <>
          FieldName = 'ANYINFOTODISTING'
          Footers = <>
          Width = 78
        end
        item
          EditButtons = <>
          FieldName = 'AFTONO'
          Footers = <>
          Width = 83
        end
        item
          EditButtons = <>
          FieldName = 'KREDITTIP'
          Footers = <>
          Title.Caption = 'Kreditin tipi'
          Width = 115
        end
        item
          EditButtons = <>
          FieldName = 'EXPDATCOUNT'
          Footers = <>
          Title.Color = clNavy
          Title.TitleButton = True
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'PRINCIPAL'
          Footers = <>
          Title.Color = clNavy
          Title.TitleButton = True
          Width = 119
        end
        item
          Color = clInactiveBorder
          EditButtons = <>
          FieldName = 'INTERESTREST'
          Footers = <>
          Title.Color = clNavy
          Width = 82
        end
        item
          EditButtons = <>
          FieldName = 'SUMAMT'
          Footers = <>
          Title.Color = clNavy
          Title.TitleButton = True
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'REST'
          Footers = <>
          Title.Caption = #1071#1089#1072#1089' '#1073#1086#1088#1078' '#1075#1072#1083#1099#1075
          Title.Color = clNavy
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'DUEREST'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'PENALTYREST'
          Footers = <>
          Title.Color = clNavy
          Title.TitleButton = True
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'CUSTACCREST'
          Footers = <>
          Title.Color = clNavy
          Title.TitleButton = True
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'EXPERT'
          Footers = <>
          Title.Color = clNavy
          Width = 172
        end
        item
          EditButtons = <>
          FieldName = 'QOVLUQ'
          Footers = <>
          Title.Color = clNavy
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'PART'
          Footers = <>
          Title.Color = clNavy
          Width = 193
        end
        item
          EditButtons = <>
          FieldName = 'SHERT'
          Footers = <>
          Title.Color = clNavy
          Width = 202
        end
        item
          EditButtons = <>
          FieldName = 'PLR'
          Footers = <>
          Title.Color = clNavy
          Title.TitleButton = True
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'SALARY'
          Footers = <>
          Title.Color = clNavy
          Title.TitleButton = True
          Width = 215
        end
        item
          EditButtons = <>
          FieldName = 'PHONENUMBER'
          Footers = <>
          Title.Color = clNavy
          Title.TitleButton = True
          Width = 295
        end
        item
          EditButtons = <>
          FieldName = 'CREDITEND'
          Footers = <>
          Title.Color = clNavy
          Width = 107
        end
        item
          EditButtons = <>
          FieldName = 'GUARANTORNAME'
          Footers = <>
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'ZAMINWORK1'
          Footers = <>
          Title.Color = clNavy
          Width = 160
        end
        item
          EditButtons = <>
          FieldName = 'ZAMINTEL1'
          Footers = <>
          Title.Color = clNavy
          Width = 110
        end
        item
          EditButtons = <>
          FieldName = 'ZMTELMOB1'
          Footers = <>
          Title.Color = clNavy
          Width = 110
        end
        item
          EditButtons = <>
          FieldName = 'NAME2'
          Footers = <>
          Title.Color = clNavy
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'WR2'
          Footers = <>
          Title.Color = clNavy
          Width = 160
        end
        item
          EditButtons = <>
          FieldName = 'EVTEL2'
          Footers = <>
          Title.Color = clNavy
          Width = 110
        end
        item
          EditButtons = <>
          FieldName = 'MOBTEL2'
          Footers = <>
          Title.Color = clNavy
        end
        item
          EditButtons = <>
          FieldName = 'DAT'
          Footers = <>
          Title.Color = clNavy
          Width = 114
        end
        item
          EditButtons = <>
          FieldName = 'MAXPAY'
          Footers = <>
          Title.Color = clNavy
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object PanelFilter: TPanel
    Left = 0
    Top = 43
    Width = 182
    Height = 705
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    Visible = False
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 178
      Height = 22
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 159
        Top = 2
        Width = 19
        Height = 18
        Caption = 'X'
        OnClick = SpeedButton1Click
      end
      object Panel8: TPanel
        Left = 2
        Top = 2
        Width = 156
        Height = 18
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = clNavy
        TabOrder = 0
      end
    end
    object GroupBox8: TGroupBox
      Left = 2
      Top = 24
      Width = 178
      Height = 73
      Align = alTop
      Caption = #1042#1072#1083#1081#1091#1090#1072
      TabOrder = 1
      object CBValute: TDBLookupComboboxEh
        Left = 5
        Top = 19
        Width = 167
        Height = 22
        DropDownBox.Sizable = True
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'VALUTE'
        ListField = 'VALU_NAME'
        ListSource = DatModAex.DatSrcValute
        ParentFont = False
        TabOrder = 0
        Visible = True
        OnChange = ActnExecuteFilterExecute
      end
      object ChBValute: TCheckBox
        Left = 9
        Top = 47
        Width = 104
        Height = 19
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 1
        OnClick = ActnExecuteFilterExecute
      end
    end
    object GroupBox7: TGroupBox
      Left = 2
      Top = 97
      Width = 178
      Height = 73
      Align = alTop
      Caption = #1060#1080#1083#1080#1072#1083
      TabOrder = 2
      object CBFilial: TDBLookupComboboxEh
        Left = 5
        Top = 20
        Width = 167
        Height = 22
        DropDownBox.Sizable = True
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = DatModAex.DatSrcFilials
        ParentFont = False
        TabOrder = 0
        Visible = True
        OnChange = ActnExecuteFilterExecute
      end
      object ChBFilial: TCheckBox
        Left = 9
        Top = 48
        Width = 104
        Height = 19
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 1
        OnClick = ActnExecuteFilterExecute
      end
    end
    object GroupBox6: TGroupBox
      Left = 2
      Top = 170
      Width = 178
      Height = 73
      Align = alTop
      Caption = #1041#1086#1088#1078#1072#1083#1072#1085#1099#1085' '#1090#1080#1087#1080
      TabOrder = 3
      object CBPersons: TDBLookupComboboxEh
        Left = 5
        Top = 20
        Width = 167
        Height = 22
        DropDownBox.Sizable = True
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'DESCRIPION'
        ListSource = DatModAex.DatSrcPersons
        ParentFont = False
        TabOrder = 0
        Visible = True
        OnChange = ActnExecuteFilterExecute
      end
      object ChBPersons: TCheckBox
        Left = 9
        Top = 48
        Width = 104
        Height = 19
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 1
        OnClick = ActnExecuteFilterExecute
      end
    end
    object GroupBox5: TGroupBox
      Left = 2
      Top = 243
      Width = 178
      Height = 74
      Align = alTop
      Caption = #1041#1086#1088#1078#1072#1083#1072#1085#1099#1085' '#1082#1072#1090#1077#1101#1086#1088#1080#1081#1072#1089#1099
      TabOrder = 4
      object CBCategories: TDBLookupComboboxEh
        Left = 5
        Top = 20
        Width = 167
        Height = 22
        DropDownBox.Sizable = True
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = DatModAex.DatSrctCategories
        ParentFont = False
        TabOrder = 0
        Visible = True
        OnChange = ActnExecuteFilterExecute
      end
      object ChBCategories: TCheckBox
        Left = 9
        Top = 48
        Width = 104
        Height = 19
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 1
        OnClick = ActnExecuteFilterExecute
      end
    end
    object GroupBox4: TGroupBox
      Left = 2
      Top = 317
      Width = 178
      Height = 73
      Align = alTop
      Caption = #1050#1088#1077#1076#1080#1090#1080#1085' '#1090#1080#1087#1080
      TabOrder = 5
      object CBCreditTypes: TDBLookupComboboxEh
        Left = 5
        Top = 20
        Width = 167
        Height = 22
        DropDownBox.Sizable = True
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = DatModAex.DatSrcCreditTypes
        ParentFont = False
        TabOrder = 0
        Visible = True
        OnChange = ActnExecuteFilterExecute
      end
      object ChBCreditTypes: TCheckBox
        Left = 9
        Top = 48
        Width = 104
        Height = 19
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 1
        OnClick = ActnExecuteFilterExecute
      end
    end
    object GroupBox3: TGroupBox
      Left = 2
      Top = 390
      Width = 178
      Height = 73
      Align = alTop
      Caption = #1050#1088#1077#1076#1080#1090#1080#1085' '#1090#1103#1089#1085#1080#1092#1072#1090#1099
      TabOrder = 6
      object CBreserves: TDBLookupComboboxEh
        Left = 5
        Top = 20
        Width = 167
        Height = 22
        DropDownBox.Sizable = True
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = DatModAex.DatSrcReserves
        ParentFont = False
        TabOrder = 0
        Visible = True
        OnChange = ActnExecuteFilterExecute
      end
      object ChBreserves: TCheckBox
        Left = 9
        Top = 48
        Width = 104
        Height = 19
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 1
        OnClick = ActnExecuteFilterExecute
      end
    end
  end
  object ImageList1: TImageList
    Left = 241
    Top = 408
    Bitmap = {
      494C010108001000080010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001000000000000018
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000596B596B596B596B596B596B596B
      596B596B596B596B596B596B596B596B596B596B596B596B596B596B596B596B
      596B596B596B596B596B596B596B596B596BFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F596B596B596B596B1042596B596B
      596B596B596B596B596B596B596B596B596B596B596B596B596B596B596B596B
      596B596B596B596B596B596B596B596B596B596B596B596B1042596B1042596B
      596B10420000FF03596B596B1042596B596BFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F596B596B596BFF031042596B0000
      596B596B0000596B0000596B596B0000596B596B596B596B596B596B7A6F6B2D
      000000006B2D0000596B596B596B596B596B1042596B1042596B596B1042596B
      1042596B0000FF0310021042596B596B1042FF7FC6180000000000000000FF7F
      FF7FFF7FFF7F00000000000000000000FF7F596B596BFF031002596BFF7F0000
      596B596B596B596B0000FF7F596B596B596B596B596B596B000053528000C002
      E003E003C002800053520000596B596B596B596B596B1042596B1042596B596B
      1042596B0000FF031002100200001042596BFF7FC6180000186300000000FF7F
      FF7FFF7FFF7F00001863000000000000FF7F596BFF031002E003000000001002
      1042596B0000596B0000596BFF7F596B596B596B596B596BF24EC001E0038003
      A002A0028003E0038001524E596B596B596B596B596B596B596B596B596B1042
      596B596B0000FF031002100200001042596BFF7FC6180000186300000000FF7F
      FF7FFF7FFF7F00001863000000000000FF7FFF031002E003E003E003E003E003
      FF031042596B596B596B00000000596B596B596B596B596B0B32E003E003692A
      F45AF45A692AA003C0036A2C596B596B596B596B596B596B596B596B596B0000
      000000000000FF031002100200001042596BFF7FC6180000420800000000630C
      630C9452630C00004208000000000000FF7F596BFF03E003E003E003E003E003
      E003FF031042596B596B596B596B596B596B596B596B596B4003E003071C0000
      596B00000000E61DE0038002596B596B596B596B596B596B596B000010421042
      104210420000FF031002100200001042596BFF7FC61800000000CE3900000000
      00000000734E00000000000000000000FF7F00001002FF03E003E0031002E003
      1002E003FF031042596B0000596B0000596B596B596B596B2003E00346180000
      596B9B730000061AE0036002596B596B596B596B596B596B596B000010021042
      104210420000FF030000100200001042596BFF7FC61800000000CE3900000000
      18630000734E00000000000000000000FF7F0000E003596BFF03E00310021002
      E003E003E003FF0310420000596B0000596B596B596B596B4003E003071C0000
      0000E924355A0822E003A002596B596B596B596B1042104210420000FF031002
      104210420000FF03FF7F100200001042596BFF7F4A29A51400008C3100000000
      9452000010420000000000000000A514FF7F596B000010021002FF03E0031002
      1002E003E003E003FF031042596B596B596B596B596B596B4926C00380028F41
      00000002C1058002C003E924596B596B596B00001002100210021002FF03FF03
      100210420000FF031002100200001042596BFF7FFF7FFF7FEF3D841042080000
      00002925292500000000C618EF3DFF7FFF7F596B596B00001002596BFF03E003
      E003E0031002E0031002FF031042596B596B596B596B596B6D3A8003A002B045
      00002002E003E003E0024D39596B596B596B0000FF03FF7FFF7FFF7FFF7FFF7F
      FF0300000000FF031002100200001042596BFF7FFF7FFF7FFF7F420821040000
      0000734E8410000000008C31FF7FFF7FFF7F596B596B596B00001002596BFF03
      E003E003E0031002FF031042596B596B596B596B596B596B00006C32AF420000
      00002002E003E0036001B65E596B596B596B596B0000000000000000FF7FFF03
      000010420000FF031002100200001042596BFF7FFF7FFF7FFF7F000000000000
      0000734E0000000000008C31FF7FFF7FFF7F596BE07FE07F596B00001002596B
      FF0310021002FF03100200001042596B596B596B596B596B596B5A6F5A6F596B
      0000C001600260026002661C596B596B596B596B596B596B596B0000FF030000
      104210420000FF031002100200001042596BFF7FFF7FFF7FFF7F734E00000000
      FF7FFF7FC61800000000FF7FFF7FFF7FFF7F0000E07FE07F0000596B00001002
      1002FF03FF03100210020000596B596B596B596B596B596B596B596B596B596B
      596B596B596B596B596B596B596B596B596B596B596B596B596B000000001042
      104210421042FF031002100200001042596BFF7FFF7FFF7FFF7F734E524A0000
      FF7FFF7FC618F75E0000FF7FFF7FFF7FFF7F596BE07FE07F596B596B596B0000
      1002596B100210020000596B596B596B596B596B596B596B596B596B596B596B
      596B596B596B596B596B596B596B596B596B596B596B596B596B596B596B1042
      1042104210421042FF03100200001042596BFF7FFF7FFF7FFF7FF75E6B2D6B2D
      FF7FFF7FEF3D6B2D6B2DFF7FFF7FFF7FFF7F596B596B596B0000596B0000596B
      0000E00310020000596B596B596B596B596B596B596B596B596B596B596B596B
      596B596B596B596B596B596B596B596B596B596B596B596B596B596B596B1042
      10421042104210421042FF030000596B596BFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F596B596B596B0000596B0000596B
      596B00000000596B596B596B596B596B596B7A6F7A6F7A6F7A6F7A6F7A6F7A6F
      7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F0000000000000000000000000000
      0000000010421863000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000008A180000000000000000000000007A6F7A6F7A6F7A6F7A6F7A6F7A6F
      7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F0000000000000000000000000000
      0000FF7F0000E07FE07F00420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000793A0F190000000000000000000000007A6F7A6F7A6F7A6F7A6F7A6F7A6F
      7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F0000000000000000000000000000
      0000FF7F0000E07FE07F00420000000000000000000000000000000000020002
      0002000200020002000200020002000200020000000000000000000000000000
      B9461D4F50250000000000000000000000007A6F7A6F7A6F7A6F7A6F7A6F7A6F
      8C31A104830C4209030D734E7A6F7A6F7A6F0000000018631042000000000000
      0000FF7F0000E07FE07F0042000000000000000000000000000000000002FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0002000000000000000090359129F431
      98421D4F363669108A1800000000000000007A6F7A6F7A6F7A6F7A6F7A6F7A6F
      830C524F0E3BEC36C92AA61AB5567A6F7A6FFF7F0000E07FE07F00420000FF7F
      0000FF7F0000E07FE07F0042000000000000000000000000000000000002FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000200000000764A773E9846BA46FB4A
      3D535F57FB4A9846573A69100000000000007A6F7A6F7A6F7A6F7A6F7A6F7A6F
      165B75573043EB2E8821A82240007A6F7A6FFF7F0000E07FE07F00420000FF7F
      0000FF7F0000E07FE07F00420000000000000000000000000000000000020002
      0002000200020002FF7F00020002FF7F000200007746B84A1B537F5F3E57FA25
      192A7C36192A5F5BFC4E98460E1D000000007A6F7A6F7A6F7A6F8C311042B556
      765B524F2F43E9259C73282260007A6F7A6FFF7F0000E07FE07F00420000FF7F
      0000FF7F0000E07FE07F0042000000000000000000000000000000000002FF7F
      000200020002FF7F00020002FF7FFF7F00027646B84E5D5F9F639F639F63583A
      B200F008BF677F5F7F5F1D53B846691000007A6F7A6F7A6F734E64127A6F7B6F
      CE39CE39E71CE71C39678412CE397A6F7A6FFF7F0000E07FE07F00420000FF7F
      0000104200420042E07FFF7FE07F00000000000000000000000000000002FF7F
      FF7F0002FF7F0002000200020002FF7F0002974E3C5B9F6B9F679F679F67783E
      D30054159F679F639F639F631C5798428A187A6F7A6F7A6F030DE410CE39C410
      0000A514E71C734EE71CA1047A6F7A6F7A6F104200420042E07FFF7FE07F0000
      000000000000104210421042000000000000000000000000000000000002FF7F
      FF7FFF7F000200020002FF7FFF7FFF7F00021A5B9F6BBF6BBF6BBF6BBF6B783E
      D30074199F679F679F679F637F63FA52EC247A6F7A6F7A6FEB32A1049C73F556
      EC36C92AC8261042734E7A6F7A6F7A6F7A6F0000000010421042104200000000
      000000000000000000000000000000000000000000000000000000000002FF7F
      FF7F00020002000200020002FF7FFF7F00023A5FBF6FBF6FBF6FBF6FBF6F7842
      D3007419BF6B9F6B9F679F679F673B5BEC247A6F7A6F7A6FAD3ACA2A43113147
      30470D37EE3E7A6F7A6F7A6F7A6F7A6F7A6F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000020002
      00020002FF7FFF7F000200020002FF7F00023B63DF73DF73DF73DF73DF73951D
      D3007419DF6FBF6BBF6BBF6BBF6F3B5B0D297A6F7A6F7A6F630C765B9863975F
      765B3043671D7A6F7A6F7A6F7A6F7A6F7A6F0000000000000000000000000000
      000000001042000000000000000000000000000000000000000000000002FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00025B6BDF77DF77DF77DF771B5BF431
      B32DF431DF73BF6FBF6FBF6FDF6F5C6300007A6F7A6F7A6F7A6FA514F556F556
      C6184721E71C7A6F7A6F7A6F7A6F7A6F7A6F0000000000000000000000001042
      0000104200000000000000000000000000000000000000000000000000020002
      0002000200020002000200020002000200027C6BBD73FF7FFF7BFF7BDF77FF7B
      7E63FF77DF77DF73DF73FF7F9E6B354200007A6F7A6F7A6F7A6F7A6F7A6F7A6F
      7A6F7B6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F0000000000000000000010420000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C6FDE77FF7FFF7BFF7B5119
      9815951DFF7BFF7BFF7FBE737D67000000007A6F7A6F7A6F7A6F7A6F7A6F7A6F
      7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C73DE7BFF7FFF7F974E
      2A00D952FF7FFF7FDE775C670000000000007A6F7A6F7A6F7A6F7A6F7A6F7A6F
      7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000DE77BD77DE7BFF7F
      FF7FFF7FDE7BBE73DE770000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0020000000000000100800000000000000000000000000000000000000000000
      02C0000000000000024000000000000003000000000000000100000000000000
      0100000000000000130000000000000001000000000000000000000000000000
      000000000000000000000000000000000000FF83FFFFFFBF0000FF03FFFFFF3F
      0000FF03F800FE3F0000C703F800F00F00000103F800C00700000103B8008003
      00000103980000010000010108000000000001C7080000000000C7FF98000000
      0000FFEFB80000000000FE8FF80000010000ED7FF80000010000F2FFFFFF8003
      0000ED7FFFFFC0070000FD7FFFFFE00F00000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Left = 304
    Top = 408
    object ActnRefresh: TAction
      Caption = #1049#1077#1085#1080#1083#1103#1084#1103#1082
      OnExecute = ActnRefreshExecute
    end
    object ActnCreditProperties: TAction
      Caption = #1050#1088#1077#1076#1080#1090#1080#1085' '#1074#1077#1088#1080#1083#1103#1085#1083#1103#1088#1080
      OnExecute = ActnCreditPropertiesExecute
    end
    object ActnExport: TAction
      Caption = 'Export'
      OnExecute = ActnExportExecute
    end
    object ActnSearch: TAction
      Caption = #1040#1093#1090#1072#1088#1099#1096
      OnExecute = ActnSearchExecute
    end
    object ActnFilter: TAction
      Caption = #1060#1080#1083#1090#1077#1088' '#1087#1072#1085#1077#1083#1080
      OnExecute = ActnFilterExecute
    end
    object ActnExecuteFilter: TAction
      Caption = 'ActnExecuteFilter'
      OnExecute = ActnExecuteFilterExecute
    end
    object ActnPayment: TAction
      Caption = #1070#1076#1103#1085#1080#1096
      OnExecute = ActnPaymentExecute
    end
  end
  object ExcelExport: TCMExcelExport
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
    Left = 352
    Top = 272
  end
end
