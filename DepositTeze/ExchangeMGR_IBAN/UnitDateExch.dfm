object DataModExch: TDataModExch
  OldCreateOrder = False
  Height = 458
  Width = 858
  object ODSExchOffice: TOracleDataSet
    SQL.Strings = (
      'select * from ex_office')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 25
    Top = 17
    object ODSExchOfficeID: TFloatField
      FieldName = 'ID'
    end
    object ODSExchOfficeEX_NO: TFloatField
      FieldName = 'EX_NO'
      Required = True
    end
    object ODSExchOfficeEX_NAME: TWideStringField
      FieldName = 'EX_NAME'
      Size = 50
    end
    object ODSExchOfficeEX_ADDRESS: TWideStringField
      FieldName = 'EX_ADDRESS'
      Size = 50
    end
    object ODSExchOfficeEX_WORKER_NAME: TWideStringField
      FieldName = 'EX_WORKER_NAME'
      Size = 60
    end
    object ODSExchOfficeEX_CHECK_NO: TWideStringField
      FieldName = 'EX_CHECK_NO'
      Size = 30
    end
    object ODSExchOfficeUSR_ID: TFloatField
      FieldName = 'USR_ID'
    end
  end
  object DSExchOffice: TDataSource
    DataSet = ODSExchOffice
    Left = 544
    Top = 57
  end
  object OPExchMgr: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'EXCH_MGR'
    Left = 752
    Top = 267
  end
  object ODSExchAcc: TOracleDataSet
    SQL.Strings = (
      'select  rowid,a.*'
      ' from ex_accounts a'
      ''
      'where a.ex_id = :ex_id')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00450058005F00490044000400000008000000
      000000000000F03F00000000}
    Cursor = crSQLWait
    Master = ODSExchOffice
    MasterFields = 'EX_NO'
    DetailFields = 'EX_ID'
    Session = sboapiDataModule.SBSession
    Left = 105
    Top = 135
    object ODSExchAccID: TFloatField
      FieldName = 'ID'
    end
    object ODSExchAccEX_ID: TFloatField
      FieldName = 'EX_ID'
    end
    object ODSExchAccPURCHASE_ACC_NO: TWideStringField
      FieldName = 'PURCHASE_ACC_NO'
      Size = 28
    end
    object ODSExchAccSELLING_ACC_NO: TWideStringField
      FieldName = 'SELLING_ACC_NO'
      Size = 28
    end
    object ODSExchAccPROFIT_ACC_NO: TWideStringField
      FieldName = 'PROFIT_ACC_NO'
      Size = 28
    end
    object ODSExchAccHARM_ACC_NO: TWideStringField
      FieldName = 'HARM_ACC_NO'
      Size = 28
    end
    object ODSExchAccVAL_NB_COURSE: TFloatField
      FieldKind = fkLookup
      FieldName = 'VAL_NB_COURSE'
      LookupDataSet = ODSExchRate
      LookupKeyFields = 'VAL_ID'
      LookupResultField = 'VAL_NB_COURSE'
      KeyFields = 'VAL_ID'
      Lookup = True
    end
    object ODSExchAccval_purchase_course: TFloatField
      FieldKind = fkLookup
      FieldName = 'VAL_PURCHASE_COURSE'
      LookupDataSet = ODSExchRate
      LookupKeyFields = 'VAL_ID'
      LookupResultField = 'VAL_PURCHASE_COURSE'
      KeyFields = 'VAL_ID'
      Lookup = True
    end
    object ODSExchAccVAL_SELLING_COURSE: TFloatField
      FieldKind = fkLookup
      FieldName = 'VAL_SELLING_COURSE'
      LookupDataSet = ODSExchRate
      LookupKeyFields = 'VAL_ID'
      LookupResultField = 'VAL_SELLING_COURSE'
      KeyFields = 'VAL_ID'
      Lookup = True
    end
    object ODSExchAccVAL_ID: TFloatField
      FieldName = 'VAL_ID'
    end
    object ODSExchAccVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object ODSExchAccVAL_NAME1: TWideStringField
      FieldKind = fkLookup
      FieldName = 'VAL_NAME1'
      LookupDataSet = ODSExchRate
      LookupKeyFields = 'VAL_ID'
      LookupResultField = 'VAL_NAME'
      KeyFields = 'VAL_ID'
      Size = 30
      Lookup = True
    end
  end
  object DSExchAcc: TDataSource
    DataSet = ODSExchAcc
    Left = 416
    Top = 9
  end
  object ODSExchRate: TOracleDataSet
    SQL.Strings = (
      'select r.rowid, r.* from ex_rates r'
      ''
      'where '
      '         ex_id = :ex_id'
      'and'
      '         dat   =:dat'
      'order by '
      '         val_id')
    Optimize = False
    Variables.Data = {
      04000000020000000C0000003A00450058005F00490044000400000008000000
      000000000000F03F00000000080000003A004400410054000C00000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      050000000D0000000C000000560041004C005F00490044000100000000001000
      0000560041004C005F004E0041004D0045000100000000001A00000056004100
      4C005F00460055004C004C005F004E0041004D00450001000000000026000000
      560041004C005F00500055005200430048004100530045005F0043004F005500
      52005300450001000000000024000000560041004C005F00530045004C004C00
      49004E0047005F0043004F0055005200530045000100000000001A0000005600
      41004C005F004E0042005F0043004F0055005200530045000100000000000A00
      0000450058005F00490044000100000000000600000044004100540001000000
      00000C0000005500530052005F00490044000100000000001600000046004900
      5200530054005F004F0053005400410054000100000000001A00000043005500
      5200520045004E0054005F004F0053005400410054000100000000001A000000
      500055005200430048004100530045005F005400550052004E00010000000000
      18000000530045004C004C0049004E0047005F005400550052004E0001000000
      0000}
    Cursor = crSQLWait
    Master = ODSExchOffice
    MasterFields = 'EX_NO'
    DetailFields = 'EX_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 24
    Top = 73
    object ODSExchRateVAL_ID: TFloatField
      FieldName = 'VAL_ID'
      Required = True
    end
    object ODSExchRateVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 5
    end
    object ODSExchRateVAL_FULL_NAME: TWideStringField
      FieldName = 'VAL_FULL_NAME'
    end
    object ODSExchRateVAL_PURCHASE_COURSE: TFloatField
      FieldName = 'VAL_PURCHASE_COURSE'
    end
    object ODSExchRateVAL_SELLING_COURSE: TFloatField
      FieldName = 'VAL_SELLING_COURSE'
      DisplayFormat = '#.0000'
    end
    object ODSExchRateVAL_NB_COURSE: TFloatField
      FieldName = 'VAL_NB_COURSE'
      DisplayFormat = '#.0000'
    end
    object ODSExchRateEX_ID: TFloatField
      FieldName = 'EX_ID'
      Required = True
    end
    object ODSExchRateDAT: TDateTimeField
      FieldName = 'DAT'
      Required = True
    end
    object ODSExchRateUSR_ID: TFloatField
      FieldName = 'USR_ID'
    end
    object ODSExchRateFIRST_OSTAT: TFloatField
      FieldName = 'FIRST_OSTAT'
      DisplayFormat = '#.00'
    end
    object ODSExchRateCURRENT_OSTAT: TFloatField
      FieldName = 'CURRENT_OSTAT'
      DisplayFormat = '#.00'
    end
    object ODSExchRatePURCHASE_TURN: TFloatField
      FieldName = 'PURCHASE_TURN'
      DisplayFormat = '#.00'
    end
    object ODSExchRateSELLING_TURN: TFloatField
      FieldName = 'SELLING_TURN'
      DisplayFormat = '#.00'
    end
  end
  object ds: TDataSource
    DataSet = ODSExchRate
    Left = 544
    Top = 13
  end
  object DSExchProvarch: TDataSource
    DataSet = ODSExchProvarch
    Left = 512
    Top = 168
  end
  object DSAcc_main_debt: TDataSource
    DataSet = ODSAcc_main_debt
    Left = 488
    Top = 116
  end
  object ODSAcc_main_debt: TOracleDataSet
    SQL.Strings = (
      'select '
      '       id,'
      '       acc_no'
      'from '
      '        account   '
      'where '
      '       bal_cn1 =:balance')
    Optimize = False
    Variables.Data = {
      0400000001000000100000003A00420041004C0041004E004300450003000000
      04000000EB03000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 212
    Top = 193
  end
  object ODSExchProvarch: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '      rownum,'
      '      p.*,'
      
        '      decode(p.status,'#39'1'#39', '#39#1072#1083#1099#1096#39', '#39'2'#39','#39#1089#1072#1090#1099#1096#39', '#39'3'#39', '#39#1084#1094#1073#1072#1076#1080#1083#1103#39')' +
        ' as status_str'
      ''
      'FROM '
      '       ex_provarch p'
      ''
      'WHERE'
      '       p.ex_id = :ex_id'
      ''
      ''
      'AND'
      '       p.dat=:dat'
      ''
      'AND'
      '       p.status not in (4,5)'
      ''
      ''
      'ORDER BY :Title')
    Optimize = False
    Variables.Data = {
      04000000030000000C0000003A005400490054004C0045000100000004000000
      6461740000000000080000003A004400410054000C00000007000000786A0B1C
      010101000000000C0000003A00450058005F0049004400040000000800000000
      0000000000F03F00000000}
    QBEDefinition.QBEFieldDefs = {
      05000000210000000C00000052004F0057004E0055004D000100000000000600
      00004400410054000100000000000C0000005300540041005400550053000100
      00000000120000004F005000450052005F004E0041004D004500010000000000
      04000000490044000100000000001200000043005500530054005F004E004100
      4D0045000100000000001400000043005500530054005F004C004E0041004D00
      4500010000000000160000004400450042004900540041004D004F0055004E00
      54000100000000000E0000004C0041004D004F0055004E005400010000000000
      120000004F0050005F0043004F00550052005300450001000000000014000000
      4600450045005F0041004D004F0055004E0054000100000000000A0000005500
      53005200490044000100000000001A00000043005500530054005F0050004100
      5300530050004F00520054000100000000001200000045005800430048005F00
      4E0041004D0045000100000000000C000000560041004C005F00490044000100
      000000000A000000450058005F00490044000100000000001600000043005500
      530054005F004600410054004800450052000100000000001200000043005500
      530054005F004400410054004500010000000000180000004300550053005400
      5F0043004F004E004600490052004D0001000000000024000000430055005300
      54005F0047004900560049004E0047005F004D0045004D004200450052000100
      000000001A000000560041004C005F004E0042005F0043004F00550052005300
      45000100000000000E0000004F0050005F00540049004D004500010000000000
      10000000560041004C005F004E0041004D004500010000000000200000005600
      41004C005F004300480041004E004700450044005F004E0041004D0045000100
      000000001C000000560041004C005F004300480041004E004700450044005F00
      4900440001000000000024000000560041004C005F004300480041004E004700
      450044005F0043004F0055005200530045000100000000001800000043005500
      530054005F0043004F0055004E005400520059000100000000000E0000004300
      4F0055004E0054005200590001000000000012000000430048005F0053005400
      41005400550053000100000000001000000041005F0043004F00550052005300
      45000100000000000C0000005500530052005F00490044000100000000001600
      00005400520041004E0053005F0043004C004F00530045000100000000001400
      00005300540041005400550053005F00530054005200010000000000}
    Cursor = crSQLWait
    Master = ODSExchOffice
    MasterFields = 'ex_no'
    DetailFields = 'ex_id'
    Session = sboapiDataModule.SBSession
    BeforeInsert = ODSExchProvarchBeforeInsert
    AfterInsert = ODSExchProvarchAfterInsert
    Left = 108
    Top = 193
  end
  object OPTrans: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'EXCH_MGR'
    ParameterMode = pmNamed
    Left = 736
    Top = 379
  end
  object ODSReport: TOracleDataSet
    SQL.Strings = (
      'Select '
      ''
      '     rownum,ex.*,'
      '      p.*'
      ''
      'From '
      '      ex_office ex,ex_provarch p'
      'Where '
      '        ex.ex_no=p.ex_id '
      '   and'
      '        p.id=:p_id')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A0050005F004900440003000000040000005E01
      000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 137
  end
  object TableAddFile: TTable
    AutoRefresh = True
    Exclusive = True
    TableType = ttParadox
    Left = 176
    Top = 17
  end
  object DSRateInsert: TDataSource
    DataSet = ODSRateInsert
    Left = 516
    Top = 220
  end
  object ODSRateInsert: TOracleDataSet
    SQL.Strings = (
      'select r.rowid, r.* from ex_rates r'
      ''
      'where '
      '        ex_id = :ex_id'
      'and   '
      
        '        dat=(select max(dat) from ex_rates where dat<:dat and ex' +
        '_id = :ex_id)'
      'order by '
      '        val_id')
    Optimize = False
    Variables.Data = {
      04000000020000000C0000003A00450058005F00490044000400000008000000
      000000000000F03F00000000080000003A004400410054000C00000007000000
      786A0B1801010100000000}
    Cursor = crSQLWait
    Master = ODSExchOffice
    MasterFields = 'EX_NO'
    DetailFields = 'EX_ID'
    Session = sboapiDataModule.SBSession
    Left = 104
    Top = 73
    object ODSRateInsertVAL_ID: TFloatField
      FieldName = 'VAL_ID'
      Required = True
    end
    object ODSRateInsertVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 5
    end
    object ODSRateInsertVAL_FULL_NAME: TWideStringField
      FieldName = 'VAL_FULL_NAME'
    end
    object ODSRateInsertVAL_PURCHASE_COURSE: TFloatField
      FieldName = 'VAL_PURCHASE_COURSE'
      DisplayFormat = '#.0000'
    end
    object ODSRateInsertVAL_SELLING_COURSE: TFloatField
      FieldName = 'VAL_SELLING_COURSE'
      DisplayFormat = '#.0000'
    end
    object ODSRateInsertVAL_NB_COURSE: TFloatField
      FieldName = 'VAL_NB_COURSE'
      DisplayFormat = '#.0000'
    end
    object ODSRateInsertEX_ID: TFloatField
      FieldName = 'EX_ID'
      Required = True
    end
    object ODSRateInsertDAT: TDateTimeField
      FieldName = 'DAT'
      Required = True
    end
    object ODSRateInsertUSR_ID: TFloatField
      FieldName = 'USR_ID'
    end
    object ODSRateInsertFIRST_OSTAT: TFloatField
      FieldName = 'FIRST_OSTAT'
      DisplayFormat = '#.00'
    end
    object ODSRateInsertCURRENT_OSTAT: TFloatField
      FieldName = 'CURRENT_OSTAT'
      DisplayFormat = '#.00'
    end
    object ODSRateInsertPURCHASE_TURN: TFloatField
      FieldName = 'PURCHASE_TURN'
      DisplayFormat = '#.00'
    end
    object ODSRateInsertSELLING_TURN: TFloatField
      FieldName = 'SELLING_TURN'
      DisplayFormat = '#.00'
    end
  end
  object ODSExchRateOther: TOracleDataSet
    SQL.Strings = (
      'select r.rowid, r.* from ex_rates r'
      ''
      'where '
      '         ex_id = :ex_id'
      'and'
      '         dat   =:dat'
      'order by '
      '         val_id')
    Optimize = False
    Variables.Data = {
      04000000020000000C0000003A00450058005F00490044000400000008000000
      000000000000F03F00000000080000003A004400410054000C00000000000000
      00000000}
    Cursor = crSQLWait
    Master = ODSExchOffice
    MasterFields = 'EX_NO'
    DetailFields = 'EX_ID'
    Session = sboapiDataModule.SBSession
    Left = 212
    Top = 135
  end
  object DSExchRateOther: TDataSource
    DataSet = ODSExchRateOther
    Left = 635
    Top = 64
  end
  object ODSTraffics: TOracleDataSet
    SQL.Strings = (
      
        ' select p.*,decode(p.status,'#39'1'#39', '#39#1072#1083#1099#1096#39', '#39'2'#39','#39#1089#1072#1090#1099#1096#39', '#39'3'#39', '#39#1084#1094#1073#1072 +
        #1076#1080#1083#1103#39') as status_str from ex_provarch p where p.id is not null  ' +
        'and p.dat between '#39'24-Nov-2006'#39' and '#39'28-Nov-2006'#39' ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000020000000060000004400410054000100000000000C00000053005400
      4100540055005300010000000000120000004F005000450052005F004E004100
      4D00450001000000000004000000490044000100000000001200000043005500
      530054005F004E0041004D004500010000000000140000004300550053005400
      5F004C004E0041004D0045000100000000001600000044004500420049005400
      41004D004F0055004E0054000100000000000E0000004C0041004D004F005500
      4E005400010000000000120000004F0050005F0043004F005500520053004500
      010000000000140000004600450045005F0041004D004F0055004E0054000100
      000000000A000000550053005200490044000100000000001A00000043005500
      530054005F00500041005300530050004F005200540001000000000012000000
      45005800430048005F004E0041004D0045000100000000000C00000056004100
      4C005F00490044000100000000000A000000450058005F004900440001000000
      00001600000043005500530054005F0046004100540048004500520001000000
      00001200000043005500530054005F0044004100540045000100000000001800
      000043005500530054005F0043004F004E004600490052004D00010000000000
      2400000043005500530054005F0047004900560049004E0047005F004D004500
      4D004200450052000100000000001A000000560041004C005F004E0042005F00
      43004F0055005200530045000100000000000E0000004F0050005F0054004900
      4D00450001000000000010000000560041004C005F004E0041004D0045000100
      0000000020000000560041004C005F004300480041004E004700450044005F00
      4E0041004D0045000100000000001C000000560041004C005F00430048004100
      4E004700450044005F004900440001000000000024000000560041004C005F00
      4300480041004E004700450044005F0043004F00550052005300450001000000
      00001800000043005500530054005F0043004F0055004E005400520059000100
      000000000E00000043004F0055004E0054005200590001000000000012000000
      430048005F005300540041005400550053000100000000001000000041005F00
      43004F0055005200530045000100000000000C0000005500530052005F004900
      4400010000000000160000005400520041004E0053005F0043004C004F005300
      4500010000000000140000005300540041005400550053005F00530054005200
      010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 104
    Top = 17
    object ODSTrafficsSTATUS_STR: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'STATUS_STR'
      Size = 8
    end
    object ODSTrafficsDAT: TDateTimeField
      DisplayLabel = #1090#1072#1088#1080#1093
      FieldName = 'DAT'
    end
    object ODSTrafficsVAL_NAME: TWideStringField
      DisplayLabel = #1074#1072#1083#1081#1091#1090#1072
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object ODSTrafficsDEBITAMOUNT: TFloatField
      DisplayLabel = #1052#1103#1073#1083#1103#1078
      FieldName = 'DEBITAMOUNT'
    end
    object ODSTrafficsVAL_CHANGED_NAME: TWideStringField
      DisplayLabel = #1074#1072#1083#1081#1091#1090#1072
      FieldName = 'VAL_CHANGED_NAME'
      Size = 10
    end
    object ODSTrafficsLAMOUNT: TFloatField
      DisplayLabel = #1052#1103#1073#1083#1103#1078' '#1084#1072#1085#1072#1090#1083#1072
      FieldName = 'LAMOUNT'
    end
    object ODSTrafficsFEE_AMOUNT: TFloatField
      DisplayLabel = #1046#1103#1083#1080#1088
      FieldName = 'FEE_AMOUNT'
    end
    object ODSTrafficsOP_COURSE: TFloatField
      DisplayLabel = #1050#1091#1088#1089
      FieldName = 'OP_COURSE'
    end
    object ODSTrafficsOPER_NAME: TWideStringField
      DisplayLabel = #1071#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085' '#1090#1103#1081#1080#1085#1072#1090#1099
      FieldName = 'OPER_NAME'
      Size = 90
    end
  end
  object DSTraffics: TDataSource
    DataSet = ODSTraffics
    Left = 483
    Top = 17
  end
  object DSAddFile: TDataSource
    DataSet = TableAddFile
    Left = 580
    Top = 115
  end
  object sb_transaction: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'EXCH_TRANS'
    Left = 784
    Top = 163
  end
  object ODSExchProvarchTrans: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '      p.*'
      ''
      'FROM '
      '       ex_provarch p'
      ''
      'WHERE'
      '      id=:v_id'
      ''
      'and'
      '       p.dat=:dat'
      'AND'
      '       p.status <>3'
      'AND'
      '       p.trans_close=0'
      ''
      'ORDER BY :Title')
    Optimize = False
    Variables.Data = {
      04000000030000000C0000003A005400490054004C0045000100000004000000
      6461740000000000080000003A004400410054000C00000007000000786A0B1C
      010101000000000A0000003A0056005F00490044000300000000000000000000
      00}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 73
  end
  object DSExchProvarchTrans: TDataSource
    DataSet = ODSExchProvarchTrans
    Left = 587
    Top = 188
  end
  object ODSCust_Name: TOracleDataSet
    SQL.Strings = (
      
        'select distinct cust_name from ex_constants where cust_name is n' +
        'ot null')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 128
    Top = 249
  end
  object ODSCust_LName: TOracleDataSet
    SQL.Strings = (
      
        'select distinct cust_lname from ex_constants where cust_lname is' +
        ' not null')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 249
  end
  object ODSCust_Father: TOracleDataSet
    SQL.Strings = (
      
        'select distinct cust_father from ex_constants where cust_father ' +
        'is not null')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 160
    Top = 377
  end
  object ODSCust_Confirm: TOracleDataSet
    SQL.Strings = (
      
        'select distinct cust_confirm from ex_constants where cust_confir' +
        'm is not null')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 218
    Top = 249
  end
  object ODSCust_Country: TOracleDataSet
    SQL.Strings = (
      
        'select distinct cust_country from ex_constants where cust_countr' +
        'y is not null')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 256
    Top = 377
  end
  object ODSGiving_Member: TOracleDataSet
    SQL.Strings = (
      
        'select distinct cust_giving_member from ex_constants where cust_' +
        'giving_member is not null')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 377
  end
  object DSCust_LName: TDataSource
    DataSet = ODSCust_LName
    Left = 424
    Top = 132
  end
  object DSCust_Confirm: TDataSource
    DataSet = ODSCust_Confirm
    Left = 514
    Top = 353
  end
  object DSCust_Father: TDataSource
    DataSet = ODSCust_Father
    Left = 680
    Top = 305
  end
  object DSCust_Name: TDataSource
    DataSet = ODSCust_Name
    Left = 592
    Top = 249
  end
  object DSGiving_Member: TDataSource
    DataSet = ODSGiving_Member
    Left = 416
    Top = 185
  end
  object DSCust_Country: TDataSource
    DataSet = ODSCust_Country
    Left = 584
    Top = 305
  end
  object OPAdmin: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'EX_ADM'
    Left = 736
    Top = 324
  end
  object ODSUserList: TOracleDataSet
    SQL.Strings = (
      
        'select username,user_id from dba_users where default_tablespace=' +
        #39'SMARTBANK'#39' order by username')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 313
  end
  object DSUserList: TDataSource
    DataSet = ODSUserList
    Left = 512
    Top = 289
  end
  object DSRateTurn: TDataSource
    DataSet = ODSRateTurn
    Left = 423
    Top = 73
  end
  object ODSRateTurn: TOracleDataSet
    SQL.Strings = (
      'select * from ex_rates where dat=:dat '
      '   and ex_id=:ex_id order by val_name')
    Optimize = False
    Variables.Data = {
      04000000020000000C0000003A00450058005F00490044000400000000000000
      00000000080000003A004400410054000C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000D0000000C000000560041004C005F00490044000100000000001000
      0000560041004C005F004E0041004D0045000100000000001A00000056004100
      4C005F00460055004C004C005F004E0041004D00450001000000000026000000
      560041004C005F00500055005200430048004100530045005F0043004F005500
      52005300450001000000000024000000560041004C005F00530045004C004C00
      49004E0047005F0043004F0055005200530045000100000000001A0000005600
      41004C005F004E0042005F0043004F0055005200530045000100000000000A00
      0000450058005F00490044000100000000000600000044004100540001000000
      00000C0000005500530052005F00490044000100000000001600000046004900
      5200530054005F004F0053005400410054000100000000001A00000043005500
      5200520045004E0054005F004F0053005400410054000100000000001A000000
      500055005200430048004100530045005F005400550052004E00010000000000
      18000000530045004C004C0049004E0047005F005400550052004E0001000000
      0000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 193
    object ODSRateTurnDAT: TDateTimeField
      DisplayLabel = #1090#1072#1088#1080#1093
      FieldName = 'DAT'
      Required = True
    end
    object ODSRateTurnVAL_NAME: TWideStringField
      DisplayLabel = #1042#1072#1083#1081#1091#1090#1072
      FieldName = 'VAL_NAME'
      Size = 5
    end
    object ODSRateTurnVAL_PURCHASE_COURSE: TFloatField
      DisplayLabel = #1040#1083#1099#1096' '#1082#1091#1088#1089#1091
      FieldName = 'VAL_PURCHASE_COURSE'
    end
    object ODSRateTurnVAL_SELLING_COURSE: TFloatField
      DisplayLabel = #1057#1072#1090#1099#1096' '#1082#1091#1088#1089#1091
      FieldName = 'VAL_SELLING_COURSE'
    end
    object ODSRateTurnVAL_NB_COURSE: TFloatField
      DisplayLabel = #1052'.'#1041' '#1082#1091#1088#1089#1091
      FieldName = 'VAL_NB_COURSE'
    end
  end
  object ODSAcc_main_cred: TOracleDataSet
    SQL.Strings = (
      'select '
      '       id,'
      '       acc_no'
      'from '
      '        account   '
      'where '
      '       bal_cn1 =:balance'
      'and'
      '       val_acc=:val_id')
    Optimize = False
    Variables.Data = {
      0400000002000000100000003A00420041004C0041004E004300450003000000
      04000000F5030000000000000E0000003A00560041004C005F00490044000400
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000200000004000000490044000100000000000C000000410043004300
      5F004E004F00010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 232
    Top = 313
  end
  object DSAcc_main_cred: TDataSource
    DataSet = ODSAcc_main_cred
    Left = 409
    Top = 242
  end
  object ODSAcc_child_debt: TOracleDataSet
    SQL.Strings = (
      'select '
      '       id,'
      '       acc_no'
      'from '
      '        account   '
      'where '
      '       bal_cn1 =:balance')
    Optimize = False
    Variables.Data = {
      0400000001000000100000003A00420041004C0041004E004300450003000000
      040000000F1A000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 120
    Top = 313
  end
  object DSAcc_child_debt: TDataSource
    DataSet = ODSAcc_child_debt
    Left = 688
    Top = 177
  end
  object ODSAcc_child_cred: TOracleDataSet
    SQL.Strings = (
      'select '
      '       id,'
      '       acc_no'
      'from '
      '        account   '
      'where '
      '       bal_cn1 =:balance')
    Optimize = False
    Variables.Data = {
      0400000001000000100000003A00420041004C0041004E004300450003000000
      04000000DF21000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 328
    Top = 401
  end
  object DSAcc_child_cred: TDataSource
    DataSet = ODSAcc_child_cred
    Left = 680
    Top = 241
  end
  object ODSSumTrans: TOracleDataSet
    SQL.Strings = (
      'select '
      '        sum(fee_amount) as fee_amount'
      'from '
      '        ex_provarch'
      'where '
      '        ex_id=:ex_id'
      'and'
      '        dat=(select max(dat) from ex_provarch)'
      'and'
      '        status in(1,2,3)'
      ''
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00450058005F00490044000400000000000000
      00000000}
    Cursor = crSQLWait
    Master = ODSExchProvarch
    MasterFields = 'ex_id'
    Session = sboapiDataModule.SBSession
    Left = 312
    Top = 281
  end
  object DSSumTrans: TDataSource
    DataSet = ODSSumTrans
    Left = 684
    Top = 121
  end
  object ODSUsers: TOracleDataSet
    SQL.Strings = (
      
        'select id,username from USERS where username not in ('#39'EXCHANGEMG' +
        'R'#39','#39'SMART'#39') ORDER BY ID')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 304
    Top = 121
    object ODSUsersID: TFloatField
      FieldName = 'ID'
    end
    object ODSUsersUSERNAME: TWideStringField
      FieldName = 'USERNAME'
    end
  end
  object DSUsers: TDataSource
    DataSet = ODSUsers
    Left = 432
    Top = 409
  end
  object ODsAccount: TOracleDataSet
    SQL.Strings = (
      'select acc_no from account order by acc_no')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 304
    Top = 169
  end
  object DSAccount: TDataSource
    DataSet = ODsAccount
    Left = 680
    Top = 369
  end
  object ODSExp_Provarch: TOracleDataSet
    SQL.Strings = (
      'select r.rowid, r.* from exp_provarch r')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 304
    Top = 225
  end
  object DSExp_Provarch: TDataSource
    DataSet = ODSExp_Provarch
    Left = 504
    Top = 402
  end
  object SBA_ACA: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SB_ACA'
    Cursor = crSQLWait
    Left = 760
    Top = 225
  end
  object Kurs: TOracleDataSet
    SQL.Strings = (
      'select a.val_name,o.* from operkurs o,avalute a'
      'where o.val_kod=a.valute  and o.dat=:datdate  and o.val_kod>0'
      'order by o.VAL_KOD')
    Optimize = False
    Variables.Data = {
      0400000001000000100000003A0044004100540044004100540045000C000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000050000000E000000560041004C005F004B004F004400010000000000
      0A0000004F005300540041005400010000000000060000004400410054000100
      000000000A000000530048004900460052000100000000001000000056004100
      4C005F004E0041004D004500010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 304
    Top = 65
  end
  object OperKURS: TDataSource
    DataSet = Kurs
    Left = 576
    Top = 385
  end
  object ODSFilial: TOracleDataSet
    SQL.Strings = (
      'select * from filial')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000140000004B004F0044005F00460049004C00490041004C00
      010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 320
    Top = 347
  end
  object DS_Filial: TDataSource
    DataSet = ODSFilial
    Left = 632
    Top = 9
  end
  object DSExchRate: TDataSource
    DataSet = ODSExchRate
    Left = 408
    Top = 307
  end
  object ODSDel_ExProvarch: TOracleDataSet
    SQL.Strings = (
      
        'select p.*,decode(p.status,'#39'1'#39', '#39#1072#1083#1099#1096#39', '#39'2'#39','#39#1089#1072#1090#1099#1096#39') as status_s' +
        'tr from ex_provarch_delete p where p.dat between '#39'24-Nov-2006'#39' a' +
        'nd '#39'28-Nov-2006'#39' '
      ''
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000024000000060000004400410054000100000000000C00000053005400
      4100540055005300010000000000120000004F005000450052005F004E004100
      4D00450001000000000004000000490044000100000000001200000043005500
      530054005F004E0041004D004500010000000000140000004300550053005400
      5F004C004E0041004D0045000100000000001600000044004500420049005400
      41004D004F0055004E0054000100000000000E0000004C0041004D004F005500
      4E005400010000000000120000004F0050005F0043004F005500520053004500
      010000000000140000004600450045005F0041004D004F0055004E0054000100
      000000000A000000550053005200490044000100000000001A00000043005500
      530054005F00500041005300530050004F005200540001000000000012000000
      45005800430048005F004E0041004D0045000100000000000C00000056004100
      4C005F00490044000100000000000A000000450058005F004900440001000000
      00001600000043005500530054005F0046004100540048004500520001000000
      00001200000043005500530054005F0044004100540045000100000000001800
      000043005500530054005F0043004F004E004600490052004D00010000000000
      2400000043005500530054005F0047004900560049004E0047005F004D004500
      4D004200450052000100000000001A000000560041004C005F004E0042005F00
      43004F0055005200530045000100000000000E0000004F0050005F0054004900
      4D00450001000000000010000000560041004C005F004E0041004D0045000100
      0000000020000000560041004C005F004300480041004E004700450044005F00
      4E0041004D0045000100000000001C000000560041004C005F00430048004100
      4E004700450044005F004900440001000000000024000000560041004C005F00
      4300480041004E004700450044005F0043004F00550052005300450001000000
      00001800000043005500530054005F0043004F0055004E005400520059000100
      000000000E00000043004F0055004E0054005200590001000000000012000000
      430048005F005300540041005400550053000100000000001000000041005F00
      43004F0055005200530045000100000000000C0000005500530052005F004900
      4400010000000000160000005400520041004E0053005F0043004C004F005300
      450001000000000016000000530045005300530049004F004E004E0041004D00
      450001000000000010000000440045004C005F00540049004D00450001000000
      000012000000440045004C005F00550053005200490044000100000000001800
      0000440045004C005F0055005300450052004E0041004D004500010000000000
      140000005300540041005400550053005F00530054005200010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 312
    Top = 18
  end
  object DS_DelExProvarch: TDataSource
    DataSet = ODSDel_ExProvarch
    Left = 416
    Top = 367
  end
end
