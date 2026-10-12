object frmCategories: TfrmCategories
  Left = 380
  Top = 169
  BorderIcons = [biSystemMenu]
  ClientHeight = 306
  ClientWidth = 264
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
  TextHeight = 14
  object StatusBar1: TStatusBar
    Left = 0
    Top = 287
    Width = 264
    Height = 19
    Panels = <>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 264
    Height = 26
    DataSource = CategoriesDatSrc
    Align = alTop
    Flat = True
    TabOrder = 1
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 26
    Width = 264
    Height = 261
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
        Title.Caption = 'M'#252#351't'#601'rinin tipi'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 256
      end>
  end
  object Categories: TOracleDataSet
    SQL.Strings = (
      '/* Formatted on 2007/08/31 13:02 (Formatter Plus v4.7.0) */'
      'SELECT ROWID, ID, CATEGORY'
      '  FROM sbcm_categories')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000002000000040000004900440001000000000010000000430041005400
      450047004F0052005900010000000000}
    Session = sboapiDataModule.SBSession
    Left = 8
    Top = 248
    object CategoriesCATEGORY: TWideStringField
      FieldName = 'CATEGORY'
      Size = 128
    end
  end
  object CategoriesDatSrc: TDataSource
    DataSet = Categories
    Left = 40
    Top = 248
  end
end
