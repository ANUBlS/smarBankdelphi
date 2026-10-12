object PledgForm: TPledgForm
  Left = 441
  Top = 147
  BorderIcons = [biSystemMenu]
  Caption = 'PledgForm'
  ClientHeight = 445
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = -9
    Top = 181
    Width = 344
    Height = 37
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 2
      Width = 340
      Height = 33
      DataSource = DataSourcePlegds
      Align = alClient
      Flat = True
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 315
    Height = 37
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object DBNavigator2: TDBNavigator
      Left = 2
      Top = 2
      Width = 311
      Height = 33
      DataSource = DataSource1
      Align = alClient
      Flat = True
      TabOrder = 0
    end
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 37
    Width = 315
    Height = 141
    Align = alTop
    DataSource = DataSource1
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
        FieldName = 'TYPECODE'
        Footers = <>
        Title.Caption = 'Kodu'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'DESCRIPTION'
        Footers = <>
        Title.Caption = 'Girovun t'#601'minatl'#305#287#305
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 157
      end>
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 193
    Width = 315
    Height = 252
    Align = alBottom
    DataSource = DataSourcePlegds
    FooterColor = clWindow
    FooterFont.Charset = RUSSIAN_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    TabOrder = 3
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbNeverShowEh
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TYPECODE'
        Footers = <>
        Title.Caption = 'Kodu'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'DESCRIPTION'
        Footers = <>
        Title.Caption = 'Ad'#305
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 243
      end>
  end
  object DataSourcePlegds: TDataSource
    DataSet = Plegds
    Left = 64
    Top = 272
  end
  object Plegds: TOracleDataSet
    SQL.Strings = (
      'SELECT Rowid, typecode, needplaceout,temid'
      ',description'
      '  FROM cr_pledges'
      'where temid=:temid')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00540045004D00490044000300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      050000000400000010000000540059005000450043004F004400450001000000
      0000180000004E0045004500440050004C004100430045004F00550054000100
      00000000160000004400450053004300520049005000540049004F004E000100
      000000000A000000540045004D0049004400010000000000}
    Master = OracleDataSet1
    MasterFields = 'id'
    DetailFields = 'temid'
    Session = sboapiDataModule.SBSession
    Left = 128
    Top = 272
    object PlegdsTYPECODE: TWideStringField
      FieldName = 'TYPECODE'
      Required = True
      Size = 8
    end
    object PlegdsNEEDPLACEOUT: TFloatField
      FieldName = 'NEEDPLACEOUT'
    end
    object PlegdsTEMID: TFloatField
      FieldName = 'TEMID'
    end
    object PlegdsDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 64
    end
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 32
    Top = 80
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'SELECT Rowid, id,typecode'
      ',description'
      '  FROM cr_pledges_t'
      'order by id'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000010000000540059005000450043004F004400450001000000
      0000160000004400450053004300520049005000540049004F004E0001000000
      00000400000049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 80
    Top = 80
    object OracleDataSet1ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OracleDataSet1TYPECODE: TWideStringField
      FieldName = 'TYPECODE'
      Size = 8
    end
    object OracleDataSet1DESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 64
    end
  end
end
