object PaymentOrderDataMod: TPaymentOrderDataMod
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 254
  Width = 544
  object ODSAccounts_PyaOrder: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  A.ID,'
      '  A.ACC_NO,'
      
        '  SUBSTR(acc_no,(select value from settings where name='#39'AccNoSea' +
        'rchPos'#39'),30) as ACC_No_Search,'
      '  A.VAL_ACC,'
      '  A.NAME'
      ' '
      'FROM'
      '  ACCOUNT A'
      ''
      'WHERE'
      ' '
      ' '
      '  A.CLOSE_DAT IS NULL'
      ' '
      'ORDER BY ACC_NO_SEARCH')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000500000004000000490044000100000000000C000000410043004300
      5F004E004F000100000000000E000000560041004C005F004100430043000100
      00000000080000004E0041004D0045000100000000001A000000410043004300
      5F004E004F005F00530045004100520043004800010000000000}
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Active = True
    Filtered = True
    Left = 104
    Top = 32
  end
  object ODSBankInfo: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   *'
      'From'
      '     BankM--BankInfoes'
      'Order by id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000A000000080000004B0052004E004F00010000000000060000004900
      4E004E000100000000000A000000530057004900460054000100000000000400
      000049004400010000000000080000004E0041004D0045000100000000001000
      0000420041004E004B0043004F00440045000100000000000E00000053005500
      42004B0052004E004F0001000000000010000000420041004E004B005F004B00
      4F004400010000000000180000004C004900430045004E00530045005F004400
      410054004500010000000000160000005400410058005F005200450047004300
      4F0044004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 88
    Top = 88
    object ODSBankInfoID: TFloatField
      FieldName = 'ID'
    end
    object ODSBankInfoKRNO: TWideStringField
      FieldName = 'KRNO'
      Size = 448
    end
    object ODSBankInfoNAME: TWideStringField
      FieldName = 'NAME'
      Size = 4000
    end
    object ODSBankInfoINN: TWideStringField
      FieldName = 'INN'
      Size = 512
    end
    object ODSBankInfoSWIFT: TWideStringField
      FieldName = 'SWIFT'
      Size = 2048
    end
    object ODSBankInfoBANKCODE: TWideStringField
      FieldName = 'BANKCODE'
      Size = 512
    end
    object ODSBankInfoSUBKRNO: TWideStringField
      FieldName = 'SUBKRNO'
      Size = 448
    end
    object ODSBankInfoBANK_KOD: TFloatField
      FieldName = 'BANK_KOD'
    end
    object ODSBankInfoLICENSE_DATE: TDateTimeField
      FieldName = 'LICENSE_DATE'
    end
    object ODSBankInfoTAX_REGCODE: TWideStringField
      FieldName = 'TAX_REGCODE'
    end
  end
  object ODSBankM: TOracleDataSet
    SQL.Strings = (
      'Select'
      '    *'
      'From'
      '  BankM'
      'Order by ID')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000080000000400000049004400010000000000080000004B0052004E00
      4F00010000000000080000004E0041004D004500010000000000060000004900
      4E004E000100000000000A000000530057004900460054000100000000001000
      0000420041004E004B0043004F00440045000100000000000E00000053005500
      42004B0052004E004F0001000000000010000000420041004E004B005F004B00
      4F004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 232
    Top = 16
    object ODSBankMID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSBankMKRNO: TWideStringField
      FieldName = 'KRNO'
      Size = 28
    end
    object ODSBankMNAME: TWideStringField
      FieldName = 'NAME'
      Size = 255
    end
    object ODSBankMINN: TWideStringField
      FieldName = 'INN'
      Size = 32
    end
    object ODSBankMSWIFT: TWideStringField
      FieldName = 'SWIFT'
      Size = 128
    end
    object ODSBankMBANKCODE: TWideStringField
      FieldName = 'BANKCODE'
      Size = 32
    end
    object ODSBankMSUBKRNO: TWideStringField
      FieldName = 'SUBKRNO'
      Size = 28
    end
  end
  object DSAccounts: TDataSource
    DataSet = ODSAccounts_PyaOrder
    Left = 24
    Top = 24
  end
  object DSBankInfo: TDataSource
    DataSet = ODSBankInfo
    Left = 24
    Top = 88
  end
  object OPPayment: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'sb_PaymentDecree'
    Left = 336
  end
  object ODSArchive: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  id'
      ' ,pdate'
      ' ,pnum'
      ' ,dbname'
      ' ,dbcod'
      ' ,dbinn'
      ' ,dbcoracc'
      ' ,dbswift'
      ' ,dacc_no'
      ' ,daccname'
      ' ,daccinn'
      ' ,kbname'
      ' ,kbcod'
      ' ,kbinn'
      ' ,kbcoracc'
      ' ,kbswift'
      ' ,kacc_no'
      ' ,kaccname'
      ' ,kaccinn'
      ' ,ammount'
      ' ,assignment'
      ' ,extra'
      ',MOD_BANK'
      ',budgetclass'
      ',budgetlevel'
      'From'
      ' PaymentDecree'
      ''
      'Order by'
      '  :Title'
      ' ')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A005400490054004C0045000100000005000000
      504E554D0000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001900000004000000490044000100000000000A000000500044004100
      540045000100000000000800000050004E0055004D000100000000000C000000
      440042004E0041004D0045000100000000000A0000004400420043004F004400
      0100000000000A0000004400420049004E004E00010000000000100000004400
      420043004F0052004100430043000100000000000E0000004400420053005700
      4900460054000100000000000E00000044004100430043005F004E004F000100
      000000001000000044004100430043004E0041004D0045000100000000000E00
      0000440041004300430049004E004E000100000000000C0000004B0042004E00
      41004D0045000100000000000A0000004B00420043004F004400010000000000
      0A0000004B00420049004E004E00010000000000100000004B00420043004F00
      52004100430043000100000000000E0000004B00420053005700490046005400
      0100000000000E0000004B004100430043005F004E004F000100000000001000
      00004B004100430043004E0041004D0045000100000000000E0000004B004100
      4300430049004E004E000100000000000E00000041004D004D004F0055004E00
      540001000000000014000000410053005300490047004E004D0045004E005400
      0100000000000A00000045005800540052004100010000000000100000004D00
      4F0044005F00420041004E004B00010000000000160000004200550044004700
      4500540043004C00410053005300010000000000160000004200550044004700
      450054004C004500560045004C00010000000000}
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 224
    Top = 80
    object ODSArchiveID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSArchivePDATE: TDateTimeField
      FieldName = 'PDATE'
    end
    object ODSArchivePNUM: TFloatField
      FieldName = 'PNUM'
    end
    object ODSArchiveDBNAME: TWideStringField
      FieldName = 'DBNAME'
      Size = 300
    end
    object ODSArchiveDBCOD: TWideStringField
      FieldName = 'DBCOD'
      Size = 15
    end
    object ODSArchiveDBINN: TWideStringField
      FieldName = 'DBINN'
      Size = 15
    end
    object ODSArchiveDBCORACC: TWideStringField
      FieldName = 'DBCORACC'
      Size = 28
    end
    object ODSArchiveDBSWIFT: TWideStringField
      FieldName = 'DBSWIFT'
      Size = 15
    end
    object ODSArchiveDACC_NO: TWideStringField
      FieldName = 'DACC_NO'
      Size = 50
    end
    object ODSArchiveDACCNAME: TWideStringField
      FieldName = 'DACCNAME'
      Size = 300
    end
    object ODSArchiveDACCINN: TWideStringField
      FieldName = 'DACCINN'
      Size = 15
    end
    object ODSArchiveKBNAME: TWideStringField
      FieldName = 'KBNAME'
      Size = 200
    end
    object ODSArchiveKBCOD: TWideStringField
      FieldName = 'KBCOD'
      Size = 15
    end
    object ODSArchiveKBINN: TWideStringField
      FieldName = 'KBINN'
      Size = 15
    end
    object ODSArchiveKBCORACC: TWideStringField
      FieldName = 'KBCORACC'
      Size = 28
    end
    object ODSArchiveKBSWIFT: TWideStringField
      FieldName = 'KBSWIFT'
      Size = 15
    end
    object ODSArchiveKACC_NO: TWideStringField
      FieldName = 'KACC_NO'
      Size = 50
    end
    object ODSArchiveKACCNAME: TWideStringField
      FieldName = 'KACCNAME'
      Size = 300
    end
    object ODSArchiveKACCINN: TWideStringField
      FieldName = 'KACCINN'
      Size = 15
    end
    object ODSArchiveASSIGNMENT: TWideStringField
      FieldName = 'ASSIGNMENT'
      Size = 500
    end
    object ODSArchiveEXTRA: TWideStringField
      FieldName = 'EXTRA'
      Size = 500
    end
    object ODSArchiveMOD_BANK: TWideStringField
      FieldName = 'MOD_BANK'
      Size = 200
    end
    object ODSArchiveBUDGETCLASS: TWideStringField
      FieldName = 'BUDGETCLASS'
      Size = 10
    end
    object ODSArchiveBUDGETLEVEL: TWideStringField
      FieldName = 'BUDGETLEVEL'
      Size = 10
    end
    object ODSArchiveAMMOUNT: TWideStringField
      FieldName = 'AMMOUNT'
      Size = 25
    end
  end
  object DSArchive: TDataSource
    DataSet = ODSArchive
    Left = 152
    Top = 88
  end
  object DSBankM: TDataSource
    DataSet = ODSBankM
    Left = 160
    Top = 16
  end
  object Rezerv: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  A.ID,'
      '  A.ACC_NO,'
      
        '  SUBSTR(acc_no,(select value from settings where name='#39'AccNoSea' +
        'rchPos'#39'),30) as ACC_No_Search,'
      '  A.VAL_ACC,'
      '  A.NAME'
      ' '
      'FROM'
      '  ACCOUNT A'
      ''
      'WHERE'
      ' '
      ' '
      '  A.CLOSE_DAT IS NULL'
      ' '
      'ORDER BY ACC_NO_SEARCH')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000500000004000000490044000100000000000C000000410043004300
      5F004E004F000100000000000E000000560041004C005F004100430043000100
      00000000080000004E0041004D0045000100000000001A000000410043004300
      5F004E004F005F00530045004100520043004800010000000000}
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Active = True
    Filtered = True
    Left = 336
    Top = 48
  end
  object ODS_DEBIT: TOracleDataSet
    SQL.Strings = (
      
        'select t.id,t.debitid,b.name as bank_name,b.bankcode,b.krno,b.in' +
        'n,b.swift,a.name,c.inn as cust_inn,t.debitaccno,debitamount from' +
        ' '
      'BankM b,account a,customers c, transactions t'
      
        ' where b.bankcode=a.bank_code and a.kli_id=c.id and a.id=t.debit' +
        'id '
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000B000000080000004B0052004E004F00010000000000060000004900
      4E004E000100000000000A000000530057004900460054000100000000000800
      00004E0041004D00450001000000000014000000440045004200490054004100
      430043004E004F00010000000000160000004400450042004900540041004D00
      4F0055004E00540001000000000004000000490044000100000000000E000000
      4400450042004900540049004400010000000000100000004300550053005400
      5F0049004E004E0001000000000012000000420041004E004B005F004E004100
      4D00450001000000000010000000420041004E004B0043004F00440045000100
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 288
    Top = 120
    object ODS_DEBITID: TFloatField
      FieldName = 'ID'
    end
    object ODS_DEBITDEBITID: TFloatField
      FieldName = 'DEBITID'
    end
    object ODS_DEBITBANK_NAME: TWideStringField
      FieldName = 'BANK_NAME'
      Size = 4000
    end
    object ODS_DEBITBANKCODE: TWideStringField
      FieldName = 'BANKCODE'
      Size = 512
    end
    object ODS_DEBITKRNO: TWideStringField
      FieldName = 'KRNO'
      Size = 448
    end
    object ODS_DEBITINN: TWideStringField
      FieldName = 'INN'
      Size = 512
    end
    object ODS_DEBITSWIFT: TWideStringField
      FieldName = 'SWIFT'
      Size = 2048
    end
    object ODS_DEBITNAME: TWideStringField
      FieldName = 'NAME'
      Size = 1440
    end
    object ODS_DEBITCUST_INN: TWideStringField
      FieldName = 'CUST_INN'
      Size = 80
    end
    object ODS_DEBITDEBITACCNO: TWideStringField
      FieldName = 'DEBITACCNO'
      Size = 448
    end
    object ODS_DEBITDEBITAMOUNT: TFloatField
      FieldName = 'DEBITAMOUNT'
    end
  end
  object Dsrc_DEBIT: TDataSource
    DataSet = ODS_DEBIT
    Left = 352
    Top = 120
  end
  object ODS_Kredit: TOracleDataSet
    SQL.Strings = (
      
        'select t.id,t.creditid, b.name as bank_name,b.bankcode,b.inn,b.k' +
        'rno,b.swift,a.name,t.creditaccno,'
      'c.inn as cust_inn,t.name as tr_name from '
      'BankM b,account a,customers c, transactions t'
      
        ' where a.bank_code=b.bankcode and c.id=a.kli_id and a.id=t.credi' +
        'tid'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000B000000080000004E0041004D004500010000000000160000004300
      520045004400490054004100430043004E004F00010000000000100000004300
      5500530054005F0049004E004E000100000000000E000000540052005F004E00
      41004D0045000100000000000400000049004400010000000000100000004300
      520045004400490054004900440001000000000012000000420041004E004B00
      5F004E0041004D00450001000000000010000000420041004E004B0043004F00
      440045000100000000000600000049004E004E000100000000000A0000005300
      5700490046005400010000000000080000004B0052004E004F00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 136
    Top = 144
    object ODS_KreditID: TFloatField
      FieldName = 'ID'
    end
    object ODS_KreditCREDITID: TFloatField
      FieldName = 'CREDITID'
    end
    object ODS_KreditBANK_NAME: TWideStringField
      FieldName = 'BANK_NAME'
      Size = 4000
    end
    object ODS_KreditBANKCODE: TWideStringField
      FieldName = 'BANKCODE'
      Size = 512
    end
    object ODS_KreditINN: TWideStringField
      FieldName = 'INN'
      Size = 512
    end
    object ODS_KreditSWIFT: TWideStringField
      FieldName = 'SWIFT'
      Size = 2048
    end
    object ODS_KreditNAME: TWideStringField
      FieldName = 'NAME'
      Size = 1440
    end
    object ODS_KreditCREDITACCNO: TWideStringField
      FieldName = 'CREDITACCNO'
      Size = 448
    end
    object ODS_KreditCUST_INN: TWideStringField
      FieldName = 'CUST_INN'
      Size = 80
    end
    object ODS_KreditTR_NAME: TWideStringField
      FieldName = 'TR_NAME'
      Size = 1020
    end
    object ODS_KreditKRNO: TWideStringField
      FieldName = 'KRNO'
      Size = 448
    end
  end
  object Dsrc_Kredit: TDataSource
    DataSet = ODS_Kredit
    Left = 208
    Top = 136
  end
  object ODS_Acc_symbol: TOracleDataSet
    SQL.Strings = (
      
        'select a.acc_no,a.old_acc_no as old, s.symbol,s.old_acc_no from ' +
        'account a,account_symbols s where a.symb=s.symbol'
      ' and s.old_acc_no=1'
      ' and a.acc_no=:acc_no')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A004100430043005F004E004F00050000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000040000000C0000004100430043005F004E004F000100000000001400
      00004F004C0044005F004100430043005F004E004F000100000000000C000000
      530059004D0042004F004C00010000000000060000004F004C00440001000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 424
    Top = 72
    object ODS_Acc_symbolACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 448
    end
    object ODS_Acc_symbolOLD: TWideStringField
      FieldName = 'OLD'
      Size = 448
    end
    object ODS_Acc_symbolSYMBOL: TWideStringField
      FieldName = 'SYMBOL'
      Size = 48
    end
    object ODS_Acc_symbolOLD_ACC_NO: TFloatField
      FieldName = 'OLD_ACC_NO'
    end
  end
end
