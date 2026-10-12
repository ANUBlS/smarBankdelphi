object PlaneDataModule: TPlaneDataModule
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 480
  Width = 696
  object DataSrcPaymentsPlane: TDataSource
    DataSet = PaymentsPlaneData
    Left = 48
    Top = 72
  end
  object PaymentsPlaneData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  ID ,'
      '  ID# ,'
      '  HDate ,'
      '  FacticalDebtPayment ,'
      '  InterestDebtPayment ,'
      '  Paid'
      'from'
      '  SBCM_Payments_Plane'
      'where'
      '  ID# = :ContractID  '
      'order by '
      '  HDate  '
      '   ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000010000000B0000003A434F4E54524143544944030000000000000000
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
    Top = 72
    object PaymentsPlaneDataID2: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object PaymentsPlaneDataID: TFloatField
      FieldName = 'ID#'
      Required = True
    end
    object PaymentsPlaneDataHDATE: TDateTimeField
      DisplayLabel = '  ёд€м€ тарихи'
      FieldName = 'HDATE'
      Required = True
    end
    object PaymentsPlaneDataFACTICALDEBTPAYMENT: TFloatField
      DisplayLabel = '  ясас борждан '
      FieldName = 'FACTICALDEBTPAYMENT'
      Required = True
      currency = True
    end
    object PaymentsPlaneDataINTERESTDEBTPAYMENT: TFloatField
      DisplayLabel = '  ‘аизл€рд€н '
      FieldName = 'INTERESTDEBTPAYMENT'
      Required = True
      currency = True
    end
    object PaymentsPlaneDataPAID: TStringField
      FieldName = 'PAID'
      Size = 1
    end
  end
  object PaymentsPlane: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBCM_PAYMENT_PLANE'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 48
    Top = 136
  end
end
