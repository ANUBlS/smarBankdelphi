object DataModCustOrders: TDataModCustOrders
  OldCreateOrder = False
  Left = 152
  Top = 137
  Height = 542
  Width = 813
  object serach_cust_: TDataSource
    DataSet = serach_cust
    Left = 80
    Top = 8
  end
  object search_acc_: TDataSource
    DataSet = search_acc
    Left = 208
    Top = 8
  end
  object arest_acc: TOracleDataSet
    SQL.Strings = (
      'select c.*,c.rowid from account c')
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 280
    Top = 8
    object arest_accID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object arest_accKLI_ID: TFloatField
      FieldName = 'KLI_ID'
      Required = True
    end
    object arest_accOP_ID: TFloatField
      FieldName = 'OP_ID'
    end
    object arest_accACC_NO: TStringField
      FieldName = 'ACC_NO'
      Required = True
    end
    object arest_accVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
      Required = True
    end
    object arest_accNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object arest_accOPEN_DAT: TDateTimeField
      FieldName = 'OPEN_DAT'
      Required = True
    end
    object arest_accCLOSE_DAT: TDateTimeField
      FieldName = 'CLOSE_DAT'
    end
    object arest_accBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
      Required = True
    end
    object arest_accBAL_CN2: TFloatField
      FieldName = 'BAL_CN2'
    end
    object arest_accBAL_CN3: TFloatField
      FieldName = 'BAL_CN3'
    end
    object arest_accBAL_CN4: TFloatField
      FieldName = 'BAL_CN4'
    end
    object arest_accFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object arest_accSIM_OTCET: TFloatField
      FieldName = 'SIM_OTCET'
    end
    object arest_accTIPACC: TStringField
      FieldName = 'TIPACC'
    end
    object arest_accLIMIT: TFloatField
      FieldName = 'LIMIT'
    end
    object arest_accOLD_ACC_NO: TStringField
      FieldName = 'OLD_ACC_NO'
    end
    object arest_accPAIR_ACC: TFloatField
      FieldName = 'PAIR_ACC'
    end
    object arest_accINSIDER: TStringField
      FieldName = 'INSIDER'
      Size = 1
    end
    object arest_accSID: TFloatField
      FieldName = 'SID#'
    end
  end
  object arest_acc_: TDataSource
    DataSet = arest_acc
    Left = 352
    Top = 8
  end
  object Bankm_: TDataSource
    DataSet = Bankm
    Left = 208
    Top = 56
  end
  object Bankm: TOracleDataSet
    SQL.Strings = (
      'Select'
      '    *'
      'From'
      '  BankM'
      'Order by ID')
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 144
    Top = 56
  end
  object bank_info_: TDataSource
    DataSet = bank_info
    Left = 480
    Top = 8
  end
  object bank_info: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   *'
      'From'
      '    BankInfo')
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 416
    Top = 8
  end
  object customer_orders: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'customer_orders'
    Left = 64
    Top = 248
  end
  object arxiv_order_: TDataSource
    DataSet = arxiv_order
    Left = 80
    Top = 56
  end
  object customers: TOracleDataSet
    SQL.Strings = (
      'select * from customers where inn=:ac ')
    Variables.Data = {0300000001000000030000003A4143050000000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 16
    Top = 104
  end
  object customers_: TDataSource
    DataSet = customers
    Left = 88
    Top = 104
  end
  object cust_orders_: TDataSource
    DataSet = cust_orders
    Left = 480
    Top = 64
  end
  object cust_: TDataSource
    DataSet = cust
    Left = 208
    Top = 104
  end
  object serach_cust: TOracleDataSet
    SQL.Strings = (
      'select * from customers where id=:title')
    Variables.Data = {0300000001000000060000003A5449544C45030000000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 16
    Top = 8
  end
  object acc_inn_: TDataSource
    DataSet = cust_id
    Left = 352
    Top = 56
  end
  object cust: TOracleDataSet
    SQL.Strings = (
      'select * from customers where id is not null order by :title')
    Variables.Data = {
      0300000001000000060000003A5449544C450100000003000000696400000000
      00}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 144
    Top = 104
  end
  object arxiv_order: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      '  FROM cust_order_arxiv order by :title')
    Variables.Data = {
      0300000001000000060000003A5449544C450100000003000000696400000000
      00}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 16
    Top = 56
    object arxiv_orderPNUM: TFloatField
      DisplayLabel = 'Ñÿðÿíæàìûí ¹'
      FieldName = 'PNUM'
    end
    object arxiv_orderVAL: TStringField
      DisplayLabel = 'Âàëéóòà'
      FieldName = 'VAL'
      Size = 50
    end
    object arxiv_orderACC_INN: TStringField
      DisplayLabel = 'ÂÞÅÍ'
      FieldName = 'ACC_INN'
      Size = 50
    end
    object arxiv_orderC_NAME: TStringField
      DisplayLabel = 'Àäû'
      FieldName = 'C_NAME'
      Size = 50
    end
    object arxiv_orderC_ACC: TStringField
      DisplayLabel = 'Ùåñàá ¹'
      FieldName = 'C_ACC'
      Size = 50
    end
    object arxiv_orderM_ACC: TStringField
      DisplayLabel = 'Þäÿíèøèí òÿéèíàòû'
      FieldName = 'M_ACC'
      Size = 50
    end
    object arxiv_orderN_MON: TStringField
      DisplayLabel = 'Ìÿáëÿü'
      FieldName = 'N_MON'
      Size = 500
    end
    object arxiv_orderDDATE: TDateTimeField
      DisplayLabel = 'À÷ûëìà òàðèõè'
      FieldName = 'DDATE'
    end
    object arxiv_orderCLOSE_DATE: TDateTimeField
      DisplayLabel = 'Áàüëàíìà òàðèõè'
      FieldName = 'CLOSE_DATE'
    end
    object arxiv_orderDBNAME: TStringField
      FieldName = 'DBNAME'
      Size = 50
    end
    object arxiv_orderDBCODE: TStringField
      FieldName = 'DBCODE'
      Size = 50
    end
    object arxiv_orderDBINN: TStringField
      FieldName = 'DBINN'
      Size = 50
    end
    object arxiv_orderDBCORACC: TStringField
      FieldName = 'DBCORACC'
      Size = 50
    end
    object arxiv_orderDBSWIFT: TStringField
      FieldName = 'DBSWIFT'
      Size = 50
    end
    object arxiv_orderB_NAME: TStringField
      FieldName = 'B_NAME'
      Size = 50
    end
    object arxiv_orderB_CODE: TStringField
      FieldName = 'B_CODE'
      Size = 50
    end
    object arxiv_orderB_INN: TStringField
      FieldName = 'B_INN'
      Size = 50
    end
    object arxiv_orderB_SWIFT: TStringField
      FieldName = 'B_SWIFT'
      Size = 50
    end
    object arxiv_orderB_ACC: TStringField
      FieldName = 'B_ACC'
      Size = 50
    end
    object arxiv_orderC_INN: TStringField
      FieldName = 'C_INN'
      Size = 50
    end
    object arxiv_orderM_NAME: TStringField
      FieldName = 'M_NAME'
      Size = 50
    end
    object arxiv_orderM_INN: TStringField
      FieldName = 'M_INN'
      Size = 50
    end
    object arxiv_orderW_MON: TStringField
      FieldName = 'W_MON'
      Size = 500
    end
    object arxiv_orderCONTENT: TStringField
      FieldName = 'CONTENT'
      Size = 1000
    end
    object arxiv_orderEDV: TStringField
      FieldName = 'EDV'
      Size = 50
    end
    object arxiv_orderEDV_F: TStringField
      FieldName = 'EDV_F'
      Size = 50
    end
    object arxiv_orderEDV_C: TStringField
      FieldName = 'EDV_C'
      Size = 50
    end
    object arxiv_orderPRO: TStringField
      FieldName = 'PRO'
      Size = 50
    end
    object arxiv_orderPRO_F: TStringField
      FieldName = 'PRO_F'
      Size = 50
    end
    object arxiv_orderPRO_C: TStringField
      FieldName = 'PRO_C'
      Size = 50
    end
    object arxiv_orderHEAD: TStringField
      FieldName = 'HEAD'
      Size = 50
    end
    object arxiv_orderCHIEF: TStringField
      FieldName = 'CHIEF'
      Size = 50
    end
    object arxiv_orderID: TFloatField
      FieldName = 'ID'
    end
  end
  object cust_orders: TOracleDataSet
    SQL.Strings = (
      'Select  * from cust_order order by :title')
    Variables.Data = {
      0300000001000000060000003A5449544C450100000003000000696400000000
      00}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 416
    Top = 56
    object cust_ordersPNUM: TFloatField
      DisplayLabel = 'Ñÿðÿíæàìûí ¹'
      FieldName = 'PNUM'
    end
    object cust_ordersVAL: TStringField
      DisplayLabel = 'Âàëéóòà'
      FieldName = 'VAL'
      Size = 50
    end
    object cust_ordersACC_INN: TStringField
      DisplayLabel = 'ÂÞÅÍ'
      FieldName = 'ACC_INN'
      Size = 50
    end
    object cust_ordersC_ACC: TStringField
      DisplayLabel = 'Ùåñàá ¹'
      FieldName = 'C_ACC'
      Size = 50
    end
    object cust_ordersC_NAME: TStringField
      DisplayLabel = 'Àäû'
      FieldName = 'C_NAME'
      Size = 50
    end
    object cust_ordersN_MON: TStringField
      DisplayLabel = 'Ìÿáëÿü'
      FieldName = 'N_MON'
      Size = 500
    end
    object cust_ordersM_ACC: TStringField
      DisplayLabel = 'Þäÿíèùèí òÿéèíàòû'
      FieldName = 'M_ACC'
      Size = 50
    end
    object cust_ordersDDATE: TDateTimeField
      DisplayLabel = 'À÷ûëìà òàðèõè'
      FieldName = 'DDATE'
    end
    object cust_ordersDBNAME: TStringField
      FieldName = 'DBNAME'
      Size = 50
    end
    object cust_ordersDBCODE: TStringField
      FieldName = 'DBCODE'
      Size = 50
    end
    object cust_ordersDBINN: TStringField
      FieldName = 'DBINN'
      Size = 50
    end
    object cust_ordersDBCORACC: TStringField
      FieldName = 'DBCORACC'
      Size = 50
    end
    object cust_ordersDBSWIFT: TStringField
      FieldName = 'DBSWIFT'
      Size = 50
    end
    object cust_ordersB_NAME: TStringField
      FieldName = 'B_NAME'
      Size = 50
    end
    object cust_ordersB_CODE: TStringField
      FieldName = 'B_CODE'
      Size = 50
    end
    object cust_ordersB_INN: TStringField
      FieldName = 'B_INN'
      Size = 50
    end
    object cust_ordersB_SWIFT: TStringField
      FieldName = 'B_SWIFT'
      Size = 50
    end
    object cust_ordersB_ACC: TStringField
      FieldName = 'B_ACC'
      Size = 50
    end
    object cust_ordersC_INN: TStringField
      FieldName = 'C_INN'
      Size = 50
    end
    object cust_ordersM_NAME: TStringField
      FieldName = 'M_NAME'
      Size = 50
    end
    object cust_ordersM_INN: TStringField
      FieldName = 'M_INN'
      Size = 50
    end
    object cust_ordersW_MON: TStringField
      FieldName = 'W_MON'
      Size = 500
    end
    object cust_ordersCONTENT: TStringField
      FieldName = 'CONTENT'
      Size = 1000
    end
    object cust_ordersEDV: TStringField
      FieldName = 'EDV'
      Size = 50
    end
    object cust_ordersEDV_F: TStringField
      FieldName = 'EDV_F'
      Size = 50
    end
    object cust_ordersEDV_C: TStringField
      FieldName = 'EDV_C'
      Size = 50
    end
    object cust_ordersPRO: TStringField
      FieldName = 'PRO'
      Size = 50
    end
    object cust_ordersPRO_F: TStringField
      FieldName = 'PRO_F'
      Size = 50
    end
    object cust_ordersPRO_C: TStringField
      FieldName = 'PRO_C'
      Size = 50
    end
    object cust_ordersHEAD: TStringField
      FieldName = 'HEAD'
      Size = 50
    end
    object cust_ordersCHIEF: TStringField
      FieldName = 'CHIEF'
      Size = 50
    end
    object cust_ordersID: TFloatField
      FieldName = 'ID'
    end
    object cust_ordersCLOSE_DATE: TDateTimeField
      FieldName = 'CLOSE_DATE'
    end
    object cust_ordersCUST_ID: TStringField
      FieldName = 'CUST_ID'
    end
  end
  object cust_id: TOracleDataSet
    SQL.Strings = (
      ' select * from cust_order where cust_id=:id order by :title')
    Variables.Data = {
      0300000002000000060000003A5449544C450100000003000000696400000000
      00030000003A4944030000000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 280
    Top = 56
  end
  object search_acc: TOracleDataSet
    SQL.Strings = (
      'SELECT *  from account where kli_id=:acc order by :title'
      '')
    Variables.Data = {
      0300000002000000040000003A41434303000000000000000000000006000000
      3A5449544C4501000000070000006163635F6E6F0000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 144
    Top = 8
  end
  object valute: TOracleDataSet
    Session = sboapiDataModule.SBSession
    Left = 280
    Top = 112
  end
  object valute_: TDataSource
    DataSet = valute
    Left = 352
    Top = 112
  end
  object account: TOracleDataSet
    SQL.Strings = (
      'select * from out_account order by acc_no')
    Session = sboapiDataModule.SBSession
    Left = 408
    Top = 112
  end
  object account_: TDataSource
    DataSet = account
    Left = 480
    Top = 120
  end
  object search_order: TOracleDataSet
    SQL.Strings = (
      'select * from cust_order')
    QBEDefinition.QBEFieldDefs = {
      04000000220000000600000044424E414D45010000000000060000004442434F
      444501000000000004000000504E554D010000000000050000004442494E4E01
      0000000000080000004442434F52414343010000000000070000004442535749
      46540100000000000300000056414C01000000000006000000425F4E414D4501
      000000000006000000425F434F444501000000000005000000425F494E4E0100
      0000000007000000425F535749465401000000000005000000425F4143430100
      0000000006000000435F4E414D4501000000000005000000435F414343010000
      00000005000000435F494E4E010000000000060000004D5F4E414D4501000000
      0000050000004D5F414343010000000000050000004D5F494E4E010000000000
      050000004E5F4D4F4E01000000000005000000575F4D4F4E0100000000000700
      0000434F4E54454E540100000000000300000045445601000000000005000000
      4544565F46010000000000050000004544565F43010000000000030000005052
      4F0100000000000500000050524F5F460100000000000500000050524F5F4301
      0000000000040000004845414401000000000005000000434849454601000000
      0000050000004444415445010000000000020000004944010000000000070000
      004143435F494E4E0100000000000A000000434C4F53455F4441544501000000
      000007000000435553545F4944010000000000}
    Session = sboapiDataModule.SBSession
    Left = 88
    Top = 168
    object search_orderDBNAME: TStringField
      FieldName = 'DBNAME'
      Size = 50
    end
    object search_orderDBCODE: TStringField
      FieldName = 'DBCODE'
      Size = 50
    end
    object search_orderPNUM: TFloatField
      FieldName = 'PNUM'
    end
    object search_orderDBINN: TStringField
      FieldName = 'DBINN'
      Size = 50
    end
    object search_orderDBCORACC: TStringField
      FieldName = 'DBCORACC'
      Size = 50
    end
    object search_orderDBSWIFT: TStringField
      FieldName = 'DBSWIFT'
      Size = 50
    end
    object search_orderVAL: TStringField
      FieldName = 'VAL'
      Size = 50
    end
    object search_orderB_NAME: TStringField
      FieldName = 'B_NAME'
      Size = 50
    end
    object search_orderB_CODE: TStringField
      FieldName = 'B_CODE'
      Size = 50
    end
    object search_orderB_INN: TStringField
      FieldName = 'B_INN'
      Size = 50
    end
    object search_orderB_SWIFT: TStringField
      FieldName = 'B_SWIFT'
      Size = 50
    end
    object search_orderB_ACC: TStringField
      FieldName = 'B_ACC'
      Size = 50
    end
    object search_orderC_NAME: TStringField
      FieldName = 'C_NAME'
      Size = 200
    end
    object search_orderC_ACC: TStringField
      FieldName = 'C_ACC'
      Size = 50
    end
    object search_orderC_INN: TStringField
      FieldName = 'C_INN'
      Size = 50
    end
    object search_orderM_NAME: TStringField
      FieldName = 'M_NAME'
      Size = 50
    end
    object search_orderM_ACC: TStringField
      FieldName = 'M_ACC'
      Size = 50
    end
    object search_orderM_INN: TStringField
      FieldName = 'M_INN'
      Size = 50
    end
    object search_orderN_MON: TStringField
      FieldName = 'N_MON'
      Size = 500
    end
    object search_orderW_MON: TStringField
      FieldName = 'W_MON'
      Size = 500
    end
    object search_orderCONTENT: TStringField
      FieldName = 'CONTENT'
      Size = 1000
    end
    object search_orderEDV: TStringField
      FieldName = 'EDV'
      Size = 50
    end
    object search_orderEDV_F: TStringField
      FieldName = 'EDV_F'
      Size = 50
    end
    object search_orderEDV_C: TStringField
      FieldName = 'EDV_C'
      Size = 50
    end
    object search_orderPRO: TStringField
      FieldName = 'PRO'
      Size = 50
    end
    object search_orderPRO_F: TStringField
      FieldName = 'PRO_F'
      Size = 50
    end
    object search_orderPRO_C: TStringField
      FieldName = 'PRO_C'
      Size = 50
    end
    object search_orderHEAD: TStringField
      FieldName = 'HEAD'
      Size = 50
    end
    object search_orderCHIEF: TStringField
      FieldName = 'CHIEF'
      Size = 50
    end
    object search_orderDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object search_orderID: TFloatField
      FieldName = 'ID'
    end
    object search_orderACC_INN: TStringField
      FieldName = 'ACC_INN'
      Size = 50
    end
    object search_orderCLOSE_DATE: TDateTimeField
      FieldName = 'CLOSE_DATE'
    end
    object search_orderCUST_ID: TStringField
      FieldName = 'CUST_ID'
      Size = 50
    end
  end
  object search_order_: TDataSource
    DataSet = search_order
    Left = 160
    Top = 168
  end
  object Acc: TOracleDataSet
    SQL.Strings = (
      'select * from out_account order by acc_no'
      '')
    Session = sboapiDataModule.SBSession
    Left = 216
    Top = 168
  end
  object Acc_: TDataSource
    DataSet = Acc
    Left = 280
    Top = 168
  end
end
