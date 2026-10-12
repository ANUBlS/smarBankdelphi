object CRCommonDataModule: TCRCommonDataModule
  OldCreateOrder = False
  Height = 480
  Width = 696
  object ReferencesData: TOracleDataSet
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 72
    Top = 40
  end
end
