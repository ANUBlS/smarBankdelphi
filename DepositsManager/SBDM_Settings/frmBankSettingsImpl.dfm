object frmBankSettings: TfrmBankSettings
  Left = 522
  Top = 169
  Width = 324
  Height = 378
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 316
    Height = 37
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object CmbBoxValue: TComboBox
      Left = 5
      Top = 8
      Width = 111
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
    object BtnApply: TButton
      Left = 229
      Top = 6
      Width = 75
      Height = 25
      Caption = '&ִÿיטר'
      TabOrder = 1
    end
    object ValuesEdit: TEdit
      Left = 120
      Top = 8
      Width = 105
      Height = 21
      Enabled = False
      TabOrder = 2
    end
  end
  object TV: TTreeView
    Left = 0
    Top = 37
    Width = 316
    Height = 295
    Align = alClient
    Indent = 19
    ReadOnly = True
    TabOrder = 1
    OnChange = TVChange
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 332
    Width = 316
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = 'ֱאםךûם סוקטלכÿנט'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 120
    Top = 128
  end
  object SetupPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'CM_SETUP'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Optimize = True
    Left = 184
    Top = 128
  end
  object Temp: TOracleDataSet
    SQL.Strings = (
      'SELECT id, name, lname, parentid, value, sourcelist'
      '  FROM sbcm_references'
      'where ParentID=:ParentID'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000090000003A504152454E5449440300000000000000000000
      00}
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
    Left = 216
    Top = 128
    object TempID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object TempNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object TempLNAME: TStringField
      FieldName = 'LNAME'
      Size = 128
    end
    object TempPARENTID: TFloatField
      FieldName = 'PARENTID'
      Required = True
    end
    object TempVALUE: TStringField
      FieldName = 'VALUE'
      Size = 556
    end
    object TempSOURCELIST: TStringField
      FieldName = 'SOURCELIST'
      Size = 2048
    end
  end
  object Refers: TOracleDataSet
    SQL.Strings = (
      'SELECT id, name, lname, parentid, value, sourcelist'
      '  FROM sbcm_references'
      'order by id')
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
    Cursor = crSQLWait
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
    Left = 248
    Top = 128
    object RefersID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object RefersNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object RefersLNAME: TStringField
      FieldName = 'LNAME'
      Size = 128
    end
    object RefersPARENTID: TFloatField
      FieldName = 'PARENTID'
      Required = True
    end
    object RefersVALUE: TStringField
      FieldName = 'VALUE'
      Size = 556
    end
    object RefersSOURCELIST: TStringField
      FieldName = 'SOURCELIST'
      Size = 2048
    end
  end
  object ActionLst: TActionList
    Left = 152
    Top = 128
    object SaveActn: TAction
      Caption = '&ִÿיטר'
    end
  end
  object RefDetails: TOracleDataSet
    SQL.Strings = (
      'SELECT id, name, lname, parentid, value, sourcelist'
      '  FROM sbcm_references'
      'where id = :ID'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
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
    Left = 128
    Top = 168
    object RefDetailsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object RefDetailsNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object RefDetailsLNAME: TStringField
      FieldName = 'LNAME'
      Size = 128
    end
    object RefDetailsPARENTID: TFloatField
      FieldName = 'PARENTID'
      Required = True
    end
    object RefDetailsVALUE: TStringField
      FieldName = 'VALUE'
      Size = 556
    end
    object RefDetailsSOURCELIST: TStringField
      FieldName = 'SOURCELIST'
      Size = 2048
    end
  end
end
