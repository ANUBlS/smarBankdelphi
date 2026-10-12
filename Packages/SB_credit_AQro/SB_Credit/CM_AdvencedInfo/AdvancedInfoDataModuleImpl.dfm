object AdvInfoDataModule: TAdvInfoDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 192
  Top = 107
  Height = 480
  Width = 696
  object AddInfo: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   D.ROWID,'
      '   D.ID , '
      '   D.CURRENCY , '
      '   C.DESCRIPTION , '
      '   A.BOOROWERID , '
      '   A.NAME , '
      '   A.COUNTRYCODE , '
      '   A.BANKRUPTEYSTATUS , '
      '   A.PHONENUMBER , '
      '   A.ADDRESS , '
      '   A.FIRSTOWNERID ,'
      '   A.FIRSTOWNERNAME , '
      '   A.SECONDOWNERID , '
      '   A.SECONDOWNERNAME , '
      '   A.THIRDOWNERID , A.THIRDOWNERNAME ,'
      '   B.PLEDGENAME , '
      '   B.HOLDERNAME , '
      '   B.HOLDERADDRESS , '
      '   B.ANYINFOTODISTING , '
      '   B.REGISTRYNO ,'
      '   B.REGISTRYAGENCY , '
      '   B.REGISTRYDATE , '
      '   B.PLEDGEINUSE , '
      '   B.PLEDGEINSURANT , '
      '   B.INSURANCEAGENCY ,'
      '   B.INSURANCEAMOUNT , '
      '   B.INSURANCEDATE , '
      '   B.PLEDGEID , '
      '   E.VAL_NAME'
      'FROM'
      '   CM_ACTIVE_CREDITS D'
      ' , CM_PLEDGES C'
      ' , CM_BOOROWERINFO A'
      ' , CM_GUARANTEE B'
      ' , SB_AVALUTE E'
      'WHERE'
      '     (D.ID =:CREDITID) '
      ' AND (D.ID = B.CREDITID)'
      ' AND (D.ID = A.CREDITID)'
      ' AND (B.PLEDGEID = C.ID)'
      ' AND (E.VALUTE = D.CURRENCY)'
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000090000003A43524544495449440300000000000000000000
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
    Cursor = crSQLWait
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    OnApplyRecord = AddInfoApplyRecord
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 56
    Top = 88
    object AddInfoID: TFloatField
      FieldName = 'ID'
      ReadOnly = True
    end
    object AddInfoCURRENCY: TFloatField
      FieldName = 'CURRENCY'
      ReadOnly = True
    end
    object AddInfoBOOROWERID: TStringField
      DisplayWidth = 32
      FieldName = 'BOOROWERID'
      Size = 32
    end
    object AddInfoNAME: TStringField
      FieldName = 'NAME'
      ReadOnly = True
      Size = 64
    end
    object AddInfoCOUNTRYCODE: TStringField
      FieldName = 'COUNTRYCODE'
      Size = 8
    end
    object AddInfoPHONENUMBER: TStringField
      FieldName = 'PHONENUMBER'
      Size = 16
    end
    object AddInfoADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 128
    end
    object AddInfoFIRSTOWNERID: TStringField
      DisplayWidth = 32
      FieldName = 'FIRSTOWNERID'
      Size = 32
    end
    object AddInfoFIRSTOWNERNAME: TStringField
      FieldName = 'FIRSTOWNERNAME'
      Size = 64
    end
    object AddInfoSECONDOWNERID: TStringField
      DisplayWidth = 32
      FieldName = 'SECONDOWNERID'
      Size = 32
    end
    object AddInfoSECONDOWNERNAME: TStringField
      FieldName = 'SECONDOWNERNAME'
      Size = 64
    end
    object AddInfoTHIRDOWNERID: TStringField
      DisplayWidth = 32
      FieldName = 'THIRDOWNERID'
      Size = 32
    end
    object AddInfoTHIRDOWNERNAME: TStringField
      FieldName = 'THIRDOWNERNAME'
      Size = 64
    end
    object AddInfoDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 64
    end
    object AddInfoPLEDGEID: TFloatField
      FieldName = 'PLEDGEID'
    end
    object AddInfoPLEDGENAME: TStringField
      FieldName = 'PLEDGENAME'
      Size = 128
    end
    object AddInfoHOLDERNAME: TStringField
      FieldName = 'HOLDERNAME'
      Size = 128
    end
    object AddInfoPLEDGEINUSE: TFloatField
      FieldName = 'PLEDGEINUSE'
    end
    object AddInfoHOLDERADDRESS: TStringField
      FieldName = 'HOLDERADDRESS'
      Size = 128
    end
    object AddInfoANYINFOTODISTING: TStringField
      FieldName = 'ANYINFOTODISTING'
      Size = 128
    end
    object AddInfoREGISTRYNO: TStringField
      FieldName = 'REGISTRYNO'
      Size = 32
    end
    object AddInfoREGISTRYAGENCY: TStringField
      FieldName = 'REGISTRYAGENCY'
      Size = 64
    end
    object AddInfoREGISTRYDATE: TDateTimeField
      FieldName = 'REGISTRYDATE'
    end
    object AddInfoPLEDGEINSURANT: TFloatField
      FieldName = 'PLEDGEINSURANT'
    end
    object AddInfoINSURANCEAGENCY: TStringField
      FieldName = 'INSURANCEAGENCY'
      Size = 128
    end
    object AddInfoINSURANCEAMOUNT: TFloatField
      FieldName = 'INSURANCEAMOUNT'
    end
    object AddInfoINSURANCEDATE: TDateTimeField
      FieldName = 'INSURANCEDATE'
    end
    object AddInfoVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object AddInfoBANKRUPTEYSTATUS: TFloatField
      FieldName = 'BANKRUPTEYSTATUS'
    end
  end
  object DataSrcAddInfo: TDataSource
    DataSet = AddInfo
    Left = 56
    Top = 32
  end
  object Countrys: TOracleDataSet
    SQL.Strings = (
      'SELECT code, name'
      '  FROM cm_countrys')
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
    Cursor = crSQLWait
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
    Left = 160
    Top = 56
  end
  object DataSrcContrys: TDataSource
    DataSet = Countrys
    Left = 176
    Top = 112
  end
  object AddInfoPackage: TOraclePackage
    Session = CMDataModule.CMSession
    Debug = False
    PackageName = 'CM_CREDIT'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Optimize = True
    Left = 88
    Top = 176
  end
end
