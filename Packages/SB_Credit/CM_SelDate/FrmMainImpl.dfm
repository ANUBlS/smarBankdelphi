object FrmMain: TFrmMain
  Left = 344
  Top = 172
  BorderIcons = [biSystemMenu]
  ClientHeight = 342
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
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
    Width = 316
    Height = 32
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 2
      Width = 312
      Height = 28
      DataSource = DatSrcDates
      Align = alClient
      Flat = True
      TabOrder = 0
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 323
    Width = 316
    Height = 19
    Panels = <>
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 32
    Width = 316
    Height = 291
    Align = alClient
    DataSource = DatSrcDates
    Flat = True
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
        FieldName = 'SELDATE'
        Footers = <>
        Title.Caption = 'Tarix'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 113
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = 'Ad'#305
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 178
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
    Session = sboapiDataModule.SBSession
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
