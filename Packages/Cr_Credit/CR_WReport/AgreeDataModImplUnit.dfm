object AgreeDataModule: TAgreeDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 356
  Top = 301
  Height = 479
  Width = 741
  object TemplatesDataSet: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select id,path,name from'
      'cr_wr_templates'
      'order by name')
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 32
    object TemplatesDataSetID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object TemplatesDataSetPATH: TStringField
      FieldName = 'PATH'
      Size = 4000
    end
    object TemplatesDataSetNAME: TStringField
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
  object CreditInfoDataSet: TOracleDataSet
    Tag = 2
    SQL.Strings = (
      'SELECT a.* ,:man as manat ,:dat as data,:gir as GIROW'
      '  FROM cr_wr_creditinfo a'
      ' where a.creditid = :crid')
    Variables.Data = {
      0300000004000000050000003A43524944030000000000000000000000040000
      003A4D414E050000000000000000000000040000003A44415405000000000000
      0000000000040000003A474952050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000290000000800000043524544495449440100000000000A000000424F
      4F524F57455249440100000000000C000000424F4F524F5745524E414D450100
      0000000010000000444154454F46434F4E434C5553494F4E0100000000001000
      00004352454449544C494E45414D4F554E5401000000000013000000414E4E55
      414C59494E5445524553545241544501000000000012000000414E4E55414C59
      4F56455244554552415445010000000000140000004455454441544546495253
      54434F4E54524143540100000000000E0000004E554D4245524F464352454449
      540100000000000C000000504552534F4E414C545950450100000000000B0000
      00434F4E54524143544143430100000000000B000000424F4F524F5745524143
      430100000000000A000000504C454447454E414D450100000000001000000041
      4E59494E464F544F44495354494E470100000000000700000041444452455353
      0100000000000F000000505552504F53454F4643524544495401000000000007
      00000046494C4E414D4501000000000004000000534544520100000000000700
      00005345445246494C0100000000000A00000042414E4B414E4446494C010000
      000000040000004B524E4F01000000000003000000494E4E0100000000000500
      00005357494654010000000000050000004B4F445F4201000000000006000000
      4144524553530100000000000900000041445245535F46494C0100000000000B
      00000043555354414444524553530100000000000700000043555354494E4E01
      00000000000600000050415353455201000000000007000000504153504E554D
      0100000000000900000050415350504C4143450100000000000700000050484F
      4E455F480100000000000700000050484F4E455F4D0100000000000A00000048
      4F4C4445524E414D4501000000000006000000504552494F4401000000000008
      00000050415350444154450100000000000D00000047554152414E544F524E41
      4D450100000000000B00000047554152414E544F5249440100000000000B0000
      005A414D494E414452455331010000000000090000005A414D494E54454C3101
      0000000000050000004D414E4154010000000000}
    Session = sboapiDataModule.SBSession
    OnCalcFields = CreditInfoDataSetCalcFields
    Left = 152
    Top = 32
  end
  object CreditInfoDataSrc: TDataSource
    DataSet = CreditInfoDataSet
    Left = 144
    Top = 96
  end
  object BookmarksDataSet: TOracleDataSet
    Tag = 2
    SQL.Strings = (
      'select  fieldid, bookmarkname'
      'from cr_wr_bookmarks'
      'where templateid=:templid'
      '')
    Variables.Data = {
      0300000001000000080000003A54454D504C4944030000000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 248
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
      'from cr_wr_fields'
      '')
    Session = sboapiDataModule.SBSession
    OnCalcFields = CreditInfoDataSetCalcFields
    Left = 360
    Top = 32
    object FieldsDataSetID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FieldsDataSetFIELDNAME: TStringField
      FieldName = 'FIELDNAME'
      Required = True
      Size = 255
    end
    object FieldsDataSetDESCRIPTION: TStringField
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
      '   CR_WR_BOOKMARKS B'
      ' , CR_WR_FIELDS A'
      'WHERE'
      '     (B.FIELDID = A.ID)'
      '   AND templateid = :tid'
      '   AND bookmarkname = :bname')
    Variables.Data = {
      0300000002000000040000003A54494403000000000000000000000006000000
      3A424E414D45050000000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 64
    Top = 184
  end
  object yazi: TOracleDataSet
    SQL.Strings = (
      
        'select p.CREDITLINEAMOUNT,v.VALU_NAME ,round(months_between(p.du' +
        'edatefirstcontract, p.dateofconclusion)) per, h.pledgeprice'
      'from cr_active_credits p,avalute v,cr_curr_state h'
      'where p.id=:id '
      'and p.currency=v.VALUTE and p.id=h.creditid'
      '')
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 216
    Top = 192
  end
end
