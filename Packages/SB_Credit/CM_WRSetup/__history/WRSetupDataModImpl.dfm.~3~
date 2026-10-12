object WRSetupDataMod: TWRSetupDataMod
  OldCreateOrder = False
  Height = 518
  Width = 731
  object WRTemplatesDataSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT T.RowID , T.*'
      '  FROM CM_WR_TEMPLATES T')
    Optimize = False
    CountAllRecords = True
    OnApplyRecord = WRTemplatesDataSetApplyRecord
    Session = sboapiDataModule.SBSession
    Filtered = True
    Left = 64
    Top = 48
    object WRTemplatesDataSetID: TFloatField
      FieldName = 'ID'
    end
    object WRTemplatesDataSetNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 255
    end
    object WRTemplatesDataSetPATH: TWideStringField
      FieldName = 'PATH'
      Size = 4000
    end
  end
  object WRTemplatesDataSrc: TDataSource
    DataSet = WRTemplatesDataSet
    Left = 64
    Top = 104
  end
  object CM_WR_TOOLS: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CM_WR_TOOLS'
    Left = 64
    Top = 192
  end
  object WRBookmarksDataSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT ID, TEMPLATEID, FIELDID, BOOKMARKNAME'
      '  FROM CM_WR_BOOKMARKS'
      'where templateid = :templateid')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A00540045004D0050004C004100540045004900
      4400040000000000000000000000}
    Master = WRTemplatesDataSet
    MasterFields = 'ID'
    DetailFields = 'TEMPLATEID'
    CountAllRecords = True
    OnApplyRecord = WRBookmarksDataSetApplyRecord
    Session = sboapiDataModule.SBSession
    Filtered = True
    Left = 184
    Top = 48
    object WRBookmarksDataSetID: TFloatField
      FieldName = 'ID'
    end
    object WRBookmarksDataSetTEMPLATEID: TFloatField
      FieldName = 'TEMPLATEID'
    end
    object WRBookmarksDataSetFIELDID: TFloatField
      FieldName = 'FIELDID'
    end
    object WRBookmarksDataSetBOOKMARKNAME: TWideStringField
      FieldName = 'BOOKMARKNAME'
      Size = 255
    end
  end
  object WRBookmarksDataSrc: TDataSource
    DataSet = WRBookmarksDataSet
    Left = 184
    Top = 104
  end
  object WRFieldsDataSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT ID, FIELDNAME, DESCRIPTION'
      '  FROM CM_WR_FIELDS'
      'order by DESCRIPTION')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 296
    Top = 48
  end
  object WRFieldsDataSrc: TDataSource
    DataSet = WRFieldsDataSet
    Left = 296
    Top = 104
  end
  object OpenDlg: TOpenDialog
    Filter = 'Word Templates(*.dot)|*.dot'
    Left = 200
    Top = 192
  end
  object OracleDataSetTamplates: TOracleDataSet
    SQL.Strings = (
      'SELECT T.*'
      '  FROM CM_WR_TEMPLATES T')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000080000005000410054004800010000000000}
    Session = sboapiDataModule.SBSession
    Left = 424
    Top = 48
    object OracleDataSetTamplatesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OracleDataSetTamplatesPATH: TWideStringField
      FieldName = 'PATH'
      Size = 4000
    end
    object OracleDataSetTamplatesNAME: TWideStringField
      FieldName = 'NAME'
      Size = 255
    end
  end
  object DataSourceTamplates: TDataSource
    DataSet = OracleDataSetTamplates
    Left = 424
    Top = 112
  end
  object FilialDataSet: TOracleDataSet
    SQL.Strings = (
      'select rowid, a.* from smart.filial_t a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000C0000000400000049004400010000000000080000004E0041004D00
      4500010000000000140000004B004F0044005F00460049004C00490041004C00
      0100000000000C00000043005F004E0041004D0045000100000000000C000000
      440052004E0041004D004500010000000000100000004400520053004F004E00
      41004D00450001000000000014000000440052004C004100530054004E004100
      4D0045000100000000001400000044005200460055004C004C004E0041004D00
      45000100000000000A0000004E004E0041004D0045000100000000000E000000
      4E0053004F004E0041004D004500010000000000160000004E00440052004C00
      4100530054004E0041004D004500010000000000120000004E00460055004C00
      4C004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 112
    Top = 272
    object FilialDataSetNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
    object FilialDataSetC_NAME: TWideStringField
      FieldName = 'C_NAME'
      Size = 90
    end
    object FilialDataSetDRNAME: TWideStringField
      FieldName = 'DRNAME'
      Size = 35
    end
    object FilialDataSetDRFULLNAME: TWideStringField
      FieldName = 'DRFULLNAME'
      Size = 40
    end
    object FilialDataSetNNAME: TWideStringField
      FieldName = 'NNAME'
      Size = 40
    end
    object FilialDataSetNFULLNAME: TWideStringField
      FieldName = 'NFULLNAME'
      Size = 40
    end
  end
  object FilialSrc: TDataSource
    DataSet = FilialDataSet
    Left = 40
    Top = 272
  end
end
