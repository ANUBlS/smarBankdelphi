object InstallationTaskManagerPage: TInstallationTaskManagerPage
  Left = 214
  Top = 96
  Width = 370
  Height = 472
  Caption = 'Конфигурация задач'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = PropertyPageDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 362
    Height = 129
    Align = alTop
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DYSPLAY_NAME'
        Title.Caption = 'Тяйинаты'
        Visible = True
      end>
  end
  object InstallationTaskEditFrame: TInstallationTaskEditFrame
    Left = 0
    Top = 129
    Width = 362
    Height = 316
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 72
    Top = 24
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select NAME, DYSPLAY_NAME from INSTALLATION_TASKS'
      'order by NAME')
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
    AfterScroll = OracleDataSet1AfterScroll
    Left = 104
    Top = 24
    object OracleDataSet1NAME: TStringField
      DisplayLabel = 'Ады'
      FieldName = 'NAME'
      Required = True
      Size = 32
    end
    object OracleDataSet1DYSPLAY_NAME: TStringField
      DisplayLabel = 'Ады'
      FieldName = 'DYSPLAY_NAME'
      Required = True
      Size = 32
    end
  end
end
