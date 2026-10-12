object dmTransactionViewer: TdmTransactionViewer
  OldCreateOrder = False
  Left = 267
  Top = 153
  Height = 480
  Width = 696
  object TransactionData: TOracleDataSet
    SQL.Strings = (
      'select '
      '     pr.dat,'
      '     pr.no_prov,'
      '     pr.vid_op,'
      '     pr.val_acc,'
      '     pr.rate_d,'
      '     pr.debt,'
      '     pr.currencyid_c,'
      '     pr.rate_c,'
      '     pr.kredit,'
      '     pr.ammount,'
      '     pr.ammount_c,'
      '     pr.lammount,'
      '     pr.kassa_b,'
      '     pr.kassa_z,'
      '     pr.name'
      'from '
      '    provarch pr'
      'where ID = :TransactionID  '
      ''
      'union '
      ''
      'select '
      '     lr.dat,'
      '     lr.no_prov,'
      '     lr.vid_op,'
      '     lr.val_acc,'
      '     lr.rate_d,'
      '     lr.debt,'
      '     lr.currencyid_c,'
      '     lr.rate_c,'
      '     lr.kredit,'
      '     lr.ammount,'
      '     lr.ammount_c,'
      '     lr.lammount,'
      '     lr.kassa_b,'
      '     lr.kassa_z,'
      '     lr.name'
      'from '
      '    lazytransaction lr'
      'where ID = :TransactionID  '
      ''
      ''
      ''
      '    ')
    Variables.Data = {
      03000000010000000E0000003A5452414E53414354494F4E4944030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000F00000003000000444154010000000000070000004E4F5F50524F56
      010000000000060000005649445F4F500100000000000700000056414C5F4143
      4301000000000006000000524154455F44010000000000040000004445425401
      00000000000C00000043555252454E435949445F430100000000000600000052
      4154455F43010000000000060000004B52454449540100000000000700000041
      4D4D4F554E5401000000000009000000414D4D4F554E545F4301000000000008
      0000004C414D4D4F554E54010000000000070000004B415353415F4201000000
      0000070000004B415353415F5A010000000000040000004E414D450100000000
      00}
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 24
    object TransactionDataDAT: TDateTimeField
      FieldName = 'DAT'
    end
    object TransactionDataNO_PROV: TStringField
      FieldName = 'NO_PROV'
      Size = 8
    end
    object TransactionDataVID_OP: TIntegerField
      FieldName = 'VID_OP'
    end
    object TransactionDataVAL_ACC: TFloatField
      FieldName = 'VAL_ACC'
    end
    object TransactionDataRATE_D: TFloatField
      FieldName = 'RATE_D'
    end
    object TransactionDataDEBT: TFloatField
      FieldName = 'DEBT'
    end
    object TransactionDataCURRENCYID_C: TIntegerField
      FieldName = 'CURRENCYID_C'
    end
    object TransactionDataRATE_C: TFloatField
      FieldName = 'RATE_C'
    end
    object TransactionDataKREDIT: TFloatField
      FieldName = 'KREDIT'
    end
    object TransactionDataAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object TransactionDataAMMOUNT_C: TFloatField
      FieldName = 'AMMOUNT_C'
    end
    object TransactionDataLAMMOUNT: TFloatField
      FieldName = 'LAMMOUNT'
    end
    object TransactionDataKASSA_B: TIntegerField
      FieldName = 'KASSA_B'
    end
    object TransactionDataKASSA_Z: TIntegerField
      FieldName = 'KASSA_Z'
    end
    object TransactionDataNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
  end
  object TransactionDatSrc: TDataSource
    DataSet = TransactionData
    Left = 120
    Top = 24
  end
  object AvaluteDebit: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name from avalute'
      'where valute = :valute')
    Variables.Data = {0300000001000000070000003A56414C555445030000000000000000000000}
    Master = TransactionData
    MasterFields = 'val_acc'
    DetailFields = 'valute'
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 80
    object AvaluteDebitVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object AvaluteDebitVALU_NAME: TStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
  end
  object AvaluteDebitDatSrc: TDataSource
    DataSet = AvaluteDebit
    Left = 120
    Top = 83
  end
  object AvaluteCredit: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name from avalute'
      'where valute = :valute'
      '')
    Variables.Data = {0300000001000000070000003A56414C555445030000000000000000000000}
    Master = TransactionData
    MasterFields = 'currencyid_c'
    DetailFields = 'valute'
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 136
    object AvaluteCreditVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object AvaluteCreditVALU_NAME: TStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
  end
  object AvaluteCreditDatSrc: TDataSource
    DataSet = AvaluteCredit
    Left = 120
    Top = 136
  end
  object AccDebit: TOracleDataSet
    SQL.Strings = (
      'select id,acc_no,name from account'
      'where id = :ID')
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
    Master = TransactionData
    MasterFields = 'debt'
    DetailFields = 'ID'
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 194
    object AccDebitID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object AccDebitACC_NO: TStringField
      FieldName = 'ACC_NO'
      Required = True
    end
    object AccDebitNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object AccDebitDatSrc: TDataSource
    DataSet = AccDebit
    Left = 120
    Top = 192
  end
  object AccCredit: TOracleDataSet
    SQL.Strings = (
      'select id,acc_no,name from account'
      'where id = :ID'
      '')
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
    Master = TransactionData
    MasterFields = 'kredit'
    DetailFields = 'ID'
    Session = sboapiDataModule.SBSession
    Left = 34
    Top = 247
  end
  object AccCreditDatSrc: TDataSource
    DataSet = AccCredit
    Left = 122
    Top = 248
  end
  object RestDebitDatSrc: TDataSource
    DataSet = RestDebit
    Left = 120
    Top = 296
  end
  object RestCredit: TOracleDataSet
    SQL.Strings = (
      'select acc_id,'
      '       nvl(abs(ostat),0) as ostat,'
      '       nvl(abs(pok_ostat),0) as pok_ostat'
      'from archost '
      'where acc_id = :acc_id'
      'and datdate = :dat')
    Variables.Data = {
      0300000002000000070000003A4143435F494404000000000000000000000004
      0000003A4441540C0000000000000000000000}
    Master = AccCredit
    MasterFields = 'ID'
    DetailFields = 'ACC_ID'
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 344
    object RestCreditOSTAT: TFloatField
      FieldName = 'OSTAT'
    end
    object RestCreditPOK_OSTAT: TFloatField
      FieldName = 'POK_OSTAT'
    end
    object RestCreditACC_ID: TFloatField
      FieldName = 'ACC_ID'
      Required = True
    end
  end
  object RestCreditDatSrc: TDataSource
    DataSet = RestCredit
    Left = 120
    Top = 344
  end
  object operations: TOracleDataSet
    SQL.Strings = (
      'SELECT id, name'
      '  FROM vid_op'
      ''
      'where id = :ID')
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
    Master = TransactionData
    MasterFields = 'vid_op'
    DetailFields = 'id'
    Session = sboapiDataModule.SBSession
    Left = 224
    Top = 24
    object operationsID: TIntegerField
      FieldName = 'ID'
    end
    object operationsNAME: TStringField
      FieldName = 'NAME'
      Size = 128
    end
  end
  object operationsDatSrc: TDataSource
    DataSet = operations
    Left = 296
    Top = 24
  end
  object CashSymbols: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT'
      '  symbol,'
      '  name'
      'FROM'
      '  kassa_b'
      'where symbol = :symbol '
      '')
    Variables.Data = {0300000001000000070000003A53594D424F4C030000000000000000000000}
    Master = TransactionData
    MasterFields = 'kassa_b'
    DetailFields = 'symbol'
    Session = sboapiDataModule.SBSession
    Left = 248
    Top = 96
    object CashSymbolsSYMBOL: TFloatField
      FieldName = 'SYMBOL'
      Required = True
    end
    object CashSymbolsNAME: TStringField
      FieldName = 'NAME'
      Size = 777
    end
  end
  object CashSymbolsData: TDataSource
    DataSet = CashSymbols
    Left = 248
    Top = 152
  end
  object ConvertationSymbols: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select * from CONVERT_ASSIGNMENTS'
      'where id = :ID'
      '')
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
    Master = TransactionData
    MasterFields = 'kassa_z'
    DetailFields = 'ID'
    Session = sboapiDataModule.SBSession
    Left = 248
    Top = 216
  end
  object ConvertationSymbolsData: TDataSource
    DataSet = ConvertationSymbols
    Left = 248
    Top = 264
  end
  object RestDebit: TOracleDataSet
    SQL.Strings = (
      'select acc_id,'
      '       nvl(abs(ostat),0) as ostat,'
      '       nvl(abs(pok_ostat),0) as pok_ostat'
      'from archost '
      'where acc_id = :acc_id'
      'and datdate = :dat'
      '')
    Variables.Data = {
      0300000002000000070000003A4143435F494403000000000000000000000004
      0000003A4441540C0000000000000000000000}
    Master = TransactionData
    MasterFields = 'debt'
    DetailFields = 'ACC_ID'
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 296
    object RestDebitACC_ID: TFloatField
      FieldName = 'ACC_ID'
      Required = True
    end
    object RestDebitOSTAT: TFloatField
      FieldName = 'OSTAT'
    end
    object RestDebitPOK_OSTAT: TFloatField
      FieldName = 'POK_OSTAT'
    end
  end
end
