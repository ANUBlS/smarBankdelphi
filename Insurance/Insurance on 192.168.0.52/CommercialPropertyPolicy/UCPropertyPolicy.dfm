object PolicyDataModule: TPolicyDataModule
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 480
  Width = 607
  object OPCOMMON: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_COMMON'
    Left = 24
    Top = 8
  end
  object ODSCustomers: TOracleDataSet
    SQL.Strings = (
      
        'select c.rowid,c.id,c.name||'#39' '#39'||c.surname||'#39' '#39'||c.fathername as' +
        ' name,c.address,c.mobilephone,c.fax from ins_customers c where i' +
        'd=:id')
    Variables.Data = {0300000001000000030000003A4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000005000000020000004944010000000000040000004E414D4501000000
      000007000000414444524553530100000000000B0000004D4F42494C4550484F
      4E4501000000000003000000464158010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 28
    Top = 72
    object ODSCustomersID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ODSCustomersNAME: TStringField
      FieldName = 'NAME'
      Size = 386
    end
    object ODSCustomersADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 1024
    end
    object ODSCustomersMOBILEPHONE: TStringField
      FieldName = 'MOBILEPHONE'
      Size = 32
    end
    object ODSCustomersFAX: TStringField
      FieldName = 'FAX'
      Size = 32
    end
  end
  object ODSCustomersSource: TDataSource
    DataSet = ODSCustomers
    Left = 132
    Top = 72
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
    Left = 124
    Top = 8
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
  object BeneficiarySource: TDataSource
    DataSet = ODSBeneficiary
    Left = 220
  end
  object ODSCondition: TOracleDataSet
    SQL.Strings = (
      
        'select idr.rowid, idr.* from ins_dict_conditions idr where id=:v' +
        'id')
    Variables.Data = {0300000001000000040000003A564944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 240
    Top = 72
    object ODSConditionID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSConditionNAME: TStringField
      FieldName = 'NAME'
      Size = 1024
    end
  end
  object ConditionSource: TDataSource
    DataSet = ODSCondition
    Left = 320
    Top = 64
  end
  object FranshizData: TDataSource
    DataSet = Franshiz
    Left = 296
    Top = 133
  end
  object Franshiz: TOracleDataSet
    SQL.Strings = (
      'select idr.rowid, idr.* from ins_dict_franshiz idr where id=:fid')
    Variables.Data = {0300000001000000040000003A464944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 216
    Top = 133
    object FranshizID: TFloatField
      FieldName = 'ID'
    end
    object FranshizNAME: TStringField
      FieldName = 'NAME'
      Size = 1024
    end
  end
  object DSContracts: TDataSource
    DataSet = ODSContracts
    Left = 120
    Top = 133
  end
  object ODSContracts: TOracleDataSet
    SQL.Strings = (
      'select ic.rowid, ic.* from ins_contracts ic'
      'where blank_id = :blankid'
      'and type_id = 5')
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
    Left = 32
    Top = 136
    object ODSContractsID: TFloatField
      FieldName = 'ID'
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
      Size = 32
    end
  end
  object ODSAgent: TOracleDataSet
    SQL.Strings = (
      
        'select id,(name||'#39' '#39'||surname||'#39' '#39'||fathername) as name from ins' +
        '_agents')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000040000004E414D4501000000000002000000494401000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 32
    Top = 200
    object ODSAgentID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSAgentNAME: TStringField
      FieldName = 'NAME'
      Size = 386
    end
  end
  object AgentSource: TDataSource
    DataSet = ODSAgent
    Left = 112
    Top = 197
  end
  object ODSCPropertySuggest: TOracleDataSet
    SQL.Strings = (
      'select icp.rowid, icp.* from ins_cproperty_suggest icp'
      'where bid = :bid'
      '')
    Variables.Data = {0300000001000000040000003A424944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A000000020000004944010000000000030000004249440100000000
      000B0000005249534B4144445245535301000000000010000000494E53555241
      4E4345414D4D4F554E5401000000000007000000454E44444154450100000000
      00070000005249534B5F49440100000000000600000046525A5F494401000000
      000007000000434E44545F49440100000000000600000056414C5F4944010000
      0000000C000000494E535552414E434553554D010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 216
    Top = 200
    object ODSCPropertySuggestID: TFloatField
      FieldName = 'ID'
    end
    object ODSCPropertySuggestBID: TFloatField
      FieldName = 'BID'
    end
    object ODSCPropertySuggestRISKADDRESS: TStringField
      FieldName = 'RISKADDRESS'
      Size = 256
    end
    object ODSCPropertySuggestINSURANCEAMMOUNT: TFloatField
      FieldName = 'INSURANCEAMMOUNT'
    end
    object ODSCPropertySuggestENDDATE: TDateTimeField
      FieldName = 'ENDDATE'
    end
    object ODSCPropertySuggestRISK_ID: TFloatField
      FieldName = 'RISK_ID'
    end
    object ODSCPropertySuggestFRZ_ID: TFloatField
      FieldName = 'FRZ_ID'
    end
    object ODSCPropertySuggestCNDT_ID: TFloatField
      FieldName = 'CNDT_ID'
    end
    object ODSCPropertySuggestVAL_ID: TFloatField
      FieldName = 'VAL_ID'
    end
    object ODSCPropertySuggestINSURANCESUM: TFloatField
      FieldName = 'INSURANCESUM'
    end
  end
  object CPSuggestSource: TDataSource
    DataSet = ODSCPropertySuggest
    Left = 216
    Top = 269
  end
  object ODSCProperty: TOracleDataSet
    SQL.Strings = (
      
        'select  icp.rowid,icp.* from ins_commercialproperty icp where id' +
        '=:id')
    Variables.Data = {0300000001000000030000003A4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000034000000020000004944010000000000060000004B4C495F49440100
      000000000F00000046554C4C4445534352495054494F4E0100000000000B0000
      004C4F434154494F4E4F424A0100000000000F0000005945415253494E425553
      494E4553530100000000000D0000004255494C44494E47555341474501000000
      000009000000434F4E53545945415201000000000009000000464C4F4F52534E
      554D0100000000000600000057414C4C534D010000000000090000004345494C
      494E47534D01000000000005000000524F4F464D010000000000040000004152
      45410100000000000E0000004150504C4943414E545350414345010000000000
      1100000045415254485155414B4544455441494C530100000000000800000046
      4C414D41424C4501000000000012000000535552524F494E44494E4744455441
      494C530100000000000800000053495455455445440100000000000500000047
      5541524401000000000005000000414C41524D010000000000050000004C4F43
      4B530100000000000D00000053454355524954594C4F434B5301000000000004
      00000042415253010000000000050000004F5448455201000000000008000000
      53455454494E4753010000000000060000005245504149520100000000000600
      0000484541544544010000000000060000005249534B49440100000000000600
      0000414E4E55414C010000000000050000005741474553010000000000040000
      0052454E5401000000000008000000454D504C4F594553010000000000080000
      0045585049524954590100000000000B0000004C4F5353484953544F52590100
      000000000700000052454E4557414C0100000000000A00000054484952445041
      525459010000000000080000004F54484552494E460100000000000A00000049
      4E44454D494E4954590100000000000900000056414C55455459504501000000
      0000090000004255494C44494E475301000000000007000000434F4E54454E54
      0100000000000900000045515549504D454E5401000000000005000000474C41
      535301000000000004000000434153480100000000000900000057415245484F
      5553450100000000000500000053544F434B0100000000000800000050524F44
      554354530100000000000E000000574F524B494E50524F475245535301000000
      00000C0000005241574D4154455249414C530100000000000C000000434C4F53
      455F505245464958010000000000060000005459504549440100000000000800
      000050524F4649544944010000000000070000004147454E5449440100000000
      00}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 340
    Top = 200
    object ODSCPropertyID: TFloatField
      FieldName = 'ID'
    end
    object ODSCPropertyKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object ODSCPropertyFULLDESCRIPTION: TStringField
      FieldName = 'FULLDESCRIPTION'
      Size = 1024
    end
    object ODSCPropertyLOCATIONOBJ: TStringField
      FieldName = 'LOCATIONOBJ'
      Size = 1024
    end
    object ODSCPropertyYEARSINBUSINESS: TStringField
      FieldName = 'YEARSINBUSINESS'
      Size = 32
    end
    object ODSCPropertyBUILDINGUSAGE: TStringField
      FieldName = 'BUILDINGUSAGE'
      Size = 128
    end
    object ODSCPropertyCONSTYEAR: TDateTimeField
      FieldName = 'CONSTYEAR'
    end
    object ODSCPropertyFLOORSNUM: TIntegerField
      FieldName = 'FLOORSNUM'
    end
    object ODSCPropertyWALLSM: TStringField
      FieldName = 'WALLSM'
      Size = 128
    end
    object ODSCPropertyCEILINGSM: TStringField
      FieldName = 'CEILINGSM'
      Size = 128
    end
    object ODSCPropertyROOFM: TStringField
      FieldName = 'ROOFM'
      Size = 128
    end
    object ODSCPropertyAREA: TFloatField
      FieldName = 'AREA'
    end
    object ODSCPropertyAPPLICANTSPACE: TFloatField
      FieldName = 'APPLICANTSPACE'
    end
    object ODSCPropertyEARTHQUAKEDETAILS: TStringField
      FieldName = 'EARTHQUAKEDETAILS'
      Size = 128
    end
    object ODSCPropertyFLAMABLE: TStringField
      FieldName = 'FLAMABLE'
      Size = 1024
    end
    object ODSCPropertySURROINDINGDETAILS: TStringField
      FieldName = 'SURROINDINGDETAILS'
      Size = 1024
    end
    object ODSCPropertySITUETED: TStringField
      FieldName = 'SITUETED'
      Size = 32
    end
    object ODSCPropertyGUARD: TStringField
      FieldName = 'GUARD'
      Size = 32
    end
    object ODSCPropertyALARM: TStringField
      FieldName = 'ALARM'
      Size = 32
    end
    object ODSCPropertyLOCKS: TStringField
      FieldName = 'LOCKS'
      Size = 32
    end
    object ODSCPropertySECURITYLOCKS: TStringField
      FieldName = 'SECURITYLOCKS'
      Size = 32
    end
    object ODSCPropertyBARS: TStringField
      FieldName = 'BARS'
      Size = 32
    end
    object ODSCPropertyOTHER: TStringField
      FieldName = 'OTHER'
      Size = 128
    end
    object ODSCPropertySETTINGS: TStringField
      FieldName = 'SETTINGS'
      Size = 1024
    end
    object ODSCPropertyREPAIR: TStringField
      FieldName = 'REPAIR'
      Size = 1024
    end
    object ODSCPropertyHEATED: TStringField
      FieldName = 'HEATED'
      Size = 128
    end
    object ODSCPropertyRISKID: TFloatField
      FieldName = 'RISKID'
    end
    object ODSCPropertyANNUAL: TFloatField
      FieldName = 'ANNUAL'
    end
    object ODSCPropertyWAGES: TFloatField
      FieldName = 'WAGES'
    end
    object ODSCPropertyRENT: TFloatField
      FieldName = 'RENT'
    end
    object ODSCPropertyEMPLOYES: TFloatField
      FieldName = 'EMPLOYES'
    end
    object ODSCPropertyEXPIRITY: TDateTimeField
      FieldName = 'EXPIRITY'
    end
    object ODSCPropertyLOSSHISTORY: TStringField
      FieldName = 'LOSSHISTORY'
      Size = 1024
    end
    object ODSCPropertyRENEWAL: TStringField
      FieldName = 'RENEWAL'
      Size = 1024
    end
    object ODSCPropertyTHIRDPARTY: TStringField
      FieldName = 'THIRDPARTY'
      Size = 32
    end
    object ODSCPropertyOTHERINF: TStringField
      FieldName = 'OTHERINF'
      Size = 32
    end
    object ODSCPropertyINDEMINITY: TStringField
      FieldName = 'INDEMINITY'
      Size = 10
    end
    object ODSCPropertyVALUETYPE: TStringField
      FieldName = 'VALUETYPE'
      Size = 128
    end
    object ODSCPropertyBUILDINGS: TFloatField
      FieldName = 'BUILDINGS'
    end
    object ODSCPropertyCONTENT: TFloatField
      FieldName = 'CONTENT'
    end
    object ODSCPropertyEQUIPMENT: TFloatField
      FieldName = 'EQUIPMENT'
    end
    object ODSCPropertyGLASS: TFloatField
      FieldName = 'GLASS'
    end
    object ODSCPropertyCASH: TFloatField
      FieldName = 'CASH'
    end
    object ODSCPropertyWAREHOUSE: TFloatField
      FieldName = 'WAREHOUSE'
    end
    object ODSCPropertySTOCK: TFloatField
      FieldName = 'STOCK'
    end
    object ODSCPropertyPRODUCTS: TFloatField
      FieldName = 'PRODUCTS'
    end
    object ODSCPropertyWORKINPROGRESS: TFloatField
      FieldName = 'WORKINPROGRESS'
    end
    object ODSCPropertyRAWMATERIALS: TFloatField
      FieldName = 'RAWMATERIALS'
    end
    object ODSCPropertyCLOSE_PREFIX: TIntegerField
      FieldName = 'CLOSE_PREFIX'
    end
    object ODSCPropertyTYPEID: TIntegerField
      FieldName = 'TYPEID'
    end
    object ODSCPropertyPROFITID: TFloatField
      FieldName = 'PROFITID'
    end
    object ODSCPropertyAGENTID: TFloatField
      FieldName = 'AGENTID'
    end
  end
  object CPropertySource: TDataSource
    DataSet = ODSCProperty
    Left = 340
    Top = 272
  end
  object ODSRisks: TOracleDataSet
    SQL.Strings = (
      'select *from ins_dict_risks where id=:id')
    Variables.Data = {0300000001000000030000003A4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 32
    Top = 296
    object ODSRisksID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSRisksNAME: TStringField
      FieldName = 'NAME'
      Size = 1024
    end
  end
  object RiskSource: TDataSource
    DataSet = ODSRisks
    Left = 120
    Top = 296
  end
end
