object CustAnalysDataModule: TCustAnalysDataModule
  OldCreateOrder = False
  Height = 502
  Width = 901
  object CustAnalysDataSource: TDataSource
    DataSet = CustAnalysDataSet
    Left = 157
    Top = 16
  end
  object CreditAnalysDataSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      
        'SELECT p.boorowerid, p.id creditid, p.branchid, p.currency, p.nu' +
        'mberofcredit,'
      
        '       p.customertype, p.credittype, p.usrgroup, p.usid, p.perso' +
        'naltype,'
      '       p.dateofconclusion,p.duedatefirstcontract,p.closedate,'
      
        '       h.rest, h.interestrest, h.duerest, h.dueinterestrest, v.v' +
        'al_name,'
      
        '       v.valute, cm_common.accountnumber_get (a.contractaccid) A' +
        'S contractaccno'
      
        '  FROM cm_portfolio p, cm_curr_state h, sb_avalute v, cm_account' +
        's a'
      ' WHERE (h.creditid = p.id)'
      '   AND (v.valute = p.currency)'
      '   AND (p.boorowerid = :boorowerid)'
      '   AND (a.creditid = p.id)'
      'ORDER BY :orderfield')
    Optimize = False
    Variables.Data = {
      0400000002000000160000003A0042004F004F0052004F005700450052004900
      4400030000000000000000000000160000003A004F0052004400450052004600
      490045004C004400010000000000000000000000}
    OracleDictionary.EnforceConstraints = True
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 40
    Top = 64
    object CreditAnalysDataSetBOOROWERID: TFloatField
      FieldName = 'BOOROWERID'
      Required = True
    end
    object CreditAnalysDataSetCREDITID: TFloatField
      DisplayLabel = 'Kreditin  '#8470' '#1089#1080
      FieldName = 'CREDITID'
      Required = True
    end
    object CreditAnalysDataSetBRANCHID: TFloatField
      FieldName = 'BRANCHID'
      Required = True
    end
    object CreditAnalysDataSetCURRENCY: TFloatField
      FieldName = 'CURRENCY'
      Required = True
    end
    object CreditAnalysDataSetNUMBEROFCREDIT: TWideStringField
      DisplayLabel = #8470
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object CreditAnalysDataSetCUSTOMERTYPE: TFloatField
      FieldName = 'CUSTOMERTYPE'
      Required = True
    end
    object CreditAnalysDataSetCREDITTYPE: TFloatField
      FieldName = 'CREDITTYPE'
      Required = True
    end
    object CreditAnalysDataSetUSRGROUP: TFloatField
      FieldName = 'USRGROUP'
      Required = True
    end
    object CreditAnalysDataSetUSID: TFloatField
      FieldName = 'USID'
      Required = True
    end
    object CreditAnalysDataSetPERSONALTYPE: TFloatField
      FieldName = 'PERSONALTYPE'
      Required = True
    end
    object CreditAnalysDataSetREST: TFloatField
      DisplayLabel = #1043#1072#1083#1099#1075
      FieldName = 'REST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object CreditAnalysDataSetINTERESTREST: TFloatField
      DisplayLabel = #1060#1072#1080#1079' '#1075#1072#1083#1099#1075
      FieldName = 'INTERESTREST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object CreditAnalysDataSetDUEREST: TFloatField
      DisplayLabel = 'Gecikmi'#1096'  '#1075#1072#1083#1099#1075
      FieldName = 'DUEREST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object CreditAnalysDataSetDUEINTERESTREST: TFloatField
      DisplayLabel = 'Gecikmi'#1096'  '#1092#1072#1080#1079' '#1075#1072#1083#1099#1075
      FieldName = 'DUEINTERESTREST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object CreditAnalysDataSetVAL_NAME: TWideStringField
      DisplayLabel = '$'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object CreditAnalysDataSetVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object CreditAnalysDataSetCONTRACTACCNO: TWideStringField
      DisplayLabel = #1057#1057#1091#1076#1072' h'#1077#1089#1072#1073#1099#1085#1099#1085' '#8470'-c'#1080
      FieldName = 'CONTRACTACCNO'
      Size = 4000
    end
    object CreditAnalysDataSetDATEOFCONCLUSION: TDateTimeField
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object CreditAnalysDataSetCLOSEDATE: TDateTimeField
      FieldName = 'CLOSEDATE'
    end
    object CreditAnalysDataSetDUEDATEFIRSTCONTRACT: TDateTimeField
      FieldName = 'DUEDATEFIRSTCONTRACT'
      Required = True
    end
  end
  object CreditAnalysDataSource: TDataSource
    DataSet = CreditAnalysDataSet
    Left = 157
    Top = 72
  end
  object UsersDataSet: TOracleDataSet
    SQL.Strings = (
      'select id, name'
      'from SB_user$')
    Optimize = False
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 32
    Top = 288
  end
  object UsersDataSource: TDataSource
    DataSet = UsersDataSet
    Left = 157
    Top = 280
  end
  object FilialDataSet: TOracleDataSet
    SQL.Strings = (
      'select id,name'
      'from sb_filial')
    Optimize = False
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 280
    Top = 19
  end
  object FilialDataSource: TDataSource
    DataSet = FilialDataSet
    Left = 392
    Top = 21
  end
  object CategoriesDataSet: TOracleDataSet
    SQL.Strings = (
      'select id,description'
      'from cm_categories')
    Optimize = False
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 280
    Top = 75
  end
  object CategoriesDataSource: TDataSource
    DataSet = CategoriesDataSet
    Left = 400
    Top = 76
  end
  object CurrencysDataSet: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name'
      'from sb_avalute')
    Optimize = False
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 40
    Top = 128
  end
  object CurrencysDataSource: TDataSource
    DataSet = CurrencysDataSet
    Left = 159
    Top = 131
  end
  object PersonsDataSet: TOracleDataSet
    SQL.Strings = (
      'select id ,descripion'
      'from cm_persons')
    Optimize = False
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 32
    Top = 200
  end
  object PersonsDataSource: TDataSource
    DataSet = PersonsDataSet
    Left = 157
    Top = 197
  end
  object UserGroupsDataSet: TOracleDataSet
    SQL.Strings = (
      'select id,description'
      'from cm_usergroups')
    Optimize = False
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 288
    Top = 193
  end
  object CreditTypeDataSet: TOracleDataSet
    SQL.Strings = (
      'select id,description '
      'from cm_credittypes')
    Optimize = False
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 288
    Top = 274
  end
  object UserGroupsDataSource: TDataSource
    DataSet = UserGroupsDataSet
    Left = 408
    Top = 192
  end
  object CreditTypeDataSource: TDataSource
    DataSet = CreditTypeDataSet
    Left = 409
    Top = 270
  end
  object CustomersDataSet: TOracleDataSet
    SQL.Strings = (
      'select id,name'
      'from cm_sb_customers'
      'order by name')
    Optimize = False
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 284
    Top = 131
  end
  object CustomersDataSource: TDataSource
    DataSet = CustomersDataSet
    Left = 400
    Top = 135
  end
  object CustAnalysDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT c.id boorowerid, c.NAME boorowername'
      '           FROM cm_sb_customers c'
      '          WHERE EXISTS ( SELECT p.boorowerid'
      '                           FROM cm_portfolio p'
      '                          WHERE p.boorowerid = c.id)'
      '       --c.ID in (select P.BoorowerID from CM_Portfolio P )    '
      '   ORDER BY :orderfield')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A004F0052004400450052004600490045004C00
      4400010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000020000001400000042004F004F0052004F0057004500520049004400
      0100000000001800000042004F004F0052004F005700450052004E0041004D00
      4500010000000000}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 40
    Top = 8
    object CustAnalysDataSetBOOROWERID: TIntegerField
      FieldName = 'BOOROWERID'
      Required = True
    end
    object CustAnalysDataSetBOOROWERNAME: TWideStringField
      FieldName = 'BOOROWERNAME'
      Size = 90
    end
  end
  object TrancheDataSource: TDataSource
    DataSet = TrancheDataSet
    Left = 155
    Top = 349
  end
  object TrancheDataSet: TOracleDataSet
    SQL.Strings = (
      'select T.trancheamount,T.tranchedate'
      'from cm_tranches T'
      'where creditid =:CrdID'
      ''
      ''
      ''
      ''
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00430052004400490044000300000000000000
      00000000}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 32
    Top = 344
    object TrancheDataSetTRANCHEAMOUNT: TFloatField
      DisplayLabel = #1058#1088#1072#1085#1096
      FieldName = 'TRANCHEAMOUNT'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object TrancheDataSetTRANCHEDATE: TDateTimeField
      DisplayLabel = #1058#1072#1088#1080#1093
      FieldName = 'TRANCHEDATE'
      Required = True
    end
  end
  object PaymentsDataSet: TOracleDataSet
    SQL.Strings = (
      
        'SELECT id, creditid, paydate, payedamt, payedintamt, payeddueamt' +
        ','
      '       payeddueintamt, payedpenaltyamt'
      '  FROM cm_payments'
      'WHERE CreditID=:CrdID'
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00430052004400490044000300000000000000
      00000000}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 288
    Top = 344
    object PaymentsDataSetID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object PaymentsDataSetCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object PaymentsDataSetPAYDATE: TDateTimeField
      DisplayLabel = #1070'. '#1058#1072#1088#1080#1093#1080
      FieldName = 'PAYDATE'
      Required = True
    end
    object PaymentsDataSetPAYEDAMT: TFloatField
      DisplayLabel = #1071#1089#1072#1089' '#1041#1086#1088#1078'-'#1076#1072#1085
      FieldName = 'PAYEDAMT'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object PaymentsDataSetPAYEDINTAMT: TFloatField
      DisplayLabel = #1071'.'#1041'. '#1092#1072#1080#1079' - '#1076#1103#1085
      FieldName = 'PAYEDINTAMT'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object PaymentsDataSetPAYEDDUEAMT: TFloatField
      DisplayLabel = #1069#1077#1078#1080#1082'. '#1041#1086#1088#1078'-'#1076#1072#1085
      FieldName = 'PAYEDDUEAMT'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object PaymentsDataSetPAYEDDUEINTAMT: TFloatField
      DisplayLabel = #1069'.'#1041'. '#1092#1072#1080#1079'-'#1076#1103#1085
      FieldName = 'PAYEDDUEINTAMT'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object PaymentsDataSetPAYEDPENALTYAMT: TFloatField
      FieldName = 'PAYEDPENALTYAMT'
      Required = True
      DisplayFormat = '#,#0.00'
    end
  end
  object PaymentsDataSource: TDataSource
    DataSet = PaymentsDataSet
    Left = 424
    Top = 344
  end
  object CreditsinDateDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT hdate,rest, interestrest,'
      '       duerest, dueinterestrest'
      '  FROM cm_history'
      '  where creditid=:crdid '
      '    and hdate between :D1 and :D2 '
      'order by hdate desc'
      '')
    Optimize = False
    Variables.Data = {
      04000000030000000C0000003A00430052004400490044000300000000000000
      00000000060000003A00440031000C0000000000000000000000060000003A00
      440032000C0000000000000000000000}
    Session = CMDataModule.CMSession
    Left = 526
    Top = 19
    object CreditsinDateDataSetHDATE: TDateTimeField
      DisplayLabel = #1058#1072#1088#1080#1093
      FieldName = 'HDATE'
      Required = True
    end
    object CreditsinDateDataSetREST: TFloatField
      DisplayLabel = ' '#1043#1072#1083#1099#1075
      FieldName = 'REST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object CreditsinDateDataSetDUEREST: TFloatField
      DisplayLabel = 'G'#1077'c'#1080#1082#1084#1080#1096' '#1043#1072#1083#1099#1075
      FieldName = 'DUEREST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object CreditsinDateDataSetINTERESTREST: TFloatField
      DisplayLabel = #1060#1072#1080#1079' '#1043#1072#1083#1099#1075
      FieldName = 'INTERESTREST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object CreditsinDateDataSetDUEINTERESTREST: TFloatField
      DisplayLabel = 'Gecikmi'#1096' '#1092#1072#1080#1079' '#1043#1072#1083#1099#1075
      FieldName = 'DUEINTERESTREST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
  end
  object CreditsinDateDataSource: TDataSource
    DataSet = CreditsinDateDataSet
    Left = 526
    Top = 75
  end
  object ScheduleDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT id, creditid, paymentdate, principal, interest'
      '  FROM cm_payment_schedule'
      ' WHERE CreditID=:CrdID'
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00430052004400490044000300000000000000
      00000000}
    Session = CMDataModule.CMSession
    Left = 528
    Top = 136
    object ScheduleDataSetID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ScheduleDataSetCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object ScheduleDataSetPAYMENTDATE: TDateTimeField
      DisplayLabel = #1058#1072#1088#1080#1093
      FieldName = 'PAYMENTDATE'
      Required = True
    end
    object ScheduleDataSetPRINCIPAL: TFloatField
      DisplayLabel = #1071#1089#1072#1089' '#1041#1086#1088#1078'-'#1076#1072#1085
      FieldName = 'PRINCIPAL'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object ScheduleDataSetINTEREST: TFloatField
      DisplayLabel = #1065'. '#1060#1072#1080#1079' - '#1076#1103#1085
      FieldName = 'INTEREST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
  end
  object ScheduleDataSource: TDataSource
    DataSet = ScheduleDataSet
    Left = 528
    Top = 200
  end
  object ProlongationDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT  prolongdate, newclosedate'
      '  FROM cm_prolongations'
      'where creditid =:CrdID'
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00430052004400490044000300000000000000
      00000000}
    Session = CMDataModule.CMSession
    Left = 536
    Top = 272
    object ProlongationDataSetPROLONGDATE: TDateTimeField
      DisplayLabel = 'Prolanqasiya tarixi'
      FieldName = 'PROLONGDATE'
      Required = True
    end
    object ProlongationDataSetNEWCLOSEDATE: TDateTimeField
      DisplayLabel = 'Yeni tarixi'
      FieldName = 'NEWCLOSEDATE'
      Required = True
    end
  end
  object ProlongationDataSource: TDataSource
    DataSet = ProlongationDataSet
    Left = 544
    Top = 344
  end
  object SumSheDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT  creditid,sum(principal),sum(interest)'
      '  FROM cm_payment_schedule'
      ' WHERE CreditID=:CrdID'
      'group by CreditID'
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00430052004400490044000300000000000000
      00000000}
    Session = CMDataModule.CMSession
    Left = 632
    Top = 16
    object SumSheDataSetCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object SumSheDataSetSUMPRINCIPAL: TFloatField
      DisplayLabel = #1071#1089#1072#1089' '#1041#1086#1088#1078'-'#1076#1072#1085
      FieldName = 'SUM(PRINCIPAL)'
      DisplayFormat = '#,#0.00'
    end
    object SumSheDataSetSUMINTEREST: TFloatField
      DisplayLabel = #1065'. '#1060#1072#1080#1079' - '#1076#1103#1085
      FieldName = 'SUM(INTEREST)'
      DisplayFormat = '#,#0.00'
    end
  end
  object SumSheDataSource: TDataSource
    DataSet = SumSheDataSet
    Left = 632
    Top = 64
  end
  object SumPayDataSet: TOracleDataSet
    SQL.Strings = (
      
        'SELECT creditid,  sum(payedamt), sum(payedintamt), sum(payedduea' +
        'mt),'
      '       sum(payeddueintamt), sum(payedpenaltyamt)'
      '  FROM cm_payments'
      'WHERE CreditID=:CrdID'
      'Group by creditid'
      ''
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00430052004400490044000300000000000000
      00000000}
    Session = CMDataModule.CMSession
    Left = 640
    Top = 128
    object SumPayDataSetCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object SumPayDataSetSUMPAYEDAMT: TFloatField
      DisplayLabel = #1071#1089#1072#1089' '#1041#1086#1088#1078'-'#1076#1072#1085
      FieldName = 'SUM(PAYEDAMT)'
      DisplayFormat = '#,#0.00'
    end
    object SumPayDataSetSUMPAYEDINTAMT: TFloatField
      DisplayLabel = #1071'.'#1041'. '#1092#1072#1080#1079' - '#1076#1103#1085
      FieldName = 'SUM(PAYEDINTAMT)'
      DisplayFormat = '#,#0.00'
    end
    object SumPayDataSetSUMPAYEDDUEAMT: TFloatField
      DisplayLabel = #1069#1077#1078#1080#1082'. '#1041#1086#1088#1078'-'#1076#1072#1085
      FieldName = 'SUM(PAYEDDUEAMT)'
      DisplayFormat = '#,#0.00'
    end
    object SumPayDataSetSUMPAYEDDUEINTAMT: TFloatField
      DisplayLabel = #1069'.'#1041'. '#1092#1072#1080#1079'-'#1076#1103#1085
      FieldName = 'SUM(PAYEDDUEINTAMT)'
      DisplayFormat = '#,#0.00'
    end
    object SumPayDataSetSUMPAYEDPENALTYAMT: TFloatField
      DisplayLabel = 'PAYEDPENALTYAMT'
      FieldName = 'SUM(PAYEDPENALTYAMT)'
      DisplayFormat = '#,#0.00'
    end
  end
  object SumPayDataSource: TDataSource
    DataSet = SumPayDataSet
    Left = 648
    Top = 192
  end
  object ReportDataSet: TOracleDataSet
    SQL.Strings = (
      'select '
      '      p.numberofcredit,'
      '      p.dateofconclusion,'
      '      p.closedate,'
      '      p.purposeofcredit,'
      '      p.creditlineamount,'
      '      p.annualyinterestrate,'
      '      p.annualyoverduerate,'
      '      p.annualypenaltyrate,'
      '      per.descripion,'
      '      cat.description,'
      '      crd.description,'
      '      usrgr.description,'
      '      val.val_name,'
      '      plg.pledgename,'
      '      GET_RESERVES_NAME(h.reserveid) as resrevename,'
      '      GET_RESERVES_NAME(h.duereserveid) as dueresrevename,'
      '      h.pledgeprice'
      'from '
      '    cm_portfolio p,'
      '    cm_persons per,'
      '    cm_categories cat,'
      '    cm_credittypes crd,'
      '    cm_usergroups usrgr,'
      '    sb_avalute val,'
      '    cm_guarantee plg,'
      '    cm_curr_state h'
      'where '
      '    p.personaltype = per.id and    '
      '    p.customertype = cat.id and'
      '    p.credittype = crd.id and'
      '    p.usrgroup = usrgr.id and'
      '    p.currency = val.valute and'
      '    p.id = h.creditid and'
      '    p.id = plg.creditid and'
      '    p.id = :CrdID      '
      '      '
      '      ')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00430052004400490044000300000000000000
      00000000}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 632
    Top = 272
    object ReportDataSetNUMBEROFCREDIT: TWideStringField
      DisplayLabel = #8470
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object ReportDataSetDATEOFCONCLUSION: TDateTimeField
      DisplayLabel = #1040#1095#1099#1083#1084#1072' '#1090#1072#1088#1080#1093#1080
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object ReportDataSetCLOSEDATE: TDateTimeField
      DisplayLabel = #1041#1072#1100#1083#1072#1085#1084#1072' '#1090#1072#1088#1080#1093#1080
      FieldName = 'CLOSEDATE'
    end
    object ReportDataSetPURPOSEOFCREDIT: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1084#1103#1075#1089#1103#1076#1080
      FieldName = 'PURPOSEOFCREDIT'
      Size = 128
    end
    object ReportDataSetCREDITLINEAMOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090' '#1093#1103#1090#1090#1080#1085#1080#1085' '#1084#1103#1073#1083#1103#1100#1080
      FieldName = 'CREDITLINEAMOUNT'
      Required = True
    end
    object ReportDataSetANNUALYINTERESTRATE: TFloatField
      DisplayLabel = #1048#1083#1083#1080#1082' %-'#1076#1103#1088#1103#1078#1103#1089#1080
      FieldName = 'ANNUALYINTERESTRATE'
      Required = True
    end
    object ReportDataSetANNUALYOVERDUERATE: TFloatField
      DisplayLabel = #1068#1077#1078#1080#1082#1084#1080#1096' '#1073#1086#1088#1078' %-'#1076#1103#1088#1103#1078#1103#1089#1080
      FieldName = 'ANNUALYOVERDUERATE'
      Required = True
    end
    object ReportDataSetANNUALYPENALTYRATE: TFloatField
      DisplayLabel = #1046#1103#1088#1080#1084#1103' %-'#1080
      FieldName = 'ANNUALYPENALTYRATE'
      Required = True
    end
    object ReportDataSetDESCRIPION: TWideStringField
      DisplayLabel = #1050#1072#1090#1077#1101#1086#1088#1080#1081#1072#1089#1099
      FieldName = 'DESCRIPION'
      Size = 64
    end
    object ReportDataSetDESCRIPTION: TWideStringField
      DisplayLabel = #1058#1080#1087#1080
      FieldName = 'DESCRIPTION'
      Size = 128
    end
    object ReportDataSetDESCRIPTION_1: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1090#1080#1087#1080
      FieldName = 'DESCRIPTION_1'
      Size = 128
    end
    object ReportDataSetDESCRIPTION_2: TWideStringField
      DisplayLabel = #1048#1089#1090#1080#1092#1072#1076#1103#1095#1080' '#1101#1091#1088#1091#1087#1091
      FieldName = 'DESCRIPTION_2'
      Size = 64
    end
    object ReportDataSetVAL_NAME: TWideStringField
      DisplayLabel = #1042#1072#1083#1081#1091#1090#1072
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object ReportDataSetPLEDGENAME: TWideStringField
      DisplayLabel = #1069#1080#1088#1086#1074
      FieldName = 'PLEDGENAME'
      Size = 128
    end
    object ReportDataSetRESREVENAME: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1072#1076#1080' '#1090#1103#1089#1085#1080#1092#1072#1090#1099
      FieldName = 'RESREVENAME'
      Size = 4000
    end
    object ReportDataSetDUERESREVENAME: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1072#1076#1080'  '#1101#1077#1078#1080#1082#1084#1080#1096' '#1090#1103#1089#1085#1080#1092#1072#1090#1099
      FieldName = 'DUERESREVENAME'
      Size = 4000
    end
    object ReportDataSetPLEDGEPRICE: TFloatField
      DisplayLabel = #1069#1080#1088#1086#1074#1091#1085' '#1073#1072#1079#1072#1088' '#1076#1103#1081#1103#1088#1080
      FieldName = 'PLEDGEPRICE'
      Required = True
    end
  end
end
