object DataModuleTax: TDataModuleTax
  OldCreateOrder = False
  Height = 355
  Width = 495
  object DSFields: TDataSource
    DataSet = ODSFields
    Left = 264
    Top = 104
  end
  object ODSFields: TOracleDataSet
    SQL.Strings = (
      'select * from sbcmdeposits_fields')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 176
    Top = 104
  end
  object ODSTaxPayment: TOracleDataSet
    SQL.Strings = (
      'select '
      ' id,'
      ' customerid,'
      ' taxamount,'
      ' taxpayamount,'
      ' (select name from customers where id=customerid)custname,'
      ' custpayamount'
      'from '
      '  sbcm_taxpayments'
      'order by :title'
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A005400490054004C0045000100000003000000
      49440000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000006000000040000004900440001000000000014000000430055005300
      54004F004D004500520049004400010000000000120000005400410058004100
      4D004F0055004E00540001000000000018000000540041005800500041005900
      41004D004F0055004E0054000100000000001000000043005500530054004E00
      41004D0045000100000000001A00000043005500530054005000410059004100
      4D004F0055004E005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 88
    Top = 248
    object ODSTaxPaymentID: TFloatField
      DisplayLabel = 'No'
      FieldName = 'ID'
    end
    object ODSTaxPaymentCUSTOMERID: TFloatField
      DisplayLabel = 'M'#252#351't'#601'rinin n'#246'mr'#601'si'
      FieldName = 'CUSTOMERID'
    end
    object ODSTaxPaymentTAXAMOUNT: TFloatField
      DisplayLabel = 'Y'#305#287#305'lm'#305#351' faiz m'#601'bl'#601#287'i'
      FieldName = 'TAXAMOUNT'
    end
    object ODSTaxPaymentTAXPAYAMOUNT: TFloatField
      DisplayLabel = #214'd'#601'nilmi'#351' vergi m'#601'bl'#601#287'i'
      FieldName = 'TAXPAYAMOUNT'
    end
    object ODSTaxPaymentCUSTNAME: TWideStringField
      DisplayLabel = 'M'#252#351't'#601'rinin S.A.A.'
      FieldName = 'CUSTNAME'
      Size = 360
    end
    object ODSTaxPaymentCUSTPAYAMOUNT: TFloatField
      DisplayLabel = #214'd'#601'nilmi'#351' faiz m'#601'bl'#601#287
      FieldName = 'CUSTPAYAMOUNT'
    end
  end
  object DataSource1: TDataSource
    DataSet = ODSTaxPayment
    Left = 200
    Top = 240
  end
end
