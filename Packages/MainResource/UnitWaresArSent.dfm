object ArWaresS: TArWaresS
  Left = 695
  Top = 269
  Caption = 'ArWaresS'
  ClientHeight = 435
  ClientWidth = 663
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEhGroupNB: TDBGridEh
    Left = 0
    Top = 0
    Width = 473
    Height = 153
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
    TabOrder = 0
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
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object DBGridWaresNB: TDBGridEh
    Left = 0
    Top = 159
    Width = 662
    Height = 287
    Color = 15855856
    DataGrouping.GroupLevels = <>
    DataSource = DataModWares.DSArWaresS
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
    TabOrder = 1
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
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object GroupBox1: TGroupBox
    Left = 480
    Top = 0
    Width = 181
    Height = 153
    Caption = #1058#1103#1089#1076#1080#1075#1083#1103#1084#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object lbArWaresCommit: TLabel
      Left = 10
      Top = 16
      Width = 156
      Height = 71
      AutoSize = False
      Caption = 
        ' '#1040#1088#1093#1080#1074#1103' '#1101#1102#1085#1076#1103#1088#1084#1103#1082' '#1080#1089#1090#1103#1076#1080#1081#1080#1085#1080#1079' '#1084#1103#1089#1072#1080#1090#1083#1103#1088#1080' '#1089#1077#1095#1080#1085' '#1074#1103' '#1054#1050' '#1076#1094#1081#1084#1103#1089#1080#1085#1103' '#1089 +
        #1099#1093#1099#1085'   '
      WordWrap = True
    end
    object btnArWaresCommit: TBitBtn
      Left = 48
      Top = 112
      Width = 75
      Height = 25
      Caption = 'OK'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
    end
  end
end
