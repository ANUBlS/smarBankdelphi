object dmRepPlan_Rest: TdmRepPlan_Rest
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 269
  Top = 145
  Height = 480
  Width = 696
  object ODFValute: TOracleDataSet
    SQL.Strings = (
      'select * from sb_avalute')
    Session = CMDataModule.CMSession
    Left = 24
    Top = 16
  end
  object Valute: TDataSource
    DataSet = ODFValute
    Left = 56
    Top = 16
  end
  object ODFReserves: TOracleDataSet
    SQL.Strings = (
      
        'select id,code,percent,description, percent||'#39'% - '#39'||description' +
        ' fulldesc from cm_reserves')
    QBEDefinition.QBEFieldDefs = {
      040000000500000002000000494401000000000004000000434F444501000000
      00000700000050455243454E540100000000000B000000444553435249505449
      4F4E0100000000000800000046554C4C44455343010000000000}
    Session = CMDataModule.CMSession
    Left = 24
    Top = 72
  end
  object Reserves: TDataSource
    DataSet = ODFReserves
    Left = 56
    Top = 72
  end
  object ODFPersons: TOracleDataSet
    SQL.Strings = (
      'select * from cm_persons')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000040000004E414D4501000000
      00000A00000044455343524950494F4E010000000000}
    Session = CMDataModule.CMSession
    Left = 24
    Top = 118
  end
  object Persons: TDataSource
    DataSet = ODFPersons
    Left = 56
    Top = 118
  end
  object ODFPledges: TOracleDataSet
    SQL.Strings = (
      'select * from cm_pledges')
    Session = CMDataModule.CMSession
    Left = 24
    Top = 174
  end
  object Pledges: TDataSource
    DataSet = ODFPledges
    Left = 56
    Top = 174
  end
  object ODFCategories: TOracleDataSet
    SQL.Strings = (
      'select * from cm_categories')
    QBEDefinition.QBEFieldDefs = {
      040000000400000002000000494401000000000006000000504552534F4E0100
      0000000004000000434F44450100000000000B0000004445534352495054494F
      4E010000000000}
    Session = CMDataModule.CMSession
    Left = 16
    Top = 270
  end
  object Categories: TDataSource
    DataSet = ODFCategories
    Left = 48
    Top = 270
  end
  object ODFBranch: TOracleDataSet
    SQL.Strings = (
      'select * from sb_filial')
    Session = CMDataModule.CMSession
    Left = 16
    Top = 224
  end
  object Branch: TDataSource
    DataSet = ODFBranch
    Left = 48
    Top = 224
  end
  object DueReserve: TDataSource
    DataSet = ODFReserves
    Left = 336
    Top = 88
  end
  object ODFCustomers: TOracleDataSet
    SQL.Strings = (
      'select * from sb_customers')
    Session = CMDataModule.CMSession
    Left = 8
    Top = 318
  end
  object Customers: TDataSource
    DataSet = ODFCustomers
    Left = 48
    Top = 318
  end
  object ODFCrdTypes: TOracleDataSet
    SQL.Strings = (
      'select * from cm_credittypes')
    QBEDefinition.QBEFieldDefs = {
      04000000060000000200000049440100000000000F00000052454E455741424C
      4553544154555301000000000005000000495459504501000000000006000000
      49434C4153530100000000000B0000004445534352495054494F4E0100000000
      00080000004341524454595045010000000000}
    Session = CMDataModule.CMSession
    Left = 140
    Top = 134
  end
  object CrdType: TDataSource
    DataSet = ODFCrdTypes
    Left = 172
    Top = 134
  end
  object ODFUsers: TOracleDataSet
    SQL.Strings = (
      'select * from sb_user$')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000040000004E414D4501000000
      0000050000004354494D45010000000000}
    Session = CMDataModule.CMSession
    Left = 148
    Top = 70
  end
  object Users: TDataSource
    DataSet = ODFUsers
    Left = 224
    Top = 78
  end
  object ODFUsrGroup: TOracleDataSet
    SQL.Strings = (
      'select * from cm_usergroups')
    QBEDefinition.QBEFieldDefs = {
      04000000030000000200000049440100000000000800000042414E4B5F4B4F44
      0100000000000B0000004445534352495054494F4E010000000000}
    Session = CMDataModule.CMSession
    Left = 140
    Top = 8
  end
  object UsrGroup: TDataSource
    DataSet = ODFUsrGroup
    Left = 240
    Top = 8
  end
  object R: TOracleDataSet
    SQL.Strings = (
      'select   '
      '     p.numberofcredit,'
      '     h.rest,'
      '     h.interestrest,'
      '     cm_utils.Get_creditPlanPrincipal(p.id,:dat)+'
      '     cm_utils.Get_creditPlaninterest(p.id,:dat) as annutyamt,'
      
        '     cm_utils.get_PlanRest(p.id,:dat) as planrest,cm_utils.get_l' +
        'astPaymentDate(p.id) as lastdat,'
      '     cm_utils.get_PlanRest(p.id,:dat) - h.rest as difrest,'
      #9' ugr.description '
      'from cm_portfolio p,'
      '     cm_history h,'
      '     cm_usergroups ugr'
      'where'
      '    p.id = h.creditid and'
      '    h.hdate = :dat and'
      '    p.usrgroup = ugr.id'
      '    '
      '    ')
    Variables.Data = {0300000001000000040000003A4441540C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000E0000004E554D4245524F46435245444954010000000000
      04000000524553540100000000000C000000494E544552455354524553540100
      0000000009000000414E4E555459414D5401000000000008000000504C414E52
      45535401000000000007000000444946524553540100000000000B0000004445
      534352495054494F4E010000000000070000004C415354444154010000000000}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 136
    Top = 184
    object RDESCRIPTION: TStringField
      DisplayLabel = 'МКТ'
      FieldName = 'DESCRIPTION'
      Size = 255
    end
    object RNUMBEROFCREDIT: TStringField
      DisplayLabel = 'Мцгавилянин №'
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object RREST: TFloatField
      DisplayLabel = 'Галыг'
      FieldName = 'REST'
      Required = True
    end
    object RINTERESTREST: TFloatField
      DisplayLabel = '% Галыг'
      FieldName = 'INTERESTREST'
      Required = True
    end
    object RANNUTYAMT: TFloatField
      DisplayLabel = 'Аннуитет мябляь'
      FieldName = 'ANNUTYAMT'
    end
    object RPLANREST: TFloatField
      DisplayLabel = 'План Галыг'
      FieldName = 'PLANREST'
    end
    object RDIFREST: TFloatField
      DisplayLabel = 'Фярг'
      FieldName = 'DIFREST'
    end
    object RLASTDAT: TDateTimeField
      DisplayLabel = 'Сон юдямя тарихи'
      FieldName = 'LASTDAT'
    end
  end
end
