object frmAccGroups: TfrmAccGroups
  Left = 458
  Top = 140
  BorderIcons = [biSystemMenu]
  Caption = 'Hesab qruplar'#305
  ClientHeight = 405
  ClientWidth = 276
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 276
    Height = 144
    Align = alTop
    DataSource = acc_zonesDatSrc
    FooterColor = clWindow
    FooterFont.Charset = RUSSIAN_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
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
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
      end
      item
        EditButtons = <>
        FieldName = 'DESCRIPTION'
        Footers = <>
        Title.Caption = 'Qrupun ad'#305
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 188
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 144
    Width = 276
    Height = 25
    DataSource = acc_zone_infoDatSrc
    Align = alTop
    Flat = True
    TabOrder = 1
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 169
    Width = 276
    Height = 217
    Align = alClient
    DataSource = acc_zone_infoDatSrc
    FooterColor = clWindow
    FooterFont.Charset = RUSSIAN_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    TabOrder = 2
    TitleFont.Charset = RUSSIAN_CHARSET
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
        Title.Caption = 'Qrupun  '#8470
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'ACCGROUP'
        Footers = <>
        Title.Caption = 'Balans hesab'#305
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 88
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 386
    Width = 276
    Height = 19
    Panels = <>
  end
  object acc_zones: TOracleDataSet
    SQL.Strings = (
      'SELECT zoneid ,description'
      '  FROM sbcm_acc_zones'
      '  order by zoneid')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C0000005A004F004E004500490044000100000000001600
      00004400450053004300520049005000540049004F004E00010000000000}
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
  object acc_zone_info: TOracleDataSet
    SQL.Strings = (
      'SELECT rowid,zoneid, accgroup'
      '  FROM sbcm_acc_zone_info'
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
  object acc_zone_infoDatSrc: TDataSource
    DataSet = acc_zone_info
    Left = 56
    Top = 96
  end
end
