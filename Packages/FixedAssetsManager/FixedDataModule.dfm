object DataModuleFixed: TDataModuleFixed
  OldCreateOrder = False
  Height = 605
  Width = 725
  object DFixed: TDataSource
    DataSet = ODSFixed
    Left = 108
    Top = 32
  end
  object ODSFixed: TOracleDataSet
    SQL.Strings = (
      'select * from wr_fixed')
    Optimize = False
    Left = 31
    Top = 32
  end
end
