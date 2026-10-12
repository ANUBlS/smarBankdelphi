object DataModuleRefer: TDataModuleRefer
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 378
  Width = 461
  object ReferPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SBCM_Stored_Programs'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 32
    Top = 8
  end
end
