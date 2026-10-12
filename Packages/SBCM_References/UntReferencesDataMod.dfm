object DataModReferences: TDataModReferences
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 484
  Width = 637
  object TVSubItems: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   *'
      '  From'
      '     SBCM_References'
      '   Where'
      '    ParentID =:ParentID')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A0050004100520045004E005400490044000300
      00000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 8
    object TVSubItemsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object TVSubItemsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 64
    end
    object TVSubItemsLNAME: TWideStringField
      FieldName = 'LNAME'
      Size = 128
    end
    object TVSubItemsPARENTID: TFloatField
      FieldName = 'PARENTID'
      Required = True
    end
    object TVSubItemsVALUE: TWideStringField
      FieldName = 'VALUE'
      Size = 556
    end
    object TVSubItemsSOURCELIST: TWideStringField
      FieldName = 'SOURCELIST'
      Size = 2048
    end
  end
  object BalanceLink: TOracleQuery
    SQL.Strings = (
      'Select'
      '  Bal_Cn'
      '  From'
      '  Bal_Spr1'
      'order by bal_cn')
    Session = sboapiDataModule.SBSession
    Optimize = False
    Left = 144
    Top = 8
  end
  object DataSrcAccZones: TDataSource
    DataSet = AccZones
    Left = 16
    Top = 112
  end
  object AccZones: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  ZoneID'
      ' ,Description'
      '  From'
      '   SBCM_Acc_Zones'
      ' order by ZoneID')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 112
  end
  object DataSrcAccZoneInfo: TDataSource
    DataSet = AccZoneInfo
    Left = 16
    Top = 168
  end
  object AccZoneInfo: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  RowID'
      ' ,ZoneID'
      ' ,AccGroup'
      ' From'
      '  SBCM_Acc_Zone_Info'
      ' Where '
      '      ZoneID =:ZoneID')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A005A004F004E00450049004400030000000400
      00000200000000000000}
    Master = AccZones
    MasterFields = 'ZoneID'
    DetailFields = 'ZoneID'
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 168
  end
  object ReferLink: TOracleDataSet
    SQL.Strings = (
      'Select * From  SBCM_References')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 184
    Top = 8
    object ReferLinkID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ReferLinkNAME: TWideStringField
      FieldName = 'NAME'
      Size = 64
    end
    object ReferLinkLNAME: TWideStringField
      FieldName = 'LNAME'
      Size = 128
    end
    object ReferLinkPARENTID: TFloatField
      FieldName = 'PARENTID'
      Required = True
    end
    object ReferLinkVALUE: TWideStringField
      FieldName = 'VALUE'
      Size = 556
    end
    object ReferLinkSOURCELIST: TWideStringField
      FieldName = 'SOURCELIST'
      Size = 2048
    end
  end
  object ReferPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SBCM_RPDepository'
    Left = 344
    Top = 8
  end
  object DataSrcCreditTypes: TDataSource
    DataSet = CreditTypes
    Left = 312
    Top = 104
  end
  object CreditTypes: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  RowID'
      ' ,ID'
      ' ,Type'
      ',additionaltype'
      '  From SBCM_Credit_Types')
    Optimize = False
    Session = sboapiDataModule.SBSession
    AfterPost = CategoriesAfterPost
    Left = 352
    Top = 104
    object CreditTypesID: TIntegerField
      FieldName = 'ID'
    end
    object CreditTypesTYPE: TWideStringField
      FieldName = 'TYPE'
      Size = 128
    end
    object CreditTypesADDITIONALTYPE: TWideStringField
      FieldName = 'ADDITIONALTYPE'
      Size = 32
    end
  end
  object DataSrcPledgeTypes: TDataSource
    DataSet = PledgeTypes
    Left = 312
    Top = 152
  end
  object PledgeTypes: TOracleDataSet
    SQL.Strings = (
      'SELECT p.rowID,p.id, p.type'
      '  FROM sbcm_pledgetypes p')
    Optimize = False
    Session = sboapiDataModule.SBSession
    AfterPost = CategoriesAfterPost
    Left = 352
    Top = 152
    object PledgeTypesID: TFloatField
      FieldName = 'ID'
    end
    object PledgeTypesTYPE: TWideStringField
      FieldName = 'TYPE'
      Size = 32
    end
  end
  object DataSrcCategories: TDataSource
    DataSet = Categories
    Left = 312
    Top = 200
  end
  object Categories: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   RowID'
      ' ,ID'
      ' ,Category'
      ',TRUECATEGORY'
      ' From SBCM_Categories ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000003000000040000004900440001000000000010000000430041005400
      450047004F005200590001000000000018000000540052005500450043004100
      5400450047004F0052005900010000000000}
    Session = sboapiDataModule.SBSession
    AfterPost = CategoriesAfterPost
    Left = 352
    Top = 200
    object CategoriesID: TFloatField
      FieldName = 'ID'
    end
    object CategoriesCATEGORY: TWideStringField
      FieldName = 'CATEGORY'
      Size = 128
    end
    object CategoriesTRUECATEGORY: TWideStringField
      FieldName = 'TRUECATEGORY'
      Size = 222
    end
  end
  object DataSrcMovieNames: TDataSource
    DataSet = MovieNames
    Left = 312
    Top = 248
  end
  object MovieNames: TOracleDataSet
    SQL.Strings = (
      'Select  '
      '  ID'
      ' ,TypeID'
      ' ,Name'
      ' ,Description'
      'From SBCM_Movie_Names'
      'Where '
      '   TypeID =:TypeID')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A00540059005000450049004400030000000000
      000000000000}
    Master = CategoriesMaster
    MasterFields = 'ID'
    DetailFields = 'TypeID'
    Session = sboapiDataModule.SBSession
    Left = 352
    Top = 248
    object MovieNamesID: TIntegerField
      FieldName = 'ID'
    end
    object MovieNamesTYPEID: TIntegerField
      FieldName = 'TYPEID'
      Required = True
    end
    object MovieNamesNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 64
    end
    object MovieNamesDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 128
    end
  end
  object DataSrcSettings: TDataSource
    DataSet = AccountSettings
    Left = 312
    Top = 296
  end
  object AccountSettings: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  RowID'
      ' ,ID'
      ' ,ParentID'
      ' ,CurrencyID'
      ' ,AccID'
      ' From  SBCM_Settings'
      ' Where '
      '      ParentID = :ParentID')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A0050004100520045004E005400490044000300
      00000000000000000000}
    Master = MovieNames
    MasterFields = 'ID'
    DetailFields = 'PARENTID'
    Session = sboapiDataModule.SBSession
    AfterPost = AccountSettingsAfterPost
    Left = 352
    Top = 296
    object AccountSettingsID: TFloatField
      FieldName = 'ID'
    end
    object AccountSettingsPARENTID: TFloatField
      FieldName = 'PARENTID'
      Required = True
    end
    object AccountSettingsCURRENCYID: TFloatField
      FieldName = 'CURRENCYID'
    end
    object AccountSettingsACCID: TFloatField
      FieldName = 'ACCID'
    end
    object AccountSettingsCurrencyName: TWideStringField
      FieldKind = fkLookup
      FieldName = 'CurrencyName'
      LookupDataSet = CurrencyLookup
      LookupKeyFields = 'VALUTE'
      LookupResultField = 'VAL_NAME'
      KeyFields = 'CURRENCYID'
      Size = 4
      Lookup = True
    end
    object AccountSettingsAccNo: TWideStringField
      FieldKind = fkLookup
      FieldName = 'AccNo'
      LookupDataSet = AccountLookup
      LookupKeyFields = 'ID'
      LookupResultField = 'ACC_NO'
      KeyFields = 'ACCID'
      Size = 40
      Lookup = True
    end
    object AccountSettingsAccName: TWideStringField
      FieldKind = fkLookup
      FieldName = 'AccName'
      LookupDataSet = AccountLookup
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ACCID'
      Size = 56
      Lookup = True
    end
  end
  object CategoriesMaster: TOracleDataSet
    SQL.Strings = (
      'Select  '
      '  ID'
      ' ,Category'
      ' From SBCM_Categories ')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 224
    Top = 264
    object FloatField1: TFloatField
      FieldName = 'ID'
    end
    object StringField1: TWideStringField
      FieldName = 'CATEGORY'
      Size = 128
    end
  end
  object DataSrcCategoriesMaster: TDataSource
    DataSet = CategoriesMaster
    Left = 192
    Top = 264
  end
  object AccountLookup: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  Ac.ID'
      ' ,Ac.Name'
      ' ,Ac.Acc_no'
      ' ,Ac.Val_Acc'
      ' ,Av.Val_Name'
      ' From'
      '  Account  Ac'
      ' ,Avalute Av'
      ' Where'
      '      Av.Valute = Ac.Val_Acc'
      'order by  ac.Acc_No,ac.val_acc '
      ' ')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 248
    Top = 8
    object AccountLookupID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object AccountLookupNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
    object AccountLookupACC_NO: TWideStringField
      FieldName = 'ACC_NO'
    end
    object AccountLookupVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object AccountLookupVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
  end
  object CurrencyLookup: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  Valute'
      ' ,Val_Name'
      ' From AValute')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 144
    Top = 56
  end
  object DataSrcReliability: TDataSource
    DataSet = Reliability
    Left = 24
    Top = 304
  end
  object Reliability: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  RowID'
      ' ,ID'
      ' ,Reliability'
      ' ,Percent'
      ' From SBCM_Reliability')
    Optimize = False
    Session = sboapiDataModule.SBSession
    AfterPost = CategoriesAfterPost
    Left = 120
    Top = 312
    object ReliabilityID: TIntegerField
      FieldName = 'ID'
    end
    object ReliabilityRELIABILITY: TWideStringField
      FieldName = 'RELIABILITY'
      Required = True
      Size = 132
    end
    object ReliabilityPERCENT: TIntegerField
      FieldName = 'PERCENT'
      Required = True
    end
  end
  object DataSrcDepositTypes: TDataSource
    DataSet = DepositTypes
    Left = 168
    Top = 176
  end
  object DepositTypes: TOracleDataSet
    SQL.Strings = (
      'Select '
      '   DepositTypes.RowID'
      '  ,DepositTypes.* '
      '  From'
      '   SBCM_Deposit_Types DepositTypes ')
    Optimize = False
    Session = sboapiDataModule.SBSession
    AfterPost = DepositTypesAfterPost
    Left = 208
    Top = 176
    object DepositTypesID: TFloatField
      FieldName = 'ID'
    end
    object DepositTypesTYPE: TWideStringField
      FieldName = 'TYPE'
      Required = True
      Size = 256
    end
    object DepositTypesADDITIONALTYPE: TWideStringField
      FieldName = 'ADDITIONALTYPE'
      Size = 32
    end
    object DepositTypesWITHDRAWTYPE: TWideStringField
      FieldName = 'WITHDRAWTYPE'
      Size = 32
    end
    object DepositTypesDATEINTERVAL: TIntegerField
      FieldName = 'DATEINTERVAL'
    end
  end
  object TrueCategories: TOracleDataSet
    SQL.Strings = (
      'select t.rowid , t.* from sbcm_truecategories t')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 200
    Top = 352
    object TrueCategoriesCATEGORYID: TFloatField
      FieldName = 'CATEGORYID'
    end
    object TrueCategoriesNAME: TWideStringField
      FieldName = 'NAME'
      Size = 32
    end
    object TrueCategoriesDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 64
    end
  end
  object DataSrcTrueCategories: TDataSource
    DataSet = TrueCategories
    Left = 272
    Top = 360
  end
end
