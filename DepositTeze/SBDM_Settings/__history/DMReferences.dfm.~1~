object DataModReferences: TDataModReferences
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 207
  Top = 151
  Height = 484
  Width = 637
  object TVSubItems: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   *'
      '  From'
      '     SBCM_References'
      '   Where'
      '    ParentID =:ParentID')
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
    Left = 16
    Top = 8
    object TVSubItemsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object TVSubItemsNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object TVSubItemsLNAME: TStringField
      FieldName = 'LNAME'
      Size = 128
    end
    object TVSubItemsPARENTID: TFloatField
      FieldName = 'PARENTID'
      Required = True
    end
    object TVSubItemsVALUE: TStringField
      FieldName = 'VALUE'
      Size = 556
    end
    object TVSubItemsSOURCELIST: TStringField
      FieldName = 'SOURCELIST'
      Size = 2048
    end
  end
  object ReferLink: TOracleDataSet
    SQL.Strings = (
      'Select * From  SBCM_References')
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
    Left = 72
    Top = 8
    object ReferLinkID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ReferLinkNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object ReferLinkLNAME: TStringField
      FieldName = 'LNAME'
      Size = 128
    end
    object ReferLinkPARENTID: TFloatField
      FieldName = 'PARENTID'
      Required = True
    end
    object ReferLinkVALUE: TStringField
      FieldName = 'VALUE'
      Size = 556
    end
    object ReferLinkSOURCELIST: TStringField
      FieldName = 'SOURCELIST'
      Size = 2048
    end
  end
  object ReferPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'sbcm_rpdepository'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 24
    Top = 80
  end
end
