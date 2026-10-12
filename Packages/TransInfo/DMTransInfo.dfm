object DM: TDM
  OldCreateOrder = False
  Height = 270
  Width = 854
  object ODS_mmx_account_status: TOracleDataSet
    SQL.Strings = (
      'SELECT a.id, a.symbol, a.description'
      '  FROM mmx_account_status a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000000C000000530059004D00
      42004F004C000100000000001600000044004500530043005200490050005400
      49004F004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 64
    Top = 8
    object ODS_mmx_account_statusID: TFloatField
      FieldName = 'ID'
    end
    object ODS_mmx_account_statusSYMBOL: TWideStringField
      FieldName = 'SYMBOL'
      Size = 1
    end
    object ODS_mmx_account_statusDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 30
    end
  end
  object ODS_mmx_account_type: TOracleDataSet
    SQL.Strings = (
      'SELECT a.id, a.symbol, a.description'
      '  FROM mmx_account_type a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000000C000000530059004D00
      42004F004C000100000000001600000044004500530043005200490050005400
      49004F004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 200
    Top = 8
    object ODS_mmx_account_typeID: TFloatField
      FieldName = 'ID'
    end
    object ODS_mmx_account_typeSYMBOL: TWideStringField
      FieldName = 'SYMBOL'
      Size = 1
    end
    object ODS_mmx_account_typeDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 30
    end
  end
  object ODS_mmx_communication_type: TOracleDataSet
    SQL.Strings = (
      'SELECT a.id, a.symbol, a.description'
      '  FROM mmx_communication_type a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000000C000000530059004D00
      42004F004C000100000000001600000044004500530043005200490050005400
      49004F004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 344
    Top = 10
    object ODS_mmx_communication_typeID: TIntegerField
      FieldName = 'ID'
    end
    object ODS_mmx_communication_typeSYMBOL: TWideStringField
      FieldName = 'SYMBOL'
      Size = 1
    end
    object ODS_mmx_communication_typeDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
  end
  object ODS_mmx_contact_type: TOracleDataSet
    SQL.Strings = (
      'SELECT a.id, a.symbol, a.description'
      '  FROM mmx_contact_type a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000000C000000530059004D00
      42004F004C000100000000001600000044004500530043005200490050005400
      49004F004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 200
    Top = 136
    object ODS_mmx_contact_typeID: TIntegerField
      FieldName = 'ID'
    end
    object ODS_mmx_contact_typeSYMBOL: TWideStringField
      FieldName = 'SYMBOL'
      Size = 1
    end
    object ODS_mmx_contact_typeDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
  end
  object ODS_mmx_fromfunds: TOracleDataSet
    SQL.Strings = (
      'SELECT a.id, a.symbol, a.description'
      '  FROM mmx_fromfunds a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000000C000000530059004D00
      42004F004C000100000000001600000044004500530043005200490050005400
      49004F004E00010000000000}
    Session = sboapiDataModule.SBSession
    AfterScroll = ODS_mmx_fromfundsAfterScroll
    Left = 336
    Top = 136
    object ODS_mmx_fromfundsID: TIntegerField
      FieldName = 'ID'
    end
    object ODS_mmx_fromfundsSYMBOL: TWideStringField
      FieldName = 'SYMBOL'
      Size = 1
    end
    object ODS_mmx_fromfundsDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
  end
  object ODS_mmx_reportcode: TOracleDataSet
    SQL.Strings = (
      'SELECT a.id, a.name, a.description'
      '  FROM mmx_reportcode a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000160000004400450053004300520049005000540049004F00
      4E00010000000000}
    Session = sboapiDataModule.SBSession
    AfterScroll = ODS_mmx_reportcodeAfterScroll
    Left = 656
    Top = 11
    object ODS_mmx_reportcodeID: TIntegerField
      FieldName = 'ID'
    end
    object ODS_mmx_reportcodeNAME: TWideStringField
      FieldName = 'NAME'
      Size = 5
    end
    object ODS_mmx_reportcodeDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 150
    end
  end
  object ODS_mmx_transaction_item_type: TOracleDataSet
    SQL.Strings = (
      'SELECT a.id, a.symbol, a.description'
      '  FROM mmx_transaction_item_type a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000000C000000530059004D00
      42004F004C000100000000001600000044004500530043005200490050005400
      49004F004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 510
    Top = 11
    object ODS_mmx_transaction_item_typeID: TFloatField
      FieldName = 'ID'
    end
    object ODS_mmx_transaction_item_typeSYMBOL: TWideStringField
      FieldName = 'SYMBOL'
      Size = 2
    end
    object ODS_mmx_transaction_item_typeDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 15
    end
  end
  object ODS_mmx_transmode: TOracleDataSet
    SQL.Strings = (
      'SELECT a.id, a.name, a.description'
      '  FROM mmx_transmode a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000160000004400450053004300520049005000540049004F00
      4E00010000000000}
    Session = sboapiDataModule.SBSession
    AfterScroll = ODS_mmx_transmodeAfterScroll
    Left = 64
    Top = 135
    object ODS_mmx_transmodeID: TIntegerField
      FieldName = 'ID'
    end
    object ODS_mmx_transmodeNAME: TIntegerField
      FieldName = 'NAME'
    end
    object ODS_mmx_transmodeDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 400
    end
  end
  object DS_mmx_account_status: TDataSource
    DataSet = ODS_mmx_account_status
    Left = 64
    Top = 64
  end
  object DS_mmx_account_type: TDataSource
    DataSet = ODS_mmx_account_type
    Left = 200
    Top = 64
  end
  object DS_mmx_communication_type: TDataSource
    DataSet = ODS_mmx_communication_type
    Left = 344
    Top = 64
  end
  object DS_mmx_transaction_item_type: TDataSource
    DataSet = ODS_mmx_transaction_item_type
    Left = 512
    Top = 64
  end
  object DS_mmx_reportcode: TDataSource
    DataSet = ODS_mmx_reportcode
    Left = 656
    Top = 64
  end
  object DS_mmx_transmode: TDataSource
    DataSet = ODS_mmx_transmode
    Left = 56
    Top = 192
  end
  object DS_mmx_contact_type: TDataSource
    DataSet = ODS_mmx_contact_type
    Left = 192
    Top = 192
  end
  object DS_mmx_fromfunds: TDataSource
    DataSet = ODS_mmx_fromfunds
    Left = 336
    Top = 192
  end
  object ODS_MMX_TRANS_ITEM_STATUS: TOracleDataSet
    SQL.Strings = (
      'SELECT a.id, a.symbol, a.description'
      '  FROM MMX_TRANS_ITEM_STATUS a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000000C000000530059004D00
      42004F004C000100000000001600000044004500530043005200490050005400
      49004F004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 579
    Top = 136
    object ODS_MMX_TRANS_ITEM_STATUSID: TFloatField
      FieldName = 'ID'
    end
    object ODS_MMX_TRANS_ITEM_STATUSSYMBOL: TWideStringField
      FieldName = 'SYMBOL'
      Size = 1
    end
    object ODS_MMX_TRANS_ITEM_STATUSDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 30
    end
  end
  object DS_MMX_TRANS_ITEM_STATUS: TDataSource
    DataSet = ODS_MMX_TRANS_ITEM_STATUS
    Left = 579
    Top = 192
  end
  object ODS_Countries: TOracleDataSet
    SQL.Strings = (
      'SELECT a.id, a.CNTR_NAME,a.SYMB'
      '  FROM COUNTRIES a order by a.id, a.CNTR_NAME')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000001200000043004E005400
      52005F004E0041004D00450001000000000008000000530059004D0042000100
      00000000}
    Session = sboapiDataModule.SBSession
    AfterScroll = ODS_CountriesAfterScroll
    Left = 715
    Top = 136
    object ODS_CountriesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODS_CountriesCNTR_NAME: TWideStringField
      FieldName = 'CNTR_NAME'
      Size = 30
    end
    object ODS_CountriesSYMB: TWideStringField
      FieldName = 'SYMB'
      Size = 12
    end
  end
  object ODS_Cityes: TOracleDataSet
    SQL.Strings = (
      'SELECT a.id, a.country_id, a.city_name'
      '  FROM cities a '
      'where country_id = :country_id'
      'order by a.id, a.city_name')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0043004F0055004E005400520059005F004900
      440003000000040000000100000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000001400000043004F005500
      4E005400520059005F0049004400010000000000120000004300490054005900
      5F004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 795
    Top = 136
    object ODS_CityesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODS_CityesCOUNTRY_ID: TFloatField
      FieldName = 'COUNTRY_ID'
      Required = True
    end
    object ODS_CityesCITY_NAME: TWideStringField
      FieldName = 'CITY_NAME'
      Size = 80
    end
  end
  object DS_Countries: TDataSource
    DataSet = ODS_Countries
    Left = 715
    Top = 200
  end
  object DS_Cityes: TDataSource
    DataSet = ODS_Cityes
    Left = 795
    Top = 200
  end
  object MMX: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'MMX'
    Left = 752
    Top = 32
  end
  object ODS_mmx_tofunds: TOracleDataSet
    SQL.Strings = (
      'SELECT a.id, a.symbol, a.description'
      '  FROM mmx_fromfunds a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000000C000000530059004D00
      42004F004C000100000000001600000044004500530043005200490050005400
      49004F004E00010000000000}
    Session = sboapiDataModule.SBSession
    AfterScroll = ODS_mmx_tofundsAfterScroll
    Left = 440
    Top = 136
    object ODS_mmx_tofundsID: TIntegerField
      FieldName = 'ID'
    end
    object ODS_mmx_tofundsSYMBOL: TWideStringField
      FieldName = 'SYMBOL'
      Size = 4
    end
    object ODS_mmx_tofundsDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 400
    end
  end
  object DS_mmx_tofunds: TDataSource
    DataSet = ODS_mmx_tofunds
    Left = 440
    Top = 190
  end
  object ODS_TransInfo: TOracleDataSet
    SQL.Strings = (
      
        'select t.rowid, t.* from mmx_TransInfo t where t.transid=:v_tran' +
        'sid')
    Optimize = False
    Variables.Data = {
      0400000001000000140000003A0056005F005400520041004E00530049004400
      030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000022000000040000004900440001000000000016000000520045005000
      4F00520054005F0043004F00440045000100000000000C000000520045004100
      53004F004E000100000000001C0000005400520041004E0053004D004F004400
      45005F0043004F0044004500010000000000220000005400520041004E005300
      4D004F00440045005F0043004F004D004D0045004E0054000100000000001E00
      0000460052004F004D005F00460055004E00440053005F0043004F0044004500
      01000000000024000000460052004F004D005F00460055004E00440053005F00
      43004F004D004D0045004E0054000100000000000E0000005400520041004E00
      530049004400010000000000120000004900540045004D005F00540059005000
      4500010000000000120000004900540045004D005F004D0041004B0045000100
      00000000160000004400450053004300520049005000540049004F004E000100
      0000000030000000500052004500560049004F00550053004C0059005F005200
      4500470049005300540045005200450044005F0054004F000100000000002E00
      0000500052004500530045004E0054004C0059005F0052004500470049005300
      540045005200450044005F0054004F000100000000001E000000450053005400
      49004D0041005400450044005F00560041004C00550045000100000000001600
      00005300540041005400550053005F0043004F00440045000100000000001E00
      00005300540041005400550053005F0043004F004D004D0045004E0054005300
      0100000000001C00000044004900530050004F005300450044005F0056004100
      4C0055004500010000000000120000004900540045004D005F00530049005A00
      45000100000000001A0000004900540045004D005F00530049005A0045005F00
      55004F004D000100000000002C0000004900540045004D005F00520045004700
      49005300540052004100540049004F004E005F00440041005400450001000000
      0000300000004900540045004D005F0052004500470049005300540052004100
      540049004F004E005F004E0055004D0042004500520001000000000034000000
      4900540045004D005F004900440045004E005400490046004900430041005400
      49004F004E005F004E0055004D004200450052000100000000001A0000004900
      540045004D005F0043004F004D004D0045004E00540053000100000000001800
      000043004F004E0054004100430054005F005400590050004500010000000000
      160000004900540045004D0043004F0055004E00540052005900010000000000
      100000004900540045004D004300490054005900010000000000120000004900
      540045004D005300540041005400450001000000000014000000490054004500
      4D004100440052004500530053000100000000000E0000004900540045004D00
      5A00490050000100000000001E0000005300550042004D004900530053004900
      4F004E005F0043004F00440045000100000000002000000045004E0054004900
      540059005F005200450046004500520045004E00430045000100000000001C00
      00004600490055005F005200450046005F004E0055004D004200450052000100
      000000001A00000054004F005F00460055004E00440053005F0043004F004400
      45000100000000002000000054004F005F00460055004E00440053005F004300
      4F004D004D0045004E005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 792
    Top = 88
    object ODS_TransInfoID: TFloatField
      FieldName = 'ID'
    end
    object ODS_TransInfoREPORT_CODE: TWideStringField
      FieldName = 'REPORT_CODE'
      Size = 80
    end
    object ODS_TransInfoREASON: TWideStringField
      FieldName = 'REASON'
      Size = 800
    end
    object ODS_TransInfoTRANSMODE_CODE: TIntegerField
      FieldName = 'TRANSMODE_CODE'
    end
    object ODS_TransInfoTRANSMODE_COMMENT: TWideStringField
      FieldName = 'TRANSMODE_COMMENT'
      Size = 800
    end
    object ODS_TransInfoFROM_FUNDS_CODE: TWideStringField
      FieldName = 'FROM_FUNDS_CODE'
      Size = 32
    end
    object ODS_TransInfoFROM_FUNDS_COMMENT: TWideStringField
      FieldName = 'FROM_FUNDS_COMMENT'
      Size = 800
    end
    object ODS_TransInfoTRANSID: TFloatField
      FieldName = 'TRANSID'
    end
    object ODS_TransInfoITEM_TYPE: TWideStringField
      FieldName = 'ITEM_TYPE'
      Size = 32
    end
    object ODS_TransInfoITEM_MAKE: TWideStringField
      FieldName = 'ITEM_MAKE'
      Size = 480
    end
    object ODS_TransInfoDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 800
    end
    object ODS_TransInfoPREVIOUSLY_REGISTERED_TO: TWideStringField
      FieldName = 'PREVIOUSLY_REGISTERED_TO'
      Size = 480
    end
    object ODS_TransInfoPRESENTLY_REGISTERED_TO: TWideStringField
      FieldName = 'PRESENTLY_REGISTERED_TO'
      Size = 480
    end
    object ODS_TransInfoESTIMATED_VALUE: TFloatField
      FieldName = 'ESTIMATED_VALUE'
    end
    object ODS_TransInfoSTATUS_CODE: TWideStringField
      FieldName = 'STATUS_CODE'
      Size = 32
    end
    object ODS_TransInfoSTATUS_COMMENTS: TWideStringField
      FieldName = 'STATUS_COMMENTS'
      Size = 800
    end
    object ODS_TransInfoDISPOSED_VALUE: TFloatField
      FieldName = 'DISPOSED_VALUE'
    end
    object ODS_TransInfoITEM_SIZE: TFloatField
      FieldName = 'ITEM_SIZE'
    end
    object ODS_TransInfoITEM_SIZE_UOM: TWideStringField
      FieldName = 'ITEM_SIZE_UOM'
      Size = 240
    end
    object ODS_TransInfoITEM_REGISTRATION_DATE: TDateTimeField
      FieldName = 'ITEM_REGISTRATION_DATE'
    end
    object ODS_TransInfoITEM_REGISTRATION_NUMBER: TWideStringField
      FieldName = 'ITEM_REGISTRATION_NUMBER'
      Size = 2000
    end
    object ODS_TransInfoITEM_IDENTIFICATION_NUMBER: TWideStringField
      FieldName = 'ITEM_IDENTIFICATION_NUMBER'
      Size = 1020
    end
    object ODS_TransInfoITEM_COMMENTS: TWideStringField
      FieldName = 'ITEM_COMMENTS'
      Size = 4000
    end
    object ODS_TransInfoCONTACT_TYPE: TWideStringField
      FieldName = 'CONTACT_TYPE'
      Size = 32
    end
    object ODS_TransInfoITEMCOUNTRY: TWideStringField
      FieldName = 'ITEMCOUNTRY'
      Size = 32
    end
    object ODS_TransInfoITEMCITY: TWideStringField
      FieldName = 'ITEMCITY'
      Size = 120
    end
    object ODS_TransInfoITEMSTATE: TWideStringField
      FieldName = 'ITEMSTATE'
      Size = 200
    end
    object ODS_TransInfoITEMADRESS: TWideStringField
      FieldName = 'ITEMADRESS'
      Size = 320
    end
    object ODS_TransInfoITEMZIP: TWideStringField
      FieldName = 'ITEMZIP'
      Size = 40
    end
    object ODS_TransInfoSUBMISSION_CODE: TWideStringField
      FieldName = 'SUBMISSION_CODE'
      Size = 16
    end
    object ODS_TransInfoENTITY_REFERENCE: TWideStringField
      FieldName = 'ENTITY_REFERENCE'
      Size = 1020
    end
    object ODS_TransInfoFIU_REF_NUMBER: TWideStringField
      FieldName = 'FIU_REF_NUMBER'
      Size = 1020
    end
    object ODS_TransInfoTO_FUNDS_CODE: TWideStringField
      FieldName = 'TO_FUNDS_CODE'
      Size = 16
    end
    object ODS_TransInfoTO_FUNDS_COMMENT: TWideStringField
      FieldName = 'TO_FUNDS_COMMENT'
      Size = 800
    end
  end
end
