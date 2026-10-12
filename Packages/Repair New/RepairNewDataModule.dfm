object RapNewDataModule: TRapNewDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 466
  Width = 668
  object TransactionData: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  p.rowid,'
      '  p.ID,'
      '  p.OP_ID as OperatorID,'
      '  p.dat as TransactionDate,'
      '  p.DEBT as DebitID,'
      '  ad.ACC_NO as DebitAccNo,'
      '  ad.filial as DebFil,'
      '  p.VAL_ACC as DebitCurrencyID,'
      '  dc.val_name as DebitCurrencySName,'
      '  p.KREDIT as CreditID,'
      '  ac.ACC_NO as CreditAccNo,'
      '  ac.filial as CredFil,'
      '  p.CurrencyID_C as CreditCurrencyID,'
      '  cc.val_name as CreditCurrencySName,'
      '  p.ammount as DebitAmount,'
      '  p.Ammount_C as CreditAmount,'
      '  p.LAmmount as LAmount,'
      '  p.Rate_D as DebitRate,'
      '  p.Rate_C as CreditRate,'
      '  p.Bank_D as DebitBank,'
      '  p.Bank_K as CreditBank,'
      '  p.NO_PACK as PackageNumber,'
      '  p.SHIFR as CYPHERCODE,'
      '  p.vid_op as OPERATIONCODE,'
      '  p.Kassa_B as INBALANCECHAR,'
      '  p.Kassa_Z as OUTBALANCECHAR,'
      '  p.NO_FILIAL as FilialID,'
      '  ad.bal_cn1 as DebitBalance, '
      '  p.Name,'
      
        '  sb_expertanalyse.getoperationtype(p.vid_op, p.val_acc, p.curre' +
        'ncyID_c) as OperationType,'
      '  p.reportid'
      'FROM'
      '  provarch p,'
      ' account ad,'
      ' account ac,'
      ' avalute dc,'
      ' avalute cc'
      'where'
      ' p.dat between :DAT and :DAT2'
      ' and (ad.ID = p.DEBT)'
      ' and (ac.ID = p.KREDIT)'
      ' and (ad.val_acc = p.val_acc)'
      ' and (ac.val_acc = p.CurrencyID_C)'
      ' and (dc.VALUTE = p.val_acc) '
      ' and (cc.VALUTE = p.CurrencyID_C)'
      '  ORDER BY :Title')
    Optimize = False
    Variables.Data = {
      0400000003000000080000003A004400410054000C0000000000000000000000
      0A0000003A0044004100540032000C00000000000000000000000C0000003A00
      5400490054004C0045000100000005000000702E49440000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001E0000000400000049004400010000000000140000004F0050004500
      5200410054004F005200490044000100000000001E0000005400520041004E00
      530041004300540049004F004E0044004100540045000100000000000E000000
      4400450042004900540049004400010000000000140000004400450042004900
      54004100430043004E004F000100000000000C00000044004500420046004900
      4C000100000000001E0000004400450042004900540043005500520052004500
      4E00430059004900440001000000000024000000440045004200490054004300
      55005200520045004E004300590053004E0041004D0045000100000000001000
      0000430052004500440049005400490044000100000000001600000043005200
      45004400490054004100430043004E004F000100000000000E00000043005200
      45004400460049004C0001000000000020000000430052004500440049005400
      430055005200520045004E004300590049004400010000000000260000004300
      52004500440049005400430055005200520045004E004300590053004E004100
      4D004500010000000000160000004400450042004900540041004D004F005500
      4E0054000100000000001800000043005200450044004900540041004D004F00
      55004E0054000100000000000E0000004C0041004D004F0055004E0054000100
      0000000012000000440045004200490054005200410054004500010000000000
      1400000043005200450044004900540052004100540045000100000000001200
      000044004500420049005400420041004E004B00010000000000140000004300
      52004500440049005400420041004E004B000100000000001A00000050004100
      43004B004100470045004E0055004D0042004500520001000000000014000000
      43005900500048004500520043004F00440045000100000000001A0000004F00
      5000450052004100540049004F004E0043004F00440045000100000000001A00
      000049004E00420041004C0041004E0043004500430048004100520001000000
      00001C0000004F0055005400420041004C0041004E0043004500430048004100
      520001000000000010000000460049004C00490041004C004900440001000000
      00001800000044004500420049005400420041004C0041004E00430045000100
      00000000080000004E0041004D0045000100000000001A0000004F0050004500
      52004100540049004F004E005400590050004500010000000000100000005200
      450050004F005200540049004400010000000000}
    LockingMode = lmLockImmediate
    QueryAllRecords = False
    OnApplyRecord = TransactionDataApplyRecord
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 24
    object TransactionDataID: TFloatField
      FieldName = 'ID'
    end
    object TransactionDataOPERATORID: TFloatField
      FieldName = 'OPERATORID'
    end
    object TransactionDataTRANSACTIONDATE: TDateTimeField
      FieldName = 'TRANSACTIONDATE'
    end
    object TransactionDataDEBITID: TFloatField
      FieldName = 'DEBITID'
    end
    object TransactionDataDEBITACCNO: TWideStringField
      FieldName = 'DEBITACCNO'
      Size = 28
    end
    object TransactionDataDEBITCURRENCYID: TFloatField
      FieldName = 'DEBITCURRENCYID'
    end
    object TransactionDataDEBITCURRENCYSNAME: TWideStringField
      FieldName = 'DEBITCURRENCYSNAME'
      Size = 10
    end
    object TransactionDataCREDITID: TFloatField
      FieldName = 'CREDITID'
    end
    object TransactionDataCREDITACCNO: TWideStringField
      FieldName = 'CREDITACCNO'
      Size = 28
    end
    object TransactionDataCREDITCURRENCYID: TIntegerField
      FieldName = 'CREDITCURRENCYID'
    end
    object TransactionDataCREDITCURRENCYSNAME: TWideStringField
      FieldName = 'CREDITCURRENCYSNAME'
      Size = 10
    end
    object TransactionDataDEBITAMOUNT: TFloatField
      FieldName = 'DEBITAMOUNT'
      currency = True
    end
    object TransactionDataCREDITAMOUNT: TFloatField
      FieldName = 'CREDITAMOUNT'
      currency = True
    end
    object TransactionDataLAMOUNT: TFloatField
      FieldName = 'LAMOUNT'
      currency = True
    end
    object TransactionDataDEBITRATE: TFloatField
      FieldName = 'DEBITRATE'
      currency = True
    end
    object TransactionDataCREDITRATE: TFloatField
      FieldName = 'CREDITRATE'
      currency = True
    end
    object TransactionDataDEBITBANK: TFloatField
      FieldName = 'DEBITBANK'
    end
    object TransactionDataCREDITBANK: TFloatField
      FieldName = 'CREDITBANK'
    end
    object TransactionDataPACKAGENUMBER: TIntegerField
      FieldName = 'PACKAGENUMBER'
    end
    object TransactionDataCYPHERCODE: TIntegerField
      FieldName = 'CYPHERCODE'
    end
    object TransactionDataOPERATIONCODE: TIntegerField
      FieldName = 'OPERATIONCODE'
    end
    object TransactionDataINBALANCECHAR: TWideStringField
      FieldName = 'INBALANCECHAR'
      Size = 5
    end
    object TransactionDataOUTBALANCECHAR: TIntegerField
      FieldName = 'OUTBALANCECHAR'
    end
    object TransactionDataFILIALID: TIntegerField
      FieldName = 'FILIALID'
    end
    object TransactionDataDEBITBALANCE: TFloatField
      FieldName = 'DEBITBALANCE'
    end
    object TransactionDataNAME: TWideStringField
      FieldName = 'NAME'
      Size = 255
    end
    object TransactionDataOPERATIONTYPE: TFloatField
      FieldName = 'OPERATIONTYPE'
    end
    object TransactionDataDEBFIL: TIntegerField
      FieldName = 'DEBFIL'
    end
    object TransactionDataCREDFIL: TIntegerField
      FieldName = 'CREDFIL'
    end
    object TransactionDataREPORTID: TFloatField
      FieldName = 'REPORTID'
    end
  end
  object Transaction: TDataSource
    DataSet = TransactionData
    Left = 104
    Top = 24
  end
  object DebetRateData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  currency.valute as ID,'
      '  currency.val_name as Name,'
      '  currency.valu_name as Description,'
      '  rates.OSTAT as Rate'
      'from'
      '  avalute currency,'
      '  OperKurs rates'
      'where'
      ' currency.VALUTE=rates.VAL_KOD'
      ' and dat=:Dat'
      'order by ID')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A004400410054000C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000040000000400000049004400010000000000080000004E0041004D00
      4500010000000000160000004400450053004300520049005000540049004F00
      4E00010000000000080000005200410054004500010000000000}
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 72
    object DebetRateDataID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object DebetRateDataNAME: TWideStringField
      FieldName = 'NAME'
      Size = 10
    end
    object DebetRateDataDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 25
    end
    object DebetRateDataRATE: TFloatField
      FieldName = 'RATE'
    end
  end
  object CreditRateData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  currency.valute as ID,'
      '  currency.val_name as Name,'
      '  currency.valu_name as Description,'
      '  rates.OSTAT as Rate'
      'from'
      '  avalute currency,'
      '  OperKurs rates'
      'where'
      ' currency.VALUTE=rates.VAL_KOD'
      ' and dat=:Dat'
      'order by ID')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A004400410054000C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000040000000400000049004400010000000000080000004E0041004D00
      4500010000000000160000004400450053004300520049005000540049004F00
      4E00010000000000080000005200410054004500010000000000}
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 120
    object CreditRateDataID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object CreditRateDataNAME: TWideStringField
      FieldName = 'NAME'
      Size = 10
    end
    object CreditRateDataDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 25
    end
    object CreditRateDataRATE: TFloatField
      FieldName = 'RATE'
    end
  end
  object DebetRate: TDataSource
    DataSet = DebetRateData
    Left = 104
    Top = 72
  end
  object CreditRate: TDataSource
    DataSet = CreditRateData
    Left = 104
    Top = 120
  end
  object CurDebetData: TOracleDataSet
    SQL.Strings = (
      'select valute,val_name,valu_name'
      'from avalute')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000C000000560041004C005500540045000100000000001000
      0000560041004C005F004E0041004D0045000100000000001200000056004100
      4C0055005F004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    AfterScroll = CurDebetDataAfterScroll
    Left = 32
    Top = 168
    object CurDebetDataVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object CurDebetDataVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object CurDebetDataVALU_NAME: TWideStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
  end
  object CurKreditData: TOracleDataSet
    SQL.Strings = (
      'select valute,val_name,valu_name'
      'from avalute')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000C000000560041004C005500540045000100000000001000
      0000560041004C005F004E0041004D0045000100000000001200000056004100
      4C0055005F004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    AfterScroll = CurKreditDataAfterScroll
    Left = 32
    Top = 216
    object CurKreditDataVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object CurKreditDataVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object CurKreditDataVALU_NAME: TWideStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
  end
  object CurDebet: TDataSource
    DataSet = CurDebetData
    Left = 104
    Top = 168
  end
  object CurKredit: TDataSource
    DataSet = CurKreditData
    Left = 104
    Top = 216
  end
  object DebetAccData: TOracleDataSet
    SQL.Strings = (
      'select '
      '  a.id,'
      '  a.kli_id,'
      '  a.acc_no,'
      '  a.val_acc,'
      '  a.name,'
      '  a.open_dat,'
      '  a.bal_cn1,'
      '  a.bal_cn2,'
      '  a.bal_cn3,'
      '  a.bal_cn4,'
      '  b.CashIncoming as IsCacheAccount'
      ' from  '
      'account a , '
      '  Bal_SPR1 b'
      'where '
      'val_acc = :val_acc and'
      ' (A.CLOSE_DAT is null)'
      ' and (b.bal_cn = a.bal_cn1)'
      'ORDER BY ACC_NO')
    Optimize = False
    Variables.Data = {
      0400000001000000100000003A00560041004C005F0041004300430003000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000B00000004000000490044000100000000000C0000004B004C004900
      5F00490044000100000000000C0000004100430043005F004E004F0001000000
      00000E000000560041004C005F00410043004300010000000000080000004E00
      41004D004500010000000000100000004F00500045004E005F00440041005400
      0100000000000E000000420041004C005F0043004E0031000100000000000E00
      0000420041004C005F0043004E0032000100000000000E000000420041004C00
      5F0043004E0033000100000000000E000000420041004C005F0043004E003400
      0100000000001C00000049005300430041004300480045004100430043004F00
      55004E005400010000000000}
    Master = CurDebetData
    MasterFields = 'VALUTE'
    DetailFields = 'VAL_ACC'
    Session = sboapiDataModule.SBSession
    AfterScroll = DebetAccDataAfterScroll
    Left = 32
    Top = 272
    object DebetAccDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DebetAccDataKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object DebetAccDataACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 28
    end
    object DebetAccDataVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object DebetAccDataNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
    object DebetAccDataOPEN_DAT: TDateTimeField
      FieldName = 'OPEN_DAT'
    end
    object DebetAccDataBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
    end
    object DebetAccDataBAL_CN2: TFloatField
      FieldName = 'BAL_CN2'
    end
    object DebetAccDataBAL_CN3: TFloatField
      FieldName = 'BAL_CN3'
    end
    object DebetAccDataBAL_CN4: TFloatField
      FieldName = 'BAL_CN4'
    end
    object DebetAccDataISCACHEACCOUNT: TFloatField
      FieldName = 'ISCACHEACCOUNT'
    end
  end
  object CreditAccData: TOracleDataSet
    SQL.Strings = (
      'select '
      '  a.id,'
      '  a.kli_id,'
      '  a.acc_no,'
      '  a.val_acc,'
      '  a.name,'
      '  a.open_dat,'
      '  a.bal_cn1,'
      '  a.bal_cn2,'
      '  a.bal_cn3,'
      '  a.bal_cn4,'
      '  b.CashIncoming as IsCacheAccount'
      ' from  '
      'account a , '
      '  Bal_SPR1 b'
      'where'
      ' val_acc = :val_acc and'
      ' (A.CLOSE_DAT is null)'
      '  and (b.bal_cn = a.bal_cn1)'
      'ORDER BY ACC_NO')
    Optimize = False
    Variables.Data = {
      0400000001000000100000003A00560041004C005F0041004300430003000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000B00000004000000490044000100000000000C0000004B004C004900
      5F00490044000100000000000C0000004100430043005F004E004F0001000000
      00000E000000560041004C005F00410043004300010000000000080000004E00
      41004D004500010000000000100000004F00500045004E005F00440041005400
      0100000000000E000000420041004C005F0043004E0031000100000000000E00
      0000420041004C005F0043004E0032000100000000000E000000420041004C00
      5F0043004E0033000100000000000E000000420041004C005F0043004E003400
      0100000000001C00000049005300430041004300480045004100430043004F00
      55004E005400010000000000}
    Master = CurKreditData
    MasterFields = 'VALUTE'
    DetailFields = 'VAL_ACC'
    Session = sboapiDataModule.SBSession
    AfterScroll = CreditAccDataAfterScroll
    Left = 32
    Top = 320
    object CreditAccDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CreditAccDataKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object CreditAccDataACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 28
    end
    object CreditAccDataVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object CreditAccDataNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
    object CreditAccDataOPEN_DAT: TDateTimeField
      FieldName = 'OPEN_DAT'
    end
    object CreditAccDataBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
    end
    object CreditAccDataBAL_CN2: TFloatField
      FieldName = 'BAL_CN2'
    end
    object CreditAccDataBAL_CN3: TFloatField
      FieldName = 'BAL_CN3'
    end
    object CreditAccDataBAL_CN4: TFloatField
      FieldName = 'BAL_CN4'
    end
    object CreditAccDataISCACHEACCOUNT: TFloatField
      FieldName = 'ISCACHEACCOUNT'
    end
  end
  object DebetAcc: TDataSource
    DataSet = DebetAccData
    Left = 104
    Top = 272
  end
  object CreditAcc: TDataSource
    DataSet = CreditAccData
    Left = 104
    Top = 320
  end
  object TrDescriptionData: TOracleDataSet
    SQL.Strings = (
      'select * from trdestination')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 24
    object TrDescriptionDataID: TFloatField
      FieldName = 'ID'
    end
    object TrDescriptionDataNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object OutBalanceCharData: TOracleDataSet
    SQL.Strings = (
      'select * from CONVERT_ASSIGNMENTS'
      'order by ID')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000005000000040000004900440001000000000012000000530048004F00
      520054004E0041004D00450001000000000010000000460055004C004C005000
      4100540048000100000000000A00000045005800540052004100010000000000
      1200000044004900460046004500520045004E005400010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 208
    Top = 72
    object OutBalanceCharDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OutBalanceCharDataSHORTNAME: TWideStringField
      FieldName = 'SHORTNAME'
      Required = True
      Size = 10
    end
    object OutBalanceCharDataFULLPATH: TWideStringField
      FieldName = 'FULLPATH'
      Size = 200
    end
    object OutBalanceCharDataEXTRA: TWideStringField
      FieldName = 'EXTRA'
      Size = 10
    end
    object OutBalanceCharDataDIFFERENT: TFloatField
      FieldName = 'DIFFERENT'
    end
  end
  object OutBalanceChar: TDataSource
    DataSet = OutBalanceCharData
    Left = 304
    Top = 72
  end
  object InBalanceCharData: TOracleDataSet
    SQL.Strings = (
      'select * from KASSA_B'
      'order by symbol')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000C000000530059004D0042004F004C000100000000000800
      00004E0041004D004500010000000000140000004D004500440049004F004300
      5200490054005900010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Filter = 'MedioCrity=-1'
    Filtered = True
    AfterScroll = InBalanceCharDataAfterScroll
    Left = 208
    Top = 120
    object InBalanceCharDataSYMBOL: TWideStringField
      FieldName = 'SYMBOL'
      Size = 5
    end
    object InBalanceCharDataNAME: TWideStringField
      FieldName = 'NAME'
      Size = 777
    end
    object InBalanceCharDataMEDIOCRITY: TFloatField
      FieldName = 'MEDIOCRITY'
    end
  end
  object InBalanceChar: TDataSource
    DataSet = InBalanceCharData
    Left = 304
    Top = 120
  end
  object pcCorrect: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'p_Correct'
    ParameterMode = pmNamed
    Left = 392
    Top = 24
  end
  object UsersData: TOracleDataSet
    SQL.Strings = (
      'select * from user$')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      45000100000000000A0000004300540049004D004500010000000000}
    ReadOnly = True
    Session = sboapiDataModule.SBSession
    AfterOpen = UsersDataAfterOpen
    Left = 208
    Top = 176
    object UsersDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object UsersDataNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
    object UsersDataCTIME: TDateTimeField
      FieldName = 'CTIME'
      Required = True
    end
  end
  object Users: TDataSource
    DataSet = UsersData
    Left = 304
    Top = 176
  end
  object Valutes: TOracleQuery
    SQL.Strings = (
      'select valute,valu_name from avalute')
    Session = sboapiDataModule.SBSession
    Optimize = False
    Threaded = True
    OnThreadRecord = ValutesThreadRecord
    OnThreadFinished = ValutesThreadFinished
    Left = 392
    Top = 72
  end
  object VidOp: TOracleQuery
    SQL.Strings = (
      'select id,name from vid_op'
      'order by id')
    Session = sboapiDataModule.SBSession
    Optimize = False
    Threaded = True
    OnThreadRecord = VidOpThreadRecord
    Left = 392
    Top = 120
  end
  object FilialDebetData: TOracleDataSet
    SQL.Strings = (
      'select * from filial')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000140000004B004F0044005F00460049004C00490041004C00
      010000000000}
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 248
    object FilialDebetDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FilialDebetDataNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object FilialCreditData: TOracleDataSet
    SQL.Strings = (
      'select * from filial')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000140000004B004F0044005F00460049004C00490041004C00
      010000000000}
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 296
    object FilialCreditDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FilialCreditDataNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object FilialDebet: TDataSource
    DataSet = FilialDebetData
    Left = 312
    Top = 248
  end
  object FilialCredit: TDataSource
    DataSet = FilialCreditData
    Left = 312
    Top = 296
  end
  object ReportDescsData: TDataSource
    DataSet = ReportDesc
    Left = 376
    Top = 200
  end
  object ReportDesc: TOracleDataSet
    SQL.Strings = (
      'select d.*, d.rowid from reportdescs d'
      'order by id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 454
    Top = 200
  end
end
