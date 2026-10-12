object InsMKDataMod: TInsMKDataMod
  OldCreateOrder = False
  Left = 207
  Top = 105
  Height = 480
  Width = 696
  object DSMarks: TDataSource
    DataSet = ODSMarks
    Left = 51
    Top = 18
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
    Left = 99
    Top = 18
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
      'order by name')
    Variables.Data = {
      0300000001000000080000003A4D41524B5F4944040000000800000000000000
      0000454000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000040000004E414D4501000000
      0000070000004D41524B5F49440100000000000B00000043414C434F5054494F
      4E53010000000000}
    Master = ODSMarks
    MasterFields = 'ID'
    DetailFields = 'MARK_ID'
    Session = sboapiDataModule.SBSession
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
    Left = 51
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
    Top = 18
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
      'SELECT a.id, a.surname || '#39'  '#39' ||a.name name, a.ADDRESS'
      '  FROM ins_customers a'
      '  order by a.surname'
      ''
      ')')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000040000004E414D4501000000
      00000700000041444452455353010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 392
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
  end
  object DSCusts: TDataSource
    DataSet = ODSCusts
    Left = 392
    Top = 64
  end
  object pkgMotorKasco: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_PKG_MOTORKASCO'
    Left = 203
    Top = 290
  end
  object OPCOMMON: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_COMMON'
    Left = 282
    Top = 290
  end
  object ODSMotorkasko: TOracleDataSet
    SQL.Strings = (
      'select mk.rowid, mk.* from ins_motorkasco mk '
      'where mk.id = :id')
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000015000000020000004944010000000000060000004B4C495F49440100
      000000000B000000494E5355524544545950450100000000000C000000494E53
      55524544434F4C4F5201000000000011000000494E53555245444F5554505554
      594541520100000000000F000000494E535552454453544154454E554D010000
      0000000D000000554E4445524652414D454E554D0100000000000D000000494E
      535552454442414E4E554D01000000000010000000494E5355524544454E4749
      4E454E554D0100000000000D0000004452495645494E54454E44454401000000
      0000090000004452495645434F535401000000000009000000424547494E4441
      544501000000000007000000454E444441544501000000000006000000545950
      4549440100000000000600000042454E5F49440100000000000C000000434C4F
      53455F5052454649580100000000000700000042414E4B5F4944010000000000
      080000004D4F4E54485F49440100000000000B000000494E53555245444D4152
      4B0100000000000C000000494E53555245444D4F44454C0100000000000B0000
      0042454E4546494349415259010000000000}
    Session = sboapiDataModule.SBSession
    Left = 466
    Top = 204
    object ODSMotorkaskoID: TFloatField
      FieldName = 'ID'
    end
    object ODSMotorkaskoINSUREDTYPE: TStringField
      FieldName = 'INSUREDTYPE'
      Size = 128
    end
    object ODSMotorkaskoINSUREDCOLOR: TStringField
      FieldName = 'INSUREDCOLOR'
      Size = 32
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
      DisplayFormat = '#,##0.00'
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
    object ODSMotorkaskoBEN_ID: TFloatField
      FieldName = 'BEN_ID'
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
    object ODSMotorkaskoBENEFICIARY: TStringField
      FieldName = 'BENEFICIARY'
      Size = 1024
    end
  end
  object DSMotorkasco: TDataSource
    DataSet = ODSMotorkasko
    Left = 466
    Top = 252
  end
  object DSContracts: TDataSource
    DataSet = ODSContracts
    Left = 386
    Top = 252
  end
  object ODSContracts: TOracleDataSet
    SQL.Strings = (
      'select ic.rowid, ic.* from ins_contracts ic'
      'where ic.id = :cid')
    Variables.Data = {0300000001000000040000003A434944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001400000002000000494401000000000007000000545950455F494401
      000000000008000000424C414E4B5F494401000000000007000000535547475F
      494401000000000009000000504F4C4943595F49440100000000000800000049
      4E535F444154450100000000000A000000424547494E5F444154450100000000
      0008000000454E445F444154450100000000000900000056414C5554455F4944
      01000000000007000000414D4D4F554E540100000000000C000000434C4F5345
      5F505245464958010000000000060000004B4C495F49440100000000000A0000
      004C4F414E4143435F49440100000000000A000000435552524143435F494401
      00000000000A000000504F4C4943595F4E554D01000000000007000000494E53
      53554D4D010000000000080000004652414E5348495A01000000000006000000
      5441524946460100000000000500000053544154450100000000000800000041
      47454E545F4944010000000000}
    Session = sboapiDataModule.SBSession
    AfterInsert = ODSContractsAfterInsert
    Left = 386
    Top = 204
    object ODSContractsID: TFloatField
      FieldName = 'ID'
    end
    object ODSContractsTYPE_ID: TFloatField
      FieldName = 'TYPE_ID'
      Required = True
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
    object ODSContractsAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
      DisplayFormat = '#,##0.00'
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
      DisplayFormat = '#,##0.00'
    end
    object ODSContractsFRANSHIZ: TFloatField
      FieldName = 'FRANSHIZ'
      DisplayFormat = '#,##0.00'
    end
    object ODSContractsTARIFF: TFloatField
      FieldName = 'TARIFF'
      DisplayFormat = '#,##0.00'
    end
    object ODSContractsSTATE: TIntegerField
      FieldName = 'STATE'
    end
    object ODSContractsAGENT_ID: TFloatField
      FieldName = 'AGENT_ID'
    end
  end
  object DSSex: TDataSource
    DataSet = ODSSex
    Left = 250
    Top = 188
  end
  object DSDrAccessPeople: TDataSource
    DataSet = ODSdrAccessPeople
    Left = 163
    Top = 189
  end
  object ODSdrAccessPeople: TOracleDataSet
    SQL.Strings = (
      'select id.rowid, id.* from ins_draccesspeople id'
      'where CID = :CID')
    Variables.Data = {0300000001000000040000003A434944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000700000003000000434944010000000000040000004E414D45010000
      000000070000005355524E414D450100000000000A0000004641544845524E41
      4D450100000000000800000042495254484441590100000000000C0000004452
      455850455249454E434501000000000003000000534558010000000000}
    Session = sboapiDataModule.SBSession
    AfterInsert = ODSdrAccessPeopleAfterInsert
    Left = 163
    Top = 141
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
      EditMask = '!99/99/00;1;_'
    end
    object ODSdrAccessPeopleDREXPERIENCE: TDateTimeField
      FieldName = 'DREXPERIENCE'
      EditMask = '!99/99/00;1;_'
    end
    object ODSdrAccessPeopleSEX: TIntegerField
      FieldName = 'SEX'
    end
    object ODSdrAccessPeopleSexList: TStringField
      FieldKind = fkLookup
      FieldName = 'SexList'
      LookupDataSet = ODSSex
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'SEX'
      Lookup = True
    end
  end
  object ODSSex: TOracleDataSet
    SQL.Strings = (
      'select 1 as id , '#39'Киши'#39' as name from dual'
      'union all'
      'select 0 as id , '#39'Гадын'#39' as name from dual')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 250
    Top = 140
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
    Left = 107
    Top = 245
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
      '                  where its.state_id = :state )')
    Variables.Data = {
      03000000020000000C0000003A52454C45415345594541520300000000000000
      00000000060000003A5354415445030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000002000000494401000000000009000000424547494E444154
      4501000000000007000000454E44444154450100000000000800000053544154
      455F4944010000000000}
    Session = sboapiDataModule.SBSession
    Left = 35
    Top = 333
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
    Left = 35
    Top = 245
    object ODSFranshizFRANSHIZ: TFloatField
      FieldName = 'FRANSHIZ'
    end
    object ODSFranshizTARIFF: TFloatField
      FieldName = 'TARIFF'
    end
  end
  object ODSBenType: TOracleDataSet
    SQL.Strings = (
      'select 0 as ID, '#39'Банк'#39' as name from dual'
      'UNION ALL'
      'select 1 as ID, '#39'Сыьорта етдирян'#39' as name from dual')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 208
    Top = 16
  end
  object DSBenType: TDataSource
    DataSet = ODSBenType
    Left = 208
    Top = 64
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
    Left = 392
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
    Left = 392
    Top = 165
  end
  object ODSAgent: TOracleDataSet
    SQL.Strings = (
      
        'select id, Surname||'#39' '#39'||Name||'#39' '#39'||Fathername as name from ins_' +
        'Agents'
      'order by surname')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 320
    Top = 136
    object ODSAgentID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSAgentNAME: TStringField
      FieldName = 'NAME'
      Size = 386
    end
  end
  object DSAgent: TDataSource
    DataSet = ODSAgent
    Left = 320
    Top = 184
  end
end
