object SBWRSetupDataMod: TSBWRSetupDataMod
  OldCreateOrder = False
  Height = 480
  Width = 696
  object SBWRTemplatesDSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT T.RowID , T.*'
      '  FROM SBCM_WR_TEMPLATES T'
      'order by t.id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000080000005000410054004800010000000000}
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
    PackageName = 'SBCM_WR_TOOLS'
    Left = 48
    Top = 168
  end
  object SBWRBookmarksDSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT rowid,ID, TEMPLATEID, FIELDID, BOOKMARKNAME'
      '  FROM SBCM_WR_BOOKMARKS'
      'where templateid = :templateid'
      'order by fieldid,id')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A00540045004D0050004C004100540045004900
      4400040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000004000000040000004900440001000000000014000000540045004D00
      50004C00410054004500490044000100000000000E0000004600490045004C00
      4400490044000100000000001800000042004F004F004B004D00410052004B00
      4E0041004D004500010000000000}
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
      '  FROM SBCM_WR_FIELDS')
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
      '  FROM SBCM_WR_TEMPLATES T')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000080000005000410054004800010000000000}
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
      
        'SELECT a.id, a.type#, a.opendate, a.closedate, a.amount, a.contr' +
        'actno,'
      
        '       a.contracttype, a.pledgetype, a.reliabilityid, a.clientty' +
        'pe,'
      
        '       a.pledgeprice, a.sid#, a.overduereliabilityid, a.branchid' +
        ','
      '       a.personaltype, a.currency'
      '  FROM sbcm_contracts a'
      ' where id = :conid')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A0043004F004E00490044000300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      050000001000000004000000490044000100000000000A000000540059005000
      45002300010000000000100000004F00500045004E0044004100540045000100
      000000001200000043004C004F00530045004400410054004500010000000000
      0C00000041004D004F0055004E0054000100000000001400000043004F004E00
      540052004100430054004E004F000100000000001800000043004F004E005400
      520041004300540054005900500045000100000000001400000050004C004500
      44004700450054005900500045000100000000001A000000520045004C004900
      4100420049004C00490054005900490044000100000000001400000043004C00
      490045004E00540054005900500045000100000000001600000050004C004500
      4400470045005000520049004300450001000000000008000000530049004400
      2300010000000000280000004F00560045005200440055004500520045004C00
      49004100420049004C0049005400590049004400010000000000100000004200
      520041004E004300480049004400010000000000180000005000450052005300
      4F004E0041004C00540059005000450001000000000010000000430055005200
      520045004E0043005900010000000000}
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 272
    object SBDMInfoDataSetCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object SBDMInfoDataSetBOOROWERID: TFloatField
      FieldName = 'BOOROWERID'
      Required = True
    end
    object SBDMInfoDataSetDATEOFCONCLUSION: TDateTimeField
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object SBDMInfoDataSetCREDITLINEAMOUNT: TFloatField
      FieldName = 'CREDITLINEAMOUNT'
      Required = True
    end
    object SBDMInfoDataSetANNUALYINTERESTRATE: TFloatField
      FieldName = 'ANNUALYINTERESTRATE'
      Required = True
    end
    object SBDMInfoDataSetANNUALYOVERDUERATE: TFloatField
      FieldName = 'ANNUALYOVERDUERATE'
      Required = True
    end
    object SBDMInfoDataSetDUEDATEFIRSTCONTRACT: TDateTimeField
      FieldName = 'DUEDATEFIRSTCONTRACT'
      Required = True
    end
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
      '   SMART.SBCM_WR_BOOKMARKS B'
      ' , SMART.SBCM_WR_FIELDS A'
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
