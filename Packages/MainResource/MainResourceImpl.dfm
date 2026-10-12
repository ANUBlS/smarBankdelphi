object MainResource: TMainResource
  Left = 519
  Top = 241
  Width = 982
  Height = 497
  AxBorderStyle = afbRaised
  Caption = 'MainResource'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTool: TPanel
    Left = 0
    Top = 0
    Width = 982
    Height = 45
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object ToolBarMain: TToolBar
      Left = 2
      Top = 2
      Width = 978
      Height = 41
      Align = alClient
      ButtonHeight = 36
      ButtonWidth = 95
      Caption = 'ToolBarMain'
      DrawingStyle = dsGradient
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Images = ImageList
      ParentFont = False
      ShowCaptions = True
      TabOrder = 0
      object PanelChange: TPanel
        Left = 0
        Top = 0
        Width = 105
        Height = 36
        TabOrder = 0
        object RButtonNB: TRadioButton
          Left = 4
          Top = 2
          Width = 95
          Height = 17
          Caption = 'Maliyy'#601
          Checked = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TabStop = True
          OnClick = RButtonNBClick
        end
        object RButtonNL: TRadioButton
          Left = 2
          Top = 18
          Width = 93
          Height = 17
          Caption = 'Vergi'
          TabOrder = 1
          OnClick = RButtonNLClick
        end
      end
      object ToolBtnC: TToolButton
        Left = 105
        Top = 0
        Width = 8
        Caption = 'ToolBtnC'
        ImageIndex = 32
        Style = tbsSeparator
      end
      object CalcAmort: TToolButton
        Left = 113
        Top = 0
        Caption = ' Hesabla '
        DropdownMenu = PMenuCalc
        ImageIndex = 0
        Style = tbsDropDown
        OnClick = CalcAmortClick
      end
      object ToolBtnD: TToolButton
        Left = 221
        Top = 0
        Width = 8
        Caption = 'ToolBtnD'
        ImageIndex = 32
        Style = tbsSeparator
      end
      object ToolTrans: TToolButton
        Left = 229
        Top = 0
        AutoSize = True
        Caption = '    '#399'm'#601'liyyatlar  '
        DropdownMenu = PMenuTrans
        ImageIndex = 1
        Style = tbsDropDown
      end
      object ToolBtnF: TToolButton
        Left = 331
        Top = 0
        Width = 8
        Caption = 'ToolBtnF'
        ImageIndex = 33
        Style = tbsSeparator
      end
      object ToolButtonTurn: TToolButton
        Left = 339
        Top = 0
        Caption = '    Hesabat   '
        DropdownMenu = PMenuCurrentTrun
        ImageIndex = 7
        Style = tbsDropDown
      end
      object ToolBtnK: TToolButton
        Left = 447
        Top = 0
        Width = 8
        Caption = 'ToolBtnK'
        ImageIndex = 35
        Style = tbsSeparator
      end
      object ToolButtonTurnGeneral: TToolButton
        Left = 455
        Top = 0
        Caption = '  B'#252't'#252'n d'#246'vriy'#601'l'#601'r '
        DropdownMenu = PMenuToolBar
        ImageIndex = 15
        Style = tbsDropDown
      end
      object ToolBtnM: TToolButton
        Left = 563
        Top = 0
        Width = 8
        Caption = 'ToolBtnM'
        ImageIndex = 32
        Style = tbsSeparator
      end
      object TBtnFilter: TToolButton
        Left = 571
        Top = 0
        Caption = 'Filter'
        DropdownMenu = PopupMenuFilter
        ImageIndex = 31
        Style = tbsDropDown
      end
      object ToolBtnL: TToolButton
        Left = 679
        Top = 0
        Width = 7
        Caption = 'ToolBtnL'
        ImageIndex = 32
        Style = tbsSeparator
      end
      object TButtonOption: TToolButton
        Left = 686
        Top = 0
        AutoSize = True
        Caption = '      Sazlama     '
        DropdownMenu = PExpiredRepar
        ImageIndex = 23
        Style = tbsDropDown
        OnClick = TButtonOptionClick
      end
      object ToolBtnP: TToolButton
        Left = 782
        Top = 0
        Width = 8
        Caption = 'ToolBtnP'
        ImageIndex = 32
        Style = tbsSeparator
      end
      object RadioButton1: TRadioButton
        Left = 790
        Top = 0
        Width = 113
        Height = 36
        Caption = 'RadioButton1'
        TabOrder = 1
        Visible = False
      end
    end
  end
  object GBoxNL: TGroupBox
    Left = 0
    Top = 45
    Width = 982
    Height = 452
    Align = alClient
    Caption = 'Vergi'
    TabOrder = 1
    object DBGridEhWaresNL: TDBGridEh
      Left = 2
      Top = 153
      Width = 978
      Height = 243
      Align = alClient
      Color = 15855856
      DataGrouping.GroupLevels = <>
      DataSource = DataModWares.DSWares
      FixedColor = 9512207
      Flat = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Azl Sans Serif'
      FooterFont.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      PopupMenu = PMenuWares
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = [fsBold]
      OnDblClick = NEditWClick
      OnDrawColumnCell = DBGridEhWaresNLDrawColumnCell
      OnTitleClick = DBGridWaresNBTitleClick
      Columns = <
        item
          Color = cl3DLight
          EditButtons = <>
          FieldName = 'ROWNUM'
          Footers = <>
          Title.Caption = #8470
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 25
        end
        item
          EditButtons = <>
          FieldName = 'WARES_NAME'
          Footers = <>
          Title.Caption = #1071#1089#1072#1089' '#1074#1103#1089#1072#1080#1090
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 184
        end
        item
          Color = clMenu
          EditButtons = <>
          FieldName = 'TAX_PERCENT'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = '%'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 26
        end
        item
          EditButtons = <>
          FieldName = 'INVENTAR_DATE'
          Footers = <>
          Title.Caption = #1048#1085#1074#1077#1085#1090#1072#1088' '#1090#1072#1088#1080#1093#1080
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 87
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'TAX_CLOSE_FORMAT'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = '#'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 17
        end
        item
          EditButtons = <>
          FieldName = 'FIRST_PRICE'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Footers = <>
          Title.Caption = #1048#1083#1082#1080#1085' '#1076#1103#1081#1103#1088
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 92
        end
        item
          EditButtons = <>
          FieldName = 'TAX_FIRST_PRICE'
          Footers = <>
          Title.Caption = #1048#1083#1083#1080#1082' '#1075#1072#1083#1099#1075
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'TAX_REMAINDER'
          Footers = <>
          Title.Caption = #1043#1072#1083#1099#1075' '#1076#1103#1081#1103#1088#1080
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 73
        end
        item
          EditButtons = <>
          FieldName = 'TAX_ALL_AMORT'
          Footers = <>
          Title.Caption = #1049#1099#1101#1099#1083#1084#1099#1096' '#1072#1084#1086#1088'.'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 82
        end
        item
          EditButtons = <>
          FieldName = 'TAX_AMORT'
          Footers = <>
          Title.Caption = #1040#1084#1086#1088#1090#1080#1079#1072#1089#1080#1081#1072
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 78
        end
        item
          EditButtons = <>
          FieldName = 'AMORT_DATE'
          Footers = <>
          Title.Caption = #1040#1084#1086#1088#1090#1080#1079#1072#1089#1080#1081#1072' '#1090#1072#1088#1080#1093#1080
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 107
        end
        item
          EditButtons = <>
          FieldName = 'INVENTAR_NO'
          Footers = <>
          Title.Caption = 'Inventar '#8470
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 50
        end>
      object RowDetailData: TRowDetailPanelControlEh
        object DBGridEh1: TDBGridEh
          Left = 0
          Top = 0
          Width = 0
          Height = 169
          Align = alTop
          Color = 15855856
          ColumnDefValues.AutoDropDown = True
          ColumnDefValues.DropDownSizing = True
          ColumnDefValues.EndEllipsis = True
          DataGrouping.GroupLevels = <>
          DataSource = DataModWares.DSGroups
          EditActions = [geaCutEh, geaCopyEh, geaSelectAllEh]
          FixedColor = 9512207
          Flat = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentFont = False
          PopupMenu = PMenuGroups
          RowDetailPanel.Color = clBtnFace
          RowHeight = 4
          RowLines = 1
          RowSizingAllowed = True
          SumList.Active = True
          SumList.ExternalRecalc = True
          SumList.VirtualRecords = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGridEhGroupNBCellClick
          OnDblClick = NEditGroupsClick
          OnTitleClick = DBGridEhGroupNBTitleClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'ROWNUM'
              Footers = <>
              Title.Caption = #8470
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 22
            end
            item
              EditButtons = <>
              FieldName = 'NAME'
              Footers = <>
              PopupMenu = PMenuGroups
              Width = 188
            end
            item
              Color = clMenu
              EditButtons = <>
              FieldName = 'AMORT'
              Footer.Color = clInfoBk
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = '%'
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 27
            end
            item
              EditButtons = <>
              FieldName = 'DEBTACCNO'
              Footers = <>
              Title.Caption = 'Debet hesab'
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 200
            end
            item
              EditButtons = <>
              FieldName = 'CREDITACCNO'
              Footers = <>
              Title.Caption = 'Kredit hesab'
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 200
            end
            item
              EditButtons = <>
              FieldName = 'MAINACCNO'
              Footers = <>
              Title.Caption = #399'sas v'#601'sait hesab'#305
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 134
            end
            item
              EditButtons = <>
              FieldName = 'SALEACCNO'
              Footers = <>
              Title.Caption = 'Alq'#305'-Satq'#305'/Z'#601'r'#601'r'
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 152
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
    object PanelSumTax: TPanel
      Left = 2
      Top = 396
      Width = 978
      Height = 54
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object LabelK: TLabel
        Left = 81
        Top = 8
        Width = 48
        Height = 13
        Caption = #1048#1083#1082#1080#1085' '#1076#1103#1081#1103#1088
      end
      object LabelTaxFirstPrice: TLabel
        Left = 226
        Top = 8
        Width = 40
        Height = 13
        Caption = #1048#1083#1083#1080#1082' '#1075#1072#1083#1099#1075
      end
      object LabelTaxRemainder: TLabel
        Left = 362
        Top = 8
        Width = 55
        Height = 13
        Caption = #1043#1072#1083#1099#1075' '#1076#1103#1081#1103#1088#1080
      end
      object LabelTaxAllAmort: TLabel
        Left = 506
        Top = 8
        Width = 63
        Height = 13
        Caption = #1049#1099#1101#1099#1083#1084#1099#1096' '#1072#1084#1086#1088'.'
      end
      object LabelTaxAmort: TLabel
        Left = 642
        Top = 8
        Width = 58
        Height = 13
        Caption = #1040#1084#1086#1088#1090#1080#1079#1072#1089#1080#1081#1072
      end
      object DBEditFP: TDBEdit
        Left = 80
        Top = 25
        Width = 144
        Height = 21
        Color = 15855856
        DataField = 'FIRST_PRICE'
        DataSource = DataModWares.DSSumWares
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object DBEditTaxFirstPrice: TDBEdit
        Left = 226
        Top = 25
        Width = 136
        Height = 21
        Color = 15855856
        DataField = 'TAX_FIRST_PRICE'
        DataSource = DataModWares.DSSumWares
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object DBEditTaxRemainder: TDBEdit
        Left = 363
        Top = 25
        Width = 139
        Height = 21
        Color = 15855856
        DataField = 'TAX_REMAINDER'
        DataSource = DataModWares.DSSumWares
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object DBEditTaxAllAmort: TDBEdit
        Left = 503
        Top = 25
        Width = 139
        Height = 21
        Color = 15855856
        DataField = 'TAX_ALL_AMORT'
        DataSource = DataModWares.DSSumWares
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object DBEditTaxAmort: TDBEdit
        Left = 643
        Top = 25
        Width = 141
        Height = 21
        Color = 15855856
        DataField = 'TAX_AMORT'
        DataSource = DataModWares.DSSumWares
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
    end
    object DBGridEh2: TDBGridEh
      Left = 2
      Top = 15
      Width = 978
      Height = 138
      Align = alTop
      Color = 15855856
      ColumnDefValues.AutoDropDown = True
      ColumnDefValues.DropDownSizing = True
      ColumnDefValues.EndEllipsis = True
      DataGrouping.GroupLevels = <>
      DataSource = DataModWares.DSGroups
      EditActions = [geaCutEh, geaCopyEh, geaSelectAllEh]
      FixedColor = 9512207
      Flat = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      PopupMenu = PMenuGroups
      RowDetailPanel.Color = clBtnFace
      RowHeight = 4
      RowLines = 1
      RowSizingAllowed = True
      SumList.Active = True
      SumList.ExternalRecalc = True
      SumList.VirtualRecords = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGridEhGroupNBCellClick
      OnDblClick = NEditGroupsClick
      OnTitleClick = DBGridEhGroupNBTitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ROWNUM'
          Footers = <>
          Title.Caption = #8470
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 22
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          PopupMenu = PMenuGroups
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clHighlightText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 188
        end
        item
          Color = clMenu
          EditButtons = <>
          FieldName = 'AMORT'
          Footer.Color = clInfoBk
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = '%'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 27
        end
        item
          EditButtons = <>
          FieldName = 'DEBTACCNO'
          Footers = <>
          Title.Caption = 'Debet hesab'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 200
        end
        item
          EditButtons = <>
          FieldName = 'CREDITACCNO'
          Footers = <>
          Title.Caption = 'Kredit hesab'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 200
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object GBoxNB: TGroupBox
    Left = 0
    Top = 45
    Width = 982
    Height = 452
    Align = alClient
    Caption = 'Maliyy'#601
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    object DBGridWaresNB: TDBGridEh
      Left = 2
      Top = 184
      Width = 978
      Height = 214
      Align = alClient
      Color = 15855856
      DataGrouping.GroupLevels = <>
      DataSource = DataModWares.DSWares
      FixedColor = clBtnText
      Flat = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Azl Sans Serif'
      FooterFont.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      PopupMenu = PMenuWares
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = [fsBold]
      OnDblClick = NEditWClick
      OnDrawColumnCell = DBGridWaresNBDrawColumnCell
      OnTitleClick = DBGridWaresNBTitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'INVENTAR_NO'
          Footers = <>
          Title.Caption = #304'nventar '#8470
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 71
        end
        item
          EditButtons = <>
          FieldName = 'WARES_NAME'
          Footers = <>
          Title.Caption = #399'sas v'#601'sait'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 184
        end
        item
          Color = clMenu
          EditButtons = <>
          FieldName = 'PERCENT'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = ' %'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 28
        end
        item
          EditButtons = <>
          FieldName = 'ENTER_DATE'
          Footers = <>
          Title.Caption = 'Daxil olunma tarixi'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 115
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'CLOSE_FORMAT'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = '#'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 16
        end
        item
          EditButtons = <>
          FieldName = 'INVENTAR_DATE'
          Footers = <>
          Title.Caption = #304'stifad'#601' olunma tarixi'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 87
        end
        item
          EditButtons = <>
          FieldName = 'FIRST_PRICE'
          Footers = <>
          Title.Caption = #304'lkin d'#601'y'#601'r'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 68
        end
        item
          EditButtons = <>
          FieldName = 'REMAINDER'
          Footers = <>
          Title.Caption = 'Qal'#305'q d'#601'y'#601'r'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'ALL_AMORT'
          Footers = <>
          Title.Caption = 'Y'#305#287#305'lm'#305#351' amort.'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'AMORT'
          Footers = <>
          Title.Caption = 'Amortizasiya'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 77
        end
        item
          EditButtons = <>
          FieldName = 'AMORT_DATE'
          Footers = <>
          Title.Caption = 'Amortizasiya tarixi'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 105
        end
        item
          EditButtons = <>
          FieldName = 'USER_NAME'
          Footers = <>
          Title.Caption = #304'stifad'#601#231'i'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 92
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object DBGridEhGroupNB: TDBGridEh
      Left = 2
      Top = 15
      Width = 978
      Height = 169
      Align = alTop
      Color = 15855856
      ColumnDefValues.AutoDropDown = True
      ColumnDefValues.DropDownSizing = True
      ColumnDefValues.EndEllipsis = True
      DataGrouping.GroupLevels = <>
      DataSource = DataModWares.DSGroups
      EditActions = [geaCutEh, geaCopyEh, geaSelectAllEh]
      FixedColor = clBtnText
      Flat = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      PopupMenu = PMenuGroups
      RowDetailPanel.Color = clBtnFace
      RowHeight = 4
      RowLines = 1
      RowSizingAllowed = True
      SumList.Active = True
      SumList.ExternalRecalc = True
      SumList.VirtualRecords = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGridEhGroupNBCellClick
      OnDblClick = NEditGroupsClick
      OnTitleClick = DBGridEhGroupNBTitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ROWNUM'
          Footers = <>
          Title.Caption = #8470
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 22
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          PopupMenu = PMenuGroups
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 188
        end
        item
          Color = clMenu
          EditButtons = <>
          FieldName = 'AMORT'
          Footer.Color = clInfoBk
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = '%'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 27
        end
        item
          EditButtons = <>
          FieldName = 'DEBTACCNO'
          Footers = <>
          Title.Caption = 'Debet hesab'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 200
        end
        item
          EditButtons = <>
          FieldName = 'CREDITACCNO'
          Footers = <>
          Title.Caption = 'Kredit hesab'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 200
        end
        item
          EditButtons = <>
          FieldName = 'MAINACCNO'
          Footers = <>
          Title.Caption = #399'sas v'#601'sait hesab'#305
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 134
        end
        item
          EditButtons = <>
          FieldName = 'SALEACCNO'
          Footers = <>
          Title.Caption = 'Alq'#305'-Satq'#305'/Z'#601'r'#601'r'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 152
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object PanelSum: TPanel
      Left = 2
      Top = 398
      Width = 978
      Height = 52
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object LabelFirstPrice: TLabel
        Left = 160
        Top = 7
        Width = 50
        Height = 13
        Caption = #304'lkin d'#601'y'#601'r'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LabelRemainder: TLabel
        Left = 299
        Top = 7
        Width = 55
        Height = 13
        Caption = 'Qal'#305'q d'#601'y'#601'r'
      end
      object LabelAllAmort: TLabel
        Left = 441
        Top = 7
        Width = 68
        Height = 13
        Caption = 'Y'#305#287#305'lm'#305#351' amort.'
      end
      object LabelAmort: TLabel
        Left = 583
        Top = 7
        Width = 61
        Height = 13
        Caption = 'Amortizasiya'
      end
      object LabelSum: TLabel
        Left = 113
        Top = 26
        Width = 37
        Height = 13
        Caption = 'C'#601'ml'#601'r:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LabelRefreshAll: TLabel
        Left = 8
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Tam yenil'#601'm'#601'k -F5'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = LabelRefreshAllClick
      end
      object DBEditFirstPrice: TDBEdit
        Left = 150
        Top = 23
        Width = 139
        Height = 21
        Color = 15855856
        DataField = 'FIRST_PRICE'
        DataSource = DataModWares.DSSumWares
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object DBRemainder: TDBEdit
        Left = 299
        Top = 23
        Width = 138
        Height = 21
        Color = 15855856
        DataField = 'REMAINDER'
        DataSource = DataModWares.DSSumWares
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object DBAllAmort: TDBEdit
        Left = 440
        Top = 23
        Width = 140
        Height = 21
        Color = 15855856
        DataField = 'ALL_AMORT'
        DataSource = DataModWares.DSSumWares
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object DBEditAmort: TDBEdit
        Left = 583
        Top = 23
        Width = 140
        Height = 21
        Color = 15855856
        DataField = 'AMORT'
        DataSource = DataModWares.DSSumWares
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object PanelSearch: TPanel
        Left = 953
        Top = 2
        Width = 23
        Height = 48
        Align = alRight
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -27
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object LabelS: TLabel
          Left = 4
          Top = 4
          Width = 16
          Height = 38
          Caption = '<'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -27
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = LabelSClick
        end
        object Search: TLabel
          Left = 70
          Top = 26
          Width = 52
          Height = 16
          Caption = #1040#1093#1090#1072#1088#1099#1096':'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelSrchName: TLabel
          Left = 152
          Top = 7
          Width = 67
          Height = 13
          Caption = #1042#1103#1089#1072#1080#1090#1080#1085' '#1072#1076#1099
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelSrchFP: TLabel
          Left = 291
          Top = 7
          Width = 63
          Height = 13
          Caption = #1048#1083#1082#1080#1085' '#1076#1103#1081#1103#1088#1080
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelSrchR: TLabel
          Left = 416
          Top = 8
          Width = 65
          Height = 13
          Caption = #1043#1072#1083#1099#1075' '#1076#1103#1081#1103#1088
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelSrchAA: TLabel
          Left = 538
          Top = 8
          Width = 82
          Height = 13
          Caption = #1049#1099#1100#1099#1083#1084#1099#1096' '#1072#1084#1086#1088#1090'.'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelSrchA: TLabel
          Left = 651
          Top = 7
          Width = 63
          Height = 13
          Caption = #1040#1081#1083#1099#1075' '#1072#1084#1086#1088#1090
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EditSrchFP: TEdit
          Left = 292
          Top = 23
          Width = 121
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = EditSrchFPChange
        end
        object EditSrchR: TEdit
          Left = 415
          Top = 23
          Width = 121
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = EditSrchRChange
        end
        object EditSrchAA: TEdit
          Left = 537
          Top = 23
          Width = 113
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = EditSrchAAChange
        end
        object EditSrchName: TEdit
          Left = 151
          Top = 23
          Width = 121
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = EditSrchNameChange
        end
        object EditSrchA: TEdit
          Left = 651
          Top = 23
          Width = 121
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnChange = EditSrchAChange
        end
      end
    end
  end
  object ImageList: TImageList
    Left = 196
    Top = 164
    Bitmap = {
      494C0101240038001C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000A000000001001000000000000050
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007A6F7A6F7A6F7A6F7A6F7A6F7A6F
      7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F0000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7F104200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007A6F7A6F7A6F7A6F7A6F7A6F7A6F
      7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F0000000000000000007C007C007C
      007C007C007C007C007C00000000000000000000FF7FFF7FFF7F186310420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F0000FF7FFF7F00000000000000007A6F7A6F7A6F7A6F7A6F7A6F7A6F
      7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F000000000000007C007C007C007C
      007C007C007C007C007C007C0000000000000000FF7FFF7FFF7F186318630000
      1042000000000000000018631863104200000000000000000000000000000000
      1042FF7F0000FF7FFF7F00000000000000007A6F7A6F7A6F7A6F7A6F7A6F7A6F
      8C31A104830C4209030D734E7A6F7A6F7A6F00000000007C007C007C007C007C
      007C007C007C007C007C007C007C0000000000001F001F001F00004018630000
      1042000000000000000000001863104200000000000000000000000010420000
      1042FF7F1042FF7FFF7F10420000000000007A6F7A6F7A6F7A6F7A6F7A6F7A6F
      830C524F0E3BEC36C92AA61AB5567A6F7A6F0000007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C000000001F001F001F00100000400000
      10421863186318631863186318631042000000000000FF7FFF7F104200001863
      1042FF7F1042FF7FFF7F1042FF7F000000007A6F7A6F7A6F7A6F7A6F7A6F7A6F
      165B75573043EB2E8821A82240007A6F7A6F007C007CFF7FFF7F007C007CFF7F
      007CFF7FFF7F007CFF7F007C007C007C000000001F001F001F00100010000000
      10421042104210421042104210421042000000001042FF7F1042FF7FFF7F1042
      1042FF7F1863FF7FFF7F1863FF7F000000007A6F7A6F7A6F7A6F8C311042B556
      765B524F2F43E9259C73282260007A6F7A6F007C007CFF7F007CFF7F007CFF7F
      007CFF7F007CFF7FFF7F007C007C007C00001042FF7FFF7FFF7F186310000000
      10421042104210420002104200001042000000001042FF7F1863FF7FFF7F1863
      1042FF7FFF7FFF7FFF7FFF7FFF7F000000007A6F7A6F7A6F734E64127A6F7B6F
      CE39CE39E71CE71C39678412CE397A6F7A6F007C007C007CFF7FFF7F007CFF7F
      007CFF7F007CFF7FFF7F007C007C007C00001863186318631042FF7FFF7F0000
      1863FF7FFF7FFF7FFF7F186310420000000000001042FF7FFF7F18631863FF7F
      FF7F00001042FF7FFF7F10420000000000007A6F7A6F7A6F030DE410CE39C410
      0000A514E71C734EE71CA1047A6F7A6F7A6F007C007CFF7FFF7F007C007CFF7F
      007CFF7F007CFF7FFF7F007CFF7F007C00001042186318631042FF7FFF7F0000
      1F001F001F001F0010001863104200000000000000001042FF7FFF7FFF7F0000
      0000000010421863004000000000000000007A6F7A6F7A6FEB32A1049C73F556
      EC36C92AC8261042734E7A6F7A6F7A6F7A6F007C007CFF7F007C007C007CFF7F
      007CFF7F007CFF7FFF7F007CFF7F007C00000000104200000000104210420000
      1F001F001F001F00100018631042000000000000000000000000186310420000
      00000000FF7F0040004000000000000000007A6F7A6F7A6FAD3ACA2A43113147
      30470D37EE3E7A6F7A6F7A6F7A6F7A6F7A6F007C007CFF7F007CFF7F007CFF7F
      007CFF7F007CFF7FFF7F007CFF7F007C0000000000000000104218631F001F00
      1F001F001F001F00100018631042000000000000000000000000186310420000
      0000000018630040004000000000000000007A6F7A6F7A6F630C765B9863975F
      765B3043671D7A6F7A6F7A6F7A6F7A6F7A6F007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C0000000000000000104218631F001F00
      1F001F001F001F00100018631042000000000000000000000000104218630000
      0000000000000040004000000000000000007A6F7A6F7A6F7A6FA514F556F556
      C6184721E71C7A6F7A6F7A6F7A6F7A6F7A6F0000007C007C007C007C007C007C
      007C007C007C007C007C007C007C000000000000000000001042186300000000
      0000000000000000100018631042000000000000000000000000000000000000
      0000000000000000000000000000000000007A6F7A6F7A6F7A6F7A6F7A6F7A6F
      7A6F7B6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F00000000007C007C007C007C007C
      007C007C007C007C007C007C0000000000000000000000001042186318631863
      1863186318631863186318631042000000000000000000000000000000000000
      0000000000000000000000000000000000007A6F7A6F7A6F7A6F7A6F7A6F7A6F
      7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F000000000000007C007C007C007C
      007C007C007C007C007C00000000000000000000000000000000104218631863
      1863186318631863186318631042000000000000000000000000000000000000
      0000000000000000000000000000000000007A6F7A6F7A6F7A6F7A6F7A6F7A6F
      7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F7A6F0000000000000000007C007C007C
      007C007C007C007C000000000000000000000000000000000000000000000000
      00000000104200000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F00000000000000000000FF77FF73FF77FF77FF77FF7BFF7B
      FF7BFF7BFF7BFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001042000000000000000000000000000000000000FF7FFF7F00000000
      0000000000000000FF7FFF7F0000000000001D23771677169816B916BA16BA16
      B916BA16DB1A1D1B1D1F3D273D271D235E3B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F104200000000000000000000000000000000FF7F0000000000001000
      000010000000100000000000FF7F00000000BA16981677167716781698167816
      77165716571677167716561656163512DB1A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010421042
      FF7FFF7F10421042104200000000000000000000FF7F00001000100010000000
      1000000010000000100000000000FF7F0000DB1A991677161D233D27BA1ADA1A
      BA1699169916DA1AFC1ABA1677165616DB1A0000000000000000000000000000
      000000000000000000000000000000000000000000000000104200001863FF7F
      FF7FFF7F00000000104210420000000000000000FF7F10001000100010001863
      1863FF7FFF7F1000000010000000FF7F0000FC1ABA1635123E2FFF7BDF6FFC1A
      FC1ADB1AFD1AFF7BFF7F5E3378165616DB1A0000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F18631042104200000000FF7F100010001000100010001000
      1863FF7F100010001000000000000000FF7F1D1BDA1A981614127E43FF7F9E4F
      1D1BFC1ADF73FF7F9E4FBA1698165616DB1A000000000000FF7F000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F104210420000FF7F100010001000100010001F00
      1863FF7F100010001000000010000000FF7F1D1FDB1A9816771614129E53FF7F
      5E37DF73FF7FBF67FC1ABA1A98165616DB1A0000000000000000000000000000
      0000000000000000000000000000000000001042FF7FFF7FFF7FFF7FFF7F1F00
      1F001F00FF7FFF7FFF7FFF7F186310421042FF7F100010001F0010001F001000
      1863FF7F100010001000100000000000FF7F1D1FFC1A9916571656165512BF63
      FF7FFF7FDF731D1BFC1ABA1678165616DB1A0000000000000000000000000000
      0000FF7F00000000000000000000000000001863FF7FFF7FFF7FFF7FFF7F1F00
      1F001F00FF7FFF7FFF7FFF7FFF7F00001042FF7F1000100010001F0010001F00
      1863FF7F100010001000000010000000FF7F1D1FFC1ABA167816561656167E4B
      FF7FFF7F3D2F1D1F1D1BDB1A98165616DB1A0000000000000000000000000000
      0000FF7F0000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F1F00
      1F001F00FF7FFF7FFF7FFF7FFF7F00001042FF7F100010001F0010001F001863
      186318631F0010001000100000000000FF7F1D231D1BDA1A981677161D1BFF7B
      FF7FFF7FDF6F1D1F1D1FFC1A99165616DB1A0000000000000000FF7F00000000
      0000FF7F0000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F1F00
      1F001F00FF7FFF7FFF7FFF7FFF7F00001042FF7F10001F0010001F001F001F00
      1F001000100010001000000010000000FF7F1D1FFC1ABA1A9816BA16FF77FF7F
      7E435E3BFF7FBF5B1D1FFC1AB9165716DB1A0000000000000000000000000000
      0000000000000000000000000000000000001863FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7F10001F0010001F001F00
      1863FF7F1F001000100010000000FF7F00001D1FFC1ABA169816DF6BFF7FBF5B
      771614127E47FF7F5E3BFC1AB9167716DB1A00000000000000000000FF7F0000
      00000000FF7F0000000000000000000000001042FF7FFF7FFF7FFF7FFF7F1F00
      1F001863FF7FFF7FFF7FFF7F1863000000000000FF7F100010001F0010001000
      1863186310001000100010000000FF7F00001D1FFC1ABA167E47DF6BBF639816
      7816781614127E4BBF5F1D1FBA167816DB1A0000000000000000000000000000
      00000000000000000000000000000000000000001042FF7FFF7FFF7FFF7F1F00
      1F001F00FF7FFF7FFF7FFF7F00000000000000000000FF7F1000100010001F00
      100010001000100010000000FF7F000000001D231D1BB916561677169916BA16
      BA16B916B91678169916BA16BA1A9916DB1A0000000000000000000000000000
      000000000000000000000000000000000000000000001042FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F18630000000000000000000000000000FF7FFF7F10001000
      1000100010001000FF7FFF7F0000000000001D231D1FFC1ADB1ADB1AFC1AFC1A
      FC1AFC1ADB1AFC1AFC1AFC1ADB1ABA163D2B0000000000000000000000000000
      000000000000000000000000000000000000000000000000000010421863FF7F
      FF7FFF7F104210420000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000005E375E375E375E375E3B5E3F7E3F
      7E437E477E4B9E4F9E539E539E539E53FF770000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010420042E07F00421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006E01B822B822B822B822
      B822B822B822B822B822B82255166E010000000000006E01B822B822B822B822
      B822B822B822B822B822B82255166E010000000000006E01B822B822B822B822
      B822B822B822B822B822B82255166E0100000000000000000000000000000000
      0000000010420042E07F00421042104200000000000056067F237F237F237F23
      7F237F237F237F237F237F237F23560600000000000056069F279F279F2B9F2F
      9F2F9F2F9F2F9F2F9F279F277F23560600000000000056067F237F239F279F27
      9F279F279F279F277F237F237F235606000010420042E07F0042104210420000
      0000000000000000000000000000000000000000000056065F0F5F0F5F0F5F0F
      5F0F5F0F5F0F5F0F5F0F5F0F5F0F560600000000000056067F137F137F1F7F23
      9F279F277F237F237F1B7F135F0F560600000000000056065F0F7F0F7F137F17
      7F177F177F177F137F0F5F0F5F0F560600000000000000000000000000000000
      0000000010420042E07F00421042104200000000000035023F033F039F089F08
      9F083F03E07FE07F3F033F031E03350200000000000035023F0B5F13FF7FFF7F
      FF7FFF7FFF7FFF7F5F1F5F133E07350200000000000035023F033F0B5F175F1F
      7F277F275F1F5F173F0B3F031E033502000010420042E07F0042104210420000
      000000000000000000000000000000000000000000001402FD02FD029F089F08
      9F08FD02E07FE07FFD02FD02DC02140200000000000014021D0F1D17FF7F7E3B
      7E43FF7F7E3F7E3B3E231D17FD0614020000000000001402FD061D0F3E23FF7F
      5E375E37FF7F3E231D0FFD06DC02140200000000000000000000000000000000
      0000000010420042E07FFF7FE07F0042000000000000D30159025902BF0CBF0C
      BF0C5902E07FE07F590259025802D301000000000000D3019912BA1EFF7F3C47
      5D4FFF7F5C4B3C47DB2ABA1E790AD301000000000000D30179069A16FB2EFF7F
      5D535D53FF7FFB2E9A1679065802D301000010420042E07FFF7FE07F00420000
      00000000000010421042104210421042000000000000D205370A370A370A370A
      370A370A370A370A370A370A370AD205000000000000D205781A9922FF7FFF7F
      FF7FFF7FFF7FFF7FDA329922370ED205000000000000D205380E781EDA36FF7F
      5D575D57FF7FDA36781E380E370AD20500000000104210421042104210420000
      00000000000000000000000000000000000000000000D20D57265722EF7DEF7D
      EF7D5722F03FF03F572257225722D20D000000000000D20D782E9836FF7F1B53
      5C5BFF7F3B571B53D93E98365726D20D000000000000D20D572A7832D942FF7F
      3B573B57FF7FD942783257265722D20D00000000000000001042000000000000
      00000000000010420000FF7F00000000000000000000F31598369832527E527E
      527E9832F34BF34B983298329832F315000000000000F315B93AD942FF7F3B57
      5C5BFF7F5C5B3B57FA46D9429836F315000000000000F3159836B93AFA46FF7F
      3B533B53FF7FFA46B93A98369832F31500000000000000000000000010420000
      0000FF7F00000000104200000000000000000000000034223B573B573B573B57
      3B573B573B573B573B573B573B53342200000000000034223C573C5B5C5F7C5F
      7D637D637C637C5F5C5B3C5B3B53342200000000000034223B573B573C5B5C5B
      5C5B5C5B5C5B3C5B3B573B573B5334220000000000000000FF7F000000001042
      00000000000000000000000000000000000000000000552A7D677D637D637D63
      7D637D637D637D637D637D637C63552A000000000000552A7D677D679D679D67
      9D6B9D6B9D6B9D677D677D677D63552A000000000000552A7D677D637D677D67
      7D677D677D677D677D637D637C63552A00000000000000000000000000000000
      10420000104200000000000000000000000000000000552ADE77DE77DE77DE77
      DE77DE77DE77DE77DE77DE77BE73552E000000000000552ADE77DE77DE77DE77
      DE77DE77DE77DE77DE77DE77BE73552E000000000000552ADE77DE77DE77DE77
      DE77DE77DE77DE77DE77DE77BE73552E00000000000000000000000000000000
      0000FF7F000000000000000000000000000000000000D1157632763276327632
      763276327632763276327632762ED115000000000000D1157632763276327632
      763276327632763276327632762ED115000000000000D1157632763276327632
      763276327632763276327632762ED11500000000000000000000000000000000
      1042000010420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104218631042100210021042
      186310420000186318631042000000000000007C000000000000000000000000
      0000000000000000000000000000007C007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104218631042100210021042
      186310420000186318631042000000000000007C007C0000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F007C007C007C000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000008049804900000000000000000000
      00000000000000000000CE390000000000000000104218631042100210021042
      186310420000186318631042000000000000007C007C007CFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F007C007C007C000000001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F000000000000A07EA07E00000000000000000000
      0000000000009452186318630000000000001042104210421042104210421042
      1042104200001863186310420000104200000000007C007C007CFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F007C007C007C0000000000001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F000000000000A07EA07E00001863186318631863
      1863186318631863186318631863000000001042104210421042104210421042
      10421042000018631863104200001042000000001042007C007C007CFF7FFF7F
      FF7FFF7FFF7F007C007C007C00000000000000001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F000000000000A07EA07E0000FE7FFE7FFE7FFE7F
      FE7FFE7FFE7FFE7FFE7F1863186300000000000000001042FF7F104210421042
      10421042000018631863104200000000000000001042FF7F007C007C007CFF7F
      FF7FFF7F007C007C007CFF7F00000000000000001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F000000000000E97EE97E00000000000000000000
      0000000000009452FE7FFE7F00000000000000000000000000001042FF7F1042
      18631863FF7F18631863104210420000000000001042FF7FFF7F007C007C007C
      FF7F007C007C007CFF7FFF7F00000000000000001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F000000000000517F517F00000000000000000000
      00000000000000000000CE390000000000000000000000000000000000001042
      FF7FFF7F186318631863186310421042000000001042FF7FFF7FFF7F007C007C
      007C007C007CFF7FFF7FFF7F00000000000000001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001863186300000000000000001042000000001042FF7FFF7FFF7FFF7F007C
      007C007C007CFF7FFF7FFF7F00000000000000001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000945294529452
      0000000000000000000000000000000000000000000000000000000000000000
      00000000007C007C007C007C007C007C000000001042FF7FFF7FFF7F007C007C
      007C007C007C007CFF7FFF7F00000000000000001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000FE7FFE7F7B6F1863
      9452000000000000000000000000000000000000000000000000000000000000
      0000007CE07F007CE07F007CE07F007C000000001042FF7FFF7F007C007C007C
      FF7FFF7F007C007C007CFF7F00000000000000001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000001863
      1863CE39CE39CE39CE39CE39CE39CE39CE390000000000000000000000000000
      0000007CE07FE07FE07F007CE07F007C000000001042FF7F007C007C007C0000
      1863FF7FFF7F007C007C007C00000000000000001042FF7FFF7FFF7FFF7F0000
      1863FF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000001863
      1863186318631863186318631863186318630000000000000000000000000000
      00000000E07F007C007CE07FE07F0000000000001042007C007C007CFF7F1863
      0000FF7FFF7FFF7F007C007C007C0000000000001042FF7FFF7FFF7FFF7F1863
      0000FF7FFF7FFF7FFF7F18630000000000000000000000000000000000001863
      18637B6FFE7FFE7FFE7FFE7FFE7FFE7FFE7F0000000000000000000000000000
      000000000000007CE07F007C0000000000000000007C007C007CFF7F0000FF7F
      1863FF7FFF7FFF7F1863007C007C007C000000001042FF7FFF7FFF7F0000FF7F
      1863FF7FFF7FFF7F18630000000000000000000000000000FE7F945294521863
      9452000000000000000000000000000000000000000000000000000000000000
      0000000000000000007C007C000000000000007C007C007C1042104210420000
      104210421042104200000000007C007C007C00001042FF7F1042104210420000
      1042104210421042000000000000000000000000000000000000FE7F7B6F1863
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C007C10421042000010421042
      1042104200000000000000000000007C007C0000104210421042000010421042
      1042104200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000018631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F1F001F001F001F00FF7F1000
      E07FE07FE07FE07F0000104200001042000000000000E003E003E003E003E003
      E003E003E003E003E00300001863186318630000800180018001800180018001
      80018001800180018001800180018001000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F00000000000000000000FF7F1F001F001F001F00FF7F1000
      E07FE07FE07FE07F0000104200001042000000000002E003E003E003E003E003
      E003E003E003E003E003E0030000186318630000800180018001800180018001
      800180018001800180018001800180010000000000006E01B822B822B822B826
      D82AD92AB826B826B822B82255166E010000FF7F1F001F001F001F00FF7F1000
      1000E07F100010420000104200001042000000000002E003E003E003E003E003
      E003E003E003E003E003E00300001863186300008001FE7FFE7FFE7FFE7FFE7F
      FE7FFE7FFE7FFE7FFE7FFE7F8001800100000000000056069F279F279F2F9F33
      BF3FFF7F9F3B9F339F2B9F277F2356060000FF7F1F001F001F001F00FF7F1000
      100018631042104210421042104210421042000000020000E003E003E003E003
      E003E003E003E003E003E003E0031863186300008001FE7FFE7FFE7FFE7FFE7F
      FE7FFE7FFE7FFE7FFE7FFE7F8001800100000000000056067F137F137F239F2B
      FF7FFF7F9F339F2B7F1B7F135F0F5606000010421F001F001F001F00FF7F1000
      100018631042100018631863186318631863000000020000E003E003E003E003
      E003E003E003E003E003E003E0031863186300008001FE7F8001800180018001
      8001800180018001800180018001800100000000FF7F36025F0F5F1BFF7FFF7F
      FF7FFF7FFF7FFF7F7F235F1B3F0B3602000010421F001F001F001F00FF7F1000
      1000186310001042100010421000100010420000000200020000E003E003E003
      E003E003E003E003E003E003E0030000186300008001FE7F8001800180018001
      8001FE7F800180018001FE7F8001800100000000FF7F35061D173E23FF7F5E33
      5E2F5E335E335E333E2B3E23FD0E3506FF7F10421F001F001F001F00FF7F1000
      10001863104210421000104210001000000000000002000200020000E003E003
      E003E003E003E003E003E003E003E003000000008001FE7FFE7F800180018001
      FE7F8001800180018001FE7F8001800100000000FF7F140EDA26FF7FFF7FFB2E
      BA1EBA1EDB26FB2EFB32FF7F991A140EFF7F10421F001F001F001F00FF7F1000
      1000186310421000100010421000100000000000000200020002000000000000
      00000000000000000000000000000000000000008001FE7FFE7FFE7F8001FE7F
      800180018001FE7FFE7FFE7F8001800100000000FF7FF411FF7FFF7FFF7FDA36
      99229922B92EDA36FB3AFF7F9922F411FF7F10421F001F001F001F00FF7F1000
      1000186310001042100010421042186300000000000200020002000200020002
      00020002000200020000186318631863186300008001FE7FFE7FFE7FFE7F8001
      800180018001FE7FFE7FFE7F8001800100000000FF7FF315B93AD942FF7FFA46
      D93ED93EDA42FA46FA46D9429832F315FF7F10421F001F001F001F00FF7F1000
      1000100010001000100010421863000000000000000200020002000200020002
      00020002000200020000186318631863186300008001FE7FFE7FFE7F80018001
      8001800180018001FE7FFE7F8001800100000000FF7F131ADA42FA46FF7F1B53
      1B4F1B531B531B53FA4AFA46B93A131AFF7F10421F001F001F001F00FF7F1000
      1000100010001863100018630000000000000000000200020002000200020000
      00000000000000000000186300000000000000008001FE7FFE7F800180018001
      FE7F8001800180018001FE7F8001800100000000000034223C575C5B7C5F7D63
      7D679D677D637D635C5B5C5B3B53342200000000FF7F1F001F001F00FF7F1000
      1000100010000000100000000000000000000000000000020002000200001863
      18631863186318631863186318630000000000008001FE7FFE7FFE7FFE7FFE7F
      FE7FFE7FFE7FFE7FFE7FFE7F80018001000000000000552A7D677D679D6B9D6B
      FF7FFF7F9E6B9D6B9D677D677D63552A00000000FF7F1F001F001F00FF7F1000
      1000100010000000100000000000000000001863000000000000000018631863
      18631863186318631863186318631863000000008001FE7FFE7FFE7FFE7FFE7F
      FE7FFE7FFE7FFE7FFE7FFE7F80018001000000000000552ADE77DE77DE77DE77
      DF77DF77DE77DE77DE77DE77BE73552E00000000FF7F1F001F001F00FF7F1000
      1000100010000000000000000000000000001863186318631863186318631863
      1863186318631863000000000000186318630000800180018001800180018001
      80018001800180018001800180018001000000000000D1157632763276329736
      973A973A9736973676327632762ED11500000000FF7F1F001F001F00FF7F1000
      1000100010000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7F00000000000000000000000010421042FF7FFF7FFF7F1863
      1863000000001042000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000596B596B596B596B596B596B596B
      596B596B596B596B596B596B596B596B596B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104210421042104210421042
      10421042104210421042104210420000596B0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000C0280000
      000000000000000000000000000000000000000000006E01B822B822B822B822
      B822B822B822B822B822B82255166E010000FF7F596B596B596B596B596B596B
      596B596B596B596B596B596B596B596B596B0000000000001863186318631863
      1863186318631863000000000000000000000000000000000000C028967F406E
      0000000000000000000000000000000000000000000056067F237F239F279F27
      9F279F279F279F277F237F237F2356060000FF7F596B596B596B596B596B596B
      596B596B596B596B596B596B596B596B596B0000000000000000000000000000
      0000000000000000000018630000000000000000000000000000A07E967FA07E
      A07EA07E406E0000000000000000000000000000000056065F0F7F0F7F177F1B
      7F1F7F1F7F1F7F1B7F137F0F5F0F56060000FF7F104210421042104210421042
      10421042104210421042596B596B596B596B0000000018631863186318631863
      007C007C007C186318631863000000000000000000000000C028D65A967FA07E
      A07EA07EA07EA07EA07E406E0000000000000000000035023F033F0B5F1F7F2F
      9F439F479F3B7F2F5F133F0B1E0335020000FF7F596B596B596B596B596B596B
      596B596B596B596B596B596BE003596B596B0000000000000000000000000000
      000000000000000000001863186300000000000000000000D65AD65A967FA07E
      A07EA07EA07EA07EA07EA07EA07E00000000000000001402FD061D0F5E2FFF7F
      FF7FFF7FFF7FFF7F3D1B1D0FDC0214020000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F596B0000000018631863186318631863
      186318631863186300000000186300000000000012009C73D65AD65A967FA07E
      A07EA07EA07EA07EA07EA07EA07E0000000000000000D30179069A163C43FF7F
      FF7FFF7FFF7FFF7FDB2A9A165802D3010000FF7F596B596B596B596B596B596B
      596B596B596B596B596B596B596B596B596B0000000000000000000000000000
      00000000000000001863186300000000000012009C739C731200D65A967FA07E
      A07EA07EA07EA07EA07EA07EA07E0000000000000000D205380E781E3C4BFF7F
      FF7FFF7FFF7FFF7FDA2E781E370AD20500000000596B0000596B596B596B596B
      596B596B596B596B00001042596B000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F00000000186300000000000012009C739C739C73967FA07E
      A07EA07EA07EA07EA07EA07EA07E0000000000000000D20D572A78321B4FFF7F
      FF7FFF7FFF7FFF7FB93E78325722D20D0000596B596B0000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F596B596B596B596B596B0000000000000000FF7F1F001F00
      1F001F001F00FF7F000000000000000000000000C02812009C731200967FA07E
      A07EA07EA07EA07EA07EA07EA07E0000000000000000F3159836B93A1B4FFF7F
      FF7FFF7FFF7FFF7FDA42B93A9832F3150000596B596B0000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F596B596B596B596B596B0000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000967FA07E9C739C73C028967F
      A07EA07EA07EA07EA07EA07EA07E000000000000000034223B573B575C5B5C5F
      7D637D637C635C5F3C5B3B573B5334220000596B596B0000FF7FFF7FFF7FFF7F
      FF7FFF7F596B596B596B596B596B596B596B00000000000000000000FF7F1F00
      1F001F001F001F00FF7F0000000000000000C028E07FE07FA07E9C7312009C73
      00000000967F967FA07EA07EA07E0000000000000000552A7D677D637D677D67
      9D679D679D677D677D637D637C63552A0000596B596B0000FF7FFF7FFF7FFF7F
      FF7F1042FF7F0000596B596BFF7F596B596B0000000000000000000000000000
      000000000000000000000000000000000000C028E07FE07FE07FE07F9C739C73
      12009C73D65AD65A0000967F967F0000000000000000552ADE77DE77DE77DE77
      DE77DE77DE77DE77DE77DE77BE73552E0000596B596B0000FF7FFF7FFF7FFF7F
      FF7F10420000596B596B596BFF7F596B596B0000000000000000000000000000
      00000000000000000000000000000000000000000000E07FE07F000000009C73
      9C739C739C731200A07E000000000000000000000000D1157632763276327632
      763276327632763276327632762ED1150000596B596B00000000000000000000
      00000000596B596B596B596B596B596B596B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001200
      9C739C7300000000406E00000000000000000000000000000000000000000000
      000000000000000000000000000000000000596B596B596B596B596B596B596B
      596B596B596B596B596B000000000000596B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800180018001800180018001
      8001800180018001800180018001800100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006E01B822B822B822B822
      B822B822B822B822B822B82255166E0100000000800180018001800180018001
      8001800180018001800180018001800100000000000000000064007000000000
      000000000000000000000000000000000000000000006E01B822B822B822B822
      B822B822B822B822B822B82255166E0100000000000056069F279F279F2B9F2B
      9F279F279F279F279F2B9F277F235606000000008001FE7FFE7FFE7FFE7FFE7F
      FE7FFE7FFE7FFE7FFE7FFE7F800180010000000000000000007C007C007C0000
      0000000000000000000000000000000000000000000056067F237F239F279F27
      9F279F279F277F237F237F237F23560600000000000056067F0F7F137F1B7F1B
      7F1B7F177F1B7F1B7F1B7F175F0F5606000000008001FE7FFE7FFE7FFE7FFE7F
      FE7FFE7FFE7FFE7FFE7FFE7F800180010000000000000034007C007C007C003C
      0000000000000000000000000000000000000000000056065F0F5F0F7F137F13
      7F1B7F1B7F137F135F0F5F0F5F0F560600000000000035023F075F0FFF7FFF7F
      7F277F277F277F27FF7F5F173E073602000000008001FE7F8001800180018001
      80018001800180018001800180018001000000000000007C007C0064007C007C
      0000000000000000000000000000000000000000000035023F033F035F0F5F17
      FF7F7F2F7F1F5F173F073F031E0335020000000000001402FD06FD0A3E23FF7F
      5E377E3B5E37FF7F3E231D17FD061502000000008001FE7F8001800180018001
      8001FE7F800180018001FE7F8001800100000000007C007C007C0000007C007C
      006C00000000000000000000000000000000000000001402FD02FD021D133E1F
      FF7FFF7F5E333E23FD0AFD02DC021402000000000000D3015906790ABA22FB2E
      FF7FFF7FFF7F3C43BA229A125806D301000000008001FE7FFE7F800180018001
      FE7F8001800180018001FE7F8001800100000000007C007C007800000000007C
      007C001C000000000000000000000000000000000000D301590259029A16DB2A
      FF7FFF7FFF7F1C3B991279065802D301000000000000D205370A58129926DA36
      5C53FF7F5C531B479926781A370AD205000000008001FE7FFE7FFE7F8001FE7F
      800180018001FE7FFE7FFE7F8001800100000000000000000000000000000000
      007C007C000000000000000000000000000000000000D205370A370A781EDA32
      FF7FFF7FFF7FFF7F781A380E370AD205000000000000D20D5726772AB93AFA46
      FF7F3C5BFF7FFF7FB93A98325726D20D000000008001FE7FFE7FFE7FFE7F8001
      800180018001FE7FFE7FFE7F8001800100000000000000000000000000000000
      007C007C007C00000000000000000000000000000000D20D572657229832D93E
      FF7FFF7F3B53FA46782E57265722D20D000000000000F3159836B93AFA46FF7F
      3B533B573B53FF7FFA46D93E9836F315000000008001FE7FFE7FFE7F80018001
      8001800180018001FE7FFE7F8001800100000000000000000000000000000000
      0000007C007C006C0000000000000000000000000000F31598369832B93EDA46
      FF7FFF7F1B53FA46B93A98369832F31500000000000034223B573C575C5B5C5F
      5C5F5C5F5C5F5C5F5C5B5C5B3B573522000000008001FE7FFE7F800180018001
      FE7F8001800180018001FE7F8001800100000000000000000000000000000000
      00000000007C007C005400000000000000000000000034223B573B573C575C5B
      5C5F5C5F5C5B3C573B573B573B533422000000000000552A7D677D679D679D67
      7D677D677D679D679D677D677D63552A000000008001FE7FFE7FFE7FFE7FFE7F
      FE7FFE7FFE7FFE7FFE7FFE7F8001800100000000000000000000000000000000
      0000000000000000007C006000000000000000000000552A7D677D637D637D67
      7D677D677D677D637D637D637C63552A000000000000552ADE77DE77DE77DE77
      DE77DE77DE77DE77DE77DE77BE73552E000000008001FE7FFE7FFE7FFE7FFE7F
      FE7FFE7FFE7FFE7FFE7FFE7F8001800100000000000000000000000000000000
      00000000000000000000007C00700000000000000000552ADE77DE77DE77DE77
      DE77DE77DE77DE77DE77DE77BE73552E000000000000D1157632763276327632
      763276327632763276327632762ED11500000000800180018001800180018001
      8001800180018001800180018001800100000000000000000000000000000000
      000000000000000000000000007C0000000000000000D1157632763276327632
      763276327632763276327632762ED11500000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DE7BDE7BDE7BDE7BDE7BFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008D59094509414B416C418C418C41
      8C418C41AD41EF4510463146314610469452000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000FF7FFF7F
      0000000000000000000000000000000000000000000000000000000000000000
      00000000104218630000000000000000000003780270026C026C026C02700270
      026C02680268026C026C026802640264CE3900001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000001042FF7FFF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      186318631042186318631863000000000000037C0274655C096D0A710378037C
      037802740274656C6670447002680264CE3900001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000FF7F17001700
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000010420000
      000000001042186310421042186318630000037C03786554734EFF7F5A7F037C
      037C037CE960FF7FFF7FCF69026C0264CE3900001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000001042FF7FFF7FFF7F
      1700FF7FFF7FFF7FFF7FFF7F0000000000000000000000001863186318631863
      18630000FF7F104218631863104210420000247C037C0270A644D65AFF7F337E
      247C6670BD77FF7FB56A037802700268CE3900001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000FF7FFF7FFF7F1042
      FF7F1042000018631863186300001863186300001863FF7FFF7FFF7F18631042
      000000001863104218631863186318630000457C037C0270026809391863FF7F
      4C7DBD77FF7F7B73037C037802700268CE3900001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F000000000000000000001042FF7FFF7F1042FF7F
      FF7FFF7FE07F1700FF7FFF7F0000000000001042FF7FFF7F1863104200000000
      FF7F18631042186310421863186318630000667C037C0274026802686B317B6F
      FF7FFF7FBD77457C037C037802700268CE3900001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FFF7FFF7F1042FF7F
      FF7F1700FF7FFF7F1F001042000000000000000010421042104210421863FF7F
      104210420000000000001042104218630000667C247C0378026C02680264F75E
      FF7FFF7F0A7D457C247C037C02700268CE3900001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000001042FF7FFF7F1042FF7FFF7F
      1700FF7FFF7FFF7FFF7F1F0000000000000000000000000000001042FF7F1042
      000000000000104210421863000010421042667C247C037C0270026C4B59FF7F
      FF7FFF7F5A7F667C457C037C02740268CE3900001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7F1042FF7FFF7F
      1700FF7F1700FF7FFF7F17001F0000000000000000000000000000001042FF7F
      00001042104218631863FF7F000010420000667C247C03780270C75CDE7BFF7F
      74629452FF7FB67E457C037C03740268CE3900001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000001042FF7F0000FF7FFF7FFF7F1700
      FF7FFF7FFF7FFF7F00000000FF7F1F0000000000000000000000000000001042
      000018631863FF7FFF7FFF7FFF7F00000000667C037C0378236C9C73FF7F196F
      026CA644D65AFF7F6D7D037C0374026CCE3900001042FF7FFF7FFF7FFF7F0000
      1863FF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7F00000000FF7FFF7F
      FF7F1700FF7F0000000000000000FF7F17000000000000000000000000000000
      1042FF7FFF7FFF7FFF7FFF7FFF7F00000000667C047C0374D65A9C735A6B036C
      027002700939F75E5A6B877803780270CE3900001042FF7FFF7FFF7FFF7F1863
      0000FF7FFF7FFF7FFF7F186300000000000000001042FF7FFF7FFF7F00000000
      FF7FFF7FFF7F0000000000000000000000000000000000000000000000000000
      00001042FF7FFF7FFF7FFF7FFF7FFF7F0000667C247C037486548558236C0378
      03780374037444604568247003780274CE3900001042FF7FFF7FFF7F0000FF7F
      1863FF7FFF7FFF7F186300000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      00001042FF7FFF7FFF7FFF7FFF7F10420000877C457C247C037C037C037C047C
      037C037C037C037C247C047C037C0378524A00001042FF7F1042104210420000
      104210421042104200000000000000000000000000000000000000001042FF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      000000001042FF7FFF7F10421042000000004C7D4C796D796D798E79AF79CF79
      D079117A327A537A747A747A957A957ADE7B0000104210421042000010421042
      1042104200000000000000000000000000000000000000000000000000000000
      1042000000000000000000000000000000000000000000000000000000000000
      00000000000010421042000000000000000000000000EF3D0000000000000000
      00000000000000000000EF3D0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000F75EF75EF75EF75E
      F75EF75EF75EF75EF75E0000000000000000000000000000FF7FE07F00420000
      0000000000000000000000000000000000000000000000004000000000000000
      0000000000000000000040000000000000000000000000004010000000000000
      000000000000000000004010000000000000000000000000F75E0000F75E0000
      F75E007C007C007CF75E00000000000000000042E07FFF7F0000000000000042
      004200000000104218631042000000000000000000000000210EA10900000000
      0000000000008000A92A0000000000000000000000000000207AA05D00000000
      0000000000008024A07E0000000000000000000000000000F75EF75EF75EF75E
      F75EF75EF75EF75EF75E0000000000000000000000000000FF7FE07F00420000
      00001042186318631042000010421042000000000000000020058213C212C004
      0000000023165047AA2E00000000000000000000000000002049A07FE07EC034
      000000042176607FC07E0000000000000000000000000000F75E0000F75E0000
      F75E0000F75E0000F75E00000000000000000042E07FFF7F0000000000000042
      0042000010421042186310420000000010420000000000004000400BE1136317
      8212041BEB37F047031600000000000000000000000000004010607FE07F607F
      807E007FE07FE07F00720000000000000000000000000000F75EF75EF75EF75E
      F75EF75EF75EF75EF75E0000000000000000000000000000FF7FE07FE07F0000
      0000104218631863104200001042104200000000000000000000A0068007E00B
      E317E51FE623C92FE00400000000000000000000000000000000007FE07FE07F
      E07FE07FE07FC07FE03C0000000000000000000000000000F75E0000F75E0000
      F75E0000F75E0000F75E00000000000000000042E07FFF7FFF7FFF7FE07FE07F
      E07F000010421042186310420000000010420000000000000000400A000B6007
      E00BE213E41B851F200000000000000000000000000000000000807EE07FE07F
      E07FE07FE07F807F20080000000000000000000000000000F75EF75EF75EF75E
      F75EF75EF75EF75EF75E0000000000000000000000420042E07FE07FFF7F0042
      004210421863186310420000104210420000000000000000E0008722A61EE20E
      2007A007E00BC317620E0000000000000000000000000000E038477FE67FE27F
      E07FE07FE07FC07F607E0000000000000000000000000000F75E0000F75E0000
      F75E0000F75E0000F75E00000000000000000000000000000042004200421042
      1863186310421042186310420000000010420000000020013453124FCD3AA826
      C416010B6007E00BC213A20E000000000000000000004051D47FF27FED7FE87F
      E47FE17FE07FE07FC07FA07E000000000000000000000000F75EF75EF75EF75E
      F75EF75EF75EF75EF75E00000000000000000000000000000000104218631863
      10421042186318631042000010421042000000008109FF7FFF7F9B6F355BF042
      CB32A722E312200BA007E00BC20E200000000000E169FF7FFF7FFB7FF57FF07F
      EB7FE77FE37FE07FE07FE07FE07E200C0000000000000000F75E000000000000
      0000000000000000F75E00000000000000000000000000000000186310421042
      1863186310421042FF7FFF7F0000000010428000C00020014005C311261E7863
      134FEF3E861E000AE00580052005000500008028E0384051A05D036EA67AF87F
      F37FEF7F267F407A007280592045003D0000000000000000F75E000000000000
      FF030000FF030000F75E00000000000000000000000000000000104218631863
      10421042FF7FFF7F186318631863FF7F0000000000000000000000000000124B
      996B565BA005000000000000000000000000000000000000000000000000927F
      F97FF67FE069000000000000000000000000000000000000F75E000000000000
      0000000000000000F75E00000000000000000000000000000000186310421042
      FF7F1863FF7F10021863FF7F104210420000000000000000000000000000A109
      FF7F565B20000000000000000000000000000000000000000000000000002172
      FF7FD67F2010000000000000000000000000000000000000F75EF75EF75EF75E
      F75EF75EF75EF75EF75E000000000000000000000000000000001042FF7F1863
      186318631002FF7F104210420000000000000000000000000000000000006000
      DC73E3110000000000000000000000000000000000000000000000000000401C
      FC7F637A0000000000000000000000000000000000000000F75EF75EF75EF75E
      F75EF75EF75EF75EF75E00000000000000000000000000000000000010421042
      FF7FFF7F10421042000000000000000000000000000000000000000000000000
      0312800000000000000000000000000000000000000000000000000000000000
      A37E8028000000000000000000000000000000000000EF3D0000000000000000
      00000000000000000000EF3D0000000000000000000000000000000000000000
      1042104200000000000000000000000000000000000000000000000000000000
      0005000000000000000000000000000000000000000000000000000000000000
      004500000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000A00000000100010000000000000500000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008F83FFFF0000FFFF87C3FFFF0000F00F
      8003FE070000E0078001FA070000C0038000E003000080018000C00300000001
      8000800300000001000080030000000100038087000000010003C18F00000001
      8003E38700000001C003E18700000001E003E1CF00008003E003E3FF0000C007
      E003FFFF0000E00FF003FFFF0000F01FFFBFF81F0000FFFFFF3FE0070000FFFF
      FE3FC0030000FFFFF80F80010000FFFFE00780010000E38FC00300000000E38F
      800100000000E10F000000000000E20F000000000000E20F000000000000F11F
      000000000000F11F000180010000F33F000380010000F33F8007C0030000FFFF
      C00FE0070000FFFFF01FF81F0000FFFFFFC1FFFFFFFFFFFFFF80FFFFFFFFFFFF
      FFC1C001C001C0018380C001C001C00101C1C001C001C0018380C001C001C001
      01C1C001C001C0018380C001C001C00101C1C001C001C00183F7C001C001C001
      EF43C001C001C001E807C001C001C001C17FC001C001C001EE3FC001C001C001
      FE3FC001C001C001FE3FFFFFFFFFFFFF80036000E0033FFF8003000080031FC7
      800300018003000300018003800300010001800380030001C003800380030003
      F003800380031FC7FC018003800331FFFE3C80038003E0FFFF8180038003C000
      FF0180038003C000FF0180038003F800FF8380038007C000FFC78001800FC000
      FFE70018801FE0FFFFFF007C807FF1FFFFF0FFFFFFFF0000C0088001F81F0000
      80048001C001000080048001C0010000A0008001C0010000A000800180010000
      900280018000000188018001800000018FFF8001800000018010800180000003
      801080018000000783F78001C001800FC4038001C001800F78018001C001801F
      001C8001C001801F0000FFFFFC1F801FFFFF0000FFFFFFFFFFFF0000E00FFBFF
      C0010000C007F07FC00100008003F00FC00100008003E003C00100008001E001
      C001000080018001C0010000C0010001C0010000E0018001C0010000F0038001
      C0010000F00F8001C0010000F00F0001C0010000F8070001C0010000FFFF8805
      C0010000FFFFFC0FFFFF0000FFFFFEFFFFFFFFFFE3FFFFFFFFFF8001E1FFFFFF
      C0018001E1FFC001C0018001C0FFC001C0018001807FC001C0018001807FC001
      C0018001803FC001C00180018C1FC001C0018001FE0FC001C0018001FE0FC001
      C0018001FF07C001C0018001FF83C001C0018001FFE1C001C0018001FFF1C001
      C0018001FFFBC001FFFFFFFFFFFFFFFF0000E003FBFFFF9F00008003F8FFFE07
      00008003F03FF80100008003F00FE00000008003E003800000008003E0000000
      00008003C007000000008003C0078000000080038007F000000080038003F801
      000080030019FC0100008003001CFE0100008007803FFF000000800FE03FFF00
      0000801FF87FFF830000807FFE7FFFCFC007E3FFFFFFFFFFC00780E7E7E7E7E7
      C0070001E3C7E3C7C0078000E00FE00FC0070000E00FE00FC0078000F00FF00F
      C0070000F00FF00FC0078000E007E007C007E000C003C003C007F00000000000
      C007F00000000000C007F000F83FF83FC007F001FC3FFC3FC007F007FC7FFC7F
      C007F81FFE7FFE7FC007FE7FFE7FFE7F00000000000000000000000000000000
      000000000000}
  end
  object PMenuWares: TPluginPopupMenu
    Images = ImageList
    Active = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 212
    Top = 304
    object NInsertW: TMenuItem
      Caption = '        Yeni v'#601'sait '#601'lav'#601' et'
      ImageIndex = 5
      OnClick = NInsertWClick
    end
    object NEditW: TMenuItem
      Caption = '        V'#601'saitin redakt'#601' edilm'#601'si'
      ImageIndex = 6
      OnClick = NEditWClick
    end
    object NDeleteWares: TMenuItem
      Caption = '        V'#601'saitin silinm'#601'si'
      ImageIndex = 8
      ShortCut = 46
      OnClick = NDeleteWaresClick
    end
    object NWaresTurnOver: TMenuItem
      Caption = '        V'#601'saitin d'#246'vriyy'#601'si'
      ImageIndex = 15
      object NTurnNB: TMenuItem
        Caption = '        Milli bank'
        ImageIndex = 15
        OnClick = NTurnNBClick
      end
      object NTurnNL: TMenuItem
        Caption = '         Vergi'
        ImageIndex = 15
        OnClick = NTurnNLClick
      end
    end
    object NStop_Calculate: TMenuItem
      Caption = '        Hesablanman'#305' dayand'#305'r'
      ImageIndex = 25
      object NStop_CalculateNB: TMenuItem
        Caption = '      Maliyy'#601
        ImageIndex = 25
        OnClick = NStop_CalculateNBClick
      end
      object NStop_CalculateNL: TMenuItem
        Caption = '      Vergi'
        ImageIndex = 25
        OnClick = NStop_CalculateNLClick
      end
    end
    object kart1: TMenuItem
      Caption = '        Kart'
      ImageIndex = 7
      OnClick = kart1Click
    end
  end
  object PMenuGroups: TPluginPopupMenu
    Images = ImageList
    OnPopup = PMenuGroupsPopup
    Active = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 268
    Top = 156
    object NAddGroups: TMenuItem
      Caption = '      V'#601'sait qrupunun '#601'lav'#601' edilm'#601'si'
      ImageIndex = 5
      OnClick = NAddGroupsClick
    end
    object NEditGroups: TMenuItem
      Caption = '      V'#601'sait qrupunun redakt'#601' edilm'#601'si'
      ImageIndex = 6
      OnClick = NEditGroupsClick
    end
    object NDeleteGroups: TMenuItem
      Caption = '      V'#601'sait qrupunun l'#601#287'v edilm'#601'si'
      Enabled = False
      ImageIndex = 4
      OnClick = NDeleteGroupsClick
    end
    object ImportExcel: TMenuItem
      Caption = '      Excel -d'#601'n q'#601'bul et'
      ImageIndex = 17
      OnClick = ImportExcelClick
    end
  end
  object PMenuToolBar: TPopupMenu
    Images = ImageList
    Left = 488
    Top = 105
    object NViewTurn: TMenuItem
      Caption = '       D'#246'vr'#252'yy'#601'l'#601'r'#601' tarix-l'#601'rl'#601' bax'#305#351
      ImageIndex = 26
      OnClick = NViewTurnClick
    end
    object NTurnExcelExport: TMenuItem
      Caption = '       B'#252't'#252'n d'#246'vr'#252'yy'#601'l'#601'r '#252'zr'#601' Excel'
      ImageIndex = 17
      OnClick = NTurnExcelExportClick
    end
    object N1: TMenuItem
      Caption = '       B'#252't'#252'n d'#246'vr'#252'yy'#601'l'#601'r '#252'zr'#601' Excel('#304'nventar tarixi '#252'zr'#601')'
      ImageIndex = 17
      Visible = False
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = '       Silin'#601'nl'#601'r'
      ImageIndex = 17
      OnClick = N2Click
    end
  end
  object PMenuCurrentTrun: TPopupMenu
    Images = ImageList
    Left = 384
    Top = 104
    object NQReport: TMenuItem
      Caption = '      Cari '#231'ap formas'#305
      ImageIndex = 7
      object NMilliBank: TMenuItem
        Caption = '     Maliyy'#601' '#252#231#252'n'
        ImageIndex = 5
        OnClick = NMilliBankClick
      end
      object NVergi: TMenuItem
        Caption = '     Vergi '#252#231#252'n'
        ImageIndex = 5
        OnClick = NVergiClick
      end
    end
    object NQReportAll: TMenuItem
      Caption = '      Qruplar '#252'zr'#601' '#231'ap'
      ImageIndex = 7
      OnClick = NQReportAllClick
    end
    object ExcelExport: TMenuItem
      Caption = '      Excel-e hesabat formas'#305'(B'#252't'#252'n qruplar)'
      ImageIndex = 17
      OnClick = ExcelExportClick
    end
    object Excele1: TMenuItem
      Caption = '      Excel-e hesabat formas'#305
      ImageIndex = 0
      OnClick = Excele1Click
    end
  end
  object TimerA: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerATimer
    Left = 264
    Top = 201
  end
  object TimerB: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerBTimer
    Left = 232
    Top = 201
  end
  object PMenuCalc: TPopupMenu
    Images = ImageList
    Left = 184
    Top = 107
    object NCalculateMonth: TMenuItem
      Tag = 1
      Caption = '        Hesablama verm'#601'k'
      ImageIndex = 0
      OnClick = NCalculateMonthClick
    end
    object NCalcAbort: TMenuItem
      Caption = '        Hesablaman'#305' l'#601#287'v etm'#601'k'
      ImageIndex = 21
      OnClick = NCalcAbortClick
    end
  end
  object PMenuTrans: TPopupMenu
    Images = ImageList
    Left = 272
    Top = 108
    object NTransaction: TMenuItem
      Caption = '       '#214'd'#601'ni'#351'l'#601'r'
      ImageIndex = 1
      OnClick = NTransactionClick
    end
    object NTransOut: TMenuItem
      Caption = '       F'#601'rq '#246'd'#601'ni'#351'l'#601'ri'
      ImageIndex = 24
      Visible = False
      OnClick = NTransOutClick
    end
    object Vsaitinalsat1: TMenuItem
      Caption = '       V'#601'saitin Al/Sat'
      OnClick = Vsaitinalsat1Click
    end
  end
  object PopupMenuFilter: TPopupMenu
    Images = ImageList
    Left = 592
    Top = 101
    object FilterAll: TMenuItem
      Caption = '      Filter t'#601'tbiq et'
      ImageIndex = 31
      OnClick = FilterAllClick
    end
    object FilterNone: TMenuItem
      Caption = '      Filterd'#601'n azad et'
      ImageIndex = 21
      OnClick = FilterNoneClick
    end
    object N3: TMenuItem
      Caption = '      V'#601'saiti se'#231
      OnClick = N3Click
    end
  end
  object ActionList: TActionList
    Images = ImageList
    Left = 688
    Top = 181
    object RefreshAll: TAction
      Caption = 'RefreshAll'
      ImageIndex = 34
      ShortCut = 116
      OnExecute = RefreshAllExecute
    end
  end
  object PExpiredRepar: TPopupMenu
    Images = ImageList
    Left = 704
    Top = 101
    object PerDeg: TMenuItem
      Caption = '     Faiz d'#601'r'#601'c'#601'si'
      ImageIndex = 20
      Visible = False
      OnClick = PerDegClick
    end
    object ExprWares: TMenuItem
      Caption = '     Vaxt'#305' ke'#231'mi'#351'l'#601'ri arxiv'#601' atmaq'
      ImageIndex = 21
      Visible = False
      OnClick = ExprWaresClick
    end
    object aaa1: TMenuItem
      Caption = '     Arxiv'#601
      ImageIndex = 7
      OnClick = aaa1Click
    end
    object gggh1: TMenuItem
      Caption = '     V'#601'saitin sazlanmas'#305
      ImageIndex = 19
      Visible = False
      OnClick = gggh1Click
    end
  end
  object CMExcelExport1: TCMExcelExport
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
    Left = 408
    Top = 197
  end
end
