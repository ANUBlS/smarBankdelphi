object DModule: TDModule
  OldCreateOrder = False
  Left = 192
  Top = 114
  Height = 505
  Width = 779
  object Ins_MotorFullData: TDataSource
    DataSet = Ins_MotorFull
    Left = 32
    Top = 80
  end
  object Ins_MotorFull: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select im.rowid,im.* from ins_motorfull im where im.cid=:cid')
    Variables.Data = {0300000001000000040000003A434944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001B000000020000004944010000000000060000004B4C495F49440100
      000000000E000000434F4E544143545F504552534F4E0100000000000F000000
      42414E4B494E475F44455441494C530100000000000C000000494E5355524544
      4D4F44454C0100000000000B000000494E535552454454595045010000000000
      0F000000494E535552454453544154454E554D0100000000000C000000494E53
      55524544434F4C4F5201000000000011000000494E53555245444F5554505554
      594541520100000000000F000000494E53555245444E554D5345415453010000
      00000010000000494E5355524544454E47494E454E554D010000000000110000
      00494E5355524544434841535349534E554D01000000000012000000494E5355
      52454441435455414C56414C5545010000000000110000005452414E534D4953
      53494F4E5F545950450100000000000E00000050524553454E43455F414C4152
      4D0100000000000B0000004D4F544F525F555341474501000000000011000000
      4D4F544F5253544F52414745504C4143450100000000000E0000004558495354
      494E4744414D4147450100000000001A000000494E535552414E434547454F47
      524150484943414C4C494D49540100000000000600000042524F4B4552010000
      0000000B000000494E5355524544424F44590100000000000600000054595045
      49440100000000000800000050524F46495449440100000000000C000000434C
      4F53455F5052454649580100000000000B000000494E53555245444D41524B01
      0000000000080000004D4F4E54485F4944010000000000030000004349440100
      00000000}
    CountAllRecords = True
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 120
    Top = 80
    object Ins_MotorFullID: TFloatField
      FieldName = 'ID'
    end
    object Ins_MotorFullKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object Ins_MotorFullBANKING_DETAILS: TStringField
      FieldName = 'BANKING_DETAILS'
      Size = 32
    end
    object Ins_MotorFullINSUREDMODEL: TStringField
      FieldName = 'INSUREDMODEL'
      Size = 32
    end
    object Ins_MotorFullINSUREDSTATENUM: TStringField
      FieldName = 'INSUREDSTATENUM'
      Size = 32
    end
    object Ins_MotorFullINSUREDCOLOR: TStringField
      FieldName = 'INSUREDCOLOR'
      Size = 32
    end
    object Ins_MotorFullINSUREDOUTPUTYEAR: TIntegerField
      FieldName = 'INSUREDOUTPUTYEAR'
    end
    object Ins_MotorFullINSUREDNUMSEATS: TIntegerField
      FieldName = 'INSUREDNUMSEATS'
    end
    object Ins_MotorFullINSUREDENGINENUM: TStringField
      FieldName = 'INSUREDENGINENUM'
      Size = 32
    end
    object Ins_MotorFullINSUREDCHASSISNUM: TStringField
      FieldName = 'INSUREDCHASSISNUM'
      Size = 32
    end
    object Ins_MotorFullINSUREDACTUALVALUE: TFloatField
      FieldName = 'INSUREDACTUALVALUE'
    end
    object Ins_MotorFullTRANSMISSION_TYPE: TStringField
      FieldName = 'TRANSMISSION_TYPE'
      Size = 128
    end
    object Ins_MotorFullPRESENCE_ALARM: TStringField
      FieldName = 'PRESENCE_ALARM'
      Size = 32
    end
    object Ins_MotorFullMOTOR_USAGE: TStringField
      FieldName = 'MOTOR_USAGE'
      Size = 128
    end
    object Ins_MotorFullMOTORSTORAGEPLACE: TStringField
      FieldName = 'MOTORSTORAGEPLACE'
      Size = 128
    end
    object Ins_MotorFullEXISTINGDAMAGE: TStringField
      FieldName = 'EXISTINGDAMAGE'
      Size = 128
    end
    object Ins_MotorFullINSURANCEGEOGRAPHICALLIMIT: TStringField
      FieldName = 'INSURANCEGEOGRAPHICALLIMIT'
      Size = 128
    end
    object Ins_MotorFullBROKER: TFloatField
      FieldName = 'BROKER'
    end
    object Ins_MotorFullINSUREDBODY: TStringField
      FieldName = 'INSUREDBODY'
      Size = 32
    end
    object Ins_MotorFullTYPEID: TIntegerField
      FieldName = 'TYPEID'
    end
    object Ins_MotorFullPROFITID: TFloatField
      FieldName = 'PROFITID'
    end
    object Ins_MotorFullINSUREDTYPE: TFloatField
      FieldName = 'INSUREDTYPE'
    end
    object Ins_MotorFullINSUREDMARK: TStringField
      FieldName = 'INSUREDMARK'
      Size = 32
    end
    object Ins_MotorFullCONTACT_PERSON: TStringField
      FieldName = 'CONTACT_PERSON'
      Size = 128
    end
    object Ins_MotorFullCLOSE_PREFIX: TIntegerField
      FieldName = 'CLOSE_PREFIX'
    end
    object Ins_MotorFullMONTH_ID: TFloatField
      FieldName = 'MONTH_ID'
    end
    object Ins_MotorFullCID: TFloatField
      FieldName = 'CID'
      Required = True
    end
  end
  object MoreReportData: TDataSource
    DataSet = More_Report
    Left = 32
    Top = 8
  end
  object More_Report: TOracleDataSet
    SQL.Strings = (
      
        'select id,full_id,name||'#39'  '#39'||surname||'#39'  '#39'||fathername as name,' +
        'age,experience,history from INS_MOTORMORETHANONEDRIVER where ful' +
        'l_id = :full_id'
      '')
    Variables.Data = {
      0300000001000000080000003A46554C4C5F4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000040000004E414D4501000000000002000000494401000000
      00000700000046554C4C5F49440100000000000A000000455850455249454E43
      4501000000000007000000484953544F52590100000000000300000041474501
      0000000000}
    MasterFields = 'ID'
    DetailFields = 'Full_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 112
    Top = 8
    object More_ReportID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object More_ReportFULL_ID: TFloatField
      FieldName = 'FULL_ID'
    end
    object More_ReportNAME: TStringField
      FieldName = 'NAME'
      Size = 388
    end
    object More_ReportEXPERIENCE: TStringField
      FieldName = 'EXPERIENCE'
      Size = 128
    end
    object More_ReportHISTORY: TStringField
      FieldName = 'HISTORY'
      Size = 1024
    end
    object More_ReportAGE: TIntegerField
      FieldName = 'AGE'
    end
  end
  object Accesories: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select im.rowid,im.* from ins_motor_accesories im'
      ''
      'where full_id = :full_id')
    Variables.Data = {
      0300000001000000080000003A46554C4C5F4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000020000004944010000000000040000005459504501000000
      0000040000004D414B450100000000000500000056414C55450100000000000A
      000000484F57435245415445440100000000000700000046554C4C5F49440100
      00000000}
    Master = Ins_MotorFull
    MasterFields = 'Id'
    DetailFields = 'full_id'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 96
    Top = 144
    object AccesoriesID: TFloatField
      FieldName = 'ID'
    end
    object AccesoriesTYPE: TStringField
      FieldName = 'TYPE'
      Size = 32
    end
    object AccesoriesMAKE: TStringField
      FieldName = 'MAKE'
      Size = 32
    end
    object AccesoriesVALUE: TFloatField
      FieldName = 'VALUE'
    end
    object AccesoriesHOWCREATED: TStringField
      FieldName = 'HOWCREATED'
      Size = 32
    end
    object AccesoriesFULL_ID: TFloatField
      FieldName = 'FULL_ID'
    end
  end
  object AccesoriesData: TDataSource
    DataSet = Accesories
    Left = 24
    Top = 144
  end
  object CustomersData: TDataSource
    DataSet = Customers
    Left = 200
    Top = 8
  end
  object Customers: TOracleDataSet
    SQL.Strings = (
      
        'select c.rowid,c.id,c.name||'#39' '#39'||c.surname||'#39' '#39'||c.fathername as' +
        ' name,c.address,c.mobilephone,c.fax,c.contactperson from ins_cus' +
        'tomers c')
    QBEDefinition.QBEFieldDefs = {
      0400000006000000020000004944010000000000040000004E414D4501000000
      00000B0000004D4F42494C4550484F4E45010000000000070000004144445245
      5353010000000000030000004641580100000000000D000000434F4E54414354
      504552534F4E010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 288
    Top = 8
    object CustomersID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object CustomersNAME: TStringField
      FieldName = 'NAME'
      Size = 386
    end
    object CustomersADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 1024
    end
    object CustomersMOBILEPHONE: TStringField
      FieldName = 'MOBILEPHONE'
      Size = 32
    end
    object CustomersFAX: TStringField
      FieldName = 'FAX'
      Size = 32
    end
    object CustomersCONTACTPERSON: TStringField
      FieldName = 'CONTACTPERSON'
      Size = 256
    end
  end
  object PINS_FULLMOTOR: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'PINS_FULLMOTOR'
    ParameterMode = pmNamed
    Left = 392
    Top = 16
  end
  object SuggestionData: TDataSource
    DataSet = Suggestion
    Left = 206
    Top = 72
  end
  object Suggestion: TOracleDataSet
    SQL.Strings = (
      'select  s.rowid,s.* from ins_mf_suggestion s'
      'where mk_id = :mk_id')
    Variables.Data = {0300000001000000060000003A4D4B5F4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A000000020000004944010000000000050000004D4B5F4944010000
      0000000B0000005249534B4144445245535301000000000010000000494E5355
      52414E4345414D4D4F554E5401000000000007000000454E4444415445010000
      0000000600000052534B5F49440100000000000600000046525A5F4944010000
      00000007000000434E44545F49440100000000000600000056414C5F49440100
      000000000C000000494E535552414E434553554D010000000000}
    Master = Ins_MotorFull
    MasterFields = 'ID'
    DetailFields = 'MK_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 296
    Top = 72
    object SuggestionID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object SuggestionMK_ID: TFloatField
      FieldName = 'MK_ID'
      Required = True
    end
    object SuggestionRISKADDRESS: TStringField
      FieldName = 'RISKADDRESS'
      Size = 1024
    end
    object SuggestionINSURANCEAMMOUNT: TFloatField
      FieldName = 'INSURANCEAMMOUNT'
    end
    object SuggestionENDDATE: TDateTimeField
      FieldName = 'ENDDATE'
    end
    object SuggestionRSK_ID: TFloatField
      FieldName = 'RSK_ID'
      Required = True
    end
    object SuggestionFRZ_ID: TFloatField
      FieldName = 'FRZ_ID'
      Required = True
    end
    object SuggestionCNDT_ID: TFloatField
      FieldName = 'CNDT_ID'
      Required = True
    end
    object SuggestionVAL_ID: TFloatField
      FieldName = 'VAL_ID'
    end
    object SuggestionINSURANCESUM: TFloatField
      FieldName = 'INSURANCESUM'
    end
  end
  object BeneficiarySource: TDataSource
    DataSet = ODSBeneficiary
    Left = 32
    Top = 216
  end
  object ODSBeneficiary: TOracleDataSet
    SQL.Strings = (
      'select ib.rowid,ib.* from ins_beneficiary ib')
    QBEDefinition.QBEFieldDefs = {
      0400000005000000020000004944010000000000040000004E414D4501000000
      000007000000414444524553530100000000000500000050484F4E4501000000
      00000F00000042414E4B494E475F44455441494C53010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 128
    Top = 216
    object ODSBeneficiaryID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSBeneficiaryNAME: TStringField
      FieldName = 'NAME'
      Size = 128
    end
    object ODSBeneficiaryADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 128
    end
    object ODSBeneficiaryPHONE: TStringField
      FieldName = 'PHONE'
      Size = 64
    end
    object ODSBeneficiaryBANKING_DETAILS: TStringField
      FieldName = 'BANKING_DETAILS'
      Size = 128
    end
  end
  object ODSContracts: TOracleDataSet
    SQL.Strings = (
      'select ic.rowid, ic.* from ins_contracts ic'
      'where ic.id = :cid'
      'and type_id = 4')
    Variables.Data = {0300000001000000040000003A434944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001100000002000000494401000000000007000000545950455F494401
      000000000008000000494E535F444154450100000000000A000000424547494E
      5F4441544501000000000008000000454E445F44415445010000000000090000
      0056414C5554455F494401000000000007000000414D4D4F554E540100000000
      000C000000434C4F53455F505245464958010000000000060000004B4C495F49
      440100000000000A0000004C4F414E4143435F49440100000000000A00000043
      5552524143435F49440100000000000A000000504F4C4943595F4E554D010000
      00000007000000494E5353554D4D010000000000080000004652414E5348495A
      0100000000000600000054415249464601000000000005000000535441544501
      0000000000080000004147454E545F4944010000000000}
    Session = sboapiDataModule.SBSession
    AfterInsert = ODSContractsAfterInsert
    Left = 240
    Top = 136
    object ODSContractsID: TFloatField
      FieldName = 'ID'
    end
    object ODSContractsTYPE_ID: TFloatField
      FieldName = 'TYPE_ID'
    end
    object ODSContractsINS_DATE: TDateTimeField
      FieldName = 'INS_DATE'
    end
    object ODSContractsBEGIN_DATE: TDateTimeField
      FieldName = 'BEGIN_DATE'
    end
    object ODSContractsEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
    object ODSContractsVALUTE_ID: TFloatField
      FieldName = 'VALUTE_ID'
    end
    object ODSContractsAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSContractsCLOSE_PREFIX: TIntegerField
      FieldName = 'CLOSE_PREFIX'
    end
    object ODSContractsKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object ODSContractsLOANACC_ID: TFloatField
      FieldName = 'LOANACC_ID'
    end
    object ODSContractsCURRACC_ID: TFloatField
      FieldName = 'CURRACC_ID'
    end
    object ODSContractsPOLICY_NUM: TStringField
      FieldName = 'POLICY_NUM'
      Size = 128
    end
    object ODSContractsINSSUMM: TFloatField
      FieldName = 'INSSUMM'
    end
    object ODSContractsFRANSHIZ: TFloatField
      FieldName = 'FRANSHIZ'
    end
    object ODSContractsTARIFF: TFloatField
      FieldName = 'TARIFF'
    end
    object ODSContractsSTATE: TIntegerField
      FieldName = 'STATE'
    end
    object ODSContractsAGENT_ID: TFloatField
      FieldName = 'AGENT_ID'
    end
  end
  object DSContracts: TDataSource
    DataSet = ODSContracts
    Left = 168
    Top = 133
  end
  object AgentsSource: TDataSource
    DataSet = ODSAgents
    Left = 25
    Top = 280
  end
  object ODSAgents: TOracleDataSet
    SQL.Strings = (
      
        'select a.id,a.name||'#39' '#39'||a.surname||'#39' '#39'||a.fathername as name fr' +
        'om ins_agents a')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000040000004E414D4501000000000002000000494401000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 121
    Top = 280
    object ODSAgentsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSAgentsNAME: TStringField
      FieldName = 'NAME'
      Size = 386
    end
  end
  object OPCOMMON: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_COMMON'
    Left = 394
    Top = 74
  end
  object MoreThanOne: TOracleDataSet
    SQL.Strings = (
      'select im.rowid,im.* from INS_MOTORMORETHANONEDRIVER im'
      ''
      'where full_id = :full_id')
    Variables.Data = {
      0300000001000000080000003A46554C4C5F4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000008000000020000004944010000000000040000004E414D4501000000
      0000070000005355524E414D450100000000000A0000004641544845524E414D
      45010000000000030000004147450100000000000A000000455850455249454E
      43450100000000000700000046554C4C5F494401000000000007000000484953
      544F5259010000000000}
    Master = Ins_MotorFull
    MasterFields = 'ID'
    DetailFields = 'FULL_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 424
    Top = 136
    object MoreThanOneID: TFloatField
      FieldName = 'ID'
    end
    object MoreThanOneNAME: TStringField
      FieldName = 'NAME'
      Size = 128
    end
    object MoreThanOneSURNAME: TStringField
      FieldName = 'SURNAME'
      Size = 128
    end
    object MoreThanOneFATHERNAME: TStringField
      FieldName = 'FATHERNAME'
      Size = 128
    end
    object MoreThanOneAGE: TIntegerField
      FieldName = 'AGE'
    end
    object MoreThanOneEXPERIENCE: TStringField
      FieldName = 'EXPERIENCE'
      Size = 128
    end
    object MoreThanOneFULL_ID: TFloatField
      FieldName = 'FULL_ID'
    end
    object MoreThanOneHISTORY: TStringField
      FieldName = 'HISTORY'
      Size = 1024
    end
  end
  object MoreThanOneData: TDataSource
    DataSet = MoreThanOne
    Left = 328
    Top = 136
  end
  object DSAutoTypes: TDataSource
    DataSet = ODSAutoTypes
    Left = 24
    Top = 336
  end
  object ODSAutoTypes: TOracleDataSet
    SQL.Strings = (
      'select at.rowid,at.* from ins_dict_auto_types at')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 112
    Top = 336
    object ODSAutoTypesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSAutoTypesNAME: TStringField
      FieldName = 'NAME'
      Size = 32
    end
  end
  object ODSMarks: TOracleDataSet
    SQL.Strings = (
      'Select * from ins_dict_marks'
      'order by name')
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000040000004E414D4501000000
      00000800000053544154455F49440100000000000B00000043414C434F505449
      4F4E53010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 299
    Top = 202
    object ODSMarksID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSMarksNAME: TStringField
      FieldName = 'NAME'
      Size = 256
    end
    object ODSMarksSTATE_ID: TFloatField
      FieldName = 'STATE_ID'
    end
    object ODSMarksCALCOPTIONS: TIntegerField
      FieldName = 'CALCOPTIONS'
    end
  end
  object DSMarks: TDataSource
    DataSet = ODSMarks
    Left = 227
    Top = 202
  end
  object DSModels: TDataSource
    DataSet = ODSModels
    Left = 371
    Top = 202
  end
  object ODSModels: TOracleDataSet
    SQL.Strings = (
      'select * from ins_dict_models'
      ''
      'where mark_id = :mark_id'
      'order by name')
    Variables.Data = {
      0300000001000000080000003A4D41524B5F4944040000000800000000000000
      0040544000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000040000004E414D4501000000
      0000070000004D41524B5F49440100000000000B00000043414C434F5054494F
      4E53010000000000}
    Master = ODSMarks
    MasterFields = 'ID'
    DetailFields = 'MARK_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 435
    Top = 202
    object ODSModelsID: TFloatField
      FieldName = 'ID'
    end
    object ODSModelsNAME: TStringField
      FieldName = 'NAME'
      Size = 256
    end
    object ODSModelsMARK_ID: TFloatField
      FieldName = 'MARK_ID'
    end
    object ODSModelsCALCOPTIONS: TIntegerField
      FieldName = 'CALCOPTIONS'
    end
  end
  object ODSFranshiz: TOracleDataSet
    SQL.Strings = (
      'select itf.ammount as franshiz, it.ammount as tariff'
      '  from ins_tarif_franshiz itf, ins_tariffs it'
      'where itf.month_id = :month_id'
      'and '
      '  it.franshiz_id = itf.id'
      'order by itf.ammount')
    Variables.Data = {
      0300000001000000090000003A4D4F4E54485F49440400000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      0400000002000000080000004652414E5348495A010000000000060000005441
      52494646010000000000}
    Master = ODSMonths
    MasterFields = 'ID'
    DetailFields = 'MONTH_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 291
    Top = 269
    object ODSFranshizFRANSHIZ: TFloatField
      FieldName = 'FRANSHIZ'
    end
    object ODSFranshizTARIFF: TFloatField
      FieldName = 'TARIFF'
    end
  end
  object ODSMonths: TOracleDataSet
    SQL.Strings = (
      'select * from ins_tarif_months'
      ''
      'where release_id = :release_id')
    Variables.Data = {
      03000000010000000B0000003A52454C454153455F4944040000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000200000049440100000000000A00000052454C454153455F
      494401000000000005000000434F554E54010000000000}
    Master = ODSReliaseDates
    MasterFields = 'ID'
    DetailFields = 'RELEASE_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 443
    Top = 269
    object ODSMonthsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSMonthsRELEASE_ID: TFloatField
      FieldName = 'RELEASE_ID'
    end
    object ODSMonthsCOUNT: TFloatField
      FieldName = 'COUNT'
    end
  end
  object DSFranshiz: TDataSource
    DataSet = ODSFranshiz
    Left = 211
    Top = 269
  end
  object DSMonths: TDataSource
    DataSet = ODSMonths
    Left = 371
    Top = 269
  end
  object ODSReliaseDates: TOracleDataSet
    SQL.Strings = (
      'select * from ins_release_date'
      'where to_number(to_char(begindate, '#39'YYYY'#39')) <= :releaseyear'
      'and to_number(to_char(enddate, '#39'YYYY'#39')) >= :releaseyear'
      'and state_id in (select its.id from ins_tarif_states its'
      '                  where its.state_id = :state )')
    Variables.Data = {
      03000000020000000C0000003A52454C45415345594541520300000000000000
      00000000060000003A5354415445030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000002000000494401000000000009000000424547494E444154
      4501000000000007000000454E44444154450100000000000800000053544154
      455F4944010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 299
    Top = 341
    object ODSReliaseDatesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSReliaseDatesBEGINDATE: TDateTimeField
      FieldName = 'BEGINDATE'
    end
    object ODSReliaseDatesENDDATE: TDateTimeField
      FieldName = 'ENDDATE'
    end
    object ODSReliaseDatesSTATE_ID: TFloatField
      FieldName = 'STATE_ID'
    end
  end
  object ODSAvalute: TOracleDataSet
    SQL.Strings = (
      'select valute, val_name, valu_name, valu_short from avalute'
      'order by valute')
    QBEDefinition.QBEFieldDefs = {
      04000000040000000600000056414C5554450100000000000800000056414C5F
      4E414D450100000000000900000056414C555F4E414D450100000000000A0000
      0056414C555F53484F5254010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 512
    Top = 152
    object ODSAvaluteVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object ODSAvaluteVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object ODSAvaluteVALU_NAME: TStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
    object ODSAvaluteVALU_SHORT: TStringField
      FieldName = 'VALU_SHORT'
      Size = 10
    end
  end
  object DSAvalute: TDataSource
    DataSet = ODSAvalute
    Left = 512
    Top = 93
  end
end
