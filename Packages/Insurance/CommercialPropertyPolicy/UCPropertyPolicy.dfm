object PolicyDataModule: TPolicyDataModule
  OldCreateOrder = False
  Left = 169
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
    Top = 8
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
    Left = 312
    Top = 8
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
    Left = 416
    Top = 8
  end
  object DSContracts: TDataSource
    DataSet = ODSContracts
    Left = 120
    Top = 133
  end
  object ODSContracts: TOracleDataSet
    SQL.Strings = (
      'select ic.rowid, ic.* from ins_contracts ic'
      'where id= :cid'
      'and type_id = 5')
    Variables.Data = {0300000001000000040000003A434944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001400000002000000494401000000000007000000545950455F494401
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
      49415259010000000000}
    Session = sboapiDataModule.SBSession
    Left = 32
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
      Size = 32
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
    object ODSContractsPNUM: TFloatField
      FieldName = 'PNUM'
    end
    object ODSContractsBEN_ID: TFloatField
      FieldName = 'BEN_ID'
    end
    object ODSContractsBENEFICIARY: TStringField
      FieldName = 'BENEFICIARY'
      Size = 1024
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
    Top = 128
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
    Left = 320
    Top = 125
  end
  object ODSCProperty: TOracleDataSet
    SQL.Strings = (
      
        'select  icp.rowid,icp.* from ins_commercialproperty icp where ci' +
        'd=:cid')
    Variables.Data = {0300000001000000040000003A434944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000003C0000000200000049440100000000000F00000046554C4C44455343
      52495054494F4E0100000000000B0000004C4F434154494F4E4F424A01000000
      00000F0000005945415253494E425553494E4553530100000000000D00000042
      55494C44494E47555341474501000000000009000000434F4E53545945415201
      000000000009000000464C4F4F52534E554D0100000000000600000057414C4C
      534D010000000000090000004345494C494E47534D0100000000000500000052
      4F4F464D01000000000004000000415245410100000000000E0000004150504C
      4943414E5453504143450100000000001100000045415254485155414B454445
      5441494C5301000000000008000000464C414D41424C45010000000000120000
      00535552524F494E44494E4744455441494C5301000000000008000000534954
      554554454401000000000005000000475541524401000000000005000000414C
      41524D010000000000050000004C4F434B530100000000000D00000053454355
      524954594C4F434B530100000000000400000042415253010000000000050000
      004F544845520100000000000800000053455454494E47530100000000000600
      0000524550414952010000000000060000004845415445440100000000000600
      00005249534B494401000000000006000000414E4E55414C0100000000000500
      000057414745530100000000000400000052454E540100000000000800000045
      4D504C4F5945530100000000000800000045585049524954590100000000000B
      0000004C4F5353484953544F52590100000000000700000052454E4557414C01
      00000000000A00000054484952445041525459010000000000080000004F5448
      4552494E460100000000000A000000494E44454D494E49545901000000000009
      00000056414C554554595045010000000000090000004255494C44494E475301
      000000000007000000434F4E54454E540100000000000900000045515549504D
      454E5401000000000005000000474C4153530100000000000400000043415348
      0100000000000900000057415245484F5553450100000000000500000053544F
      434B0100000000000800000050524F44554354530100000000000E000000574F
      524B494E50524F47524553530100000000000C0000005241574D415445524941
      4C530100000000000C000000434C4F53455F5052454649580100000000000600
      00005459504549440100000000000800000050524F4649544944010000000000
      070000004147454E544944010000000000030000004349440100000000000800
      00004652414E5348495A01000000000007000000494E5353554D4D0100000000
      0007000000414D4D4F554E54010000000000080000004D4F4E54485F49440100
      0000000004000000434F53540100000000000700000042414E4B5F4944010000
      000000060000005441524946460100000000000B000000494E53555245445F4F
      424A010000000000}
    Session = sboapiDataModule.SBSession
    Left = 220
    Top = 200
    object ODSCPropertyID: TFloatField
      FieldName = 'ID'
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
    Left = 324
    Top = 200
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
    Top = 264
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
    Top = 264
  end
  object ODSReport: TOracleDataSet
    SQL.Strings = (
      
        'SELECT ic.surname || '#39' '#39' || ic.NAME || '#39' '#39' || ic.fathername AS N' +
        'AME,'
      
        '       ic.surname || '#39' '#39' || ic.NAME || '#39' '#39' || ic.fathername AS N' +
        'AME2,'
      
        '       ic.address,im.inssumm ,'#39'(mob.):'#39'||ic.mobilephone||'#39'; (ev)' +
        ':'#39'||ic.homephone as phone,  '
      '       to_char(ict.begin_date, '#39'dd/mm/yyyy'#39') begindate, '
      #9'to_char(ict.begin_date, '#39'dd/mm/yyyy'#39') begindate2, '
      '       to_char(ict.ins_date, '#39'dd/mm/yyyy'#39') insdate,'
      '       to_char(ict.end_date, '#39'dd/mm/yyyy'#39') enddate, '
      '       ict.policy_num policynum,ict.beneficiary,       '
      '       im.ammount,im.franshiz,im.cost,'
      '       val.val_name valute,im.locationobj,im.insured_obj, '
      '       ia.surname||'#39' '#39'||ia.name||'#39' '#39'||ia.fathername as agent, '
      '       ict.loanacc_id, ict.curracc_id'
      '  FROM ins_contracts ict,'
      '       ins_commercialproperty im,             '
      '       ins_customers ic,'
      '       avalute val,'
      '       ins_agents ia'
      ' WHERE '
      'ic.ID = ict.kli_id '
      'and ict.id = im.cid'
      'and ict.valute_id = val.valute(+)'
      'and ict.agent_id = ia.id(+)'
      'and ict.id = :CID'
      ''
      '')
    Variables.Data = {0300000001000000040000003A434944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000014000000040000004E414D4501000000000007000000414444524553
      5301000000000009000000424547494E4441544501000000000009000000504F
      4C4943594E554D01000000000007000000454E44444154450100000000000A00
      0000424547494E44415445320100000000000A0000004C4F414E4143435F4944
      0100000000000A000000435552524143435F4944010000000000060000005641
      4C555445010000000000050000004147454E54010000000000050000004E414D
      453201000000000007000000494E53444154450100000000000B00000042454E
      454649434941525901000000000007000000494E5353554D4D01000000000007
      000000414D4D4F554E54010000000000080000004652414E5348495A01000000
      00000500000050484F4E450100000000000B0000004C4F434154494F4E4F424A
      0100000000000B000000494E53555245445F4F424A0100000000000400000043
      4F5354010000000000}
    Session = sboapiDataModule.SBSession
    Left = 224
    Top = 264
    object ODSReportNAME: TStringField
      FieldName = 'NAME'
      Size = 386
    end
    object ODSReportNAME2: TStringField
      FieldName = 'NAME2'
      Size = 386
    end
    object ODSReportADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 1024
    end
    object ODSReportINSSUMM: TFloatField
      FieldName = 'INSSUMM'
    end
    object ODSReportBEGINDATE: TStringField
      FieldName = 'BEGINDATE'
      Size = 10
    end
    object ODSReportBEGINDATE2: TStringField
      FieldName = 'BEGINDATE2'
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
      Size = 32
    end
    object ODSReportBENEFICIARY: TStringField
      FieldName = 'BENEFICIARY'
      Size = 1024
    end
    object ODSReportAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSReportVALUTE: TStringField
      FieldName = 'VALUTE'
      Size = 25
    end
    object ODSReportAGENT: TStringField
      FieldName = 'AGENT'
      Size = 386
    end
    object ODSReportLOANACC_ID: TFloatField
      FieldName = 'LOANACC_ID'
    end
    object ODSReportCURRACC_ID: TFloatField
      FieldName = 'CURRACC_ID'
    end
    object ODSReportFRANSHIZ: TFloatField
      FieldName = 'FRANSHIZ'
    end
    object ODSReportPHONE: TStringField
      FieldName = 'PHONE'
      Size = 65
    end
    object ODSReportLOCATIONOBJ: TStringField
      FieldName = 'LOCATIONOBJ'
      Size = 1024
    end
    object ODSReportINSURED_OBJ: TStringField
      FieldName = 'INSURED_OBJ'
      Size = 32
    end
    object ODSReportCOST: TFloatField
      FieldName = 'COST'
    end
  end
end
