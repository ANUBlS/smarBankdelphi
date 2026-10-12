object GurDm: TGurDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 870
  object MainDSrc: TDataSource
    DataSet = MainDSet
    Left = 32
    Top = 64
  end
  object Pledges: TOracleDataSet
    SQL.Strings = (
      'SELECT id,  description'
      '  FROM cm_pledges')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000002000000040000004900440001000000000016000000440045005300
      4300520049005000540049004F004E00010000000000}
    Cursor = crHourGlass
    Session = sboapiDataModule.SBSession
    Left = 112
    Top = 72
  end
  object DataSrcPledges: TDataSource
    DataSet = Pledges
    Left = 120
    Top = 8
  end
  object pledgsortsDatSrc: TDataSource
    DataSet = pledgsorts
    Left = 216
    Top = 72
  end
  object pledgsorts: TOracleDataSet
    SQL.Strings = (
      'SELECT id, name'
      '  FROM cm_pledgsorts')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 216
    Top = 8
    object pledgsortsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object pledgsortsNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 80
    end
  end
  object Guarante: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CM_Credit'
    Left = 496
    Top = 24
  end
  object CompanyDSet: TOracleDataSet
    SQL.Strings = (
      'select * from CM_GUARCOMPANY')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 328
    Top = 16
  end
  object CompanySrc: TDataSource
    DataSet = CompanyDSet
    Left = 328
    Top = 72
  end
  object OracleQuery1: TOracleQuery
    Session = sboapiDataModule.SBSession
    Optimize = False
    Left = 496
    Top = 88
  end
  object maxid: TOracleDataSet
    SQL.Strings = (
      'select max(id) as mid from CM_GUARCOMPANY')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {0500000001000000060000004D0049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 416
    Top = 16
    object maxidMID: TFloatField
      FieldName = 'MID'
    end
  end
  object BaliSrc: TDataSource
    DataSet = BAliDSet
    Left = 40
    Top = 136
  end
  object BAliDSet: TOracleDataSet
    SQL.Strings = (
      'select g.rowid, g.* from smart.cm_guarantor g'
      'where creditid=:creditid'
      'order by cardid')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00430052004500440049005400490044000300
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000B000000100000004300520045004400490054004900440001000000
      00000C0000004300410052004400490044000100000000001A00000047005500
      4100520041004E0054004F0052004E0041004D00450001000000000016000000
      470055004100520041004E0054004F005200490044000100000000001E000000
      470055004100520041004E0054004F005200530041004C004100520059000100
      00000000140000005A0041004D0049004E0057004F0052004B00310001000000
      0000160000005A0041004D0049004E0041004400520045005300310001000000
      0000120000005A0041004D0049004E00540045004C0031000100000000001400
      00005A004D005000410053005000590045005200310001000000000014000000
      5A004D0050004100530050004400410054003100010000000000120000005A00
      4D00540045004C004D004F0042003100010000000000}
    Session = sboapiDataModule.SBSession
    AfterOpen = BAliDSetAfterOpen
    Left = 39
    Top = 195
    object BAliDSetCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object BAliDSetCARDID: TFloatField
      FieldName = 'CARDID'
    end
    object BAliDSetGUARANTORNAME: TWideStringField
      FieldName = 'GUARANTORNAME'
      Size = 64
    end
    object BAliDSetGUARANTORID: TWideStringField
      FieldName = 'GUARANTORID'
      Size = 64
    end
    object BAliDSetGUARANTORSALARY: TWideStringField
      FieldName = 'GUARANTORSALARY'
      Size = 80
    end
    object BAliDSetZAMINWORK1: TWideStringField
      FieldName = 'ZAMINWORK1'
      Size = 80
    end
    object BAliDSetZAMINADRES1: TWideStringField
      FieldName = 'ZAMINADRES1'
      Size = 80
    end
    object BAliDSetZAMINTEL1: TWideStringField
      FieldName = 'ZAMINTEL1'
      Size = 80
    end
    object BAliDSetZMPASPYER1: TWideStringField
      FieldName = 'ZMPASPYER1'
      Size = 80
    end
    object BAliDSetZMPASPDAT1: TDateTimeField
      FieldName = 'ZMPASPDAT1'
    end
    object BAliDSetZMTELMOB1: TWideStringField
      FieldName = 'ZMTELMOB1'
      Size = 15
    end
  end
  object Credit: TOracleDataSet
    SQL.Strings = (
      '   SELECT max(id) '
      '    as creditid'
      '     FROM cm_active_credits')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000001000000100000004300520045004400490054004900440001000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 600
    Top = 16
    object CreditCREDITID: TFloatField
      FieldName = 'CREDITID'
    end
  end
  object InsSrc: TDataSource
    DataSet = OracleDataSet1
    Left = 107
    Top = 136
  end
  object MainDSet: TOracleDataSet
    SQL.Strings = (
      'select g.rowid, g.* from cm_guarantee g'
      'where creditid=:creditid'
      'order by cardid')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00430052004500440049005400490044000300
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000022000000100000004300520045004400490054004900440001000000
      00001000000050004C0045004400470045004900440001000000000014000000
      50004C0045004400470045004E0041004D004500010000000000140000004800
      4F004C004400450052004E0041004D0045000100000000001A00000048004F00
      4C00440045005200410044004400520045005300530001000000000020000000
      41004E00590049004E0046004F0054004F00440049005300540049004E004700
      01000000000014000000520045004700490053005400520059004E004F000100
      000000001C000000520045004700490053005400520059004100470045004E00
      4300590001000000000018000000520045004700490053005400520059004400
      4100540045000100000000001600000050004C00450044004700450049004E00
      5500530045000100000000001C00000050004C00450044004700450049004E00
      53005500520041004E0054000100000000001E00000049004E00530055005200
      41004E00430045004100470045004E00430059000100000000001E0000004900
      4E0053005500520041004E004300450041004D004F0055004E00540001000000
      00001A00000049004E0053005500520041004E00430045004400410054004500
      0100000000001E00000050004C00450044004700450050005200490043004500
      450056004B0056000100000000002600000050004C0045004400470045005000
      520049004300450054004F005200500041005100480041000100000000000800
      0000540045004D0050000100000000001C00000049004E005300550052004100
      4E0043004500520049004700480054000100000000001600000049004E005300
      5500520041004E0043004500490044000100000000001400000050004C004500
      440047004500490044005F0050000100000000000C000000470051004E004100
      4D004500010000000000120000004700510050004100530050004E0055004D00
      0100000000001200000047005100500041005300500059004500520001000000
      0000140000004700510050004100530050004400410054004500010000000000
      10000000470051004100440052004500530053000100000000000E0000005200
      4500590053005400450052000100000000000E00000053004500520059004100
      4D0048000100000000000A00000047005100540045004C000100000000001600
      000050004C004500440047004500500052004900430045000100000000001400
      000050004C0045004400470053004F005200540053000100000000000E000000
      43004F004D00500041004E0059000100000000001400000043004F004D005000
      41004E0059004400410054000100000000001A00000043004F004D0050004100
      4E0059004500580050004500520054000100000000000C000000430041005200
      440049004400010000000000}
    Session = sboapiDataModule.SBSession
    AfterOpen = MainDSetAfterOpen
    Left = 40
    Top = 16
    object MainDSetCREDITID: TFloatField
      FieldName = 'CREDITID'
    end
    object MainDSetPLEDGEID: TFloatField
      FieldName = 'PLEDGEID'
    end
    object MainDSetPLEDGENAME: TWideStringField
      FieldName = 'PLEDGENAME'
      Size = 128
    end
    object MainDSetHOLDERNAME: TWideStringField
      FieldName = 'HOLDERNAME'
      Size = 128
    end
    object MainDSetHOLDERADDRESS: TWideStringField
      FieldName = 'HOLDERADDRESS'
      Size = 128
    end
    object MainDSetANYINFOTODISTING: TWideStringField
      FieldName = 'ANYINFOTODISTING'
      Size = 128
    end
    object MainDSetREGISTRYNO: TWideStringField
      FieldName = 'REGISTRYNO'
      Size = 128
    end
    object MainDSetREGISTRYAGENCY: TWideStringField
      FieldName = 'REGISTRYAGENCY'
      Size = 64
    end
    object MainDSetREGISTRYDATE: TDateTimeField
      FieldName = 'REGISTRYDATE'
    end
    object MainDSetPLEDGEINUSE: TFloatField
      FieldName = 'PLEDGEINUSE'
    end
    object MainDSetPLEDGEINSURANT: TFloatField
      FieldName = 'PLEDGEINSURANT'
    end
    object MainDSetINSURANCEAGENCY: TFloatField
      FieldName = 'INSURANCEAGENCY'
    end
    object MainDSetINSURANCEAMOUNT: TFloatField
      FieldName = 'INSURANCEAMOUNT'
    end
    object MainDSetINSURANCEDATE: TDateTimeField
      FieldName = 'INSURANCEDATE'
    end
    object MainDSetPLEDGEPRICEEVKV: TFloatField
      FieldName = 'PLEDGEPRICEEVKV'
    end
    object MainDSetPLEDGEPRICETORPAQHA: TFloatField
      FieldName = 'PLEDGEPRICETORPAQHA'
    end
    object MainDSetTEMP: TWideStringField
      FieldName = 'TEMP'
      Size = 32
    end
    object MainDSetINSURANCERIGHT: TFloatField
      FieldName = 'INSURANCERIGHT'
    end
    object MainDSetINSURANCEID: TWideStringField
      FieldName = 'INSURANCEID'
      Size = 22
    end
    object MainDSetPLEDGEID_P: TFloatField
      FieldName = 'PLEDGEID_P'
    end
    object MainDSetGQNAME: TWideStringField
      FieldName = 'GQNAME'
      Size = 60
    end
    object MainDSetGQPASPNUM: TWideStringField
      FieldName = 'GQPASPNUM'
      Size = 13
    end
    object MainDSetGQPASPYER: TWideStringField
      FieldName = 'GQPASPYER'
      Size = 50
    end
    object MainDSetGQPASPDATE: TDateTimeField
      FieldName = 'GQPASPDATE'
    end
    object MainDSetGQADRESS: TWideStringField
      FieldName = 'GQADRESS'
      Size = 120
    end
    object MainDSetREYSTER: TWideStringField
      FieldName = 'REYSTER'
      Size = 128
    end
    object MainDSetSERYAMH: TWideStringField
      FieldName = 'SERYAMH'
    end
    object MainDSetGQTEL: TWideStringField
      FieldName = 'GQTEL'
      Size = 15
    end
    object MainDSetPLEDGEPRICE: TFloatField
      FieldName = 'PLEDGEPRICE'
    end
    object MainDSetPLEDGSORTS: TFloatField
      FieldName = 'PLEDGSORTS'
    end
    object MainDSetCOMPANY: TFloatField
      FieldName = 'COMPANY'
    end
    object MainDSetCOMPANYDAT: TDateTimeField
      FieldName = 'COMPANYDAT'
    end
    object MainDSetCOMPANYEXPERT: TWideStringField
      FieldName = 'COMPANYEXPERT'
      Size = 120
    end
    object MainDSetCARDID: TFloatField
      FieldName = 'CARDID'
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'SELECT id, name, sid'
      '  FROM cm_insuranceagency ')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 112
    Top = 200
  end
end
