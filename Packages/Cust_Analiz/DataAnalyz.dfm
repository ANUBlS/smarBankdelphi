object DataModCustAnalyz: TDataModCustAnalyz
  OldCreateOrder = False
  Height = 567
  Width = 949
  object Ods_cust: TOracleDataSet
    SQL.Strings = (
      
        'SELECT id as ID,cust_name as Tam_Adi ,lastname as Soyadi  ,first' +
        'name as Adi,patronymic  as Ata_Adi ,cust_type as Musteri_tipi fr' +
        'om pcust_view p  where id in (select boorowerid from cm_portfoli' +
        'o)'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'order by id'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000600000004000000490044000100000000000E000000540041004D00
      5F004100440049000100000000000C00000053004F0059004100440049000100
      00000000060000004100440049000100000000000E0000004100540041005F00
      410044004900010000000000180000004D005500530054004500520049005F00
      5400490050004900010000000000}
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    AfterScroll = Ods_custAfterScroll
    Left = 40
    Top = 24
    object Ods_custID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object Ods_custTAM_ADI: TWideStringField
      FieldName = 'TAM_ADI'
      Size = 360
    end
    object Ods_custADI: TWideStringField
      FieldName = 'ADI'
      Size = 120
    end
    object Ods_custSOYADI: TWideStringField
      FieldName = 'SOYADI'
      Size = 120
    end
    object Ods_custATA_ADI: TWideStringField
      FieldName = 'ATA_ADI'
      Size = 120
    end
    object Ods_custMUSTERI_TIPI: TFloatField
      FieldName = 'MUSTERI_TIPI'
    end
  end
  object Ods_Custinfo: TOracleDataSet
    SQL.Strings = (
      'select fakt_adress,passport,passp_number,passpin,inn,phone_mob'
      'from pcust_view where id=:v_id')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A0056005F004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      050000000500000016000000460041004B0054005F0041004400520045005300
      530001000000000010000000500041005300530050004F005200540001000000
      000018000000500041005300530050005F004E0055004D004200450052000100
      000000000E0000005000410053005300500049004E0001000000000012000000
      500048004F004E0045005F004D004F004200010000000000}
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 168
  end
  object Ods_zamin: TOracleDataSet
    SQL.Strings = (
      
        'select  guarantorname,zaminadres1,zmpaspyer1,cardid,pincode,guar' +
        'antorid  from cm_guarantor where '
      ''
      'creditid=:v_creditid'
      '')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0056005F004300520045004400490054004900
      4400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000060000001A000000470055004100520041004E0054004F0052004E00
      41004D004500010000000000160000005A0041004D0049004E00410044005200
      450053003100010000000000140000005A004D00500041005300500059004500
      520031000100000000000C000000430041005200440049004400010000000000
      0E000000500049004E0043004F00440045000100000000001600000047005500
      4100520041004E0054004F00520049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 264
    Top = 16
    object Ods_zaminGUARANTORNAME: TWideStringField
      FieldName = 'GUARANTORNAME'
      Size = 256
    end
    object Ods_zaminZAMINADRES1: TWideStringField
      FieldName = 'ZAMINADRES1'
      Size = 320
    end
    object Ods_zaminZMPASPYER1: TWideStringField
      FieldName = 'ZMPASPYER1'
      Size = 320
    end
    object Ods_zaminCARDID: TFloatField
      FieldName = 'CARDID'
    end
    object Ods_zaminPINCODE: TWideStringField
      FieldName = 'PINCODE'
      Size = 28
    end
    object Ods_zaminGUARANTORID: TWideStringField
      FieldName = 'GUARANTORID'
      Size = 256
    end
  end
  object Ods_girov: TOracleDataSet
    SQL.Strings = (
      'select g.pledgename,g.pledgeprice,anyinfotodisting,cardid,'
      
        '(select description from cm_pledges where g. pledgeid=id) as ple' +
        'dges_name ,'
      
        '(select name from cm_pledgsorts where g. pledgsorts=id) as pledg' +
        'sorts_name  from cm_guarantee_credit g where '
      'g.creditid=:v_creditid')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0056005F004300520045004400490054004900
      4400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000060000001400000050004C0045004400470045004E0041004D004500
      0100000000001600000050004C00450044004700450050005200490043004500
      0100000000001800000050004C00450044004700450053005F004E0041004D00
      45000100000000001E00000050004C0045004400470053004F00520054005300
      5F004E0041004D0045000100000000002000000041004E00590049004E004600
      4F0054004F00440049005300540049004E0047000100000000000C0000004300
      41005200440049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 256
    Top = 144
  end
  object Ods_sedule: TOracleDataSet
    SQL.Strings = (
      
        'select Rownum as NO,p.*,(p.PRINCIPAL+p.INTEREST) as TOTALPAY fro' +
        'm cm_payment_schedule p where creditid=:v_creditid')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0056005F004300520045004400490054004900
      4400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000A000000040000004900440001000000000010000000430052004500
      44004900540049004400010000000000160000005000410059004D0045004E00
      54004400410054004500010000000000120000005000520049004E0043004900
      500041004C000100000000001000000049004E00540045005200450053005400
      010000000000120000004F00540048004500520043004F005300540001000000
      0000080000005200450053005400010000000000140000004300480041004E00
      4300450044004100540045000100000000001000000054004F00540041004C00
      500041005900010000000000040000004E004F00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 376
    Top = 24
    object Ods_seduleNO: TFloatField
      FieldName = 'NO'
    end
    object Ods_sedulePAYMENTDATE: TDateTimeField
      FieldName = 'PAYMENTDATE'
    end
    object Ods_sedulePRINCIPAL: TFloatField
      FieldName = 'PRINCIPAL'
    end
    object Ods_seduleINTEREST: TFloatField
      FieldName = 'INTEREST'
    end
    object Ods_seduleREST: TFloatField
      FieldName = 'REST'
    end
    object Ods_seduleTOTALPAY: TFloatField
      FieldName = 'TOTALPAY'
    end
  end
  object Dsrc_cust: TDataSource
    DataSet = Ods_cust
    Left = 40
    Top = 88
  end
  object Dsrc_portfol: TDataSource
    DataSet = Ods_portfol
    Left = 136
    Top = 88
  end
  object Dsrc_custinfo: TDataSource
    DataSet = Ods_Custinfo
    Left = 48
    Top = 240
  end
  object Dsrc_zamin: TDataSource
    DataSet = Ods_zamin
    Left = 264
    Top = 72
  end
  object Dsrc_girov: TDataSource
    DataSet = Ods_girov
    Left = 248
    Top = 208
  end
  object dsrc_sedule: TDataSource
    DataSet = Ods_sedule
    Left = 376
    Top = 96
  end
  object Ods_portfol: TOracleDataSet
    SQL.Strings = (
      
        'select p.id,p.dateofconclusion,p.numberofcredit,p.duedatefirstco' +
        'ntract,p.initialamount,p.annualyinterestrate,p.periodcontracts,'
      
        'e.name as mutexsis,u.description as  maliye,a.name as verilme_me' +
        'qsed,'
      
        'h.rest,h.interestrest,h.duerest,h.dueinterestrest,h.penaltyrest,' +
        'p.closedate,h.stopcalcdate,'
      
        'pay.payedamt,pay.payedintamt,pay.payeddueamt,pay.payeddueintamt,' +
        'pay.payedpenaltyamt,'
      
        'payshed.principal,payshed.interest,(payshed.principal+payshed.in' +
        'terest)as ayod_cem,'
      'cm_utils.Get_Gecgun(p.id,(sbop.get_date))as gec_gun'
      
        ' from cm_portfolio p,cm_curr_state h,  cm_expert e, cm_usergroup' +
        's u ,cm_aim_cred a,'
      
        ' (select creditid,sum(payedamt) payedamt,sum(payedintamt) payedi' +
        'ntamt,sum(payeddueamt)payeddueamt,sum(payeddueintamt)payeddueint' +
        'amt,sum(payedpenaltyamt)payedpenaltyamt from cm_payments'
      'group by creditid) pay,'
      
        '(select creditid,sum(principal) principal,sum(interest) interest' +
        ' from cm_payment_schedule where paymentdate BETWEEN TRUNC(sbop.g' +
        'et_date, '#39'MONTH'#39') and LAST_DAY(sbop.get_date)'
      'group by creditid) payshed'
      ' where p.id=h.creditid(+) '
      '  and p.expertid=e.id(+)'
      '  and p.usrgroup=u.id(+)'
      '  and p.id=pay.creditid(+)'
      '  and p.id=payshed.creditid(+)'
      '  and p.aim_id=a.id(+)'
      ' and boorowerid=:v_boorowerid ')
    Optimize = False
    Variables.Data = {
      04000000010000001A0000003A0056005F0042004F004F0052004F0057004500
      520049004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001A000000040000004900440001000000000020000000440041005400
      45004F00460043004F004E0043004C005500530049004F004E00010000000000
      1C0000004E0055004D004200450052004F004600430052004500440049005400
      0100000000002800000044005500450044004100540045004600490052005300
      540043004F004E00540052004100430054000100000000001A00000049004E00
      49005400490041004C0041004D004F0055004E00540001000000000008000000
      52004500530054000100000000001800000049004E0054004500520045005300
      540052004500530054000100000000000E000000440055004500520045005300
      54000100000000001E00000044005500450049004E0054004500520045005300
      5400520045005300540001000000000010000000500041005900450044004100
      4D005400010000000000160000005000410059004500440049004E0054004100
      4D00540001000000000016000000500041005900450044004400550045004100
      4D0054000100000000001C000000500041005900450044004400550045004900
      4E00540041004D0054000100000000001E000000500041005900450044005000
      45004E0041004C005400590041004D0054000100000000001200000050005200
      49004E0043004900500041004C000100000000001000000049004E0054004500
      52004500530054000100000000002600000041004E004E00550041004C005900
      49004E0054004500520045005300540052004100540045000100000000001E00
      000050004500520049004F00440043004F004E00540052004100430054005300
      010000000000100000004D005500540045005800530049005300010000000000
      0C0000004D0041004C004900590045000100000000001C000000560045005200
      49004C004D0045005F004D004500510053004500440001000000000010000000
      410059004F0044005F00430045004D000100000000000E000000470045004300
      5F00470055004E0001000000000016000000500045004E0041004C0054005900
      52004500530054000100000000001200000043004C004F005300450044004100
      5400450001000000000018000000530054004F005000430041004C0043004400
      410054004500010000000000}
    Session = sboapiDataModule.SBSession
    AfterScroll = Ods_portfolAfterScroll
    Left = 136
    Top = 24
    object Ods_portfolID: TFloatField
      FieldName = 'ID'
    end
    object Ods_portfolDATEOFCONCLUSION: TDateTimeField
      FieldName = 'DATEOFCONCLUSION'
    end
    object Ods_portfolNUMBEROFCREDIT: TWideStringField
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object Ods_portfolDUEDATEFIRSTCONTRACT: TDateTimeField
      FieldName = 'DUEDATEFIRSTCONTRACT'
    end
    object Ods_portfolINITIALAMOUNT: TFloatField
      FieldName = 'INITIALAMOUNT'
    end
    object Ods_portfolANNUALYINTERESTRATE: TFloatField
      FieldName = 'ANNUALYINTERESTRATE'
    end
    object Ods_portfolPERIODCONTRACTS: TFloatField
      FieldName = 'PERIODCONTRACTS'
    end
    object Ods_portfolMUTEXSIS: TWideStringField
      FieldName = 'MUTEXSIS'
      Size = 320
    end
    object Ods_portfolMALIYE: TWideStringField
      FieldName = 'MALIYE'
      Size = 256
    end
    object Ods_portfolVERILME_MEQSED: TWideStringField
      FieldName = 'VERILME_MEQSED'
      Size = 256
    end
    object Ods_portfolREST: TFloatField
      FieldName = 'REST'
    end
    object Ods_portfolINTERESTREST: TFloatField
      FieldName = 'INTERESTREST'
    end
    object Ods_portfolDUEREST: TFloatField
      FieldName = 'DUEREST'
    end
    object Ods_portfolDUEINTERESTREST: TFloatField
      FieldName = 'DUEINTERESTREST'
    end
    object Ods_portfolPAYEDAMT: TFloatField
      FieldName = 'PAYEDAMT'
    end
    object Ods_portfolPAYEDINTAMT: TFloatField
      FieldName = 'PAYEDINTAMT'
    end
    object Ods_portfolPAYEDDUEAMT: TFloatField
      FieldName = 'PAYEDDUEAMT'
    end
    object Ods_portfolPAYEDDUEINTAMT: TFloatField
      FieldName = 'PAYEDDUEINTAMT'
    end
    object Ods_portfolPAYEDPENALTYAMT: TFloatField
      FieldName = 'PAYEDPENALTYAMT'
    end
    object Ods_portfolPRINCIPAL: TFloatField
      FieldName = 'PRINCIPAL'
    end
    object Ods_portfolINTEREST: TFloatField
      FieldName = 'INTEREST'
    end
    object Ods_portfolAYOD_CEM: TFloatField
      FieldName = 'AYOD_CEM'
    end
    object Ods_portfolGEC_GUN: TFloatField
      FieldName = 'GEC_GUN'
    end
    object Ods_portfolPENALTYREST: TFloatField
      FieldName = 'PENALTYREST'
    end
    object Ods_portfolCLOSEDATE: TDateTimeField
      FieldName = 'CLOSEDATE'
    end
    object Ods_portfolSTOPCALCDATE: TDateTimeField
      FieldName = 'STOPCALCDATE'
    end
  end
  object Ods_payments: TOracleDataSet
    SQL.Strings = (
      'select*from cm_payments p where creditid=:v_creditid'
      'ORDER BY PayDate DESC')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0056005F004300520045004400490054004900
      4400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000017000000040000004900440001000000000010000000430052004500
      440049005400490044000100000000000E000000500041005900440041005400
      4500010000000000100000005000410059004500440041004D00540001000000
      0000160000005000410059004500440049004E00540041004D00540001000000
      0000160000005000410059004500440044005500450041004D00540001000000
      00001C0000005000410059004500440044005500450049004E00540041004D00
      54000100000000001E00000050004100590045004400500045004E0041004C00
      5400590041004D0054000100000000000E000000540052004900440041004D00
      540001000000000014000000540052004900440049004E00540041004D005400
      01000000000014000000540052004900440044005500450041004D0054000100
      000000001A000000540052004900440044005500450049004E00540041004D00
      54000100000000001C0000005400520049004400500045004E0041004C005400
      590041004D0054000100000000001E0000005400520049004400500052004900
      4D0052004500530045005200560045000100000000001C000000540052004900
      4400530045004300520045005300450052005600450001000000000022000000
      4F005500540054005200490044004F0042004C00490047004100540049004F00
      4E0001000000000018000000540052004F0042004C0049004700410054004900
      4F004E000100000000001A0000005400520049004E00420041004C0041004E00
      4300450049004400010000000000200000005400520049004E004F0055005400
      420041004C0041004E0043004500490044000100000000001200000054005200
      420041004C0041004E00430045000100000000001200000042004B0041004D00
      4D004F0055004E0054000100000000000A000000490052004500530054000100
      0000000010000000490049004E0054005200450053005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 496
    Top = 24
    object Ods_paymentsPAYDATE: TDateTimeField
      FieldName = 'PAYDATE'
    end
    object Ods_paymentsPAYEDAMT: TFloatField
      FieldName = 'PAYEDAMT'
    end
    object Ods_paymentsPAYEDINTAMT: TFloatField
      FieldName = 'PAYEDINTAMT'
    end
    object Ods_paymentsPAYEDDUEAMT: TFloatField
      FieldName = 'PAYEDDUEAMT'
    end
    object Ods_paymentsPAYEDDUEINTAMT: TFloatField
      FieldName = 'PAYEDDUEINTAMT'
    end
    object Ods_paymentsPAYEDPENALTYAMT: TFloatField
      FieldName = 'PAYEDPENALTYAMT'
    end
    object Ods_paymentsBKAMMOUNT: TFloatField
      FieldName = 'BKAMMOUNT'
    end
    object Ods_paymentsIREST: TFloatField
      FieldName = 'IREST'
    end
    object Ods_paymentsIINTREST: TFloatField
      FieldName = 'IINTREST'
    end
  end
  object Dsrc_payments: TDataSource
    DataSet = Ods_payments
    Left = 504
    Top = 96
  end
end
