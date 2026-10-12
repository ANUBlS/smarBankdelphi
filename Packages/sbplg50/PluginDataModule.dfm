object PlugDataModule: TPlugDataModule
  OldCreateOrder = False
  Left = 192
  Top = 103
  Height = 480
  Width = 696
  object SBAca: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBACa'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 24
    Top = 16
  end
end
