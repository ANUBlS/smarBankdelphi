object COBDatMod: TCOBDatMod
  OldCreateOrder = False
  Left = 205
  Top = 152
  Height = 450
  Width = 729
  object INTCACHEDatSet: TOracleDataSet
    SQL.Strings = (
      'select '
      '            *'
      '  from'
      '            CM_INTCACHE'
      'where id in (select creditid from cm_int_outbalance)'
      '')
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 48
    Top = 32
    object INTCACHEDatSetID: TFloatField
      DisplayWidth = 10
      FieldName = 'ID'
      Required = True
    end
    object INTCACHEDatSetCURRENCY: TFloatField
      DisplayWidth = 10
      FieldName = 'CURRENCY'
      Required = True
    end
    object INTCACHEDatSetBOOROWERID: TFloatField
      DisplayWidth = 14
      FieldName = 'BOOROWERID'
      Required = True
    end
    object INTCACHEDatSetNUMBEROFCREDIT: TStringField
      DisplayWidth = 32
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object INTCACHEDatSetUSRGROUP: TFloatField
      DisplayWidth = 10
      FieldName = 'USRGROUP'
      Required = True
    end
    object INTCACHEDatSetBRANCHID: TFloatField
      DisplayWidth = 10
      FieldName = 'BRANCHID'
      Required = True
    end
    object INTCACHEDatSetCUSTOMERTYPE: TFloatField
      DisplayWidth = 10
      FieldName = 'CUSTOMERTYPE'
      Required = True
    end
    object INTCACHEDatSetUSID: TFloatField
      DisplayWidth = 10
      FieldName = 'USID'
      Required = True
    end
    object INTCACHEDatSetPERSONALTYPE: TFloatField
      DisplayWidth = 10
      FieldName = 'PERSONALTYPE'
      Required = True
    end
    object INTCACHEDatSetSTOPCALCDATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'STOPCALCDATE'
    end
    object INTCACHEDatSetCREDITTYPE: TFloatField
      DisplayWidth = 10
      FieldName = 'CREDITTYPE'
      Required = True
    end
    object INTCACHEDatSetREST: TFloatField
      DisplayWidth = 10
      FieldName = 'REST'
      Required = True
    end
    object INTCACHEDatSetINTERESTREST: TFloatField
      DisplayWidth = 10
      FieldName = 'INTERESTREST'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object INTCACHEDatSetDUEREST: TFloatField
      DisplayWidth = 10
      FieldName = 'DUEREST'
      Required = True
    end
    object INTCACHEDatSetDUEINTERESTREST: TFloatField
      DisplayWidth = 10
      FieldName = 'DUEINTERESTREST'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object INTCACHEDatSetCONTRACTACCNO: TStringField
      DisplayWidth = 4000
      FieldName = 'CONTRACTACCNO'
      Size = 4000
    end
    object INTCACHEDatSetVAL_NAME: TStringField
      DisplayWidth = 10
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object INTCACHEDatSetNAME: TStringField
      DisplayWidth = 64
      FieldName = 'NAME'
      Size = 64
    end
    object INTCACHEDatSetINTEREST: TFloatField
      DisplayWidth = 10
      FieldName = 'INTEREST'
      Required = True
    end
    object INTCACHEDatSetDUEINTEREST: TFloatField
      DisplayWidth = 10
      FieldName = 'DUEINTEREST'
      Required = True
    end
    object INTCACHEDatSetTRPROCESSED: TFloatField
      DisplayWidth = 10
      FieldName = 'TRPROCESSED'
      Required = True
    end
  end
  object OUTBDatSrc: TDataSource
    DataSet = INTCACHEDatSet
    Left = 40
    Top = 96
  end
  object CM_CALCINOUTBALANCE: TOraclePackage
    Session = CMDataModule.CMSession
    PackageName = 'CM_CALCINOUTBALANCE'
    Left = 176
    Top = 40
  end
  object DateInOut: TOracleDataSet
    SQL.Strings = (
      'select *from sb_sysdat')
    Session = CMDataModule.CMSession
    Left = 288
    Top = 32
    object DateInOutTEK_DAT: TDateTimeField
      FieldName = 'TEK_DAT'
      Required = True
    end
    object DateInOutPRED_DAT: TDateTimeField
      FieldName = 'PRED_DAT'
    end
    object DateInOutARC_DAY: TDateTimeField
      FieldName = 'ARC_DAY'
    end
    object DateInOutCLOSE: TIntegerField
      FieldName = 'CLOSE'
    end
  end
  object DateInOutDatSrc: TDataSource
    DataSet = DateInOut
    Left = 296
    Top = 104
  end
end
