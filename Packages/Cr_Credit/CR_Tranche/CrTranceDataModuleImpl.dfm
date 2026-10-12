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
      '  obligation'
      'from'
      '  CR_ACTIVE'
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
      '   WHERE (    kli_id = :kli_id'
      '          AND bal_cn1 IN (SELECT accountnumber'
      '                            FROM cr_aginfo'
      '                           WHERE groupid = (SELECT g.id'
      
        '                                              FROM cr_accountgro' +
        'ups g'
      
        '                                             WHERE g.iname = '#39'Cl' +
        'ientAccs'#39'))'
      '         )'
      'UNION ALL'
      
        'SELECT   id AS accid, kli_id, acc_no AS accountnumber, NAME AS a' +
        'ccountname'
      '    FROM sb_account'
      '   WHERE ((bal_cn1 IN (SELECT accountnumber'
      '                         FROM cr_aginfo'
      '                        WHERE groupid = (SELECT g.id'
      
        '                                           FROM cr_accountgroups' +
        ' g'
      
        '                                          WHERE g.iname = '#39'Inter' +
        'nalBankAccs'#39'))'
      '          )'
      '         )'
      'ORDER BY kli_id, accountnumber'
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A004B004C0049005F0049004400030000000000
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
  object CR_TRANCHE: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CR_TRANCHE'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Left = 248
    Top = 264
  end
  object TranchesData: TOracleDataSet
    SQL.Strings = (
      'SELECT id, creditid, tranchedate, trancheamount'
      '  FROM cr_tranches'
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
end
