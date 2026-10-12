object DatModConstr: TDatModConstr
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 640
  Width = 716
  object pledgetypesDatSrc: TDataSource
    DataSet = pledgetypes
    Left = 136
    Top = 264
  end
  object pledgetypes: TOracleDataSet
    SQL.Strings = (
      'SELECT id, type'
      '  FROM sbcm_pledgetypes')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 216
    object pledgetypesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object pledgetypesTYPE: TStringField
      FieldName = 'TYPE'
      Size = 32
    end
  end
  object CustomersDatSur: TDataSource
    DataSet = Customers
    Left = 144
    Top = 168
  end
  object Customers: TOracleDataSet
    SQL.Strings = (
      
        'select id ,LASTNAME||'#39'  '#39'||FIRSTNAME||'#39'  '#39'||MIDDLENAME as byr_na' +
        'me  from cc_buyers')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000002000000040000004900440001000000000010000000420059005200
      5F004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 48
    Top = 168
    object CustomersID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CustomersBYR_NAME: TWideStringField
      FieldName = 'BYR_NAME'
      Size = 94
    end
  end
  object ValutesDatSrc: TDataSource
    DataSet = Valutes
    Left = 136
    Top = 114
  end
  object Valutes: TOracleDataSet
    SQL.Strings = (
      'select *from avalute')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 115
  end
  object FilialsDatSrc: TDataSource
    DataSet = Filials
    Left = 136
    Top = 57
  end
  object Filials: TOracleDataSet
    SQL.Strings = (
      'select *from filial')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000140000004B004F0044005F00460049004C00490041004C00
      010000000000}
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 66
    object FilialsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FilialsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
    object FilialsKOD_FILIAL: TWideStringField
      FieldName = 'KOD_FILIAL'
      Size = 6
    end
  end
  object CreditsDatSrc: TDataSource
    DataSet = Credits
    Left = 136
    Top = 8
  end
  object Credits: TOracleDataSet
    SQL.Strings = (
      'select cont.id,'
      '       cont.contractno,'
      
        '       SBCM_CONSTRUCTION.get_credit_customers(cont.clientid) as ' +
        'CustName,'
      
        '       SBCM_CONSTRUCTION.get_contractaccount(ContAcc.loanaccid) ' +
        'as accno,'
      '       cont.opendate,'
      '       cont.closedate,'
      '       av.val_name,'
      '       cont.creditamount,'
      '       cont.amountflatkv,'
      
        '       SBCM_CONSTRUCTION.Get_CompanyID(cont.flatid) as companyid' +
        ','
      
        '       SBCM_CONSTRUCTION.Get_BuildingID(cont.flatid) as Building' +
        'ID,'
      '       cont.flatid,'
      '       cont.buildingno,'
      '       cont.blokno,'
      '       cont.flatno,'
      '       cont.branchid,'
      '       cont.usid,'
      '       cont.commitcontract as status,'
      '       state.rest,'
      
        '       SBCM_CONSTRUCTION.get_contractpayments(cont.id) as payamt' +
        ' '
      '       '
      'from  CONSTUCTION_CONTRACTS_ACTIVE cont ,'
      '      SBCM_CONSTRUCTION_ACCOUNTS  ContAcc,'
      '      CONSTUCTION_curr_state state,'
      '      avalute av'
      'where cont.id = ContAcc.id#'
      'and   Cont.id = state.id#   '
      'and   av.valute = cont.currency     '
      'order by :title    ')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A005400490054004C0045000100000000000000
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 10
    object CreditsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CreditsCONTRACTNO: TStringField
      FieldName = 'CONTRACTNO'
      Required = True
      Size = 30
    end
    object CreditsCUSTNAME: TStringField
      FieldName = 'CUSTNAME'
      Size = 4000
    end
    object CreditsACCNO: TStringField
      FieldName = 'ACCNO'
      Size = 4000
    end
    object CreditsCLOSEDATE: TDateTimeField
      FieldName = 'CLOSEDATE'
      Required = True
    end
    object CreditsOPENDATE: TDateTimeField
      FieldName = 'OPENDATE'
      Required = True
    end
    object CreditsVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object CreditsCREDITAMOUNT: TFloatField
      FieldName = 'CREDITAMOUNT'
      Required = True
    end
    object CreditsAMOUNTFLATKV: TFloatField
      FieldName = 'AMOUNTFLATKV'
      Required = True
    end
    object CreditsBUILDINGNO: TStringField
      FieldName = 'BUILDINGNO'
      Size = 30
    end
    object CreditsBLOKNO: TStringField
      FieldName = 'BLOKNO'
      Size = 30
    end
    object CreditsFLATNO: TStringField
      FieldName = 'FLATNO'
      Size = 30
    end
    object CreditsREST: TFloatField
      FieldName = 'REST'
      Required = True
    end
    object CreditsPAYAMT: TFloatField
      FieldName = 'PAYAMT'
    end
    object CreditsSTATUS: TFloatField
      FieldName = 'STATUS'
    end
    object CreditsBRANCHID: TFloatField
      FieldName = 'BRANCHID'
      Required = True
    end
    object CreditsUSID: TFloatField
      FieldName = 'USID'
      Required = True
    end
    object CreditsCOMPANYID: TFloatField
      FieldName = 'COMPANYID'
    end
    object CreditsBUILDINGID: TFloatField
      FieldName = 'BUILDINGID'
    end
    object CreditsFLATID: TFloatField
      FieldName = 'FLATID'
    end
  end
  object CreditPurposeDatSrc: TDataSource
    DataSet = CreditPurpose
    Left = 344
    Top = 24
  end
  object CC_GENERAL: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CC_GENERAL'
    ParameterMode = pmNamed
    Left = 248
    Top = 72
  end
  object Componies: TOracleDataSet
    SQL.Strings = (
      'SELECT id, comp_name'
      '  FROM cc_companies'
      'order by comp_name'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000200000004000000490044000100000000001200000043004F004D00
      50005F004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 248
    Top = 128
    object ComponiesCOMP_NAME: TWideStringField
      FieldName = 'COMP_NAME'
      Size = 50
    end
    object ComponiesID: TIntegerField
      FieldName = 'ID'
    end
  end
  object ComponiesDatScr: TDataSource
    DataSet = Componies
    Left = 344
    Top = 88
  end
  object buildingsDatSrc: TDataSource
    DataSet = buildings
    Left = 344
    Top = 152
  end
  object buildings: TOracleDataSet
    SQL.Strings = (
      'SELECT id, comp_id, bld_name'
      '  FROM cc_buildings'
      '--where comp_id = :comp_id'
      'order by bld_name'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000000E00000043004F004D00
      50005F00490044000100000000001000000042004C0044005F004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 248
    Top = 184
    object buildingsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object buildingsBLD_NAME: TWideStringField
      FieldName = 'BLD_NAME'
    end
    object buildingsCOMP_ID: TFloatField
      FieldName = 'COMP_ID'
      Required = True
    end
  end
  object FlatsDatSrc: TDataSource
    DataSet = Flats
    Left = 344
    Top = 216
  end
  object Flats: TOracleDataSet
    SQL.Strings = (
      'SELECT id, bld_id, flatnumber'
      '  FROM cc_flats  --where bld_id = :bld_id'
      'order by flatnumber')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000000C00000042004C004400
      5F00490044000100000000001400000046004C00410054004E0055004D004200
      45005200010000000000}
    Session = sboapiDataModule.SBSession
    Left = 248
    Top = 240
    object FlatsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FlatsFLATNUMBER: TWideStringField
      FieldName = 'FLATNUMBER'
      Size = 10
    end
    object FlatsBLD_ID: TFloatField
      FieldName = 'BLD_ID'
      Required = True
    end
  end
  object Users: TOracleDataSet
    SQL.Strings = (
      'select id,name from user$'
      'order by name ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 248
    Top = 299
    object UsersID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object UsersNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
  end
  object UsersDatSrc: TDataSource
    DataSet = Users
    Left = 344
    Top = 288
  end
  object Accounts: TOracleDataSet
    SQL.Strings = (
      'select id,name,acc_no from account'
      'where/* bal_cn1 in (SELECT  balcn'
      '  FROM sbcm_construction_links where parentid =('
      
        'select id from sbcm_construction_link where prname = '#39'CreditBal'#39 +
        ') )'
      'and */'
      'ownid = :BID and'
      ' close_dat is null'
      '')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A00420049004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      45000100000000000C0000004100430043005F004E004F00010000000000}
    Master = Customers
    MasterFields = 'id'
    DetailFields = 'BID'
    Session = sboapiDataModule.SBSession
    Left = 248
    Top = 352
    object AccountsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object AccountsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
    object AccountsACC_NO: TWideStringField
      FieldName = 'ACC_NO'
    end
  end
  object AccountsDatSrc: TDataSource
    DataSet = Accounts
    Left = 136
    Top = 377
  end
  object CreditPurpose: TOracleDataSet
    SQL.Strings = (
      
        'SELECT c.rowid,c.contnum, c.buyer, c.accid, c.branchid, c.flatid' +
        ', c.rest,'
      
        '      c.contcur, c.contamount, c.opendate, c.expdate, c.closedat' +
        'e,f.area,f.price1,'
      
        '       c.interestrate, c.initialamount, c.userid, c.dueinterestr' +
        'ate, c.SQUAREMETRAMOUNT, c.note, c.pricecred'
      '  FROM cc_contracts c ,cc_flats f'
      '  where c.flatid=f.id'
      '  '
      'and c.id = :CrdID      '
      '     ')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00430052004400490044000300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      05000000140000000E00000043004F004E0054004E0055004D00010000000000
      0A000000420055005900450052000100000000000A0000004100430043004900
      4400010000000000100000004200520041004E00430048004900440001000000
      00000C00000046004C0041005400490044000100000000000E00000043004F00
      4E0054004300550052000100000000001400000043004F004E00540041004D00
      4F0055004E005400010000000000100000004F00500045004E00440041005400
      45000100000000000E0000004500580050004400410054004500010000000000
      1200000043004C004F0053004500440041005400450001000000000018000000
      49004E0054004500520045005300540052004100540045000100000000001A00
      000049004E0049005400490041004C0041004D004F0055004E00540001000000
      00000C0000005500530045005200490044000100000000001E00000044005500
      450049004E005400450052004500530054005200410054004500010000000000
      200000005300510055004100520045004D0045005400520041004D004F005500
      4E00540001000000000008000000410052004500410001000000000008000000
      52004500530054000100000000000C0000005000520049004300450031000100
      00000000080000004E004F005400450001000000000012000000500052004900
      430045004300520045004400010000000000}
    OnApplyRecord = CreditPurposeApplyRecord
    Session = sboapiDataModule.SBSession
    OnCalcFields = CreditPurposeCalcFields
    Left = 248
    Top = 24
    object CreditPurposeCONTNUM: TWideStringField
      FieldName = 'CONTNUM'
      Size = 10
    end
    object CreditPurposeBUYER: TFloatField
      FieldName = 'BUYER'
    end
    object CreditPurposeACCID: TFloatField
      FieldName = 'ACCID'
    end
    object CreditPurposeBRANCHID: TFloatField
      FieldName = 'BRANCHID'
    end
    object CreditPurposeFLATID: TFloatField
      FieldName = 'FLATID'
    end
    object CreditPurposeCONTCUR: TFloatField
      FieldName = 'CONTCUR'
    end
    object CreditPurposeCONTAMOUNT: TFloatField
      FieldName = 'CONTAMOUNT'
    end
    object CreditPurposeOPENDATE: TDateTimeField
      FieldName = 'OPENDATE'
    end
    object CreditPurposeEXPDATE: TDateTimeField
      FieldName = 'EXPDATE'
    end
    object CreditPurposeCLOSEDATE: TDateTimeField
      FieldName = 'CLOSEDATE'
    end
    object CreditPurposeINTERESTRATE: TFloatField
      FieldName = 'INTERESTRATE'
    end
    object CreditPurposeINITIALAMOUNT: TFloatField
      FieldName = 'INITIALAMOUNT'
    end
    object CreditPurposeUSERID: TFloatField
      FieldName = 'USERID'
    end
    object CreditPurposeDUEINTERESTRATE: TFloatField
      FieldName = 'DUEINTERESTRATE'
    end
    object CreditPurposePeriodContracts: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PeriodContracts'
      Calculated = True
    end
    object CreditPurposeSQUAREMETRAMOUNT: TFloatField
      FieldName = 'SQUAREMETRAMOUNT'
    end
    object CreditPurposefullammount: TFloatField
      FieldKind = fkCalculated
      FieldName = 'fullammount'
      Calculated = True
    end
    object CreditPurposeAREA: TFloatField
      FieldName = 'AREA'
    end
    object CreditPurposemonthspay: TFloatField
      FieldKind = fkCalculated
      FieldName = 'monthspay'
      Calculated = True
    end
    object CreditPurposeREST: TFloatField
      FieldName = 'REST'
    end
    object CreditPurposerestt: TFloatField
      FieldKind = fkCalculated
      FieldName = 'restt'
      Calculated = True
    end
    object CreditPurposebuyarea: TFloatField
      FieldKind = fkCalculated
      FieldName = 'buyarea'
      Calculated = True
    end
    object CreditPurposePRICE1: TFloatField
      FieldName = 'PRICE1'
    end
    object CreditPurposeNOTE: TFloatField
      FieldName = 'NOTE'
    end
    object CreditPurposePRICECRED: TFloatField
      FieldName = 'PRICECRED'
    end
  end
  object SysDat: TOracleDataSet
    SQL.Strings = (
      'select * from sysdat')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000040000000E000000540045004B005F00440041005400010000000000
      1000000050005200450044005F004400410054000100000000000E0000004100
      520043005F004400410059000100000000000A00000043004C004F0053004500
      010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 48
    Top = 272
    object SysDatTEK_DAT: TDateTimeField
      FieldName = 'TEK_DAT'
      Required = True
    end
    object SysDatPRED_DAT: TDateTimeField
      FieldName = 'PRED_DAT'
    end
    object SysDatARC_DAY: TDateTimeField
      FieldName = 'ARC_DAY'
    end
    object SysDatCLOSE: TIntegerField
      FieldName = 'CLOSE'
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select * from cc_note')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E004F005400
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 584
    Top = 344
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 544
    Top = 384
  end
  object cc_settings: TOracleDataSet
    SQL.Strings = (
      'select * from cc_settings')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000050000000C0000004100430043004300550052000100000000001000
      0000410043004300420041004C0043004E000100000000000E00000041004300
      4300430055005300540001000000000012000000410043004300420052004100
      4E00430048000100000000000E000000410043004300530059004D0042000100
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 592
    Top = 216
    object cc_settingsACCCUR: TFloatField
      FieldName = 'ACCCUR'
    end
    object cc_settingsACCBALCN: TFloatField
      FieldName = 'ACCBALCN'
    end
    object cc_settingsACCCUST: TFloatField
      FieldName = 'ACCCUST'
    end
    object cc_settingsACCBRANCH: TFloatField
      FieldName = 'ACCBRANCH'
    end
    object cc_settingsACCSYMB: TWideStringField
      FieldName = 'ACCSYMB'
    end
  end
  object SBOP: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SBOP'
    Left = 32
    Top = 408
  end
  object cc_bookmarkDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      '  FROM CC_BOOKMARK'
      'where code= :Flatcode')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A0046004C004100540043004F00440045000500
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000170000000E00000043004F004E0054004E0055004D00010000000000
      12000000460049005200530054004E0041004D00450001000000000010000000
      4C004100530054004E0041004D004500010000000000140000004D0049004400
      44004C0045004E0041004D0045000100000000000E0000004100440044005200
      4500530053000100000000001000000050004100530053005000530045005200
      01000000000010000000500041005300530050004E0055004D00010000000000
      1200000050004100530053005000440041005400450001000000000012000000
      5000410053005300500044004500500054000100000000001600000043004F00
      4D00500041004400440052004500530053000100000000001000000042004C00
      44005F004E0041004D0045000100000000001000000045004E00540052004100
      4E00430045000100000000001400000046004C00410054004E0055004D004200
      450052000100000000000A00000052004F004F004D0053000100000000000800
      000041005200450041000100000000000C000000500052004900430045003100
      0100000000001400000043004F004E00540041004D004F0055004E0054000100
      000000000C000000500041005900440041005900010000000000080000004300
      4F00440045000100000000000C000000460046004C004F004F00520001000000
      0000100000004D004F004E005400480050004100590001000000000018000000
      410059004C00490051004F00440045004D0045004C0049000100000000000C00
      000050004500520049004F004400010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 510
    Top = 39
  end
  object Templates: TOracleDataSet
    SQL.Strings = (
      'SELECT T.RowID , T.*'
      '  FROM CC_WR_TEMPLATES T where CUSTTYPE=0')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000040000000400000049004400010000000000080000004E0041004D00
      4500010000000000080000005000410054004800010000000000100000004300
      5500530054005400590050004500010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 592
    Top = 32
    object TemplatesID: TFloatField
      FieldName = 'ID'
    end
    object TemplatesNAME: TWideStringField
      FieldName = 'NAME'
      Size = 255
    end
    object TemplatesPATH: TWideStringField
      FieldName = 'PATH'
      Size = 4000
    end
    object TemplatesCUSTTYPE: TIntegerField
      FieldName = 'CUSTTYPE'
    end
  end
  object DSTemplates: TDataSource
    DataSet = Templates
    Left = 586
    Top = 89
  end
  object ReplaceCustDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   B.TEMPLATEID , B.BOOKMARKNAME , A.FIELDNAME'
      'FROM'
      '   CC_WR_BOOKMARKS B'
      ' , CC_WR_FIELDS A'
      'WHERE'
      '     (B.FIELDID = A.ID)'
      '   AND templateid = :tid'
      '   AND bookmarkname = :bname')
    Optimize = False
    Variables.Data = {
      0400000002000000080000003A00540049004400030000000000000000000000
      0C0000003A0042004E0041004D004500050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000300000014000000540045004D0050004C0041005400450049004400
      0100000000001800000042004F004F004B004D00410052004B004E0041004D00
      4500010000000000120000004600490045004C0044004E0041004D0045000100
      00000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 472
    Top = 143
  end
end
