object QKİmportDataMod: TQKİmportDataMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 309
  Width = 748
  object DSRC_QK_Import: TDataSource
    DataSet = ODS_QK_Import
    Left = 184
    Top = 72
  end
  object ODS_QK_Import: TOracleDataSet
    SQL.Strings = (
      'SELECT a.rowid,a.*'
      '  FROM qk_import a where a.status=0'
      ''
      ''
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000E000000020000004100010000000000020000004200010000000000
      0200000043000100000000000200000044000100000000000200000045000100
      0000000002000000460001000000000002000000470001000000000002000000
      4800010000000000020000004900010000000000020000004A00010000000000
      0800000049004E0046004F000100000000000400000049004400010000000000
      0C00000053005400410054005500530001000000000004000000490031000100
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 176
    Top = 16
    object ODS_QK_ImportA: TWideStringField
      FieldName = 'A'
      Size = 4000
    end
    object ODS_QK_ImportB: TWideStringField
      FieldName = 'B'
      Size = 4000
    end
    object ODS_QK_ImportC: TWideStringField
      FieldName = 'C'
      Size = 4000
      Transliterate = False
    end
    object ODS_QK_ImportD: TWideStringField
      FieldName = 'D'
      Size = 4000
    end
    object ODS_QK_ImportE: TWideStringField
      FieldName = 'E'
      Size = 4000
    end
    object ODS_QK_ImportF: TWideStringField
      FieldName = 'F'
      Size = 4000
    end
    object ODS_QK_ImportG: TWideStringField
      FieldName = 'G'
      Size = 4000
    end
    object ODS_QK_ImportH: TWideStringField
      FieldName = 'H'
      Size = 4000
    end
    object ODS_QK_ImportI: TWideStringField
      FieldName = 'I'
      Size = 4000
    end
    object ODS_QK_ImportJ: TWideStringField
      FieldName = 'J'
      Size = 4000
    end
    object ODS_QK_ImportINFO: TWideStringField
      FieldName = 'INFO'
      Size = 4000
    end
    object ODS_QK_ImportID: TFloatField
      FieldName = 'ID'
    end
    object ODS_QK_ImportSTATUS: TFloatField
      FieldName = 'STATUS'
    end
    object ODS_QK_ImportI1: TWideStringField
      FieldName = 'I1'
      Size = 4000
    end
  end
  object Ods_FormIncomeAcc: TOracleDataSet
    SQL.Strings = (
      'SELECT a.id, A.ACC_NO, A.NAME, B.BAL_CN FROM'
      '  ACCOUNT A'
      ' ,BAL_SPR1 B '
      'WHERE'
      '  A.BAL_CN1 = B.BAL_CN'
      '  AND'
      '  A.CLOSE_DAT IS NULL  and a.id is not null'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'ORDER BY A.id'
      ' '
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
      05000000040000000C0000004100430043005F004E004F000100000000000800
      00004E0041004D0045000100000000000C000000420041004C005F0043004E00
      0100000000000400000049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 288
    Top = 8
    object Ods_FormIncomeAccBAL_CN: TFloatField
      FieldName = 'BAL_CN'
    end
    object Ods_FormIncomeAccACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 448
    end
    object Ods_FormIncomeAccNAME: TWideStringField
      FieldName = 'NAME'
      Size = 1440
    end
    object Ods_FormIncomeAccID: TFloatField
      FieldName = 'ID'
      Required = True
    end
  end
  object ODS_ACCOUNT: TOracleDataSet
    SQL.Strings = (
      
        'select id,bal_cn1,acc_no,old_acc_no,name from account where clos' +
        'e_dat is  null and id is not null '
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
      'order by id'
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000050000000C0000004100430043005F004E004F000100000000000800
      00004E0041004D00450001000000000004000000490044000100000000000E00
      0000420041004C005F0043004E003100010000000000140000004F004C004400
      5F004100430043005F004E004F00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 384
    Top = 8
    object ODS_ACCOUNTID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODS_ACCOUNTBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
    end
    object ODS_ACCOUNTACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 448
    end
    object ODS_ACCOUNTNAME: TWideStringField
      FieldName = 'NAME'
      Size = 1440
    end
    object ODS_ACCOUNTOLD_ACC_NO: TWideStringField
      FieldName = 'OLD_ACC_NO'
      Size = 448
    end
  end
  object DSRC_FormIncomeAcc: TDataSource
    DataSet = Ods_FormIncomeAcc
    Left = 296
    Top = 64
  end
  object DSRC_ACCOUNT: TDataSource
    DataSet = ODS_ACCOUNT
    Left = 392
    Top = 72
  end
  object ODS_BAL_SPR1: TOracleDataSet
    SQL.Strings = (
      'select bal_cn,balname from bal_spr1 where bal_cn is not null '
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' order by bal_cn'
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
      ''
      ''
      ''
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C000000420041004C005F0043004E000100000000000E00
      0000420041004C004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 472
    Top = 8
    object ODS_BAL_SPR1BAL_CN: TFloatField
      FieldName = 'BAL_CN'
    end
    object ODS_BAL_SPR1BALNAME: TWideStringField
      FieldName = 'BALNAME'
      Size = 1600
    end
  end
  object DSRC_BAL_SPR1: TDataSource
    DataSet = ODS_BAL_SPR1
    Left = 480
    Top = 72
  end
  object qk_accsettings: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'qk_accsettings'
    Left = 216
    Top = 152
  end
  object ODS_QK_ACC_SETTINGS: TOracleDataSet
    SQL.Strings = (
      
        'select id,(select acc_no from account where id=income_acc_id) in' +
        'come_acc_id,'
      'case when b_s_status=1 then'
      '(select acc_no from account where id=balcn_accno_id) '
      'else'
      'to_char(balcn_accno_id)   end as balcn_accno_id'
      ' from qk_acc_settings')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000001A00000049004E004300
      4F004D0045005F004100430043005F00490044000100000000001C0000004200
      41004C0043004E005F004100430043004E004F005F0049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 584
    Top = 7
    object ODS_QK_ACC_SETTINGSID: TFloatField
      FieldName = 'ID'
    end
    object ODS_QK_ACC_SETTINGSINCOME_ACC_ID: TWideStringField
      FieldName = 'INCOME_ACC_ID'
      Size = 448
    end
    object ODS_QK_ACC_SETTINGSBALCN_ACCNO_ID: TWideStringField
      FieldName = 'BALCN_ACCNO_ID'
      Size = 448
    end
  end
  object DSRC_QK_ACC_SETTINGS: TDataSource
    DataSet = ODS_QK_ACC_SETTINGS
    Left = 597
    Top = 72
  end
  object ods_qk_transaction: TOracleDataSet
    SQL.Strings = (
      'SELECT*'
      '  FROM qk_transaction a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000006000000080000004900530049004E00010000000000160000004400
      4500420054005F004100430043005F004E004F000100000000001A0000004300
      520045004400490054005F004100430043005F004E004F000100000000000E00
      000041004D004D004F0055004E00540001000000000016000000440045005300
      4300520049005000540049004F004E000100000000000A000000540052005F00
      49004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 584
    Top = 151
    object ods_qk_transactionID: TFloatField
      FieldName = 'TR_ID'
    end
    object ods_qk_transactionDEBT_ACC_NO: TWideStringField
      FieldName = 'DEBT_ACC_NO'
      Size = 50
    end
    object ods_qk_transactionCREDIT_ACC_NO: TWideStringField
      FieldName = 'CREDIT_ACC_NO'
      Size = 50
    end
    object ods_qk_transactionAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ods_qk_transactionDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 2000
    end
    object ods_qk_transactionISIN: TWideStringField
      FieldName = 'ISIN'
      Size = 50
    end
  end
  object dsrc_qk_transaction: TDataSource
    DataSet = ods_qk_transaction
    Left = 597
    Top = 216
  end
  object ODS_QK_Import_excel: TOracleDataSet
    SQL.Strings = (
      'SELECT a.rowid,a.*'
      '  FROM qk_import_excel a '
      ''
      ''
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000E000000020000004100010000000000020000004200010000000000
      0200000043000100000000000200000044000100000000000200000045000100
      0000000002000000460001000000000002000000470001000000000002000000
      4800010000000000020000004900010000000000020000004A00010000000000
      0800000049004E0046004F000100000000000400000049004400010000000000
      0C00000053005400410054005500530001000000000004000000490031000100
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 56
    Top = 8
    object ODS_QK_Import_excelA: TWideStringField
      FieldName = 'A'
      Size = 4000
    end
    object ODS_QK_Import_excelB: TWideStringField
      FieldName = 'B'
      Size = 4000
    end
    object ODS_QK_Import_excelC: TWideStringField
      FieldName = 'C'
      Size = 4000
    end
    object ODS_QK_Import_excelD: TWideStringField
      FieldName = 'D'
      Size = 4000
    end
    object ODS_QK_Import_excelE: TWideStringField
      FieldName = 'E'
      Size = 4000
    end
    object ODS_QK_Import_excelF: TWideStringField
      FieldName = 'F'
      Size = 4000
    end
    object ODS_QK_Import_excelG: TWideStringField
      FieldName = 'G'
      Size = 4000
    end
    object ODS_QK_Import_excelH: TWideStringField
      FieldName = 'H'
      Size = 4000
    end
    object ODS_QK_Import_excelI: TWideStringField
      FieldName = 'I'
      Size = 4000
    end
    object ODS_QK_Import_excelJ: TWideStringField
      FieldName = 'J'
      Size = 4000
    end
    object ODS_QK_Import_excelINFO: TWideStringField
      FieldName = 'INFO'
      Size = 4000
    end
    object ODS_QK_Import_excelID: TFloatField
      FieldName = 'ID'
    end
    object ODS_QK_Import_excelSTATUS: TFloatField
      FieldName = 'STATUS'
    end
    object ODS_QK_Import_excelI1: TWideStringField
      FieldName = 'I1'
      Size = 4000
    end
  end
  object DSRC_QK_Import_excel: TDataSource
    DataSet = ODS_QK_Import_excel
    Left = 56
    Top = 72
  end
end
