object RIDataMod: TRIDataMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 329
  Top = 236
  Height = 640
  Width = 870
  object ODSBanks: TOracleDataSet
    SQL.Strings = (
      'select * from cm_usergroups')
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 40
    Top = 32
  end
  object Banks: TDataSource
    DataSet = ODSBanks
    Left = 40
    Top = 96
  end
  object ODSCredits: TOracleDataSet
    SQL.Strings = (
      
        'select c.id, b.name, c.usrgroup from cm_active_credits c, cm_boo' +
        'rowerinfo b'
      'where b.creditid=c.id and c.usrgroup=:usrgroup'
      'order by c.id')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000090000003A55535247524F55500300000000000000000000
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
    Master = ODSBanks
    MasterFields = 'id'
    DetailFields = 'usrgroup'
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
    Left = 130
    Top = 32
  end
  object Credits: TDataSource
    DataSet = ODSCredits
    Left = 128
    Top = 96
  end
  object ODSRep: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT r.*  FROM cm_ip_reestrinfo r'
      ''
      'order by boorower'
      ''
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 224
    Top = 65
  end
  object ODSNextVal: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      
        'SELECT lastreestrnum,u.bank_kod kod_bank, contrdate FROM cm_bank' +
        'settings b, cm_usergroups u'
      'where u.id=b.bankid and bankid=:bankid'
      ''
      ''
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000070000003A42414E4B4944030000000000000000000000}
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
    Left = 192
    Top = 232
  end
  object ODSUpdNextVal: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'update cm_banksettings set lastreestrnum=lastreestrnum+1'
      'where bankid=:bankid'
      ''
      ''
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000070000003A42414E4B4944030000000000000000000000}
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
    Left = 192
    Top = 280
  end
end
