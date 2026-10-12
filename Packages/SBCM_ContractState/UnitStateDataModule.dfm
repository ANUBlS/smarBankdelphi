object TrafficDataModule: TTrafficDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 203
  Top = 107
  Height = 480
  Width = 696
  object DataSrcTranches: TDataSource
    DataSet = TranchesData
    Left = 216
    Top = 32
  end
  object TranchesData: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   ID'
      '  ,ID#'
      '  ,HDate'
      '  ,Total'
      '  ,Reserve'
      '  FROM'
      '    SBCM_Tranches'
      '  WHERE'
      '    ID# = :ID#')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A494423030000000000000000000000}
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
    Top = 80
    object TranchesDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object TranchesDataID2: TFloatField
      FieldName = 'ID#'
      Required = True
    end
    object TranchesDataHDATE: TDateTimeField
      FieldName = 'HDATE'
      Required = True
    end
    object TranchesDataTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
    end
    object TranchesDataRESERVE: TFloatField
      FieldName = 'RESERVE'
      currency = True
    end
  end
  object DataSrcProlongations: TDataSource
    DataSet = ProlongationsData
    Left = 40
    Top = 32
  end
  object ProlongationsData: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '    ID'
      '   ,ID#'
      '   ,HDate'
      '   ,OldDate'
      '   ,NewDate'
      '  FROM'
      '    SBCM_Prolongations'
      '  WHERE'
      '    ID# = :ID#  ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A494423030000000000000000000000}
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
    Top = 80
    object ProlongationsDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ProlongationsDataID2: TFloatField
      FieldName = 'ID#'
      Required = True
    end
    object ProlongationsDataHDATE: TDateTimeField
      FieldName = 'HDATE'
      Required = True
    end
    object ProlongationsDataOLDDATE: TDateTimeField
      FieldName = 'OLDDATE'
      Required = True
    end
    object ProlongationsDataNEWDATE: TDateTimeField
      FieldName = 'NEWDATE'
      Required = True
    end
  end
  object DataSrcPayments: TDataSource
    DataSet = PaymentsData
    Left = 128
    Top = 80
  end
  object PaymentsData: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '     ID'
      '    ,ID#'
      '    ,HDate'
      '    ,FacticalDebt'
      '    ,InterestDebt'
      '    ,OverdueDebt'
      '    ,OverdueInterestDebt'
      '  FROM'
      '     SBCM_Payments'
      '   WHERE'
      '     ID# =:ID#')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A494423030000000000000000000000}
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
    Top = 32
    object PaymentsDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object PaymentsDataID2: TFloatField
      FieldName = 'ID#'
      Required = True
    end
    object PaymentsDataHDATE: TDateTimeField
      FieldName = 'HDATE'
      Required = True
    end
    object PaymentsDataFACTICALDEBT: TFloatField
      FieldName = 'FACTICALDEBT'
      DisplayFormat = '#,##0.00'
    end
    object PaymentsDataINTERESTDEBT: TFloatField
      FieldName = 'INTERESTDEBT'
      DisplayFormat = '#,##0.00'
    end
    object PaymentsDataOVERDUEDEBT: TFloatField
      FieldName = 'OVERDUEDEBT'
      DisplayFormat = '#,##0.00'
    end
    object PaymentsDataOVERDUEINTERESTDEBT: TFloatField
      FieldName = 'OVERDUEINTERESTDEBT'
      DisplayFormat = '#,##0.00'
    end
  end
  object PaymentOrderData: TOracleDataSet
    SQL.Strings = (
      'select'
      '    Contracts.ID as ContractID'
      '   ,Contracts.ContractNo'
      '   ,Contracts.OpenDate'
      '   ,ContractAccs.ContractAccID'
      ''
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(ContractAccs.Contrac' +
        'tAccID) as ContractAccNo'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(ContractAccs.ClientA' +
        'ccID) as ClientAccNo'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(ContractAccs.Interes' +
        'tAccID) as InterestAccNo'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(ContractAccs.Overdue' +
        'AccID) as OverdueAccNo'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(ContractAccs.Overdue' +
        'InterestAccID) as OverdueInterestAccNo'
      ''
      
        '   ,SBCM_Stored_Programs.SBCMGetAccName(ContractAccs.ContractAcc' +
        'ID) as ContractAccName'
      ''
      
        '   ,SBCM_Stored_Programs.SBCMGetCurrencyShortName(ContractAccs.C' +
        'ontractAccID)as ContractCurrency'
      
        '   ,SBCM_Stored_Programs.SBCMGetCurrencyShortName(ContractAccs.C' +
        'lientAccID) as ClientCurrency'
      
        '   ,SBCM_Stored_Programs.SBCMGetCurrencyShortName(ContractAccs.I' +
        'nterestAccID) as InterestCurrency'
      
        '   ,SBCM_Stored_Programs.SBCMGetCurrencyShortName(ContractAccs.O' +
        'verdueAccID) as OverdueCurrency'
      
        '   ,SBCM_Stored_Programs.SBCMGetCurrencyShortName(ContractAccs.O' +
        'verdueInterestAccID) as OverdueInterestCurrency'
      ''
      
        '   ,SBCM_Stored_Programs.GetAccountCurrencyID(ContractAccs.Clien' +
        'tAccID) as CustomerCurrncyID'
      
        '   ,SBCM_Stored_Programs.GetContractCurrency(Contracts.ID) as Co' +
        'ntractCurrencyID'
      'from'
      '   SBCM_Contracts Contracts'
      '  ,SBCM_Contract_Accounts ContractAccs'
      'where'
      '  Contracts.ID = :ContractID and'
      '  Contracts.ID = ContractAccs.ID#'
      ''
      '  '
      '    '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
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
    OnCalcFields = PaymentOrderDataCalcFields
    Left = 64
    Top = 184
    object PaymentOrderDataCONTRACTID: TFloatField
      FieldName = 'CONTRACTID'
      Required = True
    end
    object PaymentOrderDataCONTRACTNO: TStringField
      FieldName = 'CONTRACTNO'
      Size = 64
    end
    object PaymentOrderDataOPENDATE: TDateTimeField
      FieldName = 'OPENDATE'
      Required = True
    end
    object PaymentOrderDataCONTRACTACCNO: TStringField
      FieldName = 'CONTRACTACCNO'
      Size = 4000
    end
    object PaymentOrderDataCLIENTACCNO: TStringField
      FieldName = 'CLIENTACCNO'
      Size = 4000
    end
    object PaymentOrderDataINTERESTACCNO: TStringField
      FieldName = 'INTERESTACCNO'
      Size = 4000
    end
    object PaymentOrderDataOVERDUEACCNO: TStringField
      FieldName = 'OVERDUEACCNO'
      Size = 4000
    end
    object PaymentOrderDataOVERDUEINTERESTACCNO: TStringField
      FieldName = 'OVERDUEINTERESTACCNO'
      Size = 4000
    end
    object PaymentOrderDataCONTRACTACCNAME: TStringField
      FieldName = 'CONTRACTACCNAME'
      Size = 4000
    end
    object PaymentOrderDataCONTRACTCURRENCY: TStringField
      FieldName = 'CONTRACTCURRENCY'
      Size = 4000
    end
    object PaymentOrderDataCLIENTCURRENCY: TStringField
      FieldName = 'CLIENTCURRENCY'
      Size = 4000
    end
    object PaymentOrderDataINTERESTCURRENCY: TStringField
      FieldName = 'INTERESTCURRENCY'
      Size = 4000
    end
    object PaymentOrderDataOVERDUECURRENCY: TStringField
      FieldName = 'OVERDUECURRENCY'
      Size = 4000
    end
    object PaymentOrderDataOVERDUEINTERESTCURRENCY: TStringField
      FieldName = 'OVERDUEINTERESTCURRENCY'
      Size = 4000
    end
    object PaymentOrderDataCUSTOMERCURRNCYID: TFloatField
      FieldName = 'CUSTOMERCURRNCYID'
    end
    object PaymentOrderDataCONTRACTCURRENCYID: TFloatField
      FieldName = 'CONTRACTCURRENCYID'
    end
    object PaymentOrderDataFacticalDebtInNational: TFloatField
      FieldKind = fkCalculated
      FieldName = 'FacticalDebtInNational'
      Calculated = True
    end
    object PaymentOrderDataInterestDebtInNational: TFloatField
      FieldKind = fkCalculated
      FieldName = 'InterestDebtInNational'
      Calculated = True
    end
    object PaymentOrderDataOverdueDebtInNational: TFloatField
      FieldKind = fkCalculated
      FieldName = 'OverdueDebtInNational'
      Calculated = True
    end
    object PaymentOrderDataOverdueInterestDebtInNational: TFloatField
      FieldKind = fkCalculated
      FieldName = 'OverdueInterestDebtInNational'
      Calculated = True
    end
    object PaymentOrderDataCONTRACTACCID: TFloatField
      FieldName = 'CONTRACTACCID'
      Required = True
    end
  end
  object Rates: TOracleDataSet
    SQL.Strings = (
      'select'
      '  Ostat   as Rate'
      'from'
      '  OperKurs'
      'where'
      '  Dat = :Dat   and'
      '  Val_Kod = :CurrencyID'
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000040000003A4441540C00000000000000000000000B000000
      3A43555252454E43594944030000000000000000000000}
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
    Top = 184
    object RatesRATE: TFloatField
      FieldName = 'RATE'
    end
  end
  object AboutBank: TOracleDataSet
    SQL.Strings = (
      'select'
      '  az_Name as FullBankName,'
      '  Logo ,'
      '  INN'
      'from BankInfo'
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
    Active = False
    Left = 304
    Top = 32
  end
  object CustomerData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  ID,'
      '  Name'
      'from'
      '  Customers'
      'where'
      '  ID = (select'
      '          KLI_ID'
      '        from'
      '          Account'
      '        where'
      '          ID = :ID    '
      '          )'
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
    Master = PaymentOrderData
    MasterFields = 'ContractAccID'
    DetailFields = 'ID'
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
    Left = 256
    Top = 192
    object CustomerDataNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object CustomerDataID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
  end
end
