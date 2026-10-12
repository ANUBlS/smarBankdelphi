object CrFilterDataModule: TCrFilterDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 582
  Width = 770
  object DSCurrencys: TDataSource
    DataSet = Currencys
    Left = 24
    Top = 384
  end
  object Currencys: TOracleDataSet
    SQL.Strings = (
      'SELECT valute,  valu_name'
      '  FROM AVALUTE'
      'ORDER BY VALUTE')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 432
  end
  object DSBranches: TDataSource
    DataSet = Branches
    Left = 104
    Top = 320
  end
  object Branches: TOracleDataSet
    SQL.Strings = (
      'SELECT id, name'
      '  FROM filial')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 104
    Top = 272
  end
  object DSPledges: TDataSource
    DataSet = Pledges
    Left = 24
    Top = 192
  end
  object Pledges: TOracleDataSet
    SQL.Strings = (
      'SELECT id,  description'
      '  FROM cr_pledges')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 144
  end
  object DSUserGroups: TDataSource
    DataSet = UserGroups
    Left = 24
    Top = 320
  end
  object UserGroups: TOracleDataSet
    SQL.Strings = (
      'SELECT id, description'
      '  FROM cr_usergroups')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 272
  end
  object DSPReserves: TDataSource
    DataSet = PReserves
    Left = 104
    Top = 24
  end
  object PReserves: TOracleDataSet
    SQL.Strings = (
      'SELECT id, percent, description'
      '  FROM cr_reserves'
      'ORDER BY percent')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    OnCalcFields = PReservesCalcFields
    Left = 104
    Top = 72
    object PReservesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object PReservesPERCENT: TFloatField
      FieldName = 'PERCENT'
      Required = True
    end
    object PReservesDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Required = True
      Size = 64
    end
    object PReservesFULLDESC: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'FULLDESC'
      Size = 255
      Calculated = True
    end
  end
  object DSSReserves: TDataSource
    DataSet = SReserves
    Left = 24
    Top = 24
  end
  object SReserves: TOracleDataSet
    SQL.Strings = (
      'SELECT id, percent, description'
      '  FROM cr_reserves'
      'ORDER BY percent')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    OnCalcFields = PReservesCalcFields
    Left = 24
    Top = 72
    object SReservesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object SReservesPERCENT: TFloatField
      FieldName = 'PERCENT'
      Required = True
    end
    object SReservesDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Required = True
      Size = 64
    end
    object SReservesFULLDESC: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'FULLDESC'
      Size = 255
      Calculated = True
    end
  end
  object DSUsers: TDataSource
    DataSet = Users
    Left = 104
    Top = 192
  end
  object Users: TOracleDataSet
    SQL.Strings = (
      'SELECT id, name'
      '  FROM user$'
      'ORDER BY NAME')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 104
    Top = 144
  end
  object DSPersons: TDataSource
    DataSet = Persons
    Left = 200
    Top = 376
  end
  object Persons: TOracleDataSet
    SQL.Strings = (
      'SELECT id,  descripion'
      '  FROM cr_persons')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 200
    Top = 424
  end
  object DSCategories: TDataSource
    DataSet = Categories
    Left = 312
    Top = 72
  end
  object Categories: TOracleDataSet
    SQL.Strings = (
      'SELECT id, description'
      '  FROM cr_categories')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 312
    Top = 24
  end
  object DSCreditTypes: TDataSource
    DataSet = CreditTypes
    Left = 312
    Top = 136
  end
  object CreditTypes: TOracleDataSet
    SQL.Strings = (
      'SELECT id,  description'
      '  FROM cr_credittypes')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 312
    Top = 184
  end
  object DSCustomers: TDataSource
    DataSet = Customers
    Left = 312
    Top = 312
  end
  object Customers: TOracleDataSet
    SQL.Strings = (
      'SELECT id,  name'
      '  FROM CUSTOMERS'
      'ORDER BY NAME')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 312
    Top = 256
  end
end
