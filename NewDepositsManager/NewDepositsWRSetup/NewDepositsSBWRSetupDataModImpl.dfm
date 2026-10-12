object NewDepositsSBWRSetupDataMod: TNewDepositsSBWRSetupDataMod
  OldCreateOrder = False
  Height = 425
  Width = 627
  object SBWRTemplatesDSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT T.RowID , T.*'
      '  FROM DM_WR_TEMPLATES T')
    Optimize = False
    CountAllRecords = True
    Session = sboapiDataModule.SBSession
    Filtered = True
    Left = 48
    Top = 24
    object SBWRTemplatesDSetID: TFloatField
      FieldName = 'ID'
    end
    object SBWRTemplatesDSetNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 255
    end
    object SBWRTemplatesDSetPATH: TWideStringField
      FieldName = 'PATH'
      Size = 4000
    end
  end
  object SBWRTemplatesDSrc: TDataSource
    DataSet = SBWRTemplatesDSet
    Left = 48
    Top = 80
  end
  object SBCM_WR_TOOLS: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SBCM_WR_TOOLS_new'
    Left = 48
    Top = 168
  end
  object SBWRBookmarksDSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT rowid,ID, TEMPLATEID, FIELDID, BOOKMARKNAME'
      '  FROM DM_WR_BOOKMARKS'
      'where templateid = :templateid')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A00540045004D0050004C004100540045004900
      4400040000000000000000000000}
    Master = SBWRTemplatesDSet
    MasterFields = 'ID'
    DetailFields = 'TEMPLATEID'
    CountAllRecords = True
    Session = sboapiDataModule.SBSession
    Filtered = True
    Left = 168
    Top = 24
    object SBWRBookmarksDSetID: TFloatField
      FieldName = 'ID'
    end
    object SBWRBookmarksDSetTEMPLATEID: TFloatField
      FieldName = 'TEMPLATEID'
    end
    object SBWRBookmarksDSetFIELDID: TFloatField
      FieldName = 'FIELDID'
    end
    object SBWRBookmarksDSetBOOKMARKNAME: TWideStringField
      FieldName = 'BOOKMARKNAME'
      Size = 255
    end
  end
  object SBWRBookmarksDSrc: TDataSource
    DataSet = SBWRBookmarksDSet
    Left = 168
    Top = 80
  end
  object SBWRFieldsDSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT ID, FIELDNAME, DESCRIPTION'
      '  FROM DM_WR_FIELDS')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 280
    Top = 24
  end
  object SBWRFieldsDSrc: TDataSource
    DataSet = SBWRFieldsDSet
    Left = 280
    Top = 80
  end
  object OpenDlg: TOpenDialog
    Filter = 'Word Templates(*.dot)|*.dot'
    Left = 184
    Top = 168
  end
  object SBOracleDSetTamplates: TOracleDataSet
    SQL.Strings = (
      'SELECT T.*'
      '  FROM DM_WR_TEMPLATES T')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 408
    Top = 24
    object SBOracleDSetTamplatesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object SBOracleDSetTamplatesNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 255
    end
    object SBOracleDSetTamplatesPATH: TWideStringField
      FieldName = 'PATH'
      Size = 4000
    end
  end
  object SBDSourceTamplates: TDataSource
    DataSet = SBOracleDSetTamplates
    Left = 408
    Top = 88
  end
  object SBDMInfoDataSet: TOracleDataSet
    Tag = 2
    SQL.Strings = (
      'SELECT *'
      '  FROM dm_contracts '
      ' where id = :conid')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A0043004F004E00490044000300000000000000
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 272
  end
  object SBDMInfoDataSrc: TDataSource
    DataSet = SBDMInfoDataSet
    Left = 48
    Top = 336
  end
  object SBReplaceDataSet: TOracleDataSet
    Tag = 2
    SQL.Strings = (
      'SELECT'
      '   B.TEMPLATEID , B.BOOKMARKNAME , A.FIELDNAME'
      'FROM'
      '   SMART.DM_WR_BOOKMARKS B'
      ' , SMART.DM_WR_FIELDS A'
      'WHERE'
      '     (B.FIELDID = A.ID)'
      '   AND templateid = :tid'
      '   AND bookmarkname = :bname')
    Optimize = False
    Variables.Data = {
      0400000002000000080000003A00540049004400030000000000000000000000
      0C0000003A0042004E0041004D004500050000000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 216
    Top = 272
  end
end
