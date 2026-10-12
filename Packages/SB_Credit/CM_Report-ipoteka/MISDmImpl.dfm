object MISDm: TMISDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 245
  Top = 148
  Height = 515
  Width = 683
  object MISData: TOracleDataSet
    SQL.Strings = (
      'select  '
      '     p.id ,'
      '     p.numberofcredit,'
      '     p.NEWFINANCEAMOUNT,'
      '     p.creditlineamount,                                  '
      
        '     p.annualyinterestrate,                                     ' +
        '     '
      
        '     p.dateofconclusion ,                                       ' +
        '     '
      
        '     p.duedatefirstcontract,                                    ' +
        '  '
      
        '     p.duedatelastcontract,                                     ' +
        '  '
      
        '     p.purposeofcredit,                                         ' +
        '  '
      '     p.annualypenaltyrate, '
      '     p.intcalcmethod ,'
      '     p.branchid,'
      '     cat.description, '
      '     h.rest,'
      '     h.rest*o.ostat  AS ekrest,'
      '     h.interestrest ,'
      '     h.interestrest*o.ostat AS ekint,'
      '     h.duerest,'
      '     h.duerest*o.ostat AS ekduerest,'
      '     h.dueinterestrest,'
      '     h.dueinterestrest*o.ostat as ekdueint,'
      '     h.penaltyrest ,                 '
      '     h.penaltyrest*o.ostat as ekpen,'
      '     h.givenamount ,'
      '     h.givenamount *o.ostat as  ekgivenamount,'
      '     h.pledgeprice,'
      '     h.stopcalcdate,'
      '     e1.percent,'
      '     e2.percent as duepercent,'
      '     acc.acc_no as contractaccno,'
      '     substr(acc.acc_no,0,4) as balaccno,'
      '     intacc.acc_no as interestaccno,'
      '     resacc.acc_no as reserveaccno,'
      '     dueacc.acc_no as duecontractaccno,  '
      '     dueintacc.acc_no as dueinterestaccno,'
      '     dueresacc.acc_no as duereserveaccno ,'
      
        '     booroweracc.acc_no as booroweraccno,cm_utils.get_crdlineacc' +
        'ounts(p.id) as crdlineaccno,clr.ostat as clrostat,clr.ostat*o.os' +
        'tat as eclrostat,'
      '     boorowerrest.ostat as boorrest,'
      '     boorowerrest.ostat*o.ostat as eboorrest,'
      '     av.val_name,'
      '     l.name,'
      '     LastintPaydate.paydat as lastintpaydate ,'
      '     LastMainPaydate.paydat as lastmainpaydate ,'
      
        '    -- cm_common.get_lastintpaydate (p.ID, :hdat) as lastintpayd' +
        'ate,'
      
        '    -- cm_common.get_lastmainpaydate (p.ID, :hdat) as lastmainpa' +
        'ydate,'
      #9' restpr.principal ,'
      #9' restpr.interest,'
      #9' Paydat.paymentdate as  paymentdateofReportDat,'
      '     g.pledgename,g.pledgepriceevkv, '
      #9' g.holdername, '
      #9'   g.registryno,'
      '       g.anyinfotodisting                '
      '                         ,'
      '       g.registryagency                             '
      '                       ,'
      '       g.registrydate                                      '
      '                     ,'
      '       g.insuranceamount                                 '
      '                        ,'
      '       g.insurancedate , '
      '       --g.insuranceagency,                                   '
      '       l.boorowerid, '
      '       l.address, '
      '       l.phonenumber,'#9' '
      '       pl.description,'
      '       ps.name as psname,'
      
        '       crdtypes.DESCRIPTION as credittype ,cm_common.get_monthpa' +
        'y(p.id) as monthpay,buildnm.buildname,profitnm.profitname,reiste' +
        'rnm.reistername,'
      
        '       ins.name as  insuranceagency,cm_common.get_custMONTHLYPRO' +
        'FIT(p.boorowerid) as MONTHLYPROFIT ,ugr.DESCRIPTION as ugr,'
      '       cip.alevpredcost '
      'from cm_portfolio p,cm_crdlinerest clr,'
      '     cm_history h,'
      '     cm_categories cat,'
      '     cm_boorowerinfo l,'
      '     cm_guarantee g,'
      '     cm_insuranceagency ins,'
      '     cm_pledges pl,'
      '     cm_pledgsorts ps,'
      '     sb_avalute av,'
      '     sb_operkurs o,'
      '     cm_credittypes crdtypes, '
      '   cm_loanaccounts acc,'
      '   cm_intaccounts intacc,'
      '   cm_reserveaccounts resacc,'
      '   cm_dueloanaccounts dueacc ,'
      '   cm_dueintaccounts dueintacc ,'
      '   cm_dueresaccounts dueresacc  ,'
      
        '   cm_booroweraccounts booroweracc,(select p1.buildname,p.credit' +
        'id from (select id as creditid from cm_portfolio ) p,(SELECT  na' +
        'me as buildname,ip.creditid FROM cm_ip_buildingcomp  bc,cm_ip_in' +
        'fo ip where ip.BUILDID = bc.id) p1  where p.creditid = p1.credit' +
        'id(+)) buildnm,'
      
        '   cm_boorowerrest boorowerrest,(select p1.profitname, p.crediti' +
        'd from (select id as creditid from cm_portfolio ) p,(SELECT  nam' +
        'e as profitname,ip.creditid FROM cm_ip_profit bc,cm_ip_info ip w' +
        'here ip.PROFITID = bc.id) p1 where p.creditid = p1.creditid(+)) ' +
        'profitnm,'
      
        '   cm_reserve_types e1,(select p1.reistername, p.creditid from (' +
        'select id as creditid from cm_portfolio ) p,(SELECT  name as rei' +
        'stername,ip.creditid FROM cm_ip_reister bc,cm_ip_info ip where i' +
        'p.REISTERID = bc.id) p1 where p.creditid = p1.creditid(+)) reist' +
        'ernm,'
      '   cm_reserve_types e2 ,cm_usergroups ugr,'
      '   cm_ip_info cip,'
      '(SELECT 0 AS principal,0 AS interest, creditid'
      '  FROM (SELECT ID AS creditid'
      '          FROM cm_portfolio'
      '        MINUS'
      '        SELECT creditid'
      '          FROM cm_payment_schedule'
      '         WHERE paymentdate BETWEEN to_date(:bdat)'
      '                               AND to_date(:edat))'
      'UNION'
      'SELECT sum(principal),sum(IPINTEREST) as interest, creditid'
      '  FROM cm_payment_schedule'
      ' WHERE paymentdate BETWEEN to_date(:bdat)'
      '                       AND to_date(:edat)'
      #9#9#9#9#9'   group by creditid) restpr,'
      '                       '
      '      ((select '
      '          id as creditid,'
      '          null as paydat'
      '        from cm_portfolio'
      '       minus'
      '       select '
      '       creditid ,'
      '       null as paydat from cm_payments'
      '      where PAYEDINTAMT<>0  '
      '      and PAYDATE <= :hdat'
      '      group by creditid)'
      '      union'
      '      select '
      '       creditid ,'
      '       max(PAYDATE) as paydat from cm_payments'
      '      where PAYEDINTAMT<>0  '
      '      and PAYDATE <= :hdat'
      '      group by creditid) LastintPaydate,'
      ''
      '     '
      '      ((select '
      '          id as creditid,'
      '          null as paydat'
      '        from cm_portfolio'
      '       minus'
      '       select '
      '       creditid ,'
      '       null as paydat from cm_payments'
      '      where payedamt<>0  '
      '      and PAYDATE <= :hdat'
      '      group by creditid)'
      '      union'
      '      select '
      '       creditid ,'
      '       max(PAYDATE) as paydat from cm_payments'
      '      where payedamt<>0  '
      '      and PAYDATE <= :hdat'
      '      group by creditid) LastMainPaydate ,'
      #9'  '
      ''
      '(SELECT creditid, NULL AS paymentdate'
      '  FROM (SELECT ID AS creditid'
      '          FROM cm_portfolio'
      '        MINUS'
      '        SELECT   creditid'
      '            FROM cm_payment_schedule'
      '           WHERE paymentdate BETWEEN TO_DATE (   '#39'01'#39
      '                                              || '#39'-'#39
      
        '                                              || TO_CHAR (TO_DAT' +
        'E (:hdat),'
      '                                                          '#39'MON'#39
      '                                                         )'
      '                                              || '#39'-'#39
      
        '                                              || TO_CHAR (TO_DAT' +
        'E (:hdat),'
      '                                                          '#39'YYYY'#39
      '                                                         )'
      '                                             )'
      '                                 AND LAST_DAY (TO_DATE (:hdat))'
      '        GROUP BY creditid)'
      'UNION'
      'SELECT creditid, MIN (paymentdate) AS paymentdate'
      '  FROM cm_payment_schedule'
      ' WHERE paymentdate BETWEEN TO_DATE (   '#39'01'#39
      '                                    || '#39'-'#39
      
        '                                    || TO_CHAR (TO_DATE (:hdat),' +
        ' '#39'MON'#39')'
      '                                    || '#39'-'#39
      
        '                                    || TO_CHAR (TO_DATE (:hdat),' +
        ' '#39'YYYY'#39')'
      '                                   )'
      '                       AND LAST_DAY (TO_DATE (:hdat))'
      #9#9#9#9#9'   group by creditid) Paydat     '
      '        '
      ''
      'where '
      '  h.creditid = p.id and clr.creditid = p.id'
      '  and e1.id = h.reserveid'
      '  and e2.id = h.duereserveid'
      '  and h.hdate = :hdat'
      '  and cat.id = p.customertype'
      '  and p.id = l.creditid'
      '  and p.id = g.creditid'
      '  and pl.id = g.pledgeid'
      '  and ins.id = g.insuranceagency'
      '  and ps.id = p.pledgsorts'
      '  and crdtypes.id = p.credittype'
      '  and av.valute = p.currency'
      '  and o.dat = :hdat'
      '  and o.val_kod = p.currency'
      '  and  p.id = acc.creditid '
      '  and  p.id = intacc.creditid '
      '  and  p.id = resacc.creditid '
      '  and  p.id = dueacc.creditid  '
      '  and  p.id = dueintacc.creditid  '
      '  and  p.id = dueresacc.creditid '
      '  and  p.id = booroweracc.creditid'
      '  and  p.id = boorowerrest.creditid '
      '  and restpr.creditid = p.id '
      '  and LastintPaydate.creditid = p.id'
      
        '  and LastMainPaydate.creditid = p.id and buildnm.Creditid = p.i' +
        'd and profitnm.Creditid = p.id and reisternm.Creditid = p.id '
      
        '  and p.id = Paydat.Creditid and ugr.id = p.usrgroup and cip.cre' +
        'ditid=p.id'
      ''
      '')
    Variables.Data = {
      0300000003000000050000003A484441540C0000000000000000000000050000
      003A424441540C0000000000000000000000050000003A454441540C00000000
      00000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000480000000200000049440100000000000E0000004E554D4245524F46
      435245444954010000000000100000004352454449544C494E45414D4F554E54
      01000000000013000000414E4E55414C59494E54455245535452415445010000
      00000010000000444154454F46434F4E434C5553494F4E010000000000140000
      00445545444154454649525354434F4E54524143540100000000001300000044
      5545444154454C415354434F4E54524143540100000000000F00000050555250
      4F53454F4643524544495401000000000012000000414E4E55414C5950454E41
      4C5459524154450100000000000B0000004445534352495054494F4E01000000
      0000040000005245535401000000000006000000454B52455354010000000000
      0C000000494E5445524553545245535401000000000005000000454B494E5401
      0000000000070000004455455245535401000000000009000000454B44554552
      4553540100000000000F000000445545494E5445524553545245535401000000
      000008000000454B445545494E540100000000000B00000050454E414C545952
      45535401000000000005000000454B50454E0100000000000B00000047495645
      4E414D4F554E540100000000000D000000454B474956454E414D4F554E540100
      000000000B000000504C4544474550524943450100000000000C00000053544F
      5043414C43444154450100000000000700000050455243454E54010000000000
      0A00000044554550455243454E540100000000000D000000434F4E5452414354
      4143434E4F0100000000000D000000494E5445524553544143434E4F01000000
      00000C000000524553455256454143434E4F0100000000001000000044554543
      4F4E54524143544143434E4F01000000000010000000445545494E5445524553
      544143434E4F0100000000000F000000445545524553455256454143434E4F01
      00000000000800000056414C5F4E414D45010000000000040000004E414D4501
      00000000000E0000004C415354494E54504159444154450100000000000F0000
      004C4153544D41494E50415944415445010000000000090000005052494E4349
      50414C01000000000008000000494E5445524553540100000000000A00000050
      4C454447454E414D450100000000000A000000484F4C4445524E414D45010000
      0000000A00000052454749535452594E4F01000000000010000000414E59494E
      464F544F44495354494E470100000000000E0000005245474953545259414745
      4E43590100000000000C0000005245474953545259444154450100000000000F
      000000494E535552414E4345414D4F554E540100000000000F000000494E5355
      52414E43454147454E43590100000000000D000000494E535552414E43454441
      54450100000000000A000000424F4F524F574552494401000000000007000000
      414444524553530100000000000B00000050484F4E454E554D42455201000000
      00000D0000004445534352495054494F4E5F310100000000000600000050534E
      414D450100000000000D000000494E5443414C434D4554484F44010000000000
      080000004252414E434849440100000000000800000042414C4143434E4F0100
      000000000D000000424F4F524F5745524143434E4F0100000000000800000042
      4F4F5252455354010000000000160000005041594D454E54444154454F465245
      504F52544441540100000000000A000000435245444954545950450100000000
      000900000045424F4F5252455354010000000000080000004D4F4E5448504159
      0100000000000D0000004D4F4E54484C5950524F4649540100000000000C0000
      004352444C494E454143434E4F01000000000008000000434C524F5354415401
      00000000000900000045434C524F535441540100000000000300000055475201
      0000000000090000004255494C444E414D450100000000000A00000050524F46
      49544E414D450100000000000B000000524549535445524E414D450100000000
      000C000000414C455650524544434F53540100000000000F000000504C454447
      45505249434545564B56010000000000100000004E455746494E414E4345414D
      4F554E54010000000000}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    OnCalcFields = MISDataCalcFields
    Left = 32
    Top = 8
    object MISDataID: TFloatField
      FieldName = 'ID'
    end
    object MISDataNUMBEROFCREDIT: TStringField
      DisplayLabel = '№'
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object MISDataBALACCNO: TStringField
      DisplayLabel = 'Баланс'
      FieldName = 'BALACCNO'
      Size = 4
    end
    object MISDataCONTRACTACCNO: TStringField
      DisplayLabel = 'Щесаб №'
      FieldName = 'CONTRACTACCNO'
      Size = 4000
    end
    object MISDataINTERESTACCNO: TStringField
      DisplayLabel = 'Фаиз Щесаб №'
      FieldName = 'INTERESTACCNO'
      Size = 4000
    end
    object MISDataDUECONTRACTACCNO: TStringField
      DisplayLabel = 'Эежикмиш  Ссуда Щесаб №'
      FieldName = 'DUECONTRACTACCNO'
      Size = 4000
    end
    object MISDataDUEINTERESTACCNO: TStringField
      DisplayLabel = 'Эежикмиш  Фаиз Щесаб №'
      FieldName = 'DUEINTERESTACCNO'
    end
    object MISDataRESERVEACCNO: TStringField
      DisplayLabel = 'Ещтиййат Щесаб №'
      FieldName = 'RESERVEACCNO'
      Size = 4000
    end
    object MISDataDUERESERVEACCNO: TStringField
      DisplayLabel = 'Эежикмиш  Ещтиййат Щесаб №'
      FieldName = 'DUERESERVEACCNO'
      Size = 4000
    end
    object MISDataBOOROWERACCNO: TStringField
      DisplayLabel = 'Жари Щесаб №'
      FieldName = 'BOOROWERACCNO'
      Required = True
    end
    object MISDataBOORREST: TFloatField
      DisplayLabel = 'Галыьы'
      FieldName = 'BOORREST'
    end
    object MISDataEBOORREST: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'EBOORREST'
    end
    object MISDataCRDLINEACCNO: TDateTimeField
      DisplayLabel = 'K.X.O.M.Ehtiyat hesabi'
      FieldName = 'CRDLINEACCNO'
    end
    object MISDataCLROSTAT: TFloatField
      DisplayLabel = 'Галыьы'
      FieldName = 'CLROSTAT'
    end
    object MISDataECLROSTAT: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'ECLROSTAT'
    end
    object MISDataVAL_NAME: TStringField
      DisplayLabel = '$'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object MISDataNAME: TStringField
      DisplayLabel = 'Боржалан'
      FieldName = 'NAME'
      Size = 64
    end
    object MISDataCREDITTYPE: TStringField
      DisplayLabel = 'Кредитин типи'
      FieldName = 'CREDITTYPE'
      Size = 128
    end
    object MISDataDATEOFCONCLUSION: TDateTimeField
      DisplayLabel = 'Верилмя тарихи'
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object MISDataDUEDATEFIRSTCONTRACT: TDateTimeField
      DisplayLabel = 'Баьланма тарихи'
      FieldName = 'DUEDATEFIRSTCONTRACT'
      Required = True
    end
    object MISDataDUEDATELASTCONTRACT: TDateTimeField
      DisplayLabel = 'Узадылма тарихи'
      FieldName = 'DUEDATELASTCONTRACT'
    end
    object MISDataCREDITLINEAMOUNT: TFloatField
      DisplayLabel = ' Кредитин мябляьи'
      FieldName = 'CREDITLINEAMOUNT'
      Required = True
    end
    object MISDataANNUALYINTERESTRATE: TFloatField
      DisplayLabel = '%'
      FieldName = 'ANNUALYINTERESTRATE'
      Required = True
    end
    object MISDataREST: TFloatField
      DisplayLabel = 'Галыг'
      FieldName = 'REST'
      Required = True
    end
    object MISDataEKREST: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'EKREST'
    end
    object MISDataINTERESTREST: TFloatField
      DisplayLabel = 'Фаиз боржу'
      FieldName = 'INTERESTREST'
      Required = True
    end
    object MISDataEKINT: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'EKINT'
    end
    object MISDataDUEREST: TFloatField
      DisplayLabel = 'Эежикмиш ясас борж'
      FieldName = 'DUEREST'
      Required = True
    end
    object MISDataEKDUEREST: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'EKDUEREST'
    end
    object MISDataDUEINTERESTREST: TFloatField
      DisplayLabel = 'Эежикмиш Фаиз боржу'
      FieldName = 'DUEINTERESTREST'
      Required = True
    end
    object MISDataEKDUEINT: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'EKDUEINT'
    end
    object MISDataGIVENAMOUNT: TFloatField
      DisplayLabel = 'Жями верилмиш мябляь'
      FieldName = 'GIVENAMOUNT'
      Required = True
    end
    object MISDataEKGIVENAMOUNT: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'EKGIVENAMOUNT'
    end
    object MISDataPERCENT: TFloatField
      DisplayLabel = 'Ещтйат %'
      FieldName = 'PERCENT'
      Required = True
    end
    object MISDataDUEPERCENT: TFloatField
      DisplayLabel = 'Эежикмиш Ещтйат %'
      FieldName = 'DUEPERCENT'
    end
    object MISDataDESCRIPTION: TStringField
      DisplayLabel = 'Эировун типи'
      FieldName = 'DESCRIPTION'
      Size = 64
    end
    object MISDataPLEDGEPRICE: TFloatField
      DisplayLabel = 'Эировун дяйяри'
      FieldName = 'PLEDGEPRICE'
      Required = True
    end
    object MISDataPURPOSEOFCREDIT: TStringField
      DisplayLabel = 'Тяйинат'
      FieldName = 'PURPOSEOFCREDIT'
      Size = 128
    end
    object MISDataPLEDGENAME: TStringField
      DisplayLabel = 'Эировун ады'
      FieldName = 'PLEDGENAME'
      Size = 128
    end
    object MISDataHOLDERNAME: TStringField
      DisplayLabel = 'Эирову сахлайан шяхс'
      FieldName = 'HOLDERNAME'
      Size = 128
    end
    object MISDataREGISTRYNO: TStringField
      DisplayLabel = 'Эировун гейдийат нюмряси'
      FieldName = 'REGISTRYNO'
      Size = 32
    end
    object MISDataBOOROWERID: TStringField
      DisplayLabel = 'Мцштяринин ЙД-си'
      FieldName = 'BOOROWERID'
      Size = 32
    end
    object MISDataADDRESS: TStringField
      DisplayLabel = 'Цнваны'
      FieldName = 'ADDRESS'
      Size = 128
    end
    object MISDataANYINFOTODISTING: TStringField
      DisplayLabel = 'Эирову фяргляндирян щяр-щансы яламят'
      FieldName = 'ANYINFOTODISTING'
      Size = 128
    end
    object MISDataREGISTRYAGENCY: TStringField
      DisplayLabel = 'Гейдийатдан кечян орган'
      FieldName = 'REGISTRYAGENCY'
      Size = 64
    end
    object MISDataREGISTRYDATE: TDateTimeField
      DisplayLabel = 'Гейдийат тарихи'
      FieldName = 'REGISTRYDATE'
    end
    object MISDataINSURANCEAGENCY: TStringField
      DisplayLabel = 'Сыьорта едян'
      FieldName = 'INSURANCEAGENCY'
      Required = True
      Size = 90
    end
    object MISDataINSURANCEAMOUNT: TFloatField
      DisplayLabel = 'Сыьортанын мябляьи'
      FieldName = 'INSURANCEAMOUNT'
    end
    object MISDataINSURANCEDATE: TDateTimeField
      DisplayLabel = 'Сыьорта тарихи'
      FieldName = 'INSURANCEDATE'
    end
    object MISDataPHONENUMBER: TStringField
      DisplayLabel = 'Телефон'
      FieldName = 'PHONENUMBER'
      Size = 255
    end
    object MISDataANNUALYPENALTYRATE: TFloatField
      DisplayLabel = 'Жяримя %'
      FieldName = 'ANNUALYPENALTYRATE'
      Required = True
    end
    object MISDataPENALTYREST: TFloatField
      DisplayLabel = 'Жяримя'
      FieldName = 'PENALTYREST'
    end
    object MISDataEKPEN: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'EKPEN'
    end
    object MISDataSTOPCALCDATE: TDateTimeField
      DisplayLabel = 'Щесаблама нын дайандырылма тарихи'
      FieldName = 'STOPCALCDATE'
    end
    object MISDataLASTINTPAYDATE: TDateTimeField
      DisplayLabel = 'Фаиз боржу цзря сон ямялиййат тарихи'
      FieldName = 'LASTINTPAYDATE'
    end
    object MISDataLASTMAINPAYDATE: TDateTimeField
      DisplayLabel = 'Ясас борж цзря сон ямялиййат тарихи'
      FieldName = 'LASTMAINPAYDATE'
    end
    object MISDataPAYMENTDATEOFREPORTDAT: TDateTimeField
      DisplayLabel = 'Юдяниш тарихи'
      FieldName = 'PAYMENTDATEOFREPORTDAT'
    end
    object MISDataPRINCIPAL: TFloatField
      DisplayLabel = 'Я.Б цзря прагноз'
      FieldName = 'PRINCIPAL'
    end
    object MISDataINTEREST: TFloatField
      DisplayLabel = 'Фаиз цзря прагноз'
      FieldName = 'INTEREST'
    end
    object MISDataPSNAME: TStringField
      DisplayLabel = 'Эировун чешиди'
      FieldName = 'PSNAME'
      Required = True
      Size = 80
    end
    object MISDataDESCRIPTION_1: TStringField
      DisplayLabel = 'Катеьорийа'
      FieldName = 'DESCRIPTION_1'
      Size = 64
    end
    object MISDataINTCALCMETHOD: TFloatField
      DisplayLabel = 'Щесаблама гайдасы'
      FieldName = 'INTCALCMETHOD'
    end
    object MISDataBRANCHID: TFloatField
      DisplayLabel = 'Филиалын коду'
      FieldName = 'BRANCHID'
      Required = True
    end
    object MISDataMONTHPAY: TFloatField
      DisplayLabel = 'айлыг юдяниш'
      FieldName = 'MONTHPAY'
    end
    object MISDataMONTHLYPROFIT: TFloatField
      DisplayLabel = 'Эялири'
      FieldName = 'MONTHLYPROFIT'
    end
    object MISDataUGR: TStringField
      DisplayLabel = 'Банклар'
      FieldName = 'UGR'
      Size = 255
    end
    object MISDataBUILDNAME: TStringField
      DisplayLabel = 'Тикинти ширкитинин ады'
      FieldName = 'BUILDNAME'
      Size = 50
    end
    object MISDataPROFITNAME: TStringField
      DisplayLabel = 'Файда ялдя едян'
      FieldName = 'PROFITNAME'
      Size = 50
    end
    object MISDataREISTERNAME: TStringField
      DisplayLabel = 'Реистер'
      FieldName = 'REISTERNAME'
      Size = 50
    end
    object MISDataALEVPREDCOST: TFloatField
      DisplayLabel = 'Алнан евин дяйяри'
      FieldName = 'ALEVPREDCOST'
      DisplayFormat = '#,##0.00'
    end
    object MISDataNEWFINANCEAMOUNT: TFloatField
      DisplayLabel = 'Кредитин мябляьи'
      FieldName = 'NEWFINANCEAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object MISDataKREDITev: TFloatField
      DisplayLabel = 'Кредитин алынан евя нисбяти'
      FieldKind = fkCalculated
      FieldName = 'KREDIT/ev'
      DisplayFormat = '#,##0.00%'
      Calculated = True
    end
    object MISDatakregirov: TFloatField
      DisplayLabel = 'Кредитин ипотека предментиня нисбяти'
      FieldKind = fkCalculated
      FieldName = 'kre/girov'
      DisplayFormat = '#,##0.00%'
      Calculated = True
    end
    object MISDataannutetgelir: TFloatField
      FieldKind = fkCalculated
      FieldName = 'annutet/gelir'
      DisplayFormat = '#,##0.00%'
      Calculated = True
    end
    object MISDataPLEDGEPRICEEVKV: TFloatField
      FieldName = 'PLEDGEPRICEEVKV'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
  end
  object DSSReserves: TDataSource
    DataSet = SReserves
    Left = 312
    Top = 140
  end
  object SReserves: TOracleDataSet
    SQL.Strings = (
      'SELECT id, percent, description'
      '  FROM cm_reserves'
      'ORDER BY percent')
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    OnCalcFields = SReservesCalcFields
    Left = 304
    Top = 82
    object SReservesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object SReservesPERCENT: TFloatField
      FieldName = 'PERCENT'
      Required = True
    end
    object SReservesDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Required = True
      Size = 64
    end
    object SReservesFULLDESC: TStringField
      FieldKind = fkCalculated
      FieldName = 'FULLDESC'
      Size = 255
      Calculated = True
    end
  end
  object Pledges: TOracleDataSet
    SQL.Strings = (
      'SELECT id,  description'
      '  FROM cm_pledges')
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 32
    Top = 80
  end
  object DSPledges: TDataSource
    DataSet = Pledges
    Left = 32
    Top = 132
  end
  object DSPReserves: TDataSource
    DataSet = PReserves
    Left = 33
    Top = 259
  end
  object PReserves: TOracleDataSet
    SQL.Strings = (
      'SELECT id, percent, description'
      '  FROM cm_reserves'
      'ORDER BY percent')
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    OnCalcFields = SReservesCalcFields
    Left = 33
    Top = 195
    object PReservesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object PReservesPERCENT: TFloatField
      FieldName = 'PERCENT'
      Required = True
    end
    object PReservesDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Required = True
      Size = 64
    end
    object PReservesFULLDESC: TStringField
      FieldKind = fkCalculated
      FieldName = 'FULLDESC'
      Size = 255
      Calculated = True
    end
  end
  object DSCreditTypes: TDataSource
    DataSet = CreditTypes
    Left = 25
    Top = 369
  end
  object CreditTypes: TOracleDataSet
    SQL.Strings = (
      'SELECT id,  description'
      '  FROM cm_credittypes')
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 25
    Top = 321
  end
  object Persons: TOracleDataSet
    SQL.Strings = (
      'SELECT id,  descripion'
      '  FROM cm_persons')
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 105
    Top = 320
  end
  object DSPersons: TDataSource
    DataSet = Persons
    Left = 97
    Top = 376
  end
  object UsrGrpDataSet: TOracleDataSet
    SQL.Strings = (
      '  SELECT id, description'
      '    FROM creditsmgr.cm_usergroups')
    Session = CMDataModule.CMSession
    Left = 112
    Top = 200
  end
  object srcUsrGrp: TDataSource
    DataSet = UsrGrpDataSet
    Left = 112
    Top = 256
  end
  object srcValute: TDataSource
    DataSet = ValuteDataSet
    Left = 200
    Top = 256
  end
  object ValuteDataSet: TOracleDataSet
    SQL.Strings = (
      '  SELECT VALUTE, VALU_NAME'
      '    FROM SMART.AVALUTE'
      'ORDER BY VALUTE')
    Session = CMDataModule.CMSession
    Left = 200
    Top = 200
  end
  object srcPersonelType: TDataSource
    DataSet = PersonelTypeDataSet
    Left = 200
    Top = 136
  end
  object PersonelTypeDataSet: TOracleDataSet
    SQL.Strings = (
      ''
      'SELECT id, description'
      '  FROM creditsmgr.cm_categories')
    Session = CMDataModule.CMSession
    Left = 200
    Top = 80
  end
  object srcBranch: TDataSource
    DataSet = BranchDataSet
    Left = 104
    Top = 136
  end
  object BranchDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT id, name'
      '  FROM sb_filial')
    Session = CMDataModule.CMSession
    Left = 104
    Top = 80
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select  '
      '     p.id ,'
      '     p.numberofcredit,'
      '     p.creditlineamount,                                  '
      
        '     p.annualyinterestrate,                                     ' +
        '     '
      
        '     p.dateofconclusion ,                                       ' +
        '     '
      
        '     p.duedatefirstcontract,                                    ' +
        '  '
      
        '     p.duedatelastcontract,                                     ' +
        '  '
      
        '     p.purposeofcredit,                                         ' +
        '  '
      '     p.annualypenaltyrate, '
      '     p.intcalcmethod ,'
      '     p.branchid,'
      '     cat.description, '
      '     h.rest,'
      '     h.rest*o.ostat  AS ekrest,'
      '     h.interestrest ,'
      '     h.interestrest*o.ostat AS ekint,'
      '     h.duerest,'
      '     h.duerest*o.ostat AS ekduerest,'
      '     h.dueinterestrest,'
      '     h.dueinterestrest*o.ostat as ekdueint,'
      '     h.penaltyrest ,                 '
      '     h.penaltyrest*o.ostat as ekpen,'
      '     h.givenamount ,'
      '     h.givenamount *o.ostat as  ekgivenamount,'
      '     h.pledgeprice,'
      '     h.stopcalcdate,'
      '     e1.percent,'
      '     e2.percent as duepercent,'
      '     acc.acc_no as contractaccno,'
      '     substr(acc.acc_no,0,4) as balaccno,'
      '     intacc.acc_no as interestaccno,'
      '     resacc.acc_no as reserveaccno,'
      '     dueacc.acc_no as duecontractaccno,'
      '     dueintacc.acc_no as dueinterestaccno,'
      '     dueresacc.acc_no as duereserveaccno ,'
      '     booroweracc.acc_no as booroweraccno,'
      '     boorowerrest.ostat as boorrest,'
      '     av.val_name,'
      '     l.name,'
      '     LastintPaydate.paydat as lastintpaydate ,'
      '     LastMainPaydate.paydat as lastmainpaydate ,'
      
        '    -- cm_common.get_lastintpaydate (p.ID, '#39'26-mar-08'#39') as lasti' +
        'ntpaydate,'
      
        '    -- cm_common.get_lastmainpaydate (p.ID, '#39'26-mar-08'#39') as last' +
        'mainpaydate,'
      #9' restpr.principal ,'
      #9' restpr.interest,'
      #9' Paydat.paymentdate as  paymentdateofReportDat,'
      '     g.pledgename, '
      #9' g.holdername, '
      #9'   g.registryno,'
      '       g.anyinfotodisting                '
      '                         ,'
      '       g.registryagency                             '
      '                       ,'
      '       g.registrydate                                      '
      '                     ,'
      '       g.insuranceamount                                 '
      '                        ,'
      '       g.insurancedate , '
      '       g.insuranceagency,                                   '
      '       l.boorowerid, '
      '       l.address, '
      '       l.phonenumber,'#9' '
      '       pl.description,'
      '       ps.name as psname,'
      '       crdtypes.DESCRIPTION as credittype /*,'
      '       ins.name as  insuranceagency*/'
      'from cm_portfolio p,'
      '     cm_history h,'
      '     cm_categories cat,'
      '     cm_boorowerinfo l,'
      '     cm_guarantee g,'
      '     --cm_insuranceagency ins,'
      '     cm_pledges pl,'
      '     cm_pledgsorts ps,'
      '     sb_avalute av,'
      '     sb_operkurs o,'
      '     cm_credittypes crdtypes, '
      '   cm_loanaccounts acc,'
      '   cm_intaccounts intacc,'
      '   cm_reserveaccounts resacc,'
      '   cm_dueloanaccounts dueacc ,'
      '   cm_dueintaccounts dueintacc ,'
      '   cm_dueresaccounts dueresacc  ,'
      '   cm_booroweraccounts booroweracc,'
      '   cm_boorowerrest boorowerrest,'
      '   cm_reserve_types e1,'
      '   cm_reserve_types e2 ,'
      ''
      '(SELECT 0 AS principal,0 AS interest, creditid'
      '  FROM (SELECT ID AS creditid'
      '          FROM cm_portfolio'
      '        MINUS'
      '        SELECT creditid'
      '          FROM cm_payment_schedule'
      '         WHERE paymentdate BETWEEN to_date('#39'26-mar-08'#39')'
      '                               AND to_date('#39'26-mar-08'#39'))'
      'UNION'
      'SELECT sum(principal),sum(interest), creditid'
      '  FROM cm_payment_schedule'
      ' WHERE paymentdate BETWEEN to_date('#39'26-mar-08'#39')'
      '                       AND to_date('#39'26-mar-08'#39')'
      #9#9#9#9#9'   group by creditid) restpr,'
      '                       '
      '      ((select '
      '          id as creditid,'
      '          null as paydat'
      '        from cm_portfolio'
      '       minus'
      '       select '
      '       creditid ,'
      '       null as paydat from cm_payments'
      '      where PAYEDINTAMT<>0  '
      '      and PAYDATE <= '#39'26-mar-08'#39
      '      group by creditid)'
      '      union'
      '      select '
      '       creditid ,'
      '       max(PAYDATE) as paydat from cm_payments'
      '      where PAYEDINTAMT<>0  '
      '      and PAYDATE <= '#39'26-mar-08'#39
      '      group by creditid) LastintPaydate,'
      ''
      '     '
      '      ((select '
      '          id as creditid,'
      '          null as paydat'
      '        from cm_portfolio'
      '       minus'
      '       select '
      '       creditid ,'
      '       null as paydat from cm_payments'
      '      where payedamt<>0  '
      '      and PAYDATE <= '#39'26-mar-08'#39
      '      group by creditid)'
      '      union'
      '      select '
      '       creditid ,'
      '       max(PAYDATE) as paydat from cm_payments'
      '      where payedamt<>0  '
      '      and PAYDATE <= '#39'26-mar-08'#39
      '      group by creditid) LastMainPaydate ,'
      #9'  '
      ''
      '(SELECT creditid, NULL AS paymentdate'
      '  FROM (SELECT ID AS creditid'
      '          FROM cm_portfolio'
      '        MINUS'
      '        SELECT   creditid'
      '            FROM cm_payment_schedule'
      '           WHERE paymentdate BETWEEN TO_DATE (   '#39'01'#39
      '                                              || '#39'-'#39
      
        '                                              || TO_CHAR (TO_DAT' +
        'E ('#39'26-mar-08'#39'),'
      '                                                          '#39'MON'#39
      '                                                         )'
      '                                              || '#39'-'#39
      
        '                                              || TO_CHAR (TO_DAT' +
        'E ('#39'26-mar-08'#39'),'
      '                                                          '#39'YYYY'#39
      '                                                         )'
      '                                             )'
      
        '                                 AND LAST_DAY (TO_DATE ('#39'26-mar-' +
        '08'#39'))'
      '        GROUP BY creditid)'
      'UNION'
      'SELECT creditid, MIN (paymentdate) AS paymentdate'
      '  FROM cm_payment_schedule'
      ' WHERE paymentdate BETWEEN TO_DATE (   '#39'01'#39
      '                                    || '#39'-'#39
      
        '                                    || TO_CHAR (TO_DATE ('#39'26-mar' +
        '-08'#39'), '#39'MON'#39')'
      '                                    || '#39'-'#39
      
        '                                    || TO_CHAR (TO_DATE ('#39'26-mar' +
        '-08'#39'), '#39'YYYY'#39')'
      '                                   )'
      '                       AND LAST_DAY (TO_DATE ('#39'26-mar-08'#39'))'
      #9#9#9#9#9'   group by creditid) Paydat     '
      '        '
      ''
      'where '
      '  h.creditid = p.id '
      '  and e1.id = h.reserveid'
      '  and e2.id = h.duereserveid'
      '  and h.hdate = '#39'26-mar-08'#39
      '  and cat.id = p.customertype'
      '  and p.id = l.creditid'
      '  and p.id = g.creditid'
      '  and pl.id = g.pledgeid'
      '  --and ins.id = g.insuranceagency'
      '  and ps.id = p.pledgsorts'
      '  and crdtypes.id = p.credittype'
      '  and av.valute = p.currency'
      '  and o.dat = '#39'26-mar-08'#39
      '  and o.val_kod = p.currency'
      '  and  p.id = acc.creditid '
      '  and  p.id = intacc.creditid '
      '  and  p.id = resacc.creditid '
      '  and  p.id = dueacc.creditid  '
      '  and  p.id = dueintacc.creditid  '
      '  and  p.id = dueresacc.creditid '
      '  and  p.id = booroweracc.creditid'
      '  and  p.id = boorowerrest.creditid'
      '  and restpr.creditid = p.id '
      '  and LastintPaydate.creditid = p.id'
      '  and LastMainPaydate.creditid = p.id'
      '  and p.id = Paydat.Creditid'
      '  '
      '  AND  ((p.partitionkey=0) or (p.partitionkey=1)) '
      
        '  and  ((h.stopcalcdate is not null)  or (h.stopcalcdate is  nul' +
        'l))  '
      '-- and o.dat= '#39'26-feb-2008'#39
      '-- and (h.rest <> 0 or h.duerest<>0 or h.interestrest<>0)'
      '  --and o.dat= '#39'26-feb-2008'#39
      ' '
      '  '
      '  '
      '  '
      ''
      ''
      '  '
      '     '
      ''
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      040000003B0000000200000049440100000000000E0000004E554D4245524F46
      435245444954010000000000100000004352454449544C494E45414D4F554E54
      01000000000013000000414E4E55414C59494E54455245535452415445010000
      00000010000000444154454F46434F4E434C5553494F4E010000000000140000
      00445545444154454649525354434F4E54524143540100000000001300000044
      5545444154454C415354434F4E54524143540100000000000F00000050555250
      4F53454F4643524544495401000000000012000000414E4E55414C5950454E41
      4C5459524154450100000000000D000000494E5443414C434D4554484F440100
      00000000080000004252414E434849440100000000000B000000444553435249
      5054494F4E010000000000040000005245535401000000000006000000454B52
      4553540100000000000C000000494E5445524553545245535401000000000005
      000000454B494E54010000000000070000004455455245535401000000000009
      000000454B445545524553540100000000000F000000445545494E5445524553
      545245535401000000000008000000454B445545494E540100000000000B0000
      0050454E414C54595245535401000000000005000000454B50454E0100000000
      000B000000474956454E414D4F554E540100000000000D000000454B47495645
      4E414D4F554E540100000000000B000000504C45444745505249434501000000
      00000C00000053544F5043414C43444154450100000000000700000050455243
      454E540100000000000A00000044554550455243454E540100000000000D0000
      00434F4E54524143544143434E4F0100000000000800000042414C4143434E4F
      0100000000000D000000494E5445524553544143434E4F0100000000000C0000
      00524553455256454143434E4F01000000000010000000445545434F4E545241
      43544143434E4F01000000000010000000445545494E5445524553544143434E
      4F0100000000000F000000445545524553455256454143434E4F010000000000
      0D000000424F4F524F5745524143434E4F01000000000008000000424F4F5252
      4553540100000000000800000056414C5F4E414D45010000000000040000004E
      414D450100000000000E0000004C415354494E54504159444154450100000000
      000F0000004C4153544D41494E50415944415445010000000000090000005052
      494E434950414C01000000000008000000494E54455245535401000000000016
      0000005041594D454E54444154454F465245504F52544441540100000000000A
      000000504C454447454E414D450100000000000A000000484F4C4445524E414D
      450100000000000A00000052454749535452594E4F0100000000001000000041
      4E59494E464F544F44495354494E470100000000000E00000052454749535452
      594147454E43590100000000000C000000524547495354525944415445010000
      0000000F000000494E535552414E4345414D4F554E540100000000000D000000
      494E535552414E4345444154450100000000000F000000494E535552414E4345
      4147454E43590100000000000A000000424F4F524F5745524944010000000000
      07000000414444524553530100000000000B00000050484F4E454E554D424552
      0100000000000D0000004445534352495054494F4E5F31010000000000060000
      0050534E414D450100000000000A000000435245444954545950450100000000
      00}
    Session = CMDataModule.CMSession
    Left = 168
    Top = 24
    object OracleDataSet1ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OracleDataSet1NUMBEROFCREDIT: TStringField
      FieldName = 'NUMBEROFCREDIT'
      Required = True
      Size = 32
    end
    object OracleDataSet1CREDITLINEAMOUNT: TFloatField
      FieldName = 'CREDITLINEAMOUNT'
      Required = True
    end
    object OracleDataSet1ANNUALYINTERESTRATE: TFloatField
      FieldName = 'ANNUALYINTERESTRATE'
      Required = True
    end
    object OracleDataSet1DATEOFCONCLUSION: TDateTimeField
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object OracleDataSet1DUEDATEFIRSTCONTRACT: TDateTimeField
      FieldName = 'DUEDATEFIRSTCONTRACT'
      Required = True
    end
    object OracleDataSet1DUEDATELASTCONTRACT: TDateTimeField
      FieldName = 'DUEDATELASTCONTRACT'
    end
    object OracleDataSet1PURPOSEOFCREDIT: TStringField
      FieldName = 'PURPOSEOFCREDIT'
      Size = 128
    end
    object OracleDataSet1ANNUALYPENALTYRATE: TFloatField
      FieldName = 'ANNUALYPENALTYRATE'
      Required = True
    end
    object OracleDataSet1INTCALCMETHOD: TFloatField
      FieldName = 'INTCALCMETHOD'
    end
    object OracleDataSet1BRANCHID: TFloatField
      FieldName = 'BRANCHID'
      Required = True
    end
    object OracleDataSet1DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 128
    end
    object OracleDataSet1REST: TFloatField
      FieldName = 'REST'
      Required = True
    end
    object OracleDataSet1EKREST: TFloatField
      FieldName = 'EKREST'
    end
    object OracleDataSet1INTERESTREST: TFloatField
      FieldName = 'INTERESTREST'
      Required = True
    end
    object OracleDataSet1EKINT: TFloatField
      FieldName = 'EKINT'
    end
    object OracleDataSet1DUEREST: TFloatField
      FieldName = 'DUEREST'
      Required = True
    end
    object OracleDataSet1EKDUEREST: TFloatField
      FieldName = 'EKDUEREST'
    end
    object OracleDataSet1DUEINTERESTREST: TFloatField
      FieldName = 'DUEINTERESTREST'
      Required = True
    end
    object OracleDataSet1EKDUEINT: TFloatField
      FieldName = 'EKDUEINT'
    end
    object OracleDataSet1PENALTYREST: TFloatField
      FieldName = 'PENALTYREST'
    end
    object OracleDataSet1EKPEN: TFloatField
      FieldName = 'EKPEN'
    end
    object OracleDataSet1GIVENAMOUNT: TFloatField
      FieldName = 'GIVENAMOUNT'
      Required = True
    end
    object OracleDataSet1EKGIVENAMOUNT: TFloatField
      FieldName = 'EKGIVENAMOUNT'
    end
    object OracleDataSet1PLEDGEPRICE: TFloatField
      FieldName = 'PLEDGEPRICE'
      Required = True
    end
    object OracleDataSet1STOPCALCDATE: TDateTimeField
      FieldName = 'STOPCALCDATE'
    end
    object OracleDataSet1PERCENT: TFloatField
      FieldName = 'PERCENT'
      Required = True
    end
    object OracleDataSet1DUEPERCENT: TFloatField
      FieldName = 'DUEPERCENT'
      Required = True
    end
    object OracleDataSet1CONTRACTACCNO: TStringField
      FieldName = 'CONTRACTACCNO'
    end
    object OracleDataSet1BALACCNO: TStringField
      FieldName = 'BALACCNO'
      Size = 4
    end
    object OracleDataSet1INTERESTACCNO: TStringField
      FieldName = 'INTERESTACCNO'
    end
    object OracleDataSet1RESERVEACCNO: TStringField
      FieldName = 'RESERVEACCNO'
    end
    object OracleDataSet1DUECONTRACTACCNO: TStringField
      FieldName = 'DUECONTRACTACCNO'
    end
    object OracleDataSet1DUEINTERESTACCNO: TStringField
      FieldName = 'DUEINTERESTACCNO'
    end
    object OracleDataSet1DUERESERVEACCNO: TStringField
      FieldName = 'DUERESERVEACCNO'
    end
    object OracleDataSet1BOOROWERACCNO: TStringField
      FieldName = 'BOOROWERACCNO'
    end
    object OracleDataSet1BOORREST: TFloatField
      FieldName = 'BOORREST'
    end
    object OracleDataSet1VAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object OracleDataSet1NAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object OracleDataSet1LASTINTPAYDATE: TDateTimeField
      FieldName = 'LASTINTPAYDATE'
    end
    object OracleDataSet1LASTMAINPAYDATE: TDateTimeField
      FieldName = 'LASTMAINPAYDATE'
    end
    object OracleDataSet1PRINCIPAL: TFloatField
      FieldName = 'PRINCIPAL'
    end
    object OracleDataSet1INTEREST: TFloatField
      FieldName = 'INTEREST'
    end
    object OracleDataSet1PAYMENTDATEOFREPORTDAT: TDateTimeField
      FieldName = 'PAYMENTDATEOFREPORTDAT'
    end
    object OracleDataSet1PLEDGENAME: TStringField
      FieldName = 'PLEDGENAME'
      Size = 128
    end
    object OracleDataSet1HOLDERNAME: TStringField
      FieldName = 'HOLDERNAME'
      Size = 128
    end
    object OracleDataSet1REGISTRYNO: TStringField
      FieldName = 'REGISTRYNO'
      Size = 32
    end
    object OracleDataSet1ANYINFOTODISTING: TStringField
      FieldName = 'ANYINFOTODISTING'
      Size = 128
    end
    object OracleDataSet1REGISTRYAGENCY: TStringField
      FieldName = 'REGISTRYAGENCY'
      Size = 64
    end
    object OracleDataSet1REGISTRYDATE: TDateTimeField
      FieldName = 'REGISTRYDATE'
    end
    object OracleDataSet1INSURANCEAMOUNT: TFloatField
      FieldName = 'INSURANCEAMOUNT'
    end
    object OracleDataSet1INSURANCEDATE: TDateTimeField
      FieldName = 'INSURANCEDATE'
    end
    object OracleDataSet1INSURANCEAGENCY: TStringField
      FieldName = 'INSURANCEAGENCY'
      Size = 45
    end
    object OracleDataSet1BOOROWERID: TStringField
      FieldName = 'BOOROWERID'
      Size = 32
    end
    object OracleDataSet1ADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 128
    end
    object OracleDataSet1PHONENUMBER: TStringField
      FieldName = 'PHONENUMBER'
      Size = 255
    end
    object OracleDataSet1DESCRIPTION_1: TStringField
      FieldName = 'DESCRIPTION_1'
      Size = 64
    end
    object OracleDataSet1PSNAME: TStringField
      FieldName = 'PSNAME'
      Required = True
      Size = 80
    end
    object OracleDataSet1CREDITTYPE: TStringField
      FieldName = 'CREDITTYPE'
      Size = 128
    end
  end
end
