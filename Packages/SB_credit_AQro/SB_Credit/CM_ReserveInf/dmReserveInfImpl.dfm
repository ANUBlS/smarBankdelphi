object dmReserveInf: TdmReserveInf
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 477
  Top = 270
  Height = 480
  Width = 696
  object ReserveInf: TOracleDataSet
    SQL.Strings = (
      'select '
      'case when expcrd.exdatcount>0 then '
      #39'Prob_'#39'||p.numberofcredit else '
      '   p.numberofcredit'
      ' end as Pr_numberofcredit,'
      '    lacc.acc_no as loanaccno,'
      '    cust.name,ct.description,'
      '    p.dateofconclusion,'
      '    p.duedatefirstcontract,'
      '    p.duedatelastcontract,psh.odemeli_faiz,'
      '    expcrd.outdat,'
      '    psh.planrest, '
      '    expcrd.exdatcount,'
      
        '    h.rest,h.interestrest,h.interestrest*ok.ostat as ekv_intrest' +
        ',h.PENALTYREST,pl.name as grovname,'
      '    h.rest*ok.ostat as ekrest,h.stopcalcdate,'
      '    h.duerest,'
      '    h.duerest*ok.ostat as ekduerest, g.REGISTRYNO,'
      '    h.pledgeprice,'
      
        '    trunc(h.pledgeprice/decode(h.rest*ok.ostat+h.duerest*ok.osta' +
        't,0,1,h.rest*ok.ostat+h.duerest*ok.ostat),2)*100 as pl,'
      '    restype.PERCENT as respercent ,'
      
        '    (h.rest*ok.ostat+h.duerest*ok.ostat)*restype.PERCENT/100  as' +
        ' resostat,p.numberofbankcredit'
      '    '
      'from'
      '   cm_portfolio p,'
      '   cm_loanaccounts lacc,'
      '   cm_sb_customers cust,'
      '   cm_history h,cm_credittypes ct,'
      '   cm_reserve_types restype,'
      '   sb_operkurs ok,cm_pledgsorts pl,cm_guarantee g,'
      '      '
      '(select  creditid, null as outdat,0 as exdatcount from('
      'select id as creditid'
      'from   cm_portfolio'
      ''
      'minus'
      ''
      'select psh.creditid'
      'from   cm_payment_schedule psh ,cm_curr_state cs'
      
        'where  psh.rest < (cs.rest+cs.duerest) and (cs.duerest+cs.rest -' +
        ' psh.rest >= 0.5) '
      'and psh.creditid = cs.creditid'
      'and psh.paymentdate <=:dat'
      'group by psh.creditid)'
      ''
      'union'
      
        'select psh.creditid,min(psh.paymentdate)  as outdat,cm_utils.ban' +
        'kdaysbetween (MIN (psh.paymentdate),'
      '                                   :dat'
      '                                  ) AS exdatcount'
      'from   cm_payment_schedule psh ,cm_curr_state cs'
      
        'where  psh.rest < cs.rest+cs.duerest and (cs.duerest+cs.rest - p' +
        'sh.rest >= 0.5) '
      'and psh.creditid = cs.creditid'
      'and psh.paymentdate <=:dat'
      'group by psh.creditid'
      ') expcrd , '
      ''
      ''
      '(SELECT  creditid, rest as planrest,interest as odemeli_faiz'
      '  FROM cm_payment_schedule where paymentdate = :dat'
      '  union'
      '   select  creditid , 0 as planrest,0 as odemeli_faiz  '
      ' from '
      '  (select id as creditid '
      '  from cm_portfolio'
      '  minus'
      '  SELECT  creditid'
      '  FROM cm_payment_schedule where paymentdate = :dat)) psh'
      ''
      'where p.id = lacc.creditid  and '
      '      p.boorowerid = cust.id and'
      '      p.id = h.creditid and'
      '      h.hdate = :dat and (h.rest <> 0 or h.duerest <> 0) and'
      '      p.id = psh.creditid and'
      '      h.reserveid = restype.id and'
      '      expcrd.creditid = p.id and '
      '      p.currency = ok.val_kod and'
      
        '      p.CREDITTYPE=ct.id     and p.pledgsorts=pl.id and g.credit' +
        'id=p.id  AND '
      '      ok.dat = :dat '
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Variables.Data = {0300000001000000040000003A4441540C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001A000000090000004C4F414E4143434E4F010000000000040000004E
      414D4501000000000010000000444154454F46434F4E434C5553494F4E010000
      00000014000000445545444154454649525354434F4E54524143540100000000
      0013000000445545444154454C415354434F4E54524143540100000000000600
      00004F555444415401000000000004000000524553540100000000000B000000
      504C45444745505249434501000000000008000000504C414E52455354010000
      0000000A00000052455350455243454E54010000000000080000005245534F53
      54415401000000000002000000504C0100000000000A0000004558444154434F
      554E5401000000000006000000454B5245535401000000000007000000445545
      5245535401000000000009000000454B445545524553540100000000000B0000
      004445534352495054494F4E0100000000000C0000004F44454D454C495F4641
      495A0100000000000B000000454B565F494E54524553540100000000000C0000
      00494E544552455354524553540100000000000B00000050454E414C54595245
      53540100000000000C00000053544F5043414C43444154450100000000000800
      000047524F564E414D450100000000001100000050525F4E554D4245524F4643
      5245444954010000000000120000004E554D4245524F4642414E4B4352454449
      540100000000000A00000052454749535452594E4F010000000000}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 63
    Top = 16
    object ReserveInfPR_NUMBEROFCREDIT: TStringField
      DisplayLabel = 'Мцгавилянин нюмряси'
      FieldName = 'PR_NUMBEROFCREDIT'
      Size = 37
    end
    object ReserveInfLOANACCNO: TStringField
      DisplayLabel = 'Ссуда щесаб №'
      FieldName = 'LOANACCNO'
      Required = True
    end
    object ReserveInfNAME: TStringField
      DisplayLabel = 'Боржалан '
      FieldName = 'NAME'
      Size = 90
    end
    object ReserveInfDESCRIPTION: TStringField
      DisplayLabel = 'Кредитин типи'
      FieldName = 'DESCRIPTION'
      Size = 128
    end
    object ReserveInfDATEOFCONCLUSION: TDateTimeField
      DisplayLabel = 'Верилмя тарихи'
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object ReserveInfDUEDATEFIRSTCONTRACT: TDateTimeField
      DisplayLabel = 'Баьланма тарихи'
      FieldName = 'DUEDATEFIRSTCONTRACT'
      Required = True
    end
    object ReserveInfDUEDATELASTCONTRACT: TDateTimeField
      DisplayLabel = 'Узадылма тарихи'
      FieldName = 'DUEDATELASTCONTRACT'
    end
    object ReserveInfSTOPCALCDATE: TDateTimeField
      DisplayLabel = '% щс дайандырылмасы тaрихi'
      FieldName = 'STOPCALCDATE'
    end
    object ReserveInfPLANREST: TFloatField
      DisplayLabel = ' Я.Б. юдямяли'
      FieldName = 'PLANREST'
    end
    object ReserveInfODEMELI_FAIZ: TFloatField
      DisplayLabel = 'Ф.Б юдямяли'
      FieldName = 'ODEMELI_FAIZ'
    end
    object ReserveInfEXDATCOUNT: TFloatField
      DisplayLabel = 'Эежикмя мцддяти'
      FieldName = 'EXDATCOUNT'
    end
    object ReserveInfREST: TFloatField
      DisplayLabel = 'Я.Б. Галыьы'
      FieldName = 'REST'
      Required = True
    end
    object ReserveInfEKREST: TFloatField
      DisplayLabel = 'Еквивалент '
      FieldName = 'EKREST'
    end
    object ReserveInfINTERESTREST: TFloatField
      DisplayLabel = 'F.Б. Галыьы'
      FieldName = 'INTERESTREST'
    end
    object ReserveInfEKV_INTREST: TFloatField
      DisplayLabel = 'F.B eквивалент '
      FieldName = 'EKV_INTREST'
    end
    object ReserveInfPENALTYREST: TFloatField
      DisplayLabel = 'Penya borcu'
      FieldName = 'PENALTYREST'
    end
    object ReserveInfGROVNAME: TStringField
      DisplayLabel = 'Эировун чешиди'
      FieldName = 'GROVNAME'
      Size = 80
    end
    object ReserveInfDUEREST: TFloatField
      DisplayLabel = 'Э.Я.Б. Галыьы'
      FieldName = 'DUEREST'
      Required = True
    end
    object ReserveInfEKDUEREST: TFloatField
      DisplayLabel = 'Еквивалент '
      FieldName = 'EKDUEREST'
    end
    object ReserveInfPLEDGEPRICE: TFloatField
      DisplayLabel = 'Эировун дяйяри'
      FieldName = 'PLEDGEPRICE'
      Required = True
    end
    object ReserveInfPL: TFloatField
      DisplayLabel = 'Эиров/Я.Б.*100'
      FieldName = 'PL'
    end
    object ReserveInfRESPERCENT: TFloatField
      DisplayLabel = 'Мювжуд ещт. %'
      FieldName = 'RESPERCENT'
      Required = True
    end
    object ReserveInfRESOSTAT: TFloatField
      DisplayLabel = 'Мювжуд  ещт. мябляьи'
      FieldName = 'RESOSTAT'
    end
    object ReserveInfREGISTRYNO: TStringField
      DisplayLabel = 'Машын №'
      FieldName = 'REGISTRYNO'
      Size = 32
    end
    object ReserveInfNUMBEROFBANKCREDIT: TStringField
      DisplayLabel = 'Кредитя мясщул шяхсин коду'
      FieldName = 'NUMBEROFBANKCREDIT'
      Size = 32
    end
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
  object DatSrcValute: TDataSource
    DataSet = DatSetValute
    Left = 352
    Top = 16
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
  object DatSrcPersons: TDataSource
    DataSet = DatSetPersons
    Left = 352
    Top = 136
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
  object DatSrctCategories: TDataSource
    DataSet = DatSetCategories
    Left = 360
    Top = 200
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
  object DatSrcCreditTypes: TDataSource
    DataSet = DatSetCreditTypes
    Left = 368
    Top = 256
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
end
