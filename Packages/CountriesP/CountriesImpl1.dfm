object Countries: TCountries
  Left = 494
  Top = 225
  Width = 960
  Height = 506
  Caption = 'Countries'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  OnDestroy = ActiveFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 300
    Height = 506
    Align = alLeft
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 298
      Height = 24
      DataSource = DataSource1
      Align = alTop
      Flat = True
      TabOrder = 0
      ExplicitWidth = 367
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 25
      Width = 298
      Height = 480
      Align = alClient
      DataSource = DataSource1
      DrawingStyle = gdsGradient
      FixedColor = clHighlight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'Kod'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNTR_NAME'
          Title.Caption = #214'lk'#601'nin ad'#305
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 300
    Top = 0
    Width = 300
    Height = 506
    Align = alLeft
    TabOrder = 1
    ExplicitLeft = 364
    object DBNavigator2: TDBNavigator
      Left = 1
      Top = 1
      Width = 298
      Height = 25
      DataSource = DataSource2
      Align = alTop
      Flat = True
      TabOrder = 0
      ExplicitWidth = 368
    end
    object DBGrid2: TDBGrid
      Left = 1
      Top = 26
      Width = 298
      Height = 479
      Align = alClient
      DataSource = DataSource2
      DrawingStyle = gdsGradient
      FixedColor = clHighlight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COUNTRY_ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CITY_NAME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PHONE_CODE'
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 900
    Top = 0
    Width = 300
    Height = 506
    Align = alLeft
    TabOrder = 2
    ExplicitLeft = 932
    ExplicitTop = -8
    object DBNavigator3: TDBNavigator
      Left = 1
      Top = 1
      Width = 298
      Height = 25
      DataSource = DataSource4
      Align = alTop
      Flat = True
      TabOrder = 0
    end
    object DBGrid3: TDBGrid
      Left = 1
      Top = 26
      Width = 298
      Height = 479
      Align = alClient
      DataSource = DataSource4
      DrawingStyle = gdsGradient
      FixedColor = clHighlight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Rayonlar'
          Visible = True
        end>
    end
  end
  object Panel4: TPanel
    Left = 600
    Top = 0
    Width = 300
    Height = 506
    Align = alLeft
    TabOrder = 3
    ExplicitLeft = 647
    object DBNavigator4: TDBNavigator
      Left = 1
      Top = 1
      Width = 298
      Height = 25
      DataSource = DataSource3
      Align = alTop
      Flat = True
      TabOrder = 0
    end
    object DBGrid4: TDBGrid
      Left = 1
      Top = 26
      Width = 298
      Height = 479
      Align = alClient
      DataSource = DataSource3
      DrawingStyle = gdsGradient
      FixedColor = clHighlight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Alignment = taCenter
          Title.Caption = #304'qtisadi rayonlar'
          Visible = True
        end>
    end
  end
  object DataSource1: TDataSource
    DataSet = Contries
    Left = 280
  end
  object Contries: TOracleDataSet
    SQL.Strings = (
      'select t.rowid,t.*  from countries t'
      'order by ID')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000400000004000000490044000100000000001200000043004E005400
      52005F004E0041004D0045000100000000001200000043004E00540052005F00
      43004F004400450001000000000008000000530059004D004200010000000000}
    Session = sboapiDataModule.SBSession
    Left = 248
    object ContriesID: TFloatField
      FieldName = 'ID'
    end
    object ContriesCNTR_NAME: TWideStringField
      FieldName = 'CNTR_NAME'
      Size = 30
    end
  end
  object cities: TOracleDataSet
    SQL.Strings = (
      'select c.rowid,c.* from cities c'
      ''
      'where country_id = :country_id'
      'order by ID')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0043004F0055004E005400520059005F004900
      4400040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000400000004000000490044000100000000001400000043004F005500
      4E005400520059005F0049004400010000000000120000004300490054005900
      5F004E0041004D00450001000000000014000000500048004F004E0045005F00
      43004F0044004500010000000000}
    Master = Contries
    MasterFields = 'ID'
    DetailFields = 'COUNTRY_ID'
    Session = sboapiDataModule.SBSession
    Left = 328
    Top = 144
    object citiesID: TFloatField
      FieldName = 'ID'
    end
    object citiesCOUNTRY_ID: TFloatField
      FieldName = 'COUNTRY_ID'
    end
    object citiesCITY_NAME: TWideStringField
      FieldName = 'CITY_NAME'
      Size = 80
    end
    object citiesPHONE_CODE: TIntegerField
      FieldName = 'PHONE_CODE'
    end
  end
  object DataSource2: TDataSource
    DataSet = cities
    Left = 272
    Top = 144
  end
  object Ods_region: TOracleDataSet
    SQL.Strings = (
      'select t. rowid,t.* from region t'
      'order by id ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 672
    Top = 232
    object Ods_regionID: TFloatField
      FieldName = 'ID'
    end
    object Ods_regionNAME: TWideStringField
      FieldName = 'NAME'
      Size = 100
    end
  end
  object Ods_region_district: TOracleDataSet
    SQL.Strings = (
      'select t.rowid,t.* from region_district t'
      'where reg_id=:reg_id'
      'order by id')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A005200450047005F0049004400030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000000C000000520045004700
      5F0049004400010000000000080000004E0041004D004500010000000000}
    Master = Ods_region
    MasterFields = 'ID'
    DetailFields = ' reg_id'
    Session = sboapiDataModule.SBSession
    Left = 664
    Top = 136
    object Ods_region_districtNAME: TWideStringField
      FieldName = 'NAME'
      Size = 100
    end
    object Ods_region_districtREG_ID: TFloatField
      FieldName = 'REG_ID'
    end
  end
  object DataSource3: TDataSource
    DataSet = Ods_region
    Left = 776
    Top = 224
  end
  object DataSource4: TDataSource
    DataSet = Ods_region_district
    Left = 752
    Top = 144
  end
end
