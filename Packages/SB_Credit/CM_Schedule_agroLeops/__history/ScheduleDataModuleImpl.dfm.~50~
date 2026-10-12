object ScheduleDataModule: TScheduleDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 480
  Width = 696
  object DataSrcScheduleData: TDataSource
    DataSet = ScheduleData
    Left = 64
    Top = 32
  end
  object ScheduleData_report: TOracleDataSet
    SQL.Strings = (
      '/*select*from ('
      
        'select rowid,0 as row_num ,0 as id,0 as creditid,p.dateofconclus' +
        'ion paymentdate,0 as principal,0 as interest,0 as ipinterest,0 a' +
        's rest'
      
        '  ,creditlineamount*annualbankrate /100 kom_haqq,0 sabit_faiz,'#39'S' +
        'sudan'#305'n verilm'#601'si'#39' kr_ode  from cm_portfolio p where id=:CREDITI' +
        'D'
      'union all*/'
      
        'SELECT rownum as row_num ,Z.id,z.creditid,z.paymentdate,z.princi' +
        'pal,z.interest,z.ipinterest,z.rest, advance,service,insurance ,'
      ' round((principal+interest+ advance+service+insurance),2) pay'
      'FROM CM_PAYMENT_SCHEDULE Z'
      'WHERE Z.CREDITID=:CREDITID'
      'order by paymentdate')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00430052004500440049005400490044000300
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000C0000000E00000052004F0057005F004E0055004D00010000000000
      0400000049004400010000000000100000004300520045004400490054004900
      4400010000000000160000005000410059004D0045004E005400440041005400
      4500010000000000120000005000520049004E0043004900500041004C000100
      000000001000000049004E005400450052004500530054000100000000001400
      00004900500049004E0054004500520045005300540001000000000008000000
      52004500530054000100000000000E00000041004400560041004E0043004500
      0100000000000E00000053004500520056004900430045000100000000001200
      000049004E0053005500520041004E0043004500010000000000060000005000
      41005900010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    OnCalcFields = ScheduleData_reportCalcFields
    Left = 96
    Top = 280
    object ScheduleData_reportSeqNo: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'SeqNo'
      OnGetText = ScheduleData_reportSeqNoGetText
      Calculated = True
    end
    object ScheduleData_reportID: TFloatField
      FieldName = 'ID'
    end
    object ScheduleData_reportCREDITID: TFloatField
      FieldName = 'CREDITID'
    end
    object ScheduleData_reportPAYMENTDATE: TDateTimeField
      FieldName = 'PAYMENTDATE'
    end
    object ScheduleData_reportPRINCIPAL: TFloatField
      FieldName = 'PRINCIPAL'
    end
    object ScheduleData_reportINTEREST: TFloatField
      FieldName = 'INTEREST'
    end
    object ScheduleData_reportIPINTEREST: TFloatField
      FieldName = 'IPINTEREST'
    end
    object ScheduleData_reportREST: TFloatField
      FieldName = 'REST'
    end
    object ScheduleData_reportROW_NUM: TFloatField
      FieldName = 'ROW_NUM'
    end
    object ScheduleData_reporttotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTALPAY'
      Calculated = True
    end
    object ScheduleData_reportADVANCE: TFloatField
      FieldName = 'ADVANCE'
    end
    object ScheduleData_reportSERVICE: TFloatField
      FieldName = 'SERVICE'
    end
    object ScheduleData_reportINSURANCE: TFloatField
      FieldName = 'INSURANCE'
    end
    object ScheduleData_reportPAY: TFloatField
      FieldName = 'PAY'
    end
  end
  object BoorowerInfo: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   bi.NAME,'
      '   cm_common.AccountNumber_Get(a.booroweraccid) as custaccno,'
      '   cm_common.AccountNumber_Get(a.Loanaccid) as loanaccno  '
      'FROM'
      '  CM_BOOROWERINFO bi, cm_accounts a'
      'WHERE bi.CreditID=:CREDITID'
      'and a.creditid = :CREDITID')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00430052004500440049005400490044000300
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000003000000080000004E0041004D004500010000000000120000004300
      5500530054004100430043004E004F00010000000000120000004C004F004100
      4E004100430043004E004F00010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 64
    Top = 192
    object BoorowerInfoCUSTACCNO: TWideStringField
      FieldName = 'CUSTACCNO'
      Size = 4000
    end
    object BoorowerInfoLOANACCNO: TWideStringField
      FieldName = 'LOANACCNO'
      Size = 4000
    end
    object BoorowerInfoNAME: TWideStringField
      FieldName = 'NAME'
      Size = 64
    end
  end
  object DSBoorowerInfo: TDataSource
    DataSet = BoorowerInfo
    Left = 184
    Top = 184
  end
  object CreditInfo: TOracleDataSet
    SQL.Strings = (
      
        'select id,boorowerid,currency,creditlineamount,initialamount,ILI' +
        'NODENISH,ANNUALYINTERESTRATE ,BRANCHID,'
      
        'dateofconclusion,annualypenaltyrate,intcalcmethod,numberofcredit' +
        ','
      
        'period||'#39'('#39'||period_text||'#39')'#39'||'#39'Ay'#39' period_yazi,user_hazirladi,e' +
        'xpert,'
      
        'duedatefirstcontract,enddat,komision,val_name,mehsul,rest,idcust' +
        ',cust_name,phone_m,address,pasport,expert_phone,period,'
      
        '/*cm_utils.GET_GUZEST(id)||'#39'('#39'||Convert_Number_To_Text(0)||'#39')'#39'||' +
        #39'Ay'#39' as guzest,*/TO_CHAR (duedatefirstcontract,  '#39'dd monthyyyy'#39',' +
        '  '#39'NLS_DATE_LANGUAGE=AZERBAIJANI'#39')as tarix,'
      'acc_no '
      ' from ('
      'SELECT'
      
        '   A.ID , A.CURRENCY ,A.boorowerid,creditlineamount*annualbankra' +
        'te /100 kom_haqq, '
      
        '  A.CREDITLINEAMOUNT ,a.initialamount,a.ILINODENISH, A.ANNUALYIN' +
        'TERESTRATE , A.DATEOFCONCLUSION,a.annualbankrate,a.annualypenalt' +
        'yrate,a.intcalcmethod,a.numberofcredit'
      
        ' , A.DUEDATEFIRSTCONTRACT , nvl(a.duedatelastcontract,DUEDATEFIR' +
        'STCONTRACT) enddat,a.komision,'
      
        ' (select name from user$ where id=usid)user_hazirladi,(select na' +
        'me from cm_expert where id =a.expertid) expert,(select phone fro' +
        'm cm_expert where id =a.expertid) expert_phone,'
      '   A.CREDITTYPE,a.branchid,cm_utils.FIFD(a.id) fifd,'
      
        '   piecesofwriting.CurrencyToHR( cm_common.GetPeriod(A.DATEOFCON' +
        'CLUSION,A.DUEDATEFIRSTCONTRACT)) period_text,'
      
        '   cm_common.GetPeriod(A.DATEOFCONCLUSION,A.DUEDATEFIRSTCONTRACT' +
        ') as period,v.val_name,(select name from cm_mehsul where id =a.m' +
        'ehsulid)mehsul,'
      
        '   c.rest+c.duerest rest,i.idcust, i.lastname||'#39' '#39'||i.name||'#39' '#39'|' +
        '|i.soname cust_name,i.phone_m,i.address||'#39' ,'#39'||i.city as address' +
        ',i.passer||'#39#39'||i.paspnum ||'#39'  '#39'||i.paspdate|| '#39' tarixind'#601'   '#39'||i' +
        '.paspplace ||'#39' '#39'||'#39't'#601'r'#601'find'#601'n verilmi'#351'dir.'#39' pasport,'
      
        '   (select acc_no from account where id in(select booroweraccid ' +
        'from  cm_accounts where creditid=A.id))acc_no'
      'FROM'
      '   CM_ACTIVE_CREDITS A,avalute v,custinfo i,'
      '   cm_curr_state c'
      'WHERE a.ID=:id'
      'and c.creditid = :id'
      'and a.currency=v.valute'
      'and a.boorowerid=i.idcust) aa'
      '')
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001E000000040000004900440001000000000010000000430055005200
      520045004E004300590001000000000020000000430052004500440049005400
      4C0049004E00450041004D004F0055004E005400010000000000200000004400
      4100540045004F00460043004F004E0043004C005500530049004F004E000100
      0000000028000000440055004500440041005400450046004900520053005400
      43004F004E005400520041004300540001000000000008000000520045005300
      540001000000000010000000560041004C005F004E0041004D00450001000000
      00002400000041004E004E00550041004C005900500045004E0041004C005400
      590052004100540045000100000000000C00000045004E004400440041005400
      0100000000001A00000049004E005400430041004C0043004D00450054004800
      4F0044000100000000001C0000004E0055004D004200450052004F0046004300
      52004500440049005400010000000000100000004B004F004D00490053004900
      4F004E000100000000001C00000055005300450052005F00480041005A004900
      52004C004100440049000100000000000C000000450058005000450052005400
      0100000000000C0000004D0045004800530055004C000100000000000C000000
      4900440043005500530054000100000000001200000043005500530054005F00
      4E0041004D0045000100000000000E000000500048004F004E0045005F004D00
      0100000000000E00000041004400440052004500530053000100000000000E00
      000050004100530050004F005200540001000000000016000000500045005200
      49004F0044005F00590041005A0049000100000000002600000041004E004E00
      550041004C00590049004E005400450052004500530054005200410054004500
      010000000000100000004200520041004E004300480049004400010000000000
      0A000000540041005200490058000100000000000C0000004100430043005F00
      4E004F000100000000001400000042004F004F0052004F005700450052004900
      4400010000000000180000004500580050004500520054005F00500048004F00
      4E0045000100000000000C00000050004500520049004F004400010000000000
      1A00000049004E0049005400490041004C0041004D004F0055004E0054000100
      000000001600000049004C0049004E004F00440045004E004900530048000100
      00000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 184
    Top = 80
    object CreditInfoID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CreditInfoCURRENCY: TFloatField
      FieldName = 'CURRENCY'
    end
    object CreditInfoCREDITLINEAMOUNT: TFloatField
      FieldName = 'CREDITLINEAMOUNT'
    end
    object CreditInfoBOOROWERID: TFloatField
      FieldName = 'BOOROWERID'
    end
    object CreditInfoINITIALAMOUNT: TFloatField
      FieldName = 'INITIALAMOUNT'
    end
    object CreditInfoILINODENISH: TFloatField
      FieldName = 'ILINODENISH'
    end
    object CreditInfoANNUALYINTERESTRATE: TFloatField
      FieldName = 'ANNUALYINTERESTRATE'
    end
    object CreditInfoBRANCHID: TFloatField
      FieldName = 'BRANCHID'
    end
    object CreditInfoDATEOFCONCLUSION: TDateTimeField
      FieldName = 'DATEOFCONCLUSION'
    end
    object CreditInfoANNUALYPENALTYRATE: TFloatField
      FieldName = 'ANNUALYPENALTYRATE'
    end
    object CreditInfoINTCALCMETHOD: TFloatField
      FieldName = 'INTCALCMETHOD'
    end
    object CreditInfoNUMBEROFCREDIT: TWideStringField
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object CreditInfoPERIOD_YAZI: TWideStringField
      FieldName = 'PERIOD_YAZI'
      Size = 4000
    end
    object CreditInfoUSER_HAZIRLADI: TWideStringField
      FieldName = 'USER_HAZIRLADI'
      Size = 128
    end
    object CreditInfoEXPERT: TWideStringField
      FieldName = 'EXPERT'
      Size = 80
    end
    object CreditInfoDUEDATEFIRSTCONTRACT: TDateTimeField
      FieldName = 'DUEDATEFIRSTCONTRACT'
    end
    object CreditInfoENDDAT: TDateTimeField
      FieldName = 'ENDDAT'
    end
    object CreditInfoKOMISION: TFloatField
      FieldName = 'KOMISION'
    end
    object CreditInfoVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object CreditInfoMEHSUL: TWideStringField
      FieldName = 'MEHSUL'
      Size = 400
    end
    object CreditInfoREST: TFloatField
      FieldName = 'REST'
    end
    object CreditInfoIDCUST: TFloatField
      FieldName = 'IDCUST'
    end
    object CreditInfoCUST_NAME: TWideStringField
      FieldName = 'CUST_NAME'
      Size = 364
    end
    object CreditInfoPHONE_M: TWideStringField
      FieldName = 'PHONE_M'
      Size = 100
    end
    object CreditInfoADDRESS: TWideStringField
      FieldName = 'ADDRESS'
      Size = 462
    end
    object CreditInfoPASPORT: TWideStringField
      FieldName = 'PASPORT'
      Size = 470
    end
    object CreditInfoEXPERT_PHONE: TWideStringField
      FieldName = 'EXPERT_PHONE'
      Size = 50
    end
    object CreditInfoPERIOD: TFloatField
      FieldName = 'PERIOD'
    end
    object CreditInfoTARIX: TWideStringField
      FieldName = 'TARIX'
      Size = 75
    end
    object CreditInfoACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 28
    end
  end
  object DataSrcCreditInfo: TDataSource
    DataSet = CreditInfo
    Left = 184
    Top = 32
  end
  object CM_SCHEDULE: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CM_SCHEDULE'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Left = 184
    Top = 136
  end
  object ExportData: TOracleDataSet
    SQL.Strings = (
      'SELECT  paymentdate, principal, interest,rest'
      '  FROM cm_payment_schedule'
      'where Creditid=:CREDITID'
      'ORDER BY PAYMENTDATE')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00430052004500440049005400490044000300
      00000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 64
    Top = 144
    object ExportDataPAYMENTDATE: TDateTimeField
      DisplayLabel = #1058#1072#1088#1080#1093
      FieldName = 'PAYMENTDATE'
      Required = True
    end
    object ExportDataREST: TFloatField
      DisplayLabel = #1043#1072#1083#1099#1075
      FieldName = 'REST'
    end
    object ExportDataPRINCIPAL: TFloatField
      DisplayLabel = #1071#1089#1072#1089' '#1052#1103#1073#1083#1103#1100
      FieldName = 'PRINCIPAL'
      Required = True
    end
    object ExportDataINTEREST: TFloatField
      DisplayLabel = #1060#1072#1080#1079
      FieldName = 'INTEREST'
      Required = True
    end
  end
  object BankInfo: TOracleDataSet
    SQL.Strings = (
      
        'select BANK,tel,adress,logo,az_name,sedr,buhaltr,assistant from ' +
        'smart.bankinfoes_t where kod_fil=:v_kod_fil')
    Optimize = False
    Variables.Data = {
      0400000001000000140000003A0056005F004B004F0044005F00460049004C00
      030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000800000008000000420041004E004B00010000000000080000004C00
      4F0047004F000000000000000E00000041005A005F004E0041004D0045000100
      0000000008000000530045004400520001000000000012000000410053005300
      49005300540041004E00540001000000000006000000540045004C0001000000
      00000C0000004100440052004500530053000100000000000E00000042005500
      480041004C0054005200010000000000}
    Session = sboapiDataModule.SBSession
    Left = 272
    Top = 32
    object BankInfoLOGO: TBlobField
      FieldName = 'LOGO'
    end
    object BankInfoBANK: TWideStringField
      FieldName = 'BANK'
      Size = 80
    end
    object BankInfoAZ_NAME: TWideStringField
      FieldName = 'AZ_NAME'
      Size = 80
    end
    object BankInfoSEDR: TWideStringField
      FieldName = 'SEDR'
      Size = 320
    end
    object BankInfoASSISTANT: TWideStringField
      FieldName = 'ASSISTANT'
      Size = 800
    end
    object BankInfoTEL: TWideStringField
      FieldName = 'TEL'
      Size = 320
    end
    object BankInfoADRESS: TWideStringField
      FieldName = 'ADRESS'
      Size = 320
    end
    object BankInfoBUHALTR: TWideStringField
      FieldName = 'BUHALTR'
      Size = 320
    end
  end
  object FilialInfods: TDataSource
    DataSet = FilialInfo
    Left = 336
    Top = 32
  end
  object FilialInfo: TOracleDataSet
    SQL.Strings = (
      'select id,name from filial'
      'where id = :brid '
      '--smart.sb_aca.getuserfilialid(user)')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A00420052004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      0500000002000000080000004E0041004D004500010000000000040000004900
      4400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 408
    Top = 32
    object FilialInfoNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
    object FilialInfoID: TFloatField
      FieldName = 'ID'
      Required = True
    end
  end
  object HeadOfficeID: TOracleDataSet
    SQL.Strings = (
      'select min(id) as minid from smart.filial_t')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {05000000010000000A0000004D0049004E0049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 336
    Top = 88
    object HeadOfficeIDMINID: TFloatField
      FieldName = 'MINID'
    end
  end
  object adm: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CM_ADMINISTRATION'
    Left = 296
    Top = 216
  end
  object ScheduleData: TOracleDataSet
    SQL.Strings = (
      'SELECT Z.RowID,Z.*'
      '  FROM CM_PAYMENT_SCHEDULE Z'
      'WHERE Z.CREDITID=:CREDITID'
      'ORDER BY PAYMENTDATE')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00430052004500440049005400490044000300
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000D000000040000004900440001000000000010000000430052004500
      44004900540049004400010000000000160000005000410059004D0045004E00
      54004400410054004500010000000000120000005000520049004E0043004900
      500041004C000100000000001000000049004E00540045005200450053005400
      010000000000140000004900500049004E005400450052004500530054000100
      0000000008000000520045005300540001000000000014000000430048004100
      4E004300450044004100540045000100000000001000000050004F0052005400
      4400410054004500010000000000160000004300520045004100540045005F00
      54005900500045000100000000000E00000041004400560041004E0043004500
      0100000000000E00000053004500520056004900430045000100000000001200
      000049004E0053005500520041004E0043004500010000000000}
    Cursor = crSQLWait
    AutoCalcFields = False
    OnApplyRecord = ScheduleDataApplyRecord
    CommitOnPost = False
    CachedUpdates = True
    Session = sboapiDataModule.SBSession
    OnCalcFields = ScheduleDataCalcFields
    Left = 64
    Top = 80
    object ScheduleDataSeqNo: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'SeqNo'
      OnGetText = ScheduleDataSeqNoGetText
      Calculated = True
    end
    object ScheduleDataID: TFloatField
      FieldName = 'ID'
    end
    object ScheduleDataCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object ScheduleDataPAYMENTDATE: TDateTimeField
      DisplayLabel = #1058#1072#1088#1080#1093
      FieldName = 'PAYMENTDATE'
      Required = True
    end
    object ScheduleDataREST: TFloatField
      DisplayLabel = 'Qal'#305'q'
      FieldName = 'REST'
      DisplayFormat = '#,##0.00'
    end
    object ScheduleDataPRINCIPAL: TFloatField
      DisplayLabel = #1071#1089#1072#1089' '#1073#1086#1088#1078#1076#1072#1085
      FieldName = 'PRINCIPAL'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object ScheduleDataINTEREST: TFloatField
      DisplayLabel = #1065#1077#1089#1072#1073#1083#1072#1085#1084#1099#1096' '#1092#1072#1080#1079#1076#1103#1085
      FieldName = 'INTEREST'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object ScheduleDataTOTALPAY: TFloatField
      DisplayLabel = '"'#399'sas m'#601'bl'#601#287'  faiz"'
      FieldKind = fkCalculated
      FieldName = 'TOTALPAY'
      DisplayFormat = '#,#0.00'
      Calculated = True
    end
    object ScheduleDataADVANCE: TFloatField
      FieldName = 'ADVANCE'
    end
    object ScheduleDataSERVICE: TFloatField
      FieldName = 'SERVICE'
    end
    object ScheduleDataINSURANCE: TFloatField
      FieldName = 'INSURANCE'
    end
    object ScheduleDataTOTALPAYSUM: TFloatField
      DisplayLabel = #214'd'#601'ni'#351
      FieldKind = fkCalculated
      FieldName = 'TOTALPAYSUM'
      DisplayFormat = '#,#0.00'
      Calculated = True
    end
  end
  object Ods_insurance: TOracleDataSet
    SQL.Strings = (
      
        'select rowid, a.* from cm_payment_schedule a where a.creditid=:v' +
        '_creditid and paymentdate>=(select  ADD_MONTHS(tek_dat,-1) from ' +
        'sysdat)')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0056005F004300520045004400490054004900
      4400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000D000000160000005000410059004D0045004E005400440041005400
      45000100000000001200000049004E0053005500520041004E00430045000100
      0000000004000000490044000100000000001000000043005200450044004900
      540049004400010000000000120000005000520049004E004300490050004100
      4C000100000000001000000049004E0054004500520045005300540001000000
      0000140000004900500049004E00540045005200450053005400010000000000
      080000005200450053005400010000000000140000004300480041004E004300
      450044004100540045000100000000001000000050004F005200540044004100
      54004500010000000000160000004300520045004100540045005F0054005900
      500045000100000000000E00000041004400560041004E004300450001000000
      00000E0000005300450052005600490043004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 456
    Top = 152
  end
  object Dsrc_insurance: TDataSource
    DataSet = Ods_insurance
    Left = 456
    Top = 208
  end
  object Ods_SERVICE: TOracleDataSet
    SQL.Strings = (
      
        'select rowid, a.* from cm_payment_schedule a where a.creditid=:v' +
        '_creditid and paymentdate>=(SELECT TRUNC(TO_DATE(tek_dat-1, '#39'DD-' +
        'MM-YYYY'#39')) FROM sysdat)')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0056005F004300520045004400490054004900
      4400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000D000000160000005000410059004D0045004E005400440041005400
      45000100000000001200000049004E0053005500520041004E00430045000100
      0000000004000000490044000100000000001000000043005200450044004900
      540049004400010000000000120000005000520049004E004300490050004100
      4C000100000000001000000049004E0054004500520045005300540001000000
      0000140000004900500049004E00540045005200450053005400010000000000
      080000005200450053005400010000000000140000004300480041004E004300
      450044004100540045000100000000001000000050004F005200540044004100
      54004500010000000000160000004300520045004100540045005F0054005900
      500045000100000000000E00000041004400560041004E004300450001000000
      00000E0000005300450052005600490043004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 552
    Top = 152
  end
  object Dsrc_SERVICE: TDataSource
    DataSet = Ods_SERVICE
    Left = 552
    Top = 208
  end
end
