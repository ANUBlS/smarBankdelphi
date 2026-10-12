object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 0
  Width = 0
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
    Left = 288
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
    Left = 496
    Top = 128
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
    Left = 432
    Top = 128
  end
  object ACCDataSource: TDataSource
    DataSet = ACCDataSet
    Left = 160
    Top = 64
  end
  object ACCDataSet: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   *'
      'From '
      '    Account'
      ''
      'Order by acc_no')
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 88
    Top = 64
  end
  object bank_info_: TDataSource
    DataSet = bank_info
    Left = 480
    Top = 16
  end
  object bank_info: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   *'
      'From'
      '    BankInfo')
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 408
    Top = 8
  end
  object customer_orders: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'customer_orders'
    Left = 16
    Top = 64
  end
  object order: TOracleDataSet
    SQL.Strings = (
      'select * from cust_order where acc_inn=:order_s order by :title')
    Variables.Data = {
      0300000002000000060000003A5449544C450100000003000000494400000000
      00080000003A4F524445525F53050000000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 376
    Top = 64
  end
  object order_: TDataSource
    DataSet = order
    Left = 440
    Top = 64
  end
  object cust_order_: TDataSource
    DataSet = cust_order
    Left = 304
    Top = 64
  end
  object arxiv_order_: TDataSource
    DataSet = arxiv_order
    Left = 368
    Top = 120
  end
  object customers: TOracleDataSet
    SQL.Strings = (
      'select * from customers where inn=:ac ')
    Variables.Data = {0300000001000000030000003A4143050000000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 16
    Top = 184
  end
  object customers_: TDataSource
    DataSet = customers
    Left = 88
    Top = 184
  end
  object cust_orders_: TDataSource
    DataSet = cust_orders
    Left = 360
    Top = 184
  end
  object cust_: TDataSource
    DataSet = cust
    Left = 216
    Top = 184
  end
  object serach_cust: TOracleDataSet
    SQL.Strings = (
      'select * from customers where inn=:cust')
    Variables.Data = {0300000001000000050000003A43555354050000000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 16
    Top = 8
  end
  object acc_inn_: TDataSource
    DataSet = acc_inn
    Left = 496
    Top = 184
  end
  object cust: TOracleDataSet
    SQL.Strings = (
      'select * from customers where inn is not null order by :title')
    Variables.Data = {
      0300000001000000060000003A5449544C450100000004000000696E6E000000
      0000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 160
    Top = 184
  end
  object arxiv_order: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      '  FROM cust_order_arxiv order by :title')
    Variables.Data = {
      0300000001000000060000003A5449544C450100000005000000706E756D0000
      000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 304
    Top = 120
  end
  object ex_order: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      ' '
      '  FROM cust_order order by :title')
    Variables.Data = {
      0300000001000000060000003A5449544C450100000005000000706E756D0000
      000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 168
    Top = 120
    object ex_orderpnum: TFloatField
      DisplayLabel = '№'
      FieldName = 'pnum'
    end
    object ex_orderacc_inn: TStringField
      DisplayLabel = 'Вюин'
      FieldName = 'acc_inn'
    end
    object ex_orderval: TStringField
      DisplayLabel = 'Валйута'
      FieldName = 'val'
    end
    object ex_orderc_name: TStringField
      DisplayLabel = 'А.мцштяринин ады'
      FieldName = 'c_name'
    end
    object ex_orderc_acc: TStringField
      DisplayLabel = 'А.мцштяринин щесабы'
      FieldName = 'c_acc'
    end
    object ex_orderc_inn: TStringField
      DisplayLabel = 'А.мцштяринин вюин'
      FieldName = 'c_inn'
      Size = 0
    end
    object ex_orderm_name: TStringField
      DisplayLabel = 'Ю.мцштяринин ады'
      FieldName = 'm_name'
    end
    object ex_orderm_acc: TStringField
      DisplayLabel = 'Ю.мцштяринин щесабы'
      FieldName = 'm_acc'
    end
    object ex_orderm_inn: TStringField
      DisplayLabel = 'Ю.мцштяринин вюин'
      FieldName = 'm_inn'
    end
    object ex_ordern_mon: TStringField
      DisplayLabel = 'Мябляь'
      FieldName = 'n_mon'
    end
    object ex_orderDDATE: TDateTimeField
      DisplayLabel = 'Тарих'
      FieldName = 'DDATE'
    end
  end
  object ex_order_: TDataSource
    DataSet = ex_order
    Left = 232
    Top = 120
  end
  object ex_arxiv_order: TOracleDataSet
    SQL.Strings = (
      
        'SELECT dbname, dbcode, pnum, dbinn, dbcoracc, dbswift, val, b_na' +
        'me,'
      
        '       b_code, b_inn, b_swift, b_acc, c_name, c_acc, c_inn, m_na' +
        'me,'
      
        '       m_acc, m_inn, n_mon, w_mon, content, edv, edv_f, edv_c, p' +
        'ro,'
      '       pro_f, pro_c, head, chief, ddate, id, acc_inn, close_date'
      '  FROM cust_order_arxiv order by :title')
    Variables.Data = {
      0300000001000000060000003A5449544C450100000005000000706E756D0000
      000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 16
    Top = 120
    object ex_arxiv_orderpnum: TFloatField
      DisplayLabel = '№'
      FieldName = 'pnum'
    end
    object ex_arxiv_orderacc_inn: TStringField
      DisplayLabel = 'Вюин'
      FieldName = 'acc_inn'
    end
    object ex_arxiv_orderval: TStringField
      DisplayLabel = 'Валйута'
      FieldName = 'val'
    end
    object ex_arxiv_orderc_name: TStringField
      DisplayLabel = 'Ю.мцштяринин ады'
      FieldName = 'c_name'
    end
    object ex_arxiv_orderc_acc: TStringField
      DisplayLabel = 'Ю.мцштяринин щесабы'
      FieldName = 'c_acc'
    end
    object ex_arxiv_orderc_inn: TStringField
      DisplayLabel = 'Ю.мцштяринин вюин'
      FieldName = 'c_inn'
    end
    object ex_arxiv_orderm_name: TStringField
      DisplayLabel = 'А.мцштяринин ады'
      FieldName = 'm_name'
    end
    object ex_arxiv_orderm_acc: TStringField
      DisplayLabel = 'А.мцштяринин щесабы'
      FieldName = 'm_acc'
    end
    object ex_arxiv_orderm_inn: TStringField
      DisplayLabel = 'А.мцштяринин вюин'
      FieldName = 'm_inn'
    end
    object ex_arxiv_ordern_mon: TStringField
      DisplayLabel = 'Мябляь'
      FieldName = 'n_mon'
    end
    object ex_arxiv_orderCLOSE_DATE: TDateTimeField
      DisplayLabel = 'Баьланма тарихи'
      FieldName = 'CLOSE_DATE'
    end
    object ex_arxiv_orderDDATE: TDateTimeField
      DisplayLabel = 'Ачылма тарихи'
      FieldName = 'DDATE'
    end
  end
  object ex_arxiv_order_: TDataSource
    DataSet = ex_arxiv_order
    Left = 96
    Top = 120
  end
  object cust_orders: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      ' '
      '  FROM cust_order order by :title')
    Variables.Data = {
      0300000001000000060000003A5449544C450100000005000000706E756D0000
      000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 288
    Top = 184
  end
  object acc_inn: TOracleDataSet
    SQL.Strings = (
      ' select * from cust_order where acc_inn=:ac order by :title')
    Variables.Data = {
      0300000002000000060000003A5449544C450100000003000000696400000000
      00030000003A4143050000000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 432
    Top = 176
  end
  object acc_no_: TDataSource
    DataSet = acc_no
    Left = 88
    Top = 240
  end
  object search_acc: TOracleDataSet
    SQL.Strings = (
      
        'SELECT id, kli_id, op_id, acc_no, val_acc, name, open_dat, close' +
        '_dat,'
      
        '       bal_cn1, bal_cn2, bal_cn3, bal_cn4, filial, sim_otcet, ti' +
        'pacc,'
      '       limit, old_acc_no, pair_acc, insider, sid#'
      '  FROM account where kli_id=:acc order by :title'
      '')
    Variables.Data = {
      0300000002000000040000003A41434303000000000000000000000006000000
      3A5449544C4501000000070000006163635F6E6F0000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 144
    Top = 8
  end
  object acc_no: TOracleDataSet
    SQL.Strings = (
      'select * from account where acc_no=:acc')
    Variables.Data = {0300000001000000040000003A414343050000000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 16
    Top = 240
  end
  object act_no_: TDataSource
    DataSet = act_no
    Left = 224
    Top = 240
  end
  object act_no: TOracleDataSet
    SQL.Strings = (
      'select * from account where acc_no=:acc')
    Variables.Data = {0300000001000000040000003A414343050000000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 160
    Top = 240
  end
  object cust_order: TOracleDataSet
    SQL.Strings = (
      'select * from cust_order')
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 240
    Top = 64
  end
  object valute: TOracleDataSet
    Session = sboapiDataModule.SBSession
    Left = 288
    Top = 240
  end
  object valute_: TDataSource
    DataSet = valute
    Left = 368
    Top = 240
  end
  object sear_inn: TOracleDataSet
    SQL.Strings = (
      'select * from cust_order order by :title')
    Variables.Data = {
      0300000001000000060000003A5449544C4501000000080000006163635F696E
      6E0000000000}
    Session = sboapiDataModule.SBSession
    Left = 16
    Top = 304
  end
  object sear_inn_: TDataSource
    DataSet = sear_inn
    Left = 88
    Top = 296
  end
  object account: TOracleDataSet
    SQL.Strings = (
      'select * from account order by acc_no')
    Session = sboapiDataModule.SBSession
    Left = 160
    Top = 296
  end
  object account_: TDataSource
    DataSet = account
    Left = 224
    Top = 296
  end
end
