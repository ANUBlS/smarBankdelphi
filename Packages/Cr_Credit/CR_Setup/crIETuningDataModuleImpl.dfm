object IETuningDataMod: TIETuningDataMod
  OldCreateOrder = False
  Height = 480
  Width = 696
  object LinkValuesData: TOracleDataSet
    SQL.Strings = (
      'SELECT l.RowID,'
      '       l.linkid, '
      '       l.branchid, '
      '       l.currencyid, '
      '       l.accountid'
      '  FROM cr_link_values l'
      '  where   l.linkid=:linkid'
      'ORDER BY l.branchid,l.currencyid'
      ' ')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A004C0049004E004B0049004400030000000400
      00003D00000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000040000000C0000004C0049004E004B00490044000100000000001000
      00004200520041004E0043004800490044000100000000001400000043005500
      5200520045004E00430059004900440001000000000012000000410043004300
      4F0055004E00540049004400010000000000}
    Cursor = crSQLWait
    Master = LinksData
    MasterFields = 'ID'
    DetailFields = 'LinkID'
    Session = sboapiDataModule.SBSession
    Left = 298
    Top = 66
    object LinkValuesDataLINKID: TFloatField
      FieldName = 'LINKID'
      Required = True
    end
    object LinkValuesDataBRANCHID: TFloatField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      FieldName = 'BRANCHID'
      Required = True
    end
    object LinkValuesDataCURRENCYID: TFloatField
      DisplayLabel = '$'
      FieldName = 'CURRENCYID'
      Required = True
    end
    object LinkValuesDataACCOUNTID: TFloatField
      DisplayLabel = #1065#1077#1089#1072#1073
      FieldName = 'ACCOUNTID'
      Required = True
    end
    object LinkValuesDataBrachName: TWideStringField
      FieldKind = fkLookup
      FieldName = 'BRANCHNAME'
      LookupDataSet = BranchList
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'BRANCHID'
      Size = 255
      Lookup = True
    end
    object LinkValuesDataCURRENCYNAME: TWideStringField
      FieldKind = fkLookup
      FieldName = 'CURRENCYNAME'
      LookupDataSet = CurrencyList
      LookupKeyFields = 'VALUTE'
      LookupResultField = 'VAL_NAME'
      KeyFields = 'CURRENCYID'
      Size = 8
      Lookup = True
    end
    object LinkValuesDataAccountNumber: TWideStringField
      FieldKind = fkLookup
      FieldName = 'AccountNumber'
      LookupDataSet = IEAccountList
      LookupKeyFields = 'ID'
      LookupResultField = 'ACC_NO'
      KeyFields = 'ACCOUNTID'
      Lookup = True
    end
  end
  object DataSrcLinkValues: TDataSource
    DataSet = LinkValuesData
    Left = 306
    Top = 138
  end
  object DataSrcLinks: TDataSource
    DataSet = LinksData
    Left = 202
    Top = 138
  end
  object DataSrcCategories: TDataSource
    DataSet = CategoriesData
    Left = 106
    Top = 138
  end
  object CategoriesData: TOracleDataSet
    SQL.Strings = (
      'SELECT id,description'
      '  FROM cr_categories')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000002000000040000004900440001000000000016000000440045005300
      4300520049005000540049004F004E00010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 98
    Top = 66
    object CategoriesDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CategoriesDataDESCRIPTION: TWideStringField
      DisplayLabel = 'M'#252#351't'#601'ri kateqorias'#305
      FieldName = 'DESCRIPTION'
      Size = 128
    end
  end
  object LinksData: TOracleDataSet
    SQL.Strings = (
      'SELECT id, categoryid, description'
      '   FROM cr_links'
      ' WHERE  categoryid=:categoryid'
      'ORDER BY id')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A00430041005400450047004F00520059004900
      44000300000004000000DE00000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000003000000040000004900440001000000000014000000430041005400
      450047004F005200590049004400010000000000160000004400450053004300
      520049005000540049004F004E00010000000000}
    Cursor = crSQLWait
    Master = CategoriesData
    MasterFields = 'ID'
    DetailFields = 'categoryid'
    Session = sboapiDataModule.SBSession
    Left = 194
    Top = 66
    object LinksDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object LinksDataCATEGORYID: TFloatField
      FieldName = 'CATEGORYID'
      Required = True
    end
    object LinksDataDESCRIPTION: TWideStringField
      DisplayLabel = #1065#1077#1089#1072#1073' '#1075#1088#1091#1087#1091
      FieldName = 'DESCRIPTION'
      Size = 128
    end
  end
  object IEAccountList: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   id,Acc_No,Val_Acc,Name'
      '  FROM CR_SB_ALL_ACCOUNTS'
      ' WHERE (bal_cn1 IN (SELECT accountnumber'
      '                           FROM cr_aginfo'
      '                          WHERE groupid = (SELECT g.id'
      
        '                                             FROM cr_accountgrou' +
        'ps g'
      
        '                                            WHERE g.iname = '#39'Inc' +
        'ExpAccounts'#39')))'
      'and (Close_Dat is Null)'
      'ORDER BY ACC_NO')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000400000004000000490044000100000000000C000000410043004300
      5F004E004F000100000000000E000000560041004C005F004100430043000100
      00000000080000004E0041004D004500010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 112
    Top = 264
    object IEAccountListID: TFloatField
      FieldName = 'ID'
    end
    object IEAccountListACC_NO: TWideStringField
      FieldName = 'ACC_NO'
    end
    object IEAccountListNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
    object IEAccountListVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
  end
  object BranchList: TOracleDataSet
    SQL.Strings = (
      'SELECT id, name'
      '  FROM filial')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 368
    Top = 264
    object BranchListID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object BranchListNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object DataSrcIEAccountList: TDataSource
    DataSet = IEAccountList
    Left = 112
    Top = 312
  end
  object DataSrcBranchList: TDataSource
    DataSet = BranchList
    Left = 368
    Top = 312
  end
  object CurrencyList: TOracleDataSet
    SQL.Strings = (
      'SELECT VAlute,Val_Name'
      '  FROM AVALUTE')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C000000560041004C005500540045000100000000001000
      0000560041004C005F004E0041004D004500010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 232
    Top = 264
    object CurrencyListVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object CurrencyListVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
  end
  object DataSrcCurrencyList: TDataSource
    DataSet = CurrencyList
    Left = 232
    Top = 312
  end
end
