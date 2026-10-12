object CMDataModule: TCMDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 108
  Height = 479
  Width = 698
  object CMSession: TOracleSession
    LogonUsername = 'CreditsMgr'
    LogonPassword = 's6c457f61'
    LogonDatabase = 'SB'
    Connected = True
    Left = 40
    Top = 40
  end
  object CMLogon: TOracleLogon
    Session = CMSession
    Retries = 3
    Options = [ldDatabase, ldDatabaseList]
    Left = 40
    Top = 96
  end
  object DSBankDate: TOracleDataSet
    SQL.Strings = (
      'select TEK_DAT , PRED_DAT '
      '  from SB_SYSDAT')
    Session = CMSession
    Left = 144
    Top = 32
  end
  object Branch: TOracleDataSet
    SQL.Strings = (
      'select'
      '   KOD_FIL'
      'from SB_BANKINFO')
    Session = CMSession
    Left = 144
    Top = 96
  end
end
