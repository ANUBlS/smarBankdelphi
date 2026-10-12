object PledgForm: TPledgForm
  Left = 421
  Top = 223
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
    Left = 0
    Top = 0
    Width = 315
    Height = 34
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 2
      Width = 311
      Height = 30
      DataSource = DataSourcePlegds
      Align = alClient
      Flat = True
      TabOrder = 0
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 34
    Width = 315
    Height = 411
    Align = alClient
    DataSource = DataSourcePlegds
    FooterColor = clWindow
    FooterFont.Charset = RUSSIAN_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    TabOrder = 1
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
        Title.Color = clSilver
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'DESCRIPTION'
        Footers = <>
        Title.Caption = 'T'#601'yinat'#305
        Title.Color = clSilver
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 226
      end>
  end
  object DataSourcePlegds: TDataSource
    DataSet = Plegds
    Left = 64
    Top = 248
  end
  object Plegds: TOracleDataSet
    SQL.Strings = (
      'SELECT Rowid, typecode, needplaceout,temid'
      ',description'
      '  FROM cm_pledges'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000400000010000000540059005000450043004F004400450001000000
      0000180000004E0045004500440050004C004100430045004F00550054000100
      00000000160000004400450053004300520049005000540049004F004E000100
      000000000A000000540045004D0049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 128
    Top = 248
    object PlegdsTYPECODE: TWideStringField
      FieldName = 'TYPECODE'
      Required = True
      Size = 8
    end
    object PlegdsDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 64
    end
    object PlegdsNEEDPLACEOUT: TFloatField
      DisplayLabel = #1041'.'#1050'-'#1076#1072' '#1081#1077#1088#1083#1103#1096#1076#1080#1088
      FieldName = 'NEEDPLACEOUT'
    end
    object PlegdsTEMID: TFloatField
      FieldName = 'TEMID'
    end
  end
end
