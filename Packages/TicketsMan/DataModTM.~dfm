object DataModuleTicketMan: TDataModuleTicketMan
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 229
  Top = 207
  Height = 480
  Width = 696
  object ODSTickets: TOracleDataSet
    SQL.Strings = (
      'select a.*,u.name tuser from sba_tm_archive a, user$ u'
      'where '
      '(u.id=a.userid)'
      
        'and (status in (select nvl(max (s.id),1) statusid from smart.tm_' +
        'status s, sba_advanced_grants g, sba_usergrants_advanced a'
      
        '                    where s.privname = g.grantname and g.id = a.' +
        'advancedgrantid and username = user))'
      ''
      'order by 1')
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
    Left = 16
    Top = 32
    object ODSTicketsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSTicketsPDATE: TDateTimeField
      FieldName = 'PDATE'
    end
    object ODSTicketsPNUM: TFloatField
      FieldName = 'PNUM'
    end
    object ODSTicketsDBANKFILIAL: TFloatField
      FieldName = 'DBANKFILIAL'
    end
    object ODSTicketsDBANKCODE: TStringField
      FieldName = 'DBANKCODE'
      Size = 40
    end
    object ODSTicketsDBANKNAME: TStringField
      FieldName = 'DBANKNAME'
      Size = 80
    end
    object ODSTicketsDBANKINN: TStringField
      FieldName = 'DBANKINN'
      Size = 15
    end
    object ODSTicketsDBANKSWIFT: TStringField
      FieldName = 'DBANKSWIFT'
    end
    object ODSTicketsDBANKKACC: TStringField
      FieldName = 'DBANKKACC'
      Size = 40
    end
    object ODSTicketsDACC_NO: TStringField
      FieldName = 'DACC_NO'
      Size = 50
    end
    object ODSTicketsDACCNAME: TStringField
      FieldName = 'DACCNAME'
      Size = 300
    end
    object ODSTicketsDACCINN: TStringField
      FieldName = 'DACCINN'
      Size = 15
    end
    object ODSTicketsKBANKFILIAL: TFloatField
      FieldName = 'KBANKFILIAL'
    end
    object ODSTicketsKBANKCODE: TStringField
      FieldName = 'KBANKCODE'
      Size = 40
    end
    object ODSTicketsKBANKNAME: TStringField
      FieldName = 'KBANKNAME'
      Size = 255
    end
    object ODSTicketsKBANKINN: TStringField
      FieldName = 'KBANKINN'
      Size = 32
    end
    object ODSTicketsKBANKSWIFT: TStringField
      FieldName = 'KBANKSWIFT'
      Size = 128
    end
    object ODSTicketsKBANKKACC: TStringField
      FieldName = 'KBANKKACC'
      Size = 40
    end
    object ODSTicketsKBANKSUBKACC: TStringField
      FieldName = 'KBANKSUBKACC'
      Size = 17
    end
    object ODSTicketsKACC_NO: TStringField
      FieldName = 'KACC_NO'
      Size = 50
    end
    object ODSTicketsKACCNAME: TStringField
      FieldName = 'KACCNAME'
      Size = 300
    end
    object ODSTicketsKACCINN: TStringField
      FieldName = 'KACCINN'
      Size = 15
    end
    object ODSTicketsAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSTicketsDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 500
    end
    object ODSTicketsINFORMATION: TStringField
      FieldName = 'INFORMATION'
      Size = 500
    end
    object ODSTicketsUSERID: TFloatField
      FieldName = 'USERID'
    end
    object ODSTicketsSTATUS: TFloatField
      FieldName = 'STATUS'
      Required = True
    end
    object ODSTicketsTUSER: TStringField
      FieldName = 'TUSER'
      Required = True
      Size = 30
    end
  end
  object Tickets: TDataSource
    DataSet = ODSTickets
    Left = 16
    Top = 80
  end
  object ODSArchive: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      
        'select a.status, a.id, a.pdate, a.pnum, a.dbankfilial, a.dbankco' +
        'de, a.dbankname,'
      
        '       a.dbankinn, a.dbankswift, a.dbankkacc, a.dacc_no, a.daccn' +
        'ame,'
      
        '       a.daccinn, a.kbankfilial, a.kbankcode, a.kbankname, a.kba' +
        'nkinn,'
      
        '       a.kbankswift, a.kbankkacc, a.kbanksubkacc, a.kacc_no, a.k' +
        'accname,'
      
        '       a.kaccinn, a.ammount, a.description, a.information, a.use' +
        'rid, u.name tuser'
      '  from sba_tm_archive a, user$ u'
      ' where (u.id=a.userid) order by a.id')
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
    Left = 99
    Top = 32
    object ODSArchiveSTATUS: TFloatField
      FieldName = 'STATUS'
    end
    object ODSArchiveID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSArchivePDATE: TDateTimeField
      FieldName = 'PDATE'
    end
    object ODSArchivePNUM: TFloatField
      FieldName = 'PNUM'
    end
    object ODSArchiveDBANKFILIAL: TFloatField
      FieldName = 'DBANKFILIAL'
    end
    object ODSArchiveDBANKCODE: TStringField
      FieldName = 'DBANKCODE'
      Size = 40
    end
    object ODSArchiveDBANKNAME: TStringField
      FieldName = 'DBANKNAME'
      Size = 80
    end
    object ODSArchiveDBANKINN: TStringField
      FieldName = 'DBANKINN'
      Size = 15
    end
    object ODSArchiveDBANKSWIFT: TStringField
      FieldName = 'DBANKSWIFT'
    end
    object ODSArchiveDBANKKACC: TStringField
      FieldName = 'DBANKKACC'
      Size = 40
    end
    object ODSArchiveDACC_NO: TStringField
      FieldName = 'DACC_NO'
      Size = 50
    end
    object ODSArchiveDACCNAME: TStringField
      FieldName = 'DACCNAME'
      Size = 300
    end
    object ODSArchiveDACCINN: TStringField
      FieldName = 'DACCINN'
      Size = 15
    end
    object ODSArchiveKBANKFILIAL: TFloatField
      FieldName = 'KBANKFILIAL'
    end
    object ODSArchiveKBANKCODE: TStringField
      FieldName = 'KBANKCODE'
      Size = 40
    end
    object ODSArchiveKBANKNAME: TStringField
      FieldName = 'KBANKNAME'
      Size = 255
    end
    object ODSArchiveKBANKINN: TStringField
      FieldName = 'KBANKINN'
      Size = 32
    end
    object ODSArchiveKBANKSWIFT: TStringField
      FieldName = 'KBANKSWIFT'
      Size = 128
    end
    object ODSArchiveKBANKKACC: TStringField
      FieldName = 'KBANKKACC'
      Size = 40
    end
    object ODSArchiveKBANKSUBKACC: TStringField
      FieldName = 'KBANKSUBKACC'
      Size = 17
    end
    object ODSArchiveKACC_NO: TStringField
      FieldName = 'KACC_NO'
      Size = 50
    end
    object ODSArchiveKACCNAME: TStringField
      FieldName = 'KACCNAME'
      Size = 300
    end
    object ODSArchiveKACCINN: TStringField
      FieldName = 'KACCINN'
      Size = 15
    end
    object ODSArchiveAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSArchiveDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 500
    end
    object ODSArchiveINFORMATION: TStringField
      FieldName = 'INFORMATION'
      Size = 500
    end
    object ODSArchiveTUSER: TStringField
      FieldName = 'TUSER'
      Required = True
      Size = 30
    end
  end
  object Archive: TDataSource
    DataSet = ODSArchive
    Left = 98
    Top = 80
  end
  object TM_MANAGE: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'TM_MANAGE'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 440
    Top = 24
  end
  object ODSAccount: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      '  select a.id, a.name, a.acc_no, c.inn'
      '    from account a, customers c'
      '   where a.kli_id = c.id'
      '     and a.close_dat is null'
      '     and c.close_dat is null'
      'order by acc_no')
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
    Left = 176
    Top = 32
    object ODSAccountID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSAccountNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object ODSAccountACC_NO: TStringField
      FieldName = 'ACC_NO'
      Required = True
    end
    object ODSAccountINN: TStringField
      FieldName = 'INN'
      Size = 10
    end
  end
  object Account: TDataSource
    DataSet = ODSAccount
    Left = 176
    Top = 80
  end
  object ODSBankM: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      
        'select id, bankcode||'#39'-'#39'||NVL (name, id || '#39' є-li Bank'#39') bname,i' +
        'nn, swift, bankcode, krno, subkrno from bankm order by name')
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
    Top = 32
    object ODSBankMID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSBankMBNAME: TStringField
      FieldName = 'BNAME'
      Size = 288
    end
    object ODSBankMINN: TStringField
      FieldName = 'INN'
      Size = 32
    end
    object ODSBankMSWIFT: TStringField
      FieldName = 'SWIFT'
      Size = 128
    end
    object ODSBankMBANKCODE: TStringField
      FieldName = 'BANKCODE'
      Size = 32
    end
    object ODSBankMKRNO: TFloatField
      FieldName = 'KRNO'
    end
    object ODSBankMSUBKRNO: TStringField
      FieldName = 'SUBKRNO'
      Size = 17
    end
  end
  object BankM: TDataSource
    DataSet = ODSBankM
    Left = 264
    Top = 80
  end
  object ODSAllTickets: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select a.rowid, a.* from tm_archive a'
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
    Left = 160
    Top = 176
    object ODSAllTicketsID: TFloatField
      FieldName = 'ID'
    end
    object ODSAllTicketsPDATE: TDateTimeField
      FieldName = 'PDATE'
    end
    object ODSAllTicketsPNUM: TFloatField
      FieldName = 'PNUM'
    end
    object ODSAllTicketsDBANKFILIAL: TFloatField
      FieldName = 'DBANKFILIAL'
    end
    object ODSAllTicketsDACC_NO: TStringField
      FieldName = 'DACC_NO'
      Size = 50
    end
    object ODSAllTicketsDACCNAME: TStringField
      FieldName = 'DACCNAME'
      Size = 300
    end
    object ODSAllTicketsDACCINN: TStringField
      FieldName = 'DACCINN'
      Size = 15
    end
    object ODSAllTicketsKBANKFILIAL: TFloatField
      FieldName = 'KBANKFILIAL'
      Required = True
    end
    object ODSAllTicketsKACC_NO: TStringField
      FieldName = 'KACC_NO'
      Size = 50
    end
    object ODSAllTicketsKACCNAME: TStringField
      FieldName = 'KACCNAME'
      Size = 300
    end
    object ODSAllTicketsKACCINN: TStringField
      FieldName = 'KACCINN'
      Size = 15
    end
    object ODSAllTicketsAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSAllTicketsDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 500
    end
    object ODSAllTicketsINFORMATION: TStringField
      FieldName = 'INFORMATION'
      Size = 500
    end
    object ODSAllTicketsUSERID: TFloatField
      FieldName = 'USERID'
    end
    object ODSAllTicketsSTATUS: TFloatField
      FieldName = 'STATUS'
    end
  end
  object AllTickets: TDataSource
    DataSet = ODSAllTickets
    Left = 160
    Top = 232
  end
  object ODSforPrint: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      
        'select a.status, a.id, a.pdate, a.pnum, a.dbankfilial, a.dbankco' +
        'de, a.dbankname,'
      
        '       a.dbankinn, a.dbankswift, a.dbankkacc, a.dacc_no, a.daccn' +
        'ame,'
      
        '       a.daccinn, a.kbankfilial, a.kbankcode, a.kbankname, a.kba' +
        'nkinn,'
      
        '       a.kbankswift, a.kbankkacc, a.kbanksubkacc, a.kacc_no, a.k' +
        'accname,'
      
        '       a.kaccinn, a.ammount, a.description, a.information, a.use' +
        'rid, u.name tuser'
      '  from sba_tm_archive a, user$ u'
      ' where (u.id=a.userid)'
      '   and a.id = :id '
      '')
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
    Left = 312
    Top = 184
    object ODSforPrintSTATUS: TFloatField
      FieldName = 'STATUS'
      Required = True
    end
    object ODSforPrintID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSforPrintPDATE: TDateTimeField
      FieldName = 'PDATE'
    end
    object ODSforPrintPNUM: TFloatField
      FieldName = 'PNUM'
    end
    object ODSforPrintDBANKFILIAL: TFloatField
      FieldName = 'DBANKFILIAL'
    end
    object ODSforPrintDBANKCODE: TStringField
      FieldName = 'DBANKCODE'
      Size = 40
    end
    object ODSforPrintDBANKNAME: TStringField
      FieldName = 'DBANKNAME'
      Size = 80
    end
    object ODSforPrintDBANKINN: TStringField
      FieldName = 'DBANKINN'
      Size = 15
    end
    object ODSforPrintDBANKSWIFT: TStringField
      FieldName = 'DBANKSWIFT'
    end
    object ODSforPrintDBANKKACC: TStringField
      FieldName = 'DBANKKACC'
      Size = 40
    end
    object ODSforPrintDACC_NO: TStringField
      FieldName = 'DACC_NO'
      Size = 50
    end
    object ODSforPrintDACCNAME: TStringField
      FieldName = 'DACCNAME'
      Size = 300
    end
    object ODSforPrintDACCINN: TStringField
      FieldName = 'DACCINN'
      Size = 15
    end
    object ODSforPrintKBANKFILIAL: TFloatField
      FieldName = 'KBANKFILIAL'
    end
    object ODSforPrintKBANKCODE: TStringField
      FieldName = 'KBANKCODE'
      Size = 40
    end
    object ODSforPrintKBANKNAME: TStringField
      FieldName = 'KBANKNAME'
      Size = 255
    end
    object ODSforPrintKBANKINN: TStringField
      FieldName = 'KBANKINN'
      Size = 32
    end
    object ODSforPrintKBANKSWIFT: TStringField
      FieldName = 'KBANKSWIFT'
      Size = 128
    end
    object ODSforPrintKBANKKACC: TStringField
      FieldName = 'KBANKKACC'
      Size = 40
    end
    object ODSforPrintKBANKSUBKACC: TStringField
      FieldName = 'KBANKSUBKACC'
      Size = 17
    end
    object ODSforPrintKACC_NO: TStringField
      FieldName = 'KACC_NO'
      Size = 50
    end
    object ODSforPrintKACCNAME: TStringField
      FieldName = 'KACCNAME'
      Size = 300
    end
    object ODSforPrintKACCINN: TStringField
      FieldName = 'KACCINN'
      Size = 15
    end
    object ODSforPrintAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSforPrintDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 500
    end
    object ODSforPrintINFORMATION: TStringField
      FieldName = 'INFORMATION'
      Size = 500
    end
    object ODSforPrintUSERID: TFloatField
      FieldName = 'USERID'
    end
    object ODSforPrintTUSER: TStringField
      FieldName = 'TUSER'
      Required = True
      Size = 30
    end
  end
  object ODSSettings: TOracleDataSet
    SQL.Strings = (
      
        'SELECT rowid, id, reportname, lblabel, lbtitle, lbdescr, lbbnumb' +
        ',formatdat'
      '  FROM tm_report_settings')
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
    Left = 400
    Top = 184
    object ODSSettingsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSSettingsREPORTNAME: TStringField
      FieldName = 'REPORTNAME'
      Size = 100
    end
    object ODSSettingsLBLABEL: TStringField
      FieldName = 'LBLABEL'
      Size = 2
    end
    object ODSSettingsLBTITLE: TStringField
      FieldName = 'LBTITLE'
      Size = 50
    end
    object ODSSettingsLBDESCR: TStringField
      FieldName = 'LBDESCR'
      Size = 255
    end
    object ODSSettingsLBBNUMB: TStringField
      FieldName = 'LBBNUMB'
    end
    object ODSSettingsFORMATDAT: TStringField
      FieldName = 'FORMATDAT'
    end
  end
  object Settings: TDataSource
    DataSet = ODSSettings
    Left = 400
    Top = 248
  end
  object ODSStatuses: TOracleDataSet
    SQL.Strings = (
      'select * from (select * from tm_status'
      
        'where (id  <= (select nvl(max (s.id),6) statusid from smart.tm_s' +
        'tatus s, sba_advanced_grants g, sba_usergrants_advanced a'
      
        '                    where s.privname = g.grantname and g.id = a.' +
        'advancedgrantid and username = user))'
      'union all '
      'select -1,'#39'-'#39','#39'ўамысы'#39' from dual)'
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
    Left = 72
    Top = 176
    object ODSStatusesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSStatusesPRIVNAME: TStringField
      FieldName = 'PRIVNAME'
      Size = 30
    end
    object ODSStatusesPRIVDESC: TStringField
      FieldName = 'PRIVDESC'
      Size = 30
    end
  end
  object Statuses: TDataSource
    DataSet = ODSStatuses
    Left = 72
    Top = 232
  end
  object ODSPaymentDecree: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      
        'select a.id, a.pdate, a.pnum, a.dbankfilial, a.dbankcode, a.dban' +
        'kname,'
      
        '       a.dbankinn, a.dbankswift, a.dbankkacc, a.dacc_no, a.daccn' +
        'ame,'
      
        '       a.daccinn, a.kbankfilial, a.kbankcode, a.kbankname, a.kba' +
        'nkinn,'
      
        '       a.kbankswift, a.kbankkacc, a.kbanksubkacc, a.kacc_no, a.k' +
        'accname,'
      
        '       a.kaccinn, a.ammount, a.description, a.information, a.use' +
        'rid, a.status'
      '  from sba_tm_archive a'
      ' where a.id=:id')
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
    Left = 264
    Top = 280
  end
end
