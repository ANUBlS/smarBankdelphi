object DataMod: TDataMod
  OldCreateOrder = False
  Left = 249
  Top = 322
  Height = 583
  Width = 828
  object DataAccount: TOracleDataSet
    SQL.Strings = (
      'select'
      'a.id,a.acc_no,a.name,a.val_acc,a.filial,c.inn'
      'from'
      'account a,customers c'
      'where'
      '(a.kli_ID=c.id)and'
      '(a.close_dat is null)'
      'order by a.acc_no')
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 269
  end
  object Account_Source: TDataSource
    DataSet = DataAccount
    Left = 152
    Top = 269
  end
  object DataAccountView: TOracleDataSet
    SQL.Strings = (
      'select * from account')
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 317
  end
  object DS_View: TDataSource
    DataSet = DataAccountView
    Left = 152
    Top = 317
  end
  object DS_BankInfo: TDataSource
    DataSet = DataBankInfo
    Left = 152
    Top = 365
  end
  object DataBankInfo: TOracleDataSet
    SQL.Strings = (
      'select * from bankinfo')
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 365
  end
  object DataBankM: TOracleDataSet
    SQL.Strings = (
      'select * from bankm')
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 413
  end
  object DS_BankM: TDataSource
    DataSet = DataBankM
    Left = 152
    Top = 413
  end
  object DataValute: TOracleDataSet
    SQL.Strings = (
      'select '
      '   * '
      'from '
      '  Avalute')
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 264
    Top = 195
  end
  object XS_BATCHS: TOracleDataSet
    SQL.Strings = (
      'select'
      '  x.*, x.rowid,'
      '  a.acc_no,'
      '  a.name,'
      '  v.val_name'
      'from'
      '  XS_BATCHS x ,'
      '  account a, '
      '  avalute v'
      'where'
      '  x.acc_id = a.id and'
      '  v.valute=a.val_acc and'
      '  (x.transdate>=:BeginDate and x.transdate<=:EndDate)'
      ' order by'
      '  :Title'
      ''
      ''
      ''
      ' '
      ''
      ' '
      ' '
      ' ')
    Variables.Data = {
      03000000030000000A0000003A424547494E444154450C000000000000000000
      0000080000003A454E44444154450C0000000000000000000000060000003A54
      49544C450100000005000000782E69640000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001900000002000000494401000000000004000000465F494401000000
      0000080000004F504552434F4445010000000000060000004143435F49440100
      000000000B000000434C49454E545F4E414D450100000000000B000000434C49
      454E545F434F4445010000000000090000005452414E535F5245460100000000
      0006000000414D4F554E540100000000000700000056414C5F41434301000000
      0000090000005452414E53444154450100000000000400000053454E44010000
      000000060000005354415455530100000000000600000046494C49414C010000
      0000000E0000005452414E53414354494F4E5F49440100000000000A00000043
      4C49454E545F494E4E0100000000000600000055534552494401000000000007
      0000004655534552494401000000000007000000565553455249440100000000
      0007000000415553455249440100000000000500000053444154450100000000
      0008000000555345524E414D45010000000000060000004143435F4E4F010000
      000000040000004E414D450100000000000800000056414C5F4E414D45010000
      00000006000000464F524D4154010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    AfterScroll = XS_BATCHSAfterScroll
    Left = 40
    Top = 5
    object XS_BATCHSID: TFloatField
      FieldName = 'ID'
    end
    object XS_BATCHSF_ID: TFloatField
      FieldName = 'F_ID'
    end
    object XS_BATCHSOPERCODE: TStringField
      FieldName = 'OPERCODE'
      Size = 6
    end
    object XS_BATCHSACC_ID: TFloatField
      FieldName = 'ACC_ID'
    end
    object XS_BATCHSCLIENT_NAME: TStringField
      FieldName = 'CLIENT_NAME'
      Size = 70
    end
    object XS_BATCHSCLIENT_CODE: TStringField
      FieldName = 'CLIENT_CODE'
      Size = 70
    end
    object XS_BATCHSTRANS_REF: TStringField
      FieldName = 'TRANS_REF'
      Size = 16
    end
    object XS_BATCHSAMOUNT: TFloatField
      FieldName = 'AMOUNT'
      currency = True
    end
    object XS_BATCHSVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object XS_BATCHSTRANSDATE: TDateTimeField
      FieldName = 'TRANSDATE'
    end
    object XS_BATCHSSEND: TIntegerField
      FieldName = 'SEND'
    end
    object XS_BATCHSSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object XS_BATCHSFILIAL: TFloatField
      FieldName = 'FILIAL'
    end
    object XS_BATCHSTRANSACTION_ID: TFloatField
      FieldName = 'TRANSACTION_ID'
    end
    object XS_BATCHSCLIENT_INN: TStringField
      FieldName = 'CLIENT_INN'
      Size = 30
    end
    object XS_BATCHSUSERID: TFloatField
      FieldName = 'USERID'
    end
    object XS_BATCHSACC_NO: TStringField
      FieldName = 'ACC_NO'
      Size = 28
    end
    object XS_BATCHSNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object XS_BATCHSVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object XS_BATCHSFUSERID: TStringField
      FieldName = 'FUSERID'
      Size = 50
    end
    object XS_BATCHSVUSERID: TStringField
      FieldName = 'VUSERID'
      Size = 50
    end
    object XS_BATCHSAUSERID: TStringField
      FieldName = 'AUSERID'
      Size = 50
    end
    object XS_BATCHSUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 50
    end
    object XS_BATCHSFORMAT: TStringField
      FieldName = 'FORMAT'
      Size = 10
    end
  end
  object DS_BATCHS: TDataSource
    DataSet = XS_BATCHS
    Left = 152
    Top = 5
  end
  object Ins: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'XS_CONTROL'
    Left = 200
    Top = 563
  end
  object DataCheck: TOracleDataSet
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 264
    Top = 99
  end
  object XS_BENEFICIARY: TOracleDataSet
    SQL.Strings = (
      'select'
      '    x.rowid,'
      '    x.*,'
      '    v.val_name,'
      '    b.name as BankName'
      'from'
      '    XS_BENEFICIARY X,'
      '    avalute v,'
      '    BankM b'
      'where'
      '   (x.batchID=:id)and'
      '   (x.val_cod=v.valute)'
      '  and (x.rec_bank_id=b.id)')
    Variables.Data = {0300000001000000030000003A494405000000040000003232390000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000015000000020000004944010000000000070000004241544348494401
      00000000000B0000005245435F42414E4B5F4944010000000000100000005245
      435F42414E4B5F5355425F4143430100000000000D000000434C49454E545F41
      43435F4E4F0100000000000B000000434C49454E545F4E414D45010000000000
      0B000000434C49454E545F434F44450100000000000A000000434C49454E545F
      494E4E0100000000000900000052454D49545F494E4601000000000009000000
      5452414E535F434F44010000000000070000004144445F494E46010000000000
      0800000056414C5F444154450100000000000700000056414C5F434F44010000
      0000000E0000004D4553535F5245464552454E43450100000000000600000041
      4D4F554E5401000000000008000000424E46434F554E54010000000000060000
      005354415455530100000000000E0000005452414E53414354494F4E5F494401
      0000000000060000005553455249440100000000000800000056414C5F4E414D
      450100000000000800000042414E4B4E414D45010000000000}
    Cursor = crSQLWait
    Master = XS_BATCHS
    MasterFields = 'ID'
    DetailFields = 'ID'
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    AfterScroll = XS_BENEFICIARYAfterScroll
    Left = 40
    Top = 45
    object XS_BENEFICIARYID: TFloatField
      FieldName = 'ID'
    end
    object XS_BENEFICIARYBATCHID: TFloatField
      FieldName = 'BATCHID'
    end
    object XS_BENEFICIARYREC_BANK_ID: TFloatField
      FieldName = 'REC_BANK_ID'
    end
    object XS_BENEFICIARYREC_BANK_SUB_ACC: TFloatField
      FieldName = 'REC_BANK_SUB_ACC'
    end
    object XS_BENEFICIARYCLIENT_ACC_NO: TStringField
      FieldName = 'CLIENT_ACC_NO'
      Size = 34
    end
    object XS_BENEFICIARYCLIENT_NAME: TStringField
      FieldName = 'CLIENT_NAME'
      Size = 70
    end
    object XS_BENEFICIARYCLIENT_CODE: TStringField
      FieldName = 'CLIENT_CODE'
      Size = 70
    end
    object XS_BENEFICIARYCLIENT_INN: TStringField
      FieldName = 'CLIENT_INN'
      Size = 30
    end
    object XS_BENEFICIARYREMIT_INF: TStringField
      FieldName = 'REMIT_INF'
      Size = 145
    end
    object XS_BENEFICIARYTRANS_COD: TIntegerField
      FieldName = 'TRANS_COD'
    end
    object XS_BENEFICIARYADD_INF: TStringField
      FieldName = 'ADD_INF'
      Size = 107
    end
    object XS_BENEFICIARYVAL_DATE: TDateTimeField
      FieldName = 'VAL_DATE'
    end
    object XS_BENEFICIARYVAL_COD: TIntegerField
      FieldName = 'VAL_COD'
    end
    object XS_BENEFICIARYMESS_REFERENCE: TStringField
      FieldName = 'MESS_REFERENCE'
      Size = 16
    end
    object XS_BENEFICIARYAMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object XS_BENEFICIARYBNFCOUNT: TIntegerField
      FieldName = 'BNFCOUNT'
    end
    object XS_BENEFICIARYSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object XS_BENEFICIARYTRANSACTION_ID: TFloatField
      FieldName = 'TRANSACTION_ID'
    end
    object XS_BENEFICIARYUSERID: TFloatField
      FieldName = 'USERID'
    end
    object XS_BENEFICIARYVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object XS_BENEFICIARYBANKNAME: TStringField
      FieldName = 'BANKNAME'
      Size = 255
    end
  end
  object DS_BENEFICIARY: TDataSource
    DataSet = XS_BENEFICIARY
    Left = 152
    Top = 45
  end
  object Del: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'XS_CONTROL'
    Left = 240
    Top = 563
  end
  object GetReference: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'XS_CONTROL'
    Left = 80
    Top = 563
  end
  object XS_CONFIG: TOracleDataSet
    SQL.Strings = (
      'select'
      '    *'
      'from'
      '    XS_CONFIG'
      ' ')
    QBEDefinition.QBEFieldDefs = {
      040000000C00000002000000494401000000000006000000494E5F4449520100
      00000000070000004F55545F4449520100000000000C000000414D4F554E545F
      4C494D4954010000000000070000004143434F554E540100000000000B000000
      415243484956455F4449520100000000000B00000055534542414E4B44415445
      0100000000000B000000434F4D4D4953494F4E4944010000000000080000004E
      425F53574946540100000000000A000000434F524143434F554E540100000000
      00080000004E45575F44415445010000000000070000005645525F4449520100
      00000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 264
    Top = 54
    object XS_CONFIGID: TFloatField
      FieldName = 'ID'
    end
    object XS_CONFIGIN_DIR: TStringField
      FieldName = 'IN_DIR'
      Size = 250
    end
    object XS_CONFIGOUT_DIR: TStringField
      FieldName = 'OUT_DIR'
      Size = 250
    end
    object XS_CONFIGAMOUNT_LIMIT: TFloatField
      FieldName = 'AMOUNT_LIMIT'
    end
    object XS_CONFIGACCOUNT: TStringField
      FieldName = 'ACCOUNT'
      Size = 13
    end
    object XS_CONFIGARCHIVE_DIR: TStringField
      FieldName = 'ARCHIVE_DIR'
      Size = 250
    end
    object XS_CONFIGUSEBANKDATE: TFloatField
      FieldName = 'USEBANKDATE'
    end
    object XS_CONFIGCOMMISIONID: TFloatField
      FieldName = 'COMMISIONID'
    end
    object XS_CONFIGNB_SWIFT: TStringField
      FieldName = 'NB_SWIFT'
      Size = 15
    end
    object XS_CONFIGCORACCOUNT: TStringField
      FieldName = 'CORACCOUNT'
    end
    object XS_CONFIGNEW_DATE: TDateTimeField
      FieldName = 'NEW_DATE'
    end
    object XS_CONFIGVER_DIR: TStringField
      FieldName = 'VER_DIR'
      Size = 250
    end
  end
  object DSTransTypeCode: TDataSource
    DataSet = TransTypeCode
    Left = 152
    Top = 130
  end
  object PackTemp: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'XS_CONTROL'
    Left = 16
    Top = 563
  end
  object DataTemp: TOracleDataSet
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 264
    Top = 147
  end
  object XS_INCOMING: TOracleDataSet
    SQL.Strings = (
      'select'
      '   *'
      'from'
      '   XS_INCOMINGVIEWALL x'
      'where  (x.trans_date>=:BeginDate and x.trans_date<=:EndDate)'
      ''
      '')
    Variables.Data = {
      03000000020000000A0000003A424547494E444154450C000000000000000000
      0000080000003A454E44444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001C000000020000004944010000000000090000005245464552454E43
      450100000000000700000056414C5F434F4401000000000006000000414D4F55
      4E540100000000000700000053454E5F4143430100000000000800000053454E
      5F4E414D450100000000000700000053454E5F494E4E0100000000000B000000
      53454E5F42414E4B5F49440100000000000F00000053454E5F42414E4B5F5355
      424143430100000000000F0000005245435F42414E4B5F535542414343010000
      0000000C0000005245435F42414E4B5F42494B0100000000000E000000524543
      5F434C49454E545F414343010000000000110000005245435F434C49454E545F
      4143435F49440100000000000F0000005245435F434C49454E545F4E414D4501
      00000000000E0000005245435F434C49454E545F494E4E010000000000090000
      0052454D49545F494E460100000000000800000054595045434F444501000000
      0000070000004144445F494E460100000000000A0000005452414E535F444154
      45010000000000060000005354415455530100000000000600000046494C4941
      4C0100000000000600000055534552494401000000000004000000465F323001
      000000000004000000465F32310100000000000800000056414C5F4E414D4501
      0000000000040000004E414D450100000000001100000044455343525054494F
      4E434F5252454354010000000000130000004D41494E5F5245435F434C49454E
      545F414343010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 240
    Top = 6
  end
  object XS_IncomingView: TOracleDataSet
    SQL.Strings = (
      'select * from xs_incomingview x'
      ''
      'order by :title'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Variables.Data = {
      0300000001000000060000003A5449544C450100000005000000782E69640000
      000000}
    QBEDefinition.QBEFieldDefs = {
      040000001F000000020000004944010000000000090000005245464552454E43
      450100000000000700000056414C5F434F4401000000000006000000414D4F55
      4E540100000000000700000053454E5F4143430100000000000800000053454E
      5F4E414D450100000000000700000053454E5F494E4E0100000000000B000000
      53454E5F42414E4B5F49440100000000000F00000053454E5F42414E4B5F5355
      424143430100000000000F0000005245435F42414E4B5F535542414343010000
      0000000C0000005245435F42414E4B5F42494B0100000000000E000000524543
      5F434C49454E545F414343010000000000110000005245435F434C49454E545F
      4143435F49440100000000000F0000005245435F434C49454E545F4E414D4501
      00000000000E0000005245435F434C49454E545F494E4E010000000000090000
      0052454D49545F494E460100000000000800000054595045434F444501000000
      0000070000004144445F494E460100000000000A0000005452414E535F444154
      45010000000000060000005354415455530100000000000600000046494C4941
      4C010000000000060000005553455249440100000000000800000056414C5F4E
      414D45010000000000040000004E414D4501000000000004000000465F323001
      000000000004000000465F32310100000000001100000044455343525054494F
      4E434F5252454354010000000000130000004D41494E5F5245435F434C49454E
      545F4143430100000000000400000050415254010000000000130000004D4149
      4E5F5245435F434C49454E545F494E4E0100000000000B0000004D41494E5F46
      494C49414C010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    AfterScroll = XS_IncomingViewAfterScroll
    Left = 40
    Top = 85
  end
  object DS_XS_IncomingView: TDataSource
    DataSet = XS_IncomingView
    Left = 152
    Top = 85
  end
  object GetSysDate: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SBOP'
    Left = 152
    Top = 563
  end
  object DataSetFilial: TOracleDataSet
    SQL.Strings = (
      'select * from Filial where id =:filialID')
    Variables.Data = {
      0300000001000000090000003A46494C49414C49440300000000000000000000
      00}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 461
    object DataSetFilialID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DataSetFilialNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object DataSourceFilial: TDataSource
    DataSet = DataSetFilial
    Left = 152
    Top = 461
  end
  object DataBatchFilialView: TOracleDataSet
    SQL.Strings = (
      'select'
      '   f.name'
      'from'
      '  Filial f,'
      '  xs_batchs x'
      'where'
      '  (f.id =x.filial)and'
      '  (x.filial>0)'
      ' ')
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 221
  end
  object DS_FilialView: TDataSource
    DataSet = DataBatchFilialView
    Left = 152
    Top = 212
  end
  object TransTypeName: TOracleDataSet
    SQL.Strings = (
      'select'
      '   *'
      'from'
      '    XS_transtype_name'
      ' order by id')
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 173
  end
  object DSTransTypeName: TDataSource
    DataSet = TransTypeName
    Left = 152
    Top = 164
  end
  object TransTypeCode: TOracleDataSet
    SQL.Strings = (
      'select'
      '   *'
      'From'
      '  xs_transtype_code x'
      'where '
      '  x.nameID=:ID'
      ' ')
    Variables.Data = {0300000001000000030000003A4944050000000000000000000000}
    Cursor = crSQLWait
    Master = TransTypeName
    MasterFields = 'ID'
    DetailFields = 'ID'
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 131
    object TransTypeCodeCODE: TIntegerField
      FieldName = 'CODE'
    end
    object TransTypeCodeNAME: TStringField
      FieldName = 'NAME'
      Size = 40
    end
    object TransTypeCodeNAMEID: TFloatField
      FieldName = 'NAMEID'
    end
    object TransTypeCodeID: TFloatField
      FieldName = 'ID'
    end
  end
  object SB_ACA: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SB_ACA'
    Left = 280
    Top = 563
  end
  object XS_BatchsArchive: TOracleDataSet
    SQL.Strings = (
      'select'
      '  x.*, x.rowid,'
      '  a.acc_no,'
      '  a.name,'
      '  v.val_name'
      'from'
      '  XS_BATCHS_Archive x ,'
      '  account a, '
      '  avalute v'
      'where'
      '  x.acc_id = a.id and'
      '  v.valute=a.val_acc and'
      '  (x.transdate>=:BeginDate and x.transdate<=:EndDate)'
      ''
      ''
      ''
      ''
      ' '
      ''
      ' '
      ' '
      ' ')
    Variables.Data = {
      03000000020000000A0000003A424547494E444154450C000000000000000000
      0000080000003A454E44444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001900000002000000494401000000000004000000465F494401000000
      0000080000004F504552434F4445010000000000060000004143435F49440100
      000000000B000000434C49454E545F4E414D450100000000000B000000434C49
      454E545F434F4445010000000000090000005452414E535F5245460100000000
      0006000000414D4F554E540100000000000700000056414C5F41434301000000
      0000090000005452414E53444154450100000000000400000053454E44010000
      000000060000005354415455530100000000000600000046494C49414C010000
      0000000E0000005452414E53414354494F4E5F49440100000000000A00000043
      4C49454E545F494E4E0100000000000600000055534552494401000000000007
      0000004655534552494401000000000007000000565553455249440100000000
      0007000000415553455249440100000000000500000053444154450100000000
      0008000000555345524E414D45010000000000060000004143435F4E4F010000
      000000040000004E414D450100000000000800000056414C5F4E414D45010000
      00000006000000464F524D4154010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    AfterScroll = XS_BatchsArchiveAfterScroll
    Left = 416
    Top = 5
    object FloatField1: TFloatField
      FieldName = 'ID'
    end
    object FloatField2: TFloatField
      FieldName = 'F_ID'
    end
    object StringField1: TStringField
      FieldName = 'OPERCODE'
      Size = 6
    end
    object FloatField3: TFloatField
      FieldName = 'ACC_ID'
    end
    object StringField2: TStringField
      FieldName = 'CLIENT_NAME'
      Size = 70
    end
    object StringField3: TStringField
      FieldName = 'CLIENT_CODE'
      Size = 70
    end
    object StringField4: TStringField
      FieldName = 'TRANS_REF'
      Size = 16
    end
    object FloatField4: TFloatField
      FieldName = 'AMOUNT'
      currency = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'TRANSDATE'
    end
    object IntegerField2: TIntegerField
      FieldName = 'SEND'
    end
    object IntegerField3: TIntegerField
      FieldName = 'STATUS'
    end
    object FloatField5: TFloatField
      FieldName = 'FILIAL'
    end
    object FloatField6: TFloatField
      FieldName = 'TRANSACTION_ID'
    end
    object StringField5: TStringField
      FieldName = 'CLIENT_INN'
      Size = 30
    end
    object FloatField7: TFloatField
      FieldName = 'USERID'
    end
    object StringField6: TStringField
      FieldName = 'ACC_NO'
      Size = 28
    end
    object StringField7: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object StringField8: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object XS_BatchsArchiveFUSERID: TStringField
      FieldName = 'FUSERID'
      Size = 50
    end
    object XS_BatchsArchiveVUSERID: TStringField
      FieldName = 'VUSERID'
      Size = 50
    end
    object XS_BatchsArchiveAUSERID: TStringField
      FieldName = 'AUSERID'
      Size = 50
    end
    object XS_BatchsArchiveSDATE: TDateTimeField
      FieldName = 'SDATE'
    end
    object XS_BatchsArchiveUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 50
    end
    object XS_BatchsArchiveFORMAT: TStringField
      FieldName = 'FORMAT'
      Size = 10
    end
  end
  object DS_BatchsArchive: TDataSource
    DataSet = XS_BatchsArchive
    Left = 504
    Top = 5
  end
  object DS_BeneficiaryArchive: TDataSource
    DataSet = XS_BeneficiaryArchive
    Left = 504
    Top = 53
  end
  object XS_BeneficiaryArchive: TOracleDataSet
    SQL.Strings = (
      'select'
      '    x.rowid,'
      '    x.*,'
      '    v.val_name,'
      '    b.name as BankName'
      'from'
      '    XS_BENEFICIARY_Archive X,'
      '    avalute v,'
      '    BankM b'
      'where'
      '   (x.batchID=:id)and'
      '   (x.val_cod=v.valute)'
      '  and (x.rec_bank_id=b.id)')
    Variables.Data = {0300000001000000030000003A494405000000040000003232390000000000}
    Cursor = crSQLWait
    Master = XS_BatchsArchive
    MasterFields = 'ID'
    DetailFields = 'ID'
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 376
    Top = 53
    object FloatField8: TFloatField
      FieldName = 'ID'
    end
    object FloatField9: TFloatField
      FieldName = 'BATCHID'
    end
    object FloatField10: TFloatField
      FieldName = 'REC_BANK_ID'
    end
    object FloatField11: TFloatField
      FieldName = 'REC_BANK_SUB_ACC'
    end
    object StringField9: TStringField
      FieldName = 'CLIENT_ACC_NO'
      Size = 34
    end
    object StringField10: TStringField
      FieldName = 'CLIENT_NAME'
      Size = 70
    end
    object StringField11: TStringField
      FieldName = 'CLIENT_CODE'
      Size = 70
    end
    object StringField12: TStringField
      FieldName = 'REMIT_INF'
      Size = 145
    end
    object IntegerField4: TIntegerField
      FieldName = 'TRANS_COD'
    end
    object StringField13: TStringField
      FieldName = 'ADD_INF'
      Size = 108
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'VAL_DATE'
    end
    object IntegerField5: TIntegerField
      FieldName = 'VAL_COD'
    end
    object StringField14: TStringField
      FieldName = 'MESS_REFERENCE'
      Size = 16
    end
    object FloatField12: TFloatField
      FieldName = 'AMOUNT'
      currency = True
    end
    object IntegerField6: TIntegerField
      FieldName = 'BNFCOUNT'
    end
    object IntegerField7: TIntegerField
      FieldName = 'STATUS'
    end
    object FloatField13: TFloatField
      FieldName = 'TRANSACTION_ID'
    end
    object StringField15: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object StringField16: TStringField
      FieldName = 'CLIENT_INN'
      Size = 30
    end
    object StringField17: TStringField
      FieldName = 'BANKNAME'
      Size = 256
    end
  end
  object ODS_shablon: TOracleDataSet
    SQL.Strings = (
      
        'SELECT mebleg, odenish_kod, bankin_kodu, hesab_no, adi, kodu, vo' +
        'en,'
      
        '       od_tey1, od_tey2, od_tey3, od_tey4, elave_mel1, elave_mel' +
        '2,'
      '       elave_mel3, shablonun_adi, bankin_adi, odenish'
      '  FROM xs_beneficiary_shablon'
      'order by odenish')
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 376
    Top = 533
  end
  object DS_shablon: TDataSource
    DataSet = ODS_shablon
    Left = 504
    Top = 533
  end
  object ODS_XS_Filter: TOracleDataSet
    SQL.Strings = (
      'select * from XS_FILTER')
    QBEDefinition.QBEFieldDefs = {0400000001000000060000004143435F4944010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 376
    Top = 485
  end
  object DS_XS_Filter: TDataSource
    DataSet = ODS_XS_Filter
    Left = 504
    Top = 485
  end
  object ODS_Institution: TOracleDataSet
    SQL.Strings = (
      'SELECT a.rowid,a.*'
      '  FROM xs_institution a')
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    AfterScroll = ODS_InstitutionAfterScroll
    Left = 376
    Top = 99
  end
  object ODS_BudgetLevel: TOracleDataSet
    SQL.Strings = (
      'SELECT b.rowid,b.*'
      '  FROM xs_budgetlevel b')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000040000004E414D4501000000
      00000B0000004445534352495054494F4E010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    AfterScroll = ODS_BudgetLevelAfterScroll
    Left = 376
    Top = 147
  end
  object ODS_Destination: TOracleDataSet
    SQL.Strings = (
      'SELECT c.rowid,c.*'
      '  FROM xs_destination c')
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    AfterScroll = ODS_DestinationAfterScroll
    Left = 376
    Top = 195
  end
  object DS_Institution: TDataSource
    DataSet = ODS_Institution
    Left = 504
    Top = 99
  end
  object DS_BudgetLevel: TDataSource
    DataSet = ODS_BudgetLevel
    Left = 504
    Top = 147
  end
  object DS_Destination: TDataSource
    DataSet = ODS_Destination
    Left = 504
    Top = 195
  end
  object ODS_Report: TOracleDataSet
    SQL.Strings = (
      'select * from xs_beneficiary')
    QBEDefinition.QBEFieldDefs = {
      0400000013000000020000004944010000000000070000004241544348494401
      00000000000B0000005245435F42414E4B5F4944010000000000100000005245
      435F42414E4B5F5355425F4143430100000000000D000000434C49454E545F41
      43435F4E4F0100000000000B000000434C49454E545F4E414D45010000000000
      0B000000434C49454E545F434F44450100000000000A000000434C49454E545F
      494E4E0100000000000900000052454D49545F494E4601000000000009000000
      5452414E535F434F44010000000000070000004144445F494E46010000000000
      0800000056414C5F444154450100000000000700000056414C5F434F44010000
      0000000E0000004D4553535F5245464552454E43450100000000000600000041
      4D4F554E5401000000000008000000424E46434F554E54010000000000060000
      005354415455530100000000000E0000005452414E53414354494F4E5F494401
      000000000006000000555345524944010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 376
    Top = 243
  end
  object DS_Report: TDataSource
    DataSet = ODS_Report
    Left = 504
    Top = 243
  end
  object ODS_Report_Temp: TOracleDataSet
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 376
    Top = 291
  end
  object ODS_Admin_Setting: TOracleDataSet
    SQL.Strings = (
      'select id,NAME from user$'
      'where SB_ACA.checkmodaccess_int('#39'LVPCSSMANAGER'#39',name)=1'
      'order by name')
    Cursor = crSQLWait
    DetailFields = 'ID'
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 376
    Top = 339
  end
  object DS_Admin_Setting: TDataSource
    DataSet = ODS_Admin_Setting
    Left = 504
    Top = 339
  end
  object ODS_Ad_Sett_Fili: TOracleDataSet
    SQL.Strings = (
      'select fi.id,fi.name from filial fi'
      
        '--where  (fi.id not in (select xs.filial_id from xs_admin_in xs ' +
        'where xs.user_id=:USER_ID))'
      '--   and (x.FILIAL_ID <> fi.id)'
      '--   and (x.user_id=:USER_ID)'
      '--group by fi.id,fi.name,x.user_id '
      'order by fi.id'
      '')
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 376
    Top = 387
  end
  object DS_Ad_Sett_Fili: TDataSource
    DataSet = ODS_Ad_Sett_Fili
    Left = 504
    Top = 387
  end
  object ODS_Admin_in: TOracleDataSet
    SQL.Strings = (
      'select XS_A_I.* from xs_admin_in XS_A_I'
      'where XS_A_I.USER_ID=:USER_ID')
    Variables.Data = {
      0300000001000000080000003A555345525F4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000007000000555345525F494401000000000009000000555345
      525F4E414D450100000000000900000046494C49414C5F49440100000000000B
      00000046494C49414C5F4E414D45010000000000}
    Cursor = crSQLWait
    Master = ODS_Admin_Setting
    MasterFields = 'ID'
    DetailFields = 'USER_ID'
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 376
    Top = 437
  end
  object DS_Admin_in: TDataSource
    DataSet = ODS_Admin_in
    Left = 504
    Top = 443
  end
  object ODSSum: TOracleDataSet
    SQL.Strings = (
      'update xs_transtype_code set SUM_AMMOUNT=0'
      'where ACC_ID is not null')
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 520
  end
  object DS_CODE: TDataSource
    DataSet = ODS_CODE
    Left = 200
    Top = 520
  end
  object ODS_CODE: TOracleDataSet
    SQL.Strings = (
      'select CODE from xs_transtype_code where NAMEID in(1,5)'
      'group by CODE '
      'order by code')
    QBEDefinition.QBEFieldDefs = {
      040000000600000004000000434F4445010000000000040000004E414D450100
      00000000060000004E414D454944010000000000020000004944010000000000
      060000004143435F49440100000000000B00000053554D5F414D4D4F554E5401
      0000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 136
    Top = 520
  end
  object DataSum: TOracleDataSet
    SQL.Strings = (
      'select sum(amount) as Sumammount from xs_incoming'
      
        'where trans_date=:t_date and typecode=:t_code and REFERENCE=:T_R' +
        'EFERENCE and filial=:t_filial'
      ''
      ''
      ''
      '')
    Variables.Data = {
      0300000004000000070000003A545F444154450C000000000000000000000007
      0000003A545F434F44450300000000000000000000000C0000003A545F524546
      4552454E4345050000000000000000000000090000003A545F46494C49414C03
      0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000A00000053554D414D4D4F554E54010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 376
    Top = 584
  end
  object ODS_CODEID: TOracleDataSet
    SQL.Strings = (
      'select * from xs_transtype_code'
      'where code=:t_code')
    Variables.Data = {0300000001000000070000003A545F434F4445030000000000000000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 456
    Top = 592
  end
  object DS_XS_INCOMING: TDataSource
    DataSet = XS_INCOMING
    Left = 344
    Top = 5
  end
  object Data_Admin_in: TOracleDataSet
    SQL.Strings = (
      
        'select -1 as filial_id, '#39'ֱצעצם פטכטאכאנ'#39' as filial_name from Dua' +
        'l'
      'Union All'
      'select filial_id,filial_name from xs_admin_in '
      'where USER_ID=uid')
    QBEDefinition.QBEFieldDefs = {
      040000000400000007000000555345525F494401000000000009000000555345
      525F4E414D450100000000000900000046494C49414C5F49440100000000000B
      00000046494C49414C5F4E414D45010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 669
  end
  object DS_Adminin: TDataSource
    DataSet = Data_Admin_in
    Left = 112
    Top = 667
  end
  object Data_Code: TOracleDataSet
    SQL.Strings = (
      'select -1 as code from Dual'
      'Union All'
      'select CODE from xs_transtype_code where NAMEID in(1,5)'
      'group by CODE  '
      'order by code')
    QBEDefinition.QBEFieldDefs = {040000000100000004000000434F4445010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 200
    Top = 671
  end
  object DSCode: TDataSource
    DataSet = Data_Code
    Left = 264
    Top = 671
  end
end
