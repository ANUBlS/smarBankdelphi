object TransactionDataModule: TTransactionDataModule
  OldCreateOrder = False
  Height = 443
  Width = 799
  object Sysdat: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select tek_dat from sysdat')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 8
  end
  object TransactionsData: TDataSource
    DataSet = Transactions
    Left = 32
    Top = 80
  end
  object DataSysdat: TDataSource
    DataSet = Sysdat
    Left = 211
    Top = 64
  end
  object DebitCurrency: TDataSource
    DataSet = DebitCurrencyData
    Left = 346
    Top = 57
  end
  object DebitCurrencyData: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select'
      '  currency.valute as ID,'
      '  currency.val_name as SName,'
      '  currency.valu_name as Name,'
      '  rates.OSTAT as Rate'
      'from'
      '  avalute currency,'
      '  TEMPRATE rates'
      'where'
      '  rates.VAL_KOD = currency.VALUTE'
      'order by currency.valute')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000400000004000000490044000100000000000A00000053004E004100
      4D004500010000000000080000004E0041004D00450001000000000008000000
      5200410054004500010000000000}
    ReadOnly = True
    Session = sboapiDataModule.SBSession
    Active = True
    AfterScroll = DebitCurrencyDataAfterScroll
    Left = 344
    Top = 9
    object DebitCurrencyDataID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object DebitCurrencyDataSNAME: TWideStringField
      FieldName = 'SNAME'
      Size = 10
    end
    object DebitCurrencyDataNAME: TWideStringField
      FieldName = 'NAME'
      Size = 25
    end
    object DebitCurrencyDataRATE: TFloatField
      FieldName = 'RATE'
    end
  end
  object CreditCurrency: TDataSource
    DataSet = CreditCurrencyData
    Left = 448
    Top = 65
  end
  object CreditCurrencyData: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select'
      '  currency.valute as ID,'
      '  currency.val_name as SName,'
      '  currency.valu_name as Name,'
      '  rates.OSTAT as Rate'
      'from'
      '  avalute currency,'
      '  TEMPRATE rates'
      'where'
      '  rates.VAL_KOD = currency.VALUTE'
      'order by currency.valute')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000400000004000000490044000100000000000A00000053004E004100
      4D004500010000000000080000004E0041004D00450001000000000008000000
      5200410054004500010000000000}
    ReadOnly = True
    Session = sboapiDataModule.SBSession
    Active = True
    AfterScroll = CreditCurrencyDataAfterScroll
    Left = 448
    Top = 9
    object CreditCurrencyDataID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object CreditCurrencyDataSNAME: TWideStringField
      FieldName = 'SNAME'
      Size = 10
    end
    object CreditCurrencyDataNAME: TWideStringField
      FieldName = 'NAME'
      Size = 25
    end
    object CreditCurrencyDataRATE: TFloatField
      FieldName = 'RATE'
    end
  end
  object DebitAccs: TDataSource
    DataSet = DebitAccData
    Left = 410
    Top = 173
  end
  object DebitAccData: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  A.ID,'
      '  A.ACC_NO,'
      '  A.VAL_ACC,'
      '  A.NAME,'
      '  B.BAL_CN,'
      '  B.CASHINCOMING AS ISCACHEACCOUNT,'
      '  T.Ostat,'
      '  T.Pok_OSTAT,'
      '  nvl(b.fromTrans,0) fromTrans'
      'FROM'
      '  ACCOUNT A'
      ' ,BAL_SPR1 B'
      ' ,Tenostat T '
      'WHERE'
      '  A.BAL_CN1 = B.BAL_CN'
      '  AND'
      '  A.CLOSE_DAT IS NULL and '
      '  A.id=T.ACC_ID and a.id=:v_id'
      'ORDER BY ACC_NO ')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A0056005F004900440003000000040000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000900000004000000490044000100000000000C000000410043004300
      5F004E004F000100000000000E000000560041004C005F004100430043000100
      00000000080000004E0041004D0045000100000000001C000000490053004300
      41004300480045004100430043004F0055004E0054000100000000000A000000
      4F0053005400410054000100000000001200000050004F004B005F004F005300
      5400410054000100000000000C000000420041004C005F0043004E0001000000
      000012000000460052004F004D005400520041004E005300010000000000}
    Session = sboapiDataModule.SBSession
    AfterScroll = DebitAccDataAfterScroll
    Left = 407
    Top = 125
    object DebitAccDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DebitAccDataACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 28
    end
    object DebitAccDataVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
      Required = True
    end
    object DebitAccDataNAME: TWideStringField
      DisplayWidth = 90
      FieldName = 'NAME'
      Size = 200
    end
    object DebitAccDataISCACHEACCOUNT: TFloatField
      FieldName = 'ISCACHEACCOUNT'
    end
    object DebitAccDataBALANCE: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'BALANCE'
      LookupDataSet = DebitAccRestData
      LookupKeyFields = 'ACC_ID'
      LookupResultField = 'OSTAT'
      KeyFields = 'ID'
      Lookup = True
    end
    object DebitAccDataLBALANCE: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'LBALANCE'
      LookupDataSet = DebitAccRestData
      LookupKeyFields = 'ACC_ID'
      LookupResultField = 'POK_OSTAT'
      KeyFields = 'ID'
      Lookup = True
    end
    object DebitAccDataOSTAT: TFloatField
      FieldName = 'OSTAT'
    end
    object DebitAccDataPOK_OSTAT: TFloatField
      FieldName = 'POK_OSTAT'
    end
    object DebitAccDataBAL_CN: TFloatField
      FieldName = 'BAL_CN'
    end
    object DebitAccDataFROMTRANS: TFloatField
      FieldName = 'FROMTRANS'
    end
  end
  object CreditAccData: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  A.ID,'
      '  A.ACC_NO,'
      '  A.VAL_ACC,'
      '  A.NAME,'
      '  B.BAL_CN,'
      '  B.CASHINCOMING AS ISCACHEACCOUNT,'
      '  T.Ostat,'
      '  T.Pok_OSTAT,'
      '  nvl(b.fromTrans,0) fromTrans'
      'FROM'
      '  ACCOUNT A'
      ' ,BAL_SPR1 B'
      ' ,Tenostat T  '
      'WHERE  '
      '  A.BAL_CN1 = B.BAL_CN'
      '  AND'
      '  A.CLOSE_DAT IS NULL and '
      '  A.id=T.ACC_ID and a.id=:v_id'
      ''
      'ORDER BY ACC_NO')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A0056005F004900440003000000040000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000900000004000000490044000100000000000C000000410043004300
      5F004E004F000100000000000E000000560041004C005F004100430043000100
      00000000080000004E0041004D0045000100000000001C000000490053004300
      41004300480045004100430043004F0055004E0054000100000000000A000000
      4F0053005400410054000100000000001200000050004F004B005F004F005300
      5400410054000100000000000C000000420041004C005F0043004E0001000000
      000012000000460052004F004D005400520041004E005300010000000000}
    Session = sboapiDataModule.SBSession
    AfterScroll = CreditAccDataAfterScroll
    Left = 514
    Top = 133
    object CreditAccDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CreditAccDataACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 28
    end
    object CreditAccDataVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
      Required = True
    end
    object CreditAccDataNAME: TWideStringField
      FieldName = 'NAME'
      Size = 200
    end
    object CreditAccDataISCACHEACCOUNT: TFloatField
      FieldName = 'ISCACHEACCOUNT'
    end
    object CreditAccDataBALANCE: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'BALANCE'
      LookupDataSet = CreditAccRestData
      LookupKeyFields = 'ACC_ID'
      LookupResultField = 'OSTAT'
      KeyFields = 'ID'
      Lookup = True
    end
    object CreditAccDataLBALANCE: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'LBALANCE'
      LookupDataSet = CreditAccRestData
      LookupKeyFields = 'ACC_ID'
      LookupResultField = 'POK_OSTAT'
      KeyFields = 'ID'
      Lookup = True
    end
    object CreditAccDataOSTAT: TFloatField
      FieldName = 'OSTAT'
    end
    object CreditAccDataPOK_OSTAT: TFloatField
      FieldName = 'POK_OSTAT'
    end
    object CreditAccDataBAL_CN: TFloatField
      FieldName = 'BAL_CN'
    end
    object CreditAccDataFROMTRANS: TFloatField
      FieldName = 'FROMTRANS'
    end
  end
  object CreditAccs: TDataSource
    DataSet = CreditAccData
    Left = 514
    Top = 189
  end
  object ConvertationSymbols: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select * from CONVERT_ASSIGNMENTS'
      'order by ID'
      '')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 368
  end
  object ConvertationSymbolsData: TDataSource
    DataSet = ConvertationSymbols
    Left = 168
    Top = 360
  end
  object CashSymbols: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT'
      '  symbol,'
      '  name,'
      '  mediocrity'
      'FROM'
      '  kassa_b'
      'order by symbol ')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 120
  end
  object CashSymbolsData: TDataSource
    DataSet = CashSymbols
    Left = 208
    Top = 176
  end
  object Currency: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'Select valute from Avalute')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 264
    Top = 8
  end
  object OperationTypes: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select'
      '  *'
      'from'
      '  vid_op'
      'where'
      '  id>=0'
      'order by id')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 264
    Top = 64
  end
  object OperationTypesData: TDataSource
    DataSet = OperationTypes
    Left = 264
    Top = 120
  end
  object Transactions: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  p.ID,'
      '  P.rowid,'
      '  p.OP_ID as OperatorID,'
      '  p.no_prov as OperationNo,'
      '  p.dat as TransactionDate,'
      '  p.DEBT as DebitID,'
      '  ad.ACC_NO as DebitAccNo,'
      '  p.VAL_ACC as DebitCurrencyID,'
      '  dc.val_name as DebitCurrencySName,'
      '  ad.filial as DebitBranch,'
      '  p.KREDIT as CreditID,'
      '  ac.ACC_NO as CreditAccNo,'
      '  p.CurrencyID_C as CreditCurrencyID,'
      '  cc.val_name as CreditCurrencySName,'
      '  ac.filial as CreditBranch,'
      '  p.ammount as DebitAmount,'
      '  p.Ammount_C as CreditAmount,'
      '  p.LAmmount as LAmount,'
      '  p.Rate_D as DebitRate,'
      '  p.Rate_C as CreditRate,'
      '  p.Bank_D as DebitBank,'
      '  p.Bank_K as CreditBank,'
      '  p.NO_PACK as PackageNumber,'
      '  p.SHIFR as CYPHERCODE,'
      
        '  sb_expertanalyse.getoperationtype(p.vid_op, p.val_acc, p.curre' +
        'ncyID_c) as OPERATIONCODE,'
      '  p.Kassa_B as INBALANCECHAR,'
      '  p.Kassa_Z as OUTBALANCECHAR,'
      '  p.NO_FILIAL as FilialID,'
      '  ad.bal_cn1 as DebitBalance,'
      '  p.Name,'
      '  sb_aca.getuserbyid(p.op_id) as usr ,'
      '  sb_aca.getuserbyid(p.commit_opid) as usrcommit ,'
      '  0 as Flags,'
      '  2 as status,'
      '  '#39#39' as REJECT_REASON,'
      '  p.reportid,'
      '  p.countrid,'
      '  p.d1'
      ''
      'FROM'
      '    account ad,'
      '    account ac,'
      '    avalute dc,'
      '    avalute cc,'
      '    provarch p'
      'where'
      '    p.dat =:TransactionDate'
      '    and (ad.ID = p.DEBT)'
      '    and (ac.ID = p.KREDIT)'
      '    and (ad.val_acc = p.val_acc)'
      '    and (ac.val_acc = p.CurrencyID_C)'
      '    and (dc.VALUTE = p.val_acc)'
      '    and (cc.VALUTE = p.CurrencyID_C)'
      '    and ((P.OP_ID<>-1 and'
      
        '          not EXISTS(select SUSER from sba_userman where MUSER=u' +
        'id and (type#=1 or type#=0)))'
      '          or'
      
        '          (P.OP_ID in(select SUSER from sba_userman where MUSER=' +
        'uid and (type#=1 or type#=0))))'
      ''
      'union all'
      ''
      'SELECT'
      '  p.ID,'
      '  P.rowid,'
      '  p.OP_ID as OperatorID,'
      '  p.no_prov as OperationNo,'
      '  p.dat as TransactionDate,'
      '  p.DEBT as DebitID,'
      '  ad.ACC_NO as DebitAccNo,'
      '  p.VAL_ACC as DebitCurrencyID,'
      '  dc.val_name as DebitCurrencySName,'
      '  ad.filial as DebitBranch,'
      '  p.KREDIT as CreditID,'
      '  ac.ACC_NO as CreditAccNo,'
      '  p.CurrencyID_C as CreditCurrencyID,'
      '  cc.val_name as CreditCurrencySName,'
      '  ac.filial as CreditBranch,'
      '  p.ammount as DebitAmount,'
      '  p.Ammount_C as CreditAmount,'
      '  p.LAmmount as LAmount,'
      '  p.Rate_D as DebitRate,'
      '  p.Rate_C as CreditRate,'
      '  p.Bank_D as DebitBank,'
      '  p.Bank_K as CreditBank,'
      '  p.NO_PACK as PackageNumber,'
      '  p.SHIFR as CYPHERCODE,'
      
        '  sb_expertanalyse.getoperationtype(p.vid_op, p.val_acc, p.curre' +
        'ncyID_c) as OPERATIONCODE,'
      '  p.Kassa_B as INBALANCECHAR,'
      '  p.Kassa_Z as OUTBALANCECHAR,'
      '  p.NO_FILIAL as FilialID,'
      '  ad.bal_cn1 as DebitBalance,'
      '  p.Name,'
      '  sb_aca.getuserbyid(p.op_id) as usr ,'
      '  '#39#39' as usrcommit ,'
      ''
      '  0 as Flags,'
      '  decode(Rejected, 0, 1, 3) as status,'
      '  RejectReason as REJECT_REASON,'
      '  p.reportid,'
      '  p.countrid,'
      '  p.d1'
      ''
      ''
      'FROM'
      '    account ad,'
      '    account ac,'
      '    avalute dc,'
      '    avalute cc,'
      '    LAZYTRANSACTION p'
      'where'
      '    p.dat =:TransactionDate'
      '    and (ad.ID = p.DEBT)'
      '    and (ac.ID = p.KREDIT)'
      '    and (dc.VALUTE = p.val_acc)'
      '    and (cc.VALUTE = p.CurrencyID_C)'
      '  and ((P.OP_ID<>-1 and'
      
        '        not EXISTS(select SUSER from sba_userman where MUSER=uid' +
        ' and (type#=1 or type#=0)))'
      '        or'
      
        '        (P.OP_ID in(select SUSER from sba_userman where MUSER=ui' +
        'd and (type#=1 or type#=0))))'
      ''
      'Order by :Title')
    Optimize = False
    Variables.Data = {
      0400000002000000200000003A005400520041004E0053004100430054004900
      4F004E0044004100540045000C00000000000000000000000C0000003A005400
      490054004C004500010000000C0000004F7065726174696F6E4E6F0000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000250000000400000049004400010000000000140000004F0050004500
      5200410054004F00520049004400010000000000160000004F00500045005200
      4100540049004F004E004E004F000100000000001E0000005400520041004E00
      530041004300540049004F004E0044004100540045000100000000000E000000
      4400450042004900540049004400010000000000140000004400450042004900
      54004100430043004E004F000100000000001E00000044004500420049005400
      430055005200520045004E004300590049004400010000000000240000004400
      4500420049005400430055005200520045004E004300590053004E0041004D00
      450001000000000016000000440045004200490054004200520041004E004300
      4800010000000000100000004300520045004400490054004900440001000000
      0000160000004300520045004400490054004100430043004E004F0001000000
      000020000000430052004500440049005400430055005200520045004E004300
      5900490044000100000000002600000043005200450044004900540043005500
      5200520045004E004300590053004E0041004D00450001000000000018000000
      4300520045004400490054004200520041004E00430048000100000000001600
      00004400450042004900540041004D004F0055004E0054000100000000001800
      000043005200450044004900540041004D004F0055004E005400010000000000
      0E0000004C0041004D004F0055004E0054000100000000001200000044004500
      4200490054005200410054004500010000000000140000004300520045004400
      4900540052004100540045000100000000001200000044004500420049005400
      420041004E004B00010000000000140000004300520045004400490054004200
      41004E004B000100000000001A0000005000410043004B004100470045004E00
      55004D0042004500520001000000000014000000430059005000480045005200
      43004F00440045000100000000001A0000004F00500045005200410054004900
      4F004E0043004F00440045000100000000001A00000049004E00420041004C00
      41004E004300450043004800410052000100000000001C0000004F0055005400
      420041004C0041004E0043004500430048004100520001000000000010000000
      460049004C00490041004C004900440001000000000018000000440045004200
      49005400420041004C0041004E0043004500010000000000080000004E004100
      4D004500010000000000060000005500530052000100000000000A0000004600
      4C004100470053000100000000000C0000005300540041005400550053000100
      000000001A000000520045004A004500430054005F0052004500410053004F00
      4E00010000000000100000005200450050004F00520054004900440001000000
      00001000000043004F0055004E00540052004900440001000000000012000000
      55005300520043004F004D004D00490054000100000000000400000044003100
      010000000000}
    QueryAllRecords = False
    OnApplyRecord = TransactionsApplyRecord
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 24
    object TransactionsID: TFloatField
      DisplayLabel = #8470
      FieldName = 'ID'
    end
    object TransactionsOPERATORID: TFloatField
      FieldName = 'OPERATORID'
    end
    object TransactionsOPERATIONNO: TWideStringField
      FieldName = 'OPERATIONNO'
      Size = 8
    end
    object TransactionsTRANSACTIONDATE: TDateTimeField
      DisplayLabel = #1058#1072#1088#1080#1093
      FieldName = 'TRANSACTIONDATE'
    end
    object TransactionsDEBITID: TFloatField
      FieldName = 'DEBITID'
    end
    object TransactionsDEBITACCNO: TWideStringField
      DisplayLabel = 'Debet'
      FieldName = 'DEBITACCNO'
      Size = 28
    end
    object TransactionsDEBITCURRENCYID: TFloatField
      FieldName = 'DEBITCURRENCYID'
    end
    object TransactionsDEBITCURRENCYSNAME: TWideStringField
      DisplayLabel = '$'
      FieldName = 'DEBITCURRENCYSNAME'
      Size = 10
    end
    object TransactionsCREDITID: TFloatField
      FieldName = 'CREDITID'
    end
    object TransactionsCREDITACCNO: TWideStringField
      DisplayLabel = 'Kredit'
      FieldName = 'CREDITACCNO'
      Size = 28
    end
    object TransactionsCREDITCURRENCYSNAME: TWideStringField
      DisplayLabel = '$'
      FieldName = 'CREDITCURRENCYSNAME'
      Size = 10
    end
    object TransactionsDEBITAMOUNT: TFloatField
      DisplayLabel = #1044#1077#1073#1077#1090' '#1084#1103#1073#1083#1103#1100
      FieldName = 'DEBITAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object TransactionsCREDITAMOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090' '#1084#1103#1073#1083#1103#1100
      FieldName = 'CREDITAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object TransactionsDEBITRATE: TFloatField
      FieldName = 'DEBITRATE'
    end
    object TransactionsCREDITRATE: TFloatField
      FieldName = 'CREDITRATE'
    end
    object TransactionsLAMOUNT: TFloatField
      DisplayLabel = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
      FieldName = 'LAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object TransactionsDEBITBANK: TFloatField
      FieldName = 'DEBITBANK'
    end
    object TransactionsCREDITBANK: TFloatField
      FieldName = 'CREDITBANK'
    end
    object TransactionsUSR: TWideStringField
      FieldName = 'USR'
      Size = 4000
    end
    object TransactionsDEBITBRANCH: TIntegerField
      FieldName = 'DEBITBRANCH'
    end
    object TransactionsCREDITBRANCH: TIntegerField
      FieldName = 'CREDITBRANCH'
    end
    object TransactionsCYPHERCODE: TIntegerField
      FieldName = 'CYPHERCODE'
    end
    object TransactionsOPERATIONCODE: TFloatField
      FieldName = 'OPERATIONCODE'
    end
    object TransactionsINBALANCECHAR: TWideStringField
      FieldName = 'INBALANCECHAR'
      Size = 5
    end
    object TransactionsOUTBALANCECHAR: TIntegerField
      FieldName = 'OUTBALANCECHAR'
    end
    object TransactionsFILIALID: TIntegerField
      FieldName = 'FILIALID'
    end
    object TransactionsDEBITBALANCE: TFloatField
      FieldName = 'DEBITBALANCE'
    end
    object TransactionsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 255
    end
    object TransactionsFLAGS: TFloatField
      FieldName = 'FLAGS'
    end
    object TransactionsSTATUS: TFloatField
      FieldName = 'STATUS'
    end
    object TransactionsREJECT_REASON: TWideStringField
      FieldName = 'REJECT_REASON'
      Size = 255
    end
    object TransactionsPACKAGENUMBER: TIntegerField
      FieldName = 'PACKAGENUMBER'
    end
    object TransactionsCREDITCURRENCYID: TIntegerField
      FieldName = 'CREDITCURRENCYID'
    end
    object TransactionsREPORTID: TFloatField
      FieldName = 'REPORTID'
    end
    object TransactionsCOUNTRID: TFloatField
      FieldName = 'COUNTRID'
    end
    object TransactionsUSRCOMMIT: TWideStringField
      FieldName = 'USRCOMMIT'
      Size = 4000
    end
    object TransactionsD1: TWideStringField
      FieldName = 'D1'
      Size = 80
    end
  end
  object DebitBranch: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select * from filial order by ID')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 421
    Top = 288
  end
  object DebitBranchData: TDataSource
    DataSet = DebitBranch
    Left = 416
    Top = 344
  end
  object CreditBranch: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select * from filial order by ID')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 504
    Top = 288
  end
  object CreditBranchData: TDataSource
    DataSet = CreditBranch
    Left = 504
    Top = 344
  end
  object UsersData: TDataSource
    DataSet = Users
    Left = 88
    Top = 316
  end
  object Users: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select * from user$'
      'where sb_aca.checkLockUser_num(name)=0'
      '      order by name')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 316
  end
  object Operations: TOracleQuery
    SQL.Strings = (
      'SELECT '
      '   id, name'
      'FROM '
      '   vid_op'
      'Order by'
      '   ID'
      '')
    Session = sboapiDataModule.SBSession
    Optimize = False
    Threaded = True
    OnThreadRecord = OperationsThreadRecord
    Left = 296
    Top = 188
  end
  object Valute: TOracleQuery
    SQL.Strings = (
      'select valute,valu_name from avalute order by valute')
    Session = sboapiDataModule.SBSession
    Optimize = False
    Threaded = True
    OnThreadRecord = ValuteThreadRecord
    Left = 352
    Top = 188
  end
  object SBTransaction: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SB_TRANSACTION'
    ParameterMode = pmNamed
    Left = 632
    Top = 296
  end
  object Commission: TOracleDataSet
    SQL.Strings = (
      'select'
      '    id'
      '   ,name'
      '   ,debt'
      
        '   ,sb_complex_transactions.getaccountnumber(debt) as DebitAccou' +
        'nt'
      
        '   ,sb_complex_transactions.GetAccountCurrency(debt) as DebitCur' +
        'rency'
      
        '   ,sb_complex_transactions.getaccountcurrencyid(debt) as DebitC' +
        'urrencyID'
      '   ,credit'
      
        '   ,sb_complex_transactions.getaccountnumber(credit) as CreditAc' +
        'count'
      
        '   ,sb_complex_transactions.GetAccountCurrency(credit) as Credit' +
        'Currency'
      
        '   ,sb_complex_transactions.getaccountcurrencyid(credit) as Cred' +
        'itCurrencyID   '
      '   ,additionalDebt'
      
        '   ,sb_complex_transactions.getaccountnumber(additionalDebt) as ' +
        'ADebitAccount'
      
        '   ,sb_complex_transactions.GetAccountCurrency(additionalDebt) a' +
        's ADebitCurrency'
      
        '   ,sb_complex_transactions.getaccountcurrencyid(additionalDebt)' +
        ' as AddDebitCurrencyID      '
      '   ,additionalCredit'
      
        '   ,sb_complex_transactions.getaccountnumber(additionalCredit) a' +
        's ACreditAccount'
      
        '   ,sb_complex_transactions.GetAccountCurrency(additionalCredit)' +
        ' as ACreditCurrency'
      
        '   ,sb_complex_transactions.getaccountcurrencyid(additionalCredi' +
        't) as AddCreditCurrencyID         '
      '   ,assignment'
      '   ,commisionassignment'
      '   ,UserID   '
      'from'
      '    commision_trans'
      'where'
      '   UserID = 0 or'
      '    UserID = (SBLogin.UserID)'
      'order by'
      '    name  ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000150000000400000049004400010000000000080000004E0041004D00
      4500010000000000080000004400450042005400010000000000180000004400
      45004200490054004100430043004F0055004E0054000100000000001A000000
      44004500420049005400430055005200520045004E0043005900010000000000
      1E00000044004500420049005400430055005200520045004E00430059004900
      44000100000000000C0000004300520045004400490054000100000000001A00
      00004300520045004400490054004100430043004F0055004E00540001000000
      00001C000000430052004500440049005400430055005200520045004E004300
      5900010000000000200000004300520045004400490054004300550052005200
      45004E0043005900490044000100000000001C00000041004400440049005400
      49004F004E0041004C0044004500420054000100000000001A00000041004400
      45004200490054004100430043004F0055004E0054000100000000001C000000
      410044004500420049005400430055005200520045004E004300590001000000
      0000240000004100440044004400450042004900540043005500520052004500
      4E00430059004900440001000000000020000000410044004400490054004900
      4F004E0041004C004300520045004400490054000100000000001C0000004100
      4300520045004400490054004100430043004F0055004E005400010000000000
      1E0000004100430052004500440049005400430055005200520045004E004300
      5900010000000000260000004100440044004300520045004400490054004300
      55005200520045004E0043005900490044000100000000001400000041005300
      5300490047004E004D0045004E0054000100000000002600000043004F004D00
      4D004900530049004F004E00410053005300490047004E004D0045004E005400
      0100000000000C000000550053004500520049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 280
    Top = 312
    object CommissionID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CommissionNAME: TWideStringField
      FieldName = 'NAME'
      Size = 150
    end
    object CommissionDEBT: TFloatField
      FieldName = 'DEBT'
    end
    object CommissionDEBITACCOUNT: TWideStringField
      FieldName = 'DEBITACCOUNT'
      Size = 4000
    end
    object CommissionDEBITCURRENCY: TWideStringField
      FieldName = 'DEBITCURRENCY'
      Size = 4000
    end
    object CommissionDEBITCURRENCYID: TFloatField
      FieldName = 'DEBITCURRENCYID'
    end
    object CommissionCREDIT: TFloatField
      FieldName = 'CREDIT'
    end
    object CommissionCREDITACCOUNT: TWideStringField
      FieldName = 'CREDITACCOUNT'
      Size = 4000
    end
    object CommissionCREDITCURRENCY: TWideStringField
      FieldName = 'CREDITCURRENCY'
      Size = 4000
    end
    object CommissionCREDITCURRENCYID: TFloatField
      FieldName = 'CREDITCURRENCYID'
    end
    object CommissionADDITIONALDEBT: TFloatField
      FieldName = 'ADDITIONALDEBT'
    end
    object CommissionADEBITACCOUNT: TWideStringField
      FieldName = 'ADEBITACCOUNT'
      Size = 4000
    end
    object CommissionADEBITCURRENCY: TWideStringField
      FieldName = 'ADEBITCURRENCY'
      Size = 4000
    end
    object CommissionADDITIONALCREDIT: TFloatField
      FieldName = 'ADDITIONALCREDIT'
    end
    object CommissionACREDITACCOUNT: TWideStringField
      FieldName = 'ACREDITACCOUNT'
      Size = 4000
    end
    object CommissionACREDITCURRENCY: TWideStringField
      FieldName = 'ACREDITCURRENCY'
      Size = 4000
    end
    object CommissionADDDEBITCURRENCYID: TFloatField
      FieldName = 'ADDDEBITCURRENCYID'
    end
    object CommissionADDCREDITCURRENCYID: TFloatField
      FieldName = 'ADDCREDITCURRENCYID'
    end
    object CommissionASSIGNMENT: TWideStringField
      FieldName = 'ASSIGNMENT'
      Size = 300
    end
    object CommissionCOMMISIONASSIGNMENT: TWideStringField
      FieldName = 'COMMISIONASSIGNMENT'
      Size = 300
    end
    object CommissionUSERID: TFloatField
      FieldName = 'USERID'
    end
  end
  object CommissionData: TDataSource
    DataSet = Commission
    Left = 280
    Top = 360
  end
  object SBComplexTrans: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SB_COMPLEX_TRANSACTIONS'
    ParameterMode = pmNamed
    Left = 688
    Top = 256
  end
  object Destinations: TOracleDataSet
    SQL.Strings = (
      'select d.*, d.rowid from TRDESTINATION d'
      'order by name')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 128
    Top = 16
  end
  object DestinationsData: TDataSource
    DataSet = Destinations
    Left = 128
    Top = 72
  end
  object DebitAccRestData: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  ACC_ID'
      ' ,Ostat'
      ' ,Pok_ostat'
      'from'
      '  Tenostat'
      'where'
      '  acc_id =:acc_id'
      ' '
      ' ')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A004100430043005F0049004400030000000400
      00006F09000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000030000000C0000004100430043005F00490044000100000000000A00
      00004F0053005400410054000100000000001200000050004F004B005F004F00
      5300540041005400010000000000}
    Master = DebitAccData
    MasterFields = 'ID'
    DetailFields = 'ACC_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    AfterScroll = DebitAccRestDataAfterScroll
    Left = 416
    Top = 232
  end
  object CreditAccRestData: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  ACC_ID'
      ' ,Ostat'
      ' ,Pok_ostat'
      'from'
      '  Tenostat'
      'where'
      '  acc_id =:acc_id'
      ' '
      ' ')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A004100430043005F0049004400030000000000
      000000000000}
    Master = CreditAccData
    MasterFields = 'ID'
    DetailFields = 'ACC_ID'
    Session = sboapiDataModule.SBSession
    AfterScroll = CreditAccRestDataAfterScroll
    Left = 506
    Top = 241
  end
  object ReportDesc: TOracleDataSet
    SQL.Strings = (
      'select d.*, d.rowid from reportdescs d'
      'order by name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 126
    Top = 192
  end
  object ReportDescsData: TDataSource
    DataSet = ReportDesc
    Left = 32
    Top = 208
  end
  object Country: TOracleDataSet
    SQL.Strings = (
      'select d.*, d.rowid from provcountries d'
      'order by name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 126
    Top = 128
  end
  object CountryData: TDataSource
    DataSet = Country
    Left = 32
    Top = 152
  end
  object SB_ACA: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SB_ACA'
    Left = 584
    Top = 360
  end
  object BProcData: TOracleDataSet
    SQL.Strings = (
      'select * from sb_business_processes'
      'order by name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 536
    Top = 8
    object BProcDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object BProcDataNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 127
    end
  end
  object BProc: TDataSource
    DataSet = BProcData
    Left = 536
    Top = 64
  end
  object BPTransData: TOracleDataSet
    SQL.Strings = (
      
        'select b.trdate , ad.acc_no debtacc, ac.acc_no kredacc, b.natamo' +
        'unt, b.trdescription'
      '  from sb_business_proc_trans b, account ad, account ac'
      ' where ((ad.id = b.debitaccid) and (ac.id = b.creditaccid))')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000050000000C0000005400520044004100540045000100000000000E00
      000044004500420054004100430043000100000000000E0000004B0052004500
      4400410043004300010000000000120000004E004100540041004D004F005500
      4E0054000100000000001A000000540052004400450053004300520049005000
      540049004F004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 600
    Top = 160
  end
  object BPTrans: TDataSource
    DataSet = BPTransData
    Left = 600
    Top = 224
  end
  object PACKBPROC: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'P_BUSINESS_PROC'
    Left = 632
    Top = 344
  end
  object ODS_StatusT: TOracleDataSet
    SQL.Strings = (
      'select s.RowID, s.* from Settings s'
      'where upper(name)='#39'TRANSACTION_STATUST'#39)
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000007000000040000004900440001000000000010000000500041005200
      45004E00540049004400010000000000080000004E0041004D00450001000000
      0000160000004400450053004300520049005000540049004F004E0001000000
      00000A000000560041004C005500450001000000000012000000560041004C00
      550045004C004900530054000100000000002400000044004900530050004C00
      410059005F00560041004C00550045005F004C00490053005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 264
  end
  object ODS_VidOPTrDel: TOracleDataSet
    SQL.Strings = (
      'select count(0) Cnt from vid_OP'
      'where ID =:v_ID and TrDelete =1')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A0056005F004900440003000000000000000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 296
    Top = 240
  end
  object ODS_Settings: TOracleDataSet
    SQL.Strings = (
      'select value from settings'
      ' where name='#39'AccNoSearchPos'#39)
    Optimize = False
    QBEDefinition.QBEFieldDefs = {05000000010000000A000000560041004C0055004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 688
    Top = 360
    object ODS_SettingsVALUE: TWideStringField
      FieldName = 'VALUE'
      Size = 256
    end
  end
  object DEBT_BAL_SPR1: TOracleDataSet
    SQL.Strings = (
      'select * from bal_spr1 '
      '--where inter_valute in (:valute)'
      ' order by bal_cn')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A00560041004C00550054004500010000000400
      0000302C310000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001B0000000C000000420041004C005F0043004E000100000000000C00
      0000540059005000450049004400010000000000200000004100440044004900
      540049004F004E0041004C005400590050004500490044000100000000001000
      0000410043004300470052004F00550050000100000000001000000041004300
      430043004C004100530053000100000000000A000000530041004C0044004F00
      0100000000000800000050004100520054000100000000000E00000042004100
      4C004E0041004D0045000100000000001800000043004C004F00530045004200
      41004C0041004E00430045000100000000001C00000052004100540045004400
      4900460046004500520045004E00430045000100000000002000000043005500
      5200520045004E004300590050004F0053004900540049004F004E0001000000
      000018000000430041005300480049004E0043004F004D0049004E0047000100
      0000000012000000460052004F004D005400520041004E005300010000000000
      1800000049004E005400450052005F00560041004C0055005400450001000000
      00001200000043005500530054005F0054005900500045000100000000001000
      00005200450053004900440045004E0054000100000000001400000047004F00
      5600450052004E004D0045004E00540001000000000008000000530059004D00
      420001000000000006000000560041004C000100000000000600000052004500
      5A00010000000000100000005300460045005200410044004500590001000000
      0000100000004100430043005F0054005900500045000100000000000A000000
      47004F0041004D004C000100000000000C00000050004500520049004F004400
      0100000000001200000053004500430054004F0052005F004900440001000000
      00001400000049004E0043004F004D0045005F00520050005400010000000000
      18000000420041004E004B005F00420041004C0041004E004300450001000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 616
    Top = 8
    object DEBT_BAL_SPR1BAL_CN: TFloatField
      FieldName = 'BAL_CN'
    end
    object DEBT_BAL_SPR1BALNAME: TWideStringField
      FieldName = 'BALNAME'
      Size = 400
    end
  end
  object DEB_BAL_SPR1: TDataSource
    DataSet = DEBT_BAL_SPR1
    Left = 616
    Top = 64
  end
  object ODS_Account: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  A.ID,'
      '  A.ACC_NO,'
      
        '  SUBSTR(acc_no,(select value from settings where name='#39'AccNoSea' +
        'rchPos'#39'),30) as ACC_No_Search,'
      '  A.VAL_ACC,'
      '  A.NAME,'
      '  B.CASHINCOMING AS ISCACHEACCOUNT'
      'FROM'
      '  ACCOUNT A'
      ' ,BAL_SPR1 B '
      'WHERE'
      '  A.BAL_CN1 = B.BAL_CN'
      '  AND'
      '  A.CLOSE_DAT IS NULL'
      '  AND B.BAL_CN=:v_BalCn and A.VAL_ACC=:v_Val'
      'ORDER BY ACC_NO'
      ' ')
    Optimize = False
    Variables.Data = {
      0400000002000000100000003A0056005F00420041004C0043004E0005000000
      00000000000000000C0000003A0056005F00560041004C000300000004000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000600000004000000490044000100000000000C000000410043004300
      5F004E004F000100000000000E000000560041004C005F004100430043000100
      00000000080000004E0041004D0045000100000000001C000000490053004300
      41004300480045004100430043004F0055004E0054000100000000001A000000
      4100430043005F004E004F005F00530045004100520043004800010000000000}
    Session = sboapiDataModule.SBSession
    Left = 687
    Top = 133
    object ODS_AccountID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODS_AccountACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 28
    end
    object ODS_AccountACC_NO_SEARCH: TWideStringField
      FieldName = 'ACC_NO_SEARCH'
      Size = 112
    end
    object ODS_AccountVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object ODS_AccountNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
    object ODS_AccountISCACHEACCOUNT: TFloatField
      FieldName = 'ISCACHEACCOUNT'
    end
  end
  object DS_Account: TDataSource
    DataSet = ODS_Account
    Left = 688
    Top = 192
  end
  object KREDT_BAL_SPR1: TOracleDataSet
    SQL.Strings = (
      'select * from bal_spr1 '
      '--where inter_valute in (:valute)'
      ' order by bal_cn')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A00560041004C00550054004500010000000400
      0000302C310000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001B0000000C000000420041004C005F0043004E000100000000000C00
      0000540059005000450049004400010000000000200000004100440044004900
      540049004F004E0041004C005400590050004500490044000100000000001000
      0000410043004300470052004F00550050000100000000001000000041004300
      430043004C004100530053000100000000000A000000530041004C0044004F00
      0100000000000800000050004100520054000100000000000E00000042004100
      4C004E0041004D0045000100000000001800000043004C004F00530045004200
      41004C0041004E00430045000100000000001C00000052004100540045004400
      4900460046004500520045004E00430045000100000000002000000043005500
      5200520045004E004300590050004F0053004900540049004F004E0001000000
      000018000000430041005300480049004E0043004F004D0049004E0047000100
      0000000012000000460052004F004D005400520041004E005300010000000000
      1800000049004E005400450052005F00560041004C0055005400450001000000
      00001200000043005500530054005F0054005900500045000100000000001000
      00005200450053004900440045004E0054000100000000001400000047004F00
      5600450052004E004D0045004E00540001000000000008000000530059004D00
      420001000000000006000000560041004C000100000000000600000052004500
      5A00010000000000100000005300460045005200410044004500590001000000
      0000100000004100430043005F0054005900500045000100000000000A000000
      47004F0041004D004C000100000000000C00000050004500520049004F004400
      0100000000001200000053004500430054004F0052005F004900440001000000
      00001400000049004E0043004F004D0045005F00520050005400010000000000
      18000000420041004E004B005F00420041004C0041004E004300450001000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 712
    Top = 8
    object FloatField1: TFloatField
      FieldName = 'BAL_CN'
    end
    object WideStringField1: TWideStringField
      FieldName = 'BALNAME'
      Size = 400
    end
  end
  object KRED_BAL_SPR1: TDataSource
    DataSet = KREDT_BAL_SPR1
    Left = 712
    Top = 64
  end
end
