object PortfelDataModule: TPortfelDataModule
  OldCreateOrder = False
  Height = 505
  Width = 800
  object CurrencysDataSet: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name'
      'from sb_avalute')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 35
    Top = 8
  end
  object CurrencysDataSource: TDataSource
    DataSet = CurrencysDataSet
    Left = 146
    Top = 11
  end
  object PersonsDataSet: TOracleDataSet
    SQL.Strings = (
      'select id ,descripion'
      'from cm_persons')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 35
    Top = 80
  end
  object PersonsDataSource: TDataSource
    DataSet = PersonsDataSet
    Left = 144
    Top = 85
  end
  object UsersDataSet: TOracleDataSet
    SQL.Strings = (
      'select id, name'
      'from SB_user$')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 35
    Top = 168
  end
  object UsersDataSource: TDataSource
    DataSet = UsersDataSet
    Left = 143
    Top = 168
  end
  object FilialDataSet: TOracleDataSet
    SQL.Strings = (
      'select id,name'
      'from sb_filial')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 280
    Top = 6
  end
  object FilialDataSource: TDataSource
    DataSet = FilialDataSet
    Left = 400
    Top = 8
  end
  object CategoriesDataSet: TOracleDataSet
    SQL.Strings = (
      'select id,description'
      'from cm_categories')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 280
    Top = 62
  end
  object CategoriesDataSource: TDataSource
    DataSet = CategoriesDataSet
    Left = 408
    Top = 63
  end
  object CustomersDataSet: TOracleDataSet
    SQL.Strings = (
      ''
      'SELECT DISTINCT c.id boorowerid, c.NAME boorowername'
      '           FROM cm_sb_customers c'
      '          WHERE EXISTS ( SELECT p.boorowerid'
      '                           FROM cm_portfolio p'
      '                          WHERE p.boorowerid = c.id)'
      ' ')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 284
    Top = 118
  end
  object CustomersDataSource: TDataSource
    DataSet = CustomersDataSet
    Left = 408
    Top = 122
  end
  object UserGroupsDataSet: TOracleDataSet
    SQL.Strings = (
      'select id,description'
      'from cm_usergroups')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 288
    Top = 172
  end
  object CreditTypeDataSet: TOracleDataSet
    SQL.Strings = (
      'select id,description '
      'from cm_credittypes')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 33
    Top = 246
  end
  object CreditTypeDataSource: TDataSource
    DataSet = CreditTypeDataSet
    Left = 140
    Top = 246
  end
  object UserGroupsDataSource: TDataSource
    DataSet = UserGroupsDataSet
    Left = 416
    Top = 179
  end
  object PledgesdataSource: TDataSource
    DataSet = PledgesdataSet
    Left = 416
    Top = 240
  end
  object PledgesdataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT id,  description'
      '  FROM cm_pledges')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 288
    Top = 248
  end
  object DSPReservesDatasource: TDataSource
    DataSet = PReservesDataset
    Left = 143
    Top = 309
  end
  object PReservesDataset: TOracleDataSet
    SQL.Strings = (
      'SELECT id, percent, description'
      '  FROM cm_reserves'
      'ORDER BY percent')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 33
    Top = 309
    object PReservesDatasetID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object PReservesDatasetPERCENT: TFloatField
      FieldName = 'PERCENT'
      Required = True
    end
    object PReservesDatasetDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Required = True
      Size = 64
    end
    object PReservesDatasetFULLDESC: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'FULLDESC'
      Size = 255
      Calculated = True
    end
  end
  object DSSReservesDataSource: TDataSource
    DataSet = SReservesDataSet
    Left = 416
    Top = 312
  end
  object SReservesDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT id, percent, description'
      '  FROM cm_reserves'
      'ORDER BY percent')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000000E000000500045005200
      430045004E005400010000000000160000004400450053004300520049005000
      540049004F004E00010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 288
    Top = 312
    object SReservesDataSetID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object SReservesDataSetPERCENT: TFloatField
      FieldName = 'PERCENT'
      Required = True
    end
    object SReservesDataSetFULLDESC: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'FULLDESC'
      Size = 255
      Calculated = True
    end
    object SReservesDataSetDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 64
    end
  end
  object MainDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT p.currency, p.boorowerid, '
      '       p.usrgroup, p.branchid, p.usid,'
      '       p.customertype, p.credittype, p.personaltype,h.rest,'
      
        '       h.interestrest, h.duerest, h.dueinterestrest, h.reserveid' +
        ', h.duereserveid,'
      '       h.obligation, g.pledgeid,'
      '       av.val_name, c.name'
      '  FROM cm_portfolio p,'
      '       cm_curr_state h,'
      '       SB_AVALUTE av,'
      '       CM_GUARANTEE g,'
      '       cm_sb_customers c'
      'where (p.id = h.creditid) and'
      '      (p.currency = av.valute) and'
      '      (p.id = g.creditid) and'
      '      (c.id = p.boorowerid) '
      '            '
      '')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 360
    object MainDataSetCURRENCY: TFloatField
      FieldName = 'CURRENCY'
      Required = True
    end
    object MainDataSetBOOROWERID: TFloatField
      FieldName = 'BOOROWERID'
      Required = True
    end
    object MainDataSetUSRGROUP: TFloatField
      FieldName = 'USRGROUP'
      Required = True
    end
    object MainDataSetBRANCHID: TFloatField
      FieldName = 'BRANCHID'
      Required = True
    end
    object MainDataSetUSID: TFloatField
      FieldName = 'USID'
      Required = True
    end
    object MainDataSetCUSTOMERTYPE: TFloatField
      FieldName = 'CUSTOMERTYPE'
      Required = True
    end
    object MainDataSetCREDITTYPE: TFloatField
      FieldName = 'CREDITTYPE'
      Required = True
    end
    object MainDataSetPERSONALTYPE: TFloatField
      FieldName = 'PERSONALTYPE'
      Required = True
    end
    object MainDataSetREST: TFloatField
      FieldName = 'REST'
      Required = True
    end
    object MainDataSetINTERESTREST: TFloatField
      FieldName = 'INTERESTREST'
      Required = True
    end
    object MainDataSetDUEREST: TFloatField
      FieldName = 'DUEREST'
      Required = True
    end
    object MainDataSetDUEINTERESTREST: TFloatField
      FieldName = 'DUEINTERESTREST'
      Required = True
    end
    object MainDataSetRESERVEID: TFloatField
      FieldName = 'RESERVEID'
      Required = True
    end
    object MainDataSetDUERESERVEID: TFloatField
      FieldName = 'DUERESERVEID'
    end
    object MainDataSetOBLIGATION: TFloatField
      FieldName = 'OBLIGATION'
      Required = True
    end
    object MainDataSetPLEDGEID: TFloatField
      FieldName = 'PLEDGEID'
      Required = True
    end
    object MainDataSetVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object MainDataSetNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object MainDataSource: TDataSource
    DataSet = MainDataSet
    Left = 143
    Top = 360
  end
  object DateDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT p.currency, p.boorowerid, '
      '       p.usrgroup, p.branchid, p.usid,'
      '       p.customertype, p.credittype, p.personaltype,h.rest,'
      
        '       h.interestrest, h.duerest, h.dueinterestrest, h.reserveid' +
        ', h.duereserveid,'
      '       h.obligation, g.pledgeid,'
      '       av.val_name, c.name'
      '  FROM cm_portfolio p,'
      '       cm_history h,'
      '       SB_AVALUTE av,'
      '       CM_GUARANTEE g,'
      '       cm_sb_customers c'
      'where (p.id = h.creditid) and'
      '      (p.currency = av.valute) and'
      '      (p.id = g.creditid) and'
      '      (c.id = p.boorowerid) and'
      '     (h.hdate =:Hdate)'
      '            ')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00480044004100540045000C00000000000000
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 288
    Top = 360
  end
  object DateDataSource: TDataSource
    DataSet = DateDataSet
    Left = 416
    Top = 368
  end
  object OperkursDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT  ostat'
      '  FROM SB_OPERKURS'
      'where (dat =:Ddate)and'
      '      (val_kod = 0)'
      ' ')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00440044004100540045000C00000000000000
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 520
    Top = 16
  end
  object OperkursDataSource: TDataSource
    DataSet = OperkursDataSet
    Left = 523
    Top = 72
  end
end
