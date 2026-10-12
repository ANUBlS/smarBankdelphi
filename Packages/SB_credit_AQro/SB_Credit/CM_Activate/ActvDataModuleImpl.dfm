object ActvDataMod: TActvDataMod
  OldCreateOrder = False
  Left = 275
  Top = 108
  Height = 407
  Width = 713
  object CreditInfo: TOracleDataSet
    SQL.Strings = (
      'select'
      '  Name,'
      '  VAL_NAME,'
      '  Obligation,'
      '  PledgePrice'
      'from'
      '  CM_ACTIVE'
      'where ID=:ID')
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 80
    Top = 40
    object CreditInfoOBLIGATION: TFloatField
      FieldName = 'OBLIGATION'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object CreditInfoPLEDGEPRICE: TFloatField
      FieldName = 'PLEDGEPRICE'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object CreditInfoNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object CreditInfoVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
  end
  object DataSrcCreditInfo: TDataSource
    DataSet = CreditInfo
    Left = 168
    Top = 40
  end
  object ActivationPckg: TOraclePackage
    Session = CMDataModule.CMSession
    PackageName = 'CM_ACTIVATION'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Left = 80
    Top = 104
  end
  object ActvInfo: TOracleDataSet
    SQL.Strings = (
      'select '
      '     ACTVDATE '
      '   from '
      '      CM_ACTV_TRANSACTIONS'
      'where CreditID=:CreditID')
    Variables.Data = {
      0300000001000000090000003A43524544495449440300000000000000000000
      00}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 176
    Top = 104
    object ActvInfoACTVDATE: TDateTimeField
      FieldName = 'ACTVDATE'
      Required = True
    end
  end
end
