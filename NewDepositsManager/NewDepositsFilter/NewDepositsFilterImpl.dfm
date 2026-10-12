object dmFilter: TdmFilter
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 696
  object Valutes: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name from avalute')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C000000560041004C005500540045000100000000001200
      0000560041004C0055005F004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 88
    object ValutesVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object ValutesVALU_NAME: TWideStringField
      FieldName = 'VALU_NAME'
      Size = 400
    end
  end
  object Filials: TOracleDataSet
    SQL.Strings = (
      'select id,name from filial')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 144
    object FilialsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FilialsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 360
    end
  end
  object Categories: TOracleDataSet
    SQL.Strings = (
      'select id,category from sbcm_categories')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000002000000040000004900440001000000000010000000430041005400
      450047004F0052005900010000000000}
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 208
    object CategoriesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CategoriesCATEGORY: TWideStringField
      FieldName = 'CATEGORY'
      Size = 512
    end
  end
  object DepositTypes: TOracleDataSet
    SQL.Strings = (
      'select id,type from sbcm_deposit_types')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000002000000040000004900440001000000000008000000540059005000
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 272
    object DepositTypesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DepositTypesTYPE: TWideStringField
      FieldName = 'TYPE'
      Size = 2000
    end
  end
  object DepositTypesDatSrc: TDataSource
    DataSet = DepositTypes
    Left = 128
    Top = 272
  end
  object CategoriesDatSrc: TDataSource
    DataSet = Categories
    Left = 128
    Top = 208
  end
  object FilialsDatSrc: TDataSource
    DataSet = Filials
    Left = 120
    Top = 144
  end
  object ValutesDatSrc: TDataSource
    DataSet = Valutes
    Left = 112
    Top = 88
  end
  object Customers: TOracleDataSet
    SQL.Strings = (
      'select id,name from customers'
      'where id in (select customerid from sbcm_contracts'
      'where type# = 3) ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 88
    object CustomersID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object CustomersNAME: TWideStringField
      FieldName = 'NAME'
      Size = 360
    end
  end
  object Persons: TOracleDataSet
    SQL.Strings = (
      'select id,name from sbcm_persons')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 216
    Top = 144
    object PersonsID: TFloatField
      FieldName = 'ID'
    end
    object PersonsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 200
    end
  end
  object PersonsDatSrc: TDataSource
    DataSet = Persons
    Left = 288
    Top = 144
  end
  object CustomersDatSrc: TDataSource
    DataSet = Customers
    Left = 280
    Top = 88
  end
  object usersDatSrc: TDataSource
    DataSet = users
    Left = 224
    Top = 216
  end
  object users: TOracleDataSet
    SQL.Strings = (
      'select id,name from user$'
      'where id in (select sid# from sbcm_contracts group by sid# )'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 296
    Top = 216
    object usersID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object usersNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
  end
end
