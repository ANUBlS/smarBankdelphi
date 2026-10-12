object frmOtherSetup: TfrmOtherSetup
  Left = 298
  Top = 119
  BorderIcons = [biSystemMenu]
  ClientHeight = 439
  ClientWidth = 355
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 420
    Width = 355
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 355
    Height = 201
    Align = alTop
    Caption = #1070#1083#1082#1103
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 40
      Width = 351
      Height = 159
      Align = alClient
      DataSource = Countriesds
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
      Columns = <
        item
          EditButtons = <>
          FieldName = 'CODE'
          Footers = <>
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 63
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 252
        end>
    end
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 15
      Width = 351
      Height = 25
      DataSource = Countriesds
      Align = alTop
      Flat = True
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 201
    Width = 355
    Height = 219
    Align = alClient
    Caption = #1057#1099#1100#1086#1088#1090#1072' '#1096#1080#1088#1082#1103#1090#1080
    TabOrder = 2
    object DBGridEh2: TDBGridEh
      Left = 2
      Top = 40
      Width = 351
      Height = 177
      Align = alClient
      DataSource = insagencyds
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
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 63
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 252
        end>
    end
    object DBNavigator2: TDBNavigator
      Left = 2
      Top = 15
      Width = 351
      Height = 25
      DataSource = insagencyds
      Align = alTop
      Flat = True
      TabOrder = 1
    end
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = #1044#1080#1101#1103#1088' '#1084#1103#1083#1091#1084#1072#1090#1083#1072#1088
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 16
    Top = 312
  end
  object Countries: TOracleDataSet
    SQL.Strings = (
      'SELECT rowid,code, name'
      '  FROM cm_countrys ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000800000043004F0044004500010000000000080000004E00
      41004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 16
    Top = 264
    object CountriesCODE: TStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'CODE'
      Required = True
      Size = 3
    end
    object CountriesNAME: TStringField
      DisplayLabel = #1040#1076#1099
      FieldName = 'NAME'
      Required = True
      Size = 255
    end
  end
  object insagency: TOracleDataSet
    SQL.Strings = (
      'SELECT rowid,id, name'
      '  FROM cm_insuranceagency ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 264
    object insagencyID: TIntegerField
      DisplayLabel = #8470
      FieldName = 'ID'
      ReadOnly = True
    end
    object insagencyNAME: TStringField
      DisplayLabel = #1040#1076#1099
      FieldName = 'NAME'
      Required = True
      Size = 90
    end
  end
  object Countriesds: TDataSource
    DataSet = Countries
    Left = 16
    Top = 232
  end
  object insagencyds: TDataSource
    DataSet = insagency
    Left = 48
    Top = 232
  end
end
