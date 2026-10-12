object RIDataMod: TRIDataMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 342
  Width = 364
  object ODSBanks: TOracleDataSet
    SQL.Strings = (
      'select * from cm_usergroups')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 32
  end
  object Banks: TDataSource
    DataSet = ODSBanks
    Left = 40
    Top = 96
  end
  object ODSCredits: TOracleDataSet
    SQL.Strings = (
      
        'select c.id, b.name, c.usrgroup from cm_active_credits c, cm_boo' +
        'rowerinfo b'
      'where b.creditid=c.id and c.usrgroup=:usrgroup'
      'order by c.id')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00550053005200470052004F00550050000300
      00000000000000000000}
    Master = ODSBanks
    MasterFields = 'id'
    DetailFields = 'usrgroup'
    Session = sboapiDataModule.SBSession
    Left = 130
    Top = 32
  end
  object Credits: TDataSource
    DataSet = ODSCredits
    Left = 128
    Top = 96
  end
  object ODSRep: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT r.*  FROM cm_ip_reestrinfo r'
      ''
      'order by boorower'
      ''
      '')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 224
    Top = 65
  end
  object ODSNextVal: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      
        'SELECT lastreestrnum,u.bank_kod kod_bank, contrdate FROM cm_bank' +
        'settings b, cm_usergroups u'
      'where u.id=b.bankid and bankid=:bankid'
      ''
      ''
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A00420041004E004B0049004400030000000000
      000000000000}
    Session = sboapiDataModule.SBSession
    Left = 192
    Top = 232
  end
  object ODSUpdNextVal: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'update cm_banksettings set lastreestrnum=lastreestrnum+1'
      'where bankid=:bankid'
      ''
      ''
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A00420041004E004B0049004400030000000000
      000000000000}
    Session = sboapiDataModule.SBSession
    Left = 192
    Top = 280
  end
end
