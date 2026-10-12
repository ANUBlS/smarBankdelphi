object SBUniversalSettings: TSBUniversalSettings
  Left = 277
  Top = 158
  Width = 870
  Height = 640
  Caption = 'SBUniversalSettings'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 225
    Width = 870
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 862
  end
  object Panel1: TPanel
    Left = 0
    Top = 228
    Width = 870
    Height = 412
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object grSettings: TDBGrid
      Left = 2
      Top = 2
      Width = 866
      Height = 383
      Align = alClient
      DataSource = DSCont
      DrawingStyle = gdsGradient
      FixedColor = clNavy
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 385
      Width = 866
      Height = 25
      DataSource = DSCont
      Align = alBottom
      Flat = True
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 870
    Height = 225
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object grTables: TDBGrid
      Left = 2
      Top = 2
      Width = 866
      Height = 221
      Align = alClient
      DataSource = DSTables
      DrawingStyle = gdsGradient
      FixedColor = clNavy
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindow
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = grTablesCellClick
      OnKeyUp = grTablesKeyUp
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRT'
          Title.Caption = 'C'#601'dv'#601'l'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 742
          Visible = True
        end>
    end
  end
  object ODSTables: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      '  FROM sb_settings_tables'
      'order by descrt')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000050000000400000049004400010000000000080000004E0041004D00
      45000100000000000E0000005100550045005200590053005400010000000000
      0C000000440045005300430052005400010000000000100000004F0052004400
      4500520043004F004C00010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 456
    Top = 56
    object ODSTablesID: TFloatField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object ODSTablesNAME: TWideStringField
      FieldName = 'NAME'
      Size = 100
    end
    object ODSTablesQUERYST: TWideStringField
      FieldName = 'QUERYST'
      Size = 255
    end
    object ODSTablesDESCRT: TWideStringField
      FieldName = 'DESCRT'
      Size = 100
    end
    object ODSTablesORDERCOL: TWideStringField
      FieldName = 'ORDERCOL'
      Required = True
      Size = 30
    end
  end
  object DSTables: TDataSource
    DataSet = ODSTables
    Left = 488
    Top = 56
  end
  object DSCont: TDataSource
    DataSet = ODSCont
    Left = 488
    Top = 92
  end
  object ODSCont: TOracleDataSet
    SQL.Strings = (
      'select r.rowid, r.id, r.name, r.KOD_FILIAL'
      ' from filial r')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000140000004B004F0044005F00460049004C00490041004C00
      010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 456
    Top = 92
  end
  object ODSColumnTitlles: TOracleDataSet
    SQL.Strings = (
      'SELECT  columnid, columntitle, columnwidth'
      '  FROM sb_settings_columns'
      'where tableid=:tableid')
    Optimize = False
    Variables.Data = {
      0400000001000000100000003A005400410042004C0045004900440003000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000030000001000000043004F004C0055004D004E004900440001000000
      00001600000043004F004C0055004D004E005400490054004C00450001000000
      00001600000043004F004C0055004D004E005700490044005400480001000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 456
    Top = 130
    object ODSColumnTitllesCOLUMNID: TFloatField
      FieldName = 'COLUMNID'
    end
    object ODSColumnTitllesCOLUMNTITLE: TWideStringField
      FieldName = 'COLUMNTITLE'
      Size = 50
    end
    object ODSColumnTitllesCOLUMNWIDTH: TFloatField
      FieldName = 'COLUMNWIDTH'
    end
  end
  object acts: TActionList
    Left = 544
    Top = 168
    object actNew: TAction
      Caption = 'actNew'
      ShortCut = 57466
      OnExecute = actNewExecute
    end
  end
end
