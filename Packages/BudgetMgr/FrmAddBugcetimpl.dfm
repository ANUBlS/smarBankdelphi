object BudgetSetAccaontfr: TBudgetSetAccaontfr
  Left = 495
  Top = 346
  BorderIcons = [biSystemMenu]
  ClientHeight = 415
  ClientWidth = 279
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 279
    Height = 178
    Align = alTop
    TabOrder = 0
    object DBGridEh2: TDBGridEh
      Left = 2
      Top = 15
      Width = 275
      Height = 161
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = DMBudget.articles_accgroupSrc
      Flat = True
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
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DESCRIPTION'
          Footers = <>
          Title.Caption = #1065#1077#1089#1072#1073' '#1075#1091#1088#1091#1087#1083#1072#1088#1099
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 203
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 179
    Width = 279
    Height = 236
    Align = alBottom
    TabOrder = 1
    object Panel1: TPanel
      Left = 2
      Top = 204
      Width = 275
      Height = 30
      Align = alBottom
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 226
        Top = 3
        Width = 43
        Height = 30
        Cursor = crHandPoint
        Caption = #1041#1072#1100#1083#1072
        Flat = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object Okbtn: TButton
        Left = -62
        Top = 1
        Width = 75
        Height = 22
        Caption = #1043#1103#1073#1091#1083
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = OkbtnClick
      end
      object DBNavigator1: TDBNavigator
        Left = -8
        Top = 2
        Width = 234
        Height = 27
        Cursor = crHandPoint
        DataSource = DMBudget.articles_accSrc
        VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost, nbRefresh]
        Flat = True
        TabOrder = 1
      end
    end
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 15
      Width = 275
      Height = 189
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = DMBudget.articles_accSrc
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
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
      ParentFont = False
      RowDetailPanel.Color = clBtnFace
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ACC'
          Footers = <>
          Title.Caption = #1065#1077#1089#1072#1073' '#8470
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 194
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
end
