object DataModuleAIF: TDataModuleAIF
  OldCreateOrder = False
  Height = 490
  Width = 679
  object DSAIFPAYMENTS: TDataSource
    DataSet = AIFPAYMENTS
    Left = 120
    Top = 32
  end
  object AIFPAYMENTS: TOracleDataSet
    SQL.Strings = (
      'select '
      '   *'
      'from AIFPAYMENTSVIEW'
      'order by :title')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A005400490054004C0045000100000003000000
      69640000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001C00000004000000490044000100000000000E000000500041005900
      44004100540045000100000000000E000000420041004E004B0049004E005400
      0100000000000E00000046004F004E00440049004E0054000100000000000800
      00004F00440043005200010000000000120000004F004400420041004E004B00
      49004E005400010000000000120000004F00440046004F004E00440049004E00
      5400010000000000180000004F004400500045004E0041004C00540059004900
      4E0054000100000000000E000000500041005900540059005000450001000000
      00000A0000004D005000410059004D00010000000000100000004D0041005400
      550052004900540059000100000000000A00000043005200420041004C000100
      000000000A000000480044004100540045000100000000000C00000053005400
      4100540055005300010000000000120000005000410059004D0045004E005400
      49004400010000000000100000004200520041004E0043004800490044000100
      0000000014000000460049004C00490041004C004E0041004D00450001000000
      0000100000004300520045004400490054004900440001000000000010000000
      43004C00490045004E0054004900440001000000000010000000460055004C00
      4C004E0041004D00450001000000000004000000430052000100000000000C00
      00005500530045005200490044000100000000000C0000005000410059005F00
      490044000100000000001E000000430052004500440049005400500041005900
      4D0045004E00540049004400010000000000120000004E004500580054004D00
      5000410059004D00010000000000160000004E0045005800540046004F004E00
      440049004E005400010000000000160000004E00450058005400420041004E00
      4B0049004E0054000100000000001000000055005300450052004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 32
    Top = 32
    object AIFPAYMENTSID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object AIFPAYMENTSCREDITID: TFloatField
      FieldName = 'CREDITID'
    end
    object AIFPAYMENTSCLIENTID: TFloatField
      FieldName = 'CLIENTID'
    end
    object AIFPAYMENTSFULLNAME: TWideStringField
      FieldName = 'FULLNAME'
      Size = 400
    end
    object AIFPAYMENTSPAYDATE: TDateTimeField
      FieldName = 'PAYDATE'
    end
    object AIFPAYMENTSCR: TFloatField
      FieldName = 'CR'
      DisplayFormat = '0.00'
    end
    object AIFPAYMENTSBANKINT: TFloatField
      FieldName = 'BANKINT'
      DisplayFormat = '0.00'
    end
    object AIFPAYMENTSFONDINT: TFloatField
      FieldName = 'FONDINT'
      DisplayFormat = '0.00'
    end
    object AIFPAYMENTSODCR: TFloatField
      FieldName = 'ODCR'
      DisplayFormat = '0.00'
    end
    object AIFPAYMENTSODBANKINT: TFloatField
      FieldName = 'ODBANKINT'
      DisplayFormat = '0.00'
    end
    object AIFPAYMENTSODFONDINT: TFloatField
      FieldName = 'ODFONDINT'
      DisplayFormat = '0.00'
    end
    object AIFPAYMENTSODPENALTYINT: TFloatField
      FieldName = 'ODPENALTYINT'
      DisplayFormat = '0.00'
    end
    object AIFPAYMENTSPAYTYPE: TIntegerField
      FieldName = 'PAYTYPE'
    end
    object AIFPAYMENTSMPAYM: TFloatField
      FieldName = 'MPAYM'
    end
    object AIFPAYMENTSMATURITY: TIntegerField
      FieldName = 'MATURITY'
    end
    object AIFPAYMENTSCRBAL: TFloatField
      FieldName = 'CRBAL'
      DisplayFormat = '0.00'
    end
    object AIFPAYMENTSHDATE: TDateTimeField
      FieldName = 'HDATE'
    end
    object AIFPAYMENTSSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object AIFPAYMENTSPAYMENTID: TFloatField
      FieldName = 'PAYMENTID'
    end
    object AIFPAYMENTSBRANCHID: TIntegerField
      FieldName = 'BRANCHID'
    end
    object AIFPAYMENTSFILIALNAME: TWideStringField
      FieldName = 'FILIALNAME'
      Size = 360
    end
    object AIFPAYMENTSUSERID: TFloatField
      FieldName = 'USERID'
    end
    object AIFPAYMENTSPAY_ID: TFloatField
      FieldName = 'PAY_ID'
    end
    object AIFPAYMENTSNEXTMPAYM: TFloatField
      FieldName = 'NEXTMPAYM'
      DisplayFormat = '0.00'
    end
    object AIFPAYMENTSNEXTBANKINT: TFloatField
      FieldName = 'NEXTBANKINT'
      DisplayFormat = '0.00'
    end
    object AIFPAYMENTSNEXTFONDINT: TFloatField
      FieldName = 'NEXTFONDINT'
      DisplayFormat = '0.00'
    end
    object AIFPAYMENTSUSERNAME: TWideStringField
      FieldName = 'USERNAME'
      Size = 80
    end
  end
  object aif_payments: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'aif_payments'
    ParameterMode = pmNamed
    Left = 224
    Top = 32
  end
  object DEL: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'aif_payments'
    Left = 304
    Top = 32
  end
  object DSAifFieldSearch: TDataSource
    DataSet = AifFieldSearch
    Left = 120
    Top = 88
  end
  object AifFieldSearch: TOracleDataSet
    SQL.Strings = (
      'select * from aifpayments_fields')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000003000000040000004900440001000000000012000000460049004500
      4C0044004E0041004D004500010000000000120000004600490045004C004400
      4400450053004300010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 32
    Top = 88
    object AifFieldSearchID: TFloatField
      FieldName = 'ID'
    end
    object AifFieldSearchFIELDNAME: TWideStringField
      FieldName = 'FIELDNAME'
      Size = 256
    end
    object AifFieldSearchFIELDDESC: TWideStringField
      FieldName = 'FIELDDESC'
      Size = 512
    end
  end
  object AifConfig: TOracleDataSet
    SQL.Strings = (
      'select rowid,a.* from aifpayments_config a')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 232
    Top = 88
  end
  object AifFilial: TOracleDataSet
    SQL.Strings = (
      'select * from filial'
      'order by id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000140000004B004F0044005F00460049004C00490041004C00
      010000000000}
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 240
  end
  object AifUsers: TOracleDataSet
    SQL.Strings = (
      'select id,NAME from user$'
      'where SB_ACA.checkmodaccess_int('#39'AIFPAYMENTS'#39',name)=1'
      'order by name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 168
  end
  object DSAifUsers: TDataSource
    DataSet = AifUsers
    Left = 112
    Top = 168
  end
  object DSAifFilial: TDataSource
    DataSet = AifFilial
    Left = 112
    Top = 240
  end
  object DSAIFADMIN: TDataSource
    DataSet = AIFADMIN
    Left = 120
    Top = 304
  end
  object AIFADMIN: TOracleDataSet
    SQL.Strings = (
      'select * from aif_admin_in '
      'where USER_ID=:USERID')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A00550053004500520049004400030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000040000000E00000055005300450052005F0049004400010000000000
      1200000055005300450052005F004E0041004D00450001000000000012000000
      460049004C00490041004C005F00490044000100000000001600000046004900
      4C00490041004C005F004E0041004D004500010000000000}
    Master = AifUsers
    MasterFields = 'ID'
    DetailFields = 'USERID'
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 304
  end
  object AifDataCheck: TOracleDataSet
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 232
    Top = 144
  end
  object DSAIFPAYMENTSARCHIVE: TDataSource
    DataSet = AIFPAYMENTSARCHIVE
    Left = 584
    Top = 8
  end
  object AIFPAYMENTSARCHIVE: TOracleDataSet
    SQL.Strings = (
      'select '
      '   *'
      'from AIFPAYMENTSVIEWALL where hdate>=:bdate and hdate<=:edate'
      'order by :title')
    Optimize = False
    Variables.Data = {
      04000000030000000C0000003A005400490054004C0045000100000003000000
      696400000000000C0000003A00420044004100540045000C0000000000000000
      0000000C0000003A00450044004100540045000C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001C00000004000000490044000100000000000E000000500041005900
      44004100540045000100000000000E000000420041004E004B0049004E005400
      0100000000000E00000046004F004E00440049004E0054000100000000000800
      00004F00440043005200010000000000120000004F004400420041004E004B00
      49004E005400010000000000120000004F00440046004F004E00440049004E00
      5400010000000000180000004F004400500045004E0041004C00540059004900
      4E0054000100000000000E000000500041005900540059005000450001000000
      00000A0000004D005000410059004D00010000000000100000004D0041005400
      550052004900540059000100000000000A00000043005200420041004C000100
      000000000A000000480044004100540045000100000000000C00000053005400
      4100540055005300010000000000120000005000410059004D0045004E005400
      49004400010000000000100000004200520041004E0043004800490044000100
      0000000014000000460049004C00490041004C004E0041004D00450001000000
      0000100000004300520045004400490054004900440001000000000010000000
      43004C00490045004E0054004900440001000000000010000000460055004C00
      4C004E0041004D00450001000000000004000000430052000100000000000C00
      00005500530045005200490044000100000000000C0000005000410059005F00
      490044000100000000001E000000430052004500440049005400500041005900
      4D0045004E00540049004400010000000000120000004E004500580054004D00
      5000410059004D00010000000000160000004E0045005800540046004F004E00
      440049004E005400010000000000160000004E00450058005400420041004E00
      4B0049004E0054000100000000001000000055005300450052004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 440
    Top = 8
    object FloatField1: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FloatField2: TFloatField
      FieldName = 'CREDITID'
    end
    object FloatField3: TFloatField
      FieldName = 'CLIENTID'
    end
    object WideStringField1: TWideStringField
      DisplayLabel = 'Borcalan'#305'n A.A.S'
      FieldName = 'FULLNAME'
      Size = 400
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'PAYDATE'
    end
    object FloatField4: TFloatField
      FieldName = 'CR'
      DisplayFormat = '0.00'
    end
    object FloatField5: TFloatField
      FieldName = 'BANKINT'
      DisplayFormat = '0.00'
    end
    object FloatField6: TFloatField
      FieldName = 'FONDINT'
      DisplayFormat = '0.00'
    end
    object FloatField7: TFloatField
      FieldName = 'ODCR'
      DisplayFormat = '0.00'
    end
    object FloatField8: TFloatField
      FieldName = 'ODBANKINT'
      DisplayFormat = '0.00'
    end
    object FloatField9: TFloatField
      FieldName = 'ODFONDINT'
      DisplayFormat = '0.00'
    end
    object FloatField10: TFloatField
      FieldName = 'ODPENALTYINT'
      DisplayFormat = '0.00'
    end
    object IntegerField1: TIntegerField
      FieldName = 'PAYTYPE'
    end
    object FloatField11: TFloatField
      FieldName = 'MPAYM'
    end
    object IntegerField2: TIntegerField
      FieldName = 'MATURITY'
    end
    object FloatField12: TFloatField
      FieldName = 'CRBAL'
      DisplayFormat = '0.00'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'HDATE'
    end
    object IntegerField3: TIntegerField
      FieldName = 'STATUS'
    end
    object FloatField13: TFloatField
      FieldName = 'PAYMENTID'
    end
    object IntegerField4: TIntegerField
      FieldName = 'BRANCHID'
    end
    object WideStringField2: TWideStringField
      DisplayLabel = 'Filial'
      FieldName = 'FILIALNAME'
      Size = 360
    end
    object FloatField14: TFloatField
      DisplayLabel = 'T'#601'sdiq ed'#601'n'
      FieldName = 'USERID'
    end
    object FloatField15: TFloatField
      DisplayLabel = 'Qeydiyyat No'
      FieldName = 'PAY_ID'
    end
    object AIFPAYMENTSARCHIVENEXTMPAYM: TFloatField
      FieldName = 'NEXTMPAYM'
      DisplayFormat = '0.00'
    end
    object AIFPAYMENTSARCHIVENEXTFONDINT: TFloatField
      FieldName = 'NEXTFONDINT'
      DisplayFormat = '0.00'
    end
    object AIFPAYMENTSARCHIVENEXTBANKINT: TFloatField
      FieldName = 'NEXTBANKINT'
      DisplayFormat = '0.00'
    end
    object AIFPAYMENTSARCHIVEUSERNAME: TWideStringField
      FieldName = 'USERNAME'
      Size = 80
    end
  end
  object DSAifConfig: TDataSource
    DataSet = AifConfig
    Left = 312
    Top = 88
  end
  object sb_aca: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'sb_aca'
    Left = 416
    Top = 64
  end
end
