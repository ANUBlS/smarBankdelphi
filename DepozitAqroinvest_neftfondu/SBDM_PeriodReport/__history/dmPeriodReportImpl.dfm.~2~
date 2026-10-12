object dmPeriodReport: TdmPeriodReport
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 194
  Top = 148
  Height = 480
  Width = 696
  object valutes: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name from avalute')
    Session = sboapiDataModule.SBSession
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
    SQL.Strings = (
      'select id,name from filial')
    Session = sboapiDataModule.SBSession
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
  object CustomersDatSrc: TDataSource
    DataSet = Customers
    Left = 112
    Top = 133
  end
  object Customers: TOracleDataSet
    SQL.Strings = (
      'select id,'
      '       name,'
      '      to_char(id)||'#39'-'#39'||name as KOD from customers'
      'where id in (select customerid from sbcm_contracts)'
      'order by id')
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 131
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
      Size = 131
    end
  end
  object CategoriesDatSrc: TDataSource
    DataSet = Categories
    Left = 112
    Top = 232
  end
  object Categories: TOracleDataSet
    SQL.Strings = (
      'select id,category from sbcm_categories')
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 235
    object CategoriesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CategoriesCATEGORY: TStringField
      FieldName = 'CATEGORY'
      Size = 128
    end
  end
  object FilialsDatSrc: TDataSource
    DataSet = Filials
    Left = 104
    Top = 72
  end
  object persons: TOracleDataSet
    SQL.Strings = (
      'select id,name from sbcm_persons')
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 299
    object personsID: TFloatField
      FieldName = 'ID'
    end
    object personsNAME: TStringField
      FieldName = 'NAME'
    end
  end
  object DepositTypes: TOracleDataSet
    SQL.Strings = (
      'select id,type from sbcm_deposit_types')
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 187
    object DepositTypesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DepositTypesTYPE: TStringField
      FieldName = 'TYPE'
      Required = True
      Size = 256
    end
  end
  object personsDatSrc: TDataSource
    DataSet = persons
    Left = 104
    Top = 296
  end
  object DepositTypesDatSrc: TDataSource
    DataSet = DepositTypes
    Left = 116
    Top = 187
  end
  object Deps: TOracleDataSet
    SQL.Strings = (
      'select'
      '   cont.id,'
      '   cont.contractno,'
      
        '   sbcm_stored_programs.Get_ContractAccount(Acc.Contractaccid) a' +
        's ContractAccNO'
      'from sbcm_contracts cont,'
      '     sbcm_contract_accounts acc'
      'where cont.id = acc.id#')
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 200
    Top = 16
    object DepsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DepsCONTRACTNO: TStringField
      FieldName = 'CONTRACTNO'
      Size = 64
    end
    object DepsCONTRACTACCNO: TStringField
      FieldName = 'CONTRACTACCNO'
      Size = 4000
    end
  end
  object DepsDatSrc: TDataSource
    DataSet = Deps
    Left = 256
    Top = 16
  end
  object ResultData: TOracleDataSet
    SQL.Strings = (
      'select '
      '      cont.contractno,'
      '      cont.opendate,'
      '      cont.closedate,'
      
        '      sbcm_stored_programs.get_contractaccount(acc.contractaccid' +
        ') as ContractAccNo,'
      
        '      cust.name,sbcm_stored_programs.get_contract_BalNo(Cont.ID)' +
        ' as Balans,'
      '      av.val_name , '
      '      intr.interest as annualint,   '
      '      h1.facticaldebt as frest,'
      '      h1.facticaldebt*o1.ostat as efrest,'
      '      h1.facticalinterestdebt*o1.ostat as finterestrest,'
      '      h1.facticalinterestdebt*o1.ostat as efinterestrest,'
      '      '
      '      nvl(tranche.total,0) as tramt,'
      '      nvl(tranche.etotal,0) as etramt,'
      '      '
      '      nvl(payment.facticaldebt,0) as payamt,'
      '      nvl(payment.efacticaldebt,0) as epayamt,'
      '      nvl(payment.interestdebt,0) as payint,'
      '      nvl(payment.einterestdebt,0) as epayint,'
      '          '
      '      h2.facticaldebt as srest,'
      '      h2.facticaldebt*o2.ostat as esrest,'
      '      h2.facticalinterestdebt*o2.ostat as sinterestrest,'
      '      h2.facticalinterestdebt*o2.ostat as esinterestrest'
      ''
      'from sbcm_contracts cont,'
      '     sbcm_contract_accounts acc,'
      '     sbcm_contract_hist h1,'
      '     sbcm_contract_hist h2,'
      '     sbcm_tranches_temp /*report*/ tranche,'
      '     sbcm_payments_temp /*report*/ payment,'
      '     sbcm_interests intr,'
      '     customers  cust ,'
      '     avalute av,'
      '     operkurs o1,'
      '     operkurs o2   '
      ''
      'where  '
      '  cont.id  = acc.id# and'
      '  cont.customerid = cust.id and'
      '  cont.id = h1.id# and'
      '  cont.id = h2.id# and'
      '  cont.id  = intr.id# and'
      '  cont.currency  = av.valute and'
      '  cont.currency = o1.val_kod and'
      '  cont.currency = o2.val_kod and'
      '  o1.dat = :bdat and  '
      '  o2.dat = :edat and'
      '  h1.hdate = :bdat and  '
      '  h2.hdate = :edat and '
      '  cont.id = tranche.id# (+) and  '
      '  cont.id = payment.id#(+)   '
      ''
      ''
      ''
      '')
    Variables.Data = {
      0300000002000000050000003A424441540C0000000000000000000000050000
      003A454441540C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000160000000A000000434F4E54524143544E4F01000000000008000000
      4F50454E4441544501000000000009000000434C4F5345444154450100000000
      000D000000434F4E54524143544143434E4F010000000000040000004E414D45
      0100000000000600000042414C414E530100000000000800000056414C5F4E41
      4D4501000000000009000000414E4E55414C494E540100000000000500000046
      52455354010000000000060000004546524553540100000000000D0000004649
      4E544552455354524553540100000000000E0000004546494E54455245535452
      455354010000000000050000005452414D540100000000000600000045545241
      4D5401000000000006000000504159414D540100000000000700000045504159
      414D5401000000000006000000504159494E5401000000000007000000455041
      59494E5401000000000005000000535245535401000000000006000000455352
      4553540100000000000D00000053494E54455245535452455354010000000000
      0E0000004553494E54455245535452455354010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 80
    object ResultDataCONTRACTNO: TStringField
      DisplayLabel = 'Мцгавилянин №-си'
      FieldName = 'CONTRACTNO'
      Size = 64
    end
    object ResultDataOPENDATE: TDateTimeField
      DisplayLabel = 'Ачылма тарихи'
      FieldName = 'OPENDATE'
      Required = True
    end
    object ResultDataCLOSEDATE: TDateTimeField
      DisplayLabel = 'Баьланма тарихи'
      FieldName = 'CLOSEDATE'
      Required = True
    end
    object ResultDataBALANS: TFloatField
      DisplayLabel = 'Баланс щесабы'
      FieldName = 'BALANS'
    end
    object ResultDataCONTRACTACCNO: TStringField
      DisplayLabel = 'щесабын №-си'
      FieldName = 'CONTRACTACCNO'
      Size = 4000
    end
    object ResultDataVAL_NAME: TStringField
      DisplayLabel = '$'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object ResultDataANNUALINT: TFloatField
      DisplayLabel = '%'
      FieldName = 'ANNUALINT'
      Required = True
    end
    object ResultDataNAME: TStringField
      DisplayLabel = 'Мцштяринин ады'
      FieldName = 'NAME'
      Size = 90
    end
    object ResultDataFREST: TFloatField
      DisplayLabel = 'Д.Я.Г '
      FieldName = 'FREST'
      Required = True
    end
    object ResultDataEFREST: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'EFREST'
    end
    object ResultDataFINTERESTREST: TFloatField
      DisplayLabel = 'Д.Я.Г % галыг'
      FieldName = 'FINTERESTREST'
    end
    object ResultDataEFINTERESTREST: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'EFINTERESTREST'
    end
    object ResultDataTRAMT: TFloatField
      DefaultExpression = '0'
      DisplayLabel = 'Д.Я йатрымлар'
      FieldName = 'TRAMT'
    end
    object ResultDataETRAMT: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'ETRAMT'
    end
    object ResultDataPAYAMT: TFloatField
      DisplayLabel = 'Д.Я .юдянишляр'
      FieldName = 'PAYAMT'
    end
    object ResultDataEPAYAMT: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'EPAYAMT'
    end
    object ResultDataPAYINT: TFloatField
      DisplayLabel = 'Д.Я .фаиз цзря юдянишляр'
      FieldName = 'PAYINT'
    end
    object ResultDataEPAYINT: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'EPAYINT'
    end
    object ResultDataSREST: TFloatField
      DisplayLabel = 'Д.С.Г '
      FieldName = 'SREST'
      Required = True
    end
    object ResultDataESREST: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'ESREST'
    end
    object ResultDataSINTERESTREST: TFloatField
      DisplayLabel = 'Д.С.Г % галыг'
      FieldName = 'SINTERESTREST'
    end
    object ResultDataESINTERESTREST: TFloatField
      DisplayLabel = 'Еквивалент'
      FieldName = 'ESINTERESTREST'
    end
  end
  object sbcm_period_report: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SBCM_PERIOD_REPORTS'
    ParameterMode = pmNamed
    Cursor = crSQLWait
    Left = 296
    Top = 80
  end
end
