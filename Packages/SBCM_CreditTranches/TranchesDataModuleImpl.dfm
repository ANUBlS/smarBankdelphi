object TranchesDataModule: TTranchesDataModule
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 480
  Width = 696
  object TranchesPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBCM_Credit_Tranches'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 40
    Top = 288
  end
  object AccountData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  Ac.Acc_No as ClientAccNo ,'
      '  Ac.Name  as ClientAccName ,'
      '  av.val_Name as ClientCurrency'
      'from'
      '  AValute Av ,'
      '  Account Ac '
      'where '
      '  Ac.val_acc = av.valute and'
      '  Ac.ID = :ClientAccID'
      '  '
      '  ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000010000000C0000003A434C49454E5441434349440300000000000000
      00000000}
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
    Top = 40
    object AccountDataCLIENTACCNO: TStringField
      FieldName = 'CLIENTACCNO'
    end
    object AccountDataCLIENTACCNAME: TStringField
      FieldName = 'CLIENTACCNAME'
      Size = 90
    end
    object AccountDataCLIENTCURRENCY: TStringField
      FieldName = 'CLIENTCURRENCY'
      Size = 10
    end
  end
  object DataSrcAccountData: TDataSource
    DataSet = AccountData
    Left = 48
    Top = 96
  end
end
