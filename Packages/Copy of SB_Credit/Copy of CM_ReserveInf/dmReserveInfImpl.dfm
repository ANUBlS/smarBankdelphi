object dmReserveInf: TdmReserveInf
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 200
  Top = 206
  Height = 480
  Width = 696
  object ReserveInf: TOracleDataSet
    SQL.Strings = (
      'select'
      '    lacc.acc_no as loanaccno,'
      '    cust.name,'
      '    p.dateofconclusion,'
      '    p.duedatefirstcontract,'
      '    p.duedatelastcontract,'
      '    expcrd.outdat,'
      '    psh.planrest, '
      '    expcrd.exdatcount,'
      '    h.rest,'
      '    h.pledgeprice,'
      '    h.pledgeprice/decode(h.rest*100,0,1,h.rest*100) as pl,'
      '    restype.PERCENT as respercent ,'
      '    duerestype.PERCENT as duerespercent ,'
      '    racc.ostat  as resostat,'
      '    dracc.ostat as dueresostat'
      '    '
      'from'
      '   cm_portfolio p,'
      '   cm_loanaccounts lacc,'
      '   cm_sb_customers cust,'
      '   cm_history h,'
      '   cm_reserverest racc,'
      '   cm_duereserverest dracc,'
      '   cm_reserve_types restype,'
      '   cm_reserve_types duerestype,   '
      '(select  creditid, null as outdat,0 as exdatcount from('
      'select id as creditid'
      'from   cm_portfolio'
      ''
      'minus'
      ''
      'select psh.creditid'
      'from   cm_payment_schedule psh ,cm_curr_state cs'
      'where  psh.rest < cs.rest and (cs.rest - psh.rest >= 5) '
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
      'where  psh.rest < cs.rest and (cs.rest - psh.rest >= 5) '
      'and psh.creditid = cs.creditid'
      'and psh.paymentdate <=:dat'
      'group by psh.creditid'
      ') expcrd  ,'
      ''
      ''
      '(SELECT  creditid, rest as planrest'
      '  FROM cm_payment_schedule where paymentdate = :dat'
      '  union'
      '  (select id as creditid , 0 as planrest from cm_active_credits'
      '  minus'
      '  SELECT  creditid, rest as planrest'
      '  FROM cm_payment_schedule where paymentdate = :dat)) psh'
      ''
      'where p.id = lacc.creditid  and '
      '      p.boorowerid = cust.id and'
      '      p.id = h.creditid and'
      '      h.hdate = :dat and h.rest <> 0 and'
      '      p.id = racc.creditid and'
      '      p.id = dracc.creditid and'
      '      p.id = psh.creditid and'
      '      h.reserveid = restype.id and'
      
        '      h.duereserveid = duerestype.id and expcrd.creditid = p.id ' +
        'and psh.creditid = p.id   '
      '      '
      '      '
      '      '
      '      '
      '                                   '
      '                                  '
      ''
      '      '
      '      '
      '      '
      '      '
      '      '
      '      '
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
      '')
    Variables.Data = {0300000001000000040000003A4441540C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000F000000090000004C4F414E4143434E4F010000000000040000004E
      414D4501000000000010000000444154454F46434F4E434C5553494F4E010000
      00000014000000445545444154454649525354434F4E54524143540100000000
      0013000000445545444154454C415354434F4E54524143540100000000000600
      00004F555444415401000000000004000000524553540100000000000B000000
      504C45444745505249434501000000000008000000504C414E52455354010000
      0000000A00000052455350455243454E540100000000000D0000004455455245
      5350455243454E54010000000000080000005245534F53544154010000000000
      0B0000004455455245534F5354415401000000000002000000504C0100000000
      000A0000004558444154434F554E54010000000000}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 64
    Top = 16
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
    object ReserveInfOUTDAT: TDateTimeField
      DisplayLabel = 'Графикдян кянарлашма тарихи'
      FieldName = 'OUTDAT'
    end
    object ReserveInfEXDATCOUNT: TFloatField
      DisplayLabel = 'Эежикмя мцддяти'
      FieldName = 'EXDATCOUNT'
    end
    object ReserveInfPLANREST: TFloatField
      DisplayLabel = 'Кянарлашма тарихиндя план цзря олмалы  Я.Б. '
      FieldName = 'PLANREST'
    end
    object ReserveInfREST: TFloatField
      DisplayLabel = 'Я.Б. Галыьы'
      FieldName = 'REST'
      Required = True
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
    object ReserveInfDUERESPERCENT: TFloatField
      DisplayLabel = 'Мювжуд эеж. ещт. %'
      FieldName = 'DUERESPERCENT'
      Required = True
    end
    object ReserveInfRESOSTAT: TFloatField
      DisplayLabel = 'Мювжуд  ещт. мябляьи'
      FieldName = 'RESOSTAT'
    end
    object ReserveInfDUERESOSTAT: TFloatField
      DisplayLabel = 'Мювжуд  эеж. ещт. мябляьи'
      FieldName = 'DUERESOSTAT'
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
