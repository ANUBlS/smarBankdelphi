object StatementDataMod: TStatementDataMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 454
  Width = 707
  object CreditsInfo: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   B.CREDITLINEAMOUNT'
      ' , B.ANNUALYINTERESTRATE'
      ' , B.ANNUALYOVERDUERATE'
      ' , B.DATEOFCONCLUSION'
      ' , B.DUEDATEFIRSTCONTRACT'
      ' , B.DUEDATELASTCONTRACT'
      ' , B.PURPOSEOFCREDIT'
      ' , B.USRGROUP'
      ' , B.CUSTOMERTYPE'
      ' , B.CREDITTYPE'
      ' , L.NAME'
      'FROM'
      '   CR_ACTIVE_CREDITS B'
      ' , CR_BOOROWERINFO L'
      'WHERE'
      '     (B.ID =:CrdID)'
      ' AND (L.CREDITID =:CrdID)'
      ''
      ' ')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00430052004400490044000300000000000000
      00000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 16
    object CreditsInfoCREDITLINEAMOUNT: TFloatField
      FieldName = 'CREDITLINEAMOUNT'
      Required = True
    end
    object CreditsInfoANNUALYINTERESTRATE: TFloatField
      FieldName = 'ANNUALYINTERESTRATE'
      Required = True
      DisplayFormat = '#,#0.0000'
    end
    object CreditsInfoANNUALYOVERDUERATE: TFloatField
      FieldName = 'ANNUALYOVERDUERATE'
      Required = True
      DisplayFormat = '#,#0.0000'
    end
    object CreditsInfoDATEOFCONCLUSION: TDateTimeField
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object CreditsInfoDUEDATEFIRSTCONTRACT: TDateTimeField
      FieldName = 'DUEDATEFIRSTCONTRACT'
      Required = True
    end
    object CreditsInfoDUEDATELASTCONTRACT: TDateTimeField
      FieldName = 'DUEDATELASTCONTRACT'
    end
    object CreditsInfoPURPOSEOFCREDIT: TWideStringField
      FieldName = 'PURPOSEOFCREDIT'
      Size = 128
    end
    object CreditsInfoUSRGROUP: TFloatField
      FieldName = 'USRGROUP'
      Required = True
    end
    object CreditsInfoCUSTOMERTYPE: TFloatField
      FieldName = 'CUSTOMERTYPE'
      Required = True
    end
    object CreditsInfoCREDITTYPE: TFloatField
      FieldName = 'CREDITTYPE'
      Required = True
    end
    object CreditsInfoNAME: TWideStringField
      FieldName = 'NAME'
      Size = 64
    end
  end
  object DSCreditsInfo: TDataSource
    DataSet = CreditsInfo
    Left = 24
    Top = 72
  end
  object DSTranches: TDataSource
    DataSet = Tranches
    Left = 296
    Top = 272
  end
  object Tranches: TOracleDataSet
    SQL.Strings = (
      'SELECT id, creditid, tranchedate, trancheamount'
      '  FROM cr_tranches'
      ' WHERE CreditID=:CrdID '
      'order by tranchedate')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00430052004400490044000300000000000000
      00000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 296
    Top = 216
    object TranchesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object TranchesCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object TranchesTRANCHEDATE: TDateTimeField
      FieldName = 'TRANCHEDATE'
      Required = True
    end
    object TranchesTRANCHEAMOUNT: TFloatField
      FieldName = 'TRANCHEAMOUNT'
      Required = True
    end
  end
  object DSPayments: TDataSource
    DataSet = Payments
    Left = 224
    Top = 272
  end
  object Payments: TOracleDataSet
    SQL.Strings = (
      'SELECT rownum sira,  id ,'
      '        creditid ,'
      '        paydate , '
      '        payedamt , '
      '        payedintamt,'
      '        payeddueamt,'
      '       payeddueintamt, '
      '       payedpenaltyamt,'
      '    payedamt + '
      '        payedintamt+'
      '        payeddueamt+'
      '       payeddueintamt+ '
      '       payedpenaltyamt as sm'
      ''
      '  FROM cr_payments '
      'WHERE (CreditID=:CrdID)'
      'order by paydate ')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00430052004400490044000500000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      050000000A000000080000005300490052004100010000000000040000004900
      4400010000000000100000004300520045004400490054004900440001000000
      00000E0000005000410059004400410054004500010000000000100000005000
      410059004500440041004D005400010000000000160000005000410059004500
      440049004E00540041004D005400010000000000160000005000410059004500
      440044005500450041004D0054000100000000001C0000005000410059004500
      440044005500450049004E00540041004D0054000100000000001E0000005000
      4100590045004400500045004E0041004C005400590041004D00540001000000
      00000400000053004D00010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 224
    Top = 216
    object PaymentsSIRA: TFloatField
      FieldName = 'SIRA'
    end
    object PaymentsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object PaymentsCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object PaymentsPAYDATE: TDateTimeField
      FieldName = 'PAYDATE'
      Required = True
    end
    object PaymentsPAYEDAMT: TFloatField
      FieldName = 'PAYEDAMT'
      Required = True
    end
    object PaymentsPAYEDINTAMT: TFloatField
      FieldName = 'PAYEDINTAMT'
      Required = True
    end
    object PaymentsPAYEDDUEAMT: TFloatField
      FieldName = 'PAYEDDUEAMT'
      Required = True
    end
    object PaymentsPAYEDDUEINTAMT: TFloatField
      FieldName = 'PAYEDDUEINTAMT'
      Required = True
    end
    object PaymentsPAYEDPENALTYAMT: TFloatField
      FieldName = 'PAYEDPENALTYAMT'
      Required = True
    end
    object PaymentsSM: TFloatField
      FieldName = 'SM'
    end
  end
  object DSSchedule: TDataSource
    DataSet = Schedule
    Left = 368
    Top = 272
  end
  object Schedule: TOracleDataSet
    SQL.Strings = (
      'SELECT rownum sira, id, creditid, paymentdate, '
      '    principal, '
      '    interest,'
      '    principal+interest as sm'
      '  FROM cr_payment_schedule'
      ' WHERE CreditID=:CrdID'
      'order  by paymentdate')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00430052004400490044000300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      0500000007000000040000004900440001000000000010000000430052004500
      44004900540049004400010000000000160000005000410059004D0045004E00
      54004400410054004500010000000000120000005000520049004E0043004900
      500041004C000100000000001000000049004E00540045005200450053005400
      0100000000000400000053004D00010000000000080000005300490052004100
      010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 368
    Top = 216
    object ScheduleID: TFloatField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object ScheduleCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
      Visible = False
    end
    object SchedulePAYMENTDATE: TDateTimeField
      DisplayLabel = #1058#1072#1088#1080#1093
      FieldName = 'PAYMENTDATE'
      Required = True
    end
    object SchedulePRINCIPAL: TFloatField
      DisplayLabel = #1071#1089#1072#1089' '#1041#1086#1088#1078'-'#1076#1072#1085
      FieldName = 'PRINCIPAL'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object ScheduleINTEREST: TFloatField
      DisplayLabel = #1065'. '#1060#1072#1080#1079' - '#1076#1103#1085
      FieldName = 'INTEREST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object ScheduleSM: TFloatField
      FieldName = 'SM'
    end
    object ScheduleSIRA: TFloatField
      FieldName = 'SIRA'
    end
  end
  object DSUserGroups: TDataSource
    DataSet = UserGroups
    Left = 276
    Top = 72
  end
  object UserGroups: TOracleDataSet
    SQL.Strings = (
      'SELECT id, description'
      '  FROM cr_usergroups')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 284
    Top = 16
  end
  object DSCreditTypes: TDataSource
    DataSet = CreditTypes
    Left = 108
    Top = 72
  end
  object CreditTypes: TOracleDataSet
    SQL.Strings = (
      'SELECT id, description'
      '  FROM cr_credittypes')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 108
    Top = 16
  end
  object DSCategories: TDataSource
    DataSet = Categories
    Left = 188
    Top = 72
  end
  object Categories: TOracleDataSet
    SQL.Strings = (
      'SELECT id,  description'
      '  FROM cr_categories')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 188
    Top = 16
  end
  object RestsInPeriod: TOracleDataSet
    SQL.Strings = (
      'SELECT hdate,rest, interestrest,'
      '       duerest, dueinterestrest'
      '  FROM cr_history'
      '  where creditid=:crdid '
      '    and hdate between :D1 and :D2 '
      'order by hdate desc')
    Optimize = False
    Variables.Data = {
      04000000030000000C0000003A00430052004400490044000300000000000000
      00000000060000003A00440031000C0000000000000000000000060000003A00
      440032000C0000000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 112
    Top = 240
    object RestsInPeriodREST: TFloatField
      DisplayLabel = '('#1071'.'#1041') '#1043#1072#1083#1099#1075
      DisplayWidth = 90
      FieldName = 'REST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object RestsInPeriodINTERESTREST: TFloatField
      DisplayLabel = '('#1060'.'#1041') '#1043#1072#1083#1099#1075
      DisplayWidth = 90
      FieldName = 'INTERESTREST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object RestsInPeriodDUEREST: TFloatField
      DisplayLabel = '('#1069'.'#1041') '#1043#1072#1083#1099#1075
      DisplayWidth = 90
      FieldName = 'DUEREST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object RestsInPeriodDUEINTERESTREST: TFloatField
      DisplayLabel = '('#1069'.'#1060'.'#1041') '#1043#1072#1083#1099#1075
      DisplayWidth = 90
      FieldName = 'DUEINTERESTREST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object RestsInPeriodHDATE: TDateTimeField
      DisplayLabel = #1058#1072#1088#1080#1093
      FieldName = 'HDATE'
      Required = True
    end
  end
  object DSPeriod: TDataSource
    DataSet = RestsInPeriod
    Left = 24
    Top = 240
  end
  object IntrInPeriod: TOracleDataSet
    SQL.Strings = (
      'SELECT  hdate,trunc(interest,2) interest, dueinterest'
      '  FROM cr_interests'
      ' WHERE creditid=:crdid '
      '   AND hdate between :D1 and :D2 '
      'order by hdate desc')
    Optimize = False
    Variables.Data = {
      04000000030000000C0000003A00430052004400490044000300000000000000
      00000000060000003A00440031000C0000000000000000000000060000003A00
      440032000C0000000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 288
    object IntrInPeriodINTEREST: TFloatField
      DisplayLabel = ' '#1060#1072#1080#1079
      FieldName = 'INTEREST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object IntrInPeriodDUEINTEREST: TFloatField
      DisplayLabel = 'Gecikmi'#1096' '#1092#1072#1080#1079
      FieldName = 'DUEINTEREST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object IntrInPeriodHDATE: TDateTimeField
      DisplayLabel = #1058#1072#1088#1080#1093
      FieldName = 'HDATE'
      Required = True
    end
  end
  object InterestsDataSource: TDataSource
    DataSet = IntrInPeriod
    Left = 120
    Top = 288
  end
  object ReportDataSet: TOracleDataSet
    SQL.Strings = (
      'select  '
      '        A.contractaccid,'
      '        P.boorowerid,'
      '        p.currency,'
      '        P.dateofconclusion,'
      '        c.name,'
      '       c.inn,'
      '        v.val_name,'
      '        '
      
        '        cr_common.accountnumber_get(A.booroweraccid) as clientac' +
        'cno,'
      
        '        cr_common.accountnumber_get(A.contractaccid) as contract' +
        'acccno,'
      
        '        cr_common.accountnumber_get(A.interestaccid) as interest' +
        'acccno,'
      
        '        cr_common.accountnumber_get(A.dueloanaccid) as dueloanac' +
        'cno,'
      
        '        cr_common.accountnumber_get(A.dueinterestaccid) as duein' +
        'terestaccno,'
      '        cr_common.accountnumber_get(A.loanaccid) as loanaccAccno'
      '        '
      'from  CR_ACCOUNTS A,'
      '      cr_PORTFOLIO P,'
      '      cr_sb_customers c,'
      '      avalute v     '
      'where '
      '      (P.id = :CrdId)and'
      '      (A.creditid = P.id)and'
      '      (c.id = p.boorowerid)and'
      '      (v.valute = p.currency)       ')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00430052004400490044000300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      050000000D0000001A00000043004F004E005400520041004300540041004300
      4300490044000100000000001400000042004F004F0052004F00570045005200
      4900440001000000000010000000430055005200520045004E00430059000100
      000000002000000044004100540045004F00460043004F004E0043004C005500
      530049004F004E00010000000000080000004E0041004D004500010000000000
      0600000049004E004E0001000000000010000000560041004C005F004E004100
      4D0045000100000000001600000043004C00490045004E005400410043004300
      4E004F000100000000001C00000043004F004E00540052004100430054004100
      4300430043004E004F000100000000001C00000049004E005400450052004500
      5300540041004300430043004E004F0001000000000018000000440055004500
      4C004F0041004E004100430043004E004F000100000000002000000044005500
      450049004E005400450052004500530054004100430043004E004F0001000000
      0000180000004C004F0041004E004100430043004100430043004E004F000100
      00000000}
    RefreshOptions = [roAllFields]
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 128
    object ReportDataSetCONTRACTACCID: TFloatField
      FieldName = 'CONTRACTACCID'
      Required = True
    end
    object ReportDataSetBOOROWERID: TFloatField
      FieldName = 'BOOROWERID'
      Required = True
    end
    object ReportDataSetCURRENCY: TFloatField
      FieldName = 'CURRENCY'
      Required = True
    end
    object ReportDataSetDATEOFCONCLUSION: TDateTimeField
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object ReportDataSetNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
    object ReportDataSetCLIENTACCNO: TWideStringField
      FieldName = 'CLIENTACCNO'
      Size = 4000
    end
    object ReportDataSetCONTRACTACCCNO: TWideStringField
      FieldName = 'CONTRACTACCCNO'
      Size = 4000
    end
    object ReportDataSetINTERESTACCCNO: TWideStringField
      FieldName = 'INTERESTACCCNO'
      Size = 4000
    end
    object ReportDataSetDUELOANACCNO: TWideStringField
      FieldName = 'DUELOANACCNO'
      Size = 4000
    end
    object ReportDataSetDUEINTERESTACCNO: TWideStringField
      FieldName = 'DUEINTERESTACCNO'
      Size = 4000
    end
    object ReportDataSetLOANACCACCNO: TWideStringField
      FieldName = 'LOANACCACCNO'
      Size = 4000
    end
    object ReportDataSetVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object ReportDataSetINN: TWideStringField
      FieldName = 'INN'
    end
  end
  object ReportDataSource: TDataSource
    DataSet = ReportDataSet
    Left = 24
    Top = 176
  end
  object RatesDataSet: TOracleDataSet
    SQL.Strings = (
      'select'
      '  Ostat   as Rate'
      'from'
      '  OPERKURS'
      'where'
      '  Dat = :Dat   and'
      '  Val_Kod = :CurrencyID'
      ' '
      '')
    Optimize = False
    Variables.Data = {
      0400000002000000080000003A004400410054000C0000000000000000000000
      160000003A00430055005200520045004E004300590049004400030000000000
      000000000000}
    Session = sboapiDataModule.SBSession
    Left = 135
    Top = 128
    object RatesDataSetRATE: TFloatField
      FieldName = 'RATE'
      Required = True
    end
  end
  object RatesDataSource: TDataSource
    DataSet = RatesDataSet
    Left = 136
    Top = 184
  end
  object AboutBank: TOracleDataSet
    SQL.Strings = (
      'select'
      '  az_Name as FullBankName,'
      '  Logo ,'
      '  INN,'
      '  MANAGERTITLE'
      'from BANKINFO'
      '')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 264
    Top = 128
  end
  object ProlongationDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT  prolongdate, newclosedate'
      '  FROM cr_prolongations'
      'where creditid =:CrdID'
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00430052004400490044000300000000000000
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 378
    Top = 79
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
    Left = 378
    Top = 159
  end
  object DefIntDatSet: TOracleDataSet
    SQL.Strings = (
      'select stopcalcdate from cr_curr_state'
      'where creditid=:CrdID')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00430052004400490044000300000000000000
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 384
    Top = 16
  end
  object CR_AK_REPORTS: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CR_AK_REPORTS'
    Left = 208
    Top = 320
  end
  object cust: TOracleDataSet
    SQL.Strings = (
      
        'select p.numberofcredit,b.name from cr_active_credits p, CR_BOOR' +
        'OWERINFO b'
      'where p.id=b.creditid '
      'and p.id=:id')
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400030000000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 496
    Top = 112
  end
end
