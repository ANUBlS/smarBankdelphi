object FrmpbfFilialsaccs: TFrmpbfFilialsaccs
  Left = 232
  Top = 146
  BorderIcons = [biSystemMenu]
  Caption = 'FrmpbfFilialsaccs'
  ClientHeight = 359
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnKeyPress = smKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 305
    Height = 148
    Align = alTop
    Caption = '`'
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 16
      Width = 301
      Height = 130
      Align = alClient
      DataSource = PBFFilialsds
      FooterColor = clWindow
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Azl Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbNeverShowEh
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
          Width = 215
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 148
    Width = 305
    Height = 192
    Align = alClient
    Caption = #1065#1077#1089#1072#1073#1083#1072#1088
    TabOrder = 1
    object DBGridEh2: TDBGridEh
      Left = 2
      Top = 16
      Width = 301
      Height = 174
      Align = alClient
      DataSource = pbf_filialsaccountds
      FooterColor = clWindow
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Azl Sans Serif'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbNeverShowEh
      OnKeyDown = DBGridEh2KeyDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'currencyname'
          Footers = <>
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 59
        end
        item
          EditButtons = <>
          FieldName = 'ACCTYPE'
          Footers = <>
          PickList.Strings = (
            '10ACCOUNT'
            '45ACCOUNT'
            '28ACCOUNT'
            '48ACCOUNT'
            '45HACCOUNT'
            '28HACCOUNT'
            '48HACCOUNT'
            '45AZERCELLACC'
            '45BAKCELLACC'
            '45NARACC'
            '45GASACC'
            '45LIGHTACC'
            '45WATERACC'
            '48AZERCELLACC'
            '48BAKCELLACC'
            '48NARACC'
            '48GASACC'
            '48LIGHTACC'
            '48WATERACC'
            '45HEEDAZERCELLACC'
            '45HEEDBAKCELLACC'
            '45HEEDNARACC'
            '45HEEDGASACC'
            '45HEEDLIGHTACC'
            '45HEEDWATERACC'
            '45HEEDSELFAZERCELLACC'
            '45HEEDSELFBAKCELLACC'
            '45HEEDSELFNARACC'
            '45HEEDSELFGASACC'
            '45HEEDSELFLIGHTACC'
            '45HEEDSELFWATERACC'
            '45HEEDSELFLIGHTACC1'
            '45LIGHT1ACC'
            '45HEEDLIGHT1ACC'
            '45LIGHT2ACC'
            '45HEEDLIGHT2ACC'
            '45LIGHT3ACC'
            '45HEEDLIGHT3ACC'
            '45LIGHT4ACC'
            '45HEEDLIGHT4ACC'
            '')
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = 'accname'
          Footers = <>
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 165
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 340
    Width = 305
    Height = 19
    Panels = <>
  end
  object PBFFilials: TOracleDataSet
    SQL.Strings = (
      'select id,name from smart.filial_t'
      'order by id')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 8
    Top = 48
    object PBFFilialsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object PBFFilialsNAME: TWideStringField
      DisplayLabel = #1040#1076#1099
      FieldName = 'NAME'
      Size = 90
    end
  end
  object pbf_filialsaccount: TOracleDataSet
    SQL.Strings = (
      'SELECT rowid, filialid, currency, accid, acctype'
      '  FROM pbf_filialsaccount '
      ''
      'where filialid = :filialid')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00460049004C00490041004C00490044000400
      00000000000000000000}
    Master = PBFFilials
    MasterFields = 'ID'
    DetailFields = 'FILIALID'
    Session = sboapiDataModule.SBSession
    Left = 8
    Top = 240
    object pbf_filialsaccountFILIALID: TFloatField
      FieldName = 'FILIALID'
      Required = True
    end
    object pbf_filialsaccountCURRENCY: TFloatField
      FieldName = 'CURRENCY'
      Required = True
    end
    object pbf_filialsaccountcurrencyname: TWideStringField
      DisplayLabel = '$'
      FieldKind = fkLookup
      FieldName = 'currencyname'
      LookupDataSet = PBFValutes
      LookupKeyFields = 'VALUTE'
      LookupResultField = 'VAL_NAME'
      KeyFields = 'CURRENCY'
      Size = 10
      Lookup = True
    end
    object pbf_filialsaccountaccname: TWideStringField
      DisplayLabel = #1065#1077#1089#1072#1073' '#8470
      FieldKind = fkLookup
      FieldName = 'accname'
      LookupDataSet = PBFAccs
      LookupKeyFields = 'ID'
      LookupResultField = 'ACC_NO'
      KeyFields = 'ACCID'
      Size = 25
      Lookup = True
    end
    object pbf_filialsaccountACCTYPE: TWideStringField
      DisplayLabel = #1065#1077#1089#1072#1073#1099#1085' '#1090#1080#1087#1080
      FieldName = 'ACCTYPE'
      Required = True
      Size = 100
    end
    object pbf_filialsaccountACCID: TFloatField
      FieldName = 'ACCID'
      Required = True
    end
  end
  object PBFFilialsds: TDataSource
    DataSet = PBFFilials
    Left = 40
    Top = 48
  end
  object pbf_filialsaccountds: TDataSource
    DataSet = pbf_filialsaccount
    Left = 40
    Top = 240
  end
  object PBFAccs: TOracleDataSet
    SQL.Strings = (
      'select id,acc_no from smart.account'
      ''
      'where /*filial = :filial'
      ' and*/ close_dat is null and'
      'bal_cn1 in (SELECT  balance'
      '  FROM pbf_interbankaccs '
      ')'
      ''
      'order by acc_no'
      '')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 80
    Top = 242
    object PBFAccsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object PBFAccsACC_NO: TWideStringField
      FieldName = 'ACC_NO'
    end
  end
  object PBFValutes: TOracleDataSet
    SQL.Strings = (
      'select valute,val_name from avalute_t')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 112
    Top = 242
    object PBFValutesVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object PBFValutesVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
  end
end
