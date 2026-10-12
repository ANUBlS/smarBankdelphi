object ResevesDatMod: TResevesDatMod
  OldCreateOrder = False
  Left = 784
  Top = 421
  Height = 480
  Width = 696
  object CM_RESERVE_COUNT_NEW: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CM_RESERVE_COUNT_NEW'
    Cursor = crSQLWait
    Left = 96
    Top = 40
  end
end
