object FrmeditBudget: TFrmeditBudget
  Left = 359
  Top = 192
  BorderIcons = [biSystemMenu]
  ClientHeight = 212
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button2: TButton
    Left = 320
    Top = 176
    Width = 75
    Height = 25
    Caption = #1041#1072#1100#1083#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button2Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 408
    Height = 169
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 2
      Top = 9
      Width = 40
      Height = 14
      Caption = #1057#1090#1072#1090#1091#1089':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 118
      Top = 10
      Width = 25
      Height = 14
      Caption = #1040#1076#1099':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object combobox: TComboBox
      Left = 37
      Top = 6
      Width = 78
      Height = 22
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Items.Strings = (
        #1069#1103#1083#1080#1088
        #1061#1103#1088#1078)
    end
    object EditName: TDBEditEh
      Left = 140
      Top = 6
      Width = 162
      Height = 22
      DataField = 'NAME'
      DataSource = DMBudget.AddArtDatSrc
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Visible = True
    end
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 32
      Width = 993
      Height = 134
      DataGrouping.GroupLevels = <>
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgMultiSelect]
      RowDetailPanel.Color = clBtnFace
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NUMBEROFITEM'
          Footers = <>
          Title.Caption = #8470
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Footers = <>
          Title.Caption = #1040#1076#1099
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 174
        end
        item
          EditButtons = <>
          FieldName = 'a'
          Footers = <>
          Title.Caption = #1065#1077#1089#1072#1073
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 127
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object DBNavigator1: TDBNavigator
      Left = 306
      Top = 6
      Width = 100
      Height = 24
      DataSource = DMBudget.AddArtDatSrc
      VisibleButtons = [nbInsert, nbEdit, nbPost, nbCancel]
      Flat = True
      TabOrder = 3
    end
  end
end
