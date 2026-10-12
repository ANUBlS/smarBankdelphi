object CPDataMod: TCPDataMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 195
  Top = 108
  Height = 445
  Width = 603
  object OPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'sb_currencyposition'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 16
    Top = 8
  end
  object ODSCurrPosition: TOracleDataSet
    SQL.Strings = (
      
        'Select * From CurrencyPosition_Smart Order By PresentDate,Balanc' +
        'e')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000060000003A41444154450C00000000000000000000000900
      00003A43555252454E4359030000000000000000000000}
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
  object DataSrcCurrPosition: TDataSource
    DataSet = ODSCurrPosition
    Left = 232
    Top = 8
  end
  object ODSCurrency: TOracleDataSet
    SQL.Strings = (
      'Select  Valute,Valu_Name '
      ' From  AVALUTE')
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
    Left = 96
    Top = 16
  end
  object DataSrcRate: TDataSource
    DataSet = ODSCurrency
    Left = 136
    Top = 16
  end
  object ODSDate: TOracleDataSet
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
    Left = 24
    Top = 168
  end
  object DataSrcDate: TDataSource
    DataSet = ODSDate
    Left = 104
    Top = 168
  end
  object ODSSum: TOracleDataSet
    SQL.Strings = (
      'Select Sum(Active),Sum(Passive) From CurrencyPosition_Smart')
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
    Left = 296
    Top = 168
  end
  object DataSrcSum: TDataSource
    DataSet = ODSSum
    Left = 256
    Top = 168
  end
  object BankInfo: TOracleDataSet
    SQL.Strings = (
      'select av.Val_name,svm_currencyid from bankinfo bi , avalute av'
      'where av.valute = bi.SVM_CurrencyID'
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
    Left = 168
    Top = 168
  end
  object CapitalData: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      ' SUM(ACTIVE) as ACTIVE,'
      ' SUM(PASSIVE) as PASSIVE,'
      ' SUM(PASSIVE) - SUM(ACTIVE) as CAPITAL'
      'FROM '
      '('
      'SELECT '
      '       bs.bal_cn as BALANCE,'
      
        '       SUM(sb_mtoutview.active (AR.pok_ostat, BS.typeID, BS.addi' +
        'tionaltypeID)) as ACTIVE,'
      
        '       SUM(sb_mtoutview.passiv (AR.pok_ostat, BS.typeID, BS.addi' +
        'tionaltypeID)) as PASSIVE'
      'FROM '
      '  ACCOUNT ac, '
      '  archost ar, '
      '  bal_spr1 bs'
      'WHERE'
      '   AR.acc_id = AC.id and'
      '   AC.bal_cn1 = BS.bal_cn and '
      '   BS.bal_cn LIKE '#39'5%'#39'and '
      '   AR.datdate =:ADATE'
      'GROUP BY'
      '   BS.bal_cn'
      ''
      'UNION'
      ''
      'SELECT'
      '       BS.bal_cn as BALANCE,'
      
        '       SUM(sb_mtoutview.active (AR.pok_ostat, BS.typeID, BS.addi' +
        'tionaltypeID)) as ACTIVE,'
      
        '       SUM(sb_mtoutview.passiv (AR.pok_ostat, BS.typeID, BS.addi' +
        'tionaltypeID)) as PASSIVE'
      'FROM'
      '  ACCOUNT ac,'
      '  archost ar,'
      '  bal_spr1 bs'
      'WHERE'
      '   AR.acc_id = AC.id and'
      '   AC.bal_cn1 = BS.bal_cn and'
      '   BS.bal_cn LIKE '#39'2921%'#39' and'
      '   AR.datdate =:ADATE'
      'GROUP BY'
      '   BS.bal_cn'
      ''
      ' )'
      '   '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000060000003A41444154450C0000000000000000000000}
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
    Top = 240
    object CapitalDataACTIVE: TFloatField
      FieldName = 'ACTIVE'
      DisplayFormat = '#,##0.00'
    end
    object CapitalDataPASSIVE: TFloatField
      FieldName = 'PASSIVE'
      DisplayFormat = '#,##0.00'
    end
    object CapitalDataCAPITAL: TFloatField
      FieldName = 'CAPITAL'
      DisplayFormat = '#,##0.00'
    end
  end
end
