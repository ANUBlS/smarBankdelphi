object TuningAcc_ZonesForm: TTuningAcc_ZonesForm
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'TuningAcc_ZonesForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 176
    Top = 216
    Width = 320
    Height = 120
    DataSource = DataSrcAccount_Zones
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 453
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 545
      Height = 453
      Align = alLeft
      TabOrder = 0
      object Zones: TDBGrid
        Left = 1
        Top = 1
        Width = 543
        Height = 209
        Align = alTop
        DataSource = DataSrcAccount_Zones
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Color = clNavy
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZONENAME'
            Title.Caption = 'Дахили ады'
            Title.Color = clNavy
            Width = 119
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZONEDESCRIPTION'
            Title.Caption = 'Ады'
            Title.Color = clNavy
            Width = 329
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 1
        Top = 210
        Width = 543
        Height = 242
        Align = alClient
        TabOrder = 1
        object ZonesInfo: TDBGrid
          Left = 1
          Top = 26
          Width = 541
          Height = 215
          Align = alClient
          DataSource = DataSrcAccount_Zones_Info
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWhite
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ZONEID'
              ReadOnly = True
              Title.Color = clNavy
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACCOUNTS'
              Title.Caption = 'Баланс Щесабы'
              Title.Color = clNavy
              Visible = True
            end>
        end
        object DBNavigator1: TDBNavigator
          Left = 1
          Top = 1
          Width = 541
          Height = 25
          DataSource = DataSrcAccount_Zones_Info
          Align = alTop
          TabOrder = 1
        end
      end
    end
  end
  object Account_Zones: TOracleDataSet
    SQL.Strings = (
      'select * from Account_Zones'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = True
    Left = 448
    Top = 96
    object Account_ZonesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object Account_ZonesZONENAME: TStringField
      FieldName = 'ZONENAME'
      Size = 32
    end
    object Account_ZonesZONEDESCRIPTION: TStringField
      FieldName = 'ZONEDESCRIPTION'
      Size = 128
    end
  end
  object DataSrcAccount_Zones: TDataSource
    DataSet = Account_Zones
    Left = 488
    Top = 96
  end
  object Account_Zones_Info: TOracleDataSet
    SQL.Strings = (
      'select AZI.RowID , AZI.* from'
      'Account_Zones_Info AZI'
      'where ZoneID=:ZoneID')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000070000003A5A4F4E45494403000000040000000100000000
      000000}
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    Master = Account_Zones
    MasterFields = 'ID'
    DetailFields = 'ZONEID'
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = True
    Left = 256
    Top = 88
    object Account_Zones_InfoZONEID: TFloatField
      DisplayWidth = 9
      FieldName = 'ZONEID'
      Required = True
    end
    object Account_Zones_InfoACCOUNTS: TFloatField
      DisplayWidth = 16
      FieldName = 'ACCOUNTS'
    end
  end
  object DataSrcAccount_Zones_Info: TDataSource
    DataSet = Account_Zones_Info
    Left = 296
    Top = 88
  end
  object Accounts: TOracleDataSet
    SQL.Strings = (
      'select bal_cn from bal_spr1'
      'order by bal_cn')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 160
    Top = 120
  end
end
