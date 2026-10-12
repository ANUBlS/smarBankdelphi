object CorrectorDataMod: TCorrectorDataMod
  OldCreateOrder = False
  Height = 480
  Width = 696
  object CorrectData: TOracleDataSet
    SQL.Strings = (
      '/* Formatted on 2007/03/27 15:25 (Formatter Plus v4.7.0) */'
      'SELECT s.ROWID, cr_correct.crdnumber_get (creditid) AS num,'
      
        '       cr_correct.crdborrname_get (creditid) AS NAME, rest, inte' +
        'restrest,'
      
        '       duerest, dueinterestrest, givenamount, obligation, penalt' +
        'yrest'
      '  FROM cr_curr_state s'
      
        'where creditid in (select id from cr_portfolio where branchid in' +
        ' (select id from filial)) '
      'order by  :orderfield')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A004F0052004400450052004600490045004C00
      4400010000000000000000000000}
    Cursor = crHourGlass
    CachedUpdates = True
    Session = sboapiDataModule.SBSession
    Left = 64
    Top = 136
    object CorrectDataNUM: TWideStringField
      DisplayLabel = #8470
      FieldName = 'NUM'
      Size = 60
    end
    object CorrectDataNAME: TWideStringField
      DisplayLabel = #1041#1086#1088#1078#1072#1083#1072#1085
      FieldName = 'NAME'
      Size = 120
    end
    object CorrectDataREST: TFloatField
      DisplayLabel = #1071'.'#1041' '#1043#1072#1083#1099#1075
      FieldName = 'REST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object CorrectDataINTERESTREST: TFloatField
      DisplayLabel = #1060'.'#1041'. '#1043#1072#1083#1099#1075
      FieldName = 'INTERESTREST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object CorrectDataDUEREST: TFloatField
      DisplayLabel = #1069'.'#1041'. '#1043#1072#1083#1099#1075
      FieldName = 'DUEREST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object CorrectDataDUEINTERESTREST: TFloatField
      DisplayLabel = #1069'.'#1060'.'#1041'. '#1043#1072#1083#1099#1075
      FieldName = 'DUEINTERESTREST'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object CorrectDataGIVENAMOUNT: TFloatField
      DisplayLabel = #1042#1077#1088#1080#1083#1084#1080#1096' '#1084#1103#1073#1083#1103#1100
      FieldName = 'GIVENAMOUNT'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object CorrectDataOBLIGATION: TFloatField
      DisplayLabel = #1070#1097#1090#1103#1083#1080#1082
      FieldName = 'OBLIGATION'
      Required = True
      DisplayFormat = '#,#0.00'
    end
    object CorrectDataPENALTYREST: TFloatField
      DisplayLabel = #1055#1077#1085#1080#1081#1072
      FieldName = 'PENALTYREST'
      DisplayFormat = '#,#0.00'
    end
  end
  object DSCorrectData: TDataSource
    DataSet = CorrectData
    Left = 64
    Top = 184
  end
end
