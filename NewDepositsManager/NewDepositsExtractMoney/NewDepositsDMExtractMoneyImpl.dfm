object NewDepositsDMExtractMoney: TNewDepositsDMExtractMoney
  OldCreateOrder = False
  Height = 292
  Width = 443
  object Payments: TOracleDataSet
    SQL.Strings = (
      
        'SELECT id,  hdate, facticaldebt, interestdebt,clientdebt,trid, i' +
        'nttrid,tranchesid,description'
      '  FROM dm_payments'
      '  where id# = :ContractID'
      'order by hdate')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0043004F004E00540052004100430054004900
      4400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000900000004000000490044000100000000000A000000480044004100
      540045000100000000001800000046004100430054004900430041004C004400
      4500420054000100000000001800000049004E00540045005200450053005400
      4400450042005400010000000000080000005400520049004400010000000000
      0E00000049004E00540054005200490044000100000000001400000054005200
      41004E0043004800450053004900440001000000000016000000440045005300
      4300520049005000540049004F004E000100000000001400000043004C004900
      45004E0054004400450042005400010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 32
    Top = 32
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
    object PaymentsCLIENTDEBT: TFloatField
      FieldName = 'CLIENTDEBT'
      DisplayFormat = '#,##0.00'
    end
    object PaymentsTRID: TFloatField
      FieldName = 'TRID'
      Visible = False
    end
    object PaymentsINTTRID: TFloatField
      FieldName = 'INTTRID'
      Visible = False
    end
    object PaymentsTRANCHESID: TFloatField
      FieldName = 'TRANCHESID'
    end
    object PaymentsDESCRIPTION: TWideStringField
      DisplayLabel = 'T'#601'yinat'
      FieldName = 'DESCRIPTION'
      Size = 200
    end
  end
  object PaymentsDatSrc: TDataSource
    DataSet = Payments
    Left = 120
    Top = 24
  end
  object CreditAccsDatSrc: TDataSource
    DataSet = CreditAccs
    Left = 104
    Top = 88
  end
  object CreditAccs: TOracleDataSet
    SQL.Strings = (
      'select '
      '       id,'
      '       acc_no,'
      '       name'
      'from account '
      'where close_dat is null'
      'and  bal_cn1 in ( select accgroup from '
      'dm_acc_zone_info where zoneid = (select zoneid from dm_acc_zones'
      'where name = '#39'Account'#39'))'
      'order by acc_no'
      ''
      ''
      '')
    Optimize = False
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 88
    object CreditAccsID: TFloatField
      FieldName = 'ID'
    end
    object CreditAccsACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 4000
    end
    object CreditAccsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 4000
    end
  end
  object dm_payment: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'dm_payment'
    ParameterMode = pmNamed
    Left = 32
    Top = 152
  end
  object DepositInfo: TOracleDataSet
    SQL.Strings = (
      'select'
      '     cust.name,'
      '     cont.amount,'
      '     cont.currency,'
      '     cont.customerid,'
      '     cs.facticaldebt,'
      '     cs.facticalinterestdebt,'
      
        '    (select ostat from tenostat where acc_id=ca.clientaccid) ost' +
        'at'
      'from customers cust,'
      '     dm_history_currstate cs,'
      '     dm_contracts cont,'
      '     dm_contract_accounts ca'
      'where'
      '   cont.id = :ContractID '
      '  and '
      '   cust.id = cont.customerid'
      '  and '
      '   cs.id# = :ContractID '
      '  and'
      '   ca.id# = :ContractID ')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0043004F004E00540052004100430054004900
      4400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000007000000080000004E0041004D0045000100000000000C0000004100
      4D004F0055004E00540001000000000010000000430055005200520045004E00
      430059000100000000001400000043005500530054004F004D00450052004900
      44000100000000001800000046004100430054004900430041004C0044004500
      420054000100000000002800000046004100430054004900430041004C004900
      4E0054004500520045005300540044004500420054000100000000000A000000
      4F005300540041005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 232
    Top = 24
    object DepositInfoNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
    object DepositInfoAMOUNT: TFloatField
      Alignment = taLeftJustify
      FieldName = 'AMOUNT'
      EditFormat = '#,##0.00'
    end
    object DepositInfoCURRENCY: TFloatField
      Alignment = taLeftJustify
      FieldName = 'CURRENCY'
    end
    object DepositInfoCUSTOMERID: TFloatField
      FieldName = 'CUSTOMERID'
    end
    object DepositInfoFACTICALDEBT: TFloatField
      Alignment = taLeftJustify
      FieldName = 'FACTICALDEBT'
      EditFormat = '#,##0.00'
    end
    object DepositInfoFACTICALINTERESTDEBT: TFloatField
      Alignment = taLeftJustify
      FieldName = 'FACTICALINTERESTDEBT'
      EditFormat = '#,##0.00'
    end
    object DepositInfoOSTAT: TFloatField
      Alignment = taLeftJustify
      FieldName = 'OSTAT'
      EditFormat = '#,##0.00'
    end
  end
  object CustAcc: TOracleDataSet
    SQL.Strings = (
      'select clientaccid '
      
        '       ,dm_stored_programs.GetContractAccount(ContractAccID) as ' +
        'ContractAccNo'
      
        '       ,dm_stored_programs.GetContractAccount(InterestAccID) as ' +
        'InterestAccNo'
      
        '       ,dm_stored_programs.GetContractAccount(ClientAccID)   as ' +
        'ClientAccNo'
      'from dm_contract_accounts'
      'where id# = :Contractid')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0043004F004E00540052004100430054004900
      4400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000040000001600000043004C00490045004E0054004100430043004900
      44000100000000001A00000043004F004E005400520041004300540041004300
      43004E004F000100000000001A00000049004E00540045005200450053005400
      4100430043004E004F000100000000001600000043004C00490045004E005400
      4100430043004E004F00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 240
    Top = 80
    object CustAccCLIENTACCID: TFloatField
      FieldName = 'CLIENTACCID'
    end
    object CustAccCONTRACTACCNO: TWideStringField
      FieldName = 'CONTRACTACCNO'
      Size = 4000
    end
    object CustAccINTERESTACCNO: TWideStringField
      FieldName = 'INTERESTACCNO'
      Size = 4000
    end
    object CustAccCLIENTACCNO: TWideStringField
      FieldName = 'CLIENTACCNO'
      Size = 4000
    end
  end
  object DepositInfoDatSrc: TDataSource
    DataSet = DepositInfo
    Left = 312
    Top = 24
  end
  object CustAccDatSrc: TDataSource
    DataSet = CustAcc
    Left = 320
    Top = 80
  end
  object sb_aca: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'sb_aca'
    Left = 104
    Top = 160
  end
end
