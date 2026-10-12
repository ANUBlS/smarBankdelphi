object YReportsDataMod: TYReportsDataMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 564
  Width = 870
  object Branches: TOracleDataSet
    SQL.Strings = (
      'SELECT id, name'
      '  FROM filial')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 128
    Top = 16
  end
  object CurrencysSrc: TDataSource
    DataSet = Currencys
    Left = 48
    Top = 80
  end
  object BranchesSrc: TDataSource
    DataSet = Branches
    Left = 128
    Top = 80
  end
  object Currencys: TOracleDataSet
    SQL.Strings = (
      'SELECT valute,  valu_name'
      '  FROM AVALUTE'
      'ORDER BY VALUTE')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C000000560041004C005500540045000100000000001200
      0000560041004C0055005F004E0041004D004500010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 16
    object CurrencysVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object CurrencysVALU_NAME: TWideStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
  end
  object sysdat: TOracleDataSet
    SQL.Strings = (
      'select * from sysdat')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000040000000E000000540045004B005F00440041005400010000000000
      1000000050005200450044005F004400410054000100000000000E0000004100
      520043005F004400410059000100000000000A00000043004C004F0053004500
      010000000000}
    Session = sboapiDataModule.SBSession
    Left = 216
    Top = 13
    object sysdatTEK_DAT: TDateTimeField
      FieldName = 'TEK_DAT'
      Required = True
    end
    object sysdatPRED_DAT: TDateTimeField
      FieldName = 'PRED_DAT'
    end
    object sysdatARC_DAY: TDateTimeField
      FieldName = 'ARC_DAY'
    end
    object sysdatCLOSE: TIntegerField
      FieldName = 'CLOSE'
    end
  end
  object sysdatSrc: TDataSource
    DataSet = sysdat
    Left = 216
    Top = 80
  end
  object Persons: TOracleDataSet
    SQL.Strings = (
      'SELECT id,  descripion'
      '  FROM cr_persons')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 296
    Top = 16
  end
  object PersonsSrc: TDataSource
    DataSet = Persons
    Left = 296
    Top = 80
  end
  object Types: TOracleDataSet
    SQL.Strings = (
      'SELECT id, id ||'#39'-'#39'||typedesc idname'
      '  FROM cr_bp_types'
      'order by id')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 360
    Top = 16
    object FloatField1: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object StringField1: TWideStringField
      FieldName = 'IDNAME'
      Size = 169
    end
  end
  object TypesSrc: TDataSource
    DataSet = Types
    Left = 360
    Top = 80
  end
  object Categories: TOracleDataSet
    SQL.Strings = (
      'SELECT id, description'
      '  FROM cr_categories')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 432
    Top = 16
  end
  object CategoriesSrc: TDataSource
    DataSet = Categories
    Left = 440
    Top = 80
  end
  object Periods: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      '  FROM cr_bp_purposes')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 528
    Top = 9
  end
  object PeriodsSrc: TDataSource
    DataSet = Periods
    Left = 528
    Top = 80
  end
  object CustNames: TOracleDataSet
    SQL.Strings = (
      'SELECT id, name idname'
      '  FROM customers'
      'order by name')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 160
  end
  object CustNamesSrc: TDataSource
    DataSet = CustNames
    Left = 48
    Top = 224
  end
  object Customers: TOracleDataSet
    SQL.Strings = (
      'SELECT id, id||'#39'-'#39'||name idname'
      '  FROM customers where cust_type =0'
      'order by id ')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 144
    Top = 160
  end
  object CustomersSrc: TDataSource
    DataSet = Customers
    Left = 136
    Top = 224
  end
  object RepForms: TOracleDataSet
    SQL.Strings = (
      'select * from cr_bc_reports order by id')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 224
    Top = 160
  end
  object RepFormsSrc: TDataSource
    DataSet = RepForms
    Left = 224
    Top = 232
  end
  object CreditsDSSrc: TDataSource
    DataSet = CreditsDS
    Left = 312
    Top = 224
  end
  object CreditsDS: TOracleDataSet
    SQL.Strings = (
      'select*from cr_portfolio'
      ''
      ''
      ''
      ''
      '')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 312
    Top = 168
  end
  object ResultDS: TOracleDataSet
    SQL.Strings = (
      'SELECT f.*'
      '     , cr_ak_funcs.getlmcount(f.creditid,4) pret'
      '     , cr_ak_funcs.getlmcount(f.creditid,6) idd'
      '     , cr_ak_funcs.getlmcount(f.creditid,7) qatn'
      '     , cr_ak_funcs.geticracount(f.creditid,7) icra'
      
        '    ,s.paymentdate,s.principal,s.interest,s.principal+s.interest' +
        ' as cem,'
      '  case when s.sex=1 then'
      ' '#39'Ki'#248#232#39'  '
      'when s.sex=0 then '#39'Qadin'#39
      
        ' end as sex ,p.dateofconclusion, p.creditlineamount krxet ,pr.na' +
        'me adiyat'
      
        ' FROM cr_report_f1 f,cr_payment_schedule_portfel s,cr_portfolio ' +
        'p , CUSTOMERS c ,smart.prinad pr where f.CREDITID=s.CREDITID   a' +
        'nd p.id=f.creditid and'
      ' c.PRINAD_KOD(+)=pr.id and  p.BOOROWERID=c.id'
      ''
      ''
      ''
      ''
      'ORDER BY'
      '  branch, district, village, boorowername'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '/*SELECT f.*'
      '     , cm_ak_funcs.getlmcount(f.creditid,4) pret'
      '     , cm_ak_funcs.getlmcount(f.creditid,6) idd'
      '     , cm_ak_funcs.getlmcount(f.creditid,7) qatn'
      '     , cm_ak_funcs.geticracount(f.creditid,7) icra'
      
        '    ,s.paymentdate,s.principal,s.interest,s.principal+s.interest' +
        ' as cem,'
      '  case when s.sex=1 then'
      ' '#39'Ki'#248#232#39'  '
      'when s.sex=0 then '#39'Qadin'#39
      ' end as sex,cm_r'
      ''
      
        '  FROM cm_report_f1 f,cm_payment_schedule_portfel s,cm_active_cr' +
        'edits p,cm_categories c where f.CREDITID=s.CREDITID and p.CUSTOM' +
        'ERTYPE=c.id'
      ''
      ''
      ''
      'ORDER BY'
      '  branch, district, village, boorowername*/')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000047000000100000004300520045004400490054004900440001000000
      00001400000042004F004F0052004F0057004500520049004400010000000000
      0C0000004300520044004E0055004D000100000000001800000042004F004F00
      52004F005700450052004E0041004D0045000100000000001000000042005200
      41004E0043004800490044000100000000000C0000004200520041004E004300
      4800010000000000140000004400490053005400520049004300540049004400
      0100000000001000000044004900530054005200490043005400010000000000
      12000000560049004C004C00410047004500490044000100000000000E000000
      560049004C004C00410047004500010000000000120000005000550052005000
      4F0053004500490044000100000000000E00000050005500520050004F005300
      45000100000000000C0000005400590050004500490044000100000000001000
      0000540059005000450044004500530043000100000000001000000043005200
      440043004F0055004E0054000100000000001A00000050004100590045004400
      43005200440043004F0055004E0054000100000000001A000000460049005200
      5300540054005200430048004400410054004500010000000000160000004C00
      4100530054005000410059004400410054004500010000000000160000004700
      4900560045004E0041004D004F0055004E005400010000000000220000004300
      41004C00430055004C004100540045004400500045005200430045004E005400
      01000000000018000000440041005400450044004500420054004D0041004900
      4E00010000000000160000004400410054004500440045004200540049004E00
      540001000000000012000000500041005900450044004D00410049004E000100
      00000000100000005000410059004500440049004E0054000100000000001800
      0000500041005900450044004D004F004E004D00410049004E00010000000000
      16000000500041005900450044004D004F004E0049004E005400010000000000
      1000000044004500420054004D00410049004E000100000000000E0000004400
      45004200540049004E0054000100000000001800000044004500420054004F00
      5600450052004D00410049004E00010000000000160000004400450042005400
      4F0056004500520049004E00540001000000000014000000430041004C004300
      5300540041005400550053000100000000001400000043005200450044005000
      4500520049004F0044000100000000000E00000049004E005400520041005400
      45000100000000000C0000004F00440052004100540045000100000000000A00
      0000530042004F005500540001000000000016000000500052004F004C004F00
      4E004700440041005400450001000000000014000000500052004F004C004F00
      4E00470043004E0054000100000000002000000044005500450049004E005400
      4500520045005300540044004500420049005400010000000000080000005000
      5200450054000100000000000600000049004400440001000000000008000000
      5100410054004E00010000000000080000004900430052004100010000000000
      14000000440045005300430052004900500049004F004E000100000000001000
      0000530046004500520041004400410059000100000000001E00000050005500
      520050004F00530045004F004600430052004500440049005400010000000000
      10000000430055005200520045004E0043005900010000000000120000004C00
      4F0041004E00410043004300490044000100000000001A00000042004F004F00
      52004F00570045005200410043004300490044000100000000001E0000004200
      4F004F0052004F00570045005200410043004300520045005300540001000000
      00000E00000041004400440052004500530053000100000000000C0000005300
      41004C0041005200590001000000000016000000500048004F004E0045004E00
      55004D004200450052000100000000000E000000520045005300450052005600
      45000100000000000E0000004C00410054004500440041005900010000000000
      160000004400450053004300520049005000540049004F004E00010000000000
      120000004700490052004F005600520045005300540001000000000026000000
      5000520049004D00410052005900520045005300450052005600450041005200
      4500530054000100000000002C0000005000520049004D004100520059005000
      5500520052004500530045005200560045004100520045005300540001000000
      000014000000470045004300470055004E004600410049005A00010000000000
      1400000050004C0045004400470045004E0041004D0045000100000000001800
      00004F00440045004D0045005F0045004D00530041004C004900010000000000
      180000004500580050004500520054005F005F004E0041004D00450001000000
      00000A0000004B00550052005500530001000000000016000000500041005900
      4D0045004E005400440041005400450001000000000012000000500052004900
      4E0043004900500041004C000100000000001000000049004E00540045005200
      4500530054000100000000000600000053004500580001000000000006000000
      430045004D000100000000002000000044004100540045004F00460043004F00
      4E0043004C005500530049004F004E000100000000000A0000004B0052005800
      450054000100000000000C000000410044004900590041005400010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 408
    Top = 168
    object ResultDSODEME_EMSALI: TFloatField
      DisplayLabel = #350#228#255#236#255' '#255#236#241#224#235#251
      FieldName = 'ODEME_EMSALI'
      DisplayFormat = '#,#0.00'
    end
    object ResultDSCREDITID: TFloatField
      DisplayLabel = #202#287#229#228' '#219#196
      FieldName = 'CREDITID'
      Required = True
    end
    object ResultDSBOOROWERID: TFloatField
      DisplayLabel = #204#246#249' '#219#196
      FieldName = 'BOOROWERID'
      Required = True
    end
    object ResultDSCRDNUM: TWideStringField
      DisplayLabel = #204#246#227#224#226#232#235#255' '#185
      FieldName = 'CRDNUM'
      Required = True
      Size = 255
    end
    object ResultDSBOOROWERNAME: TWideStringField
      DisplayLabel = #204#246#248#242#255#287#232
      FieldName = 'BOOROWERNAME'
      Required = True
      Size = 255
    end
    object ResultDSBRANCHID: TFloatField
      DisplayLabel = #212#232#235' '#219#196
      FieldName = 'BRANCHID'
      Required = True
      Visible = False
    end
    object ResultDSBRANCH: TWideStringField
      DisplayLabel = #212#232#235#232#224#235
      FieldName = 'BRANCH'
      Required = True
      Size = 255
    end
    object ResultDSDISTRICTID: TFloatField
      DisplayLabel = #286#224#233#238#237' '#219#196
      FieldName = 'DISTRICTID'
      Required = True
      Visible = False
    end
    object ResultDSDISTRICT: TWideStringField
      DisplayLabel = #286#224#233#238#237
      FieldName = 'DISTRICT'
      Required = True
      Size = 255
    end
    object ResultDSVILLAGE: TWideStringField
      DisplayLabel = #202#255#237#228
      FieldName = 'VILLAGE'
      Required = True
      Size = 255
    end
    object ResultDSCREDPERIOD: TWideStringField
      DisplayLabel = #194#255#241#224#232#242#232#237' '#236#255#237#225#255#233#232
      FieldName = 'CREDPERIOD'
      Required = True
    end
    object ResultDSDESCRIPION: TWideStringField
      DisplayLabel = #204#246#248#242#255#287#232#237#232#237' '#241#242#224#242#243#241#243
      FieldName = 'DESCRIPION'
      Size = 30
    end
    object ResultDSSEX: TWideStringField
      DisplayLabel = #193#238#287#230#224#235#224#237#251#237' '#230#232#237#241#232
      FieldName = 'SEX'
      Size = 12
    end
    object ResultDSPURPOSE: TWideStringField
      DisplayLabel = #202#287#229#228#232#242' '#236#255#249#241#243#235#243#237#243#237' '#224#228#251
      FieldName = 'PURPOSE'
      Required = True
      Size = 255
    end
    object ResultDSSFERADAY: TWideStringField
      DisplayLabel = #204#246#248#242#255#287#232#237#232#237' '#244#255#224#235#232#233#233#224#242' '#241#224#249#255#241#232
      FieldName = 'SFERADAY'
      Size = 30
    end
    object ResultDSPURPOSEOFCREDIT: TWideStringField
      DisplayLabel = #202#287#229#228#232#242#232#237' '#242#255#233#232#237#224#242#251
      FieldName = 'PURPOSEOFCREDIT'
      Size = 50
    end
    object ResultDSPURPOSEID: TFloatField
      DisplayLabel = #204#255#227#241#255#228' '#219#196
      FieldName = 'PURPOSEID'
      Required = True
      Visible = False
    end
    object ResultDSTYPEID: TFloatField
      DisplayLabel = #210#232#239' '#219#196
      FieldName = 'TYPEID'
      Required = True
      Visible = False
    end
    object ResultDSTYPEDESC: TWideStringField
      DisplayLabel = #210#232#239
      FieldName = 'TYPEDESC'
      Required = True
      Size = 10
    end
    object ResultDSCRDCOUNT: TFloatField
      DisplayLabel = #202#287#229#228' '#209#224#233
      FieldName = 'CRDCOUNT'
      Required = True
      Visible = False
    end
    object ResultDSPAYEDCRDCOUNT: TFloatField
      DisplayLabel = #350#228#255#237#232#235#232#225
      FieldName = 'PAYEDCRDCOUNT'
      Required = True
      Visible = False
    end
    object ResultDSDATEOFCONCLUSION: TDateTimeField
      DisplayLabel = #202#287#229#228#232#242#232#237' '#226#229#287#232#235#236#255' '#242#224#287#232#245#232
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object ResultDSFIRSTTRCHDATE: TDateTimeField
      DisplayLabel = #200#235#234' '#242#287#224#237#248
      FieldName = 'FIRSTTRCHDATE'
      Required = True
    end
    object ResultDSLASTPAYDATE: TDateTimeField
      DisplayLabel = #209#238#237' '#351#228#255#236#255
      FieldName = 'LASTPAYDATE'
      Required = True
    end
    object ResultDSPROLONGCNT: TFloatField
      DisplayLabel = #207#287#238#235#238#237#227#224#241#233#224' '#236#246#228#228#255#242#232
      FieldName = 'PROLONGCNT'
    end
    object ResultDSPROLONGDATE: TDateTimeField
      DisplayLabel = #207#287#238#235#238#237#227#224#241#233#224' '#242#224#287#232#245#232
      FieldName = 'PROLONGDATE'
    end
    object ResultDSCURRENCY: TWideStringField
      DisplayLabel = #194#224#235#233#243#242#224
      FieldName = 'CURRENCY'
      Size = 65
    end
    object ResultDSKURUS: TFloatField
      DisplayLabel = #193#243' '#305#246#237#255' '#234#243#287#241
      FieldName = 'KURUS'
    end
    object ResultDSINTRATE: TFloatField
      DisplayLabel = #244#224#232#231'. stavkas'#251
      FieldName = 'INTRATE'
      DisplayFormat = '#,#0.0'
    end
    object ResultDSODRATE: TFloatField
      DisplayLabel = 'gec '#244#224#232#231'. stavkas'#251
      FieldName = 'ODRATE'
      DisplayFormat = '#,#0.0'
    end
    object ResultDSKRXET: TFloatField
      DisplayLabel = #202#287#229#228#232#242#232#237' '#236#255#225#235#255#252#232
      FieldName = 'KRXET'
      DisplayFormat = '#,#0.0 '
    end
    object ResultDSGIVENAMOUNT: TFloatField
      DisplayLabel = #194#229#287#232#235#236#232#248' kr'
      FieldName = 'GIVENAMOUNT'
      Required = True
      DisplayFormat = '#,#0.0 '
    end
    object ResultDSDATEDEBTMAIN: TFloatField
      DisplayLabel = #194#224#245#242#251' '#247#224#242'.'
      FieldName = 'DATEDEBTMAIN'
      Required = True
      DisplayFormat = '#,#0.0'
    end
    object ResultDSPAYEDMAIN: TFloatField
      DisplayLabel = #350#228#255#237'. '#255#241#224#241
      FieldName = 'PAYEDMAIN'
      Required = True
      DisplayFormat = '#,#0.0'
    end
    object ResultDSPAYEDMONMAIN: TFloatField
      DisplayLabel = #198#224#287#232' '#224#233#228#224' '#351#228#255#237#255#237' '#255#241#224#241
      FieldName = 'PAYEDMONMAIN'
      Required = True
      DisplayFormat = '#,#0.0'
    end
    object ResultDSDEBTMAIN: TFloatField
      DisplayLabel = #195#224#235#251#227' kredit borc'
      FieldName = 'DEBTMAIN'
      Required = True
      DisplayFormat = '#,#0.0'
    end
    object ResultDSDEBTOVERMAIN: TFloatField
      DisplayLabel = #223#241#224#241' '#225#238#287#230' '#246#231#287#255' '#305#229#230#232#234#236#255' '#236#255#225
      FieldName = 'DEBTOVERMAIN'
      Required = True
      DisplayFormat = '#,#0.0'
    end
    object ResultDSLATEDAY: TFloatField
      DisplayLabel = #223'.'#193' '#305#229#230' '#305#246#237#235#255#287#232#237' '#241#224#233#251
      FieldName = 'LATEDAY'
    end
    object ResultDSCALCULATEDPERCENT: TFloatField
      DisplayLabel = #217#229#241' '#244#224#232#231
      FieldName = 'CALCULATEDPERCENT'
      Required = True
      DisplayFormat = '#,#0.0'
    end
    object ResultDSDATEDEBTINT: TFloatField
      DisplayLabel = #194#224#245#242#251' '#247#224#242'. %; '#225#238#287#230#243'.'
      FieldName = 'DATEDEBTINT'
      Required = True
      DisplayFormat = '#,#0.0'
    end
    object ResultDSPAYEDINT: TFloatField
      DisplayLabel = #350#228#255#237#232#235#236#232#248'. % '#225#238#287
      FieldName = 'PAYEDINT'
      Required = True
      DisplayFormat = '#,#0.0'
    end
    object ResultDSPAYEDMONINT: TFloatField
      DisplayLabel = #198#224#287#232' '#224#233#228#224' '#351#228#255#237#255#237' '#244#224#232#231
      FieldName = 'PAYEDMONINT'
      Required = True
      DisplayFormat = '#,#0.0'
    end
    object ResultDSDEBTINT: TFloatField
      DisplayLabel = #212#224#232#231' '#227#224#235#251#252#251
      FieldName = 'DEBTINT'
      Required = True
      DisplayFormat = '#,#0.0'
    end
    object ResultDSDEBTOVERINT: TFloatField
      DisplayLabel = #212#224#232#231' '#225#238#287#230#243' '#246#231#287#255'  '#305#229#230#232#234#236#255' '#236#255#225
      FieldName = 'DEBTOVERINT'
      Required = True
      DisplayFormat = '#,#0.0'
    end
    object ResultDSGECGUNFAIZ: TFloatField
      DisplayLabel = #212'.'#193' '#305#229#230' '#305#246#237#235#255#287#232#237' '#241#224#233#251
      FieldName = 'GECGUNFAIZ'
    end
    object ResultDSLOANACCID: TWideStringField
      DisplayLabel = #209#241#243#228#224' '#249#229#241#224#225#251
      FieldName = 'LOANACCID'
      Size = 30
    end
    object ResultDSBOOROWERACCID: TWideStringField
      DisplayLabel = #198#224#287#232' '#249#229#241#224#225
      FieldName = 'BOOROWERACCID'
      Size = 30
    end
    object ResultDSBOOROWERACCREST: TFloatField
      DisplayLabel = #198#224#287#232' '#249#229#241#224#225' '#227#224#235#251#252#251
      FieldName = 'BOOROWERACCREST'
      DisplayFormat = '#,#0.0 '
    end
    object ResultDSADDRESS: TWideStringField
      DisplayLabel = #201#224#248#224#233#251#248' '#233#229#287#232
      FieldName = 'ADDRESS'
      Size = 60
    end
    object ResultDSPHONENUMBER: TWideStringField
      DisplayLabel = #210#229#235#229#244#238#237#243
      FieldName = 'PHONENUMBER'
      Size = 350
    end
    object ResultDSSALARY: TWideStringField
      DisplayLabel = #212#255#224#235#232#233#233#255#242' '#233#229#287#232
      FieldName = 'SALARY'
      Size = 50
    end
    object ResultDSDESCRIPTION: TWideStringField
      DisplayLabel = #304#232#287#238#226#243#237' '#237#351#226#246
      FieldName = 'DESCRIPTION'
      Size = 45
    end
    object ResultDSGIROVREST: TFloatField
      DisplayLabel = #304#232#287#238#226#243#237' '#228#255#233#255#287#232
      FieldName = 'GIROVREST'
      DisplayFormat = '#,#0.0 '
    end
    object ResultDSDUEBYSCHEME: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DUEBYSCHEME'
      Visible = False
      Calculated = True
    end
    object ResultDSCALCSTATUS: TWideStringField
      DisplayLabel = '% '#249#229#241#224#225#235#224#236#224#241#251' '#241#242#224#242#243#241#243
      FieldName = 'CALCSTATUS'
      Required = True
      Size = 12
    end
    object ResultDSRESERVE: TWideStringField
      DisplayLabel = #197#249#242#232#233#233#224#242' '#228#255#287#255#230#255#241#232
      FieldName = 'RESERVE'
      Size = 18
    end
    object ResultDSPRIMARYRESERVEAREST: TFloatField
      DisplayLabel = #192#228#232' '#229#249#242#232#233#233#224#242' '#249#229#241' '#227#224#235#251#227
      FieldName = 'PRIMARYRESERVEAREST'
      DisplayFormat = '#,#0.0 '
    end
    object ResultDSPRIMARYPURRESERVEAREST: TFloatField
      DisplayLabel = #204#255#227#241#255#228#235#232' '#229#249#242#232#233#233#224#242' '#249#229#241' '#227#224#235#251#227
      FieldName = 'PRIMARYPURRESERVEAREST'
      DisplayFormat = '#,#0.0 '
    end
    object ResultDSPRET: TFloatField
      FieldName = 'PRET'
    end
    object ResultDSIDD: TFloatField
      FieldName = 'IDD'
    end
    object ResultDSQATN: TFloatField
      FieldName = 'QATN'
    end
    object ResultDSICRA: TFloatField
      FieldName = 'ICRA'
    end
    object ResultDSEXPERT__NAME: TWideStringField
      DisplayLabel = #202#287#229#228#232#242#232' '#230#255#235#225' '#229#228#255#237' '#204' '#224#228#251
      FieldName = 'EXPERT__NAME'
      Size = 25
    end
    object ResultDSPAYMENTDATE: TDateTimeField
      DisplayLabel = 'Cari ayda '#351#228#255#237#232#248' '#242#224#287#232#245#232
      FieldName = 'PAYMENTDATE'
    end
    object ResultDSPRINCIPAL: TFloatField
      DisplayLabel = 'Cari ayda '#255#241#224#241#228#224#237' '#351#228#255#237#232#248
      FieldName = 'PRINCIPAL'
    end
    object ResultDSINTEREST: TFloatField
      DisplayLabel = 'Cari ayda  % '#228#255#237' '#351#228#255#237#232#248
      FieldName = 'INTEREST'
    end
    object ResultDSCEM: TFloatField
      DisplayLabel = #198#255#236#232' '#351#228#255#237#232#248
      FieldName = 'CEM'
    end
    object ResultDSADIYAT: TWideStringField
      DisplayLabel = #193#238#287#230#224#235#224#237#251#237' '#225#224#237#234#224' '#224#228#232#233#233#224#242#251
      FieldName = 'ADIYAT'
      Size = 90
    end
  end
end
