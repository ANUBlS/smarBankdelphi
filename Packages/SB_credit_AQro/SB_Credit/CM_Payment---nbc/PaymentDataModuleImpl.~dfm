object PaymentDataModule: TPaymentDataModule
  OldCreateOrder = False
  Left = 75
  Top = 157
  Height = 480
  Width = 696
  object PaymentInfo: TOracleDataSet
    SQL.Strings = (
      
        'SELECT id, creditid, paydate, payedamt, payedintamt, payeddueamt' +
        ','
      
        '       payeddueintamt, payedpenaltyamt, tridamt, tridintamt, tri' +
        'ddueamt,'
      
        '       triddueintamt, tridpenaltyamt, tridprimreserve, tridsecre' +
        'serve,'
      '       outtridobligation'
      '  FROM cm_payments'
      'WHERE CreditID=:CREDITID'
      'ORDER BY PayDate DESC')
    Variables.Data = {
      0300000001000000090000003A43524544495449440300000000000000000000
      00}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 80
    Top = 32
    object PaymentInfoID: TFloatField
      DisplayLabel = '№'
      FieldName = 'ID'
      Required = True
    end
    object PaymentInfoCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
      Visible = False
    end
    object PaymentInfoPAYDATE: TDateTimeField
      DisplayLabel = 'Тарих'
      FieldName = 'PAYDATE'
      Required = True
    end
    object PaymentInfoPAYEDAMT: TFloatField
      DisplayLabel = 'Ясас борждан'
      FieldName = 'PAYEDAMT'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object PaymentInfoPAYEDINTAMT: TFloatField
      DisplayLabel = 'Фаиз боржундан'
      FieldName = 'PAYEDINTAMT'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object PaymentInfoPAYEDDUEAMT: TFloatField
      DisplayLabel = 'Эежикмиш борждан'
      FieldName = 'PAYEDDUEAMT'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object PaymentInfoPAYEDDUEINTAMT: TFloatField
      DisplayLabel = 'Эежикмиш фаиз боржундан'
      FieldName = 'PAYEDDUEINTAMT'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object PaymentInfoPAYEDPENALTYAMT2: TFloatField
      DisplayLabel = 'Пенийа'
      FieldName = 'PAYEDPENALTYAMT'
    end
  end
  object DataSrcPaymentInfo: TDataSource
    DataSet = PaymentInfo
    Left = 80
    Top = 80
  end
  object CustAccount: TOracleDataSet
    SQL.Strings = (
      'select '
      '      BOOROWERACCID '
      '   from '
      '      CM_ACCOUNTS'
      ' where CreditID=:CreditID')
    Variables.Data = {
      0300000001000000090000003A43524544495449440300000000000000000000
      00}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 336
    Top = 40
    object CustAccountBOOROWERACCID: TFloatField
      FieldName = 'BOOROWERACCID'
    end
  end
  object PaymentAccounts: TOracleDataSet
    SQL.Strings = (
      
        'SELECT   a.id AS accid, a.kli_id, a.acc_no AS accountnumber , ab' +
        's(t.OSTAT) as Rest, v.VAL_NAME'
      '    FROM SB_ACCOUNT  a ,'
      '         SB_TENOSTAT t ,'
      '         SB_AVALUTE  v'
      '   WHERE (    a.kli_id = :kli_id'
      '          AND a.bal_cn1 IN (SELECT accountnumber'
      '                            FROM cm_aginfo'
      '                           WHERE groupid = (SELECT g.id'
      
        '                                              FROM cm_accountgro' +
        'ups g'
      
        '                                             WHERE g.iname = '#39'Cl' +
        'ientAccs'#39'))'
      '         )'
      '         AND t.Acc_ID = a.ID'
      '         AND v.VALUTE = a.VAL_ACC'
      'UNION ALL'
      
        'SELECT   a.id AS accid, a.kli_id, a.acc_no AS accountnumber , ab' +
        's(t.OSTAT) as Rest, v.VAL_NAME'
      '    FROM SB_ACCOUNT  a ,'
      '         SB_TENOSTAT t ,'
      '         SB_AVALUTE  v'
      '   WHERE ((bal_cn1 IN (SELECT accountnumber'
      '                         FROM cm_aginfo'
      '                        WHERE groupid = (SELECT g.id'
      
        '                                           FROM cm_accountgroups' +
        ' g'
      
        '                                          WHERE g.iname = '#39'Inter' +
        'nalBankAccs'#39'))'
      '          )'
      '         )'
      '         AND t.Acc_ID = a.ID'
      '         AND v.VALUTE = a.VAL_ACC'
      '         '
      'ORDER BY kli_id, accountnumber')
    Variables.Data = {0300000001000000070000003A4B4C495F4944030000000000000000000000}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 200
    Top = 88
    object PaymentAccountsACCID: TFloatField
      FieldName = 'ACCID'
    end
    object PaymentAccountsKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object PaymentAccountsACCOUNTNUMBER: TStringField
      FieldName = 'ACCOUNTNUMBER'
    end
    object PaymentAccountsREST: TFloatField
      FieldName = 'REST'
      DisplayFormat = '#,##0.00'
    end
    object PaymentAccountsVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
  end
  object DataSrcPaymentAccounts: TDataSource
    DataSet = PaymentAccounts
    Left = 200
    Top = 32
  end
  object LoanRest: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   C.REST , '
      '   CM_COMMON.AccountNumber_Get(D.LOANACCID) as ACC_NO,'
      '   C.PenaltyRest,'
      '   cm_utils.Get_CreditPenaltyAccount(b.id) as penaltyAccno'
      'FROM'
      '   CM_ACTIVE_CREDITS B'
      ' , CM_CURR_STATE C'
      ' , CM_ACCOUNTS D'
      'WHERE'
      '     (B.ID =:CreditID)'
      ' AND (D.CREDITID =:CreditID)'
      ' AND (C.CREDITID =:CreditID)')
    Variables.Data = {
      0300000001000000090000003A43524544495449440300000000000000000000
      00}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 336
    Top = 296
    object LoanRestREST: TFloatField
      FieldName = 'REST'
      Required = True
    end
    object LoanRestPENALTYREST: TFloatField
      FieldName = 'PENALTYREST'
    end
    object LoanRestACC_NO: TStringField
      FieldName = 'ACC_NO'
      Size = 4000
    end
    object LoanRestPENALTYACCNO: TStringField
      FieldName = 'PENALTYACCNO'
      Size = 4000
    end
  end
  object DueIntRest: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   C.DUEINTERESTREST , '
      '   CM_COMMON.AccountNumber_Get(D.DUEINTERESTACCID) as ACC_NO'
      'FROM'
      '   CM_ACTIVE_CREDITS B'
      ' , CM_CURR_STATE C'
      ' , CM_ACCOUNTS D'
      'WHERE'
      '     (B.ID =:CreditID)'
      ' AND (D.CREDITID =:CreditID)'
      ' AND (C.CREDITID =:CreditID)')
    Variables.Data = {
      0300000001000000090000003A43524544495449440300000000000000000000
      00}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 136
    Top = 296
    object DueIntRestDUEINTERESTREST: TFloatField
      FieldName = 'DUEINTERESTREST'
      Required = True
    end
    object DueIntRestACC_NO: TStringField
      FieldName = 'ACC_NO'
      Size = 4000
    end
  end
  object DueRest: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   C.DUEREST , '
      '   CM_COMMON.AccountNumber_Get(D.DUELOANACCID) as ACC_NO'
      'FROM'
      '   CM_ACTIVE_CREDITS B'
      ' , CM_CURR_STATE C'
      ' , CM_ACCOUNTS D'
      'WHERE'
      '     (B.ID =:CreditID)'
      ' AND (D.CREDITID =:CreditID)'
      ' AND (C.CREDITID =:CreditID)')
    Variables.Data = {
      0300000001000000090000003A43524544495449440300000000000000000000
      00}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 216
    Top = 296
    object DueRestDUEREST: TFloatField
      FieldName = 'DUEREST'
      Required = True
    end
    object DueRestACC_NO: TStringField
      FieldName = 'ACC_NO'
      Size = 4000
    end
  end
  object IntRest: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   C.INTERESTREST , '
      '   CM_COMMON.AccountNumber_Get(D.INTERESTACCID) as ACC_NO'
      'FROM'
      '   CM_ACTIVE_CREDITS B'
      ' , CM_CURR_STATE C'
      ' , CM_ACCOUNTS D'
      'WHERE'
      '     (B.ID =:CreditID)'
      ' AND (D.CREDITID =:CreditID)'
      ' AND (C.CREDITID =:CreditID)')
    Variables.Data = {
      0300000001000000090000003A43524544495449440300000000000000000000
      00}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 272
    Top = 296
    object IntRestINTERESTREST: TFloatField
      FieldName = 'INTERESTREST'
      Required = True
    end
    object IntRestACC_NO: TStringField
      FieldName = 'ACC_NO'
      Size = 4000
    end
  end
  object DSLoanRest: TDataSource
    DataSet = LoanRest
    Left = 336
    Top = 232
  end
  object DSDueIntRest: TDataSource
    DataSet = DueIntRest
    Left = 136
    Top = 232
  end
  object DSDueRest: TDataSource
    DataSet = DueRest
    Left = 208
    Top = 232
  end
  object DSIntRest: TDataSource
    DataSet = IntRest
    Left = 272
    Top = 232
  end
  object PortfInfo: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   p.BOOROWERID , p.NAME,g.ANYINFOTODISTING'
      'FROM'
      '   CM_ACTIVE p,  CM_GUARANTEE G'
      'WHERE p.ID=:CREDITID   '
      'and g.creditid=p.id')
    Variables.Data = {
      0300000001000000090000003A43524544495449440300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000A000000424F4F524F574552494401000000000004000000
      4E414D4501000000000010000000414E59494E464F544F44495354494E470100
      00000000}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 392
    Top = 120
  end
  object DSPortfInfo: TDataSource
    DataSet = PortfInfo
    Left = 392
    Top = 168
  end
  object CM_PAYMENT: TOraclePackage
    Session = CMDataModule.CMSession
    PackageName = 'CM_PAYMENT'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Left = 64
    Top = 176
  end
  object PeniyaPayAccounts: TOracleDataSet
    SQL.Strings = (
      ''
      
        'SELECT   a.id AS accid, a.kli_id, a.acc_no AS accountnumber , ab' +
        's(t.OSTAT) as Rest, v.VAL_NAME'
      '    FROM SB_ACCOUNT  a ,'
      '         SB_TENOSTAT t ,'
      '         SB_AVALUTE  v'
      '   WHERE ((bal_cn1 IN (SELECT accountnumber'
      '                         FROM cm_aginfo'
      '                        WHERE groupid = (SELECT g.id'
      
        '                                           FROM cm_accountgroups' +
        ' g'
      
        '                                          WHERE g.iname = '#39'Inter' +
        'nalBankAccs'#39'))'
      '          )'
      '         )'
      '         AND t.Acc_ID = a.ID'
      '         AND v.VALUTE = a.VAL_ACC'
      '         '
      'ORDER BY kli_id, accountnumber')
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 192
    Top = 152
    object FloatField1: TFloatField
      FieldName = 'ACCID'
    end
    object FloatField2: TFloatField
      FieldName = 'KLI_ID'
    end
    object StringField1: TStringField
      FieldName = 'ACCOUNTNUMBER'
    end
    object FloatField3: TFloatField
      FieldName = 'REST'
      DisplayFormat = '#,##0.00'
    end
    object StringField2: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
  end
  object DSrcPeniyaPayAccounts: TDataSource
    DataSet = PeniyaPayAccounts
    Left = 296
    Top = 144
  end
  object cm_utils: TOraclePackage
    Session = CMDataModule.CMSession
    PackageName = 'CM_UTILS'
    Left = 56
    Top = 248
  end
  object expcrdcnt: TOracleDataSet
    SQL.Strings = (
      'select '
      'cm_utils.bankdaysbetween (MIN (psh.paymentdate),'
      '                                   :dat'
      '                                  ) AS exdatcount'
      '                                  '
      'from   cm_payment_schedule psh ,cm_curr_state cs'
      
        'where  psh.rest < cs.rest+cs.duerest and (cs.duerest+cs.rest - p' +
        'sh.rest >= 0.5) '
      'and psh.creditid = cs.creditid'
      'and psh.paymentdate <=:dat'
      'and psh.creditid = :crdid'
      'group by psh.creditid')
    Variables.Data = {
      0300000002000000040000003A4441540C000000000000000000000006000000
      3A4352444944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000A0000004558444154434F554E54010000000000}
    Session = CMDataModule.CMSession
    Left = 56
    Top = 312
    object expcrdcntEXDATCOUNT: TFloatField
      FieldName = 'EXDATCOUNT'
    end
  end
end
