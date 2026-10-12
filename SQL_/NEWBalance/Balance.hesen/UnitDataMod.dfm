object DataModuleMain: TDataModuleMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 194
  Top = 107
  Height = 375
  Width = 544
  object ODSMain: TOracleDataSet
    SQL.Strings = (
      'begin'
      '  SB_BALANCEFILIDS.OpenCursor(:ACursor,:AStrParam1,:AStrParam2);'
      'end;')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000080000003A41435552534F52740000000000000000000000
      0B0000003A41535452504152414D31050000003705000053656C656374204669
      72737452656D61696E6465722E46446174652C466972737452656D61696E6465
      722E46697273744163746976652C466972737452656D61696E6465722E466972
      7374506173736976652C4C61737452656D61696E6465722E4C446174652C4C61
      737452656D61696E6465722E4C6173744163746976652C4C61737452656D6169
      6E6465722E4C617374506173736976652C5475726E4F7665722E445475726E4F
      7665722C5475726E4F7665722E4B5475726E4F7665722C422E42414C5F434E2C
      422E42414C4E414D452046726F6D202853656C6563742053756D2853425F4D54
      4F5554564945572E4143544956452841722E504F4B5F4F535441542C422E5459
      504549442C422E4144444954494F4E414C545950454944292920466972737441
      63746976652C53756D2853425F4D544F5554564945572E504153534956284172
      2E504F4B5F4F535441542C422E5459504549442C422E4144444954494F4E414C
      5459504549442929204669727374506173736976652C422E42414C5F434E2042
      616C616E636542696C6C2C2731362D4150522D3033272046446174652046726F
      6D20417263684F73742041722C4163636F756E742041632C2042414C5F535052
      312042205768657265202841722E4143435F49443D41632E494429416E642841
      632E42414C5F434E313D422E42414C5F434E29416E642841722E446174446174
      653D2731362D4150522D303327292047726F757020427920422E42414C5F434E
      2920466972737452656D61696E6465722C2853656C6563742053756D2853425F
      4D544F5554564945572E4143544956452841722E504F4B5F4F535441542C422E
      5459504549442C422E4144444954494F4E414C5459504549442929204C617374
      4163746976652C53756D2853425F4D544F5554564945572E5041535349562841
      722E504F4B5F4F535441542C422E5459504549442C422E4144444954494F4E41
      4C5459504549442929204C617374506173736976652C422E42414C5F434E2042
      616C616E636542696C6C2C2731372D4150522D303327204C446174652046726F
      6D20417263684F73742041722C4163636F756E742041632C2042414C5F535052
      312042205768657265202841722E4143435F49443D41632E494429416E642841
      632E42414C5F434E313D422E42414C5F434E29416E642841722E446174446174
      653D2731372D4150522D303327292047726F757020427920422E42414C5F434E
      29204C61737452656D61696E6465722C2853656C6563742053756D28504F4B5F
      4F42525F442920445475726E4F7665722C53756D28504F4B5F4F42525F4B2920
      4B5475726E4F7665722C422E42414C5F434E2042616C616E636542696C6C2046
      726F6D20417263684F73742041722C4163636F756E742041632C2042414C5F53
      5052312042205768657265202841722E4143435F49443D41632E494429416E64
      2841632E42414C5F434E313D422E42414C5F434E29416E642841722E44617444
      6174653C3D2731372D4150522D30332729416E642841722E446174446174653E
      3D2731362D4150522D303327292047726F757020427920422E42414C5F434E29
      205475726E4F7665722C2042414C5F5350523120422057686572652028466972
      737452656D61696E6465722E42616C616E636542696C6C3D4C61737452656D61
      696E6465722E42616C616E636542696C6C29416E64284C61737452656D61696E
      6465722E42616C616E636542696C6C3D5475726E4F7665722E42616C616E6365
      42696C6C29416E64284C61737452656D61696E6465722E42616C616E63654269
      6C6C3D422E42414C5F434E292000000000000B0000003A41535452504152414D
      32050000002C040000556E696F6E2053656C656374202731372D4150522D3033
      272046446174652C302046697273744163746976652C30202046697273745061
      73736976652C4C61737452656D61696E6465722E4C446174652C4C6173745265
      6D61696E6465722E4C6173744163746976652C4C61737452656D61696E646572
      2E4C617374506173736976652C5475726E4F7665722E445475726E4F7665722C
      5475726E4F7665722E4B5475726E4F7665722C42414C5F434E2C42414C4E414D
      452046726F6D202853656C6563742053756D2853425F4D544F5554564945572E
      4143544956452841722E504F4B5F4F535441542C422E5459504549442C422E41
      44444954494F4E414C5459504549442929204C6173744163746976652C53756D
      2853425F4D544F5554564945572E5041535349562841722E504F4B5F4F535441
      542C422E5459504549442C422E4144444954494F4E414C545950454944292920
      4C617374506173736976652C422E42414C5F434E2042616C616E636542696C6C
      2C2731372D4150522D303327204C446174652046726F6D20417263684F737420
      41722C4163636F756E742041632C2042414C5F53505231204220576865726520
      2841722E4143435F49443D41632E494429416E642841632E42414C5F434E313D
      422E42414C5F434E29416E642841722E446174446174653D2731372D4150522D
      303327292047726F757020427920422E42414C5F434E29204C61737452656D61
      696E6465722C2853656C6563742053756D28504F4B5F4F42525F442920445475
      726E4F7665722C53756D28504F4B5F4F42525F4B29204B5475726E4F7665722C
      422E42414C5F434E2042616C616E636542696C6C2046726F6D20417263684F73
      742041722C4163636F756E742041632C2042414C5F5350523120422057686572
      65202841722E4143435F49443D41632E494429416E642841632E42414C5F434E
      313D422E42414C5F434E29416E642841722E446174446174653C3D2731372D41
      50522D30332729416E642841722E446174446174653E3D2731362D4150522D30
      3327292047726F757020427920422E42414C5F434E29205475726E4F7665722C
      2042414C5F5350523120576865726520286E6F74204C61737452656D61696E64
      65722E42616C616E636542696C6C20696E202853656C6563742020422E42616C
      5F636E2066726F6D2020417263684F73742041722C4163636F756E742041632C
      2042414C5F53505231204220576865726520202841722E4143435F49443D4163
      2E4944292020416E642841632E42414C5F434E313D422E42414C5F434E29416E
      642841722E446174446174653D2731362D4150522D303327292929616E642842
      616C5F636E3D4C61737452656D61696E6465722E42616C616E636542696C6C29
      616E64284C61737452656D61696E6465722E42616C616E636542696C6C3D5475
      726E4F7665722E42616C616E636542696C6C29200000000000}
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
    object ODSMainFDATE: TStringField
      FieldName = 'FDATE'
      Size = 9
    end
    object ODSMainFIRSTACTIVE: TFloatField
      FieldName = 'FIRSTACTIVE'
    end
    object ODSMainFIRSTPASSIVE: TFloatField
      FieldName = 'FIRSTPASSIVE'
    end
    object ODSMainLDATE: TStringField
      FieldName = 'LDATE'
      Size = 9
    end
    object ODSMainLASTACTIVE: TFloatField
      FieldName = 'LASTACTIVE'
    end
    object ODSMainLASTPASSIVE: TFloatField
      FieldName = 'LASTPASSIVE'
    end
    object ODSMainDTURNOVER: TFloatField
      FieldName = 'DTURNOVER'
    end
    object ODSMainKTURNOVER: TFloatField
      FieldName = 'KTURNOVER'
    end
    object ODSMainBAL_CN: TFloatField
      FieldName = 'BAL_CN'
    end
    object ODSMainBALNAME: TStringField
      FieldName = 'BALNAME'
      Size = 181
    end
    object ODSMainAccGroup: TIntegerField
      FieldKind = fkLookup
      FieldName = 'AccGroup'
      LookupDataSet = BalanceGroups
      LookupKeyFields = 'BALANCENUMBER'
      LookupResultField = 'ACCGROUP'
      KeyFields = 'BAL_CN'
      Lookup = True
    end
  end
  object OraclePackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SB_BalanceFilIDs'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 192
    Top = 16
  end
  object DataSrcMain: TDataSource
    DataSet = ODSMain
    Left = 96
    Top = 16
  end
  object DataSrcRate: TDataSource
    DataSet = ODSRate
    Left = 88
    Top = 64
  end
  object ODSRate: TOracleDataSet
    SQL.Strings = (
      'Select  Valute,Valu_Name  From  AValute')
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
    Top = 64
  end
  object BranchDataSet: TOracleDataSet
    SQL.Strings = (
      'Select'
      '    ID'
      '   ,Name'
      '   From  Filial')
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
    Top = 136
  end
  object BalanceGroups: TOracleDataSet
    SQL.Strings = (
      'Select AccGroup,Bal_cn  as  BalanceNumber '
      'From Bal_Spr1 '
      'Order By Bal_CN')
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
    Left = 184
    Top = 104
    object BalanceGroupsACCGROUP: TFloatField
      FieldName = 'ACCGROUP'
    end
    object BalanceGroupsBALANCENUMBER: TFloatField
      FieldName = 'BALANCENUMBER'
      Required = True
    end
  end
  object AboutBank: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  AZ_NAME as FullBankName ,'
      '  Logo ,'
      '  ManagerTitle ,'
      '  AccountantTitle '
      'From'
      '  BankInfo   ')
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
    Top = 184
    object AboutBankFULLBANKNAME: TStringField
      FieldName = 'FULLBANKNAME'
      Size = 80
    end
    object AboutBankLOGO: TBlobField
      FieldName = 'LOGO'
      BlobType = ftBlob
    end
    object AboutBankMANAGERTITLE: TStringField
      FieldName = 'MANAGERTITLE'
      Size = 128
    end
    object AboutBankACCOUNTANTTITLE: TStringField
      FieldName = 'ACCOUNTANTTITLE'
      Size = 128
    end
  end
  object OrDSFilialIDsBalance: TOracleDataSet
    SQL.Strings = (
      'Drop Table FilialIDsBalance'
      ';'
      'Create Table FilialIDsBalance'
      '(FilialID Integer'
      ');')
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
    Top = 264
  end
end
