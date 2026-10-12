object ArchiveWares: TArchiveWares
  Left = 595
  Top = 230
  Caption = 'ArchiveWares'
  ClientHeight = 481
  ClientWidth = 763
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 763
    Height = 54
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label9: TLabel
      Left = 466
      Top = 10
      Width = 97
      Height = 14
      Caption = #1041#1072#1096#1083#1072#1085#1100#1099#1078' '#1090#1072#1088#1080#1093':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 467
      Top = 32
      Width = 55
      Height = 14
      Caption = #1057#1086#1085' '#1090#1072#1088#1080#1093':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object BitBtnAr: TBitBtn
      Left = 147
      Top = 5
      Width = 102
      Height = 47
      Caption = #1040#1088#1093#1080#1074#1103' '#1101#1102#1085#1076#1103#1088#1084#1103#1082
      DoubleBuffered = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtnArClick
    end
    object DTP_B: TDateTimePicker
      Left = 553
      Top = 5
      Width = 86
      Height = 21
      Date = 39268.397280266200000000
      Time = 39268.397280266200000000
      TabOrder = 1
    end
    object DTP_E: TDateTimePicker
      Left = 553
      Top = 29
      Width = 87
      Height = 21
      Date = 39268.397411203710000000
      Time = 39268.397411203710000000
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 645
      Top = 4
      Width = 75
      Height = 35
      Caption = #1049#1077#1085#1080#1083#1103
      DoubleBuffered = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial AzLat'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 4
      Top = 5
      Width = 136
      Height = 47
      Caption = #1040#1088#1093#1080#1074#1103' '#1101#1102#1076#1103#1088#1080#1083#1084#1103#1083#1080' '#1074#1103#1089#1072#1080#1090#1083#1103#1088
      DoubleBuffered = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn2Click
    end
  end
  object DBGridEhArGr: TDBGridEh
    Left = 0
    Top = 54
    Width = 763
    Height = 166
    Align = alTop
    Color = 15855856
    ColumnDefValues.AutoDropDown = True
    ColumnDefValues.DropDownSizing = True
    ColumnDefValues.EndEllipsis = True
    DataGrouping.GroupLevels = <>
    DataSource = DataModWares.DSGroupsAr
    EditActions = [geaCutEh, geaCopyEh, geaSelectAllEh]
    FixedColor = 9512207
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
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
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ROWNUM'
        Footers = <>
        Title.Caption = #8470
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 22
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1071#1089#1072#1089' '#1074#1103#1089#1072#1080#1090' '#1075#1088#1091#1087#1091
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = [fsBold]
        Title.ImageIndex = 0
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
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 27
      end
      item
        EditButtons = <>
        FieldName = 'DEBTACCNO'
        Footers = <>
        Title.Caption = #1044#1077#1073#1077#1090' '#1097#1077#1089#1072#1073
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 105
      end
      item
        EditButtons = <>
        FieldName = 'CREDITACCNO'
        Footers = <>
        Title.Caption = #1050#1088#1077#1076#1080#1090' '#1097#1077#1089#1072#1073
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'MAINACCNO'
        Footers = <>
        Title.Caption = #1071#1089#1072#1089' '#1074#1103#1089#1072#1080#1090' '#1097#1077#1089#1072#1073#1099
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 134
      end
      item
        EditButtons = <>
        FieldName = 'SALEACCNO'
        Footers = <>
        Title.Caption = #1040#1083#1075#1099' - '#1057#1072#1090#1075#1099' / '#1047#1103#1088#1103#1088
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 152
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object DBGridArWares: TDBGridEh
    Left = 0
    Top = 220
    Width = 763
    Height = 168
    Align = alTop
    Color = 15855856
    DataGrouping.GroupLevels = <>
    DataSource = DataModWares.DSourArWares
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
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    RowDetailPanel.Color = clBtnFace
    TabOrder = 2
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Checkboxes = False
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
        FieldName = 'PERCENT'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = ' %'
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 28
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
        FieldName = 'CLOSE_FORMAT'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = '#'
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 16
      end
      item
        EditButtons = <>
        FieldName = 'FIRST_PRICE'
        Footers = <>
        Title.Caption = #1048#1083#1082#1080#1085' '#1076#1103#1081#1103#1088
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'REMAINDER'
        Footers = <>
        Title.Caption = #1043#1072#1083#1099#1075' '#1076#1103#1081#1103#1088
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'ALL_AMORT'
        Footers = <>
        Title.Caption = #1049#1099#1101#1099#1083#1084#1099#1096' '#1072#1084#1086#1088#1090'.'
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'AMORT'
        Footers = <>
        Title.Caption = #1040#1084#1086#1088#1090#1080#1079#1072#1089#1080#1081#1072
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 77
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
        Width = 105
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
        Width = 71
      end
      item
        EditButtons = <>
        FieldName = 'USER_NAME'
        Footers = <>
        Title.Caption = #1048#1089#1090#1080#1092#1072#1076#1103#1095#1080
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 92
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 388
    Width = 763
    Height = 93
    Align = alClient
    TabOrder = 3
    object GroupBox1: TGroupBox
      Left = 1
      Top = 0
      Width = 385
      Height = 61
      Caption = 'Maliyy'#1103
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial AzLat'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 11
        Top = 17
        Width = 65
        Height = 14
        Caption = #1048#1083#1082#1080#1085' '#1076#1103#1081#1103#1088
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial AzLat'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 99
        Top = 17
        Width = 63
        Height = 14
        Caption = #1043#1072#1083#1099#1075' '#1076#1103#1081#1103#1088
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial AzLat'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 201
        Top = 17
        Width = 75
        Height = 14
        Caption = #1049#1099#1101#1099#1083' '#1072#1084#1086#1088#1090'.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial AzLat'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 297
        Top = 17
        Width = 75
        Height = 14
        Caption = #1040#1084#1086#1088#1090#1080#1079#1072#1089#1080#1081#1072
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial AzLat'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 9
        Top = 32
        Width = 83
        Height = 22
        DataField = 'FIRST_PRICE'
        DataSource = DataModWares.DSSumWaresAr
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 95
        Top = 32
        Width = 98
        Height = 22
        DataField = 'REMAINDER'
        DataSource = DataModWares.DSSumWaresAr
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 196
        Top = 32
        Width = 95
        Height = 22
        DataField = 'ALL_AMORT'
        DataSource = DataModWares.DSSumWaresAr
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 294
        Top = 32
        Width = 87
        Height = 22
        DataField = 'AMORT'
        DataSource = DataModWares.DSSumWaresAr
        TabOrder = 3
      end
    end
    object GroupBox2: TGroupBox
      Left = 388
      Top = 0
      Width = 374
      Height = 61
      Caption = 'Vergi'
      TabOrder = 1
      object Label5: TLabel
        Left = 8
        Top = 16
        Width = 65
        Height = 14
        Caption = #1048#1083#1082#1080#1085' '#1076#1103#1081#1103#1088
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial AzLat'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 104
        Top = 16
        Width = 63
        Height = 14
        Caption = #1043#1072#1083#1099#1075' '#1076#1103#1081#1103#1088
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial AzLat'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 198
        Top = 16
        Width = 75
        Height = 14
        Caption = #1049#1099#1101#1099#1083' '#1072#1084#1086#1088#1090'.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial AzLat'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 279
        Top = 16
        Width = 75
        Height = 14
        BiDiMode = bdLeftToRight
        Caption = #1040#1084#1086#1088#1090#1080#1079#1072#1089#1080#1081#1072
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial AzLat'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
      end
      object DBEdit5: TDBEdit
        Left = 5
        Top = 32
        Width = 94
        Height = 21
        DataField = 'TAX_FIRST_PRICE'
        DataSource = DataModWares.DSSumWaresAr
        TabOrder = 0
      end
      object DBEdit6: TDBEdit
        Left = 101
        Top = 32
        Width = 93
        Height = 21
        DataField = 'TAX_REMAINDER'
        DataSource = DataModWares.DSSumWaresAr
        TabOrder = 1
      end
      object DBEdit7: TDBEdit
        Left = 196
        Top = 32
        Width = 78
        Height = 21
        DataField = 'TAX_ALL_AMORT'
        DataSource = DataModWares.DSSumWaresAr
        TabOrder = 2
      end
      object DBEdit8: TDBEdit
        Left = 276
        Top = 32
        Width = 94
        Height = 21
        DataField = 'TAX_AMORT'
        DataSource = DataModWares.DSSumWaresAr
        TabOrder = 3
      end
    end
  end
end
