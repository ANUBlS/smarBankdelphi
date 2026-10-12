object DataModuleTypes: TDataModuleTypes
  OldCreateOrder = False
  Height = 592
  Width = 836
  object DepTypes: TOracleDataSet
    SQL.Strings = (
      'SELECT id, type'
      '  FROM dm_types')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000002000000040000004900440001000000000008000000540059005000
      4500010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 8
    object DepTypesID: TFloatField
      DisplayWidth = 10
      FieldName = 'ID'
      Required = True
    end
    object DepTypesTYPE: TWideStringField
      DisplayLabel = #1058#1080#1087#1080
      DisplayWidth = 39
      FieldName = 'TYPE'
      Required = True
      Size = 256
    end
  end
  object DepTypesDatSrc: TDataSource
    DataSet = DepTypes
    Left = 96
    Top = 8
  end
  object DSDayCount: TDataSource
    DataSet = ODSDayCount
    Left = 104
    Top = 64
  end
  object ODSDayCount: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      '  FROM dm_daycount')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 64
  end
end
