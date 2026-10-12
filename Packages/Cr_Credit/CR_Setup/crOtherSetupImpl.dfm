object frmOtherSetup: TfrmOtherSetup
  Left = 298
  Top = 119
  BorderIcons = [biSystemMenu]
  ClientHeight = 446
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
  TextHeight = 14
  object StatusBar1: TStatusBar
    Left = 0
    Top = 427
    Width = 355
    Height = 19
    Panels = <>
    ExplicitTop = 452
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 355
    Height = 216
    Align = alTop
    Caption = #350#235#234#255
    TabOrder = 1
    ExplicitWidth = 382
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 43
      Width = 378
      Height = 171
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
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 68
        end
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
          Width = 271
        end>
    end
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 16
      Width = 378
      Height = 27
      DataSource = Countriesds
      Align = alTop
      Flat = True
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 216
    Width = 355
    Height = 211
    Align = alClient
    Caption = #209#251#252#238#287#242#224' '#248#232#287#234#255#242#232
    TabOrder = 2
    ExplicitWidth = 382
    ExplicitHeight = 236
    object DBGridEh2: TDBGridEh
      Left = 2
      Top = 43
      Width = 378
      Height = 191
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
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 68
        end
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
          Width = 271
        end>
    end
    object DBNavigator2: TDBNavigator
      Left = 2
      Top = 16
      Width = 378
      Height = 27
      DataSource = insagencyds
      Align = alTop
      Flat = True
      TabOrder = 1
    end
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = #196#232#305#255#287' '#236#255#235#243#236#224#242#235#224#287
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
      '  FROM cr_countrys ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000800000043004F0044004500010000000000080000004E00
      41004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 16
    Top = 264
    object CountriesCODE: TStringField
      DisplayLabel = #202#238#228
      FieldName = 'CODE'
      Required = True
      Size = 3
    end
    object CountriesNAME: TStringField
      DisplayLabel = #192#228#251
      FieldName = 'NAME'
      Required = True
      Size = 255
    end
  end
  object insagency: TOracleDataSet
    SQL.Strings = (
      'SELECT rowid,id, name'
      '  FROM cr_insuranceagency ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 264
    object insagencyID: TIntegerField
      DisplayLabel = #185
      FieldName = 'ID'
      ReadOnly = True
    end
    object insagencyNAME: TStringField
      DisplayLabel = #192#228#251
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
