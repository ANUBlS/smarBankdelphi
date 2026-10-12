object AccountDModule: TAccountDModule
  OldCreateOrder = False
  Height = 0
  Width = 0
  object Account: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT   '
      
        '   ACCOUNT.RowID, ID, kli_id, op_id, acc_no, val_acc, NAME, open' +
        '_dat, close_dat,'
      
        '   DECODE (close_dat, NULL, 1, 2) AS status, bal_cn1, bal_cn2, b' +
        'al_cn3,'
      
        '   bal_cn4, filial, sim_otcet, tipacc, LIMIT, old_acc_no, pair_a' +
        'cc,'
      '   insider'
      'FROM ACCOUNT'
      'ORDER BY '
      '   :title')
    Variables.Data = {
      0300000001000000060000003A5449544C4501000000070000006163635F6E6F
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000014000000020000004944010000000000060000004B4C495F49440100
      00000000050000004F505F4944010000000000060000004143435F4E4F010000
      0000000700000056414C5F414343010000000000040000004E414D4501000000
      0000080000004F50454E5F44415401000000000009000000434C4F53455F4441
      54010000000000060000005354415455530100000000000700000042414C5F43
      4E310100000000000700000042414C5F434E320100000000000700000042414C
      5F434E330100000000000700000042414C5F434E340100000000000600000046
      494C49414C0100000000000900000053494D5F4F544345540100000000000600
      0000544950414343010000000000050000004C494D49540100000000000A0000
      004F4C445F4143435F4E4F01000000000008000000504149525F414343010000
      00000007000000494E5349444552010000000000}
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 120
    Top = 40
    object AccountID: TFloatField
      FieldName = 'ID'
    end
    object AccountKLI_ID: TFloatField
      FieldName = 'KLI_ID'
      Required = True
    end
    object AccountOP_ID: TFloatField
      FieldName = 'OP_ID'
    end
    object AccountACC_NO: TStringField
      DisplayLabel = 'Щесаб №'
      FieldName = 'ACC_NO'
      Required = True
    end
    object AccountVAL_ACC: TIntegerField
      DisplayLabel = '$'
      FieldName = 'VAL_ACC'
      Required = True
    end
    object AccountNAME: TStringField
      DisplayLabel = 'Щесабын ады'
      FieldName = 'NAME'
      Size = 90
    end
    object AccountOPEN_DAT: TDateTimeField
      DisplayLabel = 'Ачылма тарихи'
      FieldName = 'OPEN_DAT'
      Required = True
    end
    object AccountCLOSE_DAT: TDateTimeField
      DisplayLabel = 'Баьланма тарихи'
      FieldName = 'CLOSE_DAT'
    end
    object AccountSTATUS: TFloatField
      FieldName = 'STATUS'
    end
    object AccountBAL_CN1: TFloatField
      DisplayLabel = 'Баланс №'
      FieldName = 'BAL_CN1'
      Required = True
    end
    object AccountBAL_CN2: TFloatField
      FieldName = 'BAL_CN2'
    end
    object AccountBAL_CN3: TFloatField
      FieldName = 'BAL_CN3'
    end
    object AccountBAL_CN4: TFloatField
      FieldName = 'BAL_CN4'
    end
    object AccountFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object AccountSIM_OTCET: TFloatField
      FieldName = 'SIM_OTCET'
    end
    object AccountTIPACC: TStringField
      FieldName = 'TIPACC'
    end
    object AccountLIMIT: TFloatField
      FieldName = 'LIMIT'
    end
    object AccountOLD_ACC_NO: TStringField
      FieldName = 'OLD_ACC_NO'
    end
    object AccountPAIR_ACC: TFloatField
      FieldName = 'PAIR_ACC'
    end
    object AccountINSIDER: TStringField
      FieldName = 'INSIDER'
      Size = 1
    end
  end
  object AccountData: TDataSource
    DataSet = Account
    Left = 48
    Top = 40
  end
end
