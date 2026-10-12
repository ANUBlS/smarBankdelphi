object frmCategories: TfrmCategories
  Left = 380
  Top = 169
  Width = 272
  Height = 340
  BorderIcons = [biSystemMenu]
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
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 294
    Width = 264
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 264
    Height = 24
    DataSource = CategoriesDatSrc
    Align = alTop
    Flat = True
    TabOrder = 1
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 24
    Width = 264
    Height = 270
    Align = alClient
    DataSource = CategoriesDatSrc
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = RUSSIAN_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Azl Sans Serif'
    FooterFont.Style = []
    TabOrder = 2
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbNeverShowEh
    OnKeyPress = DBGridEh1KeyPress
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CATEGORY'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 238
      end>
  end
  object Categories: TOracleDataSet
    SQL.Strings = (
      '/* Formatted on 2007/08/31 13:02 (Formatter Plus v4.7.0) */'
      'SELECT ROWID, ID, CATEGORY'
      '  FROM sbcm_categories')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 8
    Top = 248
    object CategoriesCATEGORY: TStringField
      DisplayLabel = 'ћцшт€ринин типи'
      FieldName = 'CATEGORY'
      Size = 128
    end
  end
  object CategoriesDatSrc: TDataSource
    DataSet = Categories
    Left = 40
    Top = 248
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = 'ћцшт€ри типл€ри'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 80
    Top = 248
  end
end
