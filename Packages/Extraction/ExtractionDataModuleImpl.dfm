object ExtractionDataModule: TExtractionDataModule
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 480
  Width = 696
  object Currency: TOracleDataSet
    SQL.Strings = (
      'select '
      '  valute, '
      '  valu_name '
      'from '
      '   avalute'
      'Union'
      'select'
      '  -1 as valute,'
      '  '#39'ֱצעצם גאכיףעאכאנ'#39' as valu_name'
      'from'
      '   dual'
      'order by'
      '   valute'
      '     '
      '     '
      ''
      '  '
      '     ')
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
    Left = 56
    Top = 200
  end
  object Branch: TOracleDataSet
    SQL.Strings = (
      'select '
      '  id, '
      '  name  '
      'from '
      '  filial'
      'Union'
      'select '
      '  -1 as id,'
      '  '#39'ֱצעצם פטכטאככאנ'#39' as name '
      'from'
      '  dual'
      'order by'
      '  id'
      '     '
      '  '
      '  ')
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
    Left = 152
    Top = 200
  end
  object DataCurrency: TDataSource
    DataSet = Currency
    Left = 56
    Top = 264
  end
  object DataBranch: TDataSource
    DataSet = Branch
    Left = 152
    Top = 272
  end
  object Customers: TOracleDataSet
    SQL.Strings = (
      'select'
      '  id,'
      '  name'
      'from'
      '  customers'
      'order by'
      '  id')
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
    AfterScroll = CustomersAfterScroll
    Left = 312
    Top = 192
  end
  object DataCustomers: TDataSource
    DataSet = Customers
    Left = 384
    Top = 192
  end
  object Accounts: TOracleDataSet
    SQL.Strings = (
      'select'
      '   acc.ID as AccountID'
      ' , acc.acc_no as AccountNumber'
      ' , acc.name   as AccountName'
      ' , acc.val_acc as AccountCurrency'
      ' , acc.open_dat as OpenDate'
      ' , acc.bal_cn1 as Balance '
      ' , acc.filial as Branch'
      ' , cust.inn as CustomerInn'
      ' , FirstRemainder.BeginRemainder'
      ' , FirstRemainder.BeginLRemainder'
      ' , LastRemainder.LastRemainder'
      ' , LastRemainder.LastLRemainder'
      ' --, FirstRemainder.LastOpDate'
      'from'
      '   account acc'
      ' , customers cust'
      ' , ('
      '    select'
      '       ar.acc_id as AccID'
      '     , ar.ostat as BeginRemainder  '
      '     , ar.pok_ostat as BeginLRemainder  '
      '   --  , GETLASTOPDATE(ar.acc_id, ar.datdate) as LastOpDate'
      '    from'
      '       archost ar'
      '     , account acc'
      '    where '
      '       ar.acc_id = acc.id '
      '       and ar.datdate =:BeginDate'
      '    ) FirstRemainder'
      ' , ('
      '    select'
      '       ar.acc_id as AccID'
      '     , ar.ostat as LastRemainder'
      '     , ar.pok_ostat as LastLRemainder'
      '    from'
      '       archost ar'
      '     , account acc'
      '    where'
      '       ar.acc_id = acc.id'
      '       and ar.datdate =:EndDate'
      '    ) LastRemainder'
      ''
      'where'
      '   acc.kli_id = cust.id'
      '   and FirstRemainder.AccID = acc.ID'
      '   and LastRemainder.AccID = acc.ID'
      'order by'
      '   acc.acc_no'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000020000000A0000003A424547494E444154450C000000000000000000
      0000080000003A454E44444154450C0000000000000000000000}
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
    Top = 24
    object AccountsACCOUNTID: TFloatField
      FieldName = 'ACCOUNTID'
      Required = True
    end
    object AccountsACCOUNTNUMBER: TStringField
      FieldName = 'ACCOUNTNUMBER'
    end
    object AccountsACCOUNTNAME: TStringField
      FieldName = 'ACCOUNTNAME'
      Size = 90
    end
    object AccountsACCOUNTCURRENCY: TIntegerField
      FieldName = 'ACCOUNTCURRENCY'
    end
    object AccountsOPENDATE: TDateTimeField
      FieldName = 'OPENDATE'
    end
    object AccountsBALANCE: TFloatField
      FieldName = 'BALANCE'
    end
    object AccountsBRANCH: TIntegerField
      FieldName = 'BRANCH'
    end
    object AccountsCUSTOMERINN: TFloatField
      FieldName = 'CUSTOMERINN'
    end
    object AccountsBEGINREMAINDER: TFloatField
      FieldName = 'BEGINREMAINDER'
    end
    object AccountsBEGINLREMAINDER: TFloatField
      FieldName = 'BEGINLREMAINDER'
    end
    object AccountsLASTREMAINDER: TFloatField
      FieldName = 'LASTREMAINDER'
    end
    object AccountsLASTLREMAINDER: TFloatField
      FieldName = 'LASTLREMAINDER'
    end
  end
  object Transactions: TOracleDataSet
    SQL.Strings = (
      'select'
      '   pr.kredit as Owneraccid'
      ' , pr.dat'
      ' , pr.val_acc as ContrCurrency'
      ' , pr.currencyid_c as OwnCurrency'
      ' , acc.acc_no as ContrAccount'
      
        ' , Decode(pr.val_acc, 0, pr.ammount_c, pr.ammount) as DebtAmmoun' +
        't'
      ' , pr.lammount as DebtLAmmount'
      ' , 0 as CreditAmmount'
      ' , 0 as CreditLAmmount'
      ' , pr.name'
      'from'
      '   provarch pr'
      ' , account acc'
      'where'
      '   pr.debt = acc.id'
      '   and pr.kredit =:OwnerAccID'
      '   and pr.dat between :BeginDate and :EndDate'
      ''
      'UNION ALL'
      ''
      'select'
      '   pr.debt as Owneraccid'
      ' , pr.dat'
      ' , pr.currencyid_c as ContrCurrency'
      ' , pr.val_acc as OwnCurrency'
      ' , acc.acc_no as ContrAccount'
      ' , 0 as DebtAmmount'
      ' , 0 as DebtLAmmount'
      
        ' , Decode(pr.currencyid_c, 0, pr.ammount, pr.ammount_c) as Credi' +
        'tAmmount'
      ' , pr.lammount as CreditLAmmount'
      ' , pr.name'
      'from'
      '   provarch pr'
      ' , account acc'
      'where'
      '   pr.kredit = acc.id'
      '   and pr.debt =:OwnerAccID'
      '   and pr.dat between :BeginDate and :EndDate'
      ''
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
      03000000030000000B0000003A4F574E45524143434944030000000000000000
      0000000A0000003A424547494E444154450C0000000000000000000000080000
      003A454E44444154450C0000000000000000000000}
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
    Master = Accounts
    MasterFields = 'AccountID'
    DetailFields = 'OwnerAccID'
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
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = Accounts
    Left = 24
    Top = 72
  end
  object DataSource2: TDataSource
    DataSet = Transactions
    Left = 128
    Top = 80
  end
end
