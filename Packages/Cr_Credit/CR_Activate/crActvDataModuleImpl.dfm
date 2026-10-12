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
      '  CR_ACTIVE'
      'where ID=:ID')
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000004000000080000004E0041004D004500010000000000100000005600
      41004C005F004E0041004D004500010000000000140000004F0042004C004900
      47004100540049004F004E000100000000001600000050004C00450044004700
      450050005200490043004500010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 80
    Top = 40
    object CreditInfoNAME: TWideStringField
      FieldName = 'NAME'
      Size = 64
    end
    object CreditInfoVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object CreditInfoOBLIGATION: TFloatField
      FieldName = 'OBLIGATION'
    end
    object CreditInfoPLEDGEPRICE: TFloatField
      FieldName = 'PLEDGEPRICE'
    end
  end
  object DataSrcCreditInfo: TDataSource
    DataSet = CreditInfo
    Left = 168
    Top = 40
  end
  object ActivationPckg: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CR_ACTIVATION'
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
      '      CR_ACTV_TRANSACTIONS'
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
