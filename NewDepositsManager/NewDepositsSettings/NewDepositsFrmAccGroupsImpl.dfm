object NewDepositsFrmAccGroups: TNewDepositsFrmAccGroups
  Left = 0
  Top = 0
  ClientHeight = 489
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 470
    Width = 367
    Height = 19
    Panels = <>
    ExplicitTop = 332
    ExplicitWidth = 267
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 367
    Height = 470
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 613
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 365
      Height = 160
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 0
      ExplicitWidth = 317
      object DBGridEh1: TDBGridEh
        Left = 2
        Top = 2
        Width = 361
        Height = 156
        Align = alClient
        DataGrouping.GroupLevels = <>
        DataSource = acc_zonesDatSrc
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        RowDetailPanel.Color = clBtnFace
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        VertScrollBar.VisibleMode = sbNeverShowEh
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ZONEID'
            Footers = <>
            Title.Caption = #8470
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
            FieldName = 'DESCRIPTION'
            Footers = <>
            Title.Caption = #1043#1088#1091#1087#1091#1085' '#1072#1076#1099
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -12
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 202
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 194
      Width = 365
      Height = 274
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitTop = 161
      ExplicitWidth = 317
      object DBGridEh2: TDBGridEh
        Left = 2
        Top = 2
        Width = 361
        Height = 270
        Align = alClient
        DataGrouping.GroupLevels = <>
        DataSource = acc_zone_infoDatSrc
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        RowDetailPanel.Color = clBtnFace
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        VertScrollBar.VisibleMode = sbNeverShowEh
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ZONEID'
            Footers = <>
            Title.Caption = #1043#1088#1091#1087#1091#1085'  '#8470
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -12
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 73
          end
          item
            EditButtons = <>
            FieldName = 'ACCGROUP'
            Footers = <>
            Title.Caption = #1041#1072#1083#1072#1085#1089' '#1097#1077#1089#1072#1073#1099
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -12
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 95
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 161
      Width = 365
      Height = 33
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object DBNavigator1: TDBNavigator
        Left = 2
        Top = 2
        Width = 361
        Height = 27
        DataSource = acc_zone_infoDatSrc
        Align = alTop
        Flat = True
        TabOrder = 0
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 641
      end
    end
  end
  object acc_zone_info: TOracleDataSet
    SQL.Strings = (
      'SELECT rowid,zoneid, accgroup'
      '  FROM dm_acc_zone_info'
      ''
      'where zoneid = :zoneid')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A005A004F004E00450049004400040000000000
      000000000000}
    Master = acc_zones
    MasterFields = 'ZONEID'
    DetailFields = 'ZONEID'
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 96
    object acc_zone_infoZONEID: TFloatField
      FieldName = 'ZONEID'
    end
    object acc_zone_infoACCGROUP: TFloatField
      FieldName = 'ACCGROUP'
    end
  end
  object acc_zones: TOracleDataSet
    SQL.Strings = (
      'SELECT zoneid ,description'
      '  FROM dm_acc_zones'
      '  order by zoneid')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 64
    object acc_zonesZONEID: TFloatField
      FieldName = 'ZONEID'
      Required = True
    end
    object acc_zonesDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 200
    end
  end
  object acc_zonesDatSrc: TDataSource
    DataSet = acc_zones
    Left = 56
    Top = 64
  end
  object acc_zone_infoDatSrc: TDataSource
    DataSet = acc_zone_info
    Left = 56
    Top = 96
  end
end
