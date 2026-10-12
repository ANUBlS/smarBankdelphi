object DataModOrder: TDataModOrder
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 696
  object SYSDAT: TOracleDataSet
    SQL.Strings = (
      'select'
      '  TEK_DAT'
      'from '
      '  SYSDAT')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 124
    Top = 32
    object SYSDATTEK_DAT: TDateTimeField
      FieldName = 'TEK_DAT'
      Required = True
    end
  end
  object CurrencyData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  Valute ,'
      '  Val_Name ,'
      '  Valu_Name ,'
      '  Valu_Bala'
      'from '
      '  AVALUTE')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000040000000C000000560041004C005500540045000100000000001000
      0000560041004C005F004E0041004D0045000100000000001200000056004100
      4C0055005F004E0041004D00450001000000000012000000560041004C005500
      5F00420041004C004100010000000000}
    Session = sboapiDataModule.SBSession
    Left = 36
    Top = 32
    object CurrencyDataVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object CurrencyDataVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 160
    end
    object CurrencyDataVALU_NAME: TWideStringField
      FieldName = 'VALU_NAME'
      Size = 400
    end
    object CurrencyDataVALU_BALA: TWideStringField
      FieldName = 'VALU_BALA'
      Size = 400
    end
  end
  object DataSrcCurrency: TDataSource
    DataSet = CurrencyData
    Left = 36
    Top = 88
  end
  object ContractAccs: TOracleDataSet
    SQL.Strings = (
      'select'
      '  Val_Acc ,'
      '  Acc_No ,'
      '  KLI_ID ,'
      '  Name'
      'from'
      '  Account'
      'where'
      '  Val_acc = :Val_Acc'
      'order by'
      '  Acc_No    ')
    Optimize = False
    Variables.Data = {
      0400000001000000100000003A00560041004C005F0041004300430003000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000040000000E000000560041004C005F00410043004300010000000000
      0C0000004100430043005F004E004F000100000000000C0000004B004C004900
      5F0049004400010000000000080000004E0041004D004500010000000000}
    Master = CurrencyData
    MasterFields = 'VALUTE'
    DetailFields = 'VAL_ACC'
    Session = sboapiDataModule.SBSession
    Left = 256
    Top = 144
    object ContractAccsVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object ContractAccsACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 448
    end
    object ContractAccsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 1440
    end
    object ContractAccsKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
  end
  object ClientAccs: TOracleDataSet
    SQL.Strings = (
      'select'
      '  Val_Acc ,'
      '  KLI_ID ,'
      '  Acc_No ,'
      '  Name'
      'from'
      '  Account'
      'where'
      '  Val_acc = :Val_Acc'
      ''
      'order by'
      '  Acc_No    '
      ' '
      ' ')
    Optimize = False
    Variables.Data = {
      0400000001000000100000003A00560041004C005F0041004300430003000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000040000000E000000560041004C005F00410043004300010000000000
      0C0000004B004C0049005F00490044000100000000000C000000410043004300
      5F004E004F00010000000000080000004E0041004D004500010000000000}
    Master = CurrencyData
    MasterFields = 'VALUTE'
    DetailFields = 'VAL_ACC'
    Session = sboapiDataModule.SBSession
    Left = 336
    Top = 144
    object ClientAccsVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object ClientAccsACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 448
    end
    object ClientAccsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 1440
    end
    object ClientAccsKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
  end
  object ReserveAccs: TOracleDataSet
    SQL.Strings = (
      'select'
      '  Val_Acc ,'
      'KLI_ID ,'
      '  Acc_No ,'
      '  Name'
      'from'
      '  Account  ac ,'
      '  archost ar'
      'where'
      '  Val_acc = :Val_Acc and'
      '       ar.datdate =(select TEK_DAT from sysdat)'
      '    and ar.acc_id = ac.id'
      '    and ar.pok_ostat>0'
      '    and'
      '  (BAL_CN1 in'
      '    (select ACCGROUP from SBCM_ACC_ZONE_INFO'
      
        '    where zoneid = (select zoneid from sbcm_acc_zones where name' +
        ' = '#39'Reserv'#39')))'
      ''
      'order by'
      '  Acc_No    '
      ' '
      ' '
      ' ')
    Optimize = False
    Variables.Data = {
      0400000001000000100000003A00560041004C005F0041004300430003000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000040000000E000000560041004C005F00410043004300010000000000
      0C0000004B004C0049005F00490044000100000000000C000000410043004300
      5F004E004F00010000000000080000004E0041004D004500010000000000}
    Master = CurrencyData
    MasterFields = 'VALUTE'
    DetailFields = 'VAL_ACC'
    Session = sboapiDataModule.SBSession
    Left = 160
    Top = 152
    object ReserveAccsVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object ReserveAccsACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 448
    end
    object ReserveAccsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 1440
    end
    object ReserveAccsKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
  end
  object DataSrcContractAccs: TDataSource
    DataSet = ContractAccs
    Left = 256
    Top = 96
  end
  object DataSrcClientAccs: TDataSource
    DataSet = ClientAccs
    Left = 336
    Top = 96
  end
  object DataSrcReserveAccs: TDataSource
    DataSet = ReserveAccs
    Left = 160
    Top = 96
  end
  object BankInfoData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  Bank '
      'from BankInfo')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 56
    Top = 256
  end
end
