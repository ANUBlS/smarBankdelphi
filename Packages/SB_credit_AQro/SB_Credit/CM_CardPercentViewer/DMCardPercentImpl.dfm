object DMCardPercent: TDMCardPercent
  OldCreateOrder = False
  Left = 240
  Top = 167
  Height = 480
  Width = 696
  object TranchesDatSrc: TDataSource
    DataSet = Tranches
    Left = 32
    Top = 24
  end
  object Tranches: TOracleDataSet
    SQL.Strings = (
      'SELECT id, creditid, tranchedate, trancheamount'
      '  FROM cm_tranches'
      'where CreditID = :CrdID'
      'order by tranchedate')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000060000003A4352444944030000000000000000000000}
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 104
    Top = 24
    object TranchesID: TFloatField
      DisplayLabel = '№'
      FieldName = 'ID'
      Required = True
    end
    object TranchesCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
      Visible = False
    end
    object TranchesTRANCHEDATE: TDateTimeField
      DisplayLabel = 'Тарих'
      FieldName = 'TRANCHEDATE'
      Required = True
    end
    object TranchesTRANCHEAMOUNT: TFloatField
      DisplayLabel = 'Мябляь'
      FieldName = 'TRANCHEAMOUNT'
      Required = True
    end
  end
  object TranchrestDatSrc: TDataSource
    DataSet = Tranchrest
    Left = 32
    Top = 96
  end
  object Tranchrest: TOracleDataSet
    SQL.Strings = (
      ''
      'SELECT hdate, tranchid, rest, intrest'
      '  FROM cm_cardtrchrests'
      '  where tranchid = :TrID'
      '  order by hdate')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000050000003A54524944030000000000000000000000}
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 104
    Top = 96
    object TranchrestHDATE: TDateTimeField
      DisplayLabel = 'Тарих'
      FieldName = 'HDATE'
      Required = True
    end
    object TranchrestTRANCHID: TFloatField
      FieldName = 'TRANCHID'
      Required = True
      Visible = False
    end
    object TranchrestREST: TFloatField
      DisplayLabel = 'Галыг'
      FieldName = 'REST'
      Required = True
    end
    object TranchrestINTREST: TFloatField
      DisplayLabel = '%-Галыгы'
      FieldName = 'INTREST'
      Required = True
    end
  end
  object TranchcalcedPerDatSrc: TDataSource
    DataSet = TranchcalcedPer
    Left = 32
    Top = 152
  end
  object TranchcalcedPer: TOracleDataSet
    SQL.Strings = (
      ''
      'SELECT   hdate, tranchid, interest'
      '    FROM cm_cardtrchintrests'
      '   WHERE tranchid = :trid'
      'ORDER BY hdate')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000050000003A54524944030000000000000000000000}
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 112
    Top = 152
    object TranchcalcedPerHDATE: TDateTimeField
      DisplayLabel = 'Тарих'
      FieldName = 'HDATE'
      Required = True
    end
    object TranchcalcedPerTRANCHID: TFloatField
      FieldName = 'TRANCHID'
      Required = True
      Visible = False
    end
    object TranchcalcedPerINTEREST: TFloatField
      DisplayLabel = 'Щесабланмыш %-ляр'
      FieldName = 'INTEREST'
      Required = True
    end
  end
  object TranchpaymentsDatSrc: TDataSource
    DataSet = Tranchpayments
    Left = 32
    Top = 224
  end
  object Tranchpayments: TOracleDataSet
    SQL.Strings = (
      ''
      'SELECT paymentid, paymentdate, tranchid, maindebit, intdebit'
      '  FROM cm_cardpayments'
      '  where tranchid = :trID')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000050000003A54524944030000000000000000000000}
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 112
    Top = 224
    object TranchpaymentsPAYMENTID: TFloatField
      DisplayLabel = '№'
      FieldName = 'PAYMENTID'
      Required = True
    end
    object TranchpaymentsPAYMENTDATE: TDateTimeField
      DisplayLabel = 'Тарих'
      FieldName = 'PAYMENTDATE'
      Required = True
    end
    object TranchpaymentsTRANCHID: TFloatField
      FieldName = 'TRANCHID'
      Required = True
      Visible = False
    end
    object TranchpaymentsMAINDEBIT: TFloatField
      DisplayLabel = 'Ясяс борждан'
      FieldName = 'MAINDEBIT'
      Required = True
    end
    object TranchpaymentsINTDEBIT: TFloatField
      DisplayLabel = '% боржундан'
      FieldName = 'INTDEBIT'
      Required = True
    end
  end
end
