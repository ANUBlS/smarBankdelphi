object dmReport: TdmReport
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 210
  Top = 186
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
  object ReportData: TOracleDataSet
    SQL.Strings = (
      ''
      'SELECT cont.contractno, av.val_name,'
      
        '       sbcm_stored_programs.get_customernamebyid (cont.customeri' +
        'd)'
      
        '                                                                ' +
        '  AS custname,'
      '       cont.customerid as custID,'
      
        '       sbcm_stored_programs.get_contract_BalNo(Cont.ID) as Balan' +
        's,'
      
        '       sbcm_stored_programs.get_contractaccount (acc.contractacc' +
        'id'
      
        '                                                ) AS contractacc' +
        'no,'
      
        '       sbcm_stored_programs.get_contractaccount (acc.interestacc' +
        'id'
      
        '                                                ) AS interestacc' +
        'no,'
      '       sbcm_stored_programs.get_contractaccount (acc.clientaccid'
      
        '                                                ) AS clientaccno' +
        ','
      
        '       cont.opendate, cont.closedate, cont.amount,cont.amount* o' +
        '.ostat as eamount,   intr.interest,'
      
        '       dueintr.overdueinterest, dueintr.dueinterest, h.facticald' +
        'ebt,'
      
        '       h.facticaldebt * o.ostat AS efacticaldebt, h.facticalinte' +
        'restdebt,'
      
        '       h.facticalinterestdebt * o.ostat AS efacticalinterestdebt' +
        ','
      
        '       cat.CATEGORY, per.NAME as pername, dt.TYPE, fil.NAME as f' +
        'ilname,'
      '       h.facticaldebt+h.facticalinterestdebt as Payamt,'
      
        '       h.facticaldebt* o.ostat +h.facticalinterestdebt* o.ostat ' +
        ' as EPayamt,'
      
        '       sbcm_stored_programs.get_firstclosedat(cont.id) as firsto' +
        'pdate'
      '  FROM sbcm_contracts cont,'
      '       sbcm_contract_accounts acc,'
      '       sbcm_contract_history h,'
      '       sbcm_interests intr,'
      '       sbcm_overdueinterests dueintr,'
      '       operkurs o,'
      '       sbcm_categories cat,'
      '       filial fil,'
      '       sbcm_deposit_types dt,'
      '       sbcm_persons per,'
      '       avalute av'
      ' WHERE h.hdate = :dat'
      '   AND o.dat = :dat'
      '   AND cont.ID = acc.id#'
      '   AND cont.ID = h.id#'
      '   AND cont.ID = intr.id#'
      '   AND cont.ID = dueintr.id#'
      '   AND cont.currency = o.val_kod'
      '   AND cont.currency = av.valute'
      '   AND cont.clienttype = cat.ID'
      '   AND cont.branchid = fil.ID'
      '   AND cont.contracttype = dt.ID'
      '   AND cont.personaltype = per.ID and cont.type# in (3,4)'
      ''
      ''
      ''
      ''
      '')
    Variables.Data = {0300000001000000040000003A4441540C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001A0000000A000000434F4E54524143544E4F01000000000008000000
      56414C5F4E414D4501000000000008000000435553544E414D45010000000000
      060000004355535449440100000000000600000042414C414E53010000000000
      0D000000434F4E54524143544143434E4F0100000000000D000000494E544552
      4553544143434E4F0100000000000B000000434C49454E544143434E4F010000
      000000080000004F50454E4441544501000000000009000000434C4F53454441
      544501000000000006000000414D4F554E540100000000000700000045414D4F
      554E5401000000000008000000494E5445524553540100000000000F0000004F
      564552445545494E5445524553540100000000000B000000445545494E544552
      4553540100000000000C000000464143544943414C444542540100000000000D
      00000045464143544943414C4445425401000000000014000000464143544943
      414C494E54455245535444454254010000000000150000004546414354494341
      4C494E544552455354444542540100000000000800000043415445474F525901
      0000000000070000005045524E414D4501000000000004000000545950450100
      000000000700000046494C4E414D4501000000000006000000504159414D5401
      00000000000700000045504159414D540100000000000B00000046495253544F
      5044415445010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    OnCalcFields = ReportDataCalcFields
    Left = 200
    Top = 72
    object ReportDataCONTRACTNO: TStringField
      DisplayLabel = 'ћцгавил€нин є'
      FieldName = 'CONTRACTNO'
      Size = 64
    end
    object ReportDataVAL_NAME: TStringField
      DisplayLabel = '$'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object ReportDataCUSTNAME: TStringField
      DisplayLabel = 'ћцшт€ринин ады'
      FieldName = 'CUSTNAME'
      Size = 4000
    end
    object ReportDataCUSTID: TFloatField
      DisplayLabel = 'ћцшт€ринин коду'
      FieldName = 'CUSTID'
    end
    object ReportDataCONTRACTACCNO: TStringField
      DisplayLabel = 'ўесабын є-си'
      FieldName = 'CONTRACTACCNO'
      Size = 4000
    end
    object ReportDataINTERESTACCNO: TStringField
      DisplayLabel = '‘аиз ўесабын є-си'
      FieldName = 'INTERESTACCNO'
      Size = 4000
    end
    object ReportDataCLIENTACCNO: TStringField
      DisplayLabel = 'ћцшт€ри ўесабын є-си'
      FieldName = 'CLIENTACCNO'
      Size = 4000
    end
    object ReportDataBALANS: TFloatField
      DisplayLabel = 'Ѕаланс щесабы'
      FieldName = 'BALANS'
    end
    object ReportDataOPENDATE: TDateTimeField
      DisplayLabel = 'јчылма тарихи'
      FieldName = 'OPENDATE'
      Required = True
    end
    object ReportDataCLOSEDATE: TDateTimeField
      DisplayLabel = 'Ѕаьланма тарихи'
      FieldName = 'CLOSEDATE'
      Required = True
    end
    object ReportDatafclosedat: TDateField
      DisplayLabel = '»лкин Ѕаьланма тарихи'
      FieldKind = fkCalculated
      FieldName = 'fclosedat'
      Calculated = True
    end
    object ReportDataFIRSTOPDATE: TDateTimeField
      DisplayLabel = '»лкин Ѕаьланма тарихи'
      FieldName = 'FIRSTOPDATE'
      Visible = False
    end
    object ReportDataAMOUNT: TFloatField
      DisplayLabel = 'ћ€бл€ь'
      FieldName = 'AMOUNT'
    end
    object ReportDataEAMOUNT: TFloatField
      DisplayLabel = '≈квивалент'
      FieldName = 'EAMOUNT'
    end
    object ReportDataINTEREST: TFloatField
      DisplayLabel = '%'
      FieldName = 'INTEREST'
      Required = True
    end
    object ReportDataOVERDUEINTEREST: TFloatField
      DisplayLabel = 'м€ %'
      FieldName = 'OVERDUEINTEREST'
      Required = True
    end
    object ReportDataDUEINTEREST: TFloatField
      DisplayLabel = 'м с %'
      FieldName = 'DUEINTEREST'
    end
    object ReportDataFACTICALDEBT: TFloatField
      DisplayLabel = '∆ари м€бл€ь'
      FieldName = 'FACTICALDEBT'
      Required = True
    end
    object ReportDataEFACTICALDEBT: TFloatField
      DisplayLabel = '≈квивалент'
      FieldName = 'EFACTICALDEBT'
    end
    object ReportDataFACTICALINTERESTDEBT: TFloatField
      DisplayLabel = '‘аиз цзр€ м€бл€ь'
      FieldName = 'FACTICALINTERESTDEBT'
      Required = True
    end
    object ReportDataEFACTICALINTERESTDEBT: TFloatField
      DisplayLabel = '≈квивалент'
      FieldName = 'EFACTICALINTERESTDEBT'
    end
    object ReportDataPAYAMT: TFloatField
      DisplayLabel = '√айтарылма'
      FieldName = 'PAYAMT'
    end
    object ReportDataEPAYAMT: TFloatField
      DisplayLabel = '≈квивалент'
      FieldName = 'EPAYAMT'
    end
    object ReportDataTYPE: TStringField
      DisplayLabel = 'депозитин типи'
      FieldName = 'TYPE'
      Required = True
      Size = 256
    end
    object ReportDataCATEGORY: TStringField
      DisplayLabel = 'ћцшт€ринин типи'
      FieldName = 'CATEGORY'
      Size = 128
    end
    object ReportDataPERNAME: TStringField
      DisplayLabel = 'ћцшт€ринин катеэорийасы'
      FieldName = 'PERNAME'
    end
    object ReportDataFILNAME: TStringField
      DisplayLabel = '‘илиал'
      FieldName = 'FILNAME'
      Size = 90
    end
  end
end
