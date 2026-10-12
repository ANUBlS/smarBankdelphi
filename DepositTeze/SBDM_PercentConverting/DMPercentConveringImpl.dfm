object DMPercentConvering: TDMPercentConvering
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 161
  Top = 132
  Height = 480
  Width = 696
  object CalcedDepositsDatSrc: TDataSource
    DataSet = CalcedDeposits
    Left = 136
    Top = 24
  end
  object CalcedDeposits: TOracleDataSet
    SQL.Strings = (
      'select '
      ' cont.id,'
      ' cont.contractno,'
      
        ' sbcm_stored_programs.Get_ContractAccount(acc.ContractAccID)    ' +
        '              as ContractAccNo,'
      
        ' sbcm_stored_programs.Get_ContractAccount(acc.InterestAccID)    ' +
        '              as InterestAccNo,'
      
        ' sbcm_stored_programs.Get_ContractAccountName(acc.contractaccid)' +
        '              as custname,'
      
        '(select sum(facticaldebt) from sbcm_contract_state where id#=con' +
        't.id)         as facticaldebt,'
      
        '(select sum(facticalinterestdebt) from sbcm_contract_state where' +
        ' id#=cont.id) as facticalinterestdebt,'
      
        '(select sum(interest) from sbcm_deposit_interests where id#=cont' +
        '.id)          as interest,'
      
        ' SBCM_Stored_Programs.CheckContractState(cont.ID)               ' +
        '              as  Status,'
      ' av.val_name,'
      ' cont.currency,'
      ' cont.personaltype,'
      ' cont.clienttype,'
      ' cont.customerid,'
      ' cont.branchid'
      'from sbcm_contracts cont,'
      '     sbcm_contract_accounts acc,'
      '     avalute av'
      'where cont.type# = 3'
      'and acc.id# = cont.id'
      'and cont.currency = av.valute'
      'and cont.type# = 3'
      'order by :OrderField'
      '')
    Variables.Data = {
      03000000010000000B0000003A4F524445524649454C44010000000000000000
      000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 24
    object CalcedDepositsID: TFloatField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object CalcedDepositsCONTRACTNO: Twidestringfield
      DisplayLabel = 'ћцгавил€нин є'
      FieldName = 'CONTRACTNO'
      Size = 64
    end
    object CalcedDepositsVAL_NAME: Twidestringfield
      DisplayLabel = '$'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object CalcedDepositsCONTRACTACCNO: Twidestringfield
      DisplayLabel = 'ўесабын є'
      FieldName = 'CONTRACTACCNO'
      Size = 4000
    end
    object CalcedDepositsINTERESTACCNO: Twidestringfield
      DisplayLabel = '‘аиз ўесабын є'
      FieldName = 'INTERESTACCNO'
      Size = 4000
    end
    object CalcedDepositsCUSTNAME: Twidestringfield
      DisplayLabel = 'ћцшт€ри'
      FieldName = 'CUSTNAME'
      Size = 4000
    end
    object CalcedDepositsFACTICALDEBT: TFloatField
      DisplayLabel = '∆ари м€бл€ь'
      FieldName = 'FACTICALDEBT'
      Required = True
    end
    object CalcedDepositsFACTICALINTERESTDEBT: TFloatField
      DisplayLabel = '∆ари м€бл€ь цзр€ %'
      FieldName = 'FACTICALINTERESTDEBT'
      Required = True
    end
    object CalcedDepositsINTEREST: TFloatField
      DisplayLabel = 'ўесабланмыш %'
      FieldName = 'INTEREST'
      Required = True
    end
    object CalcedDepositsSTATUS: TFloatField
      FieldName = 'STATUS'
      Visible = False
    end
    object CalcedDepositsCURRENCY: TFloatField
      FieldName = 'CURRENCY'
      Visible = False
    end
    object CalcedDepositsPERSONALTYPE: TFloatField
      FieldName = 'PERSONALTYPE'
      Visible = False
    end
    object CalcedDepositsCLIENTTYPE: TFloatField
      FieldName = 'CLIENTTYPE'
      Visible = False
    end
    object CalcedDepositsCUSTOMERID: TFloatField
      FieldName = 'CUSTOMERID'
      Visible = False
    end
    object CalcedDepositsBRANCHID: TFloatField
      FieldName = 'BRANCHID'
      Required = True
      Visible = False
    end
  end
  object sbcm_percent_converting: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'sbcm_percent_converting'
    ParameterMode = pmNamed
    Left = 256
    Top = 24
  end
  object Valutes: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name from avalute')
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 88
    object ValutesVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object ValutesVALU_NAME: Twidestringfield
      FieldName = 'VALU_NAME'
      Size = 25
    end
  end
  object ValutesDatSrc: TDataSource
    DataSet = Valutes
    Left = 112
    Top = 88
  end
  object Filials: TOracleDataSet
    SQL.Strings = (
      'select id,name from filial')
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 144
    object FilialsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FilialsNAME: Twidestringfield
      FieldName = 'NAME'
      Size = 90
    end
  end
  object FilialsDatSrc: TDataSource
    DataSet = Filials
    Left = 120
    Top = 144
  end
  object Categories: TOracleDataSet
    SQL.Strings = (
      'select id,category from sbcm_categories')
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 208
    object CategoriesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CategoriesCATEGORY: Twidestringfield
      FieldName = 'CATEGORY'
      Size = 128
    end
  end
  object CategoriesDatSrc: TDataSource
    DataSet = Categories
    Left = 128
    Top = 208
  end
  object DepositTypes: TOracleDataSet
    SQL.Strings = (
      'select id,type from sbcm_deposit_types')
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 272
    object DepositTypesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DepositTypesTYPE: Twidestringfield
      FieldName = 'TYPE'
      Required = True
      Size = 256
    end
  end
  object DepositTypesDatSrc: TDataSource
    DataSet = DepositTypes
    Left = 128
    Top = 272
  end
  object CustomersDatSrc: TDataSource
    DataSet = Customers
    Left = 280
    Top = 88
  end
  object Customers: TOracleDataSet
    SQL.Strings = (
      'select id,name from customers'
      'where id in (select customerid from sbcm_contracts'
      'where type# = 3) ')
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 88
    object CustomersID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object CustomersNAME: Twidestringfield
      FieldName = 'NAME'
      Size = 90
    end
  end
  object PersonsDatSrc: TDataSource
    DataSet = Persons
    Left = 288
    Top = 144
  end
  object Persons: TOracleDataSet
    SQL.Strings = (
      'select id,name from sbcm_persons')
    Session = sboapiDataModule.SBSession
    Left = 216
    Top = 144
    object PersonsID: TFloatField
      FieldName = 'ID'
    end
    object PersonsNAME: Twidestringfield
      FieldName = 'NAME'
    end
  end
end
