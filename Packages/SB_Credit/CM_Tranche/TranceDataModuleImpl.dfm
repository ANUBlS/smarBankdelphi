object TrancheDataModule: TTrancheDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 696
  object CreditInfo: TOracleDataSet
    SQL.Strings = (
      'select'
      '  ID,'
      '  Numberofcredit ,'
      '  CreditLineAmount,'
      '  Name,'
      '  VAL_NAME,'
      '  Currency,'
      '  BoorowerID,'
      '  obligation'
      'from'
      '  CM_ACTIVE'
      'where ID=:ID'
      '')
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400030000000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 80
    Top = 144
    object CreditInfoID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CreditInfoNAME: TWideStringField
      FieldName = 'NAME'
      Size = 64
    end
    object CreditInfoVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object CreditInfoCURRENCY: TFloatField
      FieldName = 'CURRENCY'
      Required = True
    end
    object CreditInfoOBLIGATION: TFloatField
      FieldName = 'OBLIGATION'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object CreditInfoBOOROWERID: TFloatField
      FieldName = 'BOOROWERID'
      Required = True
    end
    object CreditInfoNUMBEROFCREDIT: TWideStringField
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object CreditInfoCREDITLINEAMOUNT: TFloatField
      FieldName = 'CREDITLINEAMOUNT'
      Required = True
    end
  end
  object DataSrcCreditInfo: TDataSource
    DataSet = CreditInfo
    Left = 80
    Top = 80
  end
  object TrancheAccounts: TOracleDataSet
    SQL.Strings = (
      
        'SELECT   id AS accid, kli_id, acc_no AS accountnumber, NAME AS a' +
        'ccountname'
      '    FROM account'
      '   WHERE (    kli_id = :kli_id and close_dat is null'
      '          AND bal_cn1 IN (SELECT accountnumber'
      '                            FROM cm_aginfo'
      '                           WHERE groupid = (SELECT g.id'
      
        '                                              FROM cm_accountgro' +
        'ups g'
      
        '                                             WHERE g.iname = '#39'Cl' +
        'ientAccs'#39'))'
      '         )'
      '/*UNION ALL'
      
        'SELECT   id AS accid, kli_id, acc_no||'#39' '#39'||name AS accountnumber' +
        ', NAME AS accountname'
      '    FROM account'
      '   WHERE ((bal_cn1 IN (SELECT accountnumber'
      '                         FROM cm_aginfo'
      '                        WHERE groupid = (SELECT g.id'
      
        '                                           FROM cm_accountgroups' +
        ' g'
      
        '                                          WHERE g.iname = '#39'Inter' +
        'nalBankAccs'#39'))'
      '          )'
      '         ) and close_dat is null'
      'ORDER BY kli_id, accountnumber*/'
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A004B004C0049005F0049004400030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000040000000A000000410043004300490044000100000000000C000000
      4B004C0049005F00490044000100000000001A0000004100430043004F005500
      4E0054004E0055004D0042004500520001000000000016000000410043004300
      4F0055004E0054004E0041004D004500010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 144
    object TrancheAccountsACCID: TFloatField
      FieldName = 'ACCID'
    end
    object TrancheAccountsKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object TrancheAccountsACCOUNTNUMBER: TWideStringField
      FieldName = 'ACCOUNTNUMBER'
      Size = 28
    end
    object TrancheAccountsACCOUNTNAME: TWideStringField
      FieldName = 'ACCOUNTNAME'
      Size = 90
    end
  end
  object DataSrcTrancheAccounts: TDataSource
    DataSet = TrancheAccounts
    Left = 208
    Top = 80
  end
  object CustAccount: TOracleDataSet
    SQL.Strings = (
      'select '
      '      BOOROWERACCID '
      '   from '
      '      CM_ACCOUNTS'
      ' where CreditID=:CreditID')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00430052004500440049005400490044000300
      00000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 88
    Top = 216
    object CustAccountBOOROWERACCID: TFloatField
      FieldName = 'BOOROWERACCID'
    end
  end
  object CM_TRANCHE: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CM_TRANCHE'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Left = 248
    Top = 264
  end
  object TranchesData: TOracleDataSet
    SQL.Strings = (
      'SELECT id, creditid, tranchedate, trancheamount'
      '  FROM cm_tranches'
      'WHERE CreditID=:CreditID'
      'ORDER BY tranchedate DESC')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00430052004500440049005400490044000300
      00000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 352
    Top = 88
    object TranchesDataID: TFloatField
      DisplayLabel = #8470
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object TranchesDataCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
      Visible = False
    end
    object TranchesDataTRANCHEDATE: TDateTimeField
      DisplayLabel = #1058#1072#1088#1080#1093
      FieldName = 'TRANCHEDATE'
      Required = True
    end
    object TranchesDataTRANCHEAMOUNT: TFloatField
      DisplayLabel = #1052#1103#1073#1083#1103#1100
      FieldName = 'TRANCHEAMOUNT'
      Required = True
      DisplayFormat = '#,##0.00'
    end
  end
  object DataSrcTranches: TDataSource
    DataSet = TranchesData
    Left = 352
    Top = 144
  end
  object DataSourc: TDataSource
    DataSet = OracleDataSet
    Left = 48
    Top = 296
  end
  object OracleDataSet_: TOracleDataSet
    SQL.Strings = (
      'SELECT id, name, return_dat'
      '  FROM cm_returntrance ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      450001000000000014000000520045005400550052004E005F00440041005400
      010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 120
    Top = 296
  end
  object active: TOracleDataSet
    SQL.Strings = (
      
        'select CREDITTYPE,currency,branchid,mehsulid from cm_active_cred' +
        'its'
      'where id=:CrdID')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00430052004400490044000300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      0500000004000000140000004300520045004400490054005400590050004500
      01000000000010000000430055005200520045004E0043005900010000000000
      100000004200520041004E004300480049004400010000000000100000004D00
      45004800530055004C0049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 168
    Top = 24
    object activeCREDITTYPE: TFloatField
      FieldName = 'CREDITTYPE'
      Required = True
    end
    object activeCURRENCY: TFloatField
      FieldName = 'CURRENCY'
    end
    object activeBRANCHID: TFloatField
      FieldName = 'BRANCHID'
    end
    object activeMEHSULID: TFloatField
      FieldName = 'MEHSULID'
    end
  end
  object OracleDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT id, name, return_dat'
      '  FROM cm_returntrance ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      450001000000000014000000520045005400550052004E005F00440041005400
      010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 200
    Top = 320
  end
  object OraclePackage1: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'sbutil'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Left = 432
    Top = 200
  end
  object ods_hesab: TOracleDataSet
    SQL.Strings = (
      
        'select a.id AS accid, kli_id, a.acc_no||'#39' '#39'||a.name AS accountnu' +
        'mber, a.NAME AS accountname,a.acc_no from smart.account a'
      
        ' where bal_cn1 in(45019,45010) and filial=0 and close_dat is nul' +
        'l'
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
    QBEDefinition.QBEFieldDefs = {
      05000000050000000C0000004100430043005F004E004F000100000000000A00
      0000410043004300490044000100000000000C0000004B004C0049005F004900
      44000100000000001A0000004100430043004F0055004E0054004E0055004D00
      420045005200010000000000160000004100430043004F0055004E0054004E00
      41004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 568
    Top = 64
    object ods_hesabACCID: TFloatField
      FieldName = 'ACCID'
      Required = True
    end
    object ods_hesabKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object ods_hesabACCOUNTNUMBER: TWideStringField
      FieldName = 'ACCOUNTNUMBER'
      Size = 310
    end
    object ods_hesabACCOUNTNAME: TWideStringField
      FieldName = 'ACCOUNTNAME'
      Size = 250
    end
    object ods_hesabACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 28
    end
  end
  object dsrc_hesab: TDataSource
    DataSet = ods_hesab
    Left = 568
    Top = 128
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 512
    Top = 216
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      
        'SELECT     a.id AS accid, kli_id, a.acc_no||'#39' '#39'||a.name AS accou' +
        'ntnumber, a.NAME AS accountname,a.acc_no'
      
        '    FROM account a ,cm_usergroups u,cm_active_credits p   where ' +
        'a.acc_no=u.acc_no and p.branchid=u.filial_id'
      '    and u.id=p.usrgroup and  p.id=:creditid '
      ''
      ''
      ''
      ''
      ''
      
        '    --and filial in(select BRANCHID from cm_active_credits where' +
        '  id=:creditid )'
      'ORDER BY kli_id, accountnumber')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00430052004500440049005400490044000300
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000050000000A000000410043004300490044000100000000000C000000
      4B004C0049005F00490044000100000000001A0000004100430043004F005500
      4E0054004E0055004D0042004500520001000000000016000000410043004300
      4F0055004E0054004E0041004D0045000100000000000C000000410043004300
      5F004E004F00010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 512
    Top = 280
    object OracleDataSet1ACCID: TFloatField
      FieldName = 'ACCID'
      Required = True
    end
    object OracleDataSet1KLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object OracleDataSet1ACCOUNTNUMBER: TWideStringField
      FieldName = 'ACCOUNTNUMBER'
      Size = 310
    end
    object OracleDataSet1ACCOUNTNAME: TWideStringField
      FieldName = 'ACCOUNTNAME'
      Size = 250
    end
    object OracleDataSet1ACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 28
    end
  end
end
