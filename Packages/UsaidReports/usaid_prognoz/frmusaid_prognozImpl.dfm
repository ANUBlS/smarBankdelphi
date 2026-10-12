object frmusaid_prognoz: Tfrmusaid_prognoz
  Left = 563
  Top = 212
  BorderIcons = [biSystemMenu]
  Caption = 'Proqnoz'
  ClientHeight = 339
  ClientWidth = 280
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 280
    Height = 135
    Align = alTop
    Caption = #1060#1080#1083#1080#1072#1083
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 16
      Width = 276
      Height = 117
      Align = alClient
      DataSource = dmusaid_prognoz.Branchesds
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
          Width = 251
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 135
    Width = 280
    Height = 129
    Align = alClient
    Caption = #1050#1088#1077#1076#1080#1090#1080#1085' '#1090#1080#1087#1080
    TabOrder = 1
    object DBGridEh2: TDBGridEh
      Left = 2
      Top = 16
      Width = 276
      Height = 111
      Align = alClient
      DataSource = dmusaid_prognoz.CreditTypesds
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
      OnDblClick = DBGridEh2DblClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DESCRIPTION'
          Footers = <>
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 251
        end>
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 264
    Width = 280
    Height = 75
    Align = alBottom
    Caption = #1055#1088#1086#1075#1085#1086#1079
    TabOrder = 2
    object Gridpr: TDBGridEh
      Left = 2
      Top = 16
      Width = 276
      Height = 57
      Align = alClient
      DataSource = dmusaid_prognoz.progds
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
      OnKeyDown = GridprKeyDown
      OnKeyPress = GridprKeyPress
      Columns = <
        item
          EditButtons = <>
          FieldName = 'PROGNOZ'
          Footers = <>
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 69
        end>
    end
  end
end
