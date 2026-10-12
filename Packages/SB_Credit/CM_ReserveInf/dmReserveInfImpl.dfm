object dmReserveInf: TdmReserveInf
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 486
  Top = 194
  Height = 480
  Width = 696
  object ReserveInf: TOracleDataSet
    SQL.Strings = (
      'select '
      '   p.numberofcredit,'
      '    lacc.acc_no as loanaccno,'
      '    cust.name,ct.description,f.name filial,'
      '    p.dateofconclusion,'
      '    p.duedatefirstcontract,v.val_name,'
      '    p.duedatelastcontract,psh.odemeli_faiz,'
      
        '    psh.planrest, (select (select name  from cust_quality where ' +
        'id=quality_id) from customers where id=p.BOOROWERID) kefiyet,'
      
        '    h.rest,(h.interestrest-(select cm_common.OutAccountRest_Get(' +
        'outinterestaccid) from cm_accounts'
      
        'where creditid=p.id) )interestrest,(h.interestrest-(select cm_co' +
        'mmon.OutAccountRest_Get(outinterestaccid) from cm_accounts'
      
        'where creditid=p.id) )*ok.ostat as ekv_intrest,h.PENALTYREST,pl.' +
        'name as grovname,'
      
        '    h.rest*ok.ostat as ekrest,h.stopcalcdate,    h.duerest,h.due' +
        'interestrest,h.dueinterestrest*ok.ostat ekgecfaiz,'
      
        '    h.duerest*ok.ostat as ekduerest, g.REGISTRYNO,    h.pledgepr' +
        'ice,h.reserveintrest,'
      
        '    trunc(h.pledgeprice/decode(h.rest*ok.ostat+h.duerest*ok.osta' +
        't,0,1,h.rest*ok.ostat+h.duerest*ok.ostat),2)*100 as pl,'
      
        '    restype.PERCENT as respercent ,duerestype.PERCENT as dueresp' +
        'ercent ,'
      
        '    (h.rest*ok.ostat+h.duerest*ok.ostat)*restype.PERCENT/100  as' +
        ' resostat,p.numberofbankcredit,'
      
        '    restype.description ehname ,duerestype.description gecehname' +
        ' '
      'from'
      '   cm_portfolio p,filial_t f,avalute_t v,'
      '   cm_loanaccounts lacc,'
      '   customers cust,'
      '   cm_history h,cm_credittypes ct,'
      '   cm_reserve_types restype, cm_reserve_types duerestype,'
      '   sb_operkurs ok,cm_pledgsorts pl,cm_guarantee g ,'
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
      'where p.id = lacc.creditid  and'
      '      p.boorowerid = cust.id and'
      '      p.id = h.creditid and'
      '      h.hdate = :dat and '
      '      p.id = psh.creditid and p.branchid=f.id and'
      '      h.reserveid = restype.id and'
      '      h.duereserveid = duerestype.id and'
      '      p.currency = ok.val_kod and'
      '      p.currency = v.valute and'
      
        '      p.CREDITTYPE=ct.id     and g.pledgsorts=pl.id(+) and g.cre' +
        'ditid(+)=p.id  AND '
      '      ok.dat = :dat '
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
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A004400410054000C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000022000000120000004C004F0041004E004100430043004E004F000100
      00000000080000004E0041004D00450001000000000020000000440041005400
      45004F00460043004F004E0043004C005500530049004F004E00010000000000
      2800000044005500450044004100540045004600490052005300540043004F00
      4E00540052004100430054000100000000002600000044005500450044004100
      540045004C0041005300540043004F004E005400520041004300540001000000
      00000800000052004500530054000100000000001600000050004C0045004400
      47004500500052004900430045000100000000001000000050004C0041004E00
      5200450053005400010000000000140000005200450053005000450052004300
      45004E005400010000000000100000005200450053004F005300540041005400
      0100000000000400000050004C000100000000000C00000045004B0052004500
      530054000100000000000E000000440055004500520045005300540001000000
      00001200000045004B0044005500450052004500530054000100000000001600
      00004400450053004300520049005000540049004F004E000100000000001800
      00004F00440045004D0045004C0049005F004600410049005A00010000000000
      1600000045004B0056005F0049004E0054005200450053005400010000000000
      1800000049004E00540045005200450053005400520045005300540001000000
      000016000000500045004E0041004C0054005900520045005300540001000000
      000018000000530054004F005000430041004C00430044004100540045000100
      0000000010000000470052004F0056004E0041004D0045000100000000002400
      00004E0055004D004200450052004F004600420041004E004B00430052004500
      4400490054000100000000001400000052004500470049005300540052005900
      4E004F000100000000001C0000004E0055004D004200450052004F0046004300
      520045004400490054000100000000001C000000520045005300450052005600
      450049004E00540052004500530054000100000000001A000000440055004500
      520045005300500045005200430045004E0054000100000000000E0000004B00
      4500460049005900450054000100000000000C000000450048004E0041004D00
      450001000000000012000000470045004300450048004E0041004D0045000100
      000000001E00000044005500450049004E005400450052004500530054005200
      4500530054000100000000001200000045004B00470045004300460041004900
      5A000100000000000C000000460049004C00490041004C000100000000001000
      0000560041004C005F004E0041004D0045000100000000000A00000043005200
      540049005000010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 63
    Top = 16
    object ReserveInfLOANACCNO: TWideStringField
      DisplayLabel = 'Ssuda hesab '#8470
      FieldName = 'LOANACCNO'
      Required = True
    end
    object ReserveInfFILIAL: TWideStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
      Size = 360
    end
    object ReserveInfPR_NUMBEROFCREDIT: TWideStringField
      DisplayLabel = 'M'#252'qavil'#601' no'
      FieldName = 'NUMBEROFCREDIT'
      Size = 37
    end
    object ReserveInfVAL_NAME: TWideStringField
      DisplayLabel = 'Valyuta'
      FieldName = 'VAL_NAME'
      Size = 160
    end
    object ReserveInfNAME: TWideStringField
      DisplayLabel = 'Borcalan'
      FieldName = 'NAME'
      Size = 90
    end
    object ReserveInfDESCRIPTION: TWideStringField
      DisplayLabel = 'Kreditin tipi'
      FieldName = 'DESCRIPTION'
      Size = 128
    end
    object ReserveInfDATEOFCONCLUSION: TDateTimeField
      DisplayLabel = 'Verilm'#601' tarixi'
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object ReserveInfDUEDATEFIRSTCONTRACT: TDateTimeField
      DisplayLabel = 'Ba'#287'lanma tarixi'
      FieldName = 'DUEDATEFIRSTCONTRACT'
      Required = True
    end
    object ReserveInfDUEDATELASTCONTRACT: TDateTimeField
      DisplayLabel = 'Uzad'#305'lma tarixi'
      FieldName = 'DUEDATELASTCONTRACT'
    end
    object ReserveInfSTOPCALCDATE: TDateTimeField
      DisplayLabel = '% hes dayand'#305'r'#305'lma tarixi'
      FieldName = 'STOPCALCDATE'
    end
    object ReserveInfPLANREST: TFloatField
      DisplayLabel = ' Cari g'#252'n'#601' '#399'.B. '#246'd'#601'm'#601'li borc'
      FieldName = 'PLANREST'
    end
    object ReserveInfODEMELI_FAIZ: TFloatField
      DisplayLabel = 'Cari g'#252'n'#601' F.B. '#246'd'#601'm'#601'li'
      FieldName = 'ODEMELI_FAIZ'
    end
    object ReserveInfREST: TFloatField
      DisplayLabel = #399'.B qal'#305'q'
      FieldName = 'REST'
      Required = True
    end
    object ReserveInfEKREST: TFloatField
      DisplayLabel = 'Ekvivalent'
      FieldName = 'EKREST'
    end
    object ReserveInfINTERESTREST: TFloatField
      DisplayLabel = 'F.B.qal'#305'q'
      FieldName = 'INTERESTREST'
    end
    object ReserveInfEKV_INTREST: TFloatField
      DisplayLabel = 'F.B Ekvivalent'
      FieldName = 'EKV_INTREST'
    end
    object ReserveInfDUEINTERESTREST: TFloatField
      DisplayLabel = 'G.F.B.qal'#305'q'
      FieldName = 'DUEINTERESTREST'
    end
    object ReserveInfEKGECFAIZ: TFloatField
      DisplayLabel = 'G.F.B Ekvivalent'
      FieldName = 'EKGECFAIZ'
    end
    object ReserveInfKEFIYET: TWideStringField
      DisplayLabel = 'Kefiyy'#601't meyar'#305
      FieldName = 'KEFIYET'
      Size = 100
    end
    object ReserveInfGROVNAME: TWideStringField
      DisplayLabel = 'Girovun '#231'e'#351'idi'
      FieldName = 'GROVNAME'
      Size = 160
    end
    object ReserveInfPLEDGEPRICE: TFloatField
      DisplayLabel = 'Girovun d'#601'y'#601'ri'
      FieldName = 'PLEDGEPRICE'
      Required = True
    end
    object ReserveInfPL: TFloatField
      DisplayLabel = 'Girov/'#399'.B.*100'
      FieldName = 'PL'
    end
    object ReserveInfRESPERCENT: TFloatField
      DisplayLabel = #399'sas borc '#252'zr'#601' eh.%'
      FieldName = 'RESPERCENT'
      Required = True
    end
    object ReserveInfEHNAME: TWideStringField
      DisplayLabel = #399'sas t'#601'snifat'
      FieldName = 'EHNAME'
      Size = 256
    end
    object ReserveInfGECEHNAME: TWideStringField
      DisplayLabel = 'Gec '#601'sas tesnifat'
      FieldName = 'GECEHNAME'
      Size = 256
    end
    object ReserveInfRESOSTAT: TFloatField
      DisplayLabel = #399'sas '#252'zr'#601' ehtiyat m'#601'bl'#601#287'i'
      FieldName = 'RESOSTAT'
    end
    object ReserveInfDUERESPERCENT: TFloatField
      DisplayLabel = 'Faiz borc '#252'zr'#601' eh.%'
      FieldName = 'DUERESPERCENT'
    end
    object ReserveInfRESERVEINTREST: TFloatField
      DisplayLabel = 'Faiz '#252'zr'#601' ehtiyat m'#601'bl'#601#287'i'
      FieldName = 'RESERVEINTREST'
    end
  end
  object DatSetValute: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name from avalute')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 256
    Top = 16
    object DatSetValuteVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object DatSetValuteVALU_NAME: TWideStringField
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
    Optimize = False
    Session = sboapiDataModule.SBSession
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
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 257
    Top = 133
    object DatSetPersonsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DatSetPersonsDESCRIPION: TWideStringField
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
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 256
    Top = 200
    object DatSetCategoriesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DatSetCategoriesDESCRIPTION: TWideStringField
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
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 264
    Top = 256
    object DatSetCreditTypesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DatSetCreditTypesDESCRIPTION: TWideStringField
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
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 256
    Top = 304
    object DatSetReservesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DatSetReservesDESCRIPTION: TWideStringField
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
