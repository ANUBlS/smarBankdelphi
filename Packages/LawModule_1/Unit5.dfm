object DataModule5: TDataModule5
  OldCreateOrder = False
  Height = 383
  Width = 817
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select '#39'aa'#39' from dual')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {0500000001000000080000002700410041002700010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 56
    Top = 88
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 104
    Top = 56
  end
end
