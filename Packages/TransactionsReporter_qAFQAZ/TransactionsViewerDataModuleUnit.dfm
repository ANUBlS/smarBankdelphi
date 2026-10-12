object TransDataModule: TTransDataModule
  OldCreateOrder = False
  Left = 129
  Top = 118
  Height = 558
  Width = 773
  object BankInfo: TOracleDataSet
    SQL.Strings = (
      'select '
      'Az_Name ,Logo ,Inn ,Sedr,buhaltr'
      'from bankinfo')
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
    Left = 16
    Top = 16
    object BankInfoAZ_NAME: TStringField
      FieldName = 'AZ_NAME'
      Size = 80
    end
    object BankInfoINN: TStringField
      FieldName = 'INN'
      Size = 15
    end
    object BankInfoSEDR: TStringField
      FieldName = 'SEDR'
    end
    object BankInfoBUHALTR: TStringField
      FieldName = 'BUHALTR'
    end
    object BankInfoLOGO: TBlobField
      FieldName = 'LOGO'
      BlobType = ftBlob
    end
  end
  object Transactions: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      ' a1.bal_cn1 dbal_cn'
      ',a2.bal_cn1 kbal_cn'
      ',pr.dat'
      ',pr.NAME, SB_EXPERTANALYSE.GetUserName(pr.op_id) as UserName'
      
        ',sb_memorial.getcurrencyshortname(pr.val_acc) val_acc, pr.val_ac' +
        'c as DCurrency'
      
        ',sb_memorial.getcurrencyshortname(pr.currencyid_c) currencyid_c,' +
        ' pr.currencyid_c as KCurrency'
      ',pr.ammount'
      ',pr.ammount_c'
      ',pr.lammount'
      
        ',pr.op_id as Operator, sb_expertanalyse.getoperationtype(pr.vid_' +
        'op, pr.val_acc, pr.currencyID_c) as OperationType'
      ',a1.acc_no debitor, a1.filial as DebetFilial'
      ',a1.NAME dname'
      ',a2.acc_no kreditor, a2.filial as CreditFilial'
      ',a2.NAME kname'
      ',pr.debt'
      ',pr.kredit'
      'FROM  provarch pr'
      '     ,ACCOUNT a1'
      '     ,ACCOUNT a2'
      '    WHERE'
      '       (a1.ID=pr.debt)AND(a2.ID=pr.kredit)'
      '    AND(pr.Dat between :d1 and :d2)'
      '/*23*/    AND(a1.bal_cn1 IN ('
      '/*24*/ 1001 ))'
      ''
      '/*26*/      AND(a2.bal_cn1 IN ('
      '/*27*/ 1001 ))'
      '    '
      'ORDER BY :Title'
      '   --pr.Dat--,debitor,kreditor'
      ''
      ''
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
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
      0300000003000000030000003A44310C0000000000000000000000030000003A
      44320C0000000000000000000000060000003A5449544C450100000007000000
      50722E6461740000000000}
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
    Left = 104
    Top = 104
    object TransactionsDAT: TDateTimeField
      DisplayLabel = 'ТАРИХ'
      FieldName = 'DAT'
    end
    object TransactionsDBAL_CN: TFloatField
      DisplayLabel = 'Д/Бал Щес'
      FieldName = 'DBAL_CN'
    end
    object TransactionsDEBITOR: TStringField
      DisplayLabel = 'Дебит Щесаб №'
      FieldName = 'DEBITOR'
    end
    object TransactionsVAL_ACC: TStringField
      DisplayLabel = 'Дебт $'
      FieldName = 'VAL_ACC'
      Size = 4000
    end
    object TransactionsDNAME: TStringField
      DisplayLabel = 'Д.Щесабынын ады'
      FieldName = 'DNAME'
      Size = 90
    end
    object TransactionsKBAL_CN: TFloatField
      DisplayLabel = 'К/Бал Щес'
      FieldName = 'KBAL_CN'
    end
    object TransactionsKREDITOR: TStringField
      DisplayLabel = 'Кредит Щесаб №'
      FieldName = 'KREDITOR'
    end
    object TransactionsCURRENCYID_C: TStringField
      DisplayLabel = 'Кред $'
      FieldName = 'CURRENCYID_C'
      Size = 4000
    end
    object TransactionsKNAME: TStringField
      DisplayLabel = 'К.Щесабынын ады'
      FieldName = 'KNAME'
      Size = 90
    end
    object TransactionsAMMOUNT: TFloatField
      DisplayLabel = 'Д . Мябляь'
      FieldName = 'AMMOUNT'
      currency = True
    end
    object TransactionsAMMOUNT_C: TFloatField
      DisplayLabel = 'К . Мябляь'
      FieldName = 'AMMOUNT_C'
      currency = True
    end
    object TransactionsLAMMOUNT: TFloatField
      DisplayLabel = 'Мябляь (манатла)'
      FieldName = 'LAMMOUNT'
      currency = True
    end
    object TransactionsNAME: TStringField
      DisplayLabel = 'Тяйинаты'
      FieldName = 'NAME'
      Size = 255
    end
    object TransactionsDCURRENCY: TFloatField
      DisplayLabel = 'Дебет Валйута Коду'
      FieldName = 'DCURRENCY'
    end
    object TransactionsKCURRENCY: TIntegerField
      DisplayLabel = 'Кредит Валйута Коду'
      FieldName = 'KCURRENCY'
    end
    object TransactionsOPERATOR: TFloatField
      DisplayLabel = 'Оператор Коду'
      FieldName = 'OPERATOR'
    end
    object TransactionsDEBETFILIAL: TIntegerField
      DisplayLabel = 'Дебет Филиал Коду'
      FieldName = 'DEBETFILIAL'
    end
    object TransactionsCREDITFILIAL: TIntegerField
      DisplayLabel = 'Кредит Филиал Коду'
      FieldName = 'CREDITFILIAL'
    end
    object TransactionsOPERATIONTYPE: TFloatField
      DisplayLabel = 'Ямялиййат Типи'
      FieldName = 'OPERATIONTYPE'
    end
    object TransactionsDEBT: TFloatField
      FieldName = 'DEBT'
    end
    object TransactionsKREDIT: TFloatField
      FieldName = 'KREDIT'
    end
    object TransactionsUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 4000
    end
  end
  object DataSrcTransactions: TDataSource
    DataSet = Transactions
    Left = 40
    Top = 104
  end
  object SYSDAT: TOracleDataSet
    SQL.Strings = (
      'select'
      '  TEK_DAT'
      'from'
      '  SYSDAT')
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
    Left = 80
    Top = 16
  end
  object Curr: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name from avalute')
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
    Left = 354
    Top = 8
  end
  object DataCurrency: TDataSource
    DataSet = Curr
    Left = 404
    Top = 8
  end
  object DFilial: TOracleDataSet
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
    Active = True
    Left = 357
    Top = 64
  end
  object DataDFilials: TDataSource
    DataSet = DFilial
    Left = 405
    Top = 64
  end
  object Users: TOracleDataSet
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
    Active = True
    Left = 360
    Top = 180
  end
  object DataUsers: TDataSource
    DataSet = Users
    Left = 408
    Top = 180
  end
  object OpType: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '   id, name'
      'FROM '
      '   vid_op'
      'Order by'
      '   ID')
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
    Left = 360
    Top = 244
  end
  object DataOpertaionTypes: TDataSource
    DataSet = OpType
    Left = 408
    Top = 244
  end
  object OperationTypes: TOracleQuery
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
    OnThreadRecord = OperationTypesThreadRecord
    OnThreadFinished = OperationTypesThreadFinished
    Left = 360
    Top = 292
  end
  object Currency: TOracleQuery
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
    OnThreadRecord = CurrencyThreadRecord
    OnThreadFinished = OperationTypesThreadFinished
    Left = 416
    Top = 292
  end
  object CFilial: TOracleDataSet
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
    Active = True
    Left = 360
    Top = 120
  end
  object DataCFilial: TDataSource
    DataSet = CFilial
    Left = 408
    Top = 120
  end
  object SumTrans: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      ' a1.bal_cn1 dbal_cn'
      ',a2.bal_cn1 kbal_cn'
      ',pr.dat'
      ',pr.NAME, SB_EXPERTANALYSE.GetUserName(pr.op_id) as UserName'
      
        ',sb_memorial.getcurrencyshortname(pr.val_acc) val_acc, pr.val_ac' +
        'c as DCurrency'
      
        ',sb_memorial.getcurrencyshortname(pr.currencyid_c) currencyid_c,' +
        ' pr.currencyid_c as KCurrency'
      ',pr.ammount'
      ',pr.ammount_c'
      ',pr.lammount'
      
        ',pr.op_id as Operator, sb_expertanalyse.getoperationtype(pr.vid_' +
        'op, pr.val_acc, pr.currencyID_c) as OperationType'
      ',a1.acc_no debitor, a1.filial as DebetFilial'
      ',a1.NAME dname'
      ',a2.acc_no kreditor, a2.filial as CreditFilial'
      ',a2.NAME kname'
      ',pr.debt'
      ',pr.kredit'
      'FROM  provarch pr'
      '     ,ACCOUNT a1'
      '     ,ACCOUNT a2'
      '    WHERE'
      '       (a1.ID=pr.debt)AND(a2.ID=pr.kredit)'
      '    AND(pr.Dat between :d1 and :d2)'
      '/*23*/    AND(a1.bal_cn1 IN ('
      '/*24*/ 1001 ))'
      ''
      '/*26*/      AND(a2.bal_cn1 IN ('
      '/*27*/ 1001 ))'
      '    '
      'ORDER BY :Title'
      '   --pr.Dat--,debitor,kreditor'
      ''
      ''
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
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
    Left = 104
    Top = 168
  end
  object DataSumTrans: TDataSource
    DataSet = SumTrans
    Left = 112
    Top = 224
  end
end
