object CorrectDatMod: TCorrectDatMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 381
  Top = 242
  Height = 480
  Width = 696
  object Tranches: TOracleDataSet
    SQL.Strings = (
      'select '
      '       tranchedate , '
      '       trancheamount'
      'from cm_tranches'
      'where creditid =:CrdID ')
    Variables.Data = {0300000001000000060000003A4352444944030000000000000000000000}
    OnApplyRecord = TranchesApplyRecord
    Session = CMDataModule.CMSession
    Left = 32
    Top = 32
    object TranchesTRANCHEDATE: TDateTimeField
      FieldName = 'TRANCHEDATE'
      LookupCache = True
      Required = True
    end
    object TranchesTRANCHEAMOUNT: TFloatField
      FieldName = 'TRANCHEAMOUNT'
      Required = True
    end
  end
  object Payments: TOracleDataSet
    SQL.Strings = (
      'select  id,'
      '        paydate , '
      '        payedamt , '
      '        payedintamt , '
      '        payeddueamt ,'
      '        payeddueintamt'
      'from cm_payments'
      'where creditid =:CrdID')
    Variables.Data = {0300000001000000060000003A4352444944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000020000004944010000000000070000005041594441544501
      0000000000080000005041594544414D540100000000000B0000005041594544
      494E54414D540100000000000B0000005041594544445545414D540100000000
      000E0000005041594544445545494E54414D54010000000000}
    Session = CMDataModule.CMSession
    Left = 32
    Top = 128
    object PaymentsPAYDATE: TDateTimeField
      FieldName = 'PAYDATE'
      Required = True
    end
    object PaymentsPAYEDAMT: TFloatField
      FieldName = 'PAYEDAMT'
      Required = True
    end
    object PaymentsPAYEDINTAMT: TFloatField
      FieldName = 'PAYEDINTAMT'
      Required = True
    end
    object PaymentsPAYEDDUEAMT: TFloatField
      FieldName = 'PAYEDDUEAMT'
      Required = True
    end
    object PaymentsPAYEDDUEINTAMT: TFloatField
      FieldName = 'PAYEDDUEINTAMT'
      Required = True
    end
    object PaymentsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
  end
  object TranchesDatSrc: TDataSource
    DataSet = Tranches
    Left = 112
    Top = 32
  end
  object PaymentsDatSrc: TDataSource
    DataSet = Payments
    Left = 120
    Top = 128
  end
  object CM_CORR_TRCH_PAY: TOraclePackage
    Session = CMDataModule.CMSession
    PackageName = 'CM_CORR_TRCH_PAY'
    Left = 224
    Top = 40
  end
end
