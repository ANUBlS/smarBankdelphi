object DataModuleMain: TDataModuleMain
  OldCreateOrder = False
  Height = 480
  Width = 696
  object BankDate: TOracleDataSet
    SQL.Strings = (
      'select TEK_DAT from SYSDAT')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000010000000E000000540045004B005F00440041005400010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 136
    Top = 128
  end
  object TurnOvers: TOracleDataSet
    SQL.Strings = (
      'select'
      '    ar.DatDate,'
      '    ac.bal_cn1 as BalanceNo ,'
      '    ac.Acc_No ,'
      '    ac.val_acc ,'
      '    av.val_name ,'
      '    ar.ostat as Rest ,'
      '    ar.pok_ostat as RestInNational ,'
      '    ar.obr_D ,'
      '    ar.pok_obr_D ,'
      '    ar.obr_k ,'
      '    ar.pok_obr_k'
      '  from'
      '    avalute av ,'
      '    account ac ,'
      '    archost ar'
      ' where'
      '    av.valute = ac.val_acc and'
      '    ac.id = ar.acc_id and'
      '    ar.datdate between :FirstDate and :LastDate'
      '')
    Optimize = False
    Variables.Data = {
      0400000002000000140000003A00460049005200530054004400410054004500
      0C0000000000000000000000120000003A004C00410053005400440041005400
      45000C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000B0000000E0000004400410054004400410054004500010000000000
      12000000420041004C0041004E00430045004E004F000100000000000C000000
      4100430043005F004E004F000100000000000E000000560041004C005F004100
      4300430001000000000010000000560041004C005F004E0041004D0045000100
      000000000800000052004500530054000100000000001C000000520045005300
      540049004E004E004100540049004F004E0041004C000100000000000A000000
      4F00420052005F0044000100000000001200000050004F004B005F004F004200
      52005F0044000100000000000A0000004F00420052005F004B00010000000000
      1200000050004F004B005F004F00420052005F004B00010000000000}
    Session = sboapiDataModule.SBSession
    OnCalcFields = TurnOversCalcFields
    Left = 136
    Top = 176
    object TurnOversDATDATE: TDateTimeField
      FieldName = 'DATDATE'
    end
    object TurnOversBALANCENO: TFloatField
      FieldName = 'BALANCENO'
    end
    object TurnOversACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 448
    end
    object TurnOversVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object TurnOversVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 160
    end
    object TurnOversREST: TFloatField
      FieldName = 'REST'
    end
    object TurnOversRESTINNATIONAL: TFloatField
      FieldName = 'RESTINNATIONAL'
    end
    object TurnOversOBR_D: TFloatField
      FieldName = 'OBR_D'
    end
    object TurnOversPOK_OBR_D: TFloatField
      FieldName = 'POK_OBR_D'
    end
    object TurnOversOBR_K: TFloatField
      FieldName = 'OBR_K'
    end
    object TurnOversPOK_OBR_K: TFloatField
      FieldName = 'POK_OBR_K'
    end
    object TurnOversID: TStringField
      FieldKind = fkCalculated
      FieldName = 'ID'
      Size = 255
      Calculated = True
    end
  end
end
