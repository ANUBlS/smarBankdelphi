object ContDataModule: TContDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 125
  Top = 182
  Height = 480
  Width = 696
  object Currencys: TOracleDataSet
    SQL.Strings = (
      'Select  Valute,Valu_Name '
      ' From'
      '   AValute')
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
    Left = 113
    Top = 7
  end
  object DataSrcCurrencys: TDataSource
    DataSet = Currencys
    Left = 33
    Top = 15
  end
  object Categories: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   ID'
      '  ,Category'
      ' From SBCM_Categories')
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
    Left = 112
    Top = 56
  end
  object DataSrcCategories: TDataSource
    DataSet = Categories
    Left = 32
    Top = 64
  end
  object DataSrcTypes: TDataSource
    DataSet = CreditTypes
    Left = 32
    Top = 112
  end
  object CreditTypes: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   ID,Type From'
      '              SBCM_Credit_Types')
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
    Left = 112
    Top = 104
    object CreditTypesID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object CreditTypesTYPE: TStringField
      FieldName = 'TYPE'
      Size = 128
    end
  end
  object DataSrcCreditExporter: TDataSource
    DataSet = ReliabilityData
    Left = 416
    Top = 16
  end
  object ReliabilityData: TOracleDataSet
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
    Left = 416
    Top = 64
  end
  object ReserveData: TOracleDataSet
    SQL.Strings = (
      'select'
      'h.id ,'
      'LoanAcc.Acc_No ,'
      'LoanAcc.Bal_Cn1 ,'
      'LoanAcc.Val_Acc ,'
      'Round(h.PRIMARYDEBTREST  * op.Ostat , 2) as Rest,'
      
        'sbcm_stored_programs.GetReservePercentByID(h.PRIMARYRESERVEPERCE' +
        'NT) as ReservePercent ,'
      'c.OpenDate ,'
      'c.CloseDate ,'
      'cat.truecategory'
      'from'
      'sbcm_state_history h ,'
      'sbcm_contracts c,'
      'sbcm_contract_accounts a,'
      'operkurs op ,'
      'Account LoanAcc ,'
      'sbcm_categories cat '
      ''
      'where'
      '  h.PRIMARYDEBTREST > 0 and'
      '  h.HDate = :HDate and'
      '  h.id# = c.id and'
      '  c.id = a.id# and'
      '  op.dat = :HDate and'
      '  op.val_kod = LoanAcc.val_acc and'
      '  c.ClientType = cat.id and  '
      '  LoanAcc.ID = a.ContractAccID'
      ''
      'union'
      ''
      'select'
      'h.id ,'
      'LoanAcc.Acc_No ,'
      'LoanAcc.Bal_Cn1 ,'
      'LoanAcc.Val_Acc ,'
      'Round(h.OVERDUEDEBTREST * op.Ostat , 2) as Rest ,'
      
        'sbcm_stored_programs.GetReservePercentByID(h.OVERDUERESERVEPERCE' +
        'NT) as ReservePercent ,'
      'c.OpenDate ,'
      'c.CloseDate ,'
      'cat.truecategory'
      'from'
      'sbcm_state_history h ,'
      'sbcm_contracts c,'
      'sbcm_contract_accounts a,'
      'operkurs op ,'
      'sbcm_categories cat ,'
      'Account LoanAcc'
      ''
      'where'
      '  h.OverdueDebtRest > 0 and'
      '  h.HDate = :HDate and'
      '  h.id# = c.id and'
      '  c.id = a.id# and'
      '  op.dat = :HDate and '
      '  op.val_kod = LoanAcc.val_acc and'
      '  c.ClientType = cat.id and'
      '  LoanAcc.ID = a.OverdueAccID'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000060000003A48444154450C0000000000000000000000}
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
    Left = 24
    Top = 224
  end
  object DataSrcReserve: TDataSource
    DataSet = ReserveData
    Left = 96
    Top = 224
  end
  object ConvertingPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBCM_PERCENT_CONVERTING'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 240
    Top = 112
  end
end
