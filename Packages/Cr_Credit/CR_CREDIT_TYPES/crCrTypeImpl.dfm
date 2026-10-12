object CrTypeMainForm: TCrTypeMainForm
  Left = 394
  Top = 114
  BorderIcons = [biSystemMenu]
  ClientHeight = 638
  ClientWidth = 382
  Color = clBtnFace
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 196
    Width = 382
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 395
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 199
    Width = 382
    Height = 439
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object DBGrid2: TDBGrid
      Left = 2
      Top = 17
      Width = 378
      Height = 393
      Align = alClient
      DataSource = DSVillages
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Title.Color = clNavy
          Title.Font.Charset = TURKISH_CHARSET
          Title.Font.Color = clBtnHighlight
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Color = clNavy
          Title.Font.Charset = TURKISH_CHARSET
          Title.Font.Color = clBtnHighlight
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 276
          Visible = True
        end>
    end
    object DBNavigator2: TDBNavigator
      Left = 2
      Top = 410
      Width = 378
      Height = 27
      DataSource = DSVillages
      Align = alBottom
      Flat = True
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 382
    Height = 196
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object DBGrid3: TDBGrid
      Left = 2
      Top = 17
      Width = 378
      Height = 150
      Align = alClient
      DataSource = DSRanges
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clCaptionText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Color = clNavy
          Title.Font.Charset = TURKISH_CHARSET
          Title.Font.Color = clCaptionText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Color = clNavy
          Title.Font.Charset = TURKISH_CHARSET
          Title.Font.Color = clCaptionText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME_ENG'
          Title.Color = clNavy
          Title.Font.Charset = TURKISH_CHARSET
          Title.Font.Color = clCaptionText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 176
          Visible = True
        end>
    end
    object DBNavigator3: TDBNavigator
      Left = 2
      Top = 167
      Width = 378
      Height = 27
      DataSource = DSRanges
      Align = alBottom
      Flat = True
      TabOrder = 1
    end
  end
  object ODSVillages: TOracleDataSet
    SQL.Strings = (
      'SELECT T.Rowid, T.*'
      '  FROM cr_agro_village T'
      ' '
      ''
      'where T.depend_id = :depend_id')
    Optimize = False
    Variables.Data = {
      0400000001000000140000003A0044004500500045004E0044005F0049004400
      0400000008000000000000000000F03F00000000}
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      45000100000000001200000044004500500045004E0044005F00490044000100
      00000000}
    Master = ODSRegions
    MasterFields = 'ID'
    DetailFields = 'DEPEND_ID'
    Session = sboapiDataModule.SBSession
    Left = 8
    Top = 110
    object ODSVillagesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSVillagesNAME: TWideStringField
      FieldName = 'NAME'
      Size = 128
    end
    object ODSVillagesDEPEND_ID: TFloatField
      FieldName = 'DEPEND_ID'
    end
  end
  object ODSRegions: TOracleDataSet
    SQL.Strings = (
      'SELECT rowid,id, name, name_eng,zonaid'
      '  FROM cr_agro_region'
      'where '
      'zonaid=:zonaid')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A005A004F004E00410049004400030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000040000000400000049004400010000000000080000004E0041004D00
      4500010000000000100000004E0041004D0045005F0045004E00470001000000
      00000C0000005A004F004E00410049004400010000000000}
    MasterFields = 'id'
    DetailFields = 'zonaid'
    Session = sboapiDataModule.SBSession
    Left = 9
    Top = 77
    object ODSRegionsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSRegionsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 128
    end
    object ODSRegionsNAME_ENG: TWideStringField
      FieldName = 'NAME_ENG'
      Size = 128
    end
    object ODSRegionsZONAID: TFloatField
      FieldName = 'ZONAID'
    end
  end
  object DSVillages: TDataSource
    DataSet = ODSVillages
    Left = 48
    Top = 110
  end
  object DSRanges: TDataSource
    DataSet = ODSRegions
    Left = 49
    Top = 77
  end
end
