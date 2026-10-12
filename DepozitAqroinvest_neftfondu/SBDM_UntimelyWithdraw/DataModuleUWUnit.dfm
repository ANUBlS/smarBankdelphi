object UWDataModule: TUWDataModule
  OldCreateOrder = False
  Left = 203
  Top = 107
  Height = 480
  Width = 696
  object ContractTypeData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  withdrawtype as type# ,'
      '  additionaltype as DepositKind ,'
      '  type as TypeDiscription'
      'from'
      '  SBCM_Deposit_Types'
      'where'
      '  ID = ('
      '        select'
      '          contracttype'
      '        from'
      '          SBCM_contracts'
      '        where ID = :ID'
      '        )'
      ' '
      ' '
      ' '
      ' ')
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
    Left = 56
    Top = 80
    object ContractTypeDataTYPEDISCRIPTION: TStringField
      FieldName = 'TYPEDISCRIPTION'
      Required = True
      Size = 256
    end
    object ContractTypeDataTYPE: TStringField
      FieldName = 'TYPE#'
      Size = 32
    end
    object ContractTypeDataDEPOSITKIND: TStringField
      FieldName = 'DEPOSITKIND'
      Size = 32
    end
  end
  object DataSrcContractType: TDataSource
    DataSet = ContractTypeData
    Left = 56
    Top = 128
  end
  object OtherDeposits: TOracleDataSet
    SQL.Strings = (
      'select '
      '  sum(Amount)  as TotalDeposits'
      'from'
      '  SBCM_COLLECTION'
      'where'
      '  ID# = :ContractID    ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000010000000B0000003A434F4E54524143544944030000000000000000
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
    Top = 80
    object OtherDepositsTOTALDEPOSITS: TFloatField
      FieldName = 'TOTALDEPOSITS'
    end
  end
  object DataSrcOtherDeposit: TDataSource
    DataSet = OtherDeposits
    Left = 160
    Top = 128
  end
end
