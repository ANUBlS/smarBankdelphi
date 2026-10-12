object DecaDataModule: TDecaDataModule
  OldCreateOrder = False
  Height = 297
  Width = 696
  object DecaData: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   A.BOOROWERID AS ID,'
      '   A.NAME AS NAME,'
      '   A.COUNTRYCODE AS COUNTRCODE,'
      '   A.BANKRUPTEYSTATUS AS BNKSTATUS,'
      
        '   cm_deca.get_custdateofbirth(b.boorowerid) AS DATOFBIRTH, --do' +
        'gum tarixi'
      
        '   cm_deca.get_custplaceofbirth(b.boorowerid) AS PLACEBIRTH, --d' +
        'ogum yeri'
      '   A.pincode AS PINCODE,'#9#9#9'--pin kod'
      '   A.guarantorid AS GID,'#9'--zamin id'
      '   a.guarantorname AS GNAME,'#9'--zamin ad'
      '   A.guarantorid2 AS GID2,'#9'--zamin id2'
      '   A.guarantorname2 AS GNAME2,'#9'--zamin ad2'
      '   A.guarantorid3 AS GID3,'#9'--zamin id3'
      '   A.guarantorname3 AS GNAME3,'#9'--zamin ad3'
      '   cm_deca.get_credittypes(b.id) CREDITTYPE,'#9'--kreditin tipi'
      
        '   cm_deca.get_lastcreditpayment(b.id) LASTPAYDAT,'#9'--sonuncu ode' +
        'nish tarixi'
      
        '   cm_deca.get_creditpaymentamount(b.id) MPAYAMOUNT,'#9'--ayliq ode' +
        'nish'
      
        '   cm_deca.get_reserveaccountostat(b.id) PROVISION,'#9'--ehtiyyat m' +
        'iqdari'
      '   A.FIRSTOWNERID AS ID2,'
      '   A.FIRSTOWNERNAME AS NAME2,'
      '   A.SECONDOWNERID AS ID3,'
      '   A.SECONDOWNERNAME AS NAME3,'
      '   A.THIRDOWNERID AS ID4,'
      '   A.THIRDOWNERNAME AS NAME4,'
      '   B.ID as InternalID, -- INTERNAL FIELD'
      '   CM_COMMON.AccountNumber_Get(c.LOANACCID) AS ACCOUNTNO ,'
      '   V.VAL_NAME AS CURRENCY,'
      '   cm_deca.get_creditinitialamount(b.id) AS INITIALSUM,'
      '   cm_deca.get_creditlineamount(b.id) AS CRDLINESUM,'
      '   D.REST + D.DUEREST AS DISOUSUM ,'
      '   B.ANNUALYINTERESTRATE AS RATE,'
      '   P.CODE AS PURPOSE,'
      
        '   TRUNC(MONTHS_BETWEEN(B.DUEDATEFIRSTCONTRACT,B.DATEOFCONCLUSIO' +
        'N)) AS PERIODMONT ,'
      '   B.DATEOFCONCLUSION AS DATEGRANT,'
      '   B.DUEDATEFIRSTCONTRACT AS FIRSTCONTR,'
      
        '   DECODE(B.DUEDATELASTCONTRACT,null,B.DUEDATEFIRSTCONTRACT,B.DU' +
        'EDATELASTCONTRACT) AS LASTCONTR,'
      
        '   CM_DECA.DueDaysCount(:HDATE , B.DUEDATEFIRSTCONTRACT,b.id) AS' +
        ' DAYSMAIN ,'
      
        '   CM_DECA.DueDaysCount(:HDATE , B.DUEDATEFIRSTCONTRACT,b.id) AS' +
        ' DAYSINTRST ,'
      '   D.DUEINTERESTREST+D.interestrest AS OIAPERIOD ,'
      
        '   CM_DECA.OiaForLastThreeMonths(:HDATE , B.DUEDATEFIRSTCONTRACT' +
        ',D.DUEINTERESTREST) AS OIATHREE ,'
      '   0 AS PROLONGS ,'
      '   E.CODE AS CLASSCODE,'
      '   CM_DECA.Get_CreditStatus(B.ID,:HDATE) AS STATUSCODE ,'
      '   DECODE(G.TYPECODE,'#39'000'#39',null,G.TYPECODE) AS COLLCODE,'
      '   F.ANYINFOTODISTING AS INFDISTING,'
      '   D.PLEDGEPRICE * O.OSTAT AS MARKETSUM ,'
      '   F.REGISTRYNO AS REGNO,'
      '   F.REGISTRYDATE AS REGDATE,'
      '   F.REGISTRYAGENCY AS REGAGENCY'
      'FROM'
      '   CM_BOOROWERINFO A'
      ' , CM_ACCOUNTS C'
      ' , CM_RESERVE_TYPES E'
      ' , CM_GUARANTEE F'
      ' , CM_PORTFOLIO B'
      ' , CM_PLEDGES G'
      ' , CM_HISTORY D'
      ' , SB_OPERKURS O'
      ' , SB_AVALUTE V'
      ' , CM_CATEGORIES P'
      'WHERE'
      '     (A.CREDITID = B.ID)'
      ' AND (C.CREDITID = B.ID)'
      ' AND (D.CREDITID = B.ID)'
      ' AND (E.ID = D.RESERVEID)'
      ' AND (F.CREDITID = B.ID)'
      ' AND (G.ID = F.PLEDGEID)'
      ' AND (D.HDATE=:HDATE)'
      
        ' AND ((B.CLOSEDATE IS NULL) or (B.CLOSEDATE between :EDATE and :' +
        'HDATE) /*(B.CLOSEDATE >=:HDATE)*/)'
      ' AND (O.DAT=:HDATE)'
      ' AND (O.VAL_KOD=B.CURRENCY)'
      '--AND (O.OSTAT * B.CREDITLINEAMOUNT >= 1000)'
      ' AND (V.VALUTE=B.CURRENCY)'
      ' AND (B.DATEOFCONCLUSION<=:HDATE)'
      '-- AND (B.CLOSEDATE is not null)'
      
        ' AND (P.ID = B.CUSTOMERTYPE) --and cm_deca.get_creditinitialamou' +
        'nt(b.id)>0'
      '')
    Optimize = False
    Variables.Data = {
      04000000020000000C0000003A00480044004100540045000C00000000000000
      000000000C0000003A00450044004100540045000C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000300000000400000049004400010000000000080000004E0041004D00
      45000100000000001400000043004F0055004E005400520043004F0044004500
      0100000000001200000042004E004B0053005400410054005500530001000000
      0000140000004400410054004F00460042004900520054004800010000000000
      1400000050004C00410043004500420049005200540048000100000000000E00
      0000500049004E0043004F004400450001000000000006000000470049004400
      0100000000000A00000047004E0041004D004500010000000000080000004700
      4900440032000100000000000C00000047004E0041004D004500320001000000
      00000800000047004900440033000100000000000C00000047004E0041004D00
      4500330001000000000014000000430052004500440049005400540059005000
      4500010000000000140000004C00410053005400500041005900440041005400
      010000000000140000004D0050004100590041004D004F0055004E0054000100
      0000000012000000500052004F0056004900530049004F004E00010000000000
      060000004900440032000100000000000A0000004E0041004D00450032000100
      00000000060000004900440033000100000000000A0000004E0041004D004500
      3300010000000000060000004900440034000100000000000A0000004E004100
      4D00450034000100000000001400000049004E005400450052004E0041004C00
      49004400010000000000120000004100430043004F0055004E0054004E004F00
      01000000000010000000430055005200520045004E0043005900010000000000
      1400000049004E0049005400490041004C00530055004D000100000000001400
      00004300520044004C0049004E004500530055004D0001000000000010000000
      4400490053004F005500530055004D0001000000000008000000520041005400
      45000100000000000E00000050005500520050004F0053004500010000000000
      1400000050004500520049004F0044004D004F004E0054000100000000001200
      000044004100540045004700520041004E005400010000000000140000004600
      490052005300540043004F004E0054005200010000000000120000004C004100
      5300540043004F004E0054005200010000000000100000004400410059005300
      4D00410049004E0001000000000014000000440041005900530049004E005400
      520053005400010000000000120000004F004900410050004500520049004F00
      4400010000000000100000004F00490041005400480052004500450001000000
      000010000000500052004F004C004F004E004700530001000000000012000000
      43004C0041005300530043004F00440045000100000000001400000053005400
      410054005500530043004F00440045000100000000001000000043004F004C00
      4C0043004F00440045000100000000001400000049004E004600440049005300
      540049004E004700010000000000120000004D00410052004B00450054005300
      55004D000100000000000A0000005200450047004E004F000100000000000E00
      0000520045004700440041005400450001000000000012000000520045004700
      4100470045004E0043005900010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 96
    object DecaDataID: TWideStringField
      FieldName = 'ID'
      Size = 100
    end
    object DecaDataNAME: TWideStringField
      DisplayLabel = #1041#1086#1088#1078#1072#1083#1072#1085#1099#1085' '#1072#1076#1099
      FieldName = 'NAME'
      Size = 120
    end
    object DecaDataCOUNTRCODE: TWideStringField
      DisplayLabel = #1070#1083#1082#1103#1085#1080#1085' '#1082#1086#1076#1091' '
      FieldName = 'COUNTRCODE'
      Size = 8
    end
    object DecaDataBNKSTATUS: TFloatField
      DisplayLabel = #1052#1094#1092#1083#1094#1089' '#1086#1083#1084#1072' '#1089#1090#1072#1090#1091#1089#1091
      FieldName = 'BNKSTATUS'
    end
    object DecaDataDATOFBIRTH: TDateTimeField
      DisplayLabel = #1044#1086#1100#1091#1084' '#1090#1072#1088#1080#1093#1080
      FieldName = 'DATOFBIRTH'
    end
    object DecaDataPLACEBIRTH: TWideStringField
      DisplayLabel = #1044#1086#1100#1091#1084' '#1081#1077#1088#1080
      FieldName = 'PLACEBIRTH'
      Size = 4000
    end
    object DecaDataPINCODE: TWideStringField
      DisplayLabel = #1055#1080#1085#1082#1086#1076#1091
      FieldName = 'PINCODE'
      Size = 7
    end
    object DecaDataGID: TWideStringField
      DisplayLabel = '1 '#1047#1072#1084#1080#1085' '#1080#1076
      FieldName = 'GID'
    end
    object DecaDataGNAME: TWideStringField
      DisplayLabel = '1 '#1047#1072#1084#1080#1085' '#1072#1076#1099
      FieldName = 'GNAME'
      Size = 64
    end
    object DecaDataGID2: TWideStringField
      DisplayLabel = '2 '#1047#1072#1084#1080#1085
      FieldName = 'GID2'
    end
    object DecaDataGNAME2: TWideStringField
      DisplayLabel = '2 '#1047#1072#1084#1080#1085' '#1072#1076#1099
      FieldName = 'GNAME2'
      Size = 64
    end
    object DecaDataGID3: TWideStringField
      DisplayLabel = '3 '#1047#1072#1084#1080#1085
      FieldName = 'GID3'
    end
    object DecaDataGNAME3: TWideStringField
      DisplayLabel = '3 '#1047#1072#1084#1080#1085' '#1072#1076#1099
      FieldName = 'GNAME3'
      Size = 64
    end
    object DecaDataCREDITTYPE: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1085' '#1090#1080#1087#1080
      FieldName = 'CREDITTYPE'
      Size = 4000
    end
    object DecaDataLASTPAYDAT: TDateTimeField
      DisplayLabel = #1057#1086#1085#1091#1085#1078#1091'  '#1102#1076#1103#1085#1080#1096' '#1090#1072#1088
      FieldName = 'LASTPAYDAT'
    end
    object DecaDataMPAYAMOUNT: TFloatField
      DisplayLabel = #1040#1081#1083#1099#1075' '#1102#1076#1103#1085#1080#1096
      FieldName = 'MPAYAMOUNT'
    end
    object DecaDataPROVISION: TFloatField
      DisplayLabel = #1045#1097#1090#1080#1081#1081#1072#1090#1099#1085' '#1084#1080#1075#1076#1072#1088#1099
      FieldName = 'PROVISION'
    end
    object DecaDataID2: TWideStringField
      DisplayLabel = '1 '#1058#1103#1089#1080#1089#1095#1080' '#1067#1044
      FieldName = 'ID2'
      Size = 12
    end
    object DecaDataNAME2: TWideStringField
      DisplayLabel = '1 '#1058#1103#1089#1080#1089#1095#1080' '#1072#1076#1099
      FieldName = 'NAME2'
      Size = 64
    end
    object DecaDataID3: TWideStringField
      DisplayLabel = '2 '#1058#1103#1089#1080#1089#1095#1080' '#1067#1044
      FieldName = 'ID3'
      Size = 12
    end
    object DecaDataNAME3: TWideStringField
      DisplayLabel = '2 '#1058#1103#1089#1080#1089#1095#1080' '#1072#1076#1099
      FieldName = 'NAME3'
      Size = 64
    end
    object DecaDataID4: TWideStringField
      DisplayLabel = '3'#1058#1103#1089#1080#1089#1095#1080' '#1067#1044
      FieldName = 'ID4'
      Size = 12
    end
    object DecaDataNAME4: TWideStringField
      DisplayLabel = '3 '#1058#1103#1089#1080#1089#1095#1080' '#1072#1076#1099
      FieldName = 'NAME4'
      Size = 64
    end
    object DecaDataINTERNALID: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1067#1044
      FieldName = 'INTERNALID'
      Required = True
    end
    object DecaDataACCOUNTNO: TWideStringField
      DisplayLabel = #1065#1077#1089#1072#1073
      FieldName = 'ACCOUNTNO'
      Size = 4000
    end
    object DecaDataCURRENCY: TWideStringField
      DisplayLabel = #1042#1072#1083#1091#1090#1077
      FieldName = 'CURRENCY'
      Size = 10
    end
    object DecaDataINITIALSUM: TFloatField
      DisplayLabel = #1048#1083#1082' '#1084#1103#1073#1083#1103#1100
      FieldName = 'INITIALSUM'
    end
    object DecaDataCRDLINESUM: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1084#1103#1073#1083#1103#1100#1080
      FieldName = 'CRDLINESUM'
    end
    object DecaDataDISOUSUM: TFloatField
      DisplayLabel = #1043#1072#1083#1099#1075
      FieldName = 'DISOUSUM'
    end
    object DecaDataRATE: TFloatField
      DisplayLabel = '% '#1076#1103#1088#1103#1078#1103#1089#1080
      FieldName = 'RATE'
      Required = True
    end
    object DecaDataPURPOSE: TWideStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'PURPOSE'
      Size = 8
    end
    object DecaDataPERIODMONT: TFloatField
      DisplayLabel = #1055#1077#1088#1080#1076' '#1072#1081
      FieldName = 'PERIODMONT'
    end
    object DecaDataDATEGRANT: TDateTimeField
      DisplayLabel = #1052#1094#1075#1072#1074#1080#1083#1103#1085#1080#1085' '#1072#1095#1099#1083#1084#1072' '#1090#1072#1088
      FieldName = 'DATEGRANT'
      Required = True
    end
    object DecaDataFIRSTCONTR: TDateTimeField
      DisplayLabel = #1041#1072#1100#1083#1072#1085#1084#1072' '#1090#1072#1088#1080#1093#1080
      FieldName = 'FIRSTCONTR'
      Required = True
    end
    object DecaDataLASTCONTR: TDateTimeField
      DisplayLabel = #1091#1079#1072#1076#1099#1084#1072' '#1090#1072#1088
      FieldName = 'LASTCONTR'
    end
    object DecaDataDAYSMAIN: TFloatField
      DisplayLabel = #1071#1089#1072#1089' '#1073#1086#1088#1078' '#1101#1077#1078' '#1101#1094#1085
      FieldName = 'DAYSMAIN'
    end
    object DecaDataDAYSINTRST: TFloatField
      DisplayLabel = '% '#1073#1086#1088#1078' '#1101#1077#1078' '#1101#1094#1085' '
      FieldName = 'DAYSINTRST'
    end
    object DecaDataOIAPERIOD: TFloatField
      DisplayLabel = '% '#1073#1086#1088#1078#1091' '
      FieldName = 'OIAPERIOD'
    end
    object DecaDataOIATHREE: TFloatField
      DisplayLabel = #1069#1077#1078' % '#1073#1086#1088#1078#1091
      FieldName = 'OIATHREE'
    end
    object DecaDataPROLONGS: TFloatField
      FieldName = 'PROLONGS'
    end
    object DecaDataCLASSCODE: TWideStringField
      DisplayLabel = #1045#1097#1090#1080#1081#1081#1072#1090#1099#1085' '#1082#1086#1076#1091' '
      FieldName = 'CLASSCODE'
      Size = 8
    end
    object DecaDataSTATUSCODE: TWideStringField
      FieldName = 'STATUSCODE'
      Size = 4000
    end
    object DecaDataCOLLCODE: TWideStringField
      FieldName = 'COLLCODE'
      Size = 8
    end
    object DecaDataINFDISTING: TWideStringField
      FieldName = 'INFDISTING'
      Size = 128
    end
    object DecaDataMARKETSUM: TFloatField
      FieldName = 'MARKETSUM'
    end
    object DecaDataREGNO: TWideStringField
      FieldName = 'REGNO'
      Size = 32
    end
    object DecaDataREGDATE: TDateTimeField
      FieldName = 'REGDATE'
    end
    object DecaDataREGAGENCY: TWideStringField
      FieldName = 'REGAGENCY'
      Size = 64
    end
  end
  object DataSrcDecaData: TDataSource
    DataSet = DecaData
    Left = 80
    Top = 32
  end
  object DecaTable: TTable
    Left = 208
    Top = 48
  end
  object SaveDlg: TSaveDialog
    DefaultExt = 'dbf'
    Filter = '*.dbf,*.db|*.dbf;*.db'
    Left = 360
    Top = 48
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   A.BOOROWERID AS ID,'
      '   A.NAME AS NAME,'
      '   A.COUNTRYCODE AS COUNTRCODE,'
      '   A.BANKRUPTEYSTATUS AS BNKSTATUS,'
      
        '   cm_deca.get_custdateofbirth(b.boorowerid) AS DATOFBIRTH, --do' +
        'gum tarixi'
      
        '   cm_deca.get_custplaceofbirth(b.boorowerid) AS PLACEBIRTH, --d' +
        'ogum yeri'
      '   A.pincode AS PINCODE,'#9#9#9'--pin kod'
      '   A.guarantorid AS GID,'#9'--zamin id'
      '   a.guarantorname AS GNAME,'#9'--zamin ad'
      '   A.guarantorid2 AS GID2,'#9'--zamin id2'
      '   A.guarantorname2 AS GNAME2,'#9'--zamin ad2'
      '   A.guarantorid3 AS GID3,'#9'--zamin id3'
      '   A.guarantorname3 AS GNAME3,'#9'--zamin ad3'
      '   cm_deca.get_credittypes(b.id) CREDITTYPE,'#9'--kreditin tipi'
      
        '   cm_deca.get_lastcreditpayment(b.id) LASTPAYDAT,'#9'--sonuncu ode' +
        'nish tarixi'
      
        '   cm_deca.get_creditpaymentamount(b.id) MPAYAMOUNT,'#9'--ayliq ode' +
        'nish'
      
        '   cm_deca.get_reserveaccountostat(b.id) PROVISION,'#9'--ehtiyyat m' +
        'iqdari'
      '   A.FIRSTOWNERID AS ID2,'
      '   A.FIRSTOWNERNAME AS NAME2,'
      '   A.SECONDOWNERID AS ID3,'
      '   A.SECONDOWNERNAME AS NAME3,'
      '   A.THIRDOWNERID AS ID4,'
      '   A.THIRDOWNERNAME AS NAME4,'
      '   B.ID as InternalID, -- INTERNAL FIELD'
      '   CM_COMMON.AccountNumber_Get(c.LOANACCID) AS ACCOUNTNO ,'
      '   V.VAL_NAME AS CURRENCY,'
      '   cm_deca.get_creditinitialamount(b.id) AS INITIALSUM,'
      '   cm_deca.get_creditlineamount(b.id) AS CRDLINESUM,'
      '   D.REST + D.DUEREST AS DISOUSUM ,'
      '   B.ANNUALYINTERESTRATE AS RATE,'
      '   P.CODE AS PURPOSE,'
      
        '   TRUNC(MONTHS_BETWEEN(B.DUEDATEFIRSTCONTRACT,B.DATEOFCONCLUSIO' +
        'N)) AS PERIODMONT ,'
      '   B.DATEOFCONCLUSION AS DATEGRANT,'
      '   B.DUEDATEFIRSTCONTRACT AS FIRSTCONTR,'
      
        '   DECODE(B.DUEDATELASTCONTRACT,null,B.DUEDATEFIRSTCONTRACT,B.DU' +
        'EDATELASTCONTRACT) AS LASTCONTR,'
      
        '   CM_DECA.DueDaysCount(:HDATE , B.DUEDATEFIRSTCONTRACT,b.id) AS' +
        ' DAYSMAIN ,'
      
        '   CM_DECA.DueDaysCount(:HDATE , B.DUEDATEFIRSTCONTRACT,b.id) AS' +
        ' DAYSINTRST ,'
      '   D.DUEINTERESTREST+D.interestrest AS OIAPERIOD ,'
      
        '   CM_DECA.OiaForLastThreeMonths(:HDATE , B.DUEDATEFIRSTCONTRACT' +
        ',D.DUEINTERESTREST) AS OIATHREE ,'
      '   0 AS PROLONGS ,'
      '   E.CODE AS CLASSCODE,'
      '   CM_DECA.Get_CreditStatus(B.ID,:HDATE) AS STATUSCODE ,'
      '   DECODE(G.TYPECODE,'#39'000'#39',null,G.TYPECODE) AS COLLCODE,'
      '   F.ANYINFOTODISTING AS INFDISTING,'
      '   D.PLEDGEPRICE * O.OSTAT AS MARKETSUM ,'
      '   F.REGISTRYNO AS REGNO,'
      '   F.REGISTRYDATE AS REGDATE,'
      '   F.REGISTRYAGENCY AS REGAGENCY'
      'FROM'
      '   CM_BOOROWERINFO A'
      ' , CM_ACCOUNTS C'
      ' , CM_RESERVE_TYPES E'
      ' , CM_GUARANTEE F'
      ' , CM_PORTFOLIO B'
      ' , CM_PLEDGES G'
      ' , CM_HISTORY D'
      ' , SB_OPERKURS O'
      ' , SB_AVALUTE V'
      ' , CM_CATEGORIES P'
      'WHERE'
      '     (A.CREDITID = B.ID)'
      ' AND (C.CREDITID = B.ID)'
      ' AND (D.CREDITID = B.ID)'
      ' AND (E.ID = D.RESERVEID)'
      ' AND (F.CREDITID = B.ID)'
      ' AND (G.ID = F.PLEDGEID)'
      ' AND (D.HDATE=:HDATE)'
      
        ' AND ((B.CLOSEDATE IS NULL) or (B.CLOSEDATE between :EDATE and :' +
        'HDATE) /*(B.CLOSEDATE >=:HDATE)*/)'
      ' AND (O.DAT=:HDATE)'
      ' AND (O.VAL_KOD=B.CURRENCY)'
      '--AND (O.OSTAT * B.CREDITLINEAMOUNT >= 1000)'
      ' AND (V.VALUTE=B.CURRENCY)'
      ' AND (B.DATEOFCONCLUSION<=:HDATE)'
      '-- AND (B.CLOSEDATE is not null)'
      
        ' AND (P.ID = B.CUSTOMERTYPE) --and cm_deca.get_creditinitialamou' +
        'nt(b.id)>0'
      '')
    Optimize = False
    Variables.Data = {
      04000000020000000C0000003A00480044004100540045000C00000000000000
      000000000C0000003A00450044004100540045000C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000300000000400000049004400010000000000080000004E0041004D00
      45000100000000001400000043004F0055004E005400520043004F0044004500
      0100000000001200000042004E004B0053005400410054005500530001000000
      0000140000004400410054004F00460042004900520054004800010000000000
      1400000050004C00410043004500420049005200540048000100000000000E00
      0000500049004E0043004F004400450001000000000006000000470049004400
      0100000000000A00000047004E0041004D004500010000000000080000004700
      4900440032000100000000000C00000047004E0041004D004500320001000000
      00000800000047004900440033000100000000000C00000047004E0041004D00
      4500330001000000000014000000430052004500440049005400540059005000
      4500010000000000140000004C00410053005400500041005900440041005400
      010000000000140000004D0050004100590041004D004F0055004E0054000100
      0000000012000000500052004F0056004900530049004F004E00010000000000
      060000004900440032000100000000000A0000004E0041004D00450032000100
      00000000060000004900440033000100000000000A0000004E0041004D004500
      3300010000000000060000004900440034000100000000000A0000004E004100
      4D00450034000100000000001400000049004E005400450052004E0041004C00
      49004400010000000000120000004100430043004F0055004E0054004E004F00
      01000000000010000000430055005200520045004E0043005900010000000000
      1400000049004E0049005400490041004C00530055004D000100000000001400
      00004300520044004C0049004E004500530055004D0001000000000010000000
      4400490053004F005500530055004D0001000000000008000000520041005400
      45000100000000000E00000050005500520050004F0053004500010000000000
      1400000050004500520049004F0044004D004F004E0054000100000000001200
      000044004100540045004700520041004E005400010000000000140000004600
      490052005300540043004F004E0054005200010000000000120000004C004100
      5300540043004F004E0054005200010000000000100000004400410059005300
      4D00410049004E0001000000000014000000440041005900530049004E005400
      520053005400010000000000120000004F004900410050004500520049004F00
      4400010000000000100000004F00490041005400480052004500450001000000
      000010000000500052004F004C004F004E004700530001000000000012000000
      43004C0041005300530043004F00440045000100000000001400000053005400
      410054005500530043004F00440045000100000000001000000043004F004C00
      4C0043004F00440045000100000000001400000049004E004600440049005300
      540049004E004700010000000000120000004D00410052004B00450054005300
      55004D000100000000000A0000005200450047004E004F000100000000000E00
      0000520045004700440041005400450001000000000012000000520045004700
      4100470045004E0043005900010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 56
    Top = 176
    object StringField1: TWideStringField
      FieldName = 'ID'
      Size = 100
    end
    object StringField3: TWideStringField
      DisplayLabel = #1070#1083#1082#1103#1085#1080#1085' '#1082#1086#1076#1091' '
      FieldName = 'COUNTRCODE'
      Size = 8
    end
    object OracleDataSet1NAME: TWideStringField
      FieldName = 'NAME'
      Size = 64
    end
    object FloatField1: TFloatField
      DisplayLabel = #1052#1094#1092#1083#1094#1089' '#1086#1083#1084#1072' '#1089#1090#1072#1090#1091#1089#1091
      FieldName = 'BNKSTATUS'
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = #1044#1086#1100#1091#1084' '#1090#1072#1088#1080#1093#1080
      FieldName = 'DATOFBIRTH'
    end
    object StringField4: TWideStringField
      DisplayLabel = #1044#1086#1100#1091#1084' '#1081#1077#1088#1080
      FieldName = 'PLACEBIRTH'
      Size = 4000
    end
    object StringField5: TWideStringField
      DisplayLabel = #1055#1080#1085#1082#1086#1076#1091
      FieldName = 'PINCODE'
      Size = 7
    end
    object StringField6: TWideStringField
      DisplayLabel = '1 '#1047#1072#1084#1080#1085' '#1080#1076
      FieldName = 'GID'
    end
    object StringField7: TWideStringField
      DisplayLabel = '1 '#1047#1072#1084#1080#1085' '#1072#1076#1099
      FieldName = 'GNAME'
      Size = 64
    end
    object StringField8: TWideStringField
      DisplayLabel = '2 '#1047#1072#1084#1080#1085
      FieldName = 'GID2'
    end
    object StringField9: TWideStringField
      DisplayLabel = '2 '#1047#1072#1084#1080#1085' '#1072#1076#1099
      FieldName = 'GNAME2'
      Size = 64
    end
    object StringField10: TWideStringField
      DisplayLabel = '3 '#1047#1072#1084#1080#1085
      FieldName = 'GID3'
    end
    object StringField11: TWideStringField
      DisplayLabel = '3 '#1047#1072#1084#1080#1085' '#1072#1076#1099
      FieldName = 'GNAME3'
      Size = 64
    end
    object StringField12: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1085' '#1090#1080#1087#1080
      FieldName = 'CREDITTYPE'
      Size = 4000
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = #1057#1086#1085#1091#1085#1078#1091'  '#1102#1076#1103#1085#1080#1096' '#1090#1072#1088
      FieldName = 'LASTPAYDAT'
    end
    object FloatField2: TFloatField
      DisplayLabel = #1040#1081#1083#1099#1075' '#1102#1076#1103#1085#1080#1096
      FieldName = 'MPAYAMOUNT'
    end
    object FloatField3: TFloatField
      DisplayLabel = #1045#1097#1090#1080#1081#1081#1072#1090#1099#1085' '#1084#1080#1075#1076#1072#1088#1099
      FieldName = 'PROVISION'
    end
    object StringField13: TWideStringField
      DisplayLabel = '1 '#1058#1103#1089#1080#1089#1095#1080' '#1067#1044
      FieldName = 'ID2'
      Size = 12
    end
    object StringField14: TWideStringField
      DisplayLabel = '1 '#1058#1103#1089#1080#1089#1095#1080' '#1072#1076#1099
      FieldName = 'NAME2'
      Size = 64
    end
    object StringField15: TWideStringField
      DisplayLabel = '2 '#1058#1103#1089#1080#1089#1095#1080' '#1067#1044
      FieldName = 'ID3'
      Size = 12
    end
    object StringField16: TWideStringField
      DisplayLabel = '2 '#1058#1103#1089#1080#1089#1095#1080' '#1072#1076#1099
      FieldName = 'NAME3'
      Size = 64
    end
    object StringField17: TWideStringField
      DisplayLabel = '3'#1058#1103#1089#1080#1089#1095#1080' '#1067#1044
      FieldName = 'ID4'
      Size = 12
    end
    object StringField18: TWideStringField
      DisplayLabel = '3 '#1058#1103#1089#1080#1089#1095#1080' '#1072#1076#1099
      FieldName = 'NAME4'
      Size = 64
    end
    object FloatField4: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1067#1044
      FieldName = 'INTERNALID'
      Required = True
    end
    object StringField19: TWideStringField
      DisplayLabel = #1065#1077#1089#1072#1073
      FieldName = 'ACCOUNTNO'
      Size = 4000
    end
    object StringField20: TWideStringField
      DisplayLabel = #1042#1072#1083#1091#1090#1077
      FieldName = 'CURRENCY'
      Size = 10
    end
    object FloatField5: TFloatField
      DisplayLabel = #1048#1083#1082' '#1084#1103#1073#1083#1103#1100
      FieldName = 'INITIALSUM'
    end
    object FloatField6: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1084#1103#1073#1083#1103#1100#1080
      FieldName = 'CRDLINESUM'
    end
    object FloatField7: TFloatField
      DisplayLabel = #1043#1072#1083#1099#1075
      FieldName = 'DISOUSUM'
    end
    object FloatField8: TFloatField
      DisplayLabel = '% '#1076#1103#1088#1103#1078#1103#1089#1080
      FieldName = 'RATE'
      Required = True
    end
    object StringField21: TWideStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'PURPOSE'
      Size = 8
    end
    object FloatField9: TFloatField
      DisplayLabel = #1055#1077#1088#1080#1076' '#1072#1081
      FieldName = 'PERIODMONT'
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = #1052#1094#1075#1072#1074#1080#1083#1103#1085#1080#1085' '#1072#1095#1099#1083#1084#1072' '#1090#1072#1088
      FieldName = 'DATEGRANT'
      Required = True
    end
    object DateTimeField4: TDateTimeField
      DisplayLabel = #1041#1072#1100#1083#1072#1085#1084#1072' '#1090#1072#1088#1080#1093#1080
      FieldName = 'FIRSTCONTR'
      Required = True
    end
    object DateTimeField5: TDateTimeField
      DisplayLabel = #1091#1079#1072#1076#1099#1084#1072' '#1090#1072#1088
      FieldName = 'LASTCONTR'
    end
    object FloatField10: TFloatField
      DisplayLabel = #1071#1089#1072#1089' '#1073#1086#1088#1078' '#1101#1077#1078' '#1101#1094#1085
      FieldName = 'DAYSMAIN'
    end
    object FloatField11: TFloatField
      DisplayLabel = '% '#1073#1086#1088#1078' '#1101#1077#1078' '#1101#1094#1085' '
      FieldName = 'DAYSINTRST'
    end
    object FloatField12: TFloatField
      DisplayLabel = '% '#1073#1086#1088#1078#1091' '
      FieldName = 'OIAPERIOD'
    end
    object FloatField13: TFloatField
      DisplayLabel = #1069#1077#1078' % '#1073#1086#1088#1078#1091
      FieldName = 'OIATHREE'
    end
    object FloatField14: TFloatField
      FieldName = 'PROLONGS'
    end
    object StringField22: TWideStringField
      DisplayLabel = #1045#1097#1090#1080#1081#1081#1072#1090#1099#1085' '#1082#1086#1076#1091' '
      FieldName = 'CLASSCODE'
      Size = 8
    end
    object StringField23: TWideStringField
      FieldName = 'STATUSCODE'
      Size = 4000
    end
    object StringField24: TWideStringField
      FieldName = 'COLLCODE'
      Size = 8
    end
    object StringField25: TWideStringField
      FieldName = 'INFDISTING'
      Size = 128
    end
    object FloatField15: TFloatField
      FieldName = 'MARKETSUM'
    end
    object StringField26: TWideStringField
      FieldName = 'REGNO'
      Size = 32
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'REGDATE'
    end
    object StringField27: TWideStringField
      FieldName = 'REGAGENCY'
      Size = 64
    end
  end
end
