object PayDataMod: TPayDataMod
  OldCreateOrder = False
  Height = 540
  Width = 783
  object ODSPayments: TOracleDataSet
    SQL.Strings = (
      'select ip.*,  ii.name '
      '  from ins_payments ip, ins_contracts ic, INS_INSURANCES ii'
      'where '
      '  ic.id = ip.ins_id'
      'and'
      '  ii.id = ic.type_id '
      ''
      'and ip.ins_id = :insid')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A0049004E005300490044000400000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      050000000700000004000000490044000100000000000C00000050004C004100
      4E00490044000100000000000E00000050004100590044004100540045000100
      000000000E00000041004D004D004F0055004E0054000100000000000A000000
      540052004100490044000100000000000C00000049004E0053005F0049004400
      010000000000080000004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 64
    Top = 24
    object ODSPaymentsID: TFloatField
      FieldName = 'ID'
    end
    object ODSPaymentsPLANID: TFloatField
      FieldName = 'PLANID'
    end
    object ODSPaymentsPAYDATE: TDateTimeField
      FieldName = 'PAYDATE'
    end
    object ODSPaymentsAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSPaymentsTRAID: TFloatField
      FieldName = 'TRAID'
    end
    object ODSPaymentsINS_ID: TFloatField
      FieldName = 'INS_ID'
    end
    object ODSPaymentsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 1024
    end
  end
  object DSPayments: TDataSource
    DataSet = ODSPayments
    Left = 64
    Top = 80
  end
  object ODSPlan: TOracleDataSet
    SQL.Strings = (
      
        'SELECT -1 as ID, '#39'Plandan k'#601'nar'#39' as paydate, 0 as ammount, 0 as ' +
        'status'
      '  FROM DUAL'
      'UNION ALL'
      
        'SELECT a.ID, TO_CHAR (a.pay_date) as paydate, a.ammount, a.statu' +
        's'
      '  FROM ins_payment_plan a'
      'where a.ins_id = :insid')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A0049004E005300490044000400000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      050000000400000004000000490044000100000000000E00000041004D004D00
      4F0055004E0054000100000000000C0000005300540041005400550053000100
      000000000E0000005000410059004400410054004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 160
    Top = 24
    object ODSPlanID: TFloatField
      FieldName = 'ID'
    end
    object ODSPlanPAYDATE: TWideStringField
      FieldName = 'PAYDATE'
      Size = 15
    end
    object ODSPlanAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSPlanSTATUS: TFloatField
      FieldName = 'STATUS'
    end
  end
  object DSPlan: TDataSource
    DataSet = ODSPlan
    Left = 160
    Top = 80
  end
  object OPSBOP: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SBOP'
    Left = 64
    Top = 152
  end
  object OPCOMMON: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_COMMON'
    Left = 160
    Top = 152
  end
end
