object frmNewUS: TfrmNewUS
  Left = 182
  Top = 95
  BorderIcons = [biSystemMenu]
  Caption = 'Yeni'
  ClientHeight = 613
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Splitter1: TSplitter
    Left = 0
    Top = 192
    Width = 862
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 928
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 862
    Height = 165
    Align = alTop
    DataSource = Tables
    FixedColor = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindow
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1046#1103#1076#1074#1103#1083
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRT'
        Title.Caption = #1058#1103#1081#1080#1085#1072#1090#1099
        Width = 173
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUERYST'
        Title.Caption = #1057#1094#1090#1091#1085#1083#1072#1088
        Width = 414
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDERCOL'
        Title.Caption = #1057#1099#1088#1072#1083#1072#1084#1072
        Width = 78
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 195
    Width = 862
    Height = 391
    Align = alClient
    DataSource = Columns
    FixedColor = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindow
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COLUMNID'
        Title.Caption = #1057#1094#1090#1094#1085' '#8470
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COLUMNTITLE'
        Title.Caption = #1040#1076#1099
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COLUMNWIDTH'
        Title.Caption = #1059#1079#1091#1085#1083#1091#1100#1091
        Width = 156
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 165
    Width = 862
    Height = 27
    DataSource = Tables
    Align = alTop
    Flat = True
    TabOrder = 2
  end
  object DBNavigator2: TDBNavigator
    Left = 0
    Top = 586
    Width = 862
    Height = 27
    DataSource = Columns
    Align = alBottom
    Flat = True
    TabOrder = 3
  end
  object uTables: TOracleDataSet
    SQL.Strings = (
      'select rowid, id, name, queryst, descrt, ordercol'
      '  from sb_settings_tables')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000050000000400000049004400010000000000080000004E0041004D00
      45000100000000000E0000005100550045005200590053005400010000000000
      0C000000440045005300430052005400010000000000100000004F0052004400
      4500520043004F004C00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 536
    Top = 88
    object uTablesID: TFloatField
      FieldName = 'ID'
    end
    object uTablesNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object uTablesQUERYST: TStringField
      FieldName = 'QUERYST'
      Size = 255
    end
    object uTablesDESCRT: TStringField
      FieldName = 'DESCRT'
      Size = 100
    end
    object uTablesORDERCOL: TStringField
      FieldName = 'ORDERCOL'
      Required = True
      Size = 30
    end
  end
  object uColumns: TOracleDataSet
    SQL.Strings = (
      'select rowid, tableid, columnid, columntitle, columnwidth'
      '  from sb_settings_columns'
      'where tableid = :tableid')
    Optimize = False
    Variables.Data = {
      0400000001000000100000003A005400410042004C0045004900440004000000
      08000000000000000000264000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000040000001000000043004F004C0055004D004E004900440001000000
      00001600000043004F004C0055004D004E005400490054004C00450001000000
      00001600000043004F004C0055004D004E005700490044005400480001000000
      00000E0000005400410042004C00450049004400010000000000}
    Master = uTables
    MasterFields = 'ID'
    DetailFields = 'TABLEID'
    Session = sboapiDataModule.SBSession
    Left = 576
    Top = 208
    object uColumnsCOLUMNID: TFloatField
      FieldName = 'COLUMNID'
    end
    object uColumnsCOLUMNTITLE: TStringField
      FieldName = 'COLUMNTITLE'
      Size = 50
    end
    object uColumnsCOLUMNWIDTH: TFloatField
      FieldName = 'COLUMNWIDTH'
    end
    object uColumnsTABLEID: TFloatField
      FieldName = 'TABLEID'
    end
  end
  object Columns: TDataSource
    DataSet = uColumns
    Left = 608
    Top = 208
  end
  object Tables: TDataSource
    DataSet = uTables
    Left = 568
    Top = 88
  end
end
