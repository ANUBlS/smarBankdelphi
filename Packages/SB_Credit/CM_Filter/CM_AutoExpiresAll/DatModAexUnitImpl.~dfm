object DatModAex: TDatModAex
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 219
  Top = 135
  Height = 480
  Width = 696
  object DatSetExpCredits_: TOracleDataSet
    SQL.Strings = (
      ''
      
        'SELECT p.ID, p.numberofcredit, p.currency, p.personaltype, p.cus' +
        'tomertype,'
      '       p.branchid, p.credittype, b.NAME, av.val_name,'
      
        '       cm_common.accountnumber_get (a.contractaccid) AS contract' +
        'accno,'
      
        '       cm_common.accountrest_get (a.booroweraccid) AS custaccres' +
        't,'
      '       cm_utils.Get_PlanPrincipal (p.ID, :PDAT) AS principal,'
      '       cm_utils.Get_IntPlanPayment (p.ID, :PDAT) AS interest,'
      '         cm_utils.Get_PlanPrincipal(p.ID, :PDAT)'
      '       + cm_utils.Get_IntPlanPayment(p.ID, :PDAT) AS sumamt,'
      '        expcrd.expdatcount,'
      '       c.penaltyrest, c.reserveid,'
      '       cm_utils.get_creditplanrest (p.ID, :PDAT) AS plr,'
      '       p.dateofconclusion as opendate,'
      '       p.duedatefirstcontract as closedate,'
      '       p.annualyinterestrate,'
      
        '       cm_common.get_AccountBalance(a.contractaccid) as BalaccNo' +
        ','
      '       p.boorowerid ,b.PHONENUMBER'
      '  FROM cm_active_credits p,'
      '       cm_boorowerinfo b,'
      '       cm_accounts a,'
      '       cm_curr_state c,'
      '       sb_avalute av,'
      ''
      '('
      'SELECT   creditid,'
      '         cm_utils.bankdaysbetween (MIN (paymentdate),'
      '                                   :PDAT'
      '                                  ) AS expdatcount'
      '    FROM cm_payment_schedule'
      '   WHERE creditid IN ('
      '            SELECT creditid'
      '              FROM (SELECT ID AS creditid'
      '                      FROM cm_active_credits'
      '                    MINUS'
      '                    SELECT   pl.creditid'
      '                        FROM cm_history h,'
      '                             (SELECT creditid, rest, paymentdate'
      '                                FROM cm_payment_schedule) pl'
      '                       WHERE pl.creditid = h.creditid'
      '                         AND pl.paymentdate ='
      '                                (SELECT MAX (paymentdate)'
      '                                   FROM cm_payment_schedule'
      '                                  WHERE creditid = pl.creditid'
      '                                    AND paymentdate <= h.hdate)'
      
        '                         AND ABS (pl.rest - (h.rest+h.duerest)) ' +
        '<= 5'
      '                    GROUP BY pl.creditid))'
      'GROUP BY creditid'
      ''
      'union'
      'SELECT   pl.creditid,'
      
        '         cm_utils.bankdaysbetween (MAX (h.hdate), :PDAT) AS expd' +
        'atcount'
      '    FROM cm_history h, (SELECT creditid, rest, paymentdate'
      '                          FROM cm_payment_schedule) pl'
      '   WHERE pl.creditid = h.creditid'
      '     AND pl.paymentdate ='
      '                     (SELECT MAX (paymentdate)'
      '                        FROM cm_payment_schedule'
      
        '                       WHERE creditid = pl.creditid AND paymentd' +
        'ate < h.hdate)'
      '     AND ABS (pl.rest - (h.rest+h.duerest)) <= 5'
      'GROUP BY pl.creditid) expcrd      '
      '       '
      ' WHERE b.creditid = p.ID'
      '   AND expcrd.creditid = p.ID'
      '   AND a.creditid = p.ID'
      '   AND c.creditid = p.ID'
      '   AND av.valute = p.currency'
      
        '   AND abs((cm_utils.get_creditplanrest (p.ID, :PDAT) - c.rest))' +
        '>=2'
      'and c.rest <> 0'
      'and p.intcalcmethod=0'
      'ORDER BY :orderfield'
      '')
    Variables.Data = {
      03000000020000000B0000003A4F524445524649454C44010000000000000000
      000000050000003A504441540C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000180000000200000049440100000000000E0000004E554D4245524F46
      4352454449540100000000000800000043555252454E43590100000000000C00
      0000504552534F4E414C545950450100000000000C000000435553544F4D4552
      54595045010000000000080000004252414E434849440100000000000A000000
      43524544495454595045010000000000040000004E414D450100000000000800
      000056414C5F4E414D450100000000000D000000434F4E54524143544143434E
      4F0100000000000B000000435553544143435245535401000000000009000000
      5052494E434950414C01000000000008000000494E5445524553540100000000
      000600000053554D414D540100000000000B000000455850444154434F554E54
      0100000000000B00000050454E414C5459524553540100000000000900000052
      455345525645494401000000000003000000504C52010000000000080000004F
      50454E4441544501000000000009000000434C4F534544415445010000000000
      13000000414E4E55414C59494E54455245535452415445010000000000080000
      0042414C4143434E4F0100000000000A000000424F4F524F5745524944010000
      0000000B00000050484F4E454E554D424552010000000000}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 40
    Top = 16
    object DatSetExpCredits_ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DatSetExpCredits_NUMBEROFCREDIT: TStringField
      DisplayLabel = 'Мцгавилянин №-си'
      FieldName = 'NUMBEROFCREDIT'
      Required = True
      Size = 32
    end
    object DatSetExpCredits_CONTRACTACCNO: TStringField
      DisplayLabel = 'Щесабын №-си'
      FieldName = 'CONTRACTACCNO'
      Size = 4000
    end
    object DatSetExpCredits_VAL_NAME: TStringField
      DisplayLabel = '$'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object DatSetExpCredits_OPENDATE: TDateTimeField
      DisplayLabel = 'Ачылма тарихи'
      FieldName = 'OPENDATE'
      Required = True
    end
    object DatSetExpCredits_CLOSEDATE: TDateTimeField
      DisplayLabel = 'Баьланма тарихи'
      FieldName = 'CLOSEDATE'
      Required = True
    end
    object DatSetExpCredits_ANNUALYINTERESTRATE: TFloatField
      DisplayLabel = 'Иллик %'
      FieldName = 'ANNUALYINTERESTRATE'
      Required = True
    end
    object DatSetExpCredits_BALACCNO: TFloatField
      DisplayLabel = 'Баланс щесабы'
      FieldName = 'BALACCNO'
    end
    object DatSetExpCredits_NAME: TStringField
      DisplayLabel = 'Мцштяринин ады'
      FieldName = 'NAME'
      Size = 64
    end
    object DatSetExpCredits_PHONENUMBER: TStringField
      DisplayLabel = 'Телефон №'
      FieldName = 'PHONENUMBER'
      Size = 255
    end
    object DatSetExpCredits_BOOROWERID: TFloatField
      DisplayLabel = 'Мцштяринин коду'
      FieldName = 'BOOROWERID'
      Required = True
    end
    object DatSetExpCredits_CUSTACCREST: TFloatField
      DisplayLabel = 'Жари щесабын галыьы'
      FieldName = 'CUSTACCREST'
    end
    object DatSetExpCredits_PRINCIPAL: TFloatField
      DisplayLabel = 'Ясас борждан '
      FieldName = 'PRINCIPAL'
      Required = True
    end
    object DatSetExpCredits_INTEREST: TFloatField
      DisplayLabel = 'Фаиз цзря борждан'
      FieldName = 'INTEREST'
      Required = True
    end
    object DatSetExpCredits_EXPDATCOUNT: TFloatField
      DisplayLabel = 'Ьеж . ьцнлярин сайы'
      FieldName = 'EXPDATCOUNT'
    end
    object DatSetExpCredits_PENALTYREST: TFloatField
      DisplayLabel = 'Пенийа'
      FieldName = 'PENALTYREST'
    end
    object DatSetExpCredits_CURRENCY: TFloatField
      FieldName = 'CURRENCY'
      Required = True
      Visible = False
    end
    object DatSetExpCredits_PERSONALTYPE: TFloatField
      FieldName = 'PERSONALTYPE'
      Required = True
      Visible = False
    end
    object DatSetExpCredits_CUSTOMERTYPE: TFloatField
      FieldName = 'CUSTOMERTYPE'
      Required = True
      Visible = False
    end
    object DatSetExpCredits_BRANCHID: TFloatField
      FieldName = 'BRANCHID'
      Required = True
      Visible = False
    end
    object DatSetExpCredits_CREDITTYPE: TFloatField
      FieldName = 'CREDITTYPE'
      Required = True
      Visible = False
    end
    object DatSetExpCredits_RESERVEID: TFloatField
      FieldName = 'RESERVEID'
      Required = True
      Visible = False
    end
    object DatSetExpCredits_SUMAMT: TFloatField
      DisplayLabel = 'Жями'
      FieldName = 'SUMAMT'
    end
    object DatSetExpCredits_PLR: TFloatField
      FieldName = 'PLR'
      Visible = False
    end
  end
  object DatSrcExpCredits: TDataSource
    DataSet = DatSetExpCredits
    Left = 152
    Top = 16
  end
  object DatSetPayments: TOracleDataSet
    SQL.Strings = (
      'SELECT paydate, '
      '       payedamt, '
      '       payedintamt, '
      '       payeddueamt,'
      '       payeddueintamt,'
      '       payedpenaltyamt'
      '  FROM cm_payments'
      'where creditid  = :CrdID'
      'order by paydate')
    Variables.Data = {0300000001000000060000003A4352444944030000000000000000000000}
    Session = CMDataModule.CMSession
    Left = 40
    Top = 88
    object DatSetPaymentsPAYDATE: TDateTimeField
      DisplayLabel = 'Тарих'
      FieldName = 'PAYDATE'
      Required = True
    end
    object DatSetPaymentsPAYEDAMT: TFloatField
      DisplayLabel = 'Ясас борждан '
      FieldName = 'PAYEDAMT'
      Required = True
    end
    object DatSetPaymentsPAYEDINTAMT: TFloatField
      DisplayLabel = 'Фаиз цзря борждан'
      FieldName = 'PAYEDINTAMT'
      Required = True
    end
    object DatSetPaymentsPAYEDDUEAMT: TFloatField
      FieldName = 'PAYEDDUEAMT'
      Required = True
    end
    object DatSetPaymentsPAYEDDUEINTAMT: TFloatField
      FieldName = 'PAYEDDUEINTAMT'
      Required = True
    end
    object DatSetPaymentsPAYEDPENALTYAMT: TFloatField
      DisplayLabel = 'Пенийа'
      FieldName = 'PAYEDPENALTYAMT'
      Required = True
    end
  end
  object DatSetSchedule: TOracleDataSet
    SQL.Strings = (
      'SELECT  paymentdate, '
      '        principal, '
      '        interest'
      '  FROM cm_payment_schedule'
      'where creditid = :CrdID'
      'order by paymentdate'
      '')
    Variables.Data = {0300000001000000060000003A4352444944030000000000000000000000}
    Session = CMDataModule.CMSession
    Left = 40
    Top = 152
    object DatSetSchedulePAYMENTDATE: TDateTimeField
      DisplayLabel = 'Тарих'
      FieldName = 'PAYMENTDATE'
      Required = True
    end
    object DatSetSchedulePRINCIPAL: TFloatField
      DisplayLabel = 'Ясас борждан '
      FieldName = 'PRINCIPAL'
      Required = True
    end
    object DatSetScheduleINTEREST: TFloatField
      DisplayLabel = 'Фаиз цзря борждан'
      FieldName = 'INTEREST'
      Required = True
    end
  end
  object DatSrcPayments: TDataSource
    DataSet = DatSetPayments
    Left = 148
    Top = 90
  end
  object DatSrcSchedule: TDataSource
    DataSet = DatSetSchedule
    Left = 144
    Top = 153
  end
  object DatSetTranches: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '      tranchedate, '
      '      trancheamount'
      '  FROM cm_tranches'
      'where creditid  =:CrdID'
      'order by tranchedate')
    Variables.Data = {0300000001000000060000003A4352444944030000000000000000000000}
    Session = CMDataModule.CMSession
    Left = 40
    Top = 211
    object DatSetTranchesTRANCHEDATE: TDateTimeField
      DisplayLabel = 'Тарих'
      FieldName = 'TRANCHEDATE'
      Required = True
    end
    object DatSetTranchesTRANCHEAMOUNT: TFloatField
      DisplayLabel = 'Мябляь'
      FieldName = 'TRANCHEAMOUNT'
      Required = True
    end
  end
  object DatSrcTranches: TDataSource
    DataSet = DatSetTranches
    Left = 149
    Top = 210
  end
  object DatSetInterests: TOracleDataSet
    SQL.Strings = (
      'SELECT hdate, '
      '       interest, '
      '       dueinterest, '
      '       nvl(penaltyinterest,0) as penaltyinterest'
      '  FROM cm_interests'
      'where CreditID = :CrdID'
      'order by hdate ')
    Variables.Data = {0300000001000000060000003A4352444944030000000000000000000000}
    Session = CMDataModule.CMSession
    Left = 40
    Top = 264
    object DatSetInterestsHDATE: TDateTimeField
      DisplayLabel = 'Тарих'
      FieldName = 'HDATE'
      Required = True
    end
    object DatSetInterestsINTEREST: TFloatField
      DisplayLabel = 'Фаиз'
      FieldName = 'INTEREST'
      Required = True
    end
    object DatSetInterestsDUEINTEREST: TFloatField
      DisplayLabel = 'Эежикмиш фаиз'
      FieldName = 'DUEINTEREST'
      Required = True
    end
    object DatSetInterestsPENALTYINTEREST: TFloatField
      DisplayLabel = 'Щесабланмыш пенийа'
      FieldName = 'PENALTYINTEREST'
    end
  end
  object DatSrcInterests: TDataSource
    DataSet = DatSetInterests
    Left = 152
    Top = 264
  end
  object DatSetReserves: TOracleDataSet
    SQL.Strings = (
      'SELECT id, description||'#39' - '#39'||PERCENT as description'
      '  FROM cm_reserves')
    Session = CMDataModule.CMSession
    Left = 256
    Top = 304
    object DatSetReservesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DatSetReservesDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Required = True
      Size = 64
    end
  end
  object DatSrcReserves: TDataSource
    DataSet = DatSetReserves
    Left = 368
    Top = 304
  end
  object DatSetCategories: TOracleDataSet
    SQL.Strings = (
      'SELECT id,  description'
      '  FROM cm_categories')
    Session = CMDataModule.CMSession
    Left = 256
    Top = 200
    object DatSetCategoriesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DatSetCategoriesDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 128
    end
  end
  object DatSrcPersons: TDataSource
    DataSet = DatSetPersons
    Left = 352
    Top = 136
  end
  object DatSetCreditTypes: TOracleDataSet
    SQL.Strings = (
      'SELECT id,   description'
      '  FROM cm_credittypes')
    Session = CMDataModule.CMSession
    Left = 264
    Top = 256
    object DatSetCreditTypesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DatSetCreditTypesDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 128
    end
  end
  object DatSrctCategories: TDataSource
    DataSet = DatSetCategories
    Left = 360
    Top = 200
  end
  object DatSetValute: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name from sb_avalute')
    Session = CMDataModule.CMSession
    Left = 256
    Top = 16
    object DatSetValuteVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object DatSetValuteVALU_NAME: TStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
  end
  object DatSrcCreditTypes: TDataSource
    DataSet = DatSetCreditTypes
    Left = 368
    Top = 256
  end
  object DatSetFilials: TOracleDataSet
    SQL.Strings = (
      'select id,name from sb_filial')
    Session = CMDataModule.CMSession
    Left = 256
    Top = 80
  end
  object DatSrcFilials: TDataSource
    DataSet = DatSetFilials
    Left = 352
    Top = 80
  end
  object DatSetPersons: TOracleDataSet
    SQL.Strings = (
      'select id,descripion from cm_persons')
    Session = CMDataModule.CMSession
    Left = 257
    Top = 133
    object DatSetPersonsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DatSetPersonsDESCRIPION: TStringField
      FieldName = 'DESCRIPION'
      Size = 64
    end
  end
  object DatSrcValute: TDataSource
    DataSet = DatSetValute
    Left = 352
    Top = 16
  end
  object DatSetExpCredits: TOracleDataSet
    SQL.Strings = (
      'select'
      '    p.id,'
      '    p.numberofcredit,'
      
        '    p.currency, p.personaltype, p.customertype,p.branchid, p.cre' +
        'dittype,'
      '    p.dateofconclusion as opendate,'
      '    p.duedatefirstcontract as closedate,'
      '    p.annualyinterestrate,p.boorowerid ,b.PHONENUMBER,'
      '    lacc.acc_no as contractaccno,'
      '    cust.name,'
      '    p.dateofconclusion,'
      '    p.duedatefirstcontract,'
      '    p.duedatelastcontract,'
      '    expcrd.outdat,'
      '    psh.planrest, '
      '    expcrd.exdatcount,'
      '    av.val_name,'
      '    br.ostat as custaccrest,'
      '    case '
      
        '    when nvl(planpay.pay,0) - nvl(realpay.realpay,0)  <= 0 then ' +
        '0  '
      '    else nvl(planpay.pay,0) - nvl(realpay.realpay,0) '
      '    end as principal,'
      ' '
      '    case '
      
        '    when nvl(planpay.payint,0) - nvl(realpay.Realpayint,0)  <= 0' +
        ' then 0  '
      '    else nvl(planpay.payint,0) - nvl(realpay.Realpayint,0)'
      '    end as interest,'
      ''
      ''
      '    case '
      '    when nvl(planpay.pay,0) - nvl(realpay.realpay,0) +'
      
        '    nvl(planpay.payint,0) - nvl(realpay.Realpayint,0)  <= 0 then' +
        ' 0  '
      '    else nvl(planpay.pay,0) - nvl(realpay.realpay,0) +'
      '    nvl(planpay.payint,0) - nvl(realpay.Realpayint,0)'
      '    end as sumamt,'
      ''
      ''
      '    /*,'
      '       cm_utils.Get_PlanPrincipal (p.ID, :dat) AS principal,'
      '       cm_utils.Get_IntPlanPayment (p.ID) AS interest,'
      '         cm_utils.Get_PlanPrincipal(p.ID, :dat)'
      '       + cm_utils.Get_IntPlanPayment(p.ID) AS sumamt,*/'
      '    c.penaltyrest, '
      '    c.reserveid,  '
      '    cm_common.get_AccountBalance(a.contractaccid) as BalaccNo'
      'from'
      '   cm_portfolio p,'
      '   cm_loanaccounts lacc,'
      '   cm_sb_customers cust,'
      '   sb_avalute av,'
      '   cm_boorowerrest br,'
      '   cm_boorowerinfo b,'
      '   cm_curr_state c,'
      '   cm_accounts a,'
      '   '
      ' (select '
      '   psh.creditid,'
      '   sum(psh.principal) as pay,'
      '   sum(psh.interest) as payint'
      '  from cm_payment_schedule psh '
      '  where psh.paymentdate<=:dat '
      'group by psh.creditid) planpay,'
      ''
      '(select '
      '   pay.creditid,'
      '   sum(pay.PAYEDAMT+pay.PAYEDDUEAMT) as Realpay,'
      '   sum(pay.PAYEDINTAMT+pay.PAYEDDUEINTAMT) as Realpayint'
      '  from cm_payments pay '
      'group by pay.creditid) realpay,'
      '      '
      '(select  creditid, null as outdat,0 as exdatcount from('
      'select id as creditid'
      'from   cm_payment_schedule where paymentdate = :dat)/*'
      ''
      'minus  '
      ''
      'select psh.creditid'
      'from   cm_payment_schedule psh ,cm_curr_state cs'
      
        'where  psh.rest < (cs.rest+cs.duerest) and (cs.duerest+cs.rest -' +
        ' psh.rest >= 1) '
      'and psh.creditid = cs.creditid'
      'and psh.paymentdate <=:dat'
      'group by psh.creditid)*/'
      ''
      'union'
      
        'select psh.creditid,min(psh.paymentdate)  as outdat,cm_utils.ban' +
        'kdaysbetween (MIN (psh.paymentdate),'
      '                                   :dat'
      '                                  ) AS exdatcount'
      'from   cm_payment_schedule psh ,cm_curr_state cs'
      
        'where  psh.rest < cs.rest+cs.duerest and (cs.duerest+cs.rest - p' +
        'sh.rest >= 2) '
      'and psh.creditid = cs.creditid'
      'and psh.paymentdate <=:dat'
      'group by psh.creditid'
      ') expcrd , '
      ''
      ''
      '(SELECT  creditid, rest as planrest,principal, interest'
      '  FROM cm_payment_schedule where paymentdate = :dat'
      '  union'
      
        '   select  creditid , 0 as planrest, 0 as principal, 0 as intere' +
        'st from '
      '  (select id as creditid '
      '  from cm_portfolio'
      '  minus'
      '  SELECT  creditid'
      '  FROM cm_payment_schedule where paymentdate = :dat)) psh'
      ''
      'where p.id = lacc.creditid  and '
      '      p.boorowerid = cust.id and'
      '      p.id = c.creditid and'
      '      c.rest + c.duerest <> 0 and'
      '      p.id = psh.creditid and'
      '      br.creditid = p.id and'
      '      expcrd.creditid = p.id and '
      '      b.creditid = p.id and'
      '      a.creditid = p.id and '
      '      p.currency = av.valute and'
      '      p.id=planpay.creditid(+) and'
      '      p.id = realpay.creditid(+)'
      '      order by :ORDERFIELD'
      ''
      ''
      ''
      ''
      '')
    Variables.Data = {
      0300000002000000040000003A4441540C00000000000000000000000B000000
      3A4F524445524649454C44010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001C000000040000004E414D4501000000000010000000444154454F46
      434F4E434C5553494F4E01000000000014000000445545444154454649525354
      434F4E545241435401000000000013000000445545444154454C415354434F4E
      5452414354010000000000060000004F55544441540100000000000800000050
      4C414E524553540100000000000A0000004558444154434F554E540100000000
      000200000049440100000000000E0000004E554D4245524F4643524544495401
      00000000000800000043555252454E43590100000000000C000000504552534F
      4E414C545950450100000000000C000000435553544F4D455254595045010000
      000000080000004252414E434849440100000000000A00000043524544495454
      595045010000000000080000004F50454E444154450100000000000900000043
      4C4F53454441544501000000000013000000414E4E55414C59494E5445524553
      54524154450100000000000A000000424F4F524F57455249440100000000000B
      00000050484F4E454E554D4245520100000000000D000000434F4E5452414354
      4143434E4F0100000000000800000056414C5F4E414D450100000000000B0000
      004355535441434352455354010000000000090000005052494E434950414C01
      000000000008000000494E5445524553540100000000000600000053554D414D
      540100000000000B00000050454E414C54595245535401000000000009000000
      5245534552564549440100000000000800000042414C4143434E4F0100000000
      00}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 39
    Top = 328
    object DatSetExpCreditsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DatSetExpCreditsNUMBEROFCREDIT: TStringField
      DisplayLabel = 'Мцгавилянин №-си'
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object DatSetExpCreditsCONTRACTACCNO: TStringField
      DisplayLabel = 'Щесабын №-си'
      FieldName = 'CONTRACTACCNO'
      Required = True
    end
    object DatSetExpCreditsVAL_NAME: TStringField
      DisplayLabel = '$'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object DatSetExpCreditsOPENDATE: TDateTimeField
      DisplayLabel = 'Ачылма тарихи'
      FieldName = 'OPENDATE'
      Required = True
    end
    object DatSetExpCreditsCLOSEDATE: TDateTimeField
      DisplayLabel = 'Баьланма тарихи'
      FieldName = 'CLOSEDATE'
      Required = True
    end
    object DatSetExpCreditsANNUALYINTERESTRATE: TFloatField
      DisplayLabel = 'Иллик %'
      FieldName = 'ANNUALYINTERESTRATE'
      Required = True
    end
    object DatSetExpCreditsBALACCNO: TFloatField
      DisplayLabel = 'Баланс щесабы'
      FieldName = 'BALACCNO'
    end
    object DatSetExpCreditsNAME: TStringField
      DisplayLabel = 'Мцштяринин ады'
      FieldName = 'NAME'
      Size = 90
    end
    object DatSetExpCreditsBOOROWERID: TFloatField
      DisplayLabel = 'Мцштяринин коду'
      FieldName = 'BOOROWERID'
      Required = True
    end
    object DatSetExpCreditsPHONENUMBER: TStringField
      DisplayLabel = 'Телефон №'
      FieldName = 'PHONENUMBER'
      Size = 255
    end
    object DatSetExpCreditsCUSTACCREST: TFloatField
      DisplayLabel = 'Жари щесабын галыьы'
      FieldName = 'CUSTACCREST'
    end
    object DatSetExpCreditsPRINCIPAL: TFloatField
      DisplayLabel = 'Ясас борждан '
      FieldName = 'PRINCIPAL'
    end
    object DatSetExpCreditsINTEREST: TFloatField
      DisplayLabel = 'Фаиз цзря борждан'
      FieldName = 'INTEREST'
    end
    object DatSetExpCreditsPENALTYREST: TFloatField
      DisplayLabel = 'Пенийа'
      FieldName = 'PENALTYREST'
    end
    object DatSetExpCreditsSUMAMT: TFloatField
      DisplayLabel = 'Жями'
      FieldName = 'SUMAMT'
    end
    object DatSetExpCreditsOUTDAT: TDateTimeField
      DisplayLabel = 'Графикдян кянарлашма тарихи'
      FieldName = 'OUTDAT'
    end
    object DatSetExpCreditsPLANREST: TFloatField
      DisplayLabel = 'Кянарлашма тарихиндя план цзря олмалы  Я.Б. '
      FieldName = 'PLANREST'
    end
    object DatSetExpCreditsRESERVEID: TFloatField
      FieldName = 'RESERVEID'
      Required = True
      Visible = False
    end
    object DatSetExpCreditsCURRENCY: TFloatField
      FieldName = 'CURRENCY'
      Required = True
      Visible = False
    end
    object DatSetExpCreditsPERSONALTYPE: TFloatField
      FieldName = 'PERSONALTYPE'
      Required = True
      Visible = False
    end
    object DatSetExpCreditsCUSTOMERTYPE: TFloatField
      FieldName = 'CUSTOMERTYPE'
      Required = True
      Visible = False
    end
    object DatSetExpCreditsBRANCHID: TFloatField
      FieldName = 'BRANCHID'
      Required = True
      Visible = False
    end
    object DatSetExpCreditsCREDITTYPE: TFloatField
      FieldName = 'CREDITTYPE'
      Required = True
      Visible = False
    end
    object DatSetExpCreditsDATEOFCONCLUSION: TDateTimeField
      FieldName = 'DATEOFCONCLUSION'
      Required = True
      Visible = False
    end
    object DatSetExpCreditsDUEDATEFIRSTCONTRACT: TDateTimeField
      FieldName = 'DUEDATEFIRSTCONTRACT'
      Required = True
      Visible = False
    end
    object DatSetExpCreditsDUEDATELASTCONTRACT: TDateTimeField
      FieldName = 'DUEDATELASTCONTRACT'
      Visible = False
    end
    object DatSetExpCreditsEXDATCOUNT: TFloatField
      DisplayLabel = 'Ьеж . ьцнлярин сайы'
      FieldName = 'EXDATCOUNT'
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select'
      '    p.id,'
      '    p.numberofcredit,'
      
        '    p.currency, p.personaltype, p.customertype,p.branchid, p.cre' +
        'dittype,'
      '    p.dateofconclusion as opendate,'
      '    p.duedatefirstcontract as closedate,'
      '    p.annualyinterestrate,p.boorowerid ,b.PHONENUMBER,'
      '    lacc.acc_no as contractaccno,'
      '    cust.name,'
      '    p.dateofconclusion,'
      '    p.duedatefirstcontract,'
      '    p.duedatelastcontract,'
      '    expcrd.outdat,'
      '    psh.planrest, '
      '    expcrd.exdatcount,'
      '    av.val_name,'
      '    br.ostat as custaccrest,'
      '       cm_utils.Get_PlanPrincipal (p.ID, :DAT) AS principal,'
      '       cm_utils.Get_IntPlanPayment (p.ID) AS interest,'
      '         cm_utils.Get_PlanPrincipal(p.ID, :DAT)'
      '       + cm_utils.Get_IntPlanPayment(p.ID) AS sumamt,'
      '    c.penaltyrest, '
      '    c.reserveid,  '
      '    cm_common.get_AccountBalance(a.contractaccid) as BalaccNo'
      'from'
      '   cm_portfolio p,'
      '   cm_loanaccounts lacc,'
      '   cm_sb_customers cust,'
      '   sb_avalute av,'
      '   cm_boorowerrest br,'
      '   cm_boorowerinfo b,'
      '   cm_curr_state c,'
      '   cm_accounts a,'
      '      '
      '(select  creditid, null as outdat,0 as exdatcount from('
      'select id as creditid'
      'from   cm_payment_schedule where paymentdate = :dat)/*'
      ''
      'minus  '
      ''
      'select psh.creditid'
      'from   cm_payment_schedule psh ,cm_curr_state cs'
      
        'where  psh.rest < (cs.rest+cs.duerest) and (cs.duerest+cs.rest -' +
        ' psh.rest >= 1) '
      'and psh.creditid = cs.creditid'
      'and psh.paymentdate <=:dat'
      'group by psh.creditid)*/'
      ''
      'union'
      
        'select psh.creditid,min(psh.paymentdate)  as outdat,cm_utils.ban' +
        'kdaysbetween (MIN (psh.paymentdate),'
      '                                   :dat'
      '                                  ) AS exdatcount'
      'from   cm_payment_schedule psh ,cm_curr_state cs'
      
        'where  psh.rest < cs.rest+cs.duerest and (cs.duerest+cs.rest - p' +
        'sh.rest >= 2) '
      'and psh.creditid = cs.creditid'
      'and psh.paymentdate <=:dat'
      'group by psh.creditid'
      ') expcrd , '
      ''
      ''
      '(SELECT  creditid, rest as planrest,principal, interest'
      '  FROM cm_payment_schedule where paymentdate = :dat'
      '  union'
      
        '   select  creditid , 0 as planrest, 0 as principal, 0 as intere' +
        'st from '
      '  (select id as creditid '
      '  from cm_portfolio'
      '  minus'
      '  SELECT  creditid'
      '  FROM cm_payment_schedule where paymentdate = :dat)) psh'
      ''
      'where p.id = lacc.creditid  and '
      '      p.boorowerid = cust.id and'
      '      p.id = c.creditid and'
      '      c.rest + c.duerest <> 0 and'
      '      p.id = psh.creditid and'
      '      br.creditid = p.id and'
      '      expcrd.creditid = p.id and '
      '      b.creditid = p.id and'
      '      a.creditid = p.id and '
      '      p.currency = av.valute --and'
      '     -- abs(psh.planrest - c.rest)>=2 and'
      '     -- p.intcalcmethod=0 '
      '      ORDER BY :orderfield'
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 144
    Top = 328
  end
end
