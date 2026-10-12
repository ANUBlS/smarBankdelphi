object TrancheDataModule: TTrancheDataModule
  OldCreateOrder = False
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
      '  obligation,branchid,mehsulid'
      'from'
      '  CM_ACTIVE'
      'where ID=:ID'
      '')
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000A00000004000000490044000100000000001C0000004E0055004D00
      4200450052004F00460043005200450044004900540001000000000020000000
      4300520045004400490054004C0049004E00450041004D004F0055004E005400
      010000000000080000004E0041004D0045000100000000001000000056004100
      4C005F004E0041004D0045000100000000001000000043005500520052004500
      4E00430059000100000000001400000042004F004F0052004F00570045005200
      49004400010000000000140000004F0042004C00490047004100540049004F00
      4E00010000000000100000004200520041004E00430048004900440001000000
      0000100000004D0045004800530055004C0049004400010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 80
    Top = 144
    object CreditInfoID: TFloatField
      FieldName = 'ID'
      Required = True
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
    object CreditInfoNAME: TWideStringField
      FieldName = 'NAME'
      Size = 4000
    end
    object CreditInfoVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object CreditInfoBRANCHID: TFloatField
      FieldName = 'BRANCHID'
    end
    object CreditInfoMEHSULID: TFloatField
      FieldName = 'MEHSULID'
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
      
        'SELECT   id AS accid, kli_id, acc_no AS accountnumber, NAME AS a' +
        'ccountname'
      '    FROM sb_account'
      '   WHERE ((bal_cn1 IN (SELECT accountnumber'
      '                         FROM cm_aginfo'
      '                        WHERE groupid = (SELECT g.id'
      
        '                                           FROM cm_accountgroups' +
        ' g'
      
        '                                          WHERE g.iname = '#39'Inter' +
        'nalBankAccs'#39'))'
      '          )'
      '         */'
      'ORDER BY kli_id, accountnumber'
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A004B004C0049005F0049004400050000000000
      000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 144
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
  object ods_hesab: TOracleDataSet
    SQL.Strings = (
      'select id,acc_no ||'#39'  '#39'||name acc_no,bal_cn1 from smart.account '
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
      '/*bas ofisde olanda 15010 olmalidi smart.account*/'
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
      050000000300000004000000490044000100000000000C000000410043004300
      5F004E004F000100000000000E000000420041004C005F0043004E0031000100
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 504
    Top = 96
    object ods_hesabID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ods_hesabACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 310
    end
    object ods_hesabBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
    end
  end
  object dsrc_hesab: TDataSource
    DataSet = ods_hesab
    Left = 504
    Top = 160
  end
  object active: TOracleDataSet
    SQL.Strings = (
      
        'select CREDITTYPE,currency,branchid ,mehsulid from cm_active_cre' +
        'dits'
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
  object ods_cust: TOracleDataSet
    SQL.Strings = (
      'select phone_m,passpin from custinfo where idcust=:v_id')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A0056005F004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      05000000020000000E000000500048004F004E0045005F004D00010000000000
      0E0000005000410053005300500049004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 440
    Top = 256
    object ods_custPHONE_M: TWideStringField
      FieldName = 'PHONE_M'
      Size = 100
    end
    object ods_custPASSPIN: TWideStringField
      FieldName = 'PASSPIN'
      Size = 30
    end
  end
  object dsrc_cust: TDataSource
    DataSet = ods_cust
    Left = 512
    Top = 264
  end
end
