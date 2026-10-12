object TransactionDestinationForm: TTransactionDestinationForm
  Left = 192
  Top = 317
  Width = 442
  Height = 319
  Caption = 'Destinations'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object GridDest: TDBGrid
    Left = 0
    Top = 25
    Width = 434
    Height = 240
    Align = alTop
    DataSource = TrDestData
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    OnDblClick = GridDestDblClick
    Columns = <
      item
        Color = clSilver
        Expanded = False
        FieldName = 'ID'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Title.Caption = '№'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = 'Тяйнат'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 360
        Visible = True
      end>
  end
  object ButtonCancel: TButton
    Left = 358
    Top = 267
    Width = 75
    Height = 25
    Caption = 'Имтина'
    TabOrder = 1
    OnClick = ButtonCancelClick
  end
  object ButtonOk: TButton
    Left = 280
    Top = 267
    Width = 75
    Height = 25
    Caption = 'Гябул'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 434
    Height = 25
    DataSource = TrDestData
    Align = alTop
    Flat = True
    TabOrder = 3
  end
  object TrDest: TOracleDataSet
    SQL.Strings = (
      'select d.*, d.rowid from TRDESTINATION d'
      'order by ID'
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
    Left = 240
    Top = 56
  end
  object TrDestData: TDataSource
    DataSet = TrDest
    Left = 288
    Top = 56
  end
end
