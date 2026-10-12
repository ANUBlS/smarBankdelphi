object MISDm: TMISDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 515
  Width = 683
  object MISData: TOracleDataSet
    SQL.Strings = (
      'select  '
      
        '     p.id ,p.komision,p.annualbankrate,us.description usergroup,' +
        ' case when (nvl(duedatelastcontract,duedatefirstcontract)<sbop.g' +
        'et_date) then'
      
        #39'M'#252'qavil'#601'nin vaxti bitib'#39' else '#39#39' end as enddat,resacc.acc_no eb' +
        '_eh_hesab,resacc.rest eh_rest,resacc.facc_no,resacc.frest,'
      
        '     p.numberofcredit,round( MONTHS_BETWEEN(duedatefirstcontract' +
        ',dateofconclusion)) period,/*l.qeyd,*/'
      
        '     p.creditlineamount,p.boorowerid cust_id ,    se.name sex,  ' +
        '                            '
      
        '     p.annualyinterestrate,l.pincode,                           ' +
        '               '
      
        '     p.dateofconclusion,p.dateofgrant ,cm_utils.Get_MainPlanPaym' +
        'ent(p.id,:hdat) gecesas,cm_utils.Get_ExpirePayInt(p.id,:hdat) ge' +
        'cfaiz,                                          '
      
        '     p.duedatefirstcontract, cm_utils.Get_MainPlanPayment(p.id,:' +
        'hdat)*o.ostat gecesas_ek,cm_utils.Get_ExpirePayInt(p.id,:hdat)*o' +
        '.ostat gecfaiz_ek,                                      '
      
        '     p.duedatelastcontract, h.penaltyrest,h.dueday ,            ' +
        '                        '
      
        '     p.purposeofcredit,                                         ' +
        '  '
      
        '     p.annualypenaltyrate,  (SELECT name FROM cm_aim_cred where ' +
        'id=p.aim_id) aim,p.annuty_equal,'
      '     p.intcalcmethod ,'
      
        '     f.name as fliname,(select max(prolongdate)  from cm_prolong' +
        'ations  where creditid=p.id) prdat,'
      '     cat.description cat, '
      '     h.rest,'
      '     h.rest*o.ostat  AS ekrest,'
      '     h.interestrest ,'
      '     h.interestrest*o.ostat AS ekint,'
      '     h.duerest,'
      '     h.duerest*o.ostat AS ekduerest,'
      '     h.dueinterestrest,'
      
        '     h.dueinterestrest*o.ostat as ekdueint,cm_deca.get_custdateo' +
        'fbirth(p.boorowerid)dateofbirth,'
      '     h.penaltyrest ,                 '
      '     h.penaltyrest*o.ostat as ekpen,'
      '     h.givenamount ,'
      '     h.givenamount *o.ostat as  ekgivenamount,'
      '     h.pledgeprice,  '
      
        '     h.stopcalcdate, (SELECT (description) FROM cm_pledges_t whe' +
        're id=p.pledgeid_p)teminatlig,'
      '     e1.percent,'
      '     e2.percent as duepercent,'
      '     acc.acc_no as contractaccno,'
      
        '     substr(acc.acc_no,0,9) as balaccno,(select name from cm_meh' +
        'sul where id=p.mehsulid )mehsul,'
      '     intacc.acc_no as interestaccno,'
      '     pers.descripion musteri_tipi,'
      '     dueacc.acc_no as duecontractaccno,'
      '     dueintacc.acc_no as dueinterestaccno,'
      '     dueresacc.acc_no as duereserveaccno ,'
      
        '   --   abs(cm_common.AccountRest_Get (dueresacc.id)) gelecek_do' +
        'vqaliq,'
      
        '     booroweracc.acc_no as booroweraccno,l.guzesh_dovr, l.odeme_' +
        'period,'
      '     boorowerrest.ostat as boorrest,'
      '     boorowerrest.ostat*o.ostat as eboorrest,'
      '     av.val_name,'
      '     l.name,cui.note,cu.inn,'
      '     LastintPaydate.paydat as lastintpaydate ,'
      '     LastMainPaydate.paydat as lastmainpaydate ,'
      
        '    -- cm_common.get_lastintpaydate (p.ID, :hdat) as lastintpayd' +
        'ate,'
      
        '    -- cm_common.get_lastmainpaydate (p.ID, :hdat) as lastmainpa' +
        'ydate,'
      '     restpr.principal ,'
      '     restpr.interest,'
      '     Paydat.paymentdate as  paymentdateofReportDat,'
      '     g.pledgename, '
      '     g.holdername, '
      '       g.registryno,'
      '       g.anyinfotodisting ,               '
      
        ' l.guarantorname,l.zaminwork1,l.zamintel1,l.guarantorname2,l.zam' +
        'inwork2,l.zamintel2,                       '
      '       g.registryagency,'
      '       g.registrydate, '
      
        '       g.insuranceamount  ,g.insuranceright ,(select sum(payedam' +
        't) from cm_payments where creditid=p.id and paydate=LastMainPayd' +
        'ate.paydat)esas_sonodenish,'
      
        '               (select sum(payedintamt) from cm_payments where c' +
        'reditid=p.id and paydate=LastintPaydate.paydat)faiz_sonodenish, ' +
        '    '
      '       g.insurancedate , g.companydat,gc.name qiymetlendren,'
      '       --g.insuranceagency,                                   '
      '       l.boorowerid, '
      '       l.address, '
      
        '       /*cui.phone_h*/ l.phonenumber as phonenumber,cui.phone_m,' +
        'cui.phone_w, l.salary,     '
      '       pl.description,'
      
        '       ps.name as psname, cm_utils.Get_MainPlanPayment(p.id,sbop' +
        '.get_date) esasdan_gecikdirme,'
      
        '       crdtypes.DESCRIPTION as credittype ,cm_common.get_monthpa' +
        'y(p.id) as monthpay,'
      
        '       ins.name as  insuranceagency,cm_common.get_custMONTHLYPRO' +
        'FIT(p.boorowerid) as MONTHLYPROFIT ,'
      
        '       CM_RPORT.get_cred(p.creditact) as "Borcalanin sektoru",CM' +
        '_RPORT.get_actives(p.activities) as "Borcalanin faliyyeti",cat.d' +
        'escription as "Borcalanin faliyyet novu",'
      
        '       CM_RPORT.get_vid_sob(p.activities_type)as "Mulkiyyet novu' +
        '"/*,p.portfel*/--,cm_credit.expert(p.EXPERTID) expert'
      
        ',get_donr (p.id) donname,(select sum(donorammount) from cm_donor' +
        ' where creditid=p.id) as dammount,'
      
        '(select name from cm_expert where id=p.expertid )expert,round(p.' +
        'initialamount*p.annualbankrate/100,2) as komissya'
      
        'from cm_portfolio p,smart.filial_t f,cm_usergroups us,(select  2' +
        ' as id, '#39'Qadin'#39' as name from dual union select 1 as id,  '#39'Kisi'#39' ' +
        'as name from dual) se,'
      '     cm_history h,customers cu,custinfo cui,'
      '     cm_categories cat,'
      '     cm_boorowerinfo l,'
      '     cm_guarantee g,CM_GUARCOMPANY gc,'
      '     cm_insuranceagency ins,'
      '     cm_pledges pl,cm_persons pers,'
      '     cm_pledgsorts ps,'
      '     avalute av,'
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
      '  '
      '(SELECT 0 AS principal,0 AS interest, creditid'
      '  FROM (SELECT ID AS creditid'
      '          FROM cm_portfolio'
      '        MINUS'
      '        SELECT creditid'
      '          FROM cm_payment_schedule'
      '         WHERE paymentdate BETWEEN to_date(:bdat)'
      '                               AND to_date(:edat))'
      'UNION'
      'SELECT sum(principal),sum(interest), creditid'
      '  FROM cm_payment_schedule'
      ' WHERE paymentdate BETWEEN to_date(:bdat)'
      '                       AND to_date(:edat)'
      '                       group by creditid) restpr,'
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
      '      '
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
      '                       group by creditid) Paydat     '
      '        '
      ''
      'where '
      ' h.creditid = p.id  and f.id=p.branchid  and cui.sex=se.id(+)'
      '  and e1.id(+) = h.reserveid and p.usrgroup=us.id(+)'
      '  and e2.id(+) = h.duereserveid'
      '  and h.hdate = :hdat'
      '  and cat.id(+) = p.customertype'
      '  and p.id = l.creditid(+) and p.personaltype=pers.id(+)'
      '  and p.id = g.creditid(+)'
      '  and pl.id(+) = g.pledgeid'
      '  and g.company=gc.id(+)'
      '  and ins.id(+) = g.insuranceagency'
      '  and ps.id(+) = g.pledgsorts'
      '  and crdtypes.id(+) = p.credittype'
      '  and av.valute = p.currency'
      '  and o.dat = :hdat'
      '  and o.val_kod = p.currency'
      '  and  p.id = acc.creditid(+) '
      '  and  p.id = intacc.creditid(+) '
      '  and  p.id = resacc.creditid(+) '
      '  and  p.id = dueacc.creditid (+) '
      '  and  p.id = dueintacc.creditid (+) '
      '  and  p.id = dueresacc.creditid (+)'
      '  and  p.id = booroweracc.creditid(+)'
      '  and  p.id = boorowerrest.creditid(+)'
      '  and restpr.creditid(+) = p.id '
      '  and LastintPaydate.creditid(+) = p.id'
      '  and LastMainPaydate.creditid(+) = p.id'
      '  and p.id = Paydat.Creditid(+)   and '
      '  p.boorowerid=cu.id(+) and'
      '  p.boorowerid=cui.idcust(+) '
      ''
      ''
      ''
      ''
      '')
    Optimize = False
    Variables.Data = {
      04000000030000000A0000003A0048004400410054000C000000000000000000
      00000A0000003A0042004400410054000C00000000000000000000000A000000
      3A0045004400410054000C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000007200000004000000490044000100000000001C0000004E0055004D00
      4200450052004F00460043005200450044004900540001000000000020000000
      4300520045004400490054004C0049004E00450041004D004F0055004E005400
      0100000000002600000041004E004E00550041004C00590049004E0054004500
      5200450053005400520041005400450001000000000020000000440041005400
      45004F00460043004F004E0043004C005500530049004F004E00010000000000
      2800000044005500450044004100540045004600490052005300540043004F00
      4E00540052004100430054000100000000002600000044005500450044004100
      540045004C0041005300540043004F004E005400520041004300540001000000
      00001E00000050005500520050004F00530045004F0046004300520045004400
      490054000100000000002400000041004E004E00550041004C00590050004500
      4E0041004C005400590052004100540045000100000000001600000044004500
      53004300520049005000540049004F004E000100000000000800000052004500
      530054000100000000000C00000045004B005200450053005400010000000000
      1800000049004E00540045005200450053005400520045005300540001000000
      00000A00000045004B0049004E0054000100000000000E000000440055004500
      52004500530054000100000000001200000045004B0044005500450052004500
      530054000100000000001E00000044005500450049004E005400450052004500
      5300540052004500530054000100000000001000000045004B00440055004500
      49004E00540001000000000016000000500045004E0041004C00540059005200
      4500530054000100000000000A00000045004B00500045004E00010000000000
      1600000047004900560045004E0041004D004F0055004E005400010000000000
      1A00000045004B0047004900560045004E0041004D004F0055004E0054000100
      000000001600000050004C004500440047004500500052004900430045000100
      0000000018000000530054004F005000430041004C0043004400410054004500
      0100000000000E000000500045005200430045004E0054000100000000001400
      0000440055004500500045005200430045004E0054000100000000001A000000
      43004F004E00540052004100430054004100430043004E004F00010000000000
      1A00000049004E005400450052004500530054004100430043004E004F000100
      000000002000000044005500450043004F004E00540052004100430054004100
      430043004E004F000100000000002000000044005500450049004E0054004500
      52004500530054004100430043004E004F000100000000001E00000044005500
      450052004500530045005200560045004100430043004E004F00010000000000
      10000000560041004C005F004E0041004D004500010000000000080000004E00
      41004D0045000100000000001C0000004C0041005300540049004E0054005000
      4100590044004100540045000100000000001E0000004C004100530054004D00
      410049004E005000410059004400410054004500010000000000120000005000
      520049004E0043004900500041004C000100000000001000000049004E005400
      450052004500530054000100000000001400000050004C004500440047004500
      4E0041004D0045000100000000001400000048004F004C004400450052004E00
      41004D0045000100000000001400000052004500470049005300540052005900
      4E004F000100000000002000000041004E00590049004E0046004F0054004F00
      440049005300540049004E0047000100000000001C0000005200450047004900
      53005400520059004100470045004E0043005900010000000000180000005200
      450047004900530054005200590044004100540045000100000000001E000000
      49004E0053005500520041004E004300450041004D004F0055004E0054000100
      000000001E00000049004E0053005500520041004E0043004500410047004500
      4E00430059000100000000001A00000049004E0053005500520041004E004300
      450044004100540045000100000000001400000042004F004F0052004F005700
      45005200490044000100000000000E0000004100440044005200450053005300
      01000000000016000000500048004F004E0045004E0055004D00420045005200
      0100000000000C000000500053004E0041004D0045000100000000001A000000
      49004E005400430041004C0043004D004500540048004F004400010000000000
      10000000420041004C004100430043004E004F000100000000001A0000004200
      4F004F0052004F005700450052004100430043004E004F000100000000001000
      000042004F004F00520052004500530054000100000000002C00000050004100
      59004D0045004E00540044004100540045004F0046005200450050004F005200
      5400440041005400010000000000140000004300520045004400490054005400
      59005000450001000000000012000000450042004F004F005200520045005300
      5400010000000000100000004D004F004E005400480050004100590001000000
      00001A0000004D004F004E00540048004C005900500052004F00460049005400
      0100000000000E00000046004C0049004E0041004D0045000100000000001A00
      0000470055004100520041004E0054004F0052004E0041004D00450001000000
      00000C000000530041004C00410052005900010000000000140000005A004100
      4D0049004E0057004F0052004B003100010000000000120000005A0041004D00
      49004E00540045004C0031000100000000001C00000047005500410052004100
      4E0054004F0052004E0041004D0045003200010000000000140000005A004100
      4D0049004E0057004F0052004B003200010000000000120000005A0041004D00
      49004E00540045004C0032000100000000002400000042006F00720063006100
      6C0061006E0069006E002000730065006B0074006F0072007500010000000000
      2800000042006F007200630061006C0061006E0069006E002000660061006C00
      6900790079006500740069000100000000003000000042006F00720063006100
      6C0061006E0069006E002000660061006C006900790079006500740020006E00
      6F00760075000100000000001C0000004D0075006C006B006900790079006500
      740020006E006F00760075000100000000001C00000049004E00530055005200
      41004E0043004500520049004700480054000100000000000E00000044004F00
      4E004E0041004D00450001000000000010000000440041004D004D004F005500
      4E0054000100000000000C000000450058005000450052005400010000000000
      100000004B004F004D004900530049004F004E00010000000000120000005500
      530045005200470052004F00550050000100000000000C00000045004E004400
      4400410054000100000000001A000000500045004E0041004C00540059005200
      4500530054005F0031000100000000000C00000050004500520049004F004400
      01000000000014000000540045004D0049004E00410054004C00490047000100
      000000001C00000041004E004E00550041004C00420041004E004B0052004100
      540045000100000000000C000000440055004500440041005900010000000000
      06000000410049004D000100000000000C0000004D0045004800530055004C00
      0100000000000E000000500049004E0043004F00440045000100000000001600
      000044004100540045004F004600420049005200540048000100000000001600
      0000470055005A004500530048005F0044004F00560052000100000000001800
      00004F00440045004D0045005F0050004500520049004F004400010000000000
      1E00000045005300410053005F0053004F004E004F00440045004E0049005300
      48000100000000001E0000004600410049005A005F0053004F004E004F004400
      45004E004900530048000100000000000E00000043005500530054005F004900
      44000100000000000A0000005000520044004100540001000000000006000000
      49004E004E00010000000000080000004E004F00540045000100000000000600
      00005300450058000100000000000E0000004700450043004500530041005300
      0100000000000E0000004700450043004600410049005A000100000000001400
      000047004500430045005300410053005F0045004B0001000000000014000000
      4700450043004600410049005A005F0045004B00010000000000100000004B00
      4F004D0049005300530059004100010000000000060000004300410054000100
      000000001400000043004F004D00500041004E00590044004100540001000000
      00001A0000005100490059004D00450054004C0045004E004400520045004E00
      0100000000001800000041004E004E005500540059005F004500510055004100
      4C000100000000000E000000500048004F004E0045005F004D00010000000000
      0E000000500048004F004E0045005F005700010000000000180000004D005500
      530054004500520049005F005400490050004900010000000000160000004400
      4100540045004F0046004700520041004E005400010000000000240000004500
      530041005300440041004E005F0047004500430049004B004400490052004D00
      450001000000000016000000450042005F00450048005F004800450053004100
      42000100000000000E00000046004100430043005F004E004F00010000000000
      0A000000460052004500530054000100000000000E000000450048005F005200
      450053005400010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 8
    object MISDataID: TFloatField
      FieldName = 'ID'
    end
    object MISDataCUST_ID: TFloatField
      DisplayLabel = 'Borcalan'#305'n idsi'
      FieldName = 'CUST_ID'
    end
    object MISDataNUMBEROFCREDIT: TWideStringField
      DisplayLabel = #8470
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object MISDataBALACCNO: TWideStringField
      DisplayLabel = 'Balans'
      FieldName = 'BALACCNO'
      Size = 5
    end
    object MISDataCONTRACTACCNO: TWideStringField
      DisplayLabel = 'Hesab '#8470
      FieldName = 'CONTRACTACCNO'
      Size = 4000
    end
    object MISDataINTERESTACCNO: TWideStringField
      DisplayLabel = 'Faiz hesab  '#8470
      FieldName = 'INTERESTACCNO'
      Size = 4000
    end
    object MISDataDUECONTRACTACCNO: TWideStringField
      DisplayLabel = 'Gecikmi'#351' Ssuda hesab '#8470
      FieldName = 'DUECONTRACTACCNO'
      Size = 4000
    end
    object MISDataDUEINTERESTACCNO: TWideStringField
      DisplayLabel = 'Gecikmi'#351' faiz hesab '#8470
      FieldName = 'DUEINTERESTACCNO'
    end
    object MISDataBOOROWERACCNO: TWideStringField
      DisplayLabel = 'Cari hesab '#8470
      FieldName = 'BOOROWERACCNO'
      Size = 28
    end
    object MISDataBOORREST: TFloatField
      DisplayLabel = 'Qal'#305#287#305
      FieldName = 'BOORREST'
    end
    object MISDataEBOORREST: TFloatField
      DisplayLabel = 'Ekvivalent'
      FieldName = 'EBOORREST'
    end
    object MISDataNAME: TWideStringField
      DisplayLabel = 'Borcalan'
      FieldName = 'NAME'
      Size = 64
    end
    object MISDataMUSTERI_TIPI: TWideStringField
      DisplayLabel = 'M'#252#351't'#601'ri tipi'
      FieldName = 'MUSTERI_TIPI'
      Size = 64
    end
    object MISDataDATEOFBIRTH: TDateTimeField
      DisplayLabel = 'Do'#287'um tarixi'
      FieldName = 'DATEOFBIRTH'
    end
    object MISDataEB_EH_HESAB: TWideStringField
      DisplayLabel = #399'.B ehtiyyat hesab'#305
      FieldName = 'EB_EH_HESAB'
      Size = 4000
    end
    object MISDataEH_REST: TFloatField
      DisplayLabel = 'Qal'#305#287#305
      FieldName = 'EH_REST'
    end
    object MISDataFACC_NO: TWideStringField
      DisplayLabel = 'F.B ehtiyyat hesab'#305
      FieldName = 'FACC_NO'
      Size = 4000
    end
    object MISDataFREST: TFloatField
      DisplayLabel = 'Qal'#305#287#305
      FieldName = 'FREST'
    end
    object MISDataPINCODE: TWideStringField
      FieldName = 'PINCODE'
      Size = 50
    end
    object MISDataINN: TWideStringField
      DisplayLabel = 'V'#214'EN'
      FieldName = 'INN'
      Size = 80
    end
    object MISDataVAL_NAME: TWideStringField
      DisplayLabel = '$'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object MISDataCREDITTYPE: TWideStringField
      DisplayLabel = 'Kreditin tipi'
      FieldName = 'CREDITTYPE'
      Size = 128
    end
    object MISDataDATEOFCONCLUSION: TDateTimeField
      DisplayLabel = 'Verilm'#601' tarixi'
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object MISDataDUEDATEFIRSTCONTRACT: TDateTimeField
      DisplayLabel = 'Ba'#287'lanma tarixi'
      FieldName = 'DUEDATEFIRSTCONTRACT'
      Required = True
    end
    object MISDataPERIOD: TFloatField
      DisplayLabel = 'M'#252'dd'#601't'
      FieldName = 'PERIOD'
    end
    object MISDataPRDAT: TDateTimeField
      DisplayLabel = 'Uzad'#305'lma tarixi'
      FieldName = 'PRDAT'
    end
    object MISDataDUEDATELASTCONTRACT: TDateTimeField
      DisplayLabel = 'Uzad'#305'lma m'#252'dd'#601'ti'
      FieldName = 'DUEDATELASTCONTRACT'
    end
    object MISDataENDDAT: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'ENDDAT'
      Size = 26
    end
    object MISDataCREDITLINEAMOUNT: TFloatField
      DisplayLabel = 'Kreditin m'#601'bl'#601#287'i'
      FieldName = 'CREDITLINEAMOUNT'
      Required = True
    end
    object MISDataANNUALYINTERESTRATE: TFloatField
      DisplayLabel = '%'
      FieldName = 'ANNUALYINTERESTRATE'
      Required = True
    end
    object MISDataREST: TFloatField
      DisplayLabel = 'Qal'#305'q'
      FieldName = 'REST'
      Required = True
    end
    object MISDataEKREST: TFloatField
      DisplayLabel = 'Ekvivalent'
      FieldName = 'EKREST'
    end
    object MISDataINTERESTREST: TFloatField
      DisplayLabel = 'Faiz borcu'
      FieldName = 'INTERESTREST'
      Required = True
    end
    object MISDataEKINT: TFloatField
      DisplayLabel = 'Ekvivalent'
      FieldName = 'EKINT'
    end
    object MISDataGECESAS: TFloatField
      DisplayLabel = #399'sas.B f'#601'rq'
      FieldName = 'GECESAS'
    end
    object MISDataGECESAS_EK: TFloatField
      DisplayLabel = 'Ekvivalent'
      FieldName = 'GECESAS_EK'
    end
    object MISDataGECFAIZ: TFloatField
      DisplayLabel = 'Faiz.B f'#601'rq'
      FieldName = 'GECFAIZ'
    end
    object MISDataGECFAIZ_EK: TFloatField
      DisplayLabel = 'Ekvivalent'
      FieldName = 'GECFAIZ_EK'
    end
    object MISDataESASDAN_GECIKDIRME: TFloatField
      DisplayLabel = #399'sasdan gecikdirilmi'#351' m'#601'b'
      FieldName = 'ESASDAN_GECIKDIRME'
    end
    object MISDataDUEREST: TFloatField
      DisplayLabel = 'Gecikmi'#351' '#601'sas borc qal'#305'q'
      FieldName = 'DUEREST'
      Required = True
    end
    object MISDataEKDUEREST: TFloatField
      DisplayLabel = 'Ekvivalent'
      FieldName = 'EKDUEREST'
    end
    object MISDataDUEINTERESTREST: TFloatField
      DisplayLabel = 'Gecikmi'#351' faiz borcu'
      FieldName = 'DUEINTERESTREST'
      Required = True
    end
    object MISDataEKDUEINT: TFloatField
      DisplayLabel = 'Ekvivalent'
      FieldName = 'EKDUEINT'
    end
    object MISDataPENALTYREST: TFloatField
      DisplayLabel = 'C'#601'rim'#601
      FieldName = 'PENALTYREST'
    end
    object MISDataEKPEN: TFloatField
      DisplayLabel = 'Ekvivalent'
      FieldName = 'EKPEN'
    end
    object MISDataDUEDAY: TFloatField
      DisplayLabel = 'Gecikm'#601' g'#252'n'#252
      FieldName = 'DUEDAY'
    end
    object MISDataGIVENAMOUNT: TFloatField
      DisplayLabel = 'C'#601'mi verilmi'#351' m'#601'bl'#601#287
      FieldName = 'GIVENAMOUNT'
      Required = True
    end
    object MISDataEKGIVENAMOUNT: TFloatField
      DisplayLabel = 'Ekvivalent'
      FieldName = 'EKGIVENAMOUNT'
    end
    object MISDataPERCENT: TFloatField
      DisplayLabel = 'Ehtiyyat %'
      FieldName = 'PERCENT'
      Required = True
    end
    object MISDataDUEPERCENT: TFloatField
      DisplayLabel = 'Gecikmi'#351' ehtiyyat %'
      FieldName = 'DUEPERCENT'
    end
    object MISDataDESCRIPTION: TWideStringField
      DisplayLabel = 'Girovun tipi'
      FieldName = 'DESCRIPTION'
      Size = 64
    end
    object MISDataPLEDGEPRICE: TFloatField
      DisplayLabel = 'Girovun d'#601'y'#601'ri'
      FieldName = 'PLEDGEPRICE'
      Required = True
    end
    object MISDataPURPOSEOFCREDIT: TWideStringField
      DisplayLabel = 'T'#601'yinat'
      FieldName = 'PURPOSEOFCREDIT'
      Size = 128
    end
    object MISDataPLEDGENAME: TWideStringField
      DisplayLabel = 'Girovun ad'#305
      FieldName = 'PLEDGENAME'
      Size = 128
    end
    object MISDataHOLDERNAME: TWideStringField
      DisplayLabel = 'Girovu saxlayan '#351#601'xs'
      FieldName = 'HOLDERNAME'
      Size = 128
    end
    object MISDataBOOROWERID: TWideStringField
      DisplayLabel = 'M'#252#351't'#601'rinin '#304'D-si'
      FieldName = 'BOOROWERID'
      Size = 32
    end
    object MISDataREGISTRYNO: TWideStringField
      DisplayLabel = 'Girovun qyediyyat n'#246'mr'#601'si'
      FieldName = 'REGISTRYNO'
      Size = 32
    end
    object MISDataADDRESS: TWideStringField
      DisplayLabel = #220'nvan'#305
      FieldName = 'ADDRESS'
      Size = 128
    end
    object MISDataANYINFOTODISTING: TWideStringField
      DisplayLabel = 'Girovu f'#601'riql'#601'nir'#601'n hans'#305' m'#601'lumat'
      FieldName = 'ANYINFOTODISTING'
      Size = 128
    end
    object MISDataREGISTRYAGENCY: TWideStringField
      DisplayLabel = 'Qyediyyatdan ke'#231'ir'#601'n orqan'
      FieldName = 'REGISTRYAGENCY'
      Size = 64
    end
    object MISDataREGISTRYDATE: TDateTimeField
      DisplayLabel = 'Qyediyyat tarixi'
      FieldName = 'REGISTRYDATE'
    end
    object MISDataINSURANCEAGENCY: TWideStringField
      DisplayLabel = 'Si'#287'orta ed'#601'n'
      FieldName = 'INSURANCEAGENCY'
      Required = True
      Size = 90
    end
    object MISDataINSURANCEAMOUNT: TFloatField
      DisplayLabel = 'Si'#287'ortan'#305'n m'#601'bl'#601#287'i'
      FieldName = 'INSURANCEAMOUNT'
    end
    object MISDataINSURANCEDATE: TDateTimeField
      DisplayLabel = 'Si'#287'orta tarixi'
      FieldName = 'INSURANCEDATE'
    end
    object MISDataCOMPANYDAT: TDateTimeField
      DisplayLabel = 'Qiym'#601'tl'#601'ndirm'#601' tarixi'
      FieldName = 'COMPANYDAT'
    end
    object MISDataQIYMETLENDREN: TWideStringField
      DisplayLabel = 'Qiym'#601'tl'#601'ndir'#601'n '#351'irk'#601't'
      FieldName = 'QIYMETLENDREN'
      Size = 70
    end
    object MISDataPHONENUMBER: TWideStringField
      DisplayLabel = 'Telefon'
      FieldName = 'PHONENUMBER'
      Size = 255
    end
    object MISDataPHONE_M: TWideStringField
      DisplayLabel = 'Telefon mobil'
      FieldName = 'PHONE_M'
      Size = 100
    end
    object MISDataPHONE_W: TWideStringField
      DisplayLabel = 'Telefon i'#351
      FieldName = 'PHONE_W'
      Size = 100
    end
    object MISDataANNUALYPENALTYRATE: TFloatField
      DisplayLabel = 'C'#601'rim'#601' %'
      FieldName = 'ANNUALYPENALTYRATE'
      Required = True
    end
    object MISDataSTOPCALCDATE: TDateTimeField
      DisplayLabel = 'Hesablaman'#305'n dayand'#305'r'#305'lma tarixi'
      FieldName = 'STOPCALCDATE'
    end
    object MISDataLASTINTPAYDATE: TDateTimeField
      DisplayLabel = 'Faiz borcu '#252'zr'#601' son '#601'm'#601'liyyat tarixi'
      FieldName = 'LASTINTPAYDATE'
    end
    object MISDataFAIZ_SONODENISH: TFloatField
      DisplayLabel = 'Faiz borc son odeni'#351
      FieldName = 'FAIZ_SONODENISH'
    end
    object MISDataLASTMAINPAYDATE: TDateTimeField
      DisplayLabel = #399'sas borc '#252'zr'#601' son '#601'm'#601'liyyat tarixi'
      FieldName = 'LASTMAINPAYDATE'
    end
    object MISDataESAS_SONODENISH: TFloatField
      DisplayLabel = #399'sas borc son '#246'deni'#351
      FieldName = 'ESAS_SONODENISH'
    end
    object MISDataPAYMENTDATEOFREPORTDAT: TDateTimeField
      DisplayLabel = #214'd'#601'ni'#351' tarixi'
      FieldName = 'PAYMENTDATEOFREPORTDAT'
    end
    object MISDataPRINCIPAL: TFloatField
      DisplayLabel = #399'.B '#252'zr'#601' poqnoz'
      FieldName = 'PRINCIPAL'
    end
    object MISDataINTEREST: TFloatField
      DisplayLabel = 'Faiz '#252'zr'#601' proqnoz'
      FieldName = 'INTEREST'
    end
    object MISDataPSNAME: TWideStringField
      DisplayLabel = 'Girovun '#231'e'#351'idi'
      FieldName = 'PSNAME'
      Required = True
      Size = 80
    end
    object MISDataFLINAME: TWideStringField
      DisplayLabel = 'Filial'#305'n ad'#305
      FieldName = 'FLINAME'
      Size = 90
    end
    object MISDataINTCALCMETHOD: TFloatField
      DisplayLabel = 'Hesablama qaydas'#305
      FieldName = 'INTCALCMETHOD'
    end
    object MISDataMONTHPAY: TFloatField
      DisplayLabel = 'Ayl'#305'q '#246'd'#601'ni'#351
      FieldName = 'MONTHPAY'
    end
    object MISDataMONTHLYPROFIT: TFloatField
      DisplayLabel = 'G'#601'liri'
      FieldName = 'MONTHLYPROFIT'
    end
    object MISDataKOMISION: TFloatField
      DisplayLabel = 'Komissiya'
      FieldName = 'KOMISION'
    end
    object MISDataUSERGROUP: TWideStringField
      DisplayLabel = 'Kreditin statusu'
      FieldName = 'USERGROUP'
      Size = 256
    end
    object MISDataSALARY: TWideStringField
      DisplayLabel = #304#351' yeri/ V'#601'zif'#601'si /'#399'm'#601'k haqq'#305
      FieldName = 'SALARY'
      Size = 80
    end
    object MISDataGUARANTORNAME: TWideStringField
      DisplayLabel = '1 Zaminin ad'#305
      FieldName = 'GUARANTORNAME'
      Size = 64
    end
    object MISDataZAMINWORK1: TWideStringField
      DisplayLabel = '1 Zminin i'#351' yeri'
      FieldName = 'ZAMINWORK1'
      Size = 80
    end
    object MISDataZAMINTEL1: TWideStringField
      DisplayLabel = '1 Zamin tel '#8470
      FieldName = 'ZAMINTEL1'
      Size = 30
    end
    object MISDataGUARANTORNAME2: TWideStringField
      DisplayLabel = '2 Zaminin ad'#305
      FieldName = 'GUARANTORNAME2'
      Size = 80
    end
    object MISDataZAMINWORK2: TWideStringField
      DisplayLabel = '2 Zaminin i'#351' yeri'
      FieldName = 'ZAMINWORK2'
      Size = 80
    end
    object MISDataZAMINTEL2: TWideStringField
      DisplayLabel = '2 '#1047#1072#1084#1080#1085#1080#1085'  '#1090#1077#1083' '#8470
      FieldName = 'ZAMINTEL2'
      Size = 30
    end
    object MISDataMulkiyyetnovu: TWideStringField
      FieldName = 'Mulkiyyet novu'
      Size = 4000
    end
    object MISDataBorcalaninsektoru: TWideStringField
      FieldName = 'Borcalanin sektoru'
      Size = 64
    end
    object MISDataBorcalaninfaliyyeti: TWideStringField
      FieldName = 'Borcalanin faliyyeti'
      Size = 64
    end
    object MISDataINSURANCERIGHT: TFloatField
      DisplayLabel = 'Sigorta haqqi'
      FieldName = 'INSURANCERIGHT'
    end
    object MISDataBorcalaninfaliyyetnovu: TWideStringField
      FieldName = 'Borcalanin faliyyet novu'
      Size = 64
    end
    object MISDataDONNAME: TWideStringField
      DisplayLabel = 'Donorlar'#305'n ad'#305
      FieldName = 'DONNAME'
      Size = 4000
    end
    object MISDataDAMMOUNT: TFloatField
      DisplayLabel = 'Donorlar dan ayr'#305'lm'#305#351' m'#601'bl'#601#287
      FieldName = 'DAMMOUNT'
    end
    object MISDataEXPERT: TWideStringField
      DisplayLabel = 'Kredit m'#252't'#601'x'#601'sisi'
      FieldName = 'EXPERT'
      Size = 80
    end
    object MISDataANNUTY_EQUAL: TWideStringField
      DisplayLabel = #214'd'#601'm'#601' formas'#305
      FieldName = 'ANNUTY_EQUAL'
      Size = 50
    end
    object MISDataTEMINATLIG: TWideStringField
      DisplayLabel = 'Kreditin t'#601'minatl'#305#287#305
      FieldName = 'TEMINATLIG'
      Size = 256
    end
    object MISDataANNUALBANKRATE: TFloatField
      DisplayLabel = 'Komissiya faizi'
      FieldName = 'ANNUALBANKRATE'
    end
    object MISDataAIM: TWideStringField
      DisplayLabel = 'Verilm'#601' m'#601'qs'#601'd'
      FieldName = 'AIM'
      Size = 100
    end
    object MISDataMEHSUL: TWideStringField
      DisplayLabel = 'Kredit m'#601'hsulu'
      FieldName = 'MEHSUL'
      Size = 400
    end
    object MISDataGUZESH_DOVR: TFloatField
      DisplayLabel = 'G'#252'z'#601#351't d'#246'vr'#252' ayla'
      FieldName = 'GUZESH_DOVR'
    end
    object MISDataODEME_PERIOD: TWideStringField
      DisplayLabel = #214'd'#601'm'#601' periodu'
      FieldName = 'ODEME_PERIOD'
      Size = 30
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
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000000E000000500045005200
      430045004E005400010000000000160000004400450053004300520049005000
      540049004F004E00010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
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
    object SReservesFULLDESC: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'FULLDESC'
      Size = 255
      Calculated = True
    end
    object SReservesDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 64
    end
  end
  object Pledges: TOracleDataSet
    SQL.Strings = (
      'SELECT id,  description'
      '  FROM cm_pledges')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 64
  end
  object DSPledges: TDataSource
    DataSet = Pledges
    Left = 32
    Top = 116
  end
  object DSPReserves: TDataSource
    DataSet = PReserves
    Left = 25
    Top = 243
  end
  object PReserves: TOracleDataSet
    SQL.Strings = (
      'SELECT id, percent, description'
      '  FROM cm_reserves'
      'ORDER BY percent')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    OnCalcFields = SReservesCalcFields
    Left = 33
    Top = 179
    object PReservesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object PReservesPERCENT: TFloatField
      FieldName = 'PERCENT'
      Required = True
    end
    object PReservesDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Required = True
      Size = 64
    end
    object PReservesFULLDESC: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'FULLDESC'
      Size = 255
      Calculated = True
    end
  end
  object DSCreditTypes: TDataSource
    DataSet = CreditTypes
    Left = 25
    Top = 353
  end
  object CreditTypes: TOracleDataSet
    SQL.Strings = (
      'SELECT id,  description'
      '  FROM cm_credittypes')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 25
    Top = 297
  end
  object Persons: TOracleDataSet
    SQL.Strings = (
      'SELECT id,  descripion'
      '  FROM cm_persons')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
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
      '    FROM smart.cm_usergroups')
    Optimize = False
    Session = sboapiDataModule.SBSession
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
      '    FROM SMART.AVALUTE_t'
      'ORDER BY VALUTE')
    Optimize = False
    Session = sboapiDataModule.SBSession
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
      'SELECT c.id, v.name||'#39'-'#39'||c.description as description'
      '  FROM smart.cm_categories c,'
      '        smart.CM_CREDITCAT cr,'
      '        smart.CM_ACTIVITIES a,'
      '        smart.cm_vid_sob v'
      '   where c.ACT_ID is not null and'
      '   c.act_id=a.id and'
      '   a.act_id=cr.id and'
      '   cr.vid_sob=v.id'
      ''
      '   ')
    Optimize = False
    Session = sboapiDataModule.SBSession
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
      '  FROM filial')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 104
    Top = 80
  end
  object MISData___: TOracleDataSet
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
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000003B00000004000000490044000100000000001C0000004E0055004D00
      4200450052004F00460043005200450044004900540001000000000020000000
      4300520045004400490054004C0049004E00450041004D004F0055004E005400
      0100000000002600000041004E004E00550041004C00590049004E0054004500
      5200450053005400520041005400450001000000000020000000440041005400
      45004F00460043004F004E0043004C005500530049004F004E00010000000000
      2800000044005500450044004100540045004600490052005300540043004F00
      4E00540052004100430054000100000000002600000044005500450044004100
      540045004C0041005300540043004F004E005400520041004300540001000000
      00001E00000050005500520050004F00530045004F0046004300520045004400
      490054000100000000002400000041004E004E00550041004C00590050004500
      4E0041004C005400590052004100540045000100000000001A00000049004E00
      5400430041004C0043004D004500540048004F00440001000000000010000000
      4200520041004E00430048004900440001000000000016000000440045005300
      4300520049005000540049004F004E0001000000000008000000520045005300
      54000100000000000C00000045004B0052004500530054000100000000001800
      000049004E005400450052004500530054005200450053005400010000000000
      0A00000045004B0049004E0054000100000000000E0000004400550045005200
      4500530054000100000000001200000045004B00440055004500520045005300
      54000100000000001E00000044005500450049004E0054004500520045005300
      540052004500530054000100000000001000000045004B004400550045004900
      4E00540001000000000016000000500045004E0041004C005400590052004500
      530054000100000000000A00000045004B00500045004E000100000000001600
      000047004900560045004E0041004D004F0055004E0054000100000000001A00
      000045004B0047004900560045004E0041004D004F0055004E00540001000000
      00001600000050004C0045004400470045005000520049004300450001000000
      000018000000530054004F005000430041004C00430044004100540045000100
      000000000E000000500045005200430045004E00540001000000000014000000
      440055004500500045005200430045004E0054000100000000001A0000004300
      4F004E00540052004100430054004100430043004E004F000100000000001000
      0000420041004C004100430043004E004F000100000000001A00000049004E00
      5400450052004500530054004100430043004E004F0001000000000018000000
      52004500530045005200560045004100430043004E004F000100000000002000
      000044005500450043004F004E00540052004100430054004100430043004E00
      4F000100000000002000000044005500450049004E0054004500520045005300
      54004100430043004E004F000100000000001E00000044005500450052004500
      530045005200560045004100430043004E004F000100000000001A0000004200
      4F004F0052004F005700450052004100430043004E004F000100000000001000
      000042004F004F00520052004500530054000100000000001000000056004100
      4C005F004E0041004D004500010000000000080000004E0041004D0045000100
      000000001C0000004C0041005300540049004E00540050004100590044004100
      540045000100000000001E0000004C004100530054004D00410049004E005000
      410059004400410054004500010000000000120000005000520049004E004300
      4900500041004C000100000000001000000049004E0054004500520045005300
      54000100000000002C0000005000410059004D0045004E005400440041005400
      45004F0046005200450050004F00520054004400410054000100000000001400
      000050004C0045004400470045004E0041004D00450001000000000014000000
      48004F004C004400450052004E0041004D004500010000000000140000005200
      45004700490053005400520059004E004F000100000000002000000041004E00
      590049004E0046004F0054004F00440049005300540049004E00470001000000
      00001C000000520045004700490053005400520059004100470045004E004300
      5900010000000000180000005200450047004900530054005200590044004100
      540045000100000000001E00000049004E0053005500520041004E0043004500
      41004D004F0055004E0054000100000000001A00000049004E00530055005200
      41004E004300450044004100540045000100000000001E00000049004E005300
      5500520041004E00430045004100470045004E00430059000100000000001400
      000042004F004F0052004F00570045005200490044000100000000000E000000
      410044004400520045005300530001000000000016000000500048004F004E00
      45004E0055004D004200450052000100000000001A0000004400450053004300
      520049005000540049004F004E005F0031000100000000000C00000050005300
      4E0041004D004500010000000000140000004300520045004400490054005400
      590050004500010000000000}
    Left = 112
    Top = 16
  end
end
