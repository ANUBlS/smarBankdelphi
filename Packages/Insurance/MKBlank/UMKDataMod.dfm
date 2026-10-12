object InsMKDataMod: TInsMKDataMod
  OldCreateOrder = False
  Left = 146
  Top = 93
  Height = 569
  Width = 817
  object DSMarks: TDataSource
    DataSet = ODSMarks
    Left = 19
    Top = 10
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
    FilterOptions = [foCaseInsensitive, foNoPartialCompare]
    Left = 99
    Top = 10
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
  object ODSModels: TOracleDataSet
    SQL.Strings = (
      'select * from ins_dict_models'
      ''
      'where mark_id = :mark_id'
      'order by name'
      '')
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
    Left = 99
    Top = 66
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
  object DSModels: TDataSource
    DataSet = ODSModels
    Left = 19
    Top = 66
  end
  object ODSBanks: TOracleDataSet
    SQL.Strings = (
      'select * from bankm'
      'order by name')
    QBEDefinition.QBEFieldDefs = {
      0400000007000000020000004944010000000000040000004E414D4501000000
      0000040000004B524E4F01000000000003000000494E4E010000000000050000
      0053574946540100000000000800000042414E4B434F44450100000000000700
      00005355424B524E4F010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 291
    Top = 10
    object ODSBanksID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSBanksNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
  end
  object DSBanks: TDataSource
    DataSet = ODSBanks
    Left = 291
    Top = 58
  end
  object ODSCusts: TOracleDataSet
    SQL.Strings = (
      'select * from ('
      
        'SELECT a.id,a.insured_typeid,a.surname || '#39' '#39' ||a.name || '#39' '#39' ||' +
        'a.fathername name, a.ADDRESS'
      '  FROM ins_customers a where a.close_prefix=0'
      '  order by a.surname'
      ''
      ')')
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000040000004E414D4501000000
      000007000000414444524553530100000000000E000000494E53555245445F54
      5950454944010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 384
    Top = 16
    object ODSCustsID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ODSCustsNAME: TStringField
      FieldName = 'NAME'
      Size = 258
    end
    object ODSCustsADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 1024
    end
    object ODSCustsINSURED_TYPEID: TIntegerField
      FieldName = 'INSURED_TYPEID'
    end
  end
  object DSCusts: TDataSource
    DataSet = ODSCusts
    Left = 384
    Top = 64
  end
  object pkgMotorKasco: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_PKG_MOTORKASCO'
    Left = 451
    Top = 18
  end
  object OPCOMMON: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_COMMON'
    Left = 450
    Top = 74
  end
  object ODSMotorkasko: TOracleDataSet
    SQL.Strings = (
      'select mk.rowid, mk.* from ins_motorkasco mk '
      'where mk.cid = :cid')
    Variables.Data = {0300000001000000040000003A434944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001E0000000200000049440100000000000B000000494E535552454454
      5950450100000000000C000000494E5355524544434F4C4F5201000000000011
      000000494E53555245444F5554505554594541520100000000000F000000494E
      535552454453544154454E554D0100000000000D000000554E4445524652414D
      454E554D0100000000000D000000494E535552454442414E4E554D0100000000
      0010000000494E5355524544454E47494E454E554D0100000000000D00000044
      52495645494E54454E444544010000000000090000004452495645434F535401
      000000000009000000424547494E4441544501000000000007000000454E4444
      415445010000000000060000005459504549440100000000000C000000434C4F
      53455F5052454649580100000000000700000042414E4B5F4944010000000000
      080000004D4F4E54485F49440100000000000B000000494E53555245444D4152
      4B0100000000000C000000494E53555245444D4F44454C010000000000030000
      004349440100000000000A000000434C41494D5F444154450100000000000900
      0000434C41494D5F4E554D010000000000040000004152454101000000000007
      0000004143545F4E554D010000000000080000004652414E5348495A01000000
      00000600000054415249464601000000000007000000494E5353554D4D010000
      00000007000000414D4D4F554E54010000000000080000004E554D5345415453
      010000000000050000004E4F5445530100000000000D00000045585452414652
      414E5348495A010000000000}
    Session = sboapiDataModule.SBSession
    AfterInsert = ODSMotorkaskoAfterInsert
    AfterPost = ODSMotorkaskoAfterPost
    Left = 530
    Top = 12
    object ODSMotorkaskoID: TFloatField
      FieldName = 'ID'
    end
    object ODSMotorkaskoCID: TFloatField
      FieldName = 'CID'
    end
    object ODSMotorkaskoINSUREDTYPE: TStringField
      FieldName = 'INSUREDTYPE'
      Size = 128
    end
    object ODSMotorkaskoINSUREDCOLOR: TStringField
      FieldName = 'INSUREDCOLOR'
      Size = 100
    end
    object ODSMotorkaskoINSUREDOUTPUTYEAR: TIntegerField
      FieldName = 'INSUREDOUTPUTYEAR'
    end
    object ODSMotorkaskoINSUREDSTATENUM: TStringField
      FieldName = 'INSUREDSTATENUM'
      Size = 32
    end
    object ODSMotorkaskoUNDERFRAMENUM: TStringField
      FieldName = 'UNDERFRAMENUM'
      Size = 32
    end
    object ODSMotorkaskoINSUREDBANNUM: TStringField
      FieldName = 'INSUREDBANNUM'
      Size = 32
    end
    object ODSMotorkaskoINSUREDENGINENUM: TStringField
      FieldName = 'INSUREDENGINENUM'
      Size = 32
    end
    object ODSMotorkaskoDRIVEINTENDED: TStringField
      FieldName = 'DRIVEINTENDED'
      Size = 128
    end
    object ODSMotorkaskoDRIVECOST: TFloatField
      FieldName = 'DRIVECOST'
      currency = True
    end
    object ODSMotorkaskoBEGINDATE: TDateTimeField
      FieldName = 'BEGINDATE'
    end
    object ODSMotorkaskoENDDATE: TDateTimeField
      FieldName = 'ENDDATE'
    end
    object ODSMotorkaskoTYPEID: TIntegerField
      FieldName = 'TYPEID'
    end
    object ODSMotorkaskoCLOSE_PREFIX: TIntegerField
      FieldName = 'CLOSE_PREFIX'
    end
    object ODSMotorkaskoBANK_ID: TFloatField
      FieldName = 'BANK_ID'
    end
    object ODSMotorkaskoMONTH_ID: TFloatField
      FieldName = 'MONTH_ID'
    end
    object ODSMotorkaskoINSUREDMARK: TStringField
      FieldName = 'INSUREDMARK'
      Size = 32
    end
    object ODSMotorkaskoINSUREDMODEL: TStringField
      FieldName = 'INSUREDMODEL'
      Size = 32
    end
    object ODSMotorkaskoCLAIM_DATE: TDateTimeField
      FieldName = 'CLAIM_DATE'
    end
    object ODSMotorkaskoCLAIM_NUM: TStringField
      FieldName = 'CLAIM_NUM'
      Size = 64
    end
    object ODSMotorkaskoavtotypes: TStringField
      FieldKind = fkLookup
      FieldName = 'avtotypes'
      LookupDataSet = ODSAutoTypes
      LookupKeyFields = 'NAME'
      LookupResultField = 'NAME'
      KeyFields = 'INSUREDTYPE'
      Lookup = True
    end
    object ODSMotorkaskoavtomarks: TStringField
      FieldKind = fkLookup
      FieldName = 'avtomarks'
      LookupDataSet = ODSMarks
      LookupKeyFields = 'NAME'
      LookupResultField = 'NAME'
      KeyFields = 'INSUREDMARK'
      Lookup = True
    end
    object ODSMotorkaskoavtomodels: TStringField
      FieldKind = fkLookup
      FieldName = 'avtomodels'
      LookupDataSet = ODSModels
      LookupKeyFields = 'NAME'
      LookupResultField = 'NAME'
      KeyFields = 'INSUREDMODEL'
      Lookup = True
    end
    object ODSMotorkaskoavtocolor: TStringField
      FieldKind = fkLookup
      FieldName = 'avtocolor'
      LookupDataSet = ODSAutoColors
      LookupKeyFields = 'NAME'
      LookupResultField = 'NAME'
      KeyFields = 'INSUREDCOLOR'
      Lookup = True
    end
    object ODSMotorkaskoAREA: TStringField
      FieldName = 'AREA'
      Size = 32
    end
    object ODSMotorkaskoACT_NUM: TStringField
      FieldName = 'ACT_NUM'
      Size = 32
    end
    object ODSMotorkaskoFRANSHIZ: TFloatField
      FieldName = 'FRANSHIZ'
    end
    object ODSMotorkaskoTARIFF: TFloatField
      FieldName = 'TARIFF'
    end
    object ODSMotorkaskoINSSUMM: TFloatField
      FieldName = 'INSSUMM'
    end
    object ODSMotorkaskoAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSMotorkaskoNUMSEATS: TStringField
      FieldName = 'NUMSEATS'
      Size = 32
    end
    object ODSMotorkaskoautointend: TStringField
      FieldKind = fkLookup
      FieldName = 'autointend'
      LookupDataSet = ODSIntends
      LookupKeyFields = 'NAME'
      LookupResultField = 'NAME'
      KeyFields = 'DRIVEINTENDED'
      Size = 32
      Lookup = True
    end
    object ODSMotorkaskoNOTES: TStringField
      FieldName = 'NOTES'
      Size = 2048
    end
    object ODSMotorkaskoEXTRAFRANSHIZ: TStringField
      FieldName = 'EXTRAFRANSHIZ'
      Size = 32
    end
  end
  object DSMotorkasco: TDataSource
    DataSet = ODSMotorkasko
    Left = 530
    Top = 92
  end
  object DSContracts: TDataSource
    DataSet = ODSContracts
    Left = 330
    Top = 300
  end
  object ODSContracts: TOracleDataSet
    SQL.Strings = (
      'select ic.rowid,ic.* from ins_contracts ic'
      'where ic.id = :cid')
    Variables.Data = {0300000001000000040000003A434944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001500000002000000494401000000000007000000545950455F494401
      000000000008000000494E535F444154450100000000000A000000424547494E
      5F4441544501000000000008000000454E445F44415445010000000000090000
      0056414C5554455F494401000000000007000000414D4D4F554E540100000000
      000C000000434C4F53455F505245464958010000000000060000004B4C495F49
      440100000000000A0000004C4F414E4143435F49440100000000000A00000043
      5552524143435F49440100000000000A000000504F4C4943595F4E554D010000
      00000007000000494E5353554D4D010000000000080000004652414E5348495A
      0100000000000600000054415249464601000000000005000000535441544501
      0000000000080000004147454E545F494401000000000004000000504E554D01
      00000000000600000042454E5F49440100000000000B00000042454E45464943
      494152590100000000000A000000434F4E444954494F4E53010000000000}
    Session = sboapiDataModule.SBSession
    AfterInsert = ODSContractsAfterInsert
    Left = 330
    Top = 244
    object ODSContractsID: TFloatField
      FieldName = 'ID'
    end
    object ODSContractsTYPE_ID: TFloatField
      FieldName = 'TYPE_ID'
      Required = True
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
      currency = True
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
      Size = 32
    end
    object ODSContractsINSSUMM: TFloatField
      FieldName = 'INSSUMM'
      currency = True
    end
    object ODSContractsFRANSHIZ: TFloatField
      FieldName = 'FRANSHIZ'
      currency = True
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
    object ODSContractsBEN_ID: TFloatField
      FieldName = 'BEN_ID'
    end
    object ODSContractsBENEFICIARY: TStringField
      FieldName = 'BENEFICIARY'
      Size = 1024
    end
    object ODSContractsCONDITIONS: TStringField
      FieldName = 'CONDITIONS'
      Size = 1024
    end
  end
  object DSSex: TDataSource
    DataSet = ODSSex
    Left = 250
    Top = 188
  end
  object DSDrAccessPeople: TDataSource
    DataSet = ODSdrAccessPeople
    Left = 75
    Top = 173
  end
  object ODSdrAccessPeople: TOracleDataSet
    SQL.Strings = (
      'select id.rowid, id.* from ins_draccesspeople id'
      'where id = :id')
    Variables.Data = {0300000001000000030000003A4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000900000003000000434944010000000000040000004E414D45010000
      000000070000005355524E414D450100000000000A0000004641544845524E41
      4D450100000000000800000042495254484441590100000000000C0000004452
      455850455249454E434501000000000003000000534558010000000000020000
      0049440100000000000700000049464558545241010000000000}
    Master = ODSMotorkasko
    MasterFields = 'ID'
    DetailFields = 'ID'
    Session = sboapiDataModule.SBSession
    AfterInsert = ODSdrAccessPeopleAfterInsert
    AfterPost = ODSdrAccessPeopleAfterPost
    Left = 75
    Top = 125
    object ODSdrAccessPeopleID: TFloatField
      FieldName = 'ID'
    end
    object ODSdrAccessPeopleCID: TFloatField
      FieldName = 'CID'
      Required = True
    end
    object ODSdrAccessPeopleNAME: TStringField
      FieldName = 'NAME'
      Size = 32
    end
    object ODSdrAccessPeopleSURNAME: TStringField
      FieldName = 'SURNAME'
      Size = 32
    end
    object ODSdrAccessPeopleFATHERNAME: TStringField
      FieldName = 'FATHERNAME'
      Size = 32
    end
    object ODSdrAccessPeopleBIRTHDAY: TDateTimeField
      FieldName = 'BIRTHDAY'
      EditMask = '!99/99/0000;1;_'
    end
    object ODSdrAccessPeopleDREXPERIENCE: TDateTimeField
      FieldName = 'DREXPERIENCE'
      EditMask = '!99/99/0000;1;_'
    end
    object ODSdrAccessPeopleSEX: TStringField
      FieldName = 'SEX'
      Size = 1
    end
    object ODSdrAccessPeopleIFEXTRA: TStringField
      FieldName = 'IFEXTRA'
      Size = 1
    end
  end
  object ODSSex: TOracleDataSet
    SQL.Strings = (
      'select 1 as id , '#39' иши'#39' as name from dual'
      'union all'
      'select 0 as id , '#39'√адын'#39' as name from dual')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 250
    Top = 132
    object ODSSexID: TFloatField
      FieldName = 'ID'
    end
    object ODSSexNAME: TStringField
      FieldName = 'NAME'
      Size = 5
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
    Left = 107
    Top = 237
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
  object DSMonths: TDataSource
    DataSet = ODSMonths
    Left = 107
    Top = 285
  end
  object ODSReliaseDates: TOracleDataSet
    SQL.Strings = (
      'select * from ins_release_date'
      'where to_number(to_char(begindate, '#39'YYYY'#39')) <= :releaseyear'
      'and to_number(to_char(enddate, '#39'YYYY'#39')) >= :releaseyear'
      'and state_id in (select its.id from ins_tarif_states its'
      '                  where its.state_id = :state_id)')
    Variables.Data = {
      0300000002000000090000003A53544154455F49440400000000000000000000
      000C0000003A52454C4541534559454152030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000002000000494401000000000009000000424547494E444154
      4501000000000007000000454E44444154450100000000000800000053544154
      455F4944010000000000}
    Session = sboapiDataModule.SBSession
    Left = 35
    Top = 349
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
  object DSFranshiz: TDataSource
    DataSet = ODSFranshiz
    Left = 35
    Top = 285
  end
  object ODSFranshiz: TOracleDataSet
    SQL.Strings = (
      
        'select itf.id,itf.ammount as franshiz,itf.month_id, it.ammount a' +
        's tariff'
      '  from ins_tarif_franshiz itf, ins_tariffs it'
      'where itf.month_id = :month_id'
      'and '
      '  it.franshiz_id = itf.id'
      'order by itf.ammount')
    Variables.Data = {
      0300000001000000090000003A4D4F4E54485F49440400000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000080000004652414E5348495A010000000000060000005441
      52494646010000000000080000004D4F4E54485F494401000000000002000000
      4944010000000000}
    Master = ODSMonths
    MasterFields = 'ID'
    DetailFields = 'MONTH_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 35
    Top = 237
    object ODSFranshizFRANSHIZ: TFloatField
      FieldName = 'FRANSHIZ'
    end
    object ODSFranshizTARIFF: TFloatField
      FieldName = 'TARIFF'
    end
    object ODSFranshizMONTH_ID: TFloatField
      FieldName = 'MONTH_ID'
    end
    object ODSFranshizID: TFloatField
      FieldName = 'ID'
      Required = True
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
    Left = 384
    Top = 120
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
    Left = 384
    Top = 165
  end
  object ODSAgent: TOracleDataSet
    SQL.Strings = (
      
        'select a.rowid, a.id, a.name as FName, a.Surname, a.fathername f' +
        'rom ins_Agents a'
      'order by a.surname')
    QBEDefinition.QBEFieldDefs = {
      0400000004000000070000005355524E414D450100000000000A000000464154
      4845524E414D4501000000000005000000464E414D4501000000000002000000
      4944010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    AfterOpen = ODSAgentAfterScroll
    AfterScroll = ODSAgentAfterScroll
    OnCalcFields = ODSAgentCalcFields
    Left = 320
    Top = 136
    object ODSAgentSURNAME: TStringField
      FieldName = 'SURNAME'
      Size = 128
    end
    object ODSAgentFNAME: TStringField
      FieldName = 'FNAME'
      Size = 128
    end
    object ODSAgentFATHERNAME: TStringField
      FieldName = 'FATHERNAME'
      Size = 128
    end
    object ODSAgentName: TStringField
      FieldKind = fkCalculated
      FieldName = 'Name'
      Size = 1024
      Calculated = True
    end
    object ODSAgentID: TFloatField
      FieldName = 'ID'
      Required = True
    end
  end
  object DSAgent: TDataSource
    DataSet = ODSAgent
    Left = 320
    Top = 184
  end
  object DSAccessories: TDataSource
    DataSet = ODSAccessories
    Left = 488
    Top = 200
  end
  object ODSAccessories: TOracleDataSet
    SQL.Strings = (
      
        'select mka.rowid,mka.* from ins_mk_accessories mka where cid = :' +
        'cid')
    Variables.Data = {0300000001000000040000003A434944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000040000004E414D4501000000
      000007000000414D4D4F554E5401000000000003000000434944010000000000}
    Master = ODSMotorkasko
    MasterFields = 'ID'
    DetailFields = 'CID'
    Session = sboapiDataModule.SBSession
    AfterInsert = ODSAccessoriesAfterInsert
    AfterPost = ODSdrAccessPeopleAfterPost
    Left = 480
    Top = 144
    object ODSAccessoriesID: TFloatField
      FieldName = 'ID'
    end
    object ODSAccessoriesNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object ODSAccessoriesAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object ODSAccessoriesCID: TFloatField
      FieldName = 'CID'
      Required = True
    end
  end
  object ODSAutoTypes: TOracleDataSet
    SQL.Strings = (
      'select * from INS_DICT_AUTO_TYPES '
      'order by name')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 184
    Top = 120
    object ODSAutoTypesID: TFloatField
      FieldName = 'ID'
    end
    object ODSAutoTypesNAME: TStringField
      FieldName = 'NAME'
      Size = 32
    end
  end
  object DSAutoTypes: TDataSource
    DataSet = ODSAutoTypes
    Left = 184
    Top = 184
  end
  object ODSAutoColors: TOracleDataSet
    SQL.Strings = (
      'select * from ins_dict_auto_colors order by name')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 192
    Top = 16
  end
  object DSAutoColors: TDataSource
    DataSet = ODSAutoColors
    Left = 192
    Top = 64
  end
  object DSClaimSal: TDataSource
    DataSet = ODSClaimSal
    Left = 176
    Top = 304
  end
  object ODSClaimSal: TOracleDataSet
    SQL.Strings = (
      'select ics.rowid,ics.* from ins_claim_salary ics'
      ''
      'where ics.eid = :eid')
    Variables.Data = {0300000001000000040000003A454944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000030000004549440100000000
      00040000004E414D4501000000000004000000434F5354010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    AfterInsert = ODSClaimSalAfterInsert
    Left = 248
    Top = 304
    object ODSClaimSalID: TFloatField
      FieldName = 'ID'
    end
    object ODSClaimSalEID: TFloatField
      FieldName = 'EID'
    end
    object ODSClaimSalNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object ODSClaimSalCOST: TFloatField
      FieldName = 'COST'
    end
  end
  object DSClaims: TDataSource
    DataSet = ODSClaims
    Left = 176
    Top = 248
  end
  object ODSClaims: TOracleDataSet
    SQL.Strings = (
      'select icl.rowid,icl.*from ins_claims icl where icl.mk_id=:id')
    Variables.Data = {0300000001000000030000003A4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000020000004944010000000000050000004D4B5F4944010000
      00000005000000454E414D4501000000000005000000434F554E540100000000
      0004000000434F5354010000000000050000005354415445010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    AfterInsert = ODSClaimsAfterInsert
    Left = 240
    Top = 248
    object ODSClaimsID: TFloatField
      FieldName = 'ID'
    end
    object ODSClaimsMK_ID: TFloatField
      FieldName = 'MK_ID'
    end
    object ODSClaimsENAME: TStringField
      FieldName = 'ENAME'
      Size = 164
    end
    object ODSClaimsCOUNT: TFloatField
      FieldName = 'COUNT'
    end
    object ODSClaimsCOST: TFloatField
      FieldName = 'COST'
    end
    object ODSClaimsSTATE: TStringField
      FieldName = 'STATE'
      Size = 32
    end
  end
  object ODSClaimReport: TOracleDataSet
    SQL.Strings = (
      
        'select icl.rowid, icl.* from ins_claims icl where icl.state='#39'ƒ€й' +
        'ишдирилир'#39' and icl.mk_id=:id')
    Variables.Data = {0300000001000000030000003A4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000020000004944010000000000050000004D4B5F4944010000
      00000005000000454E414D4501000000000005000000434F554E540100000000
      0004000000434F5354010000000000050000005354415445010000000000}
    Session = sboapiDataModule.SBSession
    Left = 248
    Top = 360
    object ODSClaimReportID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSClaimReportMK_ID: TFloatField
      FieldName = 'MK_ID'
    end
    object ODSClaimReportENAME: TStringField
      FieldName = 'ENAME'
      Size = 164
    end
    object ODSClaimReportCOUNT: TFloatField
      FieldName = 'COUNT'
    end
    object ODSClaimReportCOST: TFloatField
      FieldName = 'COST'
    end
    object ODSClaimReportSTATE: TStringField
      FieldName = 'STATE'
      Size = 32
    end
  end
  object DSClaimDescription: TDataSource
    DataSet = ODSClaimDescription
    Left = 32
    Top = 424
  end
  object ODSClaimDescription: TOracleDataSet
    SQL.Strings = (
      
        'select icd.rowid,icd.* from ins_claim_description icd where icd.' +
        'id=:id')
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000F00000002000000494401000000000006000000524547494F4E0100
      00000000060000005354524545540100000000000600000044455441494C0100
      0000000006000000504552534F4E010000000000040000004D41524B01000000
      00000800000053544154454E554D0100000000000A0000004156544F53455256
      4953010000000000050000004D4F44454C010000000000070000004150504441
      54450100000000000A0000004C45545445524441544501000000000009000000
      4C45545445524E554D010000000000060000005350524E554D01000000000006
      0000005052544E554D0100000000000700000041435444415445010000000000}
    Session = sboapiDataModule.SBSession
    Left = 136
    Top = 424
    object ODSClaimDescriptionID: TFloatField
      FieldName = 'ID'
    end
    object ODSClaimDescriptionREGION: TStringField
      FieldName = 'REGION'
      Size = 64
    end
    object ODSClaimDescriptionSTREET: TStringField
      FieldName = 'STREET'
      Size = 64
    end
    object ODSClaimDescriptionDETAIL: TStringField
      FieldName = 'DETAIL'
      Size = 1024
    end
    object ODSClaimDescriptionPERSON: TStringField
      FieldName = 'PERSON'
      Size = 64
    end
    object ODSClaimDescriptionMARK: TStringField
      FieldName = 'MARK'
      Size = 64
    end
    object ODSClaimDescriptionSTATENUM: TStringField
      FieldName = 'STATENUM'
      Size = 64
    end
    object ODSClaimDescriptionAVTOSERVIS: TStringField
      FieldName = 'AVTOSERVIS'
      Size = 64
    end
    object ODSClaimDescriptionMODEL: TStringField
      FieldName = 'MODEL'
      Size = 64
    end
    object ODSClaimDescriptionAPPDATE: TDateTimeField
      FieldName = 'APPDATE'
    end
    object ODSClaimDescriptionLETTERDATE: TDateTimeField
      FieldName = 'LETTERDATE'
    end
    object ODSClaimDescriptionLETTERNUM: TStringField
      FieldName = 'LETTERNUM'
      Size = 16
    end
    object ODSClaimDescriptionSPRNUM: TStringField
      FieldName = 'SPRNUM'
      Size = 16
    end
    object ODSClaimDescriptionPRTNUM: TStringField
      FieldName = 'PRTNUM'
      Size = 16
    end
    object ODSClaimDescriptionACTDATE: TDateTimeField
      FieldName = 'ACTDATE'
    end
  end
  object DSIntends: TDataSource
    DataSet = ODSIntends
    Left = 240
    Top = 424
  end
  object ODSIntends: TOracleDataSet
    SQL.Strings = (
      'select * from ins_dict_autointends')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 320
    Top = 424
    object ODSIntendsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSIntendsNAME: TStringField
      FieldName = 'NAME'
      Size = 32
    end
  end
  object DSConditions: TDataSource
    DataSet = ODSConditions
    Left = 424
    Top = 304
  end
  object ODSConditions: TOracleDataSet
    SQL.Strings = (
      'select icond.rowid,icond.* from ins_dict_conditions icond')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 424
    Top = 232
    object ODSConditionsID: TFloatField
      FieldName = 'ID'
    end
    object ODSConditionsNAME: TStringField
      FieldName = 'NAME'
      Size = 1024
    end
  end
  object ODSTarifStates: TOracleDataSet
    SQL.Strings = (
      'select its.rowid, its.* from ins_tarif_states its'
      ''
      'where bank_id = :bank_id')
    Variables.Data = {
      0300000001000000080000003A42414E4B5F4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000200000049440100000000000700000042414E4B5F494401
      00000000000800000053544154455F4944010000000000}
    Master = ODSBanks
    MasterFields = 'ID'
    DetailFields = 'BANK_ID'
    Session = sboapiDataModule.SBSession
    Left = 512
    Top = 264
    object ODSTarifStatesID: TFloatField
      FieldName = 'ID'
    end
    object ODSTarifStatesBANK_ID: TFloatField
      FieldName = 'BANK_ID'
    end
    object ODSTarifStatesSTATE_ID: TFloatField
      FieldName = 'STATE_ID'
    end
    object ODSTarifStatesStates: TStringField
      FieldKind = fkLookup
      FieldName = 'States'
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'STATE_ID'
      Lookup = True
    end
  end
  object DSTarifStates: TDataSource
    DataSet = ODSTarifStates
    Left = 512
    Top = 320
  end
  object ODSTariffs: TOracleDataSet
    SQL.Strings = (
      'select it.rowid, it.* from INS_TARIFFS it'
      ''
      'where franshiz_id = :franshiz_id')
    Variables.Data = {
      03000000010000000C0000003A4652414E5348495A5F49440400000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000200000049440100000000000B0000004652414E5348495A
      5F494401000000000007000000414D4D4F554E54010000000000}
    MasterFields = 'ID'
    DetailFields = 'FRANSHIZ_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 432
    Top = 392
    object ODSTariffsID: TFloatField
      FieldName = 'ID'
    end
    object ODSTariffsFRANSHIZ_ID: TFloatField
      FieldName = 'FRANSHIZ_ID'
    end
    object ODSTariffsAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
  end
  object DSTariffs: TDataSource
    DataSet = ODSTariffs
    Left = 512
    Top = 392
  end
  object ODSCustTypes: TOracleDataSet
    SQL.Strings = (
      'select *from ins_dict_custtypes where id=:id'
      ' ')
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 586
    Top = 157
    object ODSCustTypesID: TFloatField
      FieldName = 'ID'
    end
    object ODSCustTypesNAME: TStringField
      FieldName = 'NAME'
      Size = 256
    end
  end
  object ODSReport: TOracleDataSet
    SQL.Strings = (
      
        'SELECT ic.surname || '#39' '#39' || ic.NAME || '#39' '#39' || ic.fathername AS N' +
        'AME,'
      
        '       ic.surname || '#39' '#39' || ic.NAME || '#39' '#39' || ic.fathername AS N' +
        'AME2,'
      
        '       ic.address insuredaddress,ic.mobilephone,ic.homephone,ins' +
        'uredtype, insuredcolor as inscolor,insuredcolor||'#39' ,'#39'||insuredty' +
        'pe||'#39', '#39'||insuredoutputyear as insuredcolor, insuredoutputyear,'
      
        '       insuredmark||'#39'  '#39'||  insuredmodel as insuredmodel, insure' +
        'dstatenum, underframenum, insuredbannum,'
      
        '       insuredenginenum,driveintended,numseats,extrafranshiz,im.' +
        'franshiz,'
      
        '       ins_pkg_motorkasco.getdraccesspeople(im.id) AS driveacces' +
        'spiople,'
      
        '       ins_pkg_motorkasco.getAccessoriesName(ict.id) AS accessor' +
        'iesname,'
      '       im.drivecost as avtocost, im.inssumm,  '
      '       to_char(ict.begin_date, '#39'dd/mm/yyyy'#39') begindate, '
      #9'to_char(ict.begin_date, '#39'dd/mm/yyyy'#39') begindate2, '
      '       to_char(ict.ins_date, '#39'dd/mm/yyyy'#39') insdate,'
      '       to_char(ict.end_date, '#39'dd/mm/yyyy'#39') enddate, '
      '       ict.policy_num policynum,ict.beneficiary,ict.conditions,'
      '       theft,fire, explosion,trafficaccident, impactanyobject,'
      '       im.ammount,ic.sex,'
      '       val.valu_name valute,val.val_name , '
      '       ia.surname||'#39' '#39'||ia.name||'#39' '#39'||ia.fathername as agent, '
      '       ict.loanacc_id, ict.curracc_id'
      '  FROM ins_contracts ict,'
      '       ins_motorkasco im,      '
      '       ins_mk_policy imp,'
      '       ins_customers ic,'
      '       avalute val,'
      '       ins_agents ia'
      ' WHERE '
      'ic.ID = ict.kli_id '
      'and ict.id = im.cid'
      'and ict.id = imp.cid  '
      'and ict.valute_id = val.valute(+)'
      'and ict.agent_id = ia.id(+)'
      'and ict.id = :CID'
      ''
      '')
    Variables.Data = {
      0300000001000000040000003A43494403000000040000002B01000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000029000000040000004E414D450100000000000B000000494E53555245
      44545950450100000000000C000000494E5355524544434F4C4F520100000000
      0011000000494E53555245444F5554505554594541520100000000000C000000
      494E53555245444D4F44454C0100000000000F000000494E5355524544535441
      54454E554D0100000000000D000000554E4445524652414D454E554D01000000
      00000D000000494E535552454442414E4E554D01000000000010000000494E53
      55524544454E47494E454E554D01000000000011000000445249564541434345
      535350494F504C4501000000000009000000424547494E444154450100000000
      0009000000504F4C4943594E554D010000000000050000005448454654010000
      0000000400000046495245010000000000090000004558504C4F53494F4E0100
      000000000F000000545241464649434143434944454E540100000000000F0000
      00494D50414354414E594F424A45435401000000000007000000454E44444154
      450100000000000A000000424547494E44415445320100000000000A0000004C
      4F414E4143435F49440100000000000A000000435552524143435F4944010000
      0000000600000056414C555445010000000000050000004147454E5401000000
      0000050000004E414D45320100000000000F0000004143434553534F52494553
      4E414D4501000000000007000000494E53444154450100000000000B00000042
      454E4546494349415259010000000000030000005345580100000000000D0000
      004452495645494E54454E4445440100000000000A000000434F4E444954494F
      4E53010000000000080000004E554D53454154530100000000000D0000004558
      5452414652414E5348495A010000000000080000004652414E5348495A010000
      000000080000004156544F434F535401000000000007000000494E5353554D4D
      01000000000007000000414D4D4F554E540100000000000E000000494E535552
      4544414444524553530100000000000B0000004D4F42494C4550484F4E450100
      0000000009000000484F4D4550484F4E4501000000000008000000494E53434F
      4C4F520100000000000800000056414C5F4E414D45010000000000}
    Session = sboapiDataModule.SBSession
    Left = 360
    Top = 368
    object ODSReportNAME: TStringField
      FieldName = 'NAME'
      Size = 386
    end
    object ODSReportINSUREDTYPE: TStringField
      FieldName = 'INSUREDTYPE'
      Size = 128
    end
    object ODSReportINSUREDCOLOR: TStringField
      FieldName = 'INSUREDCOLOR'
      Size = 128
    end
    object ODSReportINSUREDOUTPUTYEAR: TIntegerField
      FieldName = 'INSUREDOUTPUTYEAR'
    end
    object ODSReportINSUREDMODEL: TStringField
      FieldName = 'INSUREDMODEL'
      Size = 32
    end
    object ODSReportINSUREDSTATENUM: TStringField
      FieldName = 'INSUREDSTATENUM'
      Size = 32
    end
    object ODSReportUNDERFRAMENUM: TStringField
      FieldName = 'UNDERFRAMENUM'
      Size = 32
    end
    object ODSReportINSUREDBANNUM: TStringField
      FieldName = 'INSUREDBANNUM'
      Size = 32
    end
    object ODSReportDRIVEACCESSPIOPLE: TStringField
      FieldName = 'DRIVEACCESSPIOPLE'
      Size = 258
    end
    object ODSReportINSUREDENGINENUM: TStringField
      FieldName = 'INSUREDENGINENUM'
      Size = 32
    end
    object ODSReportACCESSORIESNAME: TStringField
      FieldName = 'ACCESSORIESNAME'
      Size = 4000
    end
    object ODSReportBEGINDATE: TStringField
      FieldName = 'BEGINDATE'
      Size = 10
    end
    object ODSReportINSDATE: TStringField
      FieldName = 'INSDATE'
      Size = 10
    end
    object ODSReportENDDATE: TStringField
      FieldName = 'ENDDATE'
      Size = 10
    end
    object ODSReportPOLICYNUM: TStringField
      FieldName = 'POLICYNUM'
    end
    object ODSReportTHEFT: TFloatField
      FieldName = 'THEFT'
    end
    object ODSReportFIRE: TFloatField
      FieldName = 'FIRE'
    end
    object ODSReportTRAFFICACCIDENT: TFloatField
      FieldName = 'TRAFFICACCIDENT'
    end
    object ODSReportIMPACTANYOBJECT: TFloatField
      FieldName = 'IMPACTANYOBJECT'
    end
    object ODSReportEXPLOSION: TFloatField
      FieldName = 'EXPLOSION'
    end
    object ODSReportAGENT: TStringField
      FieldName = 'AGENT'
      Size = 386
    end
    object ODSReportVALUTE: TStringField
      DisplayWidth = 20
      FieldName = 'VALUTE'
      Size = 30
    end
    object ODSReportBENEFICIARY: TStringField
      FieldName = 'BENEFICIARY'
      Size = 1024
    end
    object ODSReportLOANACC_ID: TFloatField
      FieldName = 'LOANACC_ID'
    end
    object ODSReportCURRACC_ID: TFloatField
      FieldName = 'CURRACC_ID'
    end
    object ODSReportDRIVEINTENDED: TStringField
      FieldName = 'DRIVEINTENDED'
      Size = 128
    end
    object ODSReportSEX: TIntegerField
      FieldName = 'SEX'
    end
    object ODSReportNUMSEATS: TStringField
      FieldName = 'NUMSEATS'
      Size = 32
    end
    object ODSReportFRANSHIZ: TFloatField
      FieldName = 'FRANSHIZ'
    end
    object ODSReportEXTRAFRANSHIZ: TStringField
      FieldName = 'EXTRAFRANSHIZ'
      Size = 32
    end
    object ODSReportAVTOCOST: TFloatField
      FieldName = 'AVTOCOST'
    end
    object ODSReportINSSUMM: TFloatField
      FieldName = 'INSSUMM'
    end
    object ODSReportAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSReportINSUREDADDRESS: TStringField
      FieldName = 'INSUREDADDRESS'
      Size = 1024
    end
    object ODSReportMOBILEPHONE: TStringField
      FieldName = 'MOBILEPHONE'
      Size = 32
    end
    object ODSReportHOMEPHONE: TStringField
      FieldName = 'HOMEPHONE'
      Size = 32
    end
    object ODSReportINSCOLOR: TStringField
      FieldName = 'INSCOLOR'
      Size = 32
    end
    object ODSReportVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
  end
end
