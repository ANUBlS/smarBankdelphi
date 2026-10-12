object Form1: TForm1
  Left = 342
  Top = 221
  Width = 138
  Height = 79
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMinimized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SBConfig: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBCONFIG'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 8
    Top = 8
  end
  object Sections: TOracleDataSet
    SQL.Strings = (
      'begin'
      '  :Result := SBCONFIG.ReadSections;'
      'end;')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000070000003A524553554C54740000000000000000000000}
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
    Left = 40
    Top = 8
  end
  object SectionValues: TOracleDataSet
    SQL.Strings = (
      'begin'
      '  :Result := sbconfig.ReadSectionValues(:Ident);'
      'end;')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000070000003A524553554C5474000000000000000000000006
      0000003A4944454E54050000000000000000000000}
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
    Left = 72
    Top = 8
  end
end
