object ResevesDatMod: TResevesDatMod
  OldCreateOrder = False
  Height = 480
  Width = 696
  object CR_RESERVE_COUNT_NEW: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CR_RESERVE_COUNT_NEW'
    Cursor = crSQLWait
    Left = 96
    Top = 40
  end
end
