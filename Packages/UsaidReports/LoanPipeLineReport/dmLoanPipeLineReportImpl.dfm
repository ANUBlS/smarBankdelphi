object dmLoanPipeLineReport: TdmLoanPipeLineReport
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = suleDestroy
  Height = 478
  Width = 720
  object CrdPipeLines: TOracleDataSet
    SQL.Strings = (
      'select'
      '     crdp.rowid,'
      '     crdp.id, '
      '     crdp.customername, '
      '     av.val_name, '
      '     crdp.loanamount,sb_aca.getuserbyid (crdp.usid) as usrname,'
      
        '     crdp.customerid ,crdp.pass_ser||crdp.customerid as custid,c' +
        'rdp.pass_ser,'
      
        '     crdtype.description,USAID_REPORT.get_CommittedLevel(crdp.id' +
        ') as comm,'
      '     USAID_REPORT.get_crdlpstatus(crdp.id) as status,'
      '     crdp.currency,'
      
        '     crdp.credittype ,crdp.branchid,crdp.usid,nvl(deny,0) as fde' +
        'ny,nvl(wait,0) as fwait,'
      '     crdp.opendate'
      'from'
      '  creditpipelines crdp,'
      '  avalute av,'
      '  cm_credittypes crdtype'
      'where'
      '      crdp.currency = av.valute and'
      '      crdp.close_dat is null and'
      '      crdp.credittype=crdtype.id '
      '      --and crdp.COMMITTED<>'#39'P5'#39
      'order by :orderfield'
      '')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A004F0052004400450052004600490045004C00
      4400010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000012000000040000004900440001000000000018000000430055005300
      54004F004D00450052004E0041004D004500010000000000140000004C004F00
      41004E0041004D004F0055004E00540001000000000014000000430055005300
      54004F004D00450052004900440001000000000010000000560041004C005F00
      4E0041004D0045000100000000000C0000005300540041005400550053000100
      0000000010000000430055005200520045004E00430059000100000000001000
      00004200520041004E004300480049004400010000000000100000004F005000
      45004E0044004100540045000100000000001400000043005200450044004900
      5400540059005000450001000000000016000000440045005300430052004900
      5000540049004F004E0001000000000008000000550053004900440001000000
      00000A0000004600440045004E0059000100000000000A000000460057004100
      490054000100000000001000000050004100530053005F005300450052000100
      000000000E0000005500530052004E0041004D0045000100000000000C000000
      4300550053005400490044000100000000000800000043004F004D004D000100
      00000000}
    OnApplyRecord = CrdPipeLinesApplyRecord
    Session = sboapiDataModule.SBSession
    Left = 16
    Top = 8
    object CrdPipeLinesID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object CrdPipeLinesCUSTOMERNAME: TWideStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099
      FieldName = 'CUSTOMERNAME'
      Required = True
      Size = 90
    end
    object CrdPipeLinesVAL_NAME: TWideStringField
      DisplayLabel = '$'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object CrdPipeLinesLOANAMOUNT: TFloatField
      DisplayLabel = #1052#1103#1073#1083#1103#1100
      FieldName = 'LOANAMOUNT'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object CrdPipeLinesCUSTOMERID: TWideStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' ID-'#1089#1080
      FieldName = 'CUSTOMERID'
      Required = True
      Size = 25
    end
    object CrdPipeLinesCUSTID: TWideStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' ID-'#1089#1080
      FieldName = 'CUSTID'
      Size = 29
    end
    object CrdPipeLinesDESCRIPTION: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1090#1080#1087#1080
      FieldName = 'DESCRIPTION'
      Size = 128
    end
    object CrdPipeLinesSTATUS: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'STATUS'
      Size = 4000
    end
    object CrdPipeLinesCURRENCY: TFloatField
      FieldName = 'CURRENCY'
      Visible = False
    end
    object CrdPipeLinesBRANCHID: TFloatField
      FieldName = 'BRANCHID'
      Visible = False
    end
    object CrdPipeLinesOPENDATE: TDateTimeField
      DisplayLabel = #1040#1095#1099#1083#1084#1072' '#1090#1072#1088#1080#1093#1080
      FieldName = 'OPENDATE'
    end
    object CrdPipeLinesCREDITTYPE: TFloatField
      FieldName = 'CREDITTYPE'
      Visible = False
    end
    object CrdPipeLinesUSID: TFloatField
      FieldName = 'USID'
      Visible = False
    end
    object CrdPipeLinesFDENY: TWideStringField
      FieldName = 'FDENY'
      Visible = False
      Size = 12
    end
    object CrdPipeLinesFWAIT: TWideStringField
      FieldName = 'FWAIT'
      Visible = False
      Size = 5
    end
    object CrdPipeLinesPASS_SER: TWideStringField
      FieldName = 'PASS_SER'
      Size = 4
    end
    object CrdPipeLinesUSRNAME: TWideStringField
      DisplayLabel = #1048#1089#1090#1080#1092#1072#1076#1103#1095#1080
      FieldName = 'USRNAME'
      Size = 4000
    end
    object CrdPipeLinesCOMM: TWideStringField
      FieldName = 'COMM'
      Visible = False
      Size = 4000
    end
  end
  object CrdPipeLinesds: TDataSource
    DataSet = CrdPipeLines
    Left = 88
    Top = 8
  end
  object USAID_REPORT: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'USAID_REPORT'
    ParameterMode = pmNamed
    Left = 160
    Top = 8
  end
  object filialsclp: TOracleDataSet
    SQL.Strings = (
      'select id,name from filial'
      'order by id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 8
    Top = 56
    object filialsclpID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object filialsclpNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object valutesclp: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name from avalute'
      'order by valute')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C000000560041004C005500540045000100000000001200
      0000560041004C0055005F004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 56
    Top = 56
    object valutesclpVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object valutesclpVALU_NAME: TWideStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
  end
  object crdClp: TOracleDataSet
    SQL.Strings = (
      'select id,description from cm_credittypes'
      'order by id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000002000000040000004900440001000000000016000000440045005300
      4300520049005000540049004F004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 112
    Top = 56
    object crdClpID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object crdClpDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 128
    end
  end
  object filialsclpds: TDataSource
    DataSet = filialsclp
    Left = 8
    Top = 112
  end
  object valutesclpds: TDataSource
    DataSet = valutesclp
    Left = 64
    Top = 112
  end
  object crdClpds: TDataSource
    DataSet = crdClp
    Left = 112
    Top = 112
  end
  object cplapp: TOracleDataSet
    SQL.Strings = (
      
        'SELECT rowid,id, contractid, address_cust, birthdat, name_busine' +
        'ss,'
      '       address_business, activities_dat_business, creditperiod,'
      '       offer_amount, offer_currency, offer_period,'
      '       purposeofcredit, category_credits, credittype'
      '  FROM cplappications'
      '  where contractid=:contid')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A0043004F004E00540049004400030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000E00000004000000490044000100000000001400000043004F004E00
      5400520041004300540049004400010000000000180000004100440044005200
      4500530053005F00430055005300540001000000000010000000420049005200
      540048004400410054000100000000001A0000004E0041004D0045005F004200
      5500530049004E00450053005300010000000000200000004100440044005200
      4500530053005F0042005500530049004E004500530053000100000000002E00
      000041004300540049005600490054004900450053005F004400410054005F00
      42005500530049004E0045005300530001000000000018000000430052004500
      44004900540050004500520049004F004400010000000000180000004F004600
      4600450052005F0041004D004F0055004E0054000100000000001C0000004F00
      46004600450052005F00430055005200520045004E0043005900010000000000
      180000004F0046004600450052005F0050004500520049004F00440001000000
      00001E00000050005500520050004F00530045004F0046004300520045004400
      4900540001000000000020000000430041005400450047004F00520059005F00
      4300520045004400490054005300010000000000140000004300520045004400
      490054005400590050004500010000000000}
    Session = sboapiDataModule.SBSession
    BeforeInsert = cplappBeforeEdit
    BeforeEdit = cplappBeforeEdit
    BeforePost = cplappBeforePost
    OnPostError = cplappPostError
    Left = 8
    Top = 160
    object cplappID: TFloatField
      FieldName = 'ID'
    end
    object cplappCONTRACTID: TFloatField
      FieldName = 'CONTRACTID'
    end
    object cplappADDRESS_CUST: TWideStringField
      FieldName = 'ADDRESS_CUST'
      Required = True
      Size = 180
    end
    object cplappBIRTHDAT: TDateTimeField
      FieldName = 'BIRTHDAT'
      Required = True
    end
    object cplappNAME_BUSINESS: TWideStringField
      FieldName = 'NAME_BUSINESS'
      Size = 120
    end
    object cplappADDRESS_BUSINESS: TWideStringField
      FieldName = 'ADDRESS_BUSINESS'
      Size = 180
    end
    object cplappACTIVITIES_DAT_BUSINESS: TFloatField
      FieldName = 'ACTIVITIES_DAT_BUSINESS'
    end
    object cplappCREDITPERIOD: TFloatField
      FieldName = 'CREDITPERIOD'
      Required = True
    end
    object cplappOFFER_AMOUNT: TFloatField
      FieldName = 'OFFER_AMOUNT'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object cplappOFFER_CURRENCY: TFloatField
      FieldName = 'OFFER_CURRENCY'
      Required = True
    end
    object cplappOFFER_PERIOD: TFloatField
      FieldName = 'OFFER_PERIOD'
      Required = True
    end
    object cplappPURPOSEOFCREDIT: TWideStringField
      FieldName = 'PURPOSEOFCREDIT'
      Required = True
      Size = 120
    end
    object cplappCATEGORY_CREDITS: TFloatField
      FieldName = 'CATEGORY_CREDITS'
      Required = True
    end
    object cplappCREDITTYPE: TFloatField
      FieldName = 'CREDITTYPE'
      Required = True
    end
  end
  object cplappds: TDataSource
    DataSet = cplapp
    Left = 8
    Top = 208
  end
  object cpldocds: TDataSource
    DataSet = cpldoc
    Left = 52
    Top = 216
  end
  object cplriskds: TDataSource
    DataSet = cplrisk
    Left = 104
    Top = 216
  end
  object cplopds: TDataSource
    DataSet = cplop
    Left = 152
    Top = 216
  end
  object cplpayprds: TDataSource
    DataSet = cplpaypr
    Left = 200
    Top = 216
  end
  object cpldoc: TOracleDataSet
    SQL.Strings = (
      'SELECT rowid,a.id, a.contractid, a.pass_ser, a.pass_no, a.voin,'
      '       a.opendatoflease, a.closedatoflease, a.docofhome,'
      
        '       a.marridevidence, a.guarantee_pass_ser, a.guarantee_pass_' +
        'no,'
      
        '       a.guarantee_voin, a.guarantee_docofhome, a.finance_report' +
        's'
      '  FROM cpldocuments a'
      '    where contractid=:contid')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A0043004F004E00540049004400030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000E00000004000000490044000100000000001400000043004F004E00
      5400520041004300540049004400010000000000100000005000410053005300
      5F005300450052000100000000000E00000050004100530053005F004E004F00
      0100000000000800000056004F0049004E000100000000001C0000004F005000
      45004E004400410054004F0046004C0045004100530045000100000000001E00
      000043004C004F00530045004400410054004F0046004C004500410053004500
      0100000000001200000044004F0043004F00460048004F004D00450001000000
      00001C0000004D0041005200520049004400450056004900440045004E004300
      450001000000000024000000470055004100520041004E005400450045005F00
      50004100530053005F0053004500520001000000000022000000470055004100
      520041004E005400450045005F0050004100530053005F004E004F0001000000
      00001C000000470055004100520041004E005400450045005F0056004F004900
      4E0001000000000026000000470055004100520041004E005400450045005F00
      44004F0043004F00460048004F004D0045000100000000001E00000046004900
      4E0041004E00430045005F005200450050004F00520054005300010000000000}
    Session = sboapiDataModule.SBSession
    BeforeInsert = cplappBeforeEdit
    BeforeEdit = cplappBeforeEdit
    OnPostError = cplappPostError
    Left = 52
    Top = 160
    object cpldocID: TFloatField
      FieldName = 'ID'
    end
    object cpldocCONTRACTID: TFloatField
      FieldName = 'CONTRACTID'
      Required = True
    end
    object cpldocPASS_SER: TWideStringField
      FieldName = 'PASS_SER'
      Size = 5
    end
    object cpldocPASS_NO: TWideStringField
      FieldName = 'PASS_NO'
      Size = 12
    end
    object cpldocVOIN: TWideStringField
      FieldName = 'VOIN'
      Size = 25
    end
    object cpldocOPENDATOFLEASE: TDateTimeField
      FieldName = 'OPENDATOFLEASE'
    end
    object cpldocCLOSEDATOFLEASE: TDateTimeField
      FieldName = 'CLOSEDATOFLEASE'
    end
    object cpldocDOCOFHOME: TFloatField
      FieldName = 'DOCOFHOME'
    end
    object cpldocMARRIDEVIDENCE: TFloatField
      FieldName = 'MARRIDEVIDENCE'
    end
    object cpldocGUARANTEE_PASS_SER: TWideStringField
      FieldName = 'GUARANTEE_PASS_SER'
      Size = 5
    end
    object cpldocGUARANTEE_PASS_NO: TWideStringField
      FieldName = 'GUARANTEE_PASS_NO'
      Size = 12
    end
    object cpldocGUARANTEE_VOIN: TWideStringField
      FieldName = 'GUARANTEE_VOIN'
      Size = 25
    end
    object cpldocGUARANTEE_DOCOFHOME: TFloatField
      FieldName = 'GUARANTEE_DOCOFHOME'
    end
    object cpldocFINANCE_REPORTS: TFloatField
      FieldName = 'FINANCE_REPORTS'
    end
  end
  object cplrisk: TOracleDataSet
    SQL.Strings = (
      'SELECT rowid,a.id, a.objection, a.aboutofrisk, a.contractid'
      '  FROM cplanaliseofrisk a'
      '   where contractid=:contid')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A0043004F004E00540049004400030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000040000000400000049004400010000000000120000004F0042004A00
      45004300540049004F004E0001000000000016000000410042004F0055005400
      4F0046005200490053004B000100000000001400000043004F004E0054005200
      41004300540049004400010000000000}
    Session = sboapiDataModule.SBSession
    BeforeInsert = cplappBeforeEdit
    BeforeEdit = cplappBeforeEdit
    OnPostError = cplappPostError
    Left = 104
    Top = 160
    object cplriskID: TFloatField
      FieldName = 'ID'
    end
    object cplriskOBJECTION: TIntegerField
      FieldName = 'OBJECTION'
      Required = True
    end
    object cplriskABOUTOFRISK: TWideStringField
      FieldName = 'ABOUTOFRISK'
      Size = 250
    end
    object cplriskCONTRACTID: TFloatField
      FieldName = 'CONTRACTID'
      Required = True
    end
  end
  object cplop: TOracleDataSet
    SQL.Strings = (
      
        'SELECT rowid,a.id, a.contractid, a.against, a.cause, a.creditamo' +
        'unt_numbers,'
      '       a.creditamount_words, a.credit_currency, a.credit_period,'
      '       a.annualint, a.paymentorder, a.concession_period,'
      '       a.service_amount, a.nonat_business_equipment,'
      '       a.nonat_turnover_guarantee, a.nonat_home_objects,'
      '       a.nonat_deposit, a.nonat_others, a.nat_liveandotherlife,'
      '       a.nat_vehicle, a.guarantor,a.status'
      '  FROM cplopinionofcommittee a'
      '  where contractid=:contid')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A0043004F004E00540049004400030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001500000004000000490044000100000000001400000043004F004E00
      54005200410043005400490044000100000000000E0000004100470041004900
      4E00530054000100000000000A00000043004100550053004500010000000000
      2800000043005200450044004900540041004D004F0055004E0054005F004E00
      55004D0042004500520053000100000000002400000043005200450044004900
      540041004D004F0055004E0054005F0057004F00520044005300010000000000
      1E0000004300520045004400490054005F00430055005200520045004E004300
      59000100000000001A0000004300520045004400490054005F00500045005200
      49004F0044000100000000001200000041004E004E00550041004C0049004E00
      5400010000000000180000005000410059004D0045004E0054004F0052004400
      450052000100000000002200000043004F004E00430045005300530049004F00
      4E005F0050004500520049004F0044000100000000001C000000530045005200
      56004900430045005F0041004D004F0055004E00540001000000000030000000
      4E004F004E00410054005F0042005500530049004E004500530053005F004500
      51005500490050004D0045004E005400010000000000300000004E004F004E00
      410054005F005400550052004E004F005600450052005F004700550041005200
      41004E00540045004500010000000000240000004E004F004E00410054005F00
      48004F004D0045005F004F0042004A0045004300540053000100000000001A00
      00004E004F004E00410054005F004400450050004F0053004900540001000000
      0000180000004E004F004E00410054005F004F00540048004500520053000100
      00000000280000004E00410054005F004C0049005600450041004E0044004F00
      54004800450052004C00490046004500010000000000160000004E0041005400
      5F00560045004800490043004C00450001000000000012000000470055004100
      520041004E0054004F0052000100000000000C00000053005400410054005500
      5300010000000000}
    Session = sboapiDataModule.SBSession
    BeforeInsert = cplappBeforeEdit
    BeforeEdit = cplappBeforeEdit
    OnCalcFields = cplopCalcFields
    OnPostError = cplappPostError
    Left = 152
    Top = 160
    object cplopsmnonat: TFloatField
      FieldKind = fkCalculated
      FieldName = 'smnonat'
      Calculated = True
    end
    object cplopID: TFloatField
      FieldName = 'ID'
    end
    object cplopCONTRACTID: TFloatField
      FieldName = 'CONTRACTID'
      Required = True
    end
    object cplopAGAINST: TIntegerField
      FieldName = 'AGAINST'
      Required = True
    end
    object cplopCAUSE: TWideStringField
      FieldName = 'CAUSE'
      Size = 30
    end
    object cplopCREDITAMOUNT_NUMBERS: TFloatField
      FieldName = 'CREDITAMOUNT_NUMBERS'
    end
    object cplopCREDITAMOUNT_WORDS: TWideStringField
      FieldName = 'CREDITAMOUNT_WORDS'
      Size = 50
    end
    object cplopCREDIT_CURRENCY: TFloatField
      FieldName = 'CREDIT_CURRENCY'
    end
    object cplopCREDIT_PERIOD: TFloatField
      FieldName = 'CREDIT_PERIOD'
    end
    object cplopANNUALINT: TFloatField
      FieldName = 'ANNUALINT'
    end
    object cplopPAYMENTORDER: TFloatField
      FieldName = 'PAYMENTORDER'
    end
    object cplopCONCESSION_PERIOD: TFloatField
      FieldName = 'CONCESSION_PERIOD'
    end
    object cplopSERVICE_AMOUNT: TFloatField
      FieldName = 'SERVICE_AMOUNT'
    end
    object cplopNONAT_BUSINESS_EQUIPMENT: TFloatField
      FieldName = 'NONAT_BUSINESS_EQUIPMENT'
    end
    object cplopNONAT_TURNOVER_GUARANTEE: TFloatField
      FieldName = 'NONAT_TURNOVER_GUARANTEE'
    end
    object cplopNONAT_HOME_OBJECTS: TFloatField
      FieldName = 'NONAT_HOME_OBJECTS'
    end
    object cplopNONAT_DEPOSIT: TFloatField
      FieldName = 'NONAT_DEPOSIT'
    end
    object cplopNONAT_OTHERS: TFloatField
      FieldName = 'NONAT_OTHERS'
    end
    object cplopNAT_LIVEANDOTHERLIFE: TFloatField
      FieldName = 'NAT_LIVEANDOTHERLIFE'
    end
    object cplopNAT_VEHICLE: TFloatField
      FieldName = 'NAT_VEHICLE'
    end
    object cplopGUARANTOR: TWideStringField
      FieldName = 'GUARANTOR'
      Size = 120
    end
    object cplopSTATUS: TWideStringField
      FieldName = 'STATUS'
      Size = 25
    end
  end
  object cplpaypr: TOracleDataSet
    SQL.Strings = (
      
        'SELECT rowid,a.id, a.contractid, a.dateofgrant, a.pr_been_comple' +
        'ted,a.numberofcredit'
      '  FROM cplpaymentprocess a'
      '    where contractid=:contid')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A0043004F004E00540049004400030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000500000004000000490044000100000000001400000043004F004E00
      5400520041004300540049004400010000000000160000004400410054004500
      4F0046004700520041004E00540001000000000022000000500052005F004200
      450045004E005F0043004F004D0050004C004500540045004400010000000000
      1C0000004E0055004D004200450052004F004600430052004500440049005400
      010000000000}
    Session = sboapiDataModule.SBSession
    BeforeInsert = cplappBeforeEdit
    BeforeEdit = cplappBeforeEdit
    OnPostError = cplappPostError
    Left = 200
    Top = 160
    object cplpayprID: TFloatField
      FieldName = 'ID'
    end
    object cplpayprCONTRACTID: TFloatField
      FieldName = 'CONTRACTID'
      Required = True
    end
    object cplpayprDATEOFGRANT: TDateTimeField
      FieldName = 'DATEOFGRANT'
    end
    object cplpayprPR_BEEN_COMPLETED: TIntegerField
      FieldName = 'PR_BEEN_COMPLETED'
    end
    object cplpayprNUMBEROFCREDIT: TWideStringField
      FieldName = 'NUMBEROFCREDIT'
      Size = 25
    end
  end
  object continf: TOracleDataSet
    SQL.Strings = (
      'SELECT  a.customername, a.loanamount,av.valu_name,a.currency'
      '  FROM creditpipelines a,avalute av'
      '  where a.id=:contid and av.valute=a.currency'
      '  ')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A0043004F004E00540049004400030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000040000001800000043005500530054004F004D00450052004E004100
      4D004500010000000000140000004C004F0041004E0041004D004F0055004E00
      540001000000000012000000560041004C0055005F004E0041004D0045000100
      0000000010000000430055005200520045004E0043005900010000000000}
    Session = sboapiDataModule.SBSession
    Left = 224
    Top = 8
    object continfCUSTOMERNAME: TWideStringField
      FieldName = 'CUSTOMERNAME'
      Required = True
      Size = 90
    end
    object continfLOANAMOUNT: TFloatField
      DisplayLabel = '#,##0.00'
      FieldName = 'LOANAMOUNT'
      Required = True
    end
    object continfVALU_NAME: TWideStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
    object continfCURRENCY: TFloatField
      FieldName = 'CURRENCY'
      Required = True
    end
  end
  object continfds: TDataSource
    DataSet = continf
    Left = 264
    Top = 16
  end
  object CurrencyOfferds: TDataSource
    DataSet = CurrencyOffer
    Left = 400
    Top = 16
  end
  object CurrencyOffer: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name from avalute')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C000000560041004C005500540045000100000000001200
      0000560041004C0055005F004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 320
    Top = 16
  end
  object CrdCat: TOracleDataSet
    SQL.Strings = (
      'select id,description from cm_categories'
      'order by id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000002000000040000004900440001000000000016000000440045005300
      4300520049005000540049004F004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 176
    Top = 56
    object CrdCatID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CrdCatDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 128
    end
  end
  object CrdCatds: TDataSource
    DataSet = CrdCat
    Left = 176
    Top = 112
  end
  object crdTypeds: TDataSource
    DataSet = crdType
    Left = 240
    Top = 120
  end
  object crdType: TOracleDataSet
    SQL.Strings = (
      'select id,description from cm_credittypes')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000002000000040000004900440001000000000016000000440045005300
      4300520049005000540049004F004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 232
    Top = 56
  end
  object currop: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name from avalute')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C000000560041004C005500540045000100000000001200
      0000560041004C0055005F004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 304
    Top = 64
  end
  object curropds: TDataSource
    DataSet = currop
    Left = 360
    Top = 64
  end
  object PayOrderds: TDataSource
    DataSet = PayOrder
    Left = 312
    Top = 120
  end
  object PayOrder: TOracleDataSet
    SQL.Strings = (
      'select * from cplpaymentorder')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000160000004400450053004300520049005000540049004F00
      4E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 384
    Top = 120
    object PayOrderID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object PayOrderNAME: TWideStringField
      FieldName = 'NAME'
      Size = 25
    end
    object PayOrderDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 25
    end
  end
  object DenyNote: TOracleDataSet
    SQL.Strings = (
      'select  *  from cpldenynote'
      'where contractid =:contid')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A0043004F004E00540049004400030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000001400000043004F004E00
      5400520041004300540049004400010000000000080000004E004F0054004500
      010000000000}
    Session = sboapiDataModule.SBSession
    Left = 424
    Top = 64
    object DenyNoteID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DenyNoteCONTRACTID: TFloatField
      FieldName = 'CONTRACTID'
    end
    object DenyNoteNOTE: TWideStringField
      FieldName = 'NOTE'
      Size = 80
    end
  end
  object DenyNoteds: TDataSource
    DataSet = DenyNote
    Left = 440
    Top = 120
  end
  object curdat: TOracleDataSet
    SQL.Strings = (
      'select tek_dat from sysdat')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000010000000E000000540045004B005F00440041005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 392
    Top = 176
    object curdatTEK_DAT: TDateTimeField
      FieldName = 'TEK_DAT'
      Required = True
    end
  end
  object users: TOracleDataSet
    SQL.Strings = (
      'select id,name from user$')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 432
    Top = 176
    object usersID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object usersNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
  end
  object usersds: TDataSource
    DataSet = users
    Left = 464
    Top = 176
  end
  object fvalutesds: TDataSource
    DataSet = fvalutes
    Left = 11
    Top = 336
  end
  object fvalutes: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name from avalute'
      'order by valute'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C000000560041004C005500540045000100000000001200
      0000560041004C0055005F004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 11
    Top = 272
    object fvalutesVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object fvalutesVALU_NAME: TWideStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
  end
  object ffilial: TOracleDataSet
    SQL.Strings = (
      'select id,name from filial'
      'order by id'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 50
    Top = 272
    object ffilialID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ffilialNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object fcredittype: TOracleDataSet
    SQL.Strings = (
      'select id,description from cm_credittypes'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000002000000040000004900440001000000000016000000440045005300
      4300520049005000540049004F004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 91
    Top = 272
    object fcredittypeID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object fcredittypeDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 128
    end
  end
  object ffilialds: TDataSource
    DataSet = ffilial
    Left = 57
    Top = 336
  end
  object fcredittypeds: TDataSource
    DataSet = fcredittype
    Left = 105
    Top = 336
  end
  object RepApp: TOracleDataSet
    SQL.Strings = (
      ''
      'SELECT clp.customername, clp.customerid, av.val_name, f.NAME,'
      'clp.branchid,clp.currency,clp.credittype as crdtype,clp.usid,'
      'usaid_report.get_denynote(clp.id) as denynote, cplapp.*'
      '  FROM creditpipelines clp,'
      '       avalute av,'
      '       filial f,'
      '       (SELECT a.ID, a.contractid, a.address_cust, a.birthdat,'
      
        '               a.name_business, a.address_business, a.activities' +
        '_dat_business,'
      
        '               a.creditperiod, a.offer_amount, usaid_report.get_' +
        'valName(a.offer_currency) as offer_currency,'
      '               a.offer_period, a.purposeofcredit,'
      '               usaid_report.get_creditcat'
      '                                      (a.category_credits)'
      
        '                                                          AS cat' +
        'egory_credits,'
      
        '               usaid_report.get_credittype (a.credittype) AS cre' +
        'dittype,'
      '               sb_aca.getuserbyid (a.usid) AS usr, a.tim,'
      
        '               sb_aca.getuserbyid (a.usid) AS change_usr, a.tim ' +
        'AS change_tim'
      '          FROM cplappications a'
      '        UNION ALL'
      '        SELECT a.ID, a.contractid, a.address_cust, a.birthdat,'
      
        '               a.name_business, a.address_business, a.activities' +
        '_dat_business,'
      
        '               a.creditperiod, a.offer_amount, usaid_report.get_' +
        'valName(a.offer_currency) as offer_currency,'
      '               a.offer_period, a.purposeofcredit,'
      '               usaid_report.get_creditcat'
      '                                      (a.category_credits)'
      
        '                                                          AS cat' +
        'egory_credits,'
      
        '               usaid_report.get_credittype (a.credittype) AS cre' +
        'dittype,'
      '               sb_aca.getuserbyid (a.usid) AS usr, a.tim,'
      
        '               sb_aca.getuserbyid (a.change_usid) AS change_usr,' +
        ' a.change_tim'
      '          FROM cplappications_c a) cplapp'
      ' WHERE clp.ID = cplapp.contractid'
      '   AND clp.branchid = f.ID'
      '   AND clp.currency = av.valute'
      'order by cplapp.tim'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000001B0000001800000043005500530054004F004D00450052004E004100
      4D0045000100000000001400000043005500530054004F004D00450052004900
      440001000000000010000000560041004C005F004E0041004D00450001000000
      0000080000004E0041004D004500010000000000040000004900440001000000
      00001400000043004F004E005400520041004300540049004400010000000000
      1800000041004400440052004500530053005F00430055005300540001000000
      000010000000420049005200540048004400410054000100000000001A000000
      4E0041004D0045005F0042005500530049004E00450053005300010000000000
      2000000041004400440052004500530053005F0042005500530049004E004500
      530053000100000000002E000000410043005400490056004900540049004500
      53005F004400410054005F0042005500530049004E0045005300530001000000
      00001800000043005200450044004900540050004500520049004F0044000100
      00000000180000004F0046004600450052005F0041004D004F0055004E005400
      0100000000001C0000004F0046004600450052005F0043005500520052004500
      4E0043005900010000000000180000004F0046004600450052005F0050004500
      520049004F0044000100000000001E00000050005500520050004F0053004500
      4F00460043005200450044004900540001000000000020000000430041005400
      450047004F00520059005F004300520045004400490054005300010000000000
      1400000043005200450044004900540054005900500045000100000000000600
      000055005300520001000000000006000000540049004D000100000000001400
      00004300480041004E00470045005F0055005300520001000000000014000000
      4300480041004E00470045005F00540049004D00010000000000100000004400
      45004E0059004E004F0054004500010000000000100000004200520041004E00
      430048004900440001000000000010000000430055005200520045004E004300
      59000100000000000E0000004300520044005400590050004500010000000000
      080000005500530049004400010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 184
    Top = 280
    object RepAppCONTRACTID: TFloatField
      DisplayLabel = #8470
      FieldName = 'CONTRACTID'
    end
    object RepAppCUSTOMERNAME: TWideStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099
      FieldName = 'CUSTOMERNAME'
      Required = True
      Size = 90
    end
    object RepAppCUSTOMERID: TWideStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' ID-'#1089#1080
      FieldName = 'CUSTOMERID'
      Required = True
      Size = 25
    end
    object RepAppVAL_NAME: TWideStringField
      DisplayLabel = '$'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object RepAppNAME: TWideStringField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      FieldName = 'NAME'
      Size = 90
    end
    object RepAppID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object RepAppADDRESS_CUST: TWideStringField
      DisplayLabel = #1062#1085#1074#1072#1085':'
      FieldName = 'ADDRESS_CUST'
      Size = 180
    end
    object RepAppBIRTHDAT: TDateTimeField
      DisplayLabel = #1044#1086#1100#1091#1084' '#1090#1072#1088#1080#1093#1080':'
      FieldName = 'BIRTHDAT'
    end
    object RepAppNAME_BUSINESS: TWideStringField
      DisplayLabel = #1041#1080#1079#1085#1077#1089' '#1086#1073'.'#1072#1076#1099':'
      FieldName = 'NAME_BUSINESS'
      Size = 120
    end
    object RepAppADDRESS_BUSINESS: TWideStringField
      DisplayLabel = #1062#1085#1074#1072#1085':'
      FieldName = 'ADDRESS_BUSINESS'
      Size = 180
    end
    object RepAppACTIVITIES_DAT_BUSINESS: TFloatField
      DisplayLabel = #1060#1103#1072#1083#1080#1081#1081#1103#1090' '#1084#1094#1076#1076#1103#1090#1080':'
      FieldName = 'ACTIVITIES_DAT_BUSINESS'
    end
    object RepAppCREDITPERIOD: TFloatField
      DisplayLabel = #1052#1094#1076#1076#1103#1090
      FieldName = 'CREDITPERIOD'
    end
    object RepAppOFFER_AMOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090' '#1090#1103#1082#1083#1080#1092#1080':'#1052#1103#1073#1083#1103#1100
      FieldName = 'OFFER_AMOUNT'
    end
    object RepAppOFFER_CURRENCY: TWideStringField
      DisplayLabel = #1042#1072#1083#1081#1091#1090#1072
      FieldName = 'OFFER_CURRENCY'
      Size = 4000
    end
    object RepAppOFFER_PERIOD: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090' '#1090#1103#1082#1083#1080#1092#1080':'#1052#1094#1076#1076#1103#1090
      FieldName = 'OFFER_PERIOD'
    end
    object RepAppPURPOSEOFCREDIT: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1084#1103#1075#1089#1103#1076#1080':'
      FieldName = 'PURPOSEOFCREDIT'
      Size = 120
    end
    object RepAppCATEGORY_CREDITS: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1082#1072#1090#1077#1101#1086#1088#1080#1081#1072#1089#1099
      FieldName = 'CATEGORY_CREDITS'
      Size = 4000
    end
    object RepAppCREDITTYPE: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1090#1080#1087#1080
      FieldName = 'CREDITTYPE'
      Size = 4000
    end
    object RepAppUSR: TWideStringField
      DisplayLabel = #1056#1077#1076#1072#1082#1090#1103' '#1077#1076#1080#1078#1080' '#1080#1089#1090#1080#1092#1072#1076#1103#1095#1080
      FieldName = 'USR'
      Size = 4000
    end
    object RepAppTIM: TDateTimeField
      DisplayLabel = #1056#1077#1076#1072#1082#1090#1103' '#1090#1072#1088#1080#1093#1080
      FieldName = 'TIM'
    end
    object RepAppCHANGE_USR: TWideStringField
      DisplayLabel = #1048#1089#1090#1080#1092#1072#1076#1103#1095#1080
      FieldName = 'CHANGE_USR'
      Size = 4000
    end
    object RepAppCHANGE_TIM: TDateTimeField
      DisplayLabel = #1058#1072#1088#1080#1093
      FieldName = 'CHANGE_TIM'
    end
    object RepAppDENYNOTE: TWideStringField
      DisplayLabel = #1048#1084#1090#1080#1085#1072' '#1090#1103#1081#1080#1085#1072#1090#1099
      FieldName = 'DENYNOTE'
      Size = 4000
    end
    object RepAppBRANCHID: TFloatField
      FieldName = 'BRANCHID'
      Visible = False
    end
    object RepAppCURRENCY: TFloatField
      FieldName = 'CURRENCY'
      Required = True
      Visible = False
    end
    object RepAppCRDTYPE: TFloatField
      FieldName = 'CRDTYPE'
      Visible = False
    end
    object RepAppUSID: TFloatField
      FieldName = 'USID'
      Visible = False
    end
  end
  object RepDoc: TOracleDataSet
    SQL.Strings = (
      
        'SELECT clp.customername, clp.customerid, av.val_name, f.NAME as ' +
        'filialname,'
      'clp.branchid,clp.currency,clp.credittype as crdtype,clp.usid, '
      'usaid_report.get_denynote(clp.id) as denynote,cpldoc.*'
      ''
      'FROM creditpipelines clp,'
      '       avalute av,'
      '       filial f,'
      ''
      
        '(SELECT a.ID, a.contractid, a.pass_ser, a.pass_no, a.voin, a.ope' +
        'ndatoflease,'
      '       a.closedatoflease,'
      '       DECODE (a.docofhome, 0, '#39#1049#1086#1093#1076#1091#1088#39', 1, '#39#1042#1072#1088#39') AS docofhome,'
      
        '       DECODE (a.marridevidence, 0, '#39#1049#1086#1093#1076#1091#1088#39', 1, '#39#1042#1072#1088#39') AS marri' +
        'devidence,'
      
        '       a.guarantee_pass_ser, a.guarantee_pass_no, a.guarantee_vo' +
        'in,'
      '       DECODE (a.guarantee_docofhome,'
      '               0, '#39#1049#1086#1093#1076#1091#1088#39','
      '               1, '#39#1042#1072#1088#39
      '              ) AS guarantee_docofhome,'
      
        '       DECODE (a.finance_reports, 0, '#39#1049#1086#1093#1076#1091#1088#39', 1, '#39#1042#1072#1088#39') AS fina' +
        'nce_reports,'
      '       sb_aca.getuserbyid (a.usid) AS usr, a.tim,'
      
        '       sb_aca.getuserbyid (a.usid) AS change_usr, a.tim AS chang' +
        'e_tim'
      '  FROM cpldocuments a'
      'UNION ALL'
      
        'SELECT a.ID, a.contractid, a.pass_ser, a.pass_no, a.voin, a.open' +
        'datoflease,'
      '       a.closedatoflease,'
      '       DECODE (a.docofhome, 0, '#39#1049#1086#1093#1076#1091#1088#39', 1, '#39#1042#1072#1088#39') AS docofhome,'
      
        '       DECODE (a.marridevidence, 0, '#39#1049#1086#1093#1076#1091#1088#39', 1, '#39#1042#1072#1088#39') AS marri' +
        'devidence,'
      
        '       a.guarantee_pass_ser, a.guarantee_pass_no, a.guarantee_vo' +
        'in,'
      '       DECODE (a.guarantee_docofhome,'
      '               0, '#39#1049#1086#1093#1076#1091#1088#39','
      '               1, '#39#1042#1072#1088#39
      '              ) AS guarantee_docofhome,'
      
        '       DECODE (a.finance_reports, 0, '#39#1049#1086#1093#1076#1091#1088#39', 1, '#39#1042#1072#1088#39') AS fina' +
        'nce_reports,'
      '       sb_aca.getuserbyid (a.usid) AS usr, a.tim,'
      
        '       sb_aca.getuserbyid (a.change_usid) AS change_usr, a.chang' +
        'e_tim'
      '  FROM cpldocuments_c a) cpldoc'
      ''
      ' WHERE clp.ID = cpldoc.contractid'
      '   AND clp.branchid = f.ID'
      '   AND clp.currency = av.valute'
      '   order by cpldoc.tim'
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000001B0000001800000043005500530054004F004D00450052004E004100
      4D0045000100000000001400000043005500530054004F004D00450052004900
      440001000000000010000000560041004C005F004E0041004D00450001000000
      000014000000460049004C00490041004C004E0041004D004500010000000000
      10000000440045004E0059004E004F0054004500010000000000040000004900
      44000100000000001400000043004F004E005400520041004300540049004400
      0100000000001000000050004100530053005F00530045005200010000000000
      0E00000050004100530053005F004E004F000100000000000800000056004F00
      49004E000100000000001C0000004F00500045004E004400410054004F004600
      4C0045004100530045000100000000001E00000043004C004F00530045004400
      410054004F0046004C0045004100530045000100000000001200000044004F00
      43004F00460048004F004D0045000100000000001C0000004D00410052005200
      49004400450056004900440045004E0043004500010000000000240000004700
      55004100520041004E005400450045005F0050004100530053005F0053004500
      520001000000000022000000470055004100520041004E005400450045005F00
      50004100530053005F004E004F000100000000001C0000004700550041005200
      41004E005400450045005F0056004F0049004E00010000000000260000004700
      55004100520041004E005400450045005F0044004F0043004F00460048004F00
      4D0045000100000000001E000000460049004E0041004E00430045005F005200
      450050004F005200540053000100000000000600000055005300520001000000
      000006000000540049004D00010000000000140000004300480041004E004700
      45005F00550053005200010000000000140000004300480041004E0047004500
      5F00540049004D00010000000000100000004200520041004E00430048004900
      440001000000000010000000430055005200520045004E004300590001000000
      00000E0000004300520044005400590050004500010000000000080000005500
      530049004400010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 232
    Top = 280
    object RepDocCONTRACTID: TFloatField
      DisplayLabel = #8470
      FieldName = 'CONTRACTID'
    end
    object RepDocCUSTOMERNAME: TWideStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099
      FieldName = 'CUSTOMERNAME'
      Required = True
      Size = 90
    end
    object RepDocCUSTOMERID: TWideStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' ID-'#1089#1080
      FieldName = 'CUSTOMERID'
      Required = True
      Size = 25
    end
    object RepDocVAL_NAME: TWideStringField
      DisplayLabel = '$'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object RepDocFILIALNAME: TWideStringField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      FieldName = 'FILIALNAME'
      Size = 90
    end
    object RepDocID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object RepDocPASS_SER: TWideStringField
      DisplayLabel = #1071#1088#1080#1079#1103#1095#1080#1085#1080#1085' '#1064#1103#1093#1089#1080#1081#1081#1103#1090#1080' '#1090#1103#1089#1076#1080#1075' '#1077#1076#1103#1085' '#1089#1103#1085#1103#1076': '#1089#1077#1088#1080#1081#1072'   '
      FieldName = 'PASS_SER'
      Size = 5
    end
    object RepDocPASS_NO: TWideStringField
      DisplayLabel = #8470
      FieldName = 'PASS_NO'
      Size = 12
    end
    object RepDocVOIN: TWideStringField
      DisplayLabel = #1042#1070#1048#1053
      FieldName = 'VOIN'
      Size = 25
    end
    object RepDocOPENDATOFLEASE: TDateTimeField
      DisplayLabel = #1048#1078#1072#1088#1103' '#1084#1094#1075#1072#1074#1080#1083#1103#1089#1080#1085#1080#1085'  '#1041#1072#1100#1083#1072#1085#1084#1072' '#1090#1072#1088#1080#1093#1080
      FieldName = 'OPENDATOFLEASE'
    end
    object RepDocCLOSEDATOFLEASE: TDateTimeField
      DisplayLabel = #1041#1080#1090#1084#1103' '#1090#1072#1088#1080#1093#1080
      FieldName = 'CLOSEDATOFLEASE'
    end
    object RepDocDOCOFHOME: TWideStringField
      DisplayLabel = #1071#1088#1080#1079#1103#1095#1080#1085#1080#1085' '#1045#1074#1080#1085' '#1089#1103#1085#1103#1076#1080
      FieldName = 'DOCOFHOME'
      Size = 6
    end
    object RepDocMARRIDEVIDENCE: TWideStringField
      DisplayLabel = #1071#1088#1080#1079#1103#1095#1080#1085#1080#1085' '#1045#1074#1083#1080#1083#1080#1082' '#1097#1072#1075#1075#1099#1085#1076#1072' '#1096#1103#1097#1072#1076#1103#1090#1085#1072#1084#1103
      FieldName = 'MARRIDEVIDENCE'
      Size = 6
    end
    object RepDocFINANCE_REPORTS: TWideStringField
      DisplayLabel = #1071#1088#1080#1079#1103#1095#1080#1085#1080#1085' '#1052#1072#1083#1080#1081#1081#1103' '#1097#1077#1089#1072#1073#1072#1090#1083#1072#1088#1099
      FieldName = 'FINANCE_REPORTS'
      Size = 6
    end
    object RepDocGUARANTEE_PASS_SER: TWideStringField
      DisplayLabel = #1047#1072#1084#1080#1085#1080#1085' '#1064#1103#1093#1089#1080#1081#1081#1103#1090#1080' '#1090#1103#1089#1076#1080#1075' '#1077#1076#1103#1085' '#1089#1103#1085#1103#1076': '#1089#1077#1088#1080#1081#1072' '
      FieldName = 'GUARANTEE_PASS_SER'
      Size = 5
    end
    object RepDocGUARANTEE_PASS_NO: TWideStringField
      DisplayLabel = #8470
      FieldName = 'GUARANTEE_PASS_NO'
      Size = 12
    end
    object RepDocGUARANTEE_VOIN: TWideStringField
      DisplayLabel = #1047#1072#1084#1080#1085#1080#1085' '#1042#1070#1048#1053
      FieldName = 'GUARANTEE_VOIN'
      Size = 25
    end
    object RepDocGUARANTEE_DOCOFHOME: TWideStringField
      DisplayLabel = #1047#1072#1084#1080#1085#1080#1085' '#1045#1074#1080#1085' '#1089#1103#1085#1103#1076#1080
      FieldName = 'GUARANTEE_DOCOFHOME'
      Size = 6
    end
    object RepDocUSR: TWideStringField
      DisplayLabel = #1056#1077#1076#1072#1082#1090#1103' '#1077#1076#1080#1078#1080' '#1080#1089#1090#1080#1092#1072#1076#1103#1095#1080
      FieldName = 'USR'
      Size = 4000
    end
    object RepDocTIM: TDateTimeField
      DisplayLabel = #1056#1077#1076#1072#1082#1090#1103' '#1090#1072#1088#1080#1093#1080
      FieldName = 'TIM'
    end
    object RepDocCHANGE_USR: TWideStringField
      DisplayLabel = #1048#1089#1090#1080#1092#1072#1076#1103#1095#1080
      FieldName = 'CHANGE_USR'
      Size = 4000
    end
    object RepDocCHANGE_TIM: TDateTimeField
      DisplayLabel = #1058#1072#1088#1080#1093
      FieldName = 'CHANGE_TIM'
    end
    object RepDocDENYNOTE: TWideStringField
      DisplayLabel = #1048#1084#1090#1080#1085#1072' '#1090#1103#1081#1080#1085#1072#1090#1099
      FieldName = 'DENYNOTE'
      Size = 4000
    end
    object RepDocBRANCHID: TFloatField
      FieldName = 'BRANCHID'
      Visible = False
    end
    object RepDocCURRENCY: TFloatField
      FieldName = 'CURRENCY'
      Required = True
      Visible = False
    end
    object RepDocCRDTYPE: TFloatField
      FieldName = 'CRDTYPE'
      Visible = False
    end
    object RepDocUSID: TFloatField
      FieldName = 'USID'
      Visible = False
    end
  end
  object RepARisk: TOracleDataSet
    SQL.Strings = (
      
        'SELECT clp.customername, clp.customerid, av.val_name, f.NAME as ' +
        'filialname, '
      'clp.branchid,clp.currency,clp.credittype as crdtype,clp.usid,'
      'usaid_report.get_denynote(clp.id) as denynote,cplanaliseofrisk.*'
      ''
      'FROM creditpipelines clp,'
      '       avalute av,'
      '       filial f,'
      ''
      
        '(SELECT a.id, decode(a.objection,0,'#39#1045#1090#1080#1088#1072#1079#1072' '#1103#1089#1072#1089' '#1081#1086#1093#1076#1091#1088#39',1,'#39#1045#1090#1080#1088 +
        #1072#1079#1072' '#1103#1089#1072#1089' '#1074#1072#1088#39') as objection,a.aboutofrisk, a.contractid, sb_aca.' +
        'getuserbyid(a.usid) as usr, a.tim,'
      ' sb_aca.getuserbyid(a.usid) as change_usr,a.tim as change_tim'
      '  FROM cplanaliseofrisk a'
      '  union all'
      
        'SELECT a.id, decode(a.objection,0,'#39#1045#1090#1080#1088#1072#1079#1072' '#1103#1089#1072#1089' '#1081#1086#1093#1076#1091#1088#39',1,'#39#1045#1090#1080#1088#1072 +
        #1079#1072' '#1103#1089#1072#1089' '#1074#1072#1088#39') as objection, a.aboutofrisk, a.contractid, sb_aca.' +
        'getuserbyid(a.usid) as usr, a.tim,'
      
        '       sb_aca.getuserbyid(a.change_usid) as change_usr, a.change' +
        '_tim'
      '  FROM cplanaliseofrisk_c a) cplanaliseofrisk'
      '  '
      '  WHERE clp.ID = cplanaliseofrisk.contractid'
      '   AND clp.branchid = f.ID'
      '   AND clp.currency = av.valute'
      '   order by cplanaliseofrisk.tim')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000110000001800000043005500530054004F004D00450052004E004100
      4D0045000100000000001400000043005500530054004F004D00450052004900
      440001000000000010000000560041004C005F004E0041004D00450001000000
      000014000000460049004C00490041004C004E0041004D004500010000000000
      10000000440045004E0059004E004F0054004500010000000000040000004900
      4400010000000000120000004F0042004A0045004300540049004F004E000100
      0000000016000000410042004F00550054004F0046005200490053004B000100
      000000001400000043004F004E00540052004100430054004900440001000000
      00000600000055005300520001000000000006000000540049004D0001000000
      0000140000004300480041004E00470045005F00550053005200010000000000
      140000004300480041004E00470045005F00540049004D000100000000001000
      00004200520041004E0043004800490044000100000000001000000043005500
      5200520045004E00430059000100000000000E00000043005200440054005900
      50004500010000000000080000005500530049004400010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 288
    Top = 280
    object RepARiskCONTRACTID: TFloatField
      DisplayLabel = #8470
      FieldName = 'CONTRACTID'
    end
    object RepARiskCUSTOMERNAME: TWideStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099
      FieldName = 'CUSTOMERNAME'
      Required = True
      Size = 90
    end
    object RepARiskCUSTOMERID: TWideStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' ID-'#1089#1080
      FieldName = 'CUSTOMERID'
      Required = True
      Size = 25
    end
    object RepARiskVAL_NAME: TWideStringField
      DisplayLabel = '$'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object RepARiskFILIALNAME: TWideStringField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      FieldName = 'FILIALNAME'
      Size = 90
    end
    object RepARiskID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object RepARiskOBJECTION: TWideStringField
      DisplayLabel = #1045#1090#1080#1088#1072#1079
      FieldName = 'OBJECTION'
      Size = 19
    end
    object RepARiskABOUTOFRISK: TWideStringField
      DisplayLabel = #1056#1080#1089#1082' '#1074#1072#1088' ('#1096#1103#1088#1097#1080')'
      FieldName = 'ABOUTOFRISK'
      Size = 250
    end
    object RepARiskUSR: TWideStringField
      DisplayLabel = #1056#1077#1076#1072#1082#1090#1103' '#1077#1076#1080#1078#1080' '#1080#1089#1090#1080#1092#1072#1076#1103#1095#1080
      FieldName = 'USR'
      Size = 4000
    end
    object RepARiskTIM: TDateTimeField
      DisplayLabel = #1056#1077#1076#1072#1082#1090#1103' '#1090#1072#1088#1080#1093#1080
      FieldName = 'TIM'
    end
    object RepARiskCHANGE_USR: TWideStringField
      DisplayLabel = #1048#1089#1090#1080#1092#1072#1076#1103#1095#1080
      FieldName = 'CHANGE_USR'
      Size = 4000
    end
    object RepARiskCHANGE_TIM: TDateTimeField
      DisplayLabel = #1058#1072#1088#1080#1093
      FieldName = 'CHANGE_TIM'
    end
    object RepARiskDENYNOTE: TWideStringField
      DisplayLabel = #1048#1084#1090#1080#1085#1072' '#1090#1103#1081#1080#1085#1072#1090#1099
      FieldName = 'DENYNOTE'
      Size = 4000
    end
    object RepARiskBRANCHID: TFloatField
      FieldName = 'BRANCHID'
      Visible = False
    end
    object RepARiskCURRENCY: TFloatField
      FieldName = 'CURRENCY'
      Required = True
      Visible = False
    end
    object RepARiskCRDTYPE: TFloatField
      FieldName = 'CRDTYPE'
      Visible = False
    end
    object RepARiskUSID: TFloatField
      FieldName = 'USID'
      Visible = False
    end
  end
  object RepOp: TOracleDataSet
    SQL.Strings = (
      
        'SELECT clp.customername, clp.customerid, av.val_name, f.NAME as ' +
        'filialname, '
      'clp.branchid,clp.currency,clp.credittype as crdtype,clp.usid,'
      'usaid_report.get_denynote(clp.id) as denynote,cplop.*'
      ''
      'FROM creditpipelines clp,'
      '       avalute av,'
      '       filial f,'
      ''
      ''
      
        '(SELECT a.id, a.contractid, decode(a.against,0,'#39#1051#1077#1081#1097#1080#1085#1103#39',1,'#39#1071#1083#1077#1081 +
        #1097#1080#1085#1103#39') as against, a.cause, a.creditamount_numbers,'
      '       a.creditamount_words, a.credit_currency, a.credit_period,'
      '       a.annualint, a.paymentorder, a.concession_period,'
      '       a.service_amount, a.nonat_business_equipment,'
      '       a.nonat_turnover_guarantee, a.nonat_home_objects,'
      '       a.nonat_deposit, a.nonat_others, a.nat_liveandotherlife,'
      
        '       a.nat_vehicle, a.guarantor, a.status, sb_aca.getuserbyid ' +
        '(a.usid) AS usr, a.tim'
      
        '       ,sb_aca.getuserbyid (a.usid) as change_usr,a.tim as chang' +
        'e_tim'
      '  FROM cplopinionofcommittee a'
      '  union all'
      
        'SELECT a.id, a.contractid, decode(a.against,0,'#39#1051#1077#1081#1097#1080#1085#1103#39',1,'#39#1071#1083#1077#1081#1097 +
        #1080#1085#1103#39') as againstt, a.cause, a.creditamount_numbers,'
      '       a.creditamount_words, a.credit_currency, a.credit_period,'
      '       a.annualint, a.paymentorder, a.concession_period,'
      '       a.service_amount, a.nonat_business_equipment,'
      '       a.nonat_turnover_guarantee, a.nonat_home_objects,'
      '       a.nonat_deposit, a.nonat_others, a.nat_liveandotherlife,'
      
        '       a.nat_vehicle, a.guarantor, a.status, sb_aca.getuserbyid ' +
        '(a.usid) AS usr, a.tim,'
      
        '       sb_aca.getuserbyid (a.change_usid) AS change_usr, a.chang' +
        'e_tim'
      '  FROM cplopinionofcommittee_c a) cplop'
      '  '
      '   WHERE clp.ID = cplop.contractid'
      '   AND clp.branchid = f.ID'
      '   AND clp.currency = av.valute'
      '   order by cplop.tim'
      ''
      ''
      '  ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000220000001800000043005500530054004F004D00450052004E004100
      4D0045000100000000001400000043005500530054004F004D00450052004900
      440001000000000010000000560041004C005F004E0041004D00450001000000
      000014000000460049004C00490041004C004E0041004D004500010000000000
      10000000440045004E0059004E004F0054004500010000000000040000004900
      44000100000000001400000043004F004E005400520041004300540049004400
      0100000000000E00000041004700410049004E00530054000100000000000A00
      0000430041005500530045000100000000002800000043005200450044004900
      540041004D004F0055004E0054005F004E0055004D0042004500520053000100
      000000002400000043005200450044004900540041004D004F0055004E005400
      5F0057004F005200440053000100000000001E00000043005200450044004900
      54005F00430055005200520045004E00430059000100000000001A0000004300
      520045004400490054005F0050004500520049004F0044000100000000001200
      000041004E004E00550041004C0049004E005400010000000000180000005000
      410059004D0045004E0054004F00520044004500520001000000000022000000
      43004F004E00430045005300530049004F004E005F0050004500520049004F00
      44000100000000001C00000053004500520056004900430045005F0041004D00
      4F0055004E005400010000000000300000004E004F004E00410054005F004200
      5500530049004E004500530053005F00450051005500490050004D0045004E00
      5400010000000000300000004E004F004E00410054005F005400550052004E00
      4F005600450052005F00470055004100520041004E0054004500450001000000
      0000240000004E004F004E00410054005F0048004F004D0045005F004F004200
      4A0045004300540053000100000000001A0000004E004F004E00410054005F00
      4400450050004F00530049005400010000000000180000004E004F004E004100
      54005F004F0054004800450052005300010000000000280000004E0041005400
      5F004C0049005600450041004E0044004F0054004800450052004C0049004600
      4500010000000000160000004E00410054005F00560045004800490043004C00
      450001000000000012000000470055004100520041004E0054004F0052000100
      000000000C000000530054004100540055005300010000000000060000005500
      5300520001000000000006000000540049004D00010000000000140000004300
      480041004E00470045005F005500530052000100000000001400000043004800
      41004E00470045005F00540049004D0001000000000010000000420052004100
      4E00430048004900440001000000000010000000430055005200520045004E00
      430059000100000000000E000000430052004400540059005000450001000000
      0000080000005500530049004400010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 336
    Top = 280
    object RepOpCONTRACTID: TFloatField
      DisplayLabel = #8470
      FieldName = 'CONTRACTID'
    end
    object RepOpCUSTOMERNAME: TWideStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099
      FieldName = 'CUSTOMERNAME'
      Required = True
      Size = 90
    end
    object RepOpCUSTOMERID: TWideStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' ID-'#1089#1080
      FieldName = 'CUSTOMERID'
      Required = True
      Size = 25
    end
    object RepOpVAL_NAME: TWideStringField
      DisplayLabel = '$'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object RepOpFILIALNAME: TWideStringField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      FieldName = 'FILIALNAME'
      Size = 90
    end
    object RepOpID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object RepOpAGAINST: TWideStringField
      DisplayLabel = #1051#1077#1081#1097#1080#1085#1103
      FieldName = 'AGAINST'
      Size = 8
    end
    object RepOpCAUSE: TWideStringField
      DisplayLabel = #1057#1103#1073#1103#1073#1080
      FieldName = 'CAUSE'
      Size = 30
    end
    object RepOpCREDITAMOUNT_NUMBERS: TFloatField
      DisplayLabel = #1052#1103#1073#1083#1103#1100': '#1056#1103#1075#1103#1084#1083#1103' '
      FieldName = 'CREDITAMOUNT_NUMBERS'
    end
    object RepOpCREDITAMOUNT_WORDS: TWideStringField
      DisplayLabel = #1057#1102#1079#1083#1103
      FieldName = 'CREDITAMOUNT_WORDS'
      Size = 50
    end
    object RepOpCREDIT_CURRENCY: TFloatField
      DisplayLabel = #1042#1072#1083#1081#1091#1090#1072
      FieldName = 'CREDIT_CURRENCY'
    end
    object RepOpCREDIT_PERIOD: TFloatField
      DisplayLabel = #1052#1094#1076#1076#1103#1090'('#1072#1081#1083#1072#1088#1083#1103')'
      FieldName = 'CREDIT_PERIOD'
    end
    object RepOpANNUALINT: TFloatField
      DisplayLabel = #1060#1072#1080#1079'('#1086#1088#1090#1072' '#1072#1081#1083#1099#1075')'
      FieldName = 'ANNUALINT'
    end
    object RepOpPAYMENTORDER: TFloatField
      DisplayLabel = #1070#1076#1103#1085#1080#1096' '#1090#1103#1088#1079#1080
      FieldName = 'PAYMENTORDER'
    end
    object RepOpCONCESSION_PERIOD: TFloatField
      DisplayLabel = #1069#1094#1079#1103#1096#1090' '#1084#1094#1076#1076#1103#1090#1080
      FieldName = 'CONCESSION_PERIOD'
    end
    object RepOpSERVICE_AMOUNT: TFloatField
      DisplayLabel = #1061#1080#1076#1084#1103#1090' '#1097#1072#1075#1075#1099
      FieldName = 'SERVICE_AMOUNT'
    end
    object RepOpNONAT_BUSINESS_EQUIPMENT: TFloatField
      DisplayLabel = 'NONNAT:'#1041#1080#1079#1085#1077#1089' '#1072#1074'.'
      FieldName = 'NONAT_BUSINESS_EQUIPMENT'
    end
    object RepOpNONAT_TURNOVER_GUARANTEE: TFloatField
      DisplayLabel = 'NOTNAT:'#1044#1102#1074#1088'. '#1101#1080#1088#1086#1074' '
      FieldName = 'NONAT_TURNOVER_GUARANTEE'
    end
    object RepOpNONAT_HOME_OBJECTS: TFloatField
      DisplayLabel = 'NONNAT:'#1045#1074' '#1103#1096#1081#1072#1083#1072#1088#1099
      FieldName = 'NONAT_HOME_OBJECTS'
    end
    object RepOpNONAT_DEPOSIT: TFloatField
      DisplayLabel = 'NONNAT:'#1044#1077#1087#1086#1079#1080#1090
      FieldName = 'NONAT_DEPOSIT'
    end
    object RepOpNONAT_OTHERS: TFloatField
      DisplayLabel = 'NONNAT:'#1044#1080#1101#1103#1088
      FieldName = 'NONAT_OTHERS'
    end
    object RepOpNAT_LIVEANDOTHERLIFE: TFloatField
      DisplayLabel = 'NAT:'#1049#1072#1096#1072#1081#1099#1096' '#1074#1103' '#1081#1072' '#1075#1077#1081#1088#1080' '#1081#1072#1096#1072#1081#1099#1096' '#1089#1072#1097#1103#1089#1080':'
      FieldName = 'NAT_LIVEANDOTHERLIFE'
    end
    object RepOpNAT_VEHICLE: TFloatField
      DisplayLabel = 'NAT:'#1053#1103#1075#1083#1080#1081#1081#1072#1090' '#1074#1072#1089#1080#1090#1103#1089#1080
      FieldName = 'NAT_VEHICLE'
    end
    object RepOpGUARANTOR: TWideStringField
      DisplayLabel = #1047#1072#1084#1080#1085'('#1083#1103#1088')'
      FieldName = 'GUARANTOR'
      Size = 120
    end
    object RepOpSTATUS: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089#1091
      FieldName = 'STATUS'
      Size = 25
    end
    object RepOpUSR: TWideStringField
      DisplayLabel = #1056#1077#1076#1072#1082#1090#1103' '#1077#1076#1080#1078#1080' '#1080#1089#1090#1080#1092#1072#1076#1103#1095#1080
      FieldName = 'USR'
      Size = 4000
    end
    object RepOpTIM: TDateTimeField
      DisplayLabel = #1056#1077#1076#1072#1082#1090#1103' '#1090#1072#1088#1080#1093#1080
      FieldName = 'TIM'
    end
    object RepOpCHANGE_USR: TWideStringField
      DisplayLabel = #1048#1089#1090#1080#1092#1072#1076#1103#1095#1080
      FieldName = 'CHANGE_USR'
      Size = 4000
    end
    object RepOpCHANGE_TIM: TDateTimeField
      DisplayLabel = #1058#1072#1088#1080#1093
      FieldName = 'CHANGE_TIM'
    end
    object RepOpDENYNOTE: TWideStringField
      DisplayLabel = #1048#1084#1090#1080#1085#1072' '#1090#1103#1081#1080#1085#1072#1090#1099
      FieldName = 'DENYNOTE'
      Size = 4000
    end
    object RepOpBRANCHID: TFloatField
      FieldName = 'BRANCHID'
      Visible = False
    end
    object RepOpCURRENCY: TFloatField
      FieldName = 'CURRENCY'
      Required = True
      Visible = False
    end
    object RepOpCRDTYPE: TFloatField
      FieldName = 'CRDTYPE'
      Visible = False
    end
    object RepOpUSID: TFloatField
      FieldName = 'USID'
      Visible = False
    end
  end
  object RepPayPr: TOracleDataSet
    SQL.Strings = (
      
        'SELECT clp.customername, clp.customerid, av.val_name, f.NAME as ' +
        'filialname,'
      'clp.branchid,clp.currency,clp.credittype as crdtype,clp.usid, '
      'usaid_report.get_denynote(clp.id) as  denynote ,cplpayprocess.*'
      ''
      'FROM creditpipelines clp,'
      '       avalute av,'
      '       filial f,'
      ''
      '(SELECT a.id, a.contractid, a.dateofgrant, '
      
        'decode(a.pr_been_completed,0,'#39#1055#1088#1086#1089#1077#1089' '#1090#1072#1084#1072#1084#1083#1072#1085#1084#1072#1081#1099#1073#39',1,'#39#1055#1088#1086#1089#1077#1089' '#1090#1072 +
        #1084#1072#1084#1083#1072#1085#1099#1073#39') as  pr_been_completed,'
      
        '       a.numberofcredit, sb_aca.getuserbyid (a.usid) AS usr, a.t' +
        'im,'
      
        '       sb_aca.getuserbyid (a.usid) AS change_usr, a.tim AS chang' +
        'e_tim'
      '  FROM cplpaymentprocess a'
      '  union all '
      'SELECT a.id, a.contractid, a.dateofgrant, '
      
        'decode(a.pr_been_completed,0,'#39#1055#1088#1086#1089#1077#1089' '#1090#1072#1084#1072#1084#1083#1072#1085#1084#1072#1081#1099#1073#39',1,'#39#1055#1088#1086#1089#1077#1089' '#1090#1072 +
        #1084#1072#1084#1083#1072#1085#1099#1073#39') as  pr_been_completed,'
      
        '       a.numberofcredit,sb_aca.getuserbyid (a.usid) AS usr, a.ti' +
        'm,'
      
        '       sb_aca.getuserbyid (a.change_usid) AS change_usr, a.chang' +
        'e_tim'
      '  FROM cplpaymentprocess_c a) cplpayprocess'
      '  '
      '  WHERE clp.ID = cplpayprocess.contractid'
      '   AND clp.branchid = f.ID'
      '   AND clp.currency = av.valute'
      '   order by cplpayprocess.tim')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000120000001800000043005500530054004F004D00450052004E004100
      4D0045000100000000001400000043005500530054004F004D00450052004900
      440001000000000010000000560041004C005F004E0041004D00450001000000
      000014000000460049004C00490041004C004E0041004D004500010000000000
      10000000440045004E0059004E004F0054004500010000000000040000004900
      44000100000000001400000043004F004E005400520041004300540049004400
      0100000000001600000044004100540045004F0046004700520041004E005400
      01000000000022000000500052005F004200450045004E005F0043004F004D00
      50004C0045005400450044000100000000001C0000004E0055004D0042004500
      52004F0046004300520045004400490054000100000000000600000055005300
      520001000000000006000000540049004D000100000000001400000043004800
      41004E00470045005F0055005300520001000000000014000000430048004100
      4E00470045005F00540049004D00010000000000100000004200520041004E00
      430048004900440001000000000010000000430055005200520045004E004300
      59000100000000000E0000004300520044005400590050004500010000000000
      080000005500530049004400010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 384
    Top = 280
    object RepPayPrCONTRACTID: TFloatField
      DisplayLabel = #8470
      FieldName = 'CONTRACTID'
    end
    object RepPayPrCUSTOMERNAME: TWideStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099
      FieldName = 'CUSTOMERNAME'
      Required = True
      Size = 90
    end
    object RepPayPrCUSTOMERID: TWideStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' ID-'#1089#1080
      FieldName = 'CUSTOMERID'
      Required = True
      Size = 25
    end
    object RepPayPrVAL_NAME: TWideStringField
      DisplayLabel = '$'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object RepPayPrFILIALNAME: TWideStringField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      FieldName = 'FILIALNAME'
      Size = 90
    end
    object RepPayPrID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object RepPayPrDATEOFGRANT: TDateTimeField
      DisplayLabel = #1042#1077#1088#1080#1083#1084#1103' '#1090#1072#1088#1080#1093#1080':'
      FieldName = 'DATEOFGRANT'
    end
    object RepPayPrPR_BEEN_COMPLETED: TWideStringField
      DisplayLabel = #1055#1088#1086#1089#1077#1089
      FieldName = 'PR_BEEN_COMPLETED'
    end
    object RepPayPrNUMBEROFCREDIT: TWideStringField
      DisplayLabel = #1052#1094#1075#1072#1074#1080#1083#1103' '#8470'-'#1089#1080
      FieldName = 'NUMBEROFCREDIT'
      Size = 25
    end
    object RepPayPrUSR: TWideStringField
      DisplayLabel = #1056#1077#1076#1072#1082#1090#1103' '#1077#1076#1080#1078#1080' '#1080#1089#1090#1080#1092#1072#1076#1103#1095#1080
      FieldName = 'USR'
      Size = 4000
    end
    object RepPayPrTIM: TDateTimeField
      DisplayLabel = #1056#1077#1076#1072#1082#1090#1103' '#1090#1072#1088#1080#1093#1080
      FieldName = 'TIM'
    end
    object RepPayPrCHANGE_USR: TWideStringField
      DisplayLabel = #1048#1089#1090#1080#1092#1072#1076#1103#1095#1080
      FieldName = 'CHANGE_USR'
      Size = 4000
    end
    object RepPayPrCHANGE_TIM: TDateTimeField
      DisplayLabel = #1058#1072#1088#1080#1093
      FieldName = 'CHANGE_TIM'
    end
    object RepPayPrDENYNOTE: TWideStringField
      DisplayLabel = #1048#1084#1090#1080#1085#1072' '#1090#1103#1081#1080#1085#1072#1090#1099
      FieldName = 'DENYNOTE'
      Size = 4000
    end
    object RepPayPrBRANCHID: TFloatField
      FieldName = 'BRANCHID'
      Visible = False
    end
    object RepPayPrCURRENCY: TFloatField
      FieldName = 'CURRENCY'
      Required = True
      Visible = False
    end
    object RepPayPrCRDTYPE: TFloatField
      FieldName = 'CRDTYPE'
      Visible = False
    end
    object RepPayPrUSID: TFloatField
      FieldName = 'USID'
      Visible = False
    end
  end
  object customerspl: TOracleDataSet
    SQL.Strings = (
      'select id,CUSTOMERNAME'
      'from creditpipelines'
      'order by id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000002000000040000004900440001000000000018000000430055005300
      54004F004D00450052004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 256
    Top = 168
  end
  object customersplds: TDataSource
    DataSet = customerspl
    Left = 320
    Top = 168
  end
  object qr: TOracleQuery
    SQL.Strings = (
      'and nvl(crdp.COMMITTED,'#39' '#39')<>'#39'P5'#39)
    Session = sboapiDataModule.SBSession
    Optimize = False
    Left = 272
    Top = 224
  end
  object qr2: TOracleQuery
    SQL.Strings = (
      'and nvl(crdp.COMMITTED,'#39' '#39')='#39'P5'#39
      '')
    Session = sboapiDataModule.SBSession
    Optimize = False
    Left = 320
    Top = 224
  end
end
