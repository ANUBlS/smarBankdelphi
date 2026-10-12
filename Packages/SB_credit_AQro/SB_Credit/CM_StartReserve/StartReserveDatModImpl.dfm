object SRDatMod: TSRDatMod
  OldCreateOrder = False
  Left = 195
  Top = 119
  Height = 480
  Width = 696
  object CM_RESERVE_REFRESH: TOraclePackage
    Session = CMDataModule.CMSession
    Debug = False
    PackageName = 'CM_RESERVE_REFRESH'
    ParameterMode = pmNamed
    Cursor = crSQLWait
    Optimize = True
    Left = 64
    Top = 56
  end
end
