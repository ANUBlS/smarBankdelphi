object MOrdDataMod: TMOrdDataMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 192
  Top = 107
  Height = 480
  Width = 696
  object DataSrcTransactions: TDataSource
    DataSet = Transactions
    Left = 112
    Top = 88
  end
  object Transactions: TOracleDataSet
    SQL.Strings = (
      'select'
      '  P.ID as TransID ,'
      '  P.OP_ID as OperID ,'
      '  P.Dat as TransDate ,'
      '  DA.Acc_No as DebitAccount ,     --Debitor'
      '  DA.Name as DebitAccName ,       --Debit Account Name'
      '  DV.Val_Name as DebitCurrency ,'
      '  DC.INN as DebitTaxID ,'
      '  CA.Acc_No as CreditAccount ,    --Creditor'
      '  CA.Name as CreditAccName ,      --Credit Account Name'
      '  CV.Val_Name as CreditCurrency ,'
      '  CC.INN as CreditTaxID ,'
      ''
      '  P.Rate_D as DebitRate ,'
      '  P.Rate_C as CreditRate ,'
      ''
      '  P.Ammount as DebitAmount ,'
      '  P.Ammount_C as CreditAmount ,'
      '  P.LAmmount as LAmount'
      'from'
      '  Provarch P ,'
      '  Account DA ,'
      '  Account CA ,'
      '  Customers DC ,'
      '  Customers CC ,'
      '  Avalute DV ,'
      '  Avalute CV'
      'where'
      '  P.DAT between :FirstDate and :LastDate and'
      '  P.Debt = DA.ID and'
      '  P.Kredit = CA.ID and'
      '  DA.KLI_ID = DC.ID and'
      '  CA.KLI_ID = CC.ID and'
      '  DA.Val_Acc = DV.Valute and'
      '  CA.Val_Acc = CV.Valute and')
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
    Left = 111
    Top = 38
  end
  object CurrencysData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  valute as CurrencyID ,'
      '  valu_name as CurrencyLName'
      'from'
      '  Avalute')
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
    Left = 32
    Top = 160
    object CurrencysDataCURRENCYID: TIntegerField
      FieldName = 'CURRENCYID'
      Required = True
    end
    object CurrencysDataCURRENCYLNAME: TWideStringField
      FieldName = 'CURRENCYLNAME'
      Size = 25
    end
  end
  object DataSrcCurrencys: TDataSource
    DataSet = CurrencysData
    Left = 32
    Top = 208
  end
  object DataSrcBranches: TDataSource
    DataSet = Branches
    Left = 120
    Top = 280
  end
  object Branches: TOracleDataSet
    SQL.Strings = (
      'select'
      '  ID as BranchID,'
      '  NAME as BranchName'
      'from'
      ' FILIAL')
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
    Left = 119
    Top = 326
    object BranchesBRANCHID: TFloatField
      FieldName = 'BRANCHID'
      Required = True
    end
    object BranchesBRANCHNAME: TWideStringField
      FieldName = 'BRANCHNAME'
      Size = 90
    end
  end
  object BankInfo: TOracleDataSet
    SQL.Strings = (
      'select'
      '  Az_Name as BankLName ,'
      '  INN     as TaxID ,'
      '  ManagerTitle ,'
      '  AccountantTitle ,'
      '  Sedr as Manager ,'
      '  Buhaltr as Accountant'
      'from'
      '  BankInfo ')
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
    Left = 320
    Top = 56
    object BankInfoBANKLNAME: TWideStringField
      FieldName = 'BANKLNAME'
      Size = 80
    end
    object BankInfoTAXID: TWideStringField
      FieldName = 'TAXID'
      Size = 15
    end
    object BankInfoMANAGERTITLE: TWideStringField
      FieldName = 'MANAGERTITLE'
      Size = 128
    end
    object BankInfoACCOUNTANTTITLE: TWideStringField
      FieldName = 'ACCOUNTANTTITLE'
      Size = 128
    end
    object BankInfoMANAGER: TWideStringField
      FieldName = 'MANAGER'
    end
    object BankInfoACCOUNTANT: TWideStringField
      FieldName = 'ACCOUNTANT'
    end
  end
  object Memorial: TOracleDataSet
    SQL.Strings = (
      'select M.RowID ,M.BALANCE from Memorial M'
      ' ')
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
    Left = 384
    Top = 248
    object MemorialBALANCE: TFloatField
      FieldName = 'BALANCE'
      Required = True
    end
  end
  object DataSrcMemorial: TDataSource
    DataSet = Memorial
    Left = 384
    Top = 296
  end
  object Sysdat: TOracleDataSet
    SQL.Strings = (
      'select'
      ' TEK_DAT'
      'from SYSDAT')
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
    Left = 408
    Top = 56
    object SysdatTEK_DAT: TDateTimeField
      FieldName = 'TEK_DAT'
      Required = True
    end
  end
  object DataSrcUsers: TDataSource
    DataSet = Users
    Left = 192
    Top = 216
  end
  object Users: TOracleDataSet
    SQL.Strings = (
      'select '
      '  ID UserID ,'
      '  Name as UserName'
      'from '
      '  user$')
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
    Left = 191
    Top = 166
    object UsersUSERID: TFloatField
      FieldName = 'USERID'
      Required = True
    end
    object UsersUSERNAME: TWideStringField
      FieldName = 'USERNAME'
      Size = 32
    end
  end
end
