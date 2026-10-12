object VergiForm: TVergiForm
  Left = 231
  Top = 140
  Width = 990
  Height = 732
  Caption = 'VergiForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 1020
    Height = 96
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 53
        Width = 1016
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 1003
      Height = 53
      ButtonHeight = 47
      ButtonWidth = 136
      Caption = 'ToolBar1'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial AzLat'
      Font.Style = []
      Images = ImageList1
      ParentFont = False
      ShowCaptions = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 2
        Caption = 'Файлы гебул ет'
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = False
        OnClick = ToolButton1Click
      end
      object ToolButton2: TToolButton
        Left = 136
        Top = 2
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 144
        Top = 2
        Caption = 'Конверт'
        ImageIndex = 1
        OnClick = ToolButton3Click
      end
      object ToolButton4: TToolButton
        Left = 280
        Top = 2
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 288
        Top = 2
        Caption = 'Йенилямя'
        ImageIndex = 0
        OnClick = ToolButton5Click
      end
    end
  end
  object ListBox1: TListBox
    Left = 0
    Top = 99
    Width = 129
    Height = 573
    ItemHeight = 13
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 130
    Top = 95
    Width = 844
    Height = 171
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    Color = clBtnFace
    DataSource = DataSource1
    FixedColor = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taLeftJustify
        Color = clSilver
        Expanded = False
        FieldName = 'ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'Arial AzLat'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Color = clWindow
        Expanded = False
        FieldName = 'NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'Arial AzLat'
        Title.Font.Style = [fsBold]
        Width = 256
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'TEK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'Arial AzLat'
        Title.Font.Style = [fsBold]
        Width = 91
        Visible = True
      end
      item
        Color = clGray
        Expanded = False
        FieldName = 'DESCRIPTION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'Arial AzLat'
        Title.Font.Style = [fsBold]
        Width = 441
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 131
    Top = 293
    Width = 886
    Height = 199
    BorderStyle = bsNone
    Color = clBtnFace
    DataSource = DataSource2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Color = clSilver
        Expanded = False
        FieldName = 'ID'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial AzLat'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 55
        Visible = True
      end
      item
        Color = clWindow
        Expanded = False
        FieldName = 'NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 468
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'DESCRIPTION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 323
        Visible = True
      end>
  end
  object DBGrid3: TDBGrid
    Left = 132
    Top = 490
    Width = 888
    Height = 199
    BorderStyle = bsNone
    Color = clBtnFace
    DataSource = DataSource3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindow
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Color = clSilver
        Expanded = False
        FieldName = 'ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Color = clNavy
        Width = 53
        Visible = True
      end
      item
        Color = clWindow
        Expanded = False
        FieldName = 'NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Color = clNavy
        Width = 469
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'DESCRIPTION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Color = clNavy
        Width = 323
        Visible = True
      end>
  end
  object RichEdit1: TRichEdit
    Left = 136
    Top = 516
    Width = 1346
    Height = 149
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial AzLat'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 5
    Visible = False
  end
  object Panel1: TPanel
    Left = -3
    Top = 672
    Width = 1022
    Height = 41
    BorderStyle = bsSingle
    ParentShowHint = False
    ShowHint = False
    TabOrder = 6
  end
  object OpenDialog1: TOpenDialog
    Left = 8
    Top = 104
  end
  object ImageList1: TImageList
    Left = 48
    Top = 104
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000084840000848400008484
      0000848400008484000084840000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000084840000848400008484
      0000848400008484000084840000840000000000000084848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF0000FFFF000084840000848400008484
      000084840000848400008484000084000000000000008484840000FFFF0000FF
      FF000084840000FFFF00008484000084840000FFFF000084840000FFFF000084
      840000FFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400FFFF0000FFFF000084840000848400008484
      000084840000848400008484000084000000000000008484840000FFFF000084
      840000FFFF000084840000FFFF00000084000084840000FFFF000084840000FF
      FF00008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000008484
      8400848484008484840084848400FFFF0000FFFF000084840000848400008484
      00008484000084840000848400008400000000000000848484000084840000FF
      FF000084840000FFFF000000FF000000FF00000084000084840000FFFF000084
      840000FFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000008484
      8400848484008484840084848400FFFF0000FFFF000084840000848400008484
      000084840000848400008484000084000000000000008484840000FFFF000084
      840000FFFF00008484000000FF000000FF000000FF00848484000084840000FF
      FF00008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF000084000000FFFF0000FFFF00000000
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000848484000084840000FF
      FF00008484000000FF008484840000FFFF000000FF000000FF00848484000084
      840000FFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000840000008400000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFF0000FFFF00000000FF000000
      FF000000FF00FFFFFF000000000000000000000000008484840000FFFF000084
      84000000FF008484840000FFFF0000FFFF0000FFFF000000FF000000FF008484
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      0000000000000000000000000000000000008400000084000000000000000000
      000000000000840000000000000000000000000000000000FF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400840000008400000084000000840000000000000000000000000000000000
      00000000000000000000000000000000000000000000008484000000FF000084
      8400000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      FF00000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000848400008484000000
      FF000084840000000000000000000000000000000000000000000000FF000000
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000FF000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000848400008484000084
      84000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00008484000084
      8400008484000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFF80FFFF0000
      FFFFFF00FFFF0000FFFFFE0080030000FFFFFE0080030000E7FFE00080030000
      CF83E00080030000DFC3E00080030000DFE3FE0180030000DFD3FE0380030000
      CF3BBF8380030000E0FF8FEFC0E70000FFFF07CFE1F30000FFFF001FFFFB0000
      FFFF007FFFFD0000FFFF8FFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select   t.*, t.rowid  from  xs_institution t'
      '')
    QBEDefinition.QBEFieldDefs = {
      0400000006000000020000004944010000000000040000004E414D4501000000
      00000B0000004445534352495054494F4E01000000000004000000424F534801
      00000000000300000054454B01000000000003000000554348010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 8
    Top = 634
    object OracleDataSet1ID: TFloatField
      DisplayWidth = 12
      FieldName = 'ID'
    end
    object OracleDataSet1NAME: TStringField
      DisplayWidth = 35
      FieldName = 'NAME'
      Size = 255
    end
    object OracleDataSet1BOSH: TStringField
      DisplayWidth = 26
      FieldName = 'BOSH'
      Size = 40
    end
    object OracleDataSet1TEK: TStringField
      DisplayWidth = 30
      FieldName = 'TEK'
      Size = 40
    end
    object OracleDataSet1UCH: TStringField
      DisplayWidth = 25
      FieldName = 'UCH'
      Size = 255
    end
    object OracleDataSet1DESCRIPTION: TStringField
      DisplayWidth = 33
      FieldName = 'DESCRIPTION'
      Size = 300
    end
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      'select   t.*, t.rowid  from xs_destination t')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000040000004E414D4501000000
      00000B0000004445534352495054494F4E010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 47
    Top = 634
    object OracleDataSet2ID: TFloatField
      DisplayWidth = 12
      FieldName = 'ID'
    end
    object OracleDataSet2NAME: TStringField
      DisplayWidth = 89
      FieldName = 'NAME'
      Size = 255
    end
    object OracleDataSet2DESCRIPTION: TStringField
      DisplayWidth = 46
      FieldName = 'DESCRIPTION'
      Size = 255
    end
  end
  object OracleDataSet3: TOracleDataSet
    SQL.Strings = (
      'select   t.*, t.rowid from xs_budgetlevel t'
      'order by id')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000040000004E414D4501000000
      00000B0000004445534352495054494F4E010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 88
    Top = 634
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 9
    Top = 600
  end
  object DataSource2: TDataSource
    DataSet = OracleDataSet2
    Left = 48
    Top = 601
  end
  object DataSource3: TDataSource
    DataSet = OracleDataSet3
    Left = 89
    Top = 601
  end
  object OracleDataSet4: TOracleDataSet
    SQL.Strings = (
      'truncate  table xs_institution'
      ''
      '')
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 7
    Top = 560
  end
  object OracleDataSet6: TOracleDataSet
    SQL.Strings = (
      'truncate  table xs_budgetlevel'
      ''
      ''
      '')
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 88
    Top = 560
  end
  object OracleDataSet5: TOracleDataSet
    SQL.Strings = (
      'truncate  table xs_destination '
      ''
      ''
      '')
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 560
  end
end
