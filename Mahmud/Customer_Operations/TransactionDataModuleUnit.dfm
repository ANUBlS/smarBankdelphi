object TransactionDataModule: TTransactionDataModule
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 628
  Width = 837
  object Sysdat: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select tek_dat from sysdat')
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
    Left = 208
    Top = 8
  end
  object TransactionsData: TDataSource
    DataSet = Transactions
    Left = 32
    Top = 80
  end
  object DataSysdat: TDataSource
    DataSet = Sysdat
    Left = 211
    Top = 64
  end
  object DebitCurrency: TDataSource
    DataSet = DebitCurrencyData
    Left = 410
    Top = 65
  end
  object DebitCurrencyData: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select'
      '  currency.valute as ID,'
      '  currency.val_name as SName,'
      '  currency.valu_name as Name,'
      '  rates.OSTAT as Rate'
      'from'
      '  avalute currency,'
      '  TEMPRATE rates'
      'where'
      '  rates.VAL_KOD = currency.VALUTE'
      'order by currency.valute')
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
    ReadOnly = True
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
    Top = 17
    object DebitCurrencyDataID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object DebitCurrencyDataSNAME: TStringField
      FieldName = 'SNAME'
      Size = 10
    end
    object DebitCurrencyDataNAME: TStringField
      FieldName = 'NAME'
      Size = 25
    end
    object DebitCurrencyDataRATE: TFloatField
      FieldName = 'RATE'
    end
  end
  object CreditCurrency: TDataSource
    DataSet = CreditCurrencyData
    Left = 512
    Top = 73
  end
  object CreditCurrencyData: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select'
      '  currency.valute as ID,'
      '  currency.val_name as SName,'
      '  currency.valu_name as Name,'
      '  rates.OSTAT as Rate'
      'from'
      '  avalute currency,'
      '  TEMPRATE rates'
      'where'
      '  rates.VAL_KOD = currency.VALUTE'
      'order by currency.valute')
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
    ReadOnly = True
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
    Left = 512
    Top = 17
    object CreditCurrencyDataID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object CreditCurrencyDataSNAME: TStringField
      FieldName = 'SNAME'
      Size = 10
    end
    object CreditCurrencyDataNAME: TStringField
      FieldName = 'NAME'
      Size = 25
    end
    object CreditCurrencyDataRATE: TFloatField
      FieldName = 'RATE'
    end
  end
  object DebitAccs: TDataSource
    DataSet = DebitAccData
    Left = 418
    Top = 189
  end
  object DebitAccData: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  ID,'
      '  ACC_NO,'
      '  VAL_ACC,'
      '  NAME,'
      '  ISCASHBALANCE(BAL_CN1) AS ISCACHEACCOUNT'
      'FROM'
      '  ACCOUNT PARTITION ( ACTIVACC ) '
      'ORDER BY ACC_NO'
      ''
      '/*'
      'CREATE OR REPLACE'
      
        'FUNCTION iscashbalance( BALANCE BAL_SPR1.BAL_CN%TYPE ) RETURN  B' +
        'AL_SPR1.CASHINCOMING%TYPE'
      'IS'
      '  RESULT BAL_SPR1.CASHINCOMING%TYPE;'
      'BEGIN'
      
        '  SELECT CASHINCOMING INTO RESULT FROM BAL_SPR1 WHERE BAL_CN = B' +
        'ALANCE;'
      '  RETURN RESULT;'
      'END;'
      '*/')
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
    Left = 407
    Top = 125
    object DebitAccDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DebitAccDataACC_NO: TStringField
      FieldName = 'ACC_NO'
      Required = True
    end
    object DebitAccDataVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
      Required = True
    end
    object DebitAccDataNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object DebitAccDataISCACHEACCOUNT: TFloatField
      FieldName = 'ISCACHEACCOUNT'
    end
    object DebitAccDataBALANCE: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'BALANCE'
      LookupDataSet = DebitAccRestData
      LookupKeyFields = 'ACC_ID'
      LookupResultField = 'OSTAT'
      KeyFields = 'ID'
      Lookup = True
    end
    object DebitAccDataLBALANCE: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'LBALANCE'
      LookupDataSet = DebitAccRestData
      LookupKeyFields = 'ACC_ID'
      LookupResultField = 'POK_OSTAT'
      KeyFields = 'ID'
      Lookup = True
    end
  end
  object CreditAccData: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  ID,'
      '  ACC_NO,'
      '  VAL_ACC,'
      '  NAME,'
      '  ISCASHBALANCE(BAL_CN1) AS ISCACHEACCOUNT'
      'FROM'
      '  ACCOUNT PARTITION ( ACTIVACC ) '
      'ORDER BY ACC_NO'
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
    Left = 514
    Top = 133
    object CreditAccDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CreditAccDataACC_NO: TStringField
      FieldName = 'ACC_NO'
      Required = True
    end
    object CreditAccDataVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
      Required = True
    end
    object CreditAccDataNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object CreditAccDataISCACHEACCOUNT: TFloatField
      FieldName = 'ISCACHEACCOUNT'
    end
    object CreditAccDataBALANCE: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'BALANCE'
      LookupDataSet = CreditAccRestData
      LookupKeyFields = 'ACC_ID'
      LookupResultField = 'OSTAT'
      KeyFields = 'ID'
      Lookup = True
    end
    object CreditAccDataLBALANCE: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'LBALANCE'
      LookupDataSet = CreditAccRestData
      LookupKeyFields = 'ACC_ID'
      LookupResultField = 'POK_OSTAT'
      KeyFields = 'ID'
      Lookup = True
    end
  end
  object CreditAccs: TDataSource
    DataSet = CreditAccData
    Left = 514
    Top = 189
  end
  object ConvertationSymbols: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select * from CONVERT_ASSIGNMENTS'
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
    Active = False
    Left = 208
    Top = 240
  end
  object ConvertationSymbolsData: TDataSource
    DataSet = ConvertationSymbols
    Left = 208
    Top = 288
  end
  object CashSymbols: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT'
      '  symbol,'
      '  name,'
      '  mediocrity'
      'FROM'
      '  kassa_b'
      'order by symbol ')
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
    Left = 208
    Top = 120
  end
  object CashSymbolsData: TDataSource
    DataSet = CashSymbols
    Left = 208
    Top = 176
  end
  object Currency: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'Select valute from Avalute')
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
    Left = 264
    Top = 8
  end
  object OperationTypes: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select'
      '  *'
      'from'
      '  vid_op'
      'where'
      '  id>=0'
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
    Left = 264
    Top = 64
  end
  object OperationTypesData: TDataSource
    DataSet = OperationTypes
    Left = 264
    Top = 120
  end
  object Transactions: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  p.ID,'
      '  P.rowid,'
      '  p.OP_ID as OperatorID,'
      '  p.no_prov as OperationNo,'
      '  p.dat as TransactionDate,'
      '  p.DEBT as DebitID,'
      '  ad.ACC_NO as DebitAccNo,'
      '  p.VAL_ACC as DebitCurrencyID,'
      '  dc.val_name as DebitCurrencySName,'
      '  ad.filial as DebitBranch,'
      '  p.KREDIT as CreditID,'
      '  ac.ACC_NO as CreditAccNo,'
      '  p.CurrencyID_C as CreditCurrencyID,'
      '  cc.val_name as CreditCurrencySName,'
      '  ac.filial as CreditBranch,'
      '  p.ammount as DebitAmount,'
      '  p.Ammount_C as CreditAmount,'
      '  p.LAmmount as LAmount,'
      '  p.Rate_D as DebitRate,'
      '  p.Rate_C as CreditRate,'
      '  p.Bank_D as DebitBank,'
      '  p.Bank_K as CreditBank,'
      '  p.NO_PACK as PackageNumber,'
      '  p.SHIFR as CYPHERCODE,'
      
        '  sb_expertanalyse.getoperationtype(p.vid_op, p.val_acc, p.curre' +
        'ncyID_c) as OPERATIONCODE,'
      '  p.Kassa_B as INBALANCECHAR,'
      '  p.Kassa_Z as OUTBALANCECHAR,'
      '  p.NO_FILIAL as FilialID,'
      '  ad.bal_cn1 as DebitBalance,'
      '  p.Name,'
      '  0 as Flags,'
      '  2 as status,'
      '  '#39#39' as REJECT_REASON'
      'FROM'
      '    account ad,'
      '    account ac,'
      '    avalute dc,'
      '    avalute cc,'
      '    provarch p'
      'where'
      '    p.dat =:TransactionDate'
      '    and (ad.ID = p.DEBT)'
      '    and (ac.ID = p.KREDIT)'
      '    and (ad.val_acc = p.val_acc)'
      '    and (ac.val_acc = p.CurrencyID_C)'
      '    and (dc.VALUTE = p.val_acc)'
      '    and (cc.VALUTE = p.CurrencyID_C)'
      '--    and ((P.OP_ID<>-1 and'
      
        '  --        not EXISTS(select SUSER from sba_userman where MUSER' +
        '=uid and (type#=1 or type#=0)))'
      '    --      or'
      
        '      --    (P.OP_ID in(select SUSER from sba_userman where MUSE' +
        'R=uid and (type#=1 or type#=0))))'
      ''
      'union all'
      ''
      'SELECT'
      '  p.ID,'
      '  P.rowid,'
      '  p.OP_ID as OperatorID,'
      '  p.no_prov as OperationNo,'
      '  p.dat as TransactionDate,'
      '  p.DEBT as DebitID,'
      '  ad.ACC_NO as DebitAccNo,'
      '  p.VAL_ACC as DebitCurrencyID,'
      '  dc.val_name as DebitCurrencySName,'
      '  ad.filial as DebitBranch,'
      '  p.KREDIT as CreditID,'
      '  ac.ACC_NO as CreditAccNo,'
      '  p.CurrencyID_C as CreditCurrencyID,'
      '  cc.val_name as CreditCurrencySName,'
      '  ac.filial as CreditBranch,'
      '  p.ammount as DebitAmount,'
      '  p.Ammount_C as CreditAmount,'
      '  p.LAmmount as LAmount,'
      '  p.Rate_D as DebitRate,'
      '  p.Rate_C as CreditRate,'
      '  p.Bank_D as DebitBank,'
      '  p.Bank_K as CreditBank,'
      '  p.NO_PACK as PackageNumber,'
      '  p.SHIFR as CYPHERCODE,'
      
        '  sb_expertanalyse.getoperationtype(p.vid_op, p.val_acc, p.curre' +
        'ncyID_c) as OPERATIONCODE,'
      '  p.Kassa_B as INBALANCECHAR,'
      '  p.Kassa_Z as OUTBALANCECHAR,'
      '  p.NO_FILIAL as FilialID,'
      '  ad.bal_cn1 as DebitBalance,'
      '  p.Name,'
      '  0 as Flags,'
      '  decode(Rejected, 0, 1, 3) as status,'
      '  RejectReason as REJECT_REASON'
      'FROM'
      '    account ad,'
      '    account ac,'
      '    avalute dc,'
      '    avalute cc,'
      '    LAZYTRANSACTION p'
      'where'
      '    p.dat =:TransactionDate'
      '    and (ad.ID = p.DEBT)'
      '    and (ac.ID = p.KREDIT)'
      '    and (dc.VALUTE = p.val_acc)'
      '    and (cc.VALUTE = p.CurrencyID_C)'
      '  --  and ((P.OP_ID<>-1 and'
      
        '    --      not EXISTS(select SUSER from sba_userman where MUSER' +
        '=uid and (type#=1 or type#=0)))'
      '      --    or'
      
        '        --  (P.OP_ID in(select SUSER from sba_userman where MUSE' +
        'R=uid and (type#=1 or type#=0))))'
      ''
      '--Order by :Title'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
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
      0300000001000000100000003A5452414E53414354494F4E444154450C000000
      0000000000000000}
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
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 32
    Top = 24
    object TransactionsID: TFloatField
      DisplayLabel = '№'
      FieldName = 'ID'
    end
    object TransactionsOPERATORID: TFloatField
      FieldName = 'OPERATORID'
    end
    object TransactionsOPERATIONNO: TStringField
      FieldName = 'OPERATIONNO'
      Size = 8
    end
    object TransactionsTRANSACTIONDATE: TDateTimeField
      DisplayLabel = 'Тарих'
      FieldName = 'TRANSACTIONDATE'
    end
    object TransactionsDEBITID: TFloatField
      FieldName = 'DEBITID'
    end
    object TransactionsDEBITACCNO: TStringField
      DisplayLabel = 'Дебет'
      FieldName = 'DEBITACCNO'
    end
    object TransactionsDEBITCURRENCYID: TFloatField
      FieldName = 'DEBITCURRENCYID'
    end
    object TransactionsDEBITCURRENCYSNAME: TStringField
      DisplayLabel = '$'
      FieldName = 'DEBITCURRENCYSNAME'
      Size = 10
    end
    object TransactionsCREDITID: TFloatField
      FieldName = 'CREDITID'
    end
    object TransactionsCREDITACCNO: TStringField
      DisplayLabel = 'Кредит'
      FieldName = 'CREDITACCNO'
    end
    object TransactionsCREDITCURRENCYID: TFloatField
      FieldName = 'CREDITCURRENCYID'
    end
    object TransactionsCREDITCURRENCYSNAME: TStringField
      DisplayLabel = '$'
      FieldName = 'CREDITCURRENCYSNAME'
      Size = 10
    end
    object TransactionsDEBITAMOUNT: TFloatField
      DisplayLabel = 'Дебет мябляь'
      FieldName = 'DEBITAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object TransactionsCREDITAMOUNT: TFloatField
      DisplayLabel = 'Кредит мябляь'
      FieldName = 'CREDITAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object TransactionsLAMOUNT: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'LAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object TransactionsDEBITRATE: TFloatField
      FieldName = 'DEBITRATE'
    end
    object TransactionsCREDITRATE: TFloatField
      FieldName = 'CREDITRATE'
    end
    object TransactionsDEBITBANK: TFloatField
      FieldName = 'DEBITBANK'
    end
    object TransactionsCREDITBANK: TFloatField
      FieldName = 'CREDITBANK'
    end
    object TransactionsPACKAGENUMBER: TFloatField
      FieldName = 'PACKAGENUMBER'
    end
    object TransactionsCYPHERCODE: TFloatField
      FieldName = 'CYPHERCODE'
    end
    object TransactionsOPERATIONCODE: TFloatField
      FieldName = 'OPERATIONCODE'
    end
    object TransactionsINBALANCECHAR: TFloatField
      FieldName = 'INBALANCECHAR'
    end
    object TransactionsOUTBALANCECHAR: TFloatField
      FieldName = 'OUTBALANCECHAR'
    end
    object TransactionsFILIALID: TFloatField
      FieldName = 'FILIALID'
    end
    object TransactionsDEBITBALANCE: TFloatField
      FieldName = 'DEBITBALANCE'
    end
    object TransactionsNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object TransactionsFLAGS: TFloatField
      FieldName = 'FLAGS'
    end
    object TransactionsSTATUS: TFloatField
      FieldName = 'STATUS'
    end
    object TransactionsREJECT_REASON: TStringField
      FieldName = 'REJECT_REASON'
      Size = 255
    end
    object TransactionsDEBITBRANCH: TFloatField
      FieldName = 'DEBITBRANCH'
    end
    object TransactionsCREDITBRANCH: TFloatField
      FieldName = 'CREDITBRANCH'
    end
  end
  object DebitBranch: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select * from filial order by ID')
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
    Left = 413
    Top = 248
  end
  object DebitBranchData: TDataSource
    DataSet = DebitBranch
    Left = 416
    Top = 304
  end
  object CreditBranch: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select * from filial order by ID')
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
    Left = 520
    Top = 248
  end
  object CreditBranchData: TDataSource
    DataSet = CreditBranch
    Left = 520
    Top = 304
  end
  object UsersData: TDataSource
    DataSet = Users
    Left = 416
    Top = 420
  end
  object Users: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select * from user$')
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
    Top = 364
  end
  object Operations: TOracleQuery
    SQL.Strings = (
      'SELECT '
      '   id, name'
      'FROM '
      '   vid_op'
      'Order by'
      '   ID'
      '')
    Session = sboapiDataModule.SBSession
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = True
    ThreadSynchronized = True
    Left = 264
    Top = 356
  end
  object Valute: TOracleQuery
    SQL.Strings = (
      'select valute,valu_name from avalute order by valute')
    Session = sboapiDataModule.SBSession
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = True
    ThreadSynchronized = True
    Left = 320
    Top = 356
  end
  object SBTransaction: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SB_TRANSACTION'
    ParameterMode = pmNamed
    Cursor = crDefault
    Optimize = True
    Left = 592
    Top = 432
  end
  object Commission: TOracleDataSet
    SQL.Strings = (
      'select'
      '    id'
      '   ,name'
      '   ,debt'
      
        '   ,sb_complex_transactions.getaccountnumber(debt) as DebitAccou' +
        'nt'
      
        '   ,sb_complex_transactions.GetAccountCurrency(debt) as DebitCur' +
        'rency'
      
        '   ,sb_complex_transactions.getaccountcurrencyid(debt) as DebitC' +
        'urrencyID'
      '   ,credit'
      
        '   ,sb_complex_transactions.getaccountnumber(credit) as CreditAc' +
        'count'
      
        '   ,sb_complex_transactions.GetAccountCurrency(credit) as Credit' +
        'Currency'
      
        '   ,sb_complex_transactions.getaccountcurrencyid(credit) as Cred' +
        'itCurrencyID   '
      '   ,additionalDebt'
      
        '   ,sb_complex_transactions.getaccountnumber(additionalDebt) as ' +
        'ADebitAccount'
      
        '   ,sb_complex_transactions.GetAccountCurrency(additionalDebt) a' +
        's ADebitCurrency'
      
        '   ,sb_complex_transactions.getaccountcurrencyid(additionalDebt)' +
        ' as AddDebitCurrencyID      '
      '   ,additionalCredit'
      
        '   ,sb_complex_transactions.getaccountnumber(additionalCredit) a' +
        's ACreditAccount'
      
        '   ,sb_complex_transactions.GetAccountCurrency(additionalCredit)' +
        ' as ACreditCurrency'
      
        '   ,sb_complex_transactions.getaccountcurrencyid(additionalCredi' +
        't) as AddCreditCurrencyID         '
      '   ,assignment'
      '   ,commisionassignment'
      '   ,UserID   '
      'from'
      '    commision_trans'
      'where'
      '   UserID = 0 or'
      '    UserID = (SBLogin.UserID)'
      'order by'
      '    name  ')
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
    Left = 520
    Top = 376
    object CommissionID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CommissionNAME: TStringField
      FieldName = 'NAME'
      Size = 150
    end
    object CommissionDEBT: TFloatField
      FieldName = 'DEBT'
    end
    object CommissionDEBITACCOUNT: TStringField
      FieldName = 'DEBITACCOUNT'
      Size = 4000
    end
    object CommissionDEBITCURRENCY: TStringField
      FieldName = 'DEBITCURRENCY'
      Size = 4000
    end
    object CommissionDEBITCURRENCYID: TFloatField
      FieldName = 'DEBITCURRENCYID'
    end
    object CommissionCREDIT: TFloatField
      FieldName = 'CREDIT'
    end
    object CommissionCREDITACCOUNT: TStringField
      FieldName = 'CREDITACCOUNT'
      Size = 4000
    end
    object CommissionCREDITCURRENCY: TStringField
      FieldName = 'CREDITCURRENCY'
      Size = 4000
    end
    object CommissionCREDITCURRENCYID: TFloatField
      FieldName = 'CREDITCURRENCYID'
    end
    object CommissionADDITIONALDEBT: TFloatField
      FieldName = 'ADDITIONALDEBT'
    end
    object CommissionADEBITACCOUNT: TStringField
      FieldName = 'ADEBITACCOUNT'
      Size = 4000
    end
    object CommissionADEBITCURRENCY: TStringField
      FieldName = 'ADEBITCURRENCY'
      Size = 4000
    end
    object CommissionADDDEBITCURRENCYID: TFloatField
      FieldName = 'ADDDEBITCURRENCYID'
    end
    object CommissionADDITIONALCREDIT: TFloatField
      FieldName = 'ADDITIONALCREDIT'
    end
    object CommissionACREDITACCOUNT: TStringField
      FieldName = 'ACREDITACCOUNT'
      Size = 4000
    end
    object CommissionACREDITCURRENCY: TStringField
      FieldName = 'ACREDITCURRENCY'
      Size = 4000
    end
    object CommissionADDCREDITCURRENCYID: TFloatField
      FieldName = 'ADDCREDITCURRENCYID'
    end
    object CommissionASSIGNMENT: TStringField
      FieldName = 'ASSIGNMENT'
      Size = 300
    end
    object CommissionCOMMISIONASSIGNMENT: TStringField
      FieldName = 'COMMISIONASSIGNMENT'
      Size = 300
    end
    object CommissionUSERID: TFloatField
      FieldName = 'USERID'
    end
  end
  object CommissionData: TDataSource
    DataSet = Commission
    Left = 520
    Top = 424
  end
  object SBComplexTrans: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SB_COMPLEX_TRANSACTIONS'
    ParameterMode = pmNamed
    Cursor = crDefault
    Optimize = True
    Left = 592
    Top = 376
  end
  object Destinations: TOracleDataSet
    SQL.Strings = (
      'select d.*, d.rowid from TRDESTINATION d'
      'order by name')
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
    Top = 192
  end
  object DestinationsData: TDataSource
    DataSet = Destinations
    Left = 32
    Top = 248
  end
  object DebitAccRestData: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  ACC_ID'
      ' ,Ostat'
      ' ,Pok_ostat'
      'from'
      '  Tenostat'
      'where'
      '  acc_id =:acc_id'
      ' '
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000070000003A4143435F494403000000040000000589000000
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
    Master = DebitAccData
    MasterFields = 'ID'
    DetailFields = 'ACC_ID'
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
    Left = 64
    Top = 424
  end
  object CreditAccRestData: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  ACC_ID'
      ' ,Ostat'
      ' ,Pok_ostat'
      'from'
      '  Tenostat'
      'where'
      '  acc_id =:acc_id'
      ' '
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000070000003A4143435F4944030000000000000000000000}
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
    Master = CreditAccData
    MasterFields = 'ID'
    DetailFields = 'ACC_ID'
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
    Left = 170
    Top = 425
  end
end
