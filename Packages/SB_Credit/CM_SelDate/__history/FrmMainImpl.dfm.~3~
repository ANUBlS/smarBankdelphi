object FrmMain: TFrmMain
  Left = 344
  Top = 172
  BorderIcons = [biSystemMenu]
  ClientHeight = 318
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 293
    Height = 30
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 2
      Width = 289
      Height = 26
      DataSource = DatSrcDates
      Align = alClient
      Flat = True
      TabOrder = 0
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 299
    Width = 293
    Height = 19
    Panels = <>
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 30
    Width = 293
    Height = 269
    Align = alClient
    DataSource = DatSrcDates
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
    Columns = <
      item
        EditButtons = <>
        FieldName = 'SELDATE'
        Footers = <>
        Title.Caption = #1058#1072#1088#1080#1093
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 105
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1040#1076#1099
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 165
      end>
  end
  object DatSrcDates: TDataSource
    DataSet = Dates
    Left = 32
    Top = 136
  end
  object Dates: TOracleDataSet
    SQL.Strings = (
      'SELECT rowid,seldate, name'
      '  FROM cm_seldates'
      'order by seldate')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000E000000530045004C004400410054004500010000000000
      080000004E0041004D004500010000000000}
    Session = CMDataModule.CMSession
    Left = 72
    Top = 136
    object DatesSELDATE: TDateTimeField
      FieldName = 'SELDATE'
    end
    object DatesNAME: TWideStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
end
