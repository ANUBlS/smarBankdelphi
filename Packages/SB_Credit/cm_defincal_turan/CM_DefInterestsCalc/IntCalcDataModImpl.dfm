object DefineCalcDatMod: TDefineCalcDatMod
  OldCreateOrder = False
  Height = 434
  Width = 613
  object CM_CREDITS: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CM_CREDIT'
    Left = 56
    Top = 40
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      
        'select  nvl(to_char(stopcalcdate),0) stopcalcdate from cm_curr_s' +
        'tate where creditid=:creditid')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00430052004500440049005400490044000300
      00000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 40
  end
end
