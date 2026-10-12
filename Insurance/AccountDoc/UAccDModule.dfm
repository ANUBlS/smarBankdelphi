object AccountDModule: TAccountDModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 284
  Width = 439
  object Account: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT   '
      
        '   ACCOUNT.RowID, ID, kli_id, op_id, acc_no, val_acc, NAME, open' +
        '_dat, close_dat,'
      
        '   DECODE (close_dat, NULL, 1, 2) AS status, bal_cn1, bal_cn2, b' +
        'al_cn3,'
      
        '   bal_cn4, filial, sim_otcet, tipacc, LIMIT, old_acc_no, pair_a' +
        'cc,'
      '   insider'
      'FROM ACCOUNT'
      'where id=:pid'
      'ORDER BY '
      '   :title')
    Optimize = False
    Variables.Data = {
      04000000020000000C0000003A005400490054004C0045000100000007000000
      6163635F6E6F0000000000080000003A00500049004400030000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      050000001400000004000000490044000100000000000C0000004B004C004900
      5F00490044000100000000000A0000004F0050005F0049004400010000000000
      0C0000004100430043005F004E004F000100000000000E000000560041004C00
      5F00410043004300010000000000080000004E0041004D004500010000000000
      100000004F00500045004E005F00440041005400010000000000120000004300
      4C004F00530045005F004400410054000100000000000C000000530054004100
      5400550053000100000000000E000000420041004C005F0043004E0031000100
      000000000E000000420041004C005F0043004E0032000100000000000E000000
      420041004C005F0043004E0033000100000000000E000000420041004C005F00
      43004E0034000100000000000C000000460049004C00490041004C0001000000
      000012000000530049004D005F004F0054004300450054000100000000000C00
      00005400490050004100430043000100000000000A0000004C0049004D004900
      5400010000000000140000004F004C0044005F004100430043005F004E004F00
      0100000000001000000050004100490052005F00410043004300010000000000
      0E00000049004E0053004900440045005200010000000000}
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 120
    Top = 40
    object AccountID: TFloatField
      FieldName = 'ID'
    end
    object AccountKLI_ID: TFloatField
      FieldName = 'KLI_ID'
      Required = True
    end
    object AccountOP_ID: TFloatField
      FieldName = 'OP_ID'
    end
    object AccountACC_NO: TWideStringField
      DisplayLabel = #1065#1077#1089#1072#1073' '#8470
      FieldName = 'ACC_NO'
      Required = True
    end
    object AccountVAL_ACC: TIntegerField
      DisplayLabel = '$'
      FieldName = 'VAL_ACC'
      Required = True
    end
    object AccountNAME: TWideStringField
      DisplayLabel = #1065#1077#1089#1072#1073#1099#1085' '#1072#1076#1099
      FieldName = 'NAME'
      Size = 90
    end
    object AccountOPEN_DAT: TDateTimeField
      DisplayLabel = #1040#1095#1099#1083#1084#1072' '#1090#1072#1088#1080#1093#1080
      FieldName = 'OPEN_DAT'
      Required = True
    end
    object AccountCLOSE_DAT: TDateTimeField
      DisplayLabel = #1041#1072#1100#1083#1072#1085#1084#1072' '#1090#1072#1088#1080#1093#1080
      FieldName = 'CLOSE_DAT'
    end
    object AccountSTATUS: TFloatField
      FieldName = 'STATUS'
    end
    object AccountBAL_CN1: TFloatField
      DisplayLabel = #1041#1072#1083#1072#1085#1089' '#8470
      FieldName = 'BAL_CN1'
      Required = True
    end
    object AccountBAL_CN2: TFloatField
      FieldName = 'BAL_CN2'
    end
    object AccountBAL_CN3: TFloatField
      FieldName = 'BAL_CN3'
    end
    object AccountBAL_CN4: TFloatField
      FieldName = 'BAL_CN4'
    end
    object AccountFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object AccountSIM_OTCET: TFloatField
      FieldName = 'SIM_OTCET'
    end
    object AccountTIPACC: TWideStringField
      FieldName = 'TIPACC'
    end
    object AccountLIMIT: TFloatField
      FieldName = 'LIMIT'
    end
    object AccountOLD_ACC_NO: TWideStringField
      FieldName = 'OLD_ACC_NO'
    end
    object AccountPAIR_ACC: TFloatField
      FieldName = 'PAIR_ACC'
    end
    object AccountINSIDER: TWideStringField
      FieldName = 'INSIDER'
      Size = 1
    end
  end
  object AccountData: TDataSource
    DataSet = Account
    Left = 48
    Top = 40
  end
  object CreditTransactions: TDataSource
    DataSet = CreditTransactionsData
    Left = 202
    Top = 101
  end
  object CreditTransactionsData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  p.ID,'
      '  p.kredit as CreditAccID,'
      '  p.dat as OperationDate,'
      '  p.ammount as DebitAmount,'
      '  p.ammount_c as CreditAmount,'
      '  p.lammount as LAmount,'
      '  ad.acc_no as DebitAccNo,'
      '  p.NAME as Destination'
      'from'
      '  SMART.provarch p,'
      '  SMART.account ad'
      'where'
      '  (p.kredit = :AccountID)'
      '  and (p.dat between :StartDate and :EndDate)'
      '  and (ad.id = p.debt)'
      'order by p.dat')
    Optimize = False
    Variables.Data = {
      0400000003000000140000003A00530054004100520054004400410054004500
      0C0000000000000000000000100000003A0045004E0044004400410054004500
      0C0000000000000000000000140000003A004100430043004F0055004E005400
      49004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000008000000040000004900440001000000000016000000430052004500
      440049005400410043004300490044000100000000001A0000004F0050004500
      52004100540049004F004E004400410054004500010000000000160000004400
      450042004900540041004D004F0055004E005400010000000000180000004300
      5200450044004900540041004D004F0055004E0054000100000000000E000000
      4C0041004D004F0055004E005400010000000000140000004400450042004900
      54004100430043004E004F000100000000001600000044004500530054004900
      4E004100540049004F004E00010000000000}
    MasterFields = 'ACCID'
    DetailFields = 'CreditAccID'
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 203
    Top = 147
    object CreditTransactionsDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object IntegerField1: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'RowNumber'
      Calculated = True
    end
    object CreditTransactionsDataCREDITACCID: TFloatField
      FieldName = 'CREDITACCID'
    end
    object CreditTransactionsDataOPERATIONDATE: TDateTimeField
      FieldName = 'OPERATIONDATE'
    end
    object CreditTransactionsDataDEBITAMOUNT: TFloatField
      FieldName = 'DEBITAMOUNT'
      currency = True
    end
    object CreditTransactionsDataCREDITAMOUNT: TFloatField
      FieldName = 'CREDITAMOUNT'
      currency = True
    end
    object CreditTransactionsDataLAMOUNT: TFloatField
      FieldName = 'LAMOUNT'
      currency = True
    end
    object CreditTransactionsDataDEBITACCNO: TWideStringField
      FieldName = 'DEBITACCNO'
    end
    object CreditTransactionsDataDESTINATION: TWideStringField
      FieldName = 'DESTINATION'
      Size = 255
    end
    object CreditTransactionsDataCreditAccNo: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'CreditAccNo'
      Size = 32
      Calculated = True
    end
  end
  object DebetTransactionsData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  p.ID,'
      '  p.debt as DebitAccID,'
      '  p.dat as OperationDate,'
      '  p.ammount as DebitAmount,'
      '  p.ammount_c as CreditAmount,'
      '  p.lammount as LAmount,'
      '  ac.acc_no as CreditAccNo,'
      '  p.NAME as Destination'
      'from'
      '  SMART.provarch p,'
      '  SMART.account ac'
      'where'
      '  (p.dat between :StartDate and :EndDate)'
      '  and (p.debt = :AccountID)'
      '  and (ac.id = p.kredit)'
      'order by p.dat'
      ' ')
    Optimize = False
    Variables.Data = {
      0400000003000000140000003A00530054004100520054004400410054004500
      0C0000000000000000000000100000003A0045004E0044004400410054004500
      0C0000000000000000000000140000003A004100430043004F0055004E005400
      49004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000008000000040000004900440001000000000014000000440045004200
      49005400410043004300490044000100000000001A0000004F00500045005200
      4100540049004F004E0044004100540045000100000000001600000044004500
      42004900540041004D004F0055004E0054000100000000001800000043005200
      450044004900540041004D004F0055004E0054000100000000000E0000004C00
      41004D004F0055004E0054000100000000001600000043005200450044004900
      54004100430043004E004F000100000000001600000044004500530054004900
      4E004100540049004F004E00010000000000}
    DetailFields = 'DebitAccID'
    QueryAllRecords = False
    CountAllRecords = True
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 36
    Top = 151
    object DebetTransactionsDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DebetTransactionsDataDEBITACCID: TFloatField
      FieldName = 'DEBITACCID'
    end
    object DebetTransactionsDataOPERATIONDATE: TDateTimeField
      FieldName = 'OPERATIONDATE'
    end
    object DebetTransactionsDataDEBITAMOUNT: TFloatField
      FieldName = 'DEBITAMOUNT'
      currency = True
    end
    object DebetTransactionsDataCREDITAMOUNT: TFloatField
      FieldName = 'CREDITAMOUNT'
      currency = True
    end
    object DebetTransactionsDataLAMOUNT: TFloatField
      FieldName = 'LAMOUNT'
      currency = True
    end
    object DebetTransactionsDataCREDITACCNO: TWideStringField
      FieldName = 'CREDITACCNO'
    end
    object DebetTransactionsDataDESTINATION: TWideStringField
      FieldName = 'DESTINATION'
      Size = 255
    end
    object DebetTransactionsDataRowNumber: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'RowNumber'
      Calculated = True
    end
    object DebetTransactionsDataDebitAccNo: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'DebitAccNo'
      Size = 32
      Calculated = True
    end
  end
  object DebetTransactions: TDataSource
    DataSet = DebetTransactionsData
    Left = 38
    Top = 104
  end
end
