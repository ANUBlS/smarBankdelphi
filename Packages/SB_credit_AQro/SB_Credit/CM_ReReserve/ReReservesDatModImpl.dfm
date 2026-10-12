object ReReservesDatMod: TReReservesDatMod
  OldCreateOrder = False
  Height = 0
  Width = 0
  object cm_reserve_contr: TOraclePackage
    Session = CMDataModule.CMSession
    Debug = False
    PackageName = 'cm_reserve_contr'
    ParameterMode = pmPositional
    Cursor = crSQLWait
    Optimize = True
    Left = 48
    Top = 72
  end
end
