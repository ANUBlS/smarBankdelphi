object dmFinishPeriodCredits: TdmFinishPeriodCredits
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 248
  Top = 127
  Height = 480
  Width = 696
  object valutes: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select valute,valu_name from sb_avalute')
    Session = CMDataModule.CMSession
    Left = 32
    Top = 8
    object valutesVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object valutesVALU_NAME: TStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
  end
  object valutesDatSrc: TDataSource
    DataSet = valutes
    Left = 112
    Top = 8
  end
  object Filials: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select id,name from sb_filial')
    Session = CMDataModule.CMSession
    Left = 32
    Top = 72
    object FilialsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FilialsNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object pledgsDatSrc: TDataSource
    DataSet = pledgs
    Left = 112
    Top = 133
  end
  object pledgs: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT id,  description'
      '  FROM cm_pledges'
      'order by id')
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = CMDataModule.CMSession
    Left = 32
    Top = 131
    object pledgsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object pledgsDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 64
    end
  end
  object CategoriesDatSrc: TDataSource
    DataSet = Categories
    Left = 112
    Top = 232
  end
  object Categories: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT id, description'
      '  FROM cm_categories')
    Session = CMDataModule.CMSession
    Left = 32
    Top = 235
    object CategoriesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CategoriesDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 128
    end
  end
  object FilialsDatSrc: TDataSource
    DataSet = Filials
    Left = 104
    Top = 72
  end
  object persons: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT id,  descripion'
      '  FROM cm_persons')
    Session = CMDataModule.CMSession
    Left = 32
    Top = 299
    object personsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object personsDESCRIPION: TStringField
      FieldName = 'DESCRIPION'
      Size = 64
    end
  end
  object CreditTypes: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT id, description'
      '  FROM cm_credittypes')
    Session = CMDataModule.CMSession
    Left = 32
    Top = 187
    object CreditTypesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CreditTypesDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 128
    end
  end
  object personsDatSrc: TDataSource
    DataSet = persons
    Left = 104
    Top = 296
  end
  object CreditTypesDatSrc: TDataSource
    DataSet = CreditTypes
    Left = 116
    Top = 187
  end
  object ReportData: TOracleDataSet
    SQL.Strings = (
      'select '
      '     p.dateofconclusion as opendate,'
      
        '     nvl(p.duedatelastcontract,p.duedatefirstcontract) as closed' +
        'ate,'
      '     p.creditlineamount,'
      '     p.annualyinterestrate,'
      '     cust.name as custname,'
      '     cust.id as CustID,'
      
        '     cm_common.accountnumber_get(acc.contractaccid) as ContractA' +
        'ccNO,'
      
        '     cm_common.get_accountbalance(acc.contractaccid) as BalAcc  ' +
        ','
      '     h.rest,'
      '     h.interestrest,'
      '     h.duerest,'
      '     h.dueinterestrest,'
      '     h.stopcalcdate,'
      '     h.reserveid,'
      '     h.duereserveid,'
      
        '     cm_utils.Get_CreditPaymentgreatDate(p.id,p.duedatefirstcont' +
        'ract) as payamt'
      '   from cm_portfolio p,'
      '        cm_sb_customers cust,'
      '        cm_accounts acc,'
      '        cm_curr_state h'
      '   where '
      '      p.boorowerid = cust.id and'
      '      p.id = acc.creditid and'
      '      p.id  = h.creditid(+)  '
      ''
      ''
      ''
      '     ')
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 32
    Top = 352
    object ReportDataOPENDATE: TDateTimeField
      DisplayLabel = 'јчылма тарихи'
      FieldName = 'OPENDATE'
      Required = True
    end
    object ReportDataCLOSEDATE: TDateTimeField
      DisplayLabel = 'Ѕаьланма тарихи'
      FieldName = 'CLOSEDATE'
    end
    object ReportDataCUSTNAME: TStringField
      DisplayLabel = 'ћцшт€ринин ады'
      FieldName = 'CUSTNAME'
      Size = 90
    end
    object ReportDataCUSTID: TIntegerField
      DisplayLabel = 'ћцшт€ринин коду'
      FieldName = 'CUSTID'
      Required = True
    end
    object ReportDataBALACC: TFloatField
      DisplayLabel = 'Ѕаланс щесабы'
      FieldName = 'BALACC'
    end
    object ReportDataCONTRACTACCNO: TStringField
      DisplayLabel = 'ўесабын є-си'
      FieldName = 'CONTRACTACCNO'
      Size = 4000
    end
    object ReportDataCREDITLINEAMOUNT: TFloatField
      DisplayLabel = 'ћ€бл€ь'
      FieldName = 'CREDITLINEAMOUNT'
      Required = True
    end
    object ReportDataANNUALYINTERESTRATE: TFloatField
      DisplayLabel = '‘аиз д€р€ж€си'
      FieldName = 'ANNUALYINTERESTRATE'
      Required = True
    end
    object ReportDataREST: TFloatField
      DisplayLabel = '√алыг'
      FieldName = 'REST'
    end
    object ReportDataINTERESTREST: TFloatField
      DisplayLabel = '% √алыг'
      FieldName = 'INTERESTREST'
    end
    object ReportDataDUEREST: TFloatField
      DisplayLabel = 'Ёеж √алыг'
      FieldName = 'DUEREST'
    end
    object ReportDataDUEINTERESTREST: TFloatField
      DisplayLabel = 'Ёеж %√алыг '
      FieldName = 'DUEINTERESTREST'
    end
    object ReportDataSTOPCALCDATE: TDateTimeField
      FieldName = 'STOPCALCDATE'
      Visible = False
    end
    object ReportDataRESERVEID: TFloatField
      FieldName = 'RESERVEID'
      Visible = False
    end
    object ReportDataDUERESERVEID: TFloatField
      FieldName = 'DUERESERVEID'
      Visible = False
    end
    object ReportDataPAYAMT: TFloatField
      DisplayLabel = 'ёд€нилм€'
      FieldName = 'PAYAMT'
    end
  end
  object Reserves: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT id, percent||'#39' - '#39'|| description as descr'
      '  FROM CM_RESERVES'
      '  order by id')
    Session = CMDataModule.CMSession
    Left = 216
    Top = 16
    object ReservesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ReservesDESCR: TStringField
      FieldName = 'DESCR'
      Size = 107
    end
  end
  object ReservesDatSrc: TDataSource
    DataSet = Reserves
    Left = 296
    Top = 16
  end
  object DueReserves: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT id, percent||'#39' - '#39'|| description as descr'
      '  FROM CM_RESERVES'
      '  order by id'
      '')
    Session = CMDataModule.CMSession
    Left = 224
    Top = 72
    object DueReservesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DueReservesDESCR: TStringField
      FieldName = 'DESCR'
      Size = 107
    end
  end
  object DueReservesDatSrc: TDataSource
    DataSet = DueReserves
    Left = 312
    Top = 72
  end
  object usrgroups: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT id, description'
      '  FROM cm_usergroups')
    Session = CMDataModule.CMSession
    Left = 216
    Top = 144
    object usrgroupsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object usrgroupsDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 255
    end
  end
  object usrgroupsDatSrc: TDataSource
    DataSet = usrgroups
    Left = 312
    Top = 144
  end
  object Customers: TOracleDataSet
    SQL.Strings = (
      'select id,'
      '       name,'
      '       id||'#39' - '#39'||name as Kod'
      'from'
      '   cm_sb_customers'
      'where  EXISTS  (select boorowerid from cm_portfolio) ')
    Session = CMDataModule.CMSession
    Left = 216
    Top = 200
    object CustomersID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object CustomersNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object CustomersKOD: TStringField
      FieldName = 'KOD'
      Size = 133
    end
  end
  object CustomersDatSrc: TDataSource
    DataSet = Customers
    Left = 312
    Top = 200
  end
end
