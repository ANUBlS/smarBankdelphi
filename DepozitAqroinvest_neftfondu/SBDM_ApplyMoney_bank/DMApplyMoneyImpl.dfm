object DMApplyMoney: TDMApplyMoney
  OldCreateOrder = False
  Height = 480
  Width = 696
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
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 32
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
    Left = 120
    Top = 24
  end
  object DebitAccs: TOracleDataSet
    SQL.Strings = (
      '/*select id,'
      '       acc_no,'
      '       name'
      'from account '
      'where close_dat is null'
      '--and kli_id=:contractid '
      
        '--in(select clientaccid from sbcm_contract_accounts where id#=:c' +
        'ontractid)'
      'and  bal_cn1 in ( select accgroup from '
      
        'sbcm_acc_zone_info where zoneid = (select zoneid from sbcm_acc_z' +
        'ones'
      'where name = '#39'Account'#39'))'
      'union all*/'
      'select '
      '       /*+ FIRST_ROWS_200(account) */'
      '       id,'
      '       acc_no,'
      '       name'
      'from account '
      'where close_dat is null'
      'and  bal_cn1 in ( select accgroup from '
      
        'sbcm_acc_zone_info where zoneid = (select zoneid from sbcm_acc_z' +
        'ones'
      'where name = '#39'InternalBankAccs'#39'))'
      'order by acc_no'
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000000C000000410043004300
      5F004E004F00010000000000080000004E0041004D004500010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 88
    object DebitAccsID: TFloatField
      FieldName = 'ID'
    end
    object DebitAccsACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 200
    end
    object DebitAccsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object DebitAccsDatSrc: TDataSource
    DataSet = DebitAccs
    Left = 104
    Top = 88
  end
  object sbcm_tranches: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'sbcm_credit_tranches'
    ParameterMode = pmNamed
    Left = 32
    Top = 152
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
      '     sbcm_contracts cont         '
      ''
      'where'
      'cont.id = :ContractID and '
      'cust.id = cont.customerid'
      'and intr.id# = :ContractID'
      ''
      '')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0043004F004E00540052004100430054004900
      4400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000005000000080000004E0041004D004500010000000000100000004900
      4E005400450052004500530054000100000000000C00000041004D004F005500
      4E00540001000000000010000000430055005200520045004E00430059000100
      000000001400000043005500530054004F004D00450052004900440001000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 232
    Top = 24
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
  object CustAcc: TOracleDataSet
    SQL.Strings = (
      'select clientaccid from sbcm_contract_accounts'
      'where id# = :Contractid')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0043004F004E00540052004100430054004900
      4400030000000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 240
    Top = 80
    object CustAccCLIENTACCID: TFloatField
      FieldName = 'CLIENTACCID'
    end
  end
  object DSSbcm_desc: TDataSource
    DataSet = ODSSbcm_desc
    Left = 568
    Top = 40
  end
  object ODSSbcm_desc: TOracleDataSet
    SQL.Strings = (
      'select * from sbcm_descript where id in(7,8)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000002000000040000004900440001000000000016000000440045005300
      4300520049005000540049004F004E00010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 488
    Top = 40
  end
end
