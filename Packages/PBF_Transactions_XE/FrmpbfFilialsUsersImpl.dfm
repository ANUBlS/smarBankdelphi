object FrmpbfFilialsUsers: TFrmpbfFilialsUsers
  Left = 298
  Top = 176
  BorderIcons = [biSystemMenu]
  Caption = 'FrmpbfFilialsUsers'
  ClientHeight = 282
  ClientWidth = 277
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 27
    Width = 277
    Height = 236
    Align = alClient
    DataSource = pbfusersds
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
    VertScrollBar.VisibleMode = sbNeverShowEh
    Columns = <
      item
        EditButtons = <>
        FieldName = 'filialname'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 140
      end
      item
        EditButtons = <>
        FieldName = 'username'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 129
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 263
    Width = 277
    Height = 19
    Panels = <>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 277
    Height = 27
    DataSource = pbfusersds
    Align = alTop
    Flat = True
    TabOrder = 2
  end
  object pbfusersds: TDataSource
    DataSet = pbfusers
    Left = 64
    Top = 112
  end
  object pbfusers: TOracleDataSet
    SQL.Strings = (
      'SELECT rowid, id,filial, userid'
      '  FROM pbf_operationsusers a'
      'order by filial')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 112
    object pbfusersID: TFloatField
      FieldName = 'ID'
    end
    object pbfusersFILIAL: TFloatField
      FieldName = 'FILIAL'
      Required = True
    end
    object pbfusersUSERID: TWideStringField
      FieldName = 'USERID'
      Required = True
      Size = 30
    end
    object pbfusersfilialname: TWideStringField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      FieldKind = fkLookup
      FieldName = 'filialname'
      LookupDataSet = allF
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'FILIAL'
      Size = 40
      Lookup = True
    end
    object pbfusersusername: TWideStringField
      DisplayLabel = #1048#1089#1090#1080#1092#1072#1076#1103#1095#1080
      FieldKind = fkLookup
      FieldName = 'username'
      LookupDataSet = allu
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'USERID'
      Size = 50
      Lookup = True
    end
  end
  object allF: TOracleDataSet
    SQL.Strings = (
      'select id,name from filial_t')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 34
    Top = 144
    object allFID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object allFNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object allu: TOracleDataSet
    SQL.Strings = (
      'select id,name from user$')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 64
    Top = 144
    object alluID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object alluNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
  end
end
