object DataModuleFullMotor: TDataModuleFullMotor
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 594
  Width = 758
  object Ins_MotorFullData: TDataSource
    DataSet = Ins_MotorFull
    Left = 32
    Top = 8
  end
  object Ins_MotorFull: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      
        'select /*+ index(ins_motorfull INS_IDX_FULL) */im.rowid,im.* fro' +
        'm ins_motorfull im WHERE CLOSE_PREFIX=0 ORDER BY  :title'
      '')
    Variables.Data = {
      0300000001000000060000003A5449544C4501000000070000006B6C695F6964
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000018000000020000004944010000000000060000004B4C495F49440100
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
      4F53455F505245464958010000000000}
    CountAllRecords = True
    OnApplyRecord = Ins_MotorFullApplyRecord
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 120
    Top = 8
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
    object Ins_MotorFullPROFITID: TFloatField
      FieldName = 'PROFITID'
    end
    object Ins_MotorFullINSUREDMODEL: TStringField
      FieldName = 'INSUREDMODEL'
      Required = True
      Size = 32
    end
    object Ins_MotorFullINSUREDTYPE: TStringField
      FieldName = 'INSUREDTYPE'
      Size = 128
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
    object Ins_MotorFullCLOSE_PREFIX: TIntegerField
      FieldName = 'CLOSE_PREFIX'
    end
  end
  object Accesories: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select im.rowid,im.* from ins_motor_accesories im'
      ''
      'where full_id = :full_id')
    Variables.Data = {
      0300000001000000080000003A46554C4C5F4944040000000800000000000000
      0074A24000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000020000004944010000000000040000005459504501000000
      0000040000004D414B450100000000000500000056414C55450100000000000A
      000000484F57435245415445440100000000000700000046554C4C5F49440100
      00000000}
    Master = Ins_MotorFull
    MasterFields = 'ID'
    DetailFields = 'FULL_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 192
    Top = 8
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
    Left = 264
    Top = 8
  end
  object MoreThanOneData: TDataSource
    DataSet = MoreThanOne
    Left = 32
    Top = 56
  end
  object MoreThanOne: TOracleDataSet
    SQL.Strings = (
      'select im.rowid,im.* from INS_MOTORMORETHANONEDRIVER im'
      ''
      'where full_id = :full_id')
    Variables.Data = {
      0300000001000000080000003A46554C4C5F4944040000000800000000000000
      0074A24000000000}
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
    Left = 128
    Top = 56
    object MoreThanOneID: TFloatField
      FieldName = 'ID'
    end
    object MoreThanOneNAME2: TStringField
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
  object PINS_FULLMOTOR: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'PINS_FULLMOTOR'
    ParameterMode = pmNamed
    Left = 16
    Top = 232
  end
  object CustomersData: TDataSource
    DataSet = Customers
    Left = 264
    Top = 56
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
    Left = 200
    Top = 56
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
  object Ins_ReportData: TDataSource
    DataSet = Ins_Report
    Left = 16
    Top = 112
  end
  object Ins_Report: TOracleDataSet
    SQL.Strings = (
      
        'select id, PINS_FullMotor.returnName(kli_id) as name,Pins_FullMo' +
        'tor.returnAddress(kli_id) as Address,Pins_FullMotor.returnPhone(' +
        'kli_id) as phone,pins_fullmotor.returnFax(kli_id) as fax,contact' +
        '_person, banking_details,'
      '       profitid,insuredmodel,insuredtype,'
      '       insuredstatenum, insuredcolor,insuredoutputyear,'
      '      insurednumseats,insuredenginenum,insuredchassisnum,'
      '      insuredactualvalue,transmission_type,presence_alarm,'
      
        '      motor_usage,motorstorageplace,existingdamage,insurancegeog' +
        'raphicallimit'
      ' from ins_motorfull'
      '')
    QBEDefinition.QBEFieldDefs = {
      0400000017000000020000004944010000000000040000004E414D4501000000
      00000E000000434F4E544143545F504552534F4E0100000000000F0000004241
      4E4B494E475F44455441494C530100000000000C000000494E53555245444D4F
      44454C0100000000000B000000494E5355524544545950450100000000000F00
      0000494E535552454453544154454E554D0100000000000C000000494E535552
      4544434F4C4F5201000000000011000000494E53555245444F55545055545945
      41520100000000000F000000494E53555245444E554D53454154530100000000
      0010000000494E5355524544454E47494E454E554D0100000000001100000049
      4E5355524544434841535349534E554D01000000000012000000494E53555245
      4441435455414C56414C5545010000000000110000005452414E534D49535349
      4F4E5F545950450100000000000E00000050524553454E43455F414C41524D01
      00000000000B0000004D4F544F525F5553414745010000000000110000004D4F
      544F5253544F52414745504C4143450100000000000E0000004558495354494E
      4744414D4147450100000000001A000000494E535552414E434547454F475241
      50484943414C4C494D49540100000000000500000050484F4E45010000000000
      0300000046415801000000000007000000414444524553530100000000000800
      000050524F4649544944010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 96
    Top = 112
    object Ins_ReportID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object Ins_ReportNAME: TStringField
      FieldName = 'NAME'
      Size = 4000
    end
    object Ins_ReportADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 4000
    end
    object Ins_ReportPHONE: TStringField
      FieldName = 'PHONE'
      Size = 4000
    end
    object Ins_ReportFAX: TStringField
      FieldName = 'FAX'
      Size = 4000
    end
    object Ins_ReportBANKING_DETAILS: TStringField
      FieldName = 'BANKING_DETAILS'
      Size = 32
    end
    object Ins_ReportINSUREDMODEL: TStringField
      FieldName = 'INSUREDMODEL'
      Required = True
      Size = 32
    end
    object Ins_ReportINSUREDTYPE: TStringField
      FieldName = 'INSUREDTYPE'
      Size = 128
    end
    object Ins_ReportINSUREDSTATENUM: TStringField
      FieldName = 'INSUREDSTATENUM'
      Size = 32
    end
    object Ins_ReportINSUREDCOLOR: TStringField
      FieldName = 'INSUREDCOLOR'
      Size = 32
    end
    object Ins_ReportINSUREDOUTPUTYEAR: TIntegerField
      FieldName = 'INSUREDOUTPUTYEAR'
    end
    object Ins_ReportINSUREDNUMSEATS: TIntegerField
      FieldName = 'INSUREDNUMSEATS'
    end
    object Ins_ReportINSUREDENGINENUM: TStringField
      FieldName = 'INSUREDENGINENUM'
      Size = 32
    end
    object Ins_ReportINSUREDCHASSISNUM: TStringField
      FieldName = 'INSUREDCHASSISNUM'
      Size = 32
    end
    object Ins_ReportINSUREDACTUALVALUE: TFloatField
      FieldName = 'INSUREDACTUALVALUE'
    end
    object Ins_ReportTRANSMISSION_TYPE: TStringField
      FieldName = 'TRANSMISSION_TYPE'
      Size = 128
    end
    object Ins_ReportPRESENCE_ALARM: TStringField
      FieldName = 'PRESENCE_ALARM'
      Size = 32
    end
    object Ins_ReportMOTOR_USAGE: TStringField
      FieldName = 'MOTOR_USAGE'
      Size = 128
    end
    object Ins_ReportMOTORSTORAGEPLACE: TStringField
      FieldName = 'MOTORSTORAGEPLACE'
      Size = 128
    end
    object Ins_ReportEXISTINGDAMAGE: TStringField
      FieldName = 'EXISTINGDAMAGE'
      Size = 128
    end
    object Ins_ReportINSURANCEGEOGRAPHICALLIMIT: TStringField
      FieldName = 'INSURANCEGEOGRAPHICALLIMIT'
      Size = 128
    end
    object Ins_ReportPROFITID: TFloatField
      FieldName = 'PROFITID'
    end
  end
  object Accesories_Report: TOracleDataSet
    SQL.Strings = (
      'select im.* from ins_motor_accesories im'
      ''
      'where full_id = :full_id'
      '')
    Variables.Data = {
      0300000001000000080000003A46554C4C5F4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000020000004944010000000000040000005459504501000000
      0000040000004D414B450100000000000500000056414C55450100000000000A
      000000484F57435245415445440100000000000700000046554C4C5F49440100
      00000000}
    Master = Ins_Report
    MasterFields = 'ID'
    DetailFields = 'Full_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 176
    Top = 112
    object Accesories_ReportID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object Accesories_ReportTYPE: TStringField
      FieldName = 'TYPE'
      Size = 32
    end
    object Accesories_ReportMAKE: TStringField
      FieldName = 'MAKE'
      Size = 32
    end
    object Accesories_ReportVALUE: TFloatField
      FieldName = 'VALUE'
    end
    object Accesories_ReportHOWCREATED: TStringField
      FieldName = 'HOWCREATED'
      Size = 32
    end
    object Accesories_ReportFULL_ID: TFloatField
      FieldName = 'FULL_ID'
    end
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
      0400000006000000020000004944010000000000040000004E414D4501000000
      0000030000004147450100000000000A000000455850455249454E4345010000
      0000000700000046554C4C5F494401000000000007000000484953544F525901
      0000000000}
    Master = Ins_Report
    MasterFields = 'ID'
    DetailFields = 'Full_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 104
    Top = 168
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
    object More_ReportAGE: TIntegerField
      FieldName = 'AGE'
    end
    object More_ReportEXPERIENCE: TStringField
      FieldName = 'EXPERIENCE'
      Size = 128
    end
    object More_ReportHISTORY: TStringField
      FieldName = 'HISTORY'
      Size = 1024
    end
  end
  object AccReportData: TDataSource
    DataSet = Accesories_Report
    Left = 264
    Top = 112
  end
  object MoreReportData: TDataSource
    DataSet = More_Report
    Left = 16
    Top = 168
  end
  object Suggestion: TOracleDataSet
    SQL.Strings = (
      'select s.rowid,s.* from ins_mf_suggestion s'
      'where mk_id = :mk_id')
    Variables.Data = {
      0300000001000000060000003A4D4B5F49440400000008000000000000000074
      A24000000000}
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
    Left = 272
    Top = 168
    object SuggestionID: TFloatField
      FieldName = 'ID'
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
  object SuggestionData: TDataSource
    DataSet = Suggestion
    Left = 192
    Top = 168
  end
  object BankInfoData: TDataSource
    DataSet = BankInfo
    Left = 136
    Top = 216
  end
  object BankInfo: TOracleDataSet
    SQL.Strings = (
      'select *from BankInfo')
    QBEDefinition.QBEFieldDefs = {
      040000002A000000050000004B4F445F420100000000000400000042414E4B01
      000000000007000000415A5F4E414D45010000000000040000004B524E4F0100
      0000000003000000494E4E010000000000050000005345484552010000000000
      0600000041445245535301000000000004000000534544520100000000000700
      0000425548414C54520100000000000300000054454C01000000000003000000
      4641580100000000000500000053574946540100000000000500000054454C45
      5801000000000005000000454D41494C01000000000007000000504F53545F49
      4E010000000000070000004B4F445F46494C0100000000000600000046494C49
      414C0100000000000900000041445245535F46494C0100000000000700000054
      454C5F46494C010000000000070000004641585F46494C010000000000090000
      0053574946545F46494C0100000000000900000054454C45585F46494C010000
      0000000A000000504F5354494E5F46494C010000000000090000005345484552
      5F46494C01000000000007000000494E4E5F46494C010000000000080000004B
      524E4F5F46494C010000000000070000005345445246494C0100000000000900
      0000425548414C5F46494C010000000000080000004B4F445F4246494C010000
      000000020000004E420100000000000700000056414C5F4D4F56010000000000
      040000004C4F474F000000000000040000004C494E4B01000000000003000000
      5344560100000000000300000053564D01000000000002000000424601000000
      00000C0000004D414E414745525449544C450100000000000F0000004143434F
      554E54414E545449544C450100000000000E00000053564D5F43555252454E43
      594944010000000000070000004341504954414C010000000000090000004153
      53495354414E540100000000000E000000415353495354414E545449544C4501
      0000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 200
    Top = 232
  end
  object AValuteData: TDataSource
    DataSet = AValute
    Left = 144
    Top = 288
  end
  object AValute: TOracleDataSet
    SQL.Strings = (
      'select valute, val_name, valu_name, valu_short from avalute')
    QBEDefinition.QBEFieldDefs = {
      04000000040000000600000056414C5554450100000000000800000056414C5F
      4E414D450100000000000900000056414C555F4E414D450100000000000A0000
      0056414C555F53484F5254010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 200
    Top = 288
    object AValuteVALU_NAME: TStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
    object AValuteVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object AValuteVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object AValuteVALU_SHORT: TStringField
      FieldName = 'VALU_SHORT'
      Size = 10
    end
  end
  object Policy: TOracleDataSet
    SQL.Strings = (
      'select imp.rowid, imp.* from ins_mf_policy imp'
      'where imp.ms_id= :ms_id')
    Variables.Data = {0300000001000000060000003A4D535F4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000050000004D535F4944010000
      00000009000000504F4C4943594E554D0100000000000C0000005355424A4543
      5456414C5545010000000000}
    Master = Suggestion
    MasterFields = 'ID'
    DetailFields = 'MS_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 80
    Top = 288
    object PolicyID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object PolicyMS_ID: TFloatField
      FieldName = 'MS_ID'
      Required = True
    end
    object PolicySUBJECTVALUE: TFloatField
      FieldName = 'SUBJECTVALUE'
    end
    object PolicyPOLICYNUM: TStringField
      FieldName = 'POLICYNUM'
      Size = 32
    end
  end
  object PolicyData: TDataSource
    DataSet = Policy
    Left = 16
    Top = 288
  end
  object Ins_Rep: TOracleDataSet
    SQL.Strings = (
      
        'select id, PINS_FullMotor.returnName(kli_id) as name,Pins_FullMo' +
        'tor.returnAddress(kli_id) as Address,Pins_FullMotor.returnPhone(' +
        'kli_id) as phone,pins_fullmotor.returnFax(kli_id) as fax,contact' +
        '_person, banking_details,'
      '       insuredmodel,insuredtype,'
      '       insuredstatenum, insuredcolor,insuredoutputyear,'
      '      insurednumseats,insuredenginenum,insuredchassisnum,'
      '      insuredactualvalue,transmission_type,presence_alarm,'
      
        '      motor_usage,motorstorageplace,existingdamage,insurancegeog' +
        'raphicallimit'
      ' from ins_motorfull'
      '')
    QBEDefinition.QBEFieldDefs = {
      0400000016000000020000004944010000000000040000004E414D4501000000
      00000E000000434F4E544143545F504552534F4E0100000000000F0000004241
      4E4B494E475F44455441494C530100000000000C000000494E53555245444D4F
      44454C0100000000000B000000494E5355524544545950450100000000000F00
      0000494E535552454453544154454E554D0100000000000C000000494E535552
      4544434F4C4F5201000000000011000000494E53555245444F55545055545945
      41520100000000000F000000494E53555245444E554D53454154530100000000
      0010000000494E5355524544454E47494E454E554D0100000000001100000049
      4E5355524544434841535349534E554D01000000000012000000494E53555245
      4441435455414C56414C5545010000000000110000005452414E534D49535349
      4F4E5F545950450100000000000E00000050524553454E43455F414C41524D01
      00000000000B0000004D4F544F525F5553414745010000000000110000004D4F
      544F5253544F52414745504C4143450100000000000E0000004558495354494E
      4744414D4147450100000000001A000000494E535552414E434547454F475241
      50484943414C4C494D49540100000000000500000050484F4E45010000000000
      030000004641580100000000000700000041444452455353010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 96
    Top = 408
    object Ins_RepNAME: TStringField
      FieldName = 'NAME'
      Size = 4000
    end
    object Ins_RepADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 4000
    end
    object Ins_RepID: TFloatField
      FieldName = 'ID'
      Required = True
    end
  end
  object Ins_RepData: TDataSource
    DataSet = Ins_Rep
    Left = 24
    Top = 408
  end
  object Suggest_Rep: TOracleDataSet
    SQL.Strings = (
      'select s.rowid,s.* from ins_mf_suggestion s'
      'where mk_id = :mk_id')
    Variables.Data = {0300000001000000060000003A4D4B5F4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A000000020000004944010000000000050000004D4B5F4944010000
      0000000B0000005249534B4144445245535301000000000010000000494E5355
      52414E4345414D4D4F554E5401000000000007000000454E4444415445010000
      0000000600000052534B5F49440100000000000600000046525A5F4944010000
      00000007000000434E44545F49440100000000000600000056414C5F49440100
      000000000C000000494E535552414E434553554D010000000000}
    Master = Ins_Rep
    MasterFields = 'ID'
    DetailFields = 'MK_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 344
    Top = 120
    object Suggest_RepID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object Suggest_RepMK_ID: TFloatField
      FieldName = 'MK_ID'
      Required = True
    end
    object Suggest_RepRISKADDRESS: TStringField
      FieldName = 'RISKADDRESS'
      Size = 1024
    end
    object Suggest_RepINSURANCEAMMOUNT: TFloatField
      FieldName = 'INSURANCEAMMOUNT'
    end
    object Suggest_RepENDDATE: TDateTimeField
      FieldName = 'ENDDATE'
    end
    object Suggest_RepINSURANCESUM: TFloatField
      FieldName = 'INSURANCESUM'
    end
  end
  object Suggest_RepData: TDataSource
    DataSet = Suggest_Rep
    Left = 432
    Top = 112
  end
  object Policy_Report: TOracleDataSet
    SQL.Strings = (
      'select  imp.rowid, imp.* from ins_mf_policy imp'
      'where ms_id = :ms_id')
    Variables.Data = {0300000001000000060000003A4D535F4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000050000004D535F4944010000
      00000009000000504F4C4943594E554D0100000000000C0000005355424A4543
      5456414C5545010000000000}
    Master = Suggestion
    MasterFields = 'ID'
    DetailFields = 'MS_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 112
    Top = 344
    object StringField1: TStringField
      FieldName = 'POLICYNUM'
      Size = 32
    end
    object Policy_ReportID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object Policy_ReportMS_ID: TFloatField
      FieldName = 'MS_ID'
      Required = True
    end
  end
  object Policy_reportData: TDataSource
    DataSet = Policy_Report
    Left = 24
    Top = 344
  end
  object MoreThan: TOracleDataSet
    SQL.Strings = (
      
        'select im.rowid,(im.name||'#39' '#39'||im.surname)name from INS_MOTORMOR' +
        'ETHANONEDRIVER im'
      ''
      'where full_id = :full_id'
      '')
    Variables.Data = {
      0300000001000000080000003A46554C4C5F4944040000000800000000000000
      0074A24000000000}
    QBEDefinition.QBEFieldDefs = {0400000001000000040000004E414D45010000000000}
    Master = Ins_MotorFull
    MasterFields = 'ID'
    DetailFields = 'FULL_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 436
    Top = 8
    object MoreThanOneNAME: TStringField
      FieldName = 'NAME'
      Size = 256
    end
  end
  object MoreThanData: TDataSource
    DataSet = MoreThan
    Left = 356
    Top = 8
  end
  object Ins_PRep: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      
        'select id, PINS_FullMotor.returnName(kli_id) as name,Pins_FullMo' +
        'tor.returnAddress(kli_id) as Address,Pins_FullMotor.returnPhone(' +
        'kli_id) as phone, banking_details,'
      '     insuredmodel,insuredtype,'
      '       insuredstatenum, insuredcolor,insuredoutputyear,'
      '      insurednumseats,insuredenginenum,insuredchassisnum,'
      '      insuredactualvalue,transmission_type,presence_alarm,'
      
        '      motorstorageplace,existingdamage,insurancegeographicallimi' +
        't,insuredbody,broker'
      ' from ins_motorfull'
      '')
    Variables.Data = {
      0300000001000000060000003A5449544C4501000000070000006B6C695F6964
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000150000000200000049440100000000000F00000042414E4B494E475F
      44455441494C530100000000000C000000494E53555245444D4F44454C010000
      0000000B000000494E5355524544545950450100000000000F000000494E5355
      52454453544154454E554D0100000000000C000000494E5355524544434F4C4F
      5201000000000011000000494E53555245444F55545055545945415201000000
      00000F000000494E53555245444E554D53454154530100000000001000000049
      4E5355524544454E47494E454E554D01000000000011000000494E5355524544
      434841535349534E554D01000000000012000000494E53555245444143545541
      4C56414C5545010000000000110000005452414E534D495353494F4E5F545950
      450100000000000E00000050524553454E43455F414C41524D01000000000011
      0000004D4F544F5253544F52414745504C4143450100000000000E0000004558
      495354494E4744414D4147450100000000001A000000494E535552414E434547
      454F47524150484943414C4C494D4954010000000000040000004E414D450100
      0000000007000000414444524553530100000000000500000050484F4E450100
      000000000B000000494E5355524544424F44590100000000000600000042524F
      4B4552010000000000}
    CountAllRecords = True
    Session = sboapiDataModule.SBSession
    Left = 272
    Top = 344
    object Ins_PRepID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object Ins_PRepNAME: TStringField
      FieldName = 'NAME'
      Size = 4000
    end
    object Ins_PRepADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 4000
    end
    object Ins_PRepPHONE: TStringField
      FieldName = 'PHONE'
      Size = 4000
    end
    object Ins_PRepBANKING_DETAILS: TStringField
      FieldName = 'BANKING_DETAILS'
      Size = 32
    end
    object Ins_PRepINSURANCEGEOGRAPHICALLIMIT: TStringField
      FieldName = 'INSURANCEGEOGRAPHICALLIMIT'
      Size = 128
    end
    object Ins_PRepINSUREDMODEL: TStringField
      FieldName = 'INSUREDMODEL'
      Required = True
      Size = 32
    end
    object Ins_PRepINSUREDTYPE: TStringField
      FieldName = 'INSUREDTYPE'
      Size = 128
    end
    object Ins_PRepINSUREDSTATENUM: TStringField
      FieldName = 'INSUREDSTATENUM'
      Size = 32
    end
    object Ins_PRepINSUREDCOLOR: TStringField
      FieldName = 'INSUREDCOLOR'
      Size = 32
    end
    object Ins_PRepINSUREDOUTPUTYEAR: TIntegerField
      FieldName = 'INSUREDOUTPUTYEAR'
    end
    object Ins_PRepINSUREDNUMSEATS: TIntegerField
      FieldName = 'INSUREDNUMSEATS'
    end
    object Ins_PRepINSUREDENGINENUM: TStringField
      FieldName = 'INSUREDENGINENUM'
      Size = 32
    end
    object Ins_PRepINSUREDCHASSISNUM: TStringField
      FieldName = 'INSUREDCHASSISNUM'
      Size = 32
    end
    object Ins_PRepINSUREDACTUALVALUE: TFloatField
      FieldName = 'INSUREDACTUALVALUE'
    end
    object Ins_PRepTRANSMISSION_TYPE: TStringField
      FieldName = 'TRANSMISSION_TYPE'
      Size = 128
    end
    object Ins_PRepPRESENCE_ALARM: TStringField
      FieldName = 'PRESENCE_ALARM'
      Size = 32
    end
    object Ins_PRepMOTORSTORAGEPLACE: TStringField
      FieldName = 'MOTORSTORAGEPLACE'
      Size = 128
    end
    object Ins_PRepEXISTINGDAMAGE: TStringField
      FieldName = 'EXISTINGDAMAGE'
      Size = 128
    end
    object Ins_PRepINSUREDBODY: TStringField
      FieldName = 'INSUREDBODY'
      Size = 32
    end
    object Ins_PRepBROKER: TFloatField
      FieldName = 'BROKER'
    end
  end
  object Ins_PRepData: TDataSource
    DataSet = Ins_PRep
    Left = 192
    Top = 344
  end
  object RisksData: TDataSource
    DataSet = Risks
    Left = 400
    Top = 61
  end
  object Risks: TOracleDataSet
    SQL.Strings = (
      'select idr.rowid, idr.* from ins_dict_risks idr')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 352
    Top = 61
    object RisksID: TFloatField
      FieldName = 'ID'
    end
    object RisksNAME: TStringField
      FieldName = 'NAME'
      Size = 1024
    end
  end
  object Conditions: TOracleDataSet
    SQL.Strings = (
      'select idr.rowid, idr.* from ins_dict_conditions idr')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 360
    Top = 229
    object ConditionsID: TFloatField
      FieldName = 'ID'
    end
    object ConditionsNAME: TStringField
      FieldName = 'NAME'
      Size = 1024
    end
  end
  object Franshiz: TOracleDataSet
    SQL.Strings = (
      'select idr.rowid, idr.* from ins_dict_franshiz idr')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 344
    Top = 173
    object FranshizID: TFloatField
      FieldName = 'ID'
    end
    object FranshizNAME: TStringField
      FieldName = 'NAME'
      Size = 1024
    end
  end
  object Risktypes: TOracleDataSet
    SQL.Strings = (
      'select * from ins_dict_risk_types')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 360
    Top = 277
    object RisktypesID: TFloatField
      FieldName = 'ID'
    end
    object RisktypesNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object ConditionsData: TDataSource
    DataSet = Conditions
    Left = 280
    Top = 229
  end
  object FranshizData: TDataSource
    DataSet = Franshiz
    Left = 424
    Top = 173
  end
  object RisktypesData: TDataSource
    DataSet = Risktypes
    Left = 280
    Top = 277
  end
  object AgentsSource: TDataSource
    DataSet = ODSAgents
    Left = 432
    Top = 280
  end
  object ODSAgents: TOracleDataSet
    SQL.Strings = (
      
        'select a.id,a.name||'#39' '#39'||a.surname||'#39' '#39'||a.fathername as name fr' +
        'om ins_agents a')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 432
    Top = 224
    object ODSAgentsNAME: TStringField
      FieldName = 'NAME'
      Size = 386
    end
    object ODSAgentsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
  end
  object BeneficiarySource: TDataSource
    DataSet = ODSBeneficiary
    Left = 176
    Top = 408
  end
  object ODSBeneficiary: TOracleDataSet
    SQL.Strings = (
      'select * from ins_beneficiary')
    QBEDefinition.QBEFieldDefs = {
      0400000005000000020000004944010000000000040000004E414D4501000000
      000007000000414444524553530100000000000500000050484F4E4501000000
      00000F00000042414E4B494E475F44455441494C53010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 272
    Top = 408
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
      'where blank_id = :blankid'
      'and type_id = 4')
    Variables.Data = {
      0300000001000000080000003A424C414E4B4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000F00000002000000494401000000000007000000545950455F494401
      000000000008000000424C414E4B5F494401000000000007000000535547475F
      494401000000000009000000504F4C4943595F49440100000000000800000049
      4E535F444154450100000000000A000000424547494E5F444154450100000000
      0008000000454E445F444154450100000000000900000056414C5554455F4944
      01000000000007000000414D4D4F554E540100000000000C000000434C4F5345
      5F505245464958010000000000060000004B4C495F49440100000000000A0000
      004C4F414E4143435F49440100000000000A000000435552524143435F494401
      00000000000A000000504F4C4943595F4E554D010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 360
    Top = 352
    object ODSContractsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSContractsTYPE_ID: TFloatField
      FieldName = 'TYPE_ID'
    end
    object ODSContractsBLANK_ID: TFloatField
      FieldName = 'BLANK_ID'
    end
    object ODSContractsSUGG_ID: TFloatField
      FieldName = 'SUGG_ID'
    end
    object ODSContractsPOLICY_ID: TFloatField
      FieldName = 'POLICY_ID'
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
    object ODSContractsCLOSE_PREFIX: TIntegerField
      FieldName = 'CLOSE_PREFIX'
      Required = True
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
    object ODSContractsAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
  end
  object DSContracts: TDataSource
    DataSet = ODSContracts
    Left = 352
    Top = 413
  end
  object OPCOMMON: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_COMMON'
    Left = 434
    Top = 354
  end
end
