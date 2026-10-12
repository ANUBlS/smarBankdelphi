object dmFinishPeriodCredits: TdmFinishPeriodCredits
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 696
  object valutes: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select valute,valu_name from sb_avalute')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 8
    object valutesVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object valutesVALU_NAME: TWideStringField
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
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 72
    object FilialsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FilialsNAME: TWideStringField
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
    Optimize = False
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 131
    object pledgsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object pledgsDESCRIPTION: TWideStringField
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
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 235
    object CategoriesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CategoriesDESCRIPTION: TWideStringField
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
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 299
    object personsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object personsDESCRIPION: TWideStringField
      FieldName = 'DESCRIPION'
      Size = 64
    end
  end
  object CreditTypes: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT id, description'
      '  FROM cm_credittypes')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 187
    object CreditTypesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CreditTypesDESCRIPTION: TWideStringField
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
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 352
    object ReportDataOPENDATE: TDateTimeField
      DisplayLabel = #1040#1095#1099#1083#1084#1072' '#1090#1072#1088#1080#1093#1080
      FieldName = 'OPENDATE'
      Required = True
    end
    object ReportDataCLOSEDATE: TDateTimeField
      DisplayLabel = #1041#1072#1100#1083#1072#1085#1084#1072' '#1090#1072#1088#1080#1093#1080
      FieldName = 'CLOSEDATE'
    end
    object ReportDataCUSTNAME: TWideStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099
      FieldName = 'CUSTNAME'
      Size = 90
    end
    object ReportDataCUSTID: TIntegerField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1082#1086#1076#1091
      FieldName = 'CUSTID'
      Required = True
    end
    object ReportDataBALACC: TFloatField
      DisplayLabel = #1041#1072#1083#1072#1085#1089' '#1097#1077#1089#1072#1073#1099
      FieldName = 'BALACC'
    end
    object ReportDataCONTRACTACCNO: TWideStringField
      DisplayLabel = #1065#1077#1089#1072#1073#1099#1085' '#8470'-'#1089#1080
      FieldName = 'CONTRACTACCNO'
      Size = 4000
    end
    object ReportDataCREDITLINEAMOUNT: TFloatField
      DisplayLabel = #1052#1103#1073#1083#1103#1100
      FieldName = 'CREDITLINEAMOUNT'
      Required = True
    end
    object ReportDataANNUALYINTERESTRATE: TFloatField
      DisplayLabel = #1060#1072#1080#1079' '#1076#1103#1088#1103#1078#1103#1089#1080
      FieldName = 'ANNUALYINTERESTRATE'
      Required = True
    end
    object ReportDataREST: TFloatField
      DisplayLabel = #1043#1072#1083#1099#1075
      FieldName = 'REST'
    end
    object ReportDataINTERESTREST: TFloatField
      DisplayLabel = '% '#1043#1072#1083#1099#1075
      FieldName = 'INTERESTREST'
    end
    object ReportDataDUEREST: TFloatField
      DisplayLabel = #1069#1077#1078' '#1043#1072#1083#1099#1075
      FieldName = 'DUEREST'
    end
    object ReportDataDUEINTERESTREST: TFloatField
      DisplayLabel = #1069#1077#1078' %'#1043#1072#1083#1099#1075' '
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
      DisplayLabel = #1070#1076#1103#1085#1080#1083#1084#1103
      FieldName = 'PAYAMT'
    end
  end
  object Reserves: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT id, percent||'#39' - '#39'|| description as descr'
      '  FROM CM_RESERVES'
      '  order by id')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 216
    Top = 16
    object ReservesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ReservesDESCR: TWideStringField
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
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 224
    Top = 72
    object DueReservesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DueReservesDESCR: TWideStringField
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
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 216
    Top = 144
    object usrgroupsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object usrgroupsDESCRIPTION: TWideStringField
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
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 216
    Top = 200
    object CustomersID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object CustomersNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
    object CustomersKOD: TWideStringField
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
