object DMWReport: TDMWReport
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 192
  Top = 107
  Height = 480
  Width = 696
  object TemplatesDataSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select id,path,name from'
      'sbcm_wr_templates'
      'order by name')
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 32
    object TemplatesDataSetID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object TemplatesDataSetPATH: Twidestringfield
      FieldName = 'PATH'
      Size = 4000
    end
    object TemplatesDataSetNAME: Twidestringfield
      FieldName = 'NAME'
      Required = True
      Size = 255
    end
  end
  object TemplatesDataSrc: TDataSource
    DataSet = TemplatesDataSet
    Left = 32
    Top = 96
  end
  object DepositInfoDataSet: TOracleDataSet
    Tag = 2
    SQL.Strings = (
      'SELECT *'
      '  FROM sbcm_wr_depositinfo'
      'where id# = :ContractID')
    Variables.Data = {
      03000000010000000B0000003A434F4E54524143544944030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      0400000017000000030000004944230100000000000A000000435553544F4D45
      524944010000000000040000004E414D450100000000000A00000053484F5254
      5F4E414D45010000000000080000004F50454E44415445010000000000090000
      00434C4F53454441544501000000000006000000414D4F554E54010000000000
      0A000000434F4E54524143544E4F01000000000008000000494E544552455354
      0100000000000F0000004F564552445545494E5445524553540100000000000C
      000000504552534F4E414C545950450100000000000F000000434F4E54524143
      545F504552494F44010000000000040000004349545901000000000007000000
      50484F4E455F570100000000000700000050484F4E455F480100000000000700
      000050484F4E455F4D0100000000000800000050415353504F52540100000000
      000800000050415350444154450100000000000D000000434F4E545241435441
      4343494401000000000006000000534F4E414D45010000000000090000004349
      4E465F4E414D45010000000000080000004C4153544E414D4501000000000006
      00000050415350504C010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 152
    Top = 32
  end
  object DepositInfoDataSrc: TDataSource
    DataSet = DepositInfoDataSet
    Left = 152
    Top = 96
  end
  object BookmarksDataSet: TOracleDataSet
    Tag = 2
    SQL.Strings = (
      'select  fieldid, bookmarkname'
      'from sbcm_wr_bookmarks'
      'where templateid=:templid'
      '')
    Variables.Data = {
      0300000001000000080000003A54454D504C4944030000000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 256
    Top = 32
  end
  object BookmarksDataSrc: TDataSource
    DataSet = BookmarksDataSet
    Left = 256
    Top = 96
  end
  object FieldsDataSet: TOracleDataSet
    Tag = 2
    SQL.Strings = (
      'select id,fieldname,description'
      'from sbcm_wr_fields'
      '')
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 360
    Top = 32
    object FieldsDataSetID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FieldsDataSetFIELDNAME: Twidestringfield
      FieldName = 'FIELDNAME'
      Required = True
      Size = 255
    end
    object FieldsDataSetDESCRIPTION: Twidestringfield
      FieldName = 'DESCRIPTION'
      Size = 255
    end
  end
  object FieldsDataSrc: TDataSource
    Left = 360
    Top = 96
  end
  object ReplaceDataSet: TOracleDataSet
    Tag = 2
    SQL.Strings = (
      'SELECT'
      '   B.TEMPLATEID , B.BOOKMARKNAME , A.FIELDNAME'
      'FROM'
      '   sbCM_WR_BOOKMARKS B'
      ' , sbCM_WR_FIELDS A'
      'WHERE'
      '     (B.FIELDID = A.ID)'
      '   AND templateid = :tid'
      '   AND bookmarkname = :bname')
    Variables.Data = {
      0300000002000000040000003A54494403000000000000000000000006000000
      3A424E414D45050000000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 160
  end
end
