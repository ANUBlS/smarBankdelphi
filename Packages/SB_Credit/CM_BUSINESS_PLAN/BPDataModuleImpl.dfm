object BPDataModule: TBPDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 603
  Width = 696
  object CreditInfo: TOracleDataSet
    SQL.Strings = (
      'Select '
      '   Name'
      'From '
      '  CM_BOOROWERINFO '
      'Where '
      '   CreditID=:CreditID'
      '   ')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00430052004500440049005400490044000300
      00000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 16
  end
  object DSCreditInfo: TDataSource
    DataSet = CreditInfo
    Left = 104
    Top = 16
  end
  object BPData: TOracleDataSet
    SQL.Strings = (
      'SELECT b.RowID,b.*'
      '  FROM cm_business_plan b'
      'WHERE b.CreditID =:CreditID ')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00430052004500440049005400490044000300
      00000000000000000000}
    Cursor = crSQLWait
    OnApplyRecord = BPDataApplyRecord
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 72
    object BPDataCREDITID: TFloatField
      FieldName = 'CREDITID'
    end
    object BPDataPROJECTCOST: TFloatField
      FieldName = 'PROJECTCOST'
    end
    object BPDataGIVENCREDIT: TFloatField
      FieldName = 'GIVENCREDIT'
    end
    object BPDataCONCESSIONPERIOD: TFloatField
      FieldName = 'CONCESSIONPERIOD'
    end
    object BPDataPURPOSE: TFloatField
      FieldName = 'PURPOSE'
    end
    object BPDataSOURCE: TFloatField
      FieldName = 'SOURCE'
    end
    object BPDataTYPE: TFloatField
      FieldName = 'TYPE'
    end
    object BPDataUNTMEANSOFPRODUCTION: TWideStringField
      FieldName = 'UNTMEANSOFPRODUCTION'
      Size = 10
    end
    object BPDataNUMBEROFPRODUCTION: TFloatField
      FieldName = 'NUMBEROFPRODUCTION'
    end
    object BPDataUNTPRODUCTION: TWideStringField
      FieldName = 'UNTPRODUCTION'
      Size = 10
    end
    object BPDataPRODUCTION: TFloatField
      FieldName = 'PRODUCTION'
    end
    object BPDataPRODUCTIVITY: TFloatField
      FieldName = 'PRODUCTIVITY'
    end
    object BPDataPRODUCTIONCOST: TFloatField
      FieldName = 'PRODUCTIONCOST'
    end
    object BPDataSUMPROFIT: TFloatField
      FieldName = 'SUMPROFIT'
    end
    object BPDataBOUGHTMATERIAL: TFloatField
      FieldName = 'BOUGHTMATERIAL'
    end
    object BPDataOPERATIONEXPENSE: TFloatField
      FieldName = 'OPERATIONEXPENSE'
    end
    object BPDataTAXEXPENSE: TFloatField
      FieldName = 'TAXEXPENSE'
    end
    object BPDataOTHEREXPENCE: TFloatField
      FieldName = 'OTHEREXPENCE'
    end
    object BPDataSUMEXPENSE: TFloatField
      FieldName = 'SUMEXPENSE'
    end
    object BPDataVILLAGEID: TFloatField
      FieldName = 'VILLAGEID'
    end
    object BPDataAKPURPOSE: TFloatField
      FieldName = 'AKPURPOSE'
    end
  end
  object DSBPData: TDataSource
    DataSet = BPData
    Left = 104
    Top = 72
  end
  object BPPurposes: TOracleDataSet
    SQL.Strings = (
      'SELECT id, purposedesc'
      '  FROM cm_bp_purposes')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 136
  end
  object DSBPPurposes: TDataSource
    DataSet = BPPurposes
    Left = 104
    Top = 136
  end
  object BPTypes: TOracleDataSet
    SQL.Strings = (
      'SELECT id, typedesc'
      '  FROM cm_bp_types')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 192
  end
  object DSBPTypes: TDataSource
    DataSet = BPTypes
    Left = 104
    Top = 192
  end
  object CM_CREDIT: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CM_CREDIT'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Left = 264
    Top = 104
  end
  object DistrictsDataSet: TOracleDataSet
    Tag = 20
    SQL.Strings = (
      'SELECT id, name, name_eng'
      '  FROM agro_region')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 264
  end
  object VillagesDataSet: TOracleDataSet
    Tag = 21
    SQL.Strings = (
      'SELECT id, name, depend_id'
      '  FROM agro_village'
      ''
      'where depend_id = :depend_id')
    Optimize = False
    Variables.Data = {
      0400000001000000140000003A0044004500500045004E0044005F0049004400
      040000000000000000000000}
    Master = DistrictsDataSet
    MasterFields = 'ID'
    DetailFields = 'DEPEND_ID'
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 320
  end
  object AKTargetsDataSet: TOracleDataSet
    Tag = 20
    SQL.Strings = (
      'SELECT id, name, name_eng'
      '  FROM agro_kredit_target')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 384
  end
  object AKPurposesDataSet: TOracleDataSet
    Tag = 21
    SQL.Strings = (
      'SELECT id, name, depend_id'
      '  FROM agro_kredit_purpose'
      ''
      'where depend_id = :depend_id')
    Optimize = False
    Variables.Data = {
      0400000001000000140000003A0044004500500045004E0044005F0049004400
      040000000000000000000000}
    Master = AKTargetsDataSet
    MasterFields = 'ID'
    DetailFields = 'DEPEND_ID'
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 440
  end
  object DistrictsDataSrc: TDataSource
    DataSet = DistrictsDataSet
    Left = 120
    Top = 264
  end
  object VillagesDataSrc: TDataSource
    DataSet = VillagesDataSet
    Left = 120
    Top = 320
  end
  object AKTargetsDataSrc: TDataSource
    DataSet = AKTargetsDataSet
    Left = 128
    Top = 384
  end
  object AKPurposesDataSrc: TDataSource
    DataSet = AKPurposesDataSet
    Left = 128
    Top = 440
  end
  object CM_AKF: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CM_AKF'
    Left = 264
    Top = 176
  end
  object PortInf: TOracleDataSet
    Tag = 20
    SQL.Strings = (
      'SELECT p.ID creditid'
      '     , p.creditlineamount'
      '     , p.numberofcredit'
      '     , u.id projectid'
      '     , u.description project'
      '     , d.NAME district'
      '     , v.NAME village'
      '  FROM cm_business_plan b'
      '     , cm_portfolio p'
      '     , agro_village v'
      '     , agro_region d'
      '     , cm_usergroups u'
      ' WHERE (b.creditid = p.ID)'
      '   AND (b.villageid = v.ID)'
      '   AND (v.depend_id = d.ID)'
      '   AND (p.usrgroup = u.ID)'
      '   AND creditid = :creditid')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00430052004500440049005400490044000300
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000007000000100000004300520045004400490054004900440001000000
      0000200000004300520045004400490054004C0049004E00450041004D004F00
      55004E0054000100000000001C0000004E0055004D004200450052004F004600
      43005200450044004900540001000000000012000000500052004F004A004500
      43005400490044000100000000000E000000500052004F004A00450043005400
      0100000000001000000044004900530054005200490043005400010000000000
      0E000000560049004C004C00410047004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 216
    Top = 48
    object PortInfCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object PortInfCREDITLINEAMOUNT: TFloatField
      FieldName = 'CREDITLINEAMOUNT'
      Required = True
    end
    object PortInfPROJECTID: TFloatField
      FieldName = 'PROJECTID'
      Required = True
    end
    object PortInfPROJECT: TWideStringField
      FieldName = 'PROJECT'
      Size = 64
    end
    object PortInfDISTRICT: TWideStringField
      FieldName = 'DISTRICT'
      Size = 128
    end
    object PortInfVILLAGE: TWideStringField
      FieldName = 'VILLAGE'
      Size = 128
    end
    object PortInfNUMBEROFCREDIT: TWideStringField
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
  end
  object PortInfSrc: TDataSource
    DataSet = PortInf
    Left = 264
    Top = 40
  end
  object BPSources: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      '  FROM cm_bp_sources'
      ''
      'where purpid = :purpid')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A00500055005200500049004400040000000000
      000000000000}
    Cursor = crSQLWait
    Master = BPPurposes
    MasterFields = 'ID'
    DetailFields = 'PURPID'
    Session = sboapiDataModule.SBSession
    Left = 264
    Top = 352
  end
  object DSBPSources: TDataSource
    DataSet = BPSources
    Left = 328
    Top = 352
  end
end
