object DepositDataModule: TDepositDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 192
  Top = 107
  Height = 480
  Width = 696
  object Deposits: TOracleDataSet
    SQL.Strings = (
      'Select'
      '    Contracts.ID'
      '   ,Contracts.ContractNo'
      '   ,Contracts.OpenDate'
      '   ,Contracts.CloseDate'
      '   ,Contracts.Amount'
      '   ,Contracts.ContractType'
      ''
      ''
      '   ,Contracts.ClientType'
      ''
      '   ,ContractAccs.ContractAccID'
      '   ,ContractAccs.ClientAccID'
      ''
      '   ,ContractAccs.InterestAccID'
      ''
      ''
      '   ,ContractState.FacticalDebt'
      '   ,ContractState.FacticalInterestDebt'
      ''
      ''
      '   ,ContractState.CalculationEnabled'
      ''
      '   ,ContractState.LastProcessDate'
      '   ,ContractState.OverdueInterestDebt as TotalCalcedInterest'
      ''
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(ContractAccs.Contrac' +
        'tAccID) as ContractAccNo'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(ContractAccs.ClientA' +
        'ccID) as ClientAccNo'
      ''
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(ContractAccs.Interes' +
        'tAccID) as InterestAccNo'
      ''
      ''
      
        '   ,SBCM_Stored_Programs.SBCMGetCurrencyShortName(ContractAccs.C' +
        'ontractAccID)as ContractCurrency'
      
        '   ,SBCM_Stored_Programs.SBCMGetCurrencyShortName(ContractAccs.C' +
        'lientAccID) as ClientCurrency'
      ''
      
        '   ,SBCM_Stored_Programs.SBCMGetCurrencyShortName(ContractAccs.I' +
        'nterestAccID) as InterestCurrency'
      ''
      
        '   ,SBCM_Stored_Programs.SBCMGetAccName(ContractAccs.ContractAcc' +
        'ID) as ContractAccName'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccName(ContractAccs.ClientAccID' +
        ') as ClientAccName'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccName(ContractAccs.InterestAcc' +
        'ID) as InterestAccName'
      
        '   ,SBCM_Stored_Programs.GetContractCurrency(Contracts.ID) as Co' +
        'ntractCurrencyID'
      
        '   ,SBCM_Stored_Programs.CheckContractState(Contracts.ID) as  St' +
        'atus'
      '   ,ContractState.StopCalculationDate as LastWCDate'
      '  From'
      '   SBCM_Contracts Contracts'
      '  ,SBCM_Contract_Accounts ContractAccs'
      '  ,SBCM_Contract_State ContractState'
      '  Where'
      '    Contracts.Type# = ('
      '       Select ID from'
      '              SBCM_CONTRACT_TYPES'
      '              Where upper(Name) = '#39'DEPOSIT'#39
      '               )'
      '           And Contracts.ID = ContractAccs.ID#'
      '           And Contracts.ID = ContractState.ID#'
      '   Order By  Status,:OrderClause'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000010000000C0000003A4F52444552434C415553450100000000000000
      00000000}
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
    Top = 16
    object DepositsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DepositsCONTRACTNO: TStringField
      FieldName = 'CONTRACTNO'
      Size = 64
    end
    object DepositsOPENDATE: TDateTimeField
      FieldName = 'OPENDATE'
      Required = True
    end
    object DepositsCLOSEDATE: TDateTimeField
      FieldName = 'CLOSEDATE'
      Required = True
    end
    object DepositsAMOUNT: TFloatField
      FieldName = 'AMOUNT'
      currency = True
    end
    object DepositsCONTRACTTYPE: TIntegerField
      FieldName = 'CONTRACTTYPE'
    end
    object DepositsCLIENTTYPE: TFloatField
      FieldName = 'CLIENTTYPE'
    end
    object DepositsCONTRACTACCID: TFloatField
      FieldName = 'CONTRACTACCID'
      Required = True
    end
    object DepositsCLIENTACCID: TFloatField
      FieldName = 'CLIENTACCID'
    end
    object DepositsINTERESTACCID: TFloatField
      FieldName = 'INTERESTACCID'
    end
    object DepositsFACTICALDEBT: TFloatField
      FieldName = 'FACTICALDEBT'
      currency = True
    end
    object DepositsFACTICALINTERESTDEBT: TFloatField
      FieldName = 'FACTICALINTERESTDEBT'
      currency = True
    end
    object DepositsCALCULATIONENABLED: TFloatField
      FieldName = 'CALCULATIONENABLED'
      Required = True
    end
    object DepositsLASTPROCESSDATE: TDateTimeField
      FieldName = 'LASTPROCESSDATE'
    end
    object DepositsCONTRACTACCNO: TStringField
      FieldName = 'CONTRACTACCNO'
      Size = 4000
    end
    object DepositsCLIENTACCNO: TStringField
      FieldName = 'CLIENTACCNO'
      Size = 4000
    end
    object DepositsINTERESTACCNO: TStringField
      FieldName = 'INTERESTACCNO'
      Size = 4000
    end
    object DepositsCONTRACTCURRENCY: TStringField
      FieldName = 'CONTRACTCURRENCY'
      Size = 4000
    end
    object DepositsCLIENTCURRENCY: TStringField
      FieldName = 'CLIENTCURRENCY'
      Size = 4000
    end
    object DepositsINTERESTCURRENCY: TStringField
      FieldName = 'INTERESTCURRENCY'
      Size = 4000
    end
    object DepositsCONTRACTACCNAME: TStringField
      FieldName = 'CONTRACTACCNAME'
      Size = 4000
    end
    object DepositsCLIENTACCNAME: TStringField
      FieldName = 'CLIENTACCNAME'
      Size = 4000
    end
    object DepositsINTERESTACCNAME: TStringField
      FieldName = 'INTERESTACCNAME'
      Size = 4000
    end
    object DepositsCONTRACTCURRENCYID: TFloatField
      FieldName = 'CONTRACTCURRENCYID'
    end
    object DepositsSTATUS: TFloatField
      FieldName = 'STATUS'
    end
    object DepositsLASTWCDATE: TDateTimeField
      FieldName = 'LASTWCDATE'
    end
    object DepositsTOTALCALCEDINTEREST: TFloatField
      FieldName = 'TOTALCALCEDINTEREST'
      currency = True
    end
  end
  object DataSrcDeposit: TDataSource
    DataSet = Deposits
    Left = 56
    Top = 16
  end
  object OverduePercents: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   ID#'
      '  ,Hdate'
      '  ,OverdueInterest'
      ' From SBCM_OverdueInterests'
      ' Where  ID# =:ID# ')
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
    Master = Deposits
    MasterFields = 'ID'
    DetailFields = 'ID#'
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
    Left = 208
    Top = 16
    object OverduePercentsID: TFloatField
      FieldName = 'ID#'
      Required = True
    end
    object OverduePercentsHDATE: TDateTimeField
      FieldName = 'HDATE'
      Required = True
    end
    object OverduePercentsOVERDUEINTEREST: TFloatField
      FieldName = 'OVERDUEINTEREST'
      Required = True
    end
  end
  object Percents: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   ID#'
      '  ,Hdate'
      '  ,Interest'
      ' From SBCM_Interests'
      'Where  ID# =:ID# ')
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
    Master = Deposits
    MasterFields = 'ID'
    DetailFields = 'ID#'
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
    Left = 328
    Top = 24
    object PercentsID: TFloatField
      FieldName = 'ID#'
      Required = True
    end
    object PercentsHDATE: TDateTimeField
      FieldName = 'HDATE'
      Required = True
    end
    object PercentsINTEREST: TFloatField
      FieldName = 'INTEREST'
      Required = True
    end
  end
end
