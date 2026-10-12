object FrmCustcat: TFrmCustcat
  Left = 304
  Top = 137
  BorderIcons = [biSystemMenu]
  ClientHeight = 347
  ClientWidth = 325
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
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 31
    Width = 325
    Height = 316
    Align = alClient
    DataSource = DatSrcCusCat
    Flat = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = RUSSIAN_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -12
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbNeverShowEh
    Columns = <
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
        Width = 138
      end
      item
        EditButtons = <>
        FieldName = 'KOD'
        Footers = <>
        Title.Caption = 'Kodu'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 106
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 325
    Height = 31
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 2
      Width = 321
      Height = 27
      DataSource = DatSrcCusCat
      Align = alClient
      Flat = True
      TabOrder = 0
    end
  end
  object CustCatDataSet: TOracleDataSet
    SQL.Strings = (
      'select t.rowid,t.* from custsoccategories T')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000060000004B004F004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 56
    Top = 175
    object CustCatDataSetID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CustCatDataSetNAME: TWideStringField
      FieldName = 'NAME'
      Size = 30
    end
    object CustCatDataSetKOD: TWideStringField
      FieldName = 'KOD'
      Size = 10
    end
  end
  object DatSrcCusCat: TDataSource
    DataSet = CustCatDataSet
    Left = 152
    Top = 176
  end
end
