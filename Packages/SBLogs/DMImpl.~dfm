object DataModuleLogs: TDataModuleLogs
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 299
  Top = 276
  Height = 640
  Width = 870
  object odsTables: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select * from sba_log_tables'
      'order by id')
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000040000004E414D4501000000
      0000070000005155455259535401000000000006000000444553435254010000
      000000}
    Session = sboapiDataModule.SBSession
    Left = 152
    Top = 80
    object odsTablesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object odsTablesNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object odsTablesQUERYST: TStringField
      FieldName = 'QUERYST'
      Size = 255
    end
    object odsTablesDESCRT: TStringField
      FieldName = 'DESCRT'
      Size = 100
    end
  end
  object Tables: TDataSource
    DataSet = odsTables
    Left = 152
    Top = 128
  end
  object LogTable: TDataSource
    DataSet = odsLogQ
    Left = 224
    Top = 128
  end
  object odsLogQ: TOracleDataSet
    SQL.Strings = (
      'select * from sbav_logs_modaccess'
      '')
    Session = sboapiDataModule.SBSession
    Left = 224
    Top = 80
  end
  object SB_ADM: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SB_ADM'
    Left = 88
    Top = 168
  end
end
