object Dm: TDm
  OldCreateOrder = False
  Left = 184
  Top = 143
  Height = 480
  Width = 714
  object cust_orders: TOracleDataSet
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 72
  end
  object ds_cust_orders: TDataSource
    DataSet = cust_orders
    Left = 24
    Top = 128
  end
  object arxiv_orders: TOracleDataSet
    Session = sboapiDataModule.SBSession
    Left = 112
    Top = 72
  end
  object search_acc: TOracleDataSet
    SQL.Strings = (
      ' Select  * from Account where kli_id=:acc '
      'order by  :title')
    Variables.Data = {
      0300000002000000060000003A5449544C4501000000070000006163635F6E6F
      0000000000040000003A414343030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000017000000020000004944010000000000060000004B4C495F49440100
      00000000050000004F505F4944010000000000060000004143435F4E4F010000
      0000000700000056414C5F414343010000000000040000004E414D4501000000
      0000080000004F50454E5F44415401000000000009000000434C4F53455F4441
      540100000000000700000042414C5F434E310100000000000700000042414C5F
      434E320100000000000700000042414C5F434E33010000000000070000004241
      4C5F434E340100000000000600000046494C49414C0100000000000900000053
      494D5F4F54434554010000000000060000005449504143430100000000000500
      00004C494D49540100000000000A0000004F4C445F4143435F4E4F0100000000
      0008000000504149525F41434301000000000007000000494E53494445520100
      0000000004000000534944230100000000000600000054454D50494401000000
      0000050000004F574E494401000000000008000000505F435553544944010000
      000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 128
    Top = 216
    object search_accID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object search_accKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object search_accOP_ID: TFloatField
      FieldName = 'OP_ID'
    end
    object search_accACC_NO: TStringField
      FieldName = 'ACC_NO'
    end
    object search_accVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object search_accNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object search_accOPEN_DAT: TDateTimeField
      FieldName = 'OPEN_DAT'
    end
    object search_accCLOSE_DAT: TDateTimeField
      FieldName = 'CLOSE_DAT'
    end
    object search_accBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
    end
    object search_accBAL_CN2: TFloatField
      FieldName = 'BAL_CN2'
    end
    object search_accBAL_CN3: TFloatField
      FieldName = 'BAL_CN3'
    end
    object search_accBAL_CN4: TFloatField
      FieldName = 'BAL_CN4'
    end
    object search_accFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object search_accSIM_OTCET: TFloatField
      FieldName = 'SIM_OTCET'
    end
    object search_accTIPACC: TStringField
      FieldName = 'TIPACC'
    end
    object search_accLIMIT: TFloatField
      FieldName = 'LIMIT'
    end
    object search_accOLD_ACC_NO: TStringField
      FieldName = 'OLD_ACC_NO'
    end
    object search_accPAIR_ACC: TFloatField
      FieldName = 'PAIR_ACC'
    end
    object search_accINSIDER: TStringField
      FieldName = 'INSIDER'
      Size = 1
    end
    object search_accSID: TFloatField
      FieldName = 'SID#'
    end
    object search_accTEMPID: TFloatField
      FieldName = 'TEMPID'
    end
    object search_accOWNID: TFloatField
      FieldName = 'OWNID'
    end
    object search_accP_CUSTID: TFloatField
      FieldName = 'P_CUSTID'
    end
  end
  object BankM: TOracleDataSet
    Session = sboapiDataModule.SBSession
    Left = 224
    Top = 72
  end
  object cust_id: TOracleDataSet
    SQL.Strings = (
      ' select * from cust_order where cust_id=:id order by :title')
    Session = sboapiDataModule.SBSession
    Left = 320
    Top = 72
  end
  object search_order: TOracleDataSet
    SQL.Strings = (
      'select *   from  cust_order')
    Session = sboapiDataModule.SBSession
    Left = 416
    Top = 72
  end
  object ds_arxiv_orders: TDataSource
    DataSet = arxiv_orders
    Left = 112
    Top = 128
  end
  object search_acc_ds: TDataSource
    DataSet = search_acc
    Left = 128
    Top = 272
  end
  object ds_BankM: TDataSource
    DataSet = BankM
    Left = 224
    Top = 128
  end
  object acc_inn_: TDataSource
    DataSet = cust_id
    Left = 320
    Top = 128
  end
  object ds_search_order: TDataSource
    DataSet = search_order
    Left = 416
    Top = 128
  end
  object Custormers_ds: TDataSource
    DataSet = Customers
    Left = 40
    Top = 272
  end
  object Customers: TOracleDataSet
    SQL.Strings = (
      ' select'
      '         id,name,open_dat,inn '
      '               from Customers '
      '  order by  :title')
    Variables.Data = {
      0300000001000000060000003A5449544C450100000003000000696400000000
      00}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000040000004E414D4501000000
      0000080000004F50454E5F44415401000000000003000000494E4E0100000000
      00}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 40
    Top = 216
    object CustomersID: TIntegerField
      DisplayLabel = '¹'
      DisplayWidth = 6
      FieldName = 'ID'
      Required = True
    end
    object CustomersNAME: TStringField
      DisplayLabel = 'Adi'
      DisplayWidth = 30
      FieldName = 'NAME'
      Size = 90
    end
    object CustomersOPEN_DAT: TDateTimeField
      DisplayLabel = 'A÷lma tarixi '
      DisplayWidth = 12
      FieldName = 'OPEN_DAT'
    end
    object CustomersINN: TStringField
      DisplayLabel = 'VOEN'
      DisplayWidth = 15
      FieldName = 'INN'
    end
  end
  object valute: TOracleDataSet
    Session = sboapiDataModule.SBSession
    Left = 256
    Top = 216
  end
  object ds_valute: TDataSource
    DataSet = valute
    Left = 256
    Top = 272
  end
  object DataSource1: TDataSource
    DataSet = BankInfo
    Left = 352
    Top = 272
  end
  object BankInfo: TOracleDataSet
    SQL.Strings = (
      'select * from BankInfo')
    Session = sboapiDataModule.SBSession
    Left = 352
    Top = 216
  end
  object custormers_orders: TOraclePackage
    Left = 192
    Top = 344
  end
end
