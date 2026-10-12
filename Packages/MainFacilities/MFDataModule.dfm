object MainFDataModule: TMainFDataModule
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 169
  Top = 113
  Height = 571
  Width = 811
  object ViewGroup: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   id,'
      '   name,'
      '   amort,'
      '   taxamort, '
      
        '   main_account,SB_COMPLEX_TRANSACTIONS.GetAccountNumber(main_ac' +
        'count) as MainAccNo,'
      
        '   exp_account,SB_COMPLEX_TRANSACTIONS.GetAccountNumber(exp_acco' +
        'unt) as DebtAccNo,'
      
        '   amort_account,SB_COMPLEX_TRANSACTIONS.GetAccountNumber(amort_' +
        'account) as CreditAccNo,'
      
        '   sale_account,SB_COMPLEX_TRANSACTIONS.GetAccountNumber(sale_ac' +
        'count) as SaleAccNo'
      'From'
      '   Groups'
      ' '
      ' '
      ' '
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
    Left = 48
    Top = 7
    object ViewGroupID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ViewGroupNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object ViewGroupAMORT: TFloatField
      FieldName = 'AMORT'
    end
    object ViewGroupTAXAMORT: TFloatField
      FieldName = 'TAXAMORT'
    end
    object ViewGroupMAIN_ACCOUNT: TFloatField
      FieldName = 'MAIN_ACCOUNT'
    end
    object ViewGroupEXP_ACCOUNT: TFloatField
      FieldName = 'EXP_ACCOUNT'
    end
    object ViewGroupAMORT_ACCOUNT: TFloatField
      FieldName = 'AMORT_ACCOUNT'
    end
    object ViewGroupSALE_ACCOUNT: TFloatField
      FieldName = 'SALE_ACCOUNT'
    end
    object ViewGroupRecordNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'RecordNo'
      OnGetText = ViewGroupRecordNoGetText
      Calculated = True
    end
    object ViewGroupMAINACCNO: TStringField
      DisplayWidth = 20
      FieldName = 'MAINACCNO'
    end
    object ViewGroupDEBTACCNO: TStringField
      DisplayWidth = 20
      FieldName = 'DEBTACCNO'
    end
    object ViewGroupCREDITACCNO: TStringField
      DisplayWidth = 20
      FieldName = 'CREDITACCNO'
    end
    object ViewGroupSALEACCNO: TStringField
      DisplayWidth = 20
      FieldName = 'SALEACCNO'
    end
  end
  object DViewGroup: TDataSource
    DataSet = ViewGroup
    Left = 97
    Top = 7
  end
  object DViewWares: TDataSource
    DataSet = ViewWares
    OnDataChange = DViewWaresDataChange
    Left = 509
    Top = 8
  end
  object ViewWares: TOracleDataSet
    SQL.Strings = (
      'Select  '
      '         W.*'
      'From  '
      '         Wares W'
      'Where  '
      '        (W.GroupsID = :GroupsID)'
      '     '
      'Order by :Title   '
      '  ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000090000003A47524F55505349440300000004000000010000
      0000000000060000003A5449544C4501000000050000006E616D650000000000}
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
    Master = ViewGroup
    MasterFields = 'ID'
    DetailFields = 'GroupsID'
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
    Left = 456
    Top = 8
    object ViewWaresModern_num: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Modern_num'
      LookupDataSet = ODSMODERN
      LookupKeyFields = 'ID'
      LookupResultField = 'MODERN_NUM'
      KeyFields = 'ID'
      Lookup = True
    end
    object ViewWaresModern_summa: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Modern_summa'
      LookupDataSet = ODSMODERN
      LookupKeyFields = 'ID'
      LookupResultField = 'MODERN_SUMMA'
      KeyFields = 'ID'
      Lookup = True
    end
    object ViewWaresModern_date: TDateField
      FieldKind = fkLookup
      FieldName = 'Modern_date'
      LookupDataSet = ODSMODERN
      LookupKeyFields = 'ID'
      LookupResultField = 'MODERN_DATE'
      KeyFields = 'ID'
      Lookup = True
    end
    object ViewWaresRepair_num: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Repair_num'
      LookupDataSet = ODSREPAIR
      LookupKeyFields = 'ID'
      LookupResultField = 'REPAIR_NUM'
      KeyFields = 'ID'
      Lookup = True
    end
    object ViewWaresRepair_summa: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Repair_summa'
      LookupDataSet = ODSREPAIR
      LookupKeyFields = 'ID'
      LookupResultField = 'REPAIR_SUMMA'
      KeyFields = 'ID'
      Lookup = True
    end
    object ViewWaresRepair_date: TDateField
      FieldKind = fkLookup
      FieldName = 'Repair_date'
      LookupDataSet = ODSREPAIR
      LookupKeyFields = 'ID'
      LookupResultField = 'REPAIR_DATE'
      KeyFields = 'ID'
      Lookup = True
    end
    object ViewWaresID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ViewWaresGROUPSID: TFloatField
      FieldName = 'GROUPSID'
      Required = True
    end
    object ViewWaresNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object ViewWaresINVENTAR: TStringField
      FieldName = 'INVENTAR'
    end
    object ViewWaresINVENTAR_DATE: TDateTimeField
      FieldName = 'INVENTAR_DATE'
    end
    object ViewWaresFIRST_PRICE: TFloatField
      FieldName = 'FIRST_PRICE'
      DisplayFormat = '#,##.00'
    end
    object ViewWaresBALANCE_PRICE: TFloatField
      FieldName = 'BALANCE_PRICE'
      DisplayFormat = '#,##.00'
    end
    object ViewWaresIN_DATE: TDateTimeField
      FieldName = 'IN_DATE'
    end
    object ViewWaresIN_NUM: TFloatField
      FieldName = 'IN_NUM'
    end
    object ViewWaresAMORT: TFloatField
      FieldName = 'AMORT'
    end
    object ViewWaresPRODUCER_PLANE: TStringField
      FieldName = 'PRODUCER_PLANE'
      Size = 500
    end
    object ViewWaresFXM: TFloatField
      FieldName = 'FXM'
    end
    object ViewWaresSECTOR_COD: TFloatField
      FieldName = 'SECTOR_COD'
    end
    object ViewWaresCLOSE_FORMAT: TFloatField
      FieldName = 'CLOSE_FORMAT'
    end
    object ViewWaresREMAINDER: TFloatField
      FieldName = 'REMAINDER'
      DisplayFormat = '#,##.00'
    end
    object ViewWaresALLAMORT: TFloatField
      FieldName = 'ALLAMORT'
      DisplayFormat = '#,##.00'
    end
    object ViewWaresTAXAMORT: TFloatField
      FieldName = 'TAXAMORT'
    end
    object ViewWaresALLTAXAMORT: TFloatField
      FieldName = 'ALLTAXAMORT'
    end
    object ViewWaresAMORT_DATE: TDateTimeField
      FieldName = 'AMORT_DATE'
    end
    object ViewWaresTAX: TFloatField
      FieldName = 'TAX'
    end
    object ViewWaresTAXPERCENTPRICE: TFloatField
      FieldName = 'TAXPERCENTPRICE'
    end
    object ViewWaresRecordNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'RecordNo'
      OnGetText = ViewWaresRecordNoGetText
      Calculated = True
    end
  end
  object OPViewWares: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SB_MAIN_FACILITIES'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 502
    Top = 419
  end
  object ExcelPreviewCurrent: TOracleDataSet
    SQL.Strings = (
      'Select'
      '       id,'
      '       inventar_date,'
      '       inventar,'
      '       name,'
      '       in_date,'
      '       in_num,'
      '       first_price,'
      '       producer_plane,'
      '       amort,'
      '       amort_date,'
      '       allamort'
      '     --balance_price'
      'From'
      '   Wares'
      ''
      ''
      'Order by'
      '    GroupsID'
      '       ,ID'
      '      ,first_price  '
      ' '
      ' '
      ' '
      ' '
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
    Left = 415
    Top = 204
    object ExcelPreviewCurrentID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ExcelPreviewCurrentINVENTAR_DATE: TDateTimeField
      FieldName = 'INVENTAR_DATE'
    end
    object ExcelPreviewCurrentINVENTAR: TStringField
      FieldName = 'INVENTAR'
    end
    object ExcelPreviewCurrentNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object ExcelPreviewCurrentIN_DATE: TDateTimeField
      FieldName = 'IN_DATE'
    end
    object ExcelPreviewCurrentIN_NUM: TFloatField
      FieldName = 'IN_NUM'
    end
    object ExcelPreviewCurrentFIRST_PRICE: TFloatField
      FieldName = 'FIRST_PRICE'
    end
    object ExcelPreviewCurrentPRODUCER_PLANE: TStringField
      FieldName = 'PRODUCER_PLANE'
      Size = 500
    end
    object ExcelPreviewCurrentAMORT: TFloatField
      FieldName = 'AMORT'
    end
    object ExcelPreviewCurrentAMORT_DATE: TDateTimeField
      FieldName = 'AMORT_DATE'
    end
    object ExcelPreviewCurrentALLAMORT: TFloatField
      FieldName = 'ALLAMORT'
    end
    object ExcelPreviewCurrentModern_date: TDateField
      FieldKind = fkLookup
      FieldName = 'Modern_date'
      LookupDataSet = M1
      LookupKeyFields = 'ID'
      LookupResultField = 'MODERN_DATE'
      KeyFields = 'ID'
      Lookup = True
    end
    object ExcelPreviewCurrentModern_num: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Modern_num'
      LookupDataSet = M1
      LookupKeyFields = 'ID'
      LookupResultField = 'MODERN_NUM'
      KeyFields = 'ID'
      Lookup = True
    end
    object ExcelPreviewCurrentModern_summa: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Modern_summa'
      LookupDataSet = M1
      LookupKeyFields = 'ID'
      LookupResultField = 'MODERN_SUMMA'
      KeyFields = 'ID'
      Lookup = True
    end
    object ExcelPreviewCurrentRepair_date: TDateField
      FieldKind = fkLookup
      FieldName = 'Repair_date'
      LookupDataSet = R1
      LookupKeyFields = 'ID'
      LookupResultField = 'REPAIR_DATE'
      KeyFields = 'ID'
      Lookup = True
    end
    object ExcelPreviewCurrentRepair_num: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Repair_num'
      LookupDataSet = R1
      LookupKeyFields = 'ID'
      LookupResultField = 'REPAIR_NUM'
      KeyFields = 'ID'
      Lookup = True
    end
    object ExcelPreviewCurrentRepair_summa: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Repair_summa'
      LookupDataSet = R1
      LookupKeyFields = 'ID'
      LookupResultField = 'REPAIR_SUMMA'
      KeyFields = 'ID'
      Lookup = True
    end
  end
  object ODSWaresID: TOracleDataSet
    SQL.Strings = (
      'Select  '
      '   ID, '
      '   Name, '
      '   Inventar'
      'From'
      '   Wares'
      'Where'
      '    ID=(Select '
      '              max(ID) '
      '          From  '
      '              Wares)')
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
    Left = 504
    Top = 104
  end
  object ODSDepartments: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   ID,'
      '   department'
      'From'
      '   Departments')
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
    Left = 40
    Top = 67
  end
  object ODSTakeDepartmentID: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   ID'
      'From'
      '   Departments'
      'Where'
      '   department=:Dname')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000060000003A444E414D45050000000000000000000000}
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
    Left = 45
    Top = 255
  end
  object ODSTakeGroupID: TOracleDataSet
    SQL.Strings = (
      'Select'
      '    ID,'
      '    Amort'
      'From'
      '    Groups'
      'Where'
      '    name=:Gname')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000060000003A474E414D45050000000000000000000000}
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
    Left = 113
    Top = 67
  end
  object ODSMODERN: TOracleDataSet
    SQL.Strings = (
      'Select '
      '     *'
      'From  '
      '     MODERNED_WARES'
      'Where (id=:WID) and modern_date='
      '(select max(modern_date) from moderned_wares where id=:WID)  ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A574944030000000000000000000000}
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
    Left = 451
    Top = 147
    object ODSMODERNID: TFloatField
      FieldName = 'ID'
    end
    object ODSMODERNGROUPSID: TFloatField
      FieldName = 'GROUPSID'
    end
    object ODSMODERNMODERN_NUM: TFloatField
      FieldName = 'MODERN_NUM'
    end
    object ODSMODERNMODERN_SUMMA: TFloatField
      FieldName = 'MODERN_SUMMA'
    end
    object ODSMODERNMODERN_DATE: TDateTimeField
      FieldName = 'MODERN_DATE'
    end
  end
  object ODSREPAIR: TOracleDataSet
    SQL.Strings = (
      'Select '
      '     *'
      'From  '
      '     REPAIRED_WARES'
      'Where (id=:WID) and repair_date='
      ' ('
      'Select  '
      '   max(repair_date) '
      'From  '
      '   REPAIRED_WARES'
      'where id=:WID'
      ' )  '
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000040000003A574944030000000000000000000000}
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
    Left = 504
    Top = 147
    object ODSREPAIRID: TFloatField
      FieldName = 'ID'
    end
    object ODSREPAIRGROUPSID: TFloatField
      FieldName = 'GROUPSID'
    end
    object ODSREPAIRREPAIR_NUM: TFloatField
      FieldName = 'REPAIR_NUM'
    end
    object ODSREPAIRREPAIR_SUMMA: TFloatField
      FieldName = 'REPAIR_SUMMA'
    end
    object ODSREPAIRREPAIR_DATE: TDateTimeField
      FieldName = 'REPAIR_DATE'
    end
  end
  object ExcelPreviewCopyOff: TOracleDataSet
    SQL.Strings = (
      'Select'
      '       ID,'
      '       inventar_date,'
      '       inventar,'
      '       name,'
      '       in_date,'
      '       in_num,'
      '       first_price,'
      '       producer_plane,'
      '       amort,'
      '       amort_date,'
      '       allamort,'
      '    --balance_price,'
      '       modern_date,'
      '       modern_num,'
      '       modern_summa,'
      '       repair_date,'
      '       repair_num,'
      '       repair_summa,'
      '       out_date,'
      '       out_num,'
      '       cause_out'
      'From'
      '   Archive_wares1'
      ''
      ''
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
    Left = 499
    Top = 204
    object ExcelPreviewCopyOffID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ExcelPreviewCopyOffINVENTAR_DATE: TDateTimeField
      FieldName = 'INVENTAR_DATE'
    end
    object ExcelPreviewCopyOffINVENTAR: TStringField
      FieldName = 'INVENTAR'
    end
    object ExcelPreviewCopyOffNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object ExcelPreviewCopyOffIN_DATE: TDateTimeField
      FieldName = 'IN_DATE'
    end
    object ExcelPreviewCopyOffIN_NUM: TFloatField
      FieldName = 'IN_NUM'
    end
    object ExcelPreviewCopyOffFIRST_PRICE: TFloatField
      FieldName = 'FIRST_PRICE'
    end
    object ExcelPreviewCopyOffPRODUCER_PLANE: TStringField
      FieldName = 'PRODUCER_PLANE'
      Size = 100
    end
    object ExcelPreviewCopyOffAMORT: TFloatField
      FieldName = 'AMORT'
    end
    object ExcelPreviewCopyOffAMORT_DATE: TDateTimeField
      FieldName = 'AMORT_DATE'
    end
    object ExcelPreviewCopyOffALLAMORT: TFloatField
      FieldName = 'ALLAMORT'
    end
    object ExcelPreviewCopyOffMODERN_DATE: TDateTimeField
      FieldName = 'MODERN_DATE'
    end
    object ExcelPreviewCopyOffMODERN_NUM: TFloatField
      FieldName = 'MODERN_NUM'
    end
    object ExcelPreviewCopyOffMODERN_SUMMA: TFloatField
      FieldName = 'MODERN_SUMMA'
    end
    object ExcelPreviewCopyOffREPAIR_DATE: TDateTimeField
      FieldName = 'REPAIR_DATE'
    end
    object ExcelPreviewCopyOffREPAIR_NUM: TFloatField
      FieldName = 'REPAIR_NUM'
    end
    object ExcelPreviewCopyOffREPAIR_SUMMA: TFloatField
      FieldName = 'REPAIR_SUMMA'
    end
    object ExcelPreviewCopyOffOUT_DATE: TDateTimeField
      FieldName = 'OUT_DATE'
    end
    object ExcelPreviewCopyOffOUT_NUM: TFloatField
      FieldName = 'OUT_NUM'
    end
    object ExcelPreviewCopyOffCAUSE_OUT: TStringField
      FieldName = 'CAUSE_OUT'
      Size = 100
    end
  end
  object M1: TOracleDataSet
    SQL.Strings = (
      'Select '
      '     ID,'
      '     modern_num,'
      '     modern_summa,'
      '     modern_date'
      'From '
      '     Moderned_wares'
      'TESt')
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
    Left = 443
    Top = 256
  end
  object R1: TOracleDataSet
    SQL.Strings = (
      'Select '
      '     ID,'
      '     repair_num,'
      '     repair_summa,'
      '     repair_date'
      'From '
      '     Repaired_wares'
      'Test')
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
    Left = 499
    Top = 256
  end
  object ExcelPreviewGroups: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  G.ID,'
      '  Max (G.name),'
      '  Max (G.amort),'
      '  Sum (W.first_price),'
      '  Sum (W.balance_price),'
      '  Sum(W.allamort)'
      'FROM'
      '   Wares W,'
      '   Groups G'
      '   WHERE G.ID = W.GroupsID'
      'GROUP BY G.ID'
      'ORDER BY G.ID'
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
    Left = 110
    Top = 239
    object ExcelPreviewGroupsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ExcelPreviewGroupsMAXGNAME: TStringField
      FieldName = 'MAX(G.NAME)'
      Size = 90
    end
    object ExcelPreviewGroupsMAXGAMORT: TFloatField
      FieldName = 'MAX(G.AMORT)'
    end
    object ExcelPreviewGroupsSUMWFIRST_PRICE: TFloatField
      FieldName = 'SUM(W.FIRST_PRICE)'
    end
    object ExcelPreviewGroupsSUMWBALANCE_PRICE: TFloatField
      FieldName = 'SUM(W.BALANCE_PRICE)'
    end
    object ExcelPreviewGroupsSUMWALLAMORT: TFloatField
      FieldName = 'SUM(W.ALLAMORT)'
    end
  end
  object ODSTransaction: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  G.ID,'
      '   max(G.name) as Name,'
      '     max(G.main_account) as Main_account ,   '
      '     max(G.exp_account) as Exp_account ,'
      '     max(G.amort_account) as Amort_account,'
      '     max(G.Sale_account) as Sale_account,'
      '      sum(W.remainder) as Rest'
      'From'
      '   Wares W,'
      '     Groups G'
      'Where'
      '   G.ID=W.GroupsID and W.close_format <>2'
      ''
      'Group by G.ID'
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
    Left = 103
    Top = 188
    object ODSTransactionID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSTransactionNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object ODSTransactionMAIN_ACCOUNT: TFloatField
      FieldName = 'MAIN_ACCOUNT'
    end
    object ODSTransactionEXP_ACCOUNT: TFloatField
      FieldName = 'EXP_ACCOUNT'
    end
    object ODSTransactionAMORT_ACCOUNT: TFloatField
      FieldName = 'AMORT_ACCOUNT'
    end
    object ODSTransactionSALE_ACCOUNT: TFloatField
      FieldName = 'SALE_ACCOUNT'
    end
    object ODSTransactionREST: TFloatField
      FieldName = 'REST'
    end
  end
  object OPTranzaction: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SB_TRANSACTION'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 441
    Top = 419
  end
  object ODSTaxPercents: TOracleDataSet
    SQL.Strings = (
      'Select'
      '       id,'
      '       inventar_date,'
      '       inventar,'
      '       name,'
      '       in_date,'
      '       in_num,'
      '       first_price,'
      '       producer_plane,'
      '       amort,'
      '       allamort,'
      '       taxpercentprice,'
      '       remainder, '
      '       tax,'
      '       taxamort,'
      '       alltaxamort '
      'From '
      '   Wares'
      ''
      'Order by '
      '    ID,'
      '    balance_price'
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
    QueryAllRecords = False
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 440
    Top = 376
    object ODSTaxPercentsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSTaxPercentsINVENTAR_DATE: TDateTimeField
      FieldName = 'INVENTAR_DATE'
    end
    object ODSTaxPercentsINVENTAR: TStringField
      FieldName = 'INVENTAR'
    end
    object ODSTaxPercentsNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object ODSTaxPercentsIN_DATE: TDateTimeField
      FieldName = 'IN_DATE'
    end
    object ODSTaxPercentsIN_NUM: TFloatField
      FieldName = 'IN_NUM'
    end
    object ODSTaxPercentsFIRST_PRICE: TFloatField
      FieldName = 'FIRST_PRICE'
      DisplayFormat = '#,##.00'
    end
    object ODSTaxPercentsPRODUCER_PLANE: TStringField
      FieldName = 'PRODUCER_PLANE'
      Size = 500
    end
    object ODSTaxPercentsAMORT: TFloatField
      FieldName = 'AMORT'
    end
    object ODSTaxPercentsALLAMORT: TFloatField
      FieldName = 'ALLAMORT'
      DisplayFormat = '#,##.00'
    end
    object ODSTaxPercentsREMAINDER: TFloatField
      FieldName = 'REMAINDER'
    end
    object ODSTaxPercentsTAX: TFloatField
      FieldName = 'TAX'
    end
    object ODSTaxPercentsTAXAMORT: TFloatField
      FieldName = 'TAXAMORT'
      DisplayFormat = '#,##.00'
    end
    object ODSTaxPercentsALLTAXAMORT: TFloatField
      FieldName = 'ALLTAXAMORT'
      DisplayFormat = '#,##.00'
    end
    object ODSTaxPercentsTAXPERCENTPRICE: TFloatField
      FieldName = 'TAXPERCENTPRICE'
      DisplayFormat = '#,##.00'
    end
  end
  object DSTaxPercents: TDataSource
    DataSet = ODSTaxPercents
    Left = 504
    Top = 360
  end
  object ODSTraffics: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   *'
      'From'
      '    MFTraffics'
      'where'
      '   ID =:WaresID '
      ''
      'Order by '
      '   amort_date')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000080000003A57415245534944030000000000000000000000}
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
    OnCalcFields = ODSTrafficsCalcFields
    Left = 104
    Top = 125
    object ODSTrafficsID: TFloatField
      FieldName = 'ID'
    end
    object ODSTrafficsGROUPSID: TFloatField
      FieldName = 'GROUPSID'
    end
    object ODSTrafficsNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object ODSTrafficsINVENRTAR: TStringField
      FieldName = 'INVENRTAR'
    end
    object ODSTrafficsINVENTAR_DATE: TDateTimeField
      FieldName = 'INVENTAR_DATE'
    end
    object ODSTrafficsFIRST_PRICE: TFloatField
      FieldName = 'FIRST_PRICE'
    end
    object ODSTrafficsBALANCE_PRICE: TFloatField
      FieldName = 'BALANCE_PRICE'
    end
    object ODSTrafficsALLAMORT: TFloatField
      FieldName = 'ALLAMORT'
    end
    object ODSTrafficsREMAINDER: TFloatField
      FieldName = 'REMAINDER'
    end
    object ODSTrafficsAMORT: TFloatField
      FieldName = 'AMORT'
    end
    object ODSTrafficsAMORT_DATE: TDateTimeField
      FieldName = 'AMORT_DATE'
    end
    object ODSTrafficsFormattedDate: TStringField
      FieldKind = fkCalculated
      FieldName = 'FormattedDate'
      Calculated = True
    end
  end
  object ODSDepartmentsPrint: TOracleDataSet
    SQL.Strings = (
      'Select '
      '    *'
      'From'
      '   Wares  '
      ''
      'Order by'
      '     GroupsID,Inventar_date')
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
    OnCalcFields = ODSDepartmentsPrintCalcFields
    Left = 504
    Top = 312
    object ODSDepartmentsPrintID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSDepartmentsPrintGROUPSID: TFloatField
      FieldName = 'GROUPSID'
      Required = True
    end
    object ODSDepartmentsPrintNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object ODSDepartmentsPrintINVENTAR: TStringField
      FieldName = 'INVENTAR'
    end
    object ODSDepartmentsPrintINVENTAR_DATE: TDateTimeField
      FieldName = 'INVENTAR_DATE'
    end
    object ODSDepartmentsPrintFIRST_PRICE: TFloatField
      FieldName = 'FIRST_PRICE'
      DisplayFormat = '#,##.00'
    end
    object ODSDepartmentsPrintBALANCE_PRICE: TFloatField
      FieldName = 'BALANCE_PRICE'
      DisplayFormat = '#,##.00'
    end
    object ODSDepartmentsPrintAMORT: TFloatField
      FieldName = 'AMORT'
    end
    object ODSDepartmentsPrintPRODUCER_PLANE: TStringField
      FieldName = 'PRODUCER_PLANE'
      Size = 500
    end
    object ODSDepartmentsPrintSECTOR_COD: TFloatField
      FieldName = 'SECTOR_COD'
    end
    object ODSDepartmentsPrintREMAINDER: TFloatField
      FieldName = 'REMAINDER'
    end
    object ODSDepartmentsPrintALLAMORT: TFloatField
      FieldName = 'ALLAMORT'
      DisplayFormat = '#,##.00'
    end
    object ODSDepartmentsPrintAMORT_DATE: TDateTimeField
      FieldName = 'AMORT_DATE'
    end
    object ODSDepartmentsPrintGroupName: TStringField
      DisplayWidth = 500
      FieldKind = fkLookup
      FieldName = 'GroupName'
      LookupDataSet = ViewGroup
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'GROUPSID'
      Size = 500
      Lookup = True
    end
    object ODSDepartmentsPrintFormattedDate: TStringField
      FieldKind = fkCalculated
      FieldName = 'FormattedDate'
      Calculated = True
    end
  end
  object ODSBankInfo: TOracleDataSet
    SQL.Strings = (
      'Select '
      '   AZ_NAME  FullBankName'
      'From '
      '   BankInfo')
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
    Left = 304
    Top = 33
    object ODSBankInfoFULLBANKNAME: TStringField
      FieldName = 'FULLBANKNAME'
      Size = 80
    end
  end
  object ODSGroupFilter: TOracleDataSet
    SQL.Strings = (
      'Select '
      '    *'
      'From'
      '   Groups'
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
    Left = 224
    Top = 32
  end
  object DSSumModWares: TDataSource
    DataSet = ODSSumModWares
    Left = 40
    Top = 312
  end
  object ODSSumModWares: TOracleDataSet
    SQL.Strings = (
      'Select'
      '     GroupsID,'
      '     sum(modern_summa) as modern_summa     '
      'From'
      '      Moderned_wares'
      'where (groupsid = :groupsid) '
      'Group by GroupsID'
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000090000003A47524F55505349440300000000000000000000
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
    Master = ViewGroup
    MasterFields = 'ID'
    DetailFields = 'GROUPSID'
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
    Left = 101
    Top = 312
    object ODSSumModWaresGROUPSID: TFloatField
      FieldName = 'GROUPSID'
    end
    object ODSSumModWaresMODERN_SUMMA: TFloatField
      FieldName = 'MODERN_SUMMA'
      DisplayFormat = '#,##.00'
    end
  end
  object ODSSumRepair: TOracleDataSet
    SQL.Strings = (
      'Select'
      '     GroupsID,'
      '     sum(repair_summa) as repair_summa'
      'From'
      '      Repaired_wares'
      'where (groupsid = :groupsid) '
      'Group by GroupsID'
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000090000003A47524F55505349440300000000000000000000
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
    Master = ViewGroup
    MasterFields = 'ID'
    DetailFields = 'GROUPSID'
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
    Left = 102
    Top = 358
    object ODSSumRepairGROUPSID: TFloatField
      FieldName = 'GROUPSID'
    end
    object ODSSumRepairREPAIR_SUMMA: TFloatField
      FieldName = 'REPAIR_SUMMA'
      DisplayFormat = '#,##.00'
    end
  end
  object DSSumRepair: TDataSource
    DataSet = ODSSumRepair
    Left = 41
    Top = 359
  end
  object ODSSumWares: TOracleDataSet
    SQL.Strings = (
      'Select'
      '     GroupsID,'
      '     sum(First_price) FPrice,'
      '     sum(Balance_price) BPrice,'
      '     sum(AllAmort) AllAmort,'
      '     sum(Remainder) Remainder '
      'From'
      '      Wares '
      'where (groupsid = :groupsid) '
      '           '
      'Group by GroupsID'
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000090000003A47524F55505349440300000000000000000000
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
    Master = ViewGroup
    MasterFields = 'ID'
    DetailFields = 'GROUPSID'
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
    Top = 408
    object ODSSumWaresGROUPSID: TFloatField
      FieldName = 'GROUPSID'
      Required = True
    end
    object ODSSumWaresFPRICE: TFloatField
      FieldName = 'FPRICE'
      DisplayFormat = '#,##.00'
    end
    object ODSSumWaresBPRICE: TFloatField
      FieldName = 'BPRICE'
      DisplayFormat = '#,##.00'
    end
    object ODSSumWaresALLAMORT: TFloatField
      FieldName = 'ALLAMORT'
      DisplayFormat = '#,##.00'
    end
    object ODSSumWaresREMAINDER: TFloatField
      FieldName = 'REMAINDER'
      DisplayFormat = '#,##.00'
    end
  end
  object DSSumWares: TDataSource
    DataSet = ODSSumWares
    Left = 43
    Top = 408
  end
  object ODSWClose: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   *'
      'From'
      '     Wares')
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
    Left = 39
    Top = 171
    object ODSWCloseID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSWCloseGROUPSID: TFloatField
      FieldName = 'GROUPSID'
      Required = True
    end
    object ODSWCloseNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object ODSWCloseINVENTAR: TStringField
      FieldName = 'INVENTAR'
    end
    object ODSWCloseINVENTAR_DATE: TDateTimeField
      FieldName = 'INVENTAR_DATE'
    end
    object ODSWCloseFIRST_PRICE: TFloatField
      FieldName = 'FIRST_PRICE'
    end
    object ODSWCloseBALANCE_PRICE: TFloatField
      FieldName = 'BALANCE_PRICE'
    end
    object ODSWCloseIN_DATE: TDateTimeField
      FieldName = 'IN_DATE'
    end
    object ODSWCloseIN_NUM: TFloatField
      FieldName = 'IN_NUM'
    end
    object ODSWCloseAMORT: TFloatField
      FieldName = 'AMORT'
    end
    object ODSWClosePRODUCER_PLANE: TStringField
      FieldName = 'PRODUCER_PLANE'
      Size = 500
    end
    object ODSWCloseFXM: TFloatField
      FieldName = 'FXM'
    end
    object ODSWCloseSECTOR_COD: TFloatField
      FieldName = 'SECTOR_COD'
    end
    object ODSWCloseCLOSE_FORMAT: TFloatField
      FieldName = 'CLOSE_FORMAT'
    end
    object ODSWCloseREMAINDER: TFloatField
      FieldName = 'REMAINDER'
    end
    object ODSWCloseALLAMORT: TFloatField
      FieldName = 'ALLAMORT'
    end
    object ODSWCloseTAXAMORT: TFloatField
      FieldName = 'TAXAMORT'
    end
    object ODSWCloseALLTAXAMORT: TFloatField
      FieldName = 'ALLTAXAMORT'
    end
  end
  object ODSDifferenceReport: TOracleDataSet
    SQL.Strings = (
      'begin'
      '  SB_Main_Facilities.OpenCursor(:ACursor,:AStrParam);'
      'end;'
      ''
      ''
      ''
      ''
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000080000003A41435552534F52740000000000000000000000
      0A0000003A41535452504152414D050000000000000000000000}
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
    Left = 256
    Top = 176
    object ODSDifferenceReportID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSDifferenceReportMAINACC: TFloatField
      FieldName = 'MAINACC'
    end
    object ODSDifferenceReportBALCN: TFloatField
      FieldName = 'BALCN'
    end
    object ODSDifferenceReportNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object ODSDifferenceReportALLAMORT: TFloatField
      FieldName = 'ALLAMORT'
    end
    object ODSDifferenceReportALLTAXAMORT: TFloatField
      FieldName = 'ALLTAXAMORT'
    end
  end
  object ODSGetErroneousWares: TOracleDataSet
    SQL.Strings = (
      'Select '
      '    *'
      'From'
      '   Wares'
      'Where '
      '    close_format = 2'
      ''
      'Order by GroupsID')
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
    Left = 288
    Top = 376
  end
  object ODSAccounts: TOracleDataSet
    SQL.Strings = (
      'Select '
      '   id,   '
      '   acc_no'
      'From  '
      '  Account'
      'Where '
      '   val_acc=0 and close_dat is Null'
      ''
      'Order by'
      '    bal_cn1,acc_no')
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
    Left = 432
    Top = 303
    object ODSAccountsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSAccountsACC_NO: TStringField
      FieldName = 'ACC_NO'
    end
  end
end
