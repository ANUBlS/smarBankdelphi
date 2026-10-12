object dmDepositsArchive: TdmDepositsArchive
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 696
  object DepositsData: TOracleDataSet
    SQL.Strings = (
      'select '
      '       cont.id,'
      '       cont.contractno,'
      
        '       sbcm_stored_programs.Get_ContractAccount(acc.contractacci' +
        'd) as ContractAccNO,'
      
        '       sbcm_stored_programs.Get_ContractAccount(acc.interestacci' +
        'd) as InterestAccNO,'
      '       av.val_name,'
      
        '       sbcm_stored_programs.Get_ContractAccountName(acc.contract' +
        'accid) as CustomerName,'
      ''
      
        '       --sbcm_stored_programs.get_CustomerNameByID(cont.customer' +
        'id) as CustomerName,'
      
        '       --sbcm_stored_programs.get_customername(acc.contractaccid' +
        ') as CustomerName,'
      '       cont.opendate,'
      '       cont.closedate,'
      '       cont.amount,'
      '       cont.amount*tmp.ostat as ekamount,'
      '       intr.interest,         '
      '       cstate.facticaldebt,'
      '       cstate.facticaldebt*tmp.ostat as ekfacticaldebt,'
      '       cstate.facticalinterestdebt,'
      
        '       cstate.facticalinterestdebt*tmp.ostat as ekfacticalintere' +
        'stdebt,'
      '       cstate.stopcalculationdate,'
      
        '       --SBCM_Stored_Programs.CheckContractState(cont.ID) as  St' +
        'atus,'
      '       cont.currency,'
      '       cont.personaltype,'
      '       cont.clienttype,'
      '       cont.branchid,'
      '       cont.contracttype,'
      '       cstate.calculationenabled as status,'
      '       cont.customerid,'
      '       cont.sid# as usid'
      'from sbcm_contracts cont,'
      '     sbcm_contract_accounts acc,'
      '     sbcm_interests intr,'
      '     sbcm_contract_state cstate,'
      '     avalute av,'
      '     temprate tmp'
      'where acc.id# = cont.id and'
      '      intr.id# = cont.id and'
      '      cstate.id# = cont.id and'
      '      cont.currency = av.valute and'
      '      cont.currency = tmp.val_kod and '
      '      cont.type# = 4 --Archive deposits'
      ' order by :OrderField     ')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A004F0052004400450052004600490045004C00
      4400010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001800000004000000490044000100000000001400000043004F004E00
      540052004100430054004E004F000100000000001A00000043004F004E005400
      52004100430054004100430043004E004F000100000000001A00000049004E00
      5400450052004500530054004100430043004E004F0001000000000010000000
      560041004C005F004E0041004D00450001000000000018000000430055005300
      54004F004D00450052004E0041004D004500010000000000100000004F005000
      45004E0044004100540045000100000000001200000043004C004F0053004500
      44004100540045000100000000000C00000041004D004F0055004E0054000100
      000000001000000045004B0041004D004F0055004E0054000100000000001000
      000049004E005400450052004500530054000100000000001800000046004100
      430054004900430041004C0044004500420054000100000000001C0000004500
      4B0046004100430054004900430041004C004400450042005400010000000000
      2800000046004100430054004900430041004C0049004E005400450052004500
      5300540044004500420054000100000000002C00000045004B00460041004300
      54004900430041004C0049004E00540045005200450053005400440045004200
      540001000000000026000000530054004F005000430041004C00430055004C00
      4100540049004F004E0044004100540045000100000000001000000043005500
      5200520045004E00430059000100000000001800000050004500520053004F00
      4E0041004C0054005900500045000100000000001400000043004C0049004500
      4E0054005400590050004500010000000000100000004200520041004E004300
      4800490044000100000000001800000043004F004E0054005200410043005400
      54005900500045000100000000000C0000005300540041005400550053000100
      000000001400000043005500530054004F004D00450052004900440001000000
      0000080000005500530049004400010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 24
    object DepositsDataID: TFloatField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object DepositsDataCONTRACTNO: TWideStringField
      DisplayLabel = #1052#1094#1075#1072#1074#1080#1083#1103#1085#1080#1085' '#8470
      FieldName = 'CONTRACTNO'
      Size = 64
    end
    object DepositsDataCONTRACTACCNO: TWideStringField
      DisplayLabel = #1065#1077#1089#1072#1073#1099#1085' '#8470
      FieldName = 'CONTRACTACCNO'
      Size = 4000
    end
    object DepositsDataVAL_NAME: TWideStringField
      DisplayLabel = '$'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object DepositsDataCUSTOMERNAME: TWideStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099
      FieldName = 'CUSTOMERNAME'
      Size = 4000
    end
    object DepositsDataINTERESTACCNO: TWideStringField
      DisplayLabel = #1060#1072#1080#1079' '#1065#1077#1089#1072#1073#1099#1085' '#8470
      FieldName = 'INTERESTACCNO'
      Size = 4000
    end
    object DepositsDataOPENDATE: TDateTimeField
      DisplayLabel = #1040#1095#1099#1083#1084#1072' '#1090#1072#1088#1080#1093#1080
      FieldName = 'OPENDATE'
      Required = True
    end
    object DepositsDataCLOSEDATE: TDateTimeField
      DisplayLabel = #1041#1072#1100#1083#1072#1085#1084#1072' '#1090#1072#1088#1080#1093#1080
      FieldName = 'CLOSEDATE'
      Required = True
    end
    object DepositsDataAMOUNT: TFloatField
      DisplayLabel = #1052#1103#1073#1083#1103#1100
      FieldName = 'AMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object DepositsDataEKAMOUNT: TFloatField
      DisplayLabel = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
      FieldName = 'EKAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object DepositsDataINTEREST: TFloatField
      DisplayLabel = #1048#1083#1083#1080#1082' %'
      FieldName = 'INTEREST'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object DepositsDataFACTICALDEBT: TFloatField
      DisplayLabel = #1046#1072#1088#1080' '#1052#1103#1073#1083#1103#1100
      FieldName = 'FACTICALDEBT'
      DisplayFormat = '#,##0.00'
    end
    object DepositsDataEKFACTICALDEBT: TFloatField
      DisplayLabel = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
      FieldName = 'EKFACTICALDEBT'
      DisplayFormat = '#,##0.00'
    end
    object DepositsDataFACTICALINTERESTDEBT: TFloatField
      DisplayLabel = #1046#1072#1088#1080' '#1052#1103#1073#1083#1103#1100' '#1094#1079#1088#1103' %'
      FieldName = 'FACTICALINTERESTDEBT'
      DisplayFormat = '#,##0.00'
    end
    object DepositsDataEKFACTICALINTERESTDEBT: TFloatField
      DisplayLabel = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
      FieldName = 'EKFACTICALINTERESTDEBT'
      DisplayFormat = '#,##0.00'
    end
    object DepositsDataSTOPCALCULATIONDATE: TDateTimeField
      DisplayLabel = #1057#1086#1085' '#1050#1072#1087#1080#1090#1072#1083'/'#1070#1076#1103#1084#1103' '#1090#1072#1088#1080#1093#1080
      FieldName = 'STOPCALCULATIONDATE'
    end
    object DepositsDataCURRENCY: TFloatField
      FieldName = 'CURRENCY'
      Visible = False
    end
    object DepositsDataPERSONALTYPE: TFloatField
      FieldName = 'PERSONALTYPE'
      Visible = False
    end
    object DepositsDataCLIENTTYPE: TFloatField
      FieldName = 'CLIENTTYPE'
      Visible = False
    end
    object DepositsDataBRANCHID: TFloatField
      FieldName = 'BRANCHID'
      Required = True
      Visible = False
    end
    object DepositsDataCONTRACTTYPE: TIntegerField
      FieldName = 'CONTRACTTYPE'
      Visible = False
    end
    object DepositsDataSTATUS: TFloatField
      FieldName = 'STATUS'
      Required = True
      Visible = False
    end
    object DepositsDataCUSTOMERID: TFloatField
      FieldName = 'CUSTOMERID'
      Visible = False
    end
    object DepositsDataUSID: TFloatField
      FieldName = 'USID'
      Visible = False
    end
  end
  object Valutes: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name '
      'from avalute')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 72
    object ValutesVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object ValutesVALU_NAME: TWideStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
  end
  object Filials: TOracleDataSet
    SQL.Strings = (
      'select id,name from '
      'filial'
      'order by id ')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 128
    object FilialsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FilialsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object DepositTypes: TOracleDataSet
    SQL.Strings = (
      'select id,type'
      'from sbcm_deposit_Types')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 184
    object DepositTypesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DepositTypesTYPE: TWideStringField
      FieldName = 'TYPE'
      Required = True
      Size = 256
    end
  end
  object Categories: TOracleDataSet
    SQL.Strings = (
      'select id,Category from sbcm_categories')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 240
    object CategoriesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CategoriesCATEGORY: TWideStringField
      FieldName = 'CATEGORY'
      Size = 128
    end
  end
  object persons: TOracleDataSet
    SQL.Strings = (
      'select id,name from sbcm_persons')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 296
    object personsID: TFloatField
      FieldName = 'ID'
    end
    object personsNAME: TWideStringField
      FieldName = 'NAME'
    end
  end
  object DepositsDataSrc: TDataSource
    DataSet = DepositsData
    Left = 112
    Top = 24
  end
  object ValutesDatSrc: TDataSource
    DataSet = Valutes
    Left = 120
    Top = 72
  end
  object FilialsDatSrc: TDataSource
    DataSet = Filials
    Left = 120
    Top = 128
  end
  object DepositTypesDatSrc: TDataSource
    DataSet = DepositTypes
    Left = 120
    Top = 184
  end
  object CategoriesDatSrc: TDataSource
    DataSet = Categories
    Left = 120
    Top = 240
  end
  object personsDatSrc: TDataSource
    DataSet = persons
    Left = 120
    Top = 288
  end
  object BankDate: TOracleDataSet
    SQL.Strings = (
      'select tek_dat from sysdat')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 296
    Top = 16
    object BankDateTEK_DAT: TDateTimeField
      FieldName = 'TEK_DAT'
      Required = True
    end
  end
  object Tranches: TOracleDataSet
    SQL.Strings = (
      'SELECT id, hdate, total, trid'
      '  FROM sbcm_tranches'
      '  where id# = :ContractID'
      'order by hdate')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0043004F004E00540052004100430054004900
      4400030000000000000000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 256
    Top = 88
    object TranchesID: TFloatField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object TranchesTOTAL: TFloatField
      DisplayLabel = #1052#1103#1073#1083#1103#1100
      FieldName = 'TOTAL'
      DisplayFormat = '#,##0.00'
    end
    object TranchesHDATE: TDateTimeField
      DisplayLabel = #1058#1072#1088#1080#1093
      FieldName = 'HDATE'
      Required = True
    end
    object TranchesTRID: TFloatField
      FieldName = 'TRID'
      Visible = False
    end
  end
  object TranchesDatSrc: TDataSource
    DataSet = Tranches
    Left = 328
    Top = 88
  end
  object DepositInfoDatSrc: TDataSource
    DataSet = DepositInfo
    Left = 328
    Top = 185
  end
  object DepositInfo: TOracleDataSet
    SQL.Strings = (
      'select'
      '     cust.name,'
      '     intr.interest,'
      '     cont.amount,'
      '     cont.currency,'
      '     cont.customerid'
      'from customers cust,'
      '     sbcm_interests intr,'
      '     sbcm_contracts cont'
      'where'
      'cont.id = :ContractID and '
      'cust.id = cont.customerid'
      'and intr.id# = :ContractID ')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0043004F004E00540052004100430054004900
      4400030000000000000000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 240
    Top = 184
    object DepositInfoNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
    object DepositInfoINTEREST: TFloatField
      FieldName = 'INTEREST'
      Required = True
    end
    object DepositInfoAMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object DepositInfoCURRENCY: TFloatField
      FieldName = 'CURRENCY'
    end
    object DepositInfoCUSTOMERID: TFloatField
      FieldName = 'CUSTOMERID'
    end
  end
  object Payments: TOracleDataSet
    SQL.Strings = (
      
        'SELECT id,  hdate, facticaldebt, interestdebt,bankdebt,bankinter' +
        'estdebt,overduedebt,overdueinterestdebt,trid, inttrid,befointtri' +
        'd'
      '  FROM sbcm_payments'
      '  where id# = :ContractID'
      'order by hdate')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0043004F004E00540052004100430054004900
      4400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000B00000004000000490044000100000000000A000000480044004100
      540045000100000000001800000046004100430054004900430041004C004400
      4500420054000100000000001800000049004E00540045005200450053005400
      440045004200540001000000000010000000420041004E004B00440045004200
      540001000000000020000000420041004E004B0049004E005400450052004500
      530054004400450042005400010000000000160000004F005600450052004400
      550045004400450042005400010000000000260000004F005600450052004400
      5500450049004E00540045005200450053005400440045004200540001000000
      00000800000054005200490044000100000000000E00000049004E0054005400
      520049004400010000000000160000004200450046004F0049004E0054005400
      520049004400010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 240
    Top = 248
    object PaymentsID: TFloatField
      DisplayLabel = #8470
      FieldName = 'ID'
      Required = True
    end
    object PaymentsHDATE: TDateTimeField
      DisplayLabel = #1058#1072#1088#1080#1093
      FieldName = 'HDATE'
      Required = True
    end
    object PaymentsFACTICALDEBT: TFloatField
      DisplayLabel = #1071#1089#1072#1089' '#1084#1103#1073#1083#1103#1100#1076#1103#1085
      FieldName = 'FACTICALDEBT'
      DisplayFormat = '#,##0.00'
    end
    object PaymentsINTERESTDEBT: TFloatField
      DisplayLabel = #1060#1072#1080#1079' '#1084#1103#1073#1083#1103#1100#1080#1085#1076#1103#1085
      FieldName = 'INTERESTDEBT'
      DisplayFormat = '#,##0.00'
    end
    object PaymentsBANKDEBT: TFloatField
      FieldName = 'BANKDEBT'
    end
    object PaymentsBANKINTERESTDEBT: TFloatField
      FieldName = 'BANKINTERESTDEBT'
    end
    object PaymentsOVERDUEDEBT: TFloatField
      FieldName = 'OVERDUEDEBT'
    end
    object PaymentsOVERDUEINTERESTDEBT: TFloatField
      FieldName = 'OVERDUEINTERESTDEBT'
    end
    object PaymentsTRID: TFloatField
      FieldName = 'TRID'
      Visible = False
    end
    object PaymentsINTTRID: TFloatField
      FieldName = 'INTTRID'
      Visible = False
    end
    object PaymentsBEFOINTTRID: TFloatField
      FieldName = 'BEFOINTTRID'
    end
  end
  object PaymentsDatSrc: TDataSource
    DataSet = Payments
    Left = 328
    Top = 248
  end
end
