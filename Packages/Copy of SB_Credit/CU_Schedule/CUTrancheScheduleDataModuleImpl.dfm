object TrancheSheduleDataMod: TTrancheSheduleDataMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 480
  Width = 696
  object AboutContractDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT V.VAL_NAME as CURRENCY'
      '     , C.NAME as CUSTNAME'
      '     , P.CREDITLINEAMOUNT as AMOUNT'
      '  FROM CM_ACTIVE_CREDITS P'
      '      ,CM_BOOROWERINFO C'
      '      ,AVALUTE V'
      ' WHERE P.ID = C.CREDITID'
      '   AND P.CURRENCY = V.VALUTE'
      '   AND ID = :ID')
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400030000000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 72
  end
  object AboutContractsDataSrc: TDataSource
    DataSet = AboutContractDataSet
    Left = 48
    Top = 120
  end
  object TrancheScheduleDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT T.RowID, T.*'
      '  FROM CM_TRANCHE_SCHEDULE T'
      ' WHERE T.CREDITID = :CREDITID')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00430052004500440049005400490044000300
      00000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 184
    Top = 72
    object TrancheScheduleDataSetID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object TrancheScheduleDataSetCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object TrancheScheduleDataSetTRCHDATE: TDateTimeField
      FieldName = 'TRCHDATE'
      Required = True
    end
    object TrancheScheduleDataSetTRCHAMOUNT: TFloatField
      FieldName = 'TRCHAMOUNT'
    end
  end
  object TrancheScheduleDataSrc: TDataSource
    DataSet = TrancheScheduleDataSet
    Left = 184
    Top = 120
  end
  object CM_SCHEDULE: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CM_SCHEDULE'
    Left = 304
    Top = 208
  end
end
