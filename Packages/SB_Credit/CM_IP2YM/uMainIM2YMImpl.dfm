object frmIM2YMMain: TfrmIM2YMMain
  Left = 266
  Top = 232
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'IM => YM'
  ClientHeight = 121
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 384
    Height = 81
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 192
      Top = 2
      Width = 190
      Height = 77
      Align = alClient
      Caption = 'YM'
      TabOrder = 0
      object Label4: TLabel
        Left = 12
        Top = 20
        Width = 43
        Height = 13
        Caption = 'Мцгавиля'
      end
      object lb2: TLabel
        Left = 2
        Top = 48
        Width = 184
        Height = 13
        AutoSize = False
      end
      object DBLookupComboboxEh3: TDBLookupComboboxEh
        Left = 61
        Top = 16
        Width = 121
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NUMBEROFCREDIT'
        ListSource = yms
        TabOrder = 0
        Visible = True
        OnCloseUp = DBLookupComboboxEh3CloseUp
      end
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 2
      Width = 190
      Height = 77
      Align = alLeft
      Caption = 'IM'
      TabOrder = 1
      object Label1: TLabel
        Left = 12
        Top = 20
        Width = 43
        Height = 13
        Caption = 'Мцгавиля'
      end
      object lb1: TLabel
        Left = 2
        Top = 48
        Width = 184
        Height = 13
        AutoSize = False
      end
      object DBLookupComboboxEh2: TDBLookupComboboxEh
        Left = 60
        Top = 16
        Width = 121
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NUMBEROFCREDIT'
        ListSource = ims
        TabOrder = 0
        Visible = True
        OnCloseUp = DBLookupComboboxEh2CloseUp
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 384
    Height = 40
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 12
      Width = 35
      Height = 13
      Caption = 'Mябляь'
    end
    object edAmt: TCMCurrencyEdit
      Left = 52
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object Button1: TButton
      Left = 188
      Top = 8
      Width = 101
      Height = 25
      Caption = 'Ямялиййаты апар'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Баьла'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object ODSIMs: TOracleDataSet
    SQL.Strings = (
      'SELECT NUMBEROFCREDIT, id, name FROM CM_crds_im'
      'order by 1')
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 100
    Top = 64
    object ODSIMsNUMBEROFCREDIT: TStringField
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object ODSIMsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSIMsNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
  end
  object ODSYMs: TOracleDataSet
    SQL.Strings = (
      'SELECT NUMBEROFCREDIT , id, name FROM CM_crds_ym'
      'order by 1')
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 60
    Top = 64
    object StringField1: TStringField
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object ODSYMsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSYMsNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
  end
  object ims: TDataSource
    DataSet = ODSIMs
    Left = 100
    Top = 24
  end
  object yms: TDataSource
    DataSet = ODSYMs
    Left = 60
    Top = 24
  end
  object cm_im2ym: TOraclePackage
    Session = CMDataModule.CMSession
    Debug = False
    PackageName = 'cm_im2ym'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 204
    Top = 24
  end
end
