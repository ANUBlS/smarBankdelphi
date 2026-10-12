object DMWReport_new: TDMWReport_new
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 340
  Width = 544
  object TemplatesDataSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select id,path,name from'
      'sbcm_wr_templates_new'
      'order by name')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 32
    object TemplatesDataSetID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object TemplatesDataSetPATH: TWideStringField
      FieldName = 'PATH'
      Size = 4000
    end
    object TemplatesDataSetNAME: TWideStringField
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
      '  FROM sbcm_wr_depositinfo_new'
      'where id# = :ContractID')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0043004F004E00540052004100430054004900
      4400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000017000000060000004900440023000100000000001400000043005500
      530054004F004D004500520049004400010000000000080000004E0041004D00
      450001000000000014000000530048004F00520054005F004E0041004D004500
      010000000000100000004F00500045004E004400410054004500010000000000
      1200000043004C004F005300450044004100540045000100000000000C000000
      41004D004F0055004E0054000100000000001400000043004F004E0054005200
      4100430054004E004F000100000000001000000049004E005400450052004500
      530054000100000000001E0000004F0056004500520044005500450049004E00
      5400450052004500530054000100000000001800000050004500520053004F00
      4E0041004C0054005900500045000100000000001E00000043004F004E005400
      52004100430054005F0050004500520049004F00440001000000000008000000
      43004900540059000100000000000E000000500048004F004E0045005F005700
      0100000000000E000000500048004F004E0045005F0048000100000000000E00
      0000500048004F004E0045005F004D0001000000000010000000500041005300
      530050004F005200540001000000000010000000500041005300500044004100
      540045000100000000001A00000043004F004E00540052004100430054004100
      43004300490044000100000000000C00000053004F004E0041004D0045000100
      0000000012000000430049004E0046005F004E0041004D004500010000000000
      100000004C004100530054004E0041004D0045000100000000000C0000005000
      41005300500050004C00010000000000}
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
      'from sbcm_wr_bookmarks_new'
      'where templateid=:templid'
      '')
    Optimize = False
    Variables.Data = {
      0400000001000000100000003A00540045004D0050004C004900440003000000
      0000000000000000}
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
      'from sbcm_wr_fields_new'
      '')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 360
    Top = 32
    object FieldsDataSetID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FieldsDataSetFIELDNAME: TWideStringField
      FieldName = 'FIELDNAME'
      Required = True
      Size = 255
    end
    object FieldsDataSetDESCRIPTION: TWideStringField
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
      '   sbCM_WR_BOOKMARKS_new B'
      ' , sbCM_WR_FIELDS_new A'
      'WHERE'
      '     (B.FIELDID = A.ID)'
      '   AND templateid = :tid'
      '   AND bookmarkname = :bname')
    Optimize = False
    Variables.Data = {
      0400000002000000080000003A00540049004400030000000000000000000000
      0C0000003A0042004E0041004D004500050000000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 160
  end
end
