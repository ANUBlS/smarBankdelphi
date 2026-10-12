object ActvDataMod: TActvDataMod
  OldCreateOrder = False
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
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400030000000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
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
    object CreditInfoNAME: TWideStringField
      FieldName = 'NAME'
      Size = 64
    end
    object CreditInfoVAL_NAME: TWideStringField
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
    Session = sboapiDataModule.SBSession
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
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00430052004500440049005400490044000300
      00000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 176
    Top = 104
    object ActvInfoACTVDATE: TDateTimeField
      FieldName = 'ACTVDATE'
      Required = True
    end
  end
end
