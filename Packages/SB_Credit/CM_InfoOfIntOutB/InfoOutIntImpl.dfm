object InfOutIntDatMod: TInfOutIntDatMod
  OldCreateOrder = False
  Left = 271
  Top = 123
  Height = 480
  Width = 696
  object IntPlaceOutBDatSet: TOracleDataSet
    SQL.Strings = (
      'select  c.CREDITID ,'
      '        c.HDATE ,'
      '        c.STOPCALCDATE ,'
      '        c.REST ,'
      '        c.INTERESTREST ,'
      '        c.DUEREST ,'
      '        c.DUEINTERESTREST ,'
      '        p.name ,'
      '        c.INTERESTREST+c.DUEREST as SumRest,'
      '        a.numberofcredit as num'
      'from cm_curr_state c, '
      '     cm_sb_customers p,'
      '     cm_active_credits a'
      'where c.creditid in (select creditid from cm_int_outbalance)'
      
        '      and c.creditid in (select id from cm_active_credits a wher' +
        'e a.boorowerid=p.id )'
      '      and c.creditid = a.id')
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 56
    Top = 32
    object IntPlaceOutBDatSetCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object IntPlaceOutBDatSetHDATE: TDateTimeField
      DisplayLabel = 'Тарих'
      FieldName = 'HDATE'
      Required = True
    end
    object IntPlaceOutBDatSetSTOPCALCDATE: TDateTimeField
      FieldName = 'STOPCALCDATE'
    end
    object IntPlaceOutBDatSetREST: TFloatField
      FieldName = 'REST'
      Required = True
    end
    object IntPlaceOutBDatSetINTERESTREST: TFloatField
      FieldName = 'INTERESTREST'
      Required = True
    end
    object IntPlaceOutBDatSetDUEREST: TFloatField
      FieldName = 'DUEREST'
      Required = True
    end
    object IntPlaceOutBDatSetDUEINTERESTREST: TFloatField
      FieldName = 'DUEINTERESTREST'
      Required = True
    end
    object IntPlaceOutBDatSetNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object IntPlaceOutBDatSetSUMREST: TFloatField
      FieldName = 'SUMREST'
    end
    object IntPlaceOutBDatSetNUM: TStringField
      FieldName = 'NUM'
      Size = 32
    end
  end
  object IntPlaceOutBDatSrc: TDataSource
    DataSet = IntPlaceOutBDatSet
    Left = 56
    Top = 88
  end
  object CM_RETURN_INT_OB: TOraclePackage
    Session = CMDataModule.CMSession
    PackageName = 'CM_RETURN_INT_OB'
    ParameterMode = pmNamed
    Left = 176
    Top = 32
  end
  object out_paymentsds: TDataSource
    DataSet = out_payments
    Left = 48
    Top = 184
  end
  object out_payments: TOracleDataSet
    SQL.Strings = (
      'SELECT id, creditid, trdate, tramount'
      '  FROM cm_return_int_outb '
      '  where creditid = :CrdID'
      '  order by  trdate')
    Variables.Data = {0300000001000000060000003A4352444944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000080000004352454449544944
      01000000000006000000545244415445010000000000080000005452414D4F55
      4E54010000000000}
    Session = CMDataModule.CMSession
    Left = 48
    Top = 136
    object out_paymentsID: TFloatField
      DisplayLabel = '№'
      FieldName = 'ID'
      Required = True
    end
    object out_paymentsCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object out_paymentsTRDATE: TDateTimeField
      DisplayLabel = 'Тарих'
      FieldName = 'TRDATE'
      Required = True
    end
    object out_paymentsTRAMOUNT: TFloatField
      DisplayLabel = 'Мэбляь'
      FieldName = 'TRAMOUNT'
      Required = True
    end
  end
end
