object LazTrDatMod: TLazTrDatMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 696
  object TransactionsData: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '    l.id,'
      '    cm_common.get_CreditMumber(l.creditid) as NumberOfCredit, '
      '    B.name as Custname,'
      '    ad.acc_no as debitAccno,'
      '    ac.acc_no as CreditAccno,'
      '    avd.val_name as DebitCurrency,'
      '    avc.val_name as CreditCurrency,'
      '    debitamount, '
      
        '    CM_AK_REPORTS.Get_PlanPayment(l.creditid,l.creditoperation,l' +
        '.trdate) as PlanPay,'
      '    l.trdescription,'
      '    l.status'
      '  FROM '
      '     cm_lazytransactions l,'
      '     sb_account ad,'
      '     sb_account ac,'
      '     sb_avalute avd,'
      '     sb_avalute avc,'
      '     cm_boorowerinfo B'
      '  where'
      '      l.debitaccid = ad.id'
      '  and l.creditaccid = ac.id'
      '  and ad.val_acc = avd.valute'
      '  and ac.val_acc = avc.valute'
      '  and l.creditid = B.CreditID'
      '  and l.trdate = :TransactionDate'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' order by :OrderField '
      '   '
      '  '
      ' ')
    Optimize = False
    Variables.Data = {
      0400000002000000200000003A005400520041004E0053004100430054004900
      4F004E0044004100540045000C0000000000000000000000160000003A004F00
      52004400450052004600490045004C0044000100000003000000696400000000
      00}
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 64
    object TransactionsDataID: TFloatField
      DisplayLabel = #8470
      FieldName = 'ID'
      Required = True
    end
    object TransactionsDataNUMBEROFCREDIT: TStringField
      DisplayLabel = #1052#1094#1075#1072#1074#1080#1083#1103#1085#1080#1085' '#8470'-'#1089#1080
      FieldName = 'NUMBEROFCREDIT'
      Size = 4000
    end
    object TransactionsDataCUSTNAME: TStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080
      FieldName = 'CUSTNAME'
      Size = 64
    end
    object TransactionsDataDEBITACCNO: TStringField
      DisplayLabel = #1044#1077#1073#1080#1090
      FieldName = 'DEBITACCNO'
      Required = True
    end
    object TransactionsDataDEBITCURRENCY: TStringField
      DisplayLabel = '$'
      FieldName = 'DEBITCURRENCY'
      Size = 10
    end
    object TransactionsDataCREDITACCNO: TStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090
      FieldName = 'CREDITACCNO'
      Required = True
    end
    object TransactionsDataCREDITCURRENCY: TStringField
      DisplayLabel = '$'
      FieldName = 'CREDITCURRENCY'
      Size = 10
    end
    object TransactionsDataDEBITAMOUNT: TFloatField
      DisplayLabel = #1052#1103#1073#1083#1103#1100
      FieldName = 'DEBITAMOUNT'
    end
    object TransactionsDataPLANPAY: TFloatField
      DisplayLabel = #1070#1076#1103#1081#1103#1078#1103#1081#1080' '#1052#1103#1073#1083#1103#1100
      FieldName = 'PLANPAY'
    end
    object TransactionsDataTRDESCRIPTION: TStringField
      DisplayLabel = #1071#1084#1103#1083#1080#1081#1072#1090#1099#1085' '#1090#1103#1081#1080#1085#1072#1090#1099
      FieldName = 'TRDESCRIPTION'
      Required = True
      Size = 255
    end
    object TransactionsDataSTATUS: TFloatField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'STATUS'
      Required = True
    end
  end
  object Transactions: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CM_DIFFERENCE_TRANSACTIONS'
    ParameterMode = pmNamed
    Left = 40
    Top = 8
  end
  object TransactionsDatSrc: TDataSource
    DataSet = TransactionsData
    Left = 144
    Top = 65
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select rowid, t.*'
      'from cm_usergroups  t')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000003000000040000004900440001000000000016000000440045005300
      4300520049005000540049004F004E0001000000000010000000420041004E00
      4B005F004B004F004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 304
    Top = 24
    object OracleDataSet1ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OracleDataSet1DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 64
    end
    object OracleDataSet1BANK_KOD: TStringField
      FieldName = 'BANK_KOD'
      Size = 12
    end
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 304
    Top = 80
  end
end
