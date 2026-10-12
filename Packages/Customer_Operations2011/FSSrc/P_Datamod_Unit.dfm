object P_DataModuleFS: TP_DataModuleFS
  OldCreateOrder = False
  Left = 173
  Top = 217
  Height = 829
  Width = 1081
  object Accdata: TDataSource
    DataSet = Account
    Left = 136
    Top = 88
  end
  object comisdata: TDataSource
    DataSet = Commission
    Left = 136
    Top = 248
  end
  object Commission: TOracleDataSet
    SQL.Strings = (
      'select'
      '    id'
      '   ,name'
      '   ,debt'
      '  '
      
        '   ,sb_complex_transactions.getaccountnumber(debt) as DebitAccou' +
        'nt'
      
        '   ,sb_complex_transactions.GetAccountCurrency(debt) as DebitCur' +
        'rency'
      
        '   ,sb_complex_transactions.getaccountcurrencyid(debt) as DebitC' +
        'urrencyID'
      '   ,sb_complex_transactions.GetCurrencyName(debt) as DebitValute'
      
        '   ,sb_complex_transactions.GetValuteName(debt) as DebitValuteNa' +
        'me'
      '  ,credit'
      
        '   ,sb_complex_transactions.getaccountnumber(credit) as CreditAc' +
        'count'
      
        '   ,sb_complex_transactions.GetAccountCurrency(credit) as Credit' +
        'Currency'
      
        '   ,sb_complex_transactions.GetAccountval_name(credit) as Credit' +
        'ValuteName'
      
        '   ,sb_complex_transactions.getaccountcurrencyid(credit) as Cred' +
        'itCurrencyID   '
      
        '   ,sb_complex_transactions.GetAccountName(credit) as Creditname' +
        '  '
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
      '   ,UserID '
      ''
      'from'
      '    commision_trans'
      'where'
      '   UserID = 0 or'
      '    UserID = (SBLogin.UserID)'
      'order by'
      '    name  ')
    QBEDefinition.QBEFieldDefs = {
      0400000019000000020000004944010000000000040000004E414D4501000000
      000004000000444542540100000000000C00000044454249544143434F554E54
      0100000000000D000000444542495443555252454E43590100000000000F0000
      00444542495443555252454E435949440100000000000B000000444542495456
      414C5554450100000000000F000000444542495456414C5554454E414D450100
      00000000060000004352454449540100000000000D0000004352454449544143
      434F554E540100000000000E00000043524544495443555252454E4359010000
      0000001000000043524544495456414C5554454E414D45010000000000100000
      0043524544495443555252454E435949440100000000000A0000004352454449
      544E414D450100000000000E0000004144444954494F4E414C44454254010000
      0000000D0000004144454249544143434F554E540100000000000E0000004144
      4542495443555252454E43590100000000001200000041444444454249544355
      5252454E43594944010000000000100000004144444954494F4E414C43524544
      49540100000000000E000000414352454449544143434F554E54010000000000
      0F0000004143524544495443555252454E435901000000000013000000414444
      43524544495443555252454E435949440100000000000A00000041535349474E
      4D454E5401000000000013000000434F4D4D4953494F4E41535349474E4D454E
      5401000000000006000000555345524944010000000000}
    Session = sboapiDataModule.SBSession
    Left = 136
    Top = 192
    object CommissionID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CommissionNAME: TStringField
      FieldName = 'NAME'
      Size = 150
    end
    object CommissionDEBT: TFloatField
      FieldName = 'DEBT'
    end
    object CommissionDEBITACCOUNT: TStringField
      FieldName = 'DEBITACCOUNT'
      Size = 4000
    end
    object CommissionDEBITCURRENCY: TStringField
      FieldName = 'DEBITCURRENCY'
      Size = 4000
    end
    object CommissionDEBITCURRENCYID: TFloatField
      FieldName = 'DEBITCURRENCYID'
    end
    object CommissionDEBITVALUTE: TStringField
      FieldName = 'DEBITVALUTE'
      Size = 4000
    end
    object CommissionDEBITVALUTENAME: TStringField
      FieldName = 'DEBITVALUTENAME'
      Size = 4000
    end
    object CommissionCREDIT: TFloatField
      FieldName = 'CREDIT'
    end
    object CommissionCREDITACCOUNT: TStringField
      FieldName = 'CREDITACCOUNT'
      Size = 4000
    end
    object CommissionCREDITCURRENCY: TStringField
      FieldName = 'CREDITCURRENCY'
      Size = 4000
    end
    object CommissionCREDITVALUTENAME: TStringField
      FieldName = 'CREDITVALUTENAME'
      Size = 4000
    end
    object CommissionCREDITCURRENCYID: TFloatField
      FieldName = 'CREDITCURRENCYID'
    end
    object CommissionCREDITNAME: TStringField
      FieldName = 'CREDITNAME'
      Size = 4000
    end
    object CommissionADDITIONALDEBT: TFloatField
      FieldName = 'ADDITIONALDEBT'
    end
    object CommissionADEBITACCOUNT: TStringField
      FieldName = 'ADEBITACCOUNT'
      Size = 4000
    end
    object CommissionADEBITCURRENCY: TStringField
      FieldName = 'ADEBITCURRENCY'
      Size = 4000
    end
    object CommissionADDDEBITCURRENCYID: TFloatField
      FieldName = 'ADDDEBITCURRENCYID'
    end
    object CommissionADDITIONALCREDIT: TFloatField
      FieldName = 'ADDITIONALCREDIT'
    end
    object CommissionACREDITACCOUNT: TStringField
      FieldName = 'ACREDITACCOUNT'
      Size = 4000
    end
    object CommissionACREDITCURRENCY: TStringField
      FieldName = 'ACREDITCURRENCY'
      Size = 4000
    end
    object CommissionADDCREDITCURRENCYID: TFloatField
      FieldName = 'ADDCREDITCURRENCYID'
    end
    object CommissionASSIGNMENT: TStringField
      FieldName = 'ASSIGNMENT'
      Size = 300
    end
    object CommissionCOMMISIONASSIGNMENT: TStringField
      FieldName = 'COMMISIONASSIGNMENT'
      Size = 300
    end
    object CommissionUSERID: TFloatField
      FieldName = 'USERID'
    end
  end
  object Customers: TOracleDataSet
    Tag = 776
    SQL.Strings = (
      'select * from customers order by :title')
    Variables.Data = {
      0300000001000000060000003A5449544C450100000003000000494400000000
      00}
    QBEDefinition.QBEFieldDefs = {
      0400000019000000020000004944010000000000050000004F505F4944010000
      000000080000004F50454E5F44415401000000000009000000434C4F53455F44
      41540100000000000A0000004E4552455A4944454E540100000000000A000000
      5052494E41445F4B4F44010000000000040000004E414D450100000000000A00
      000053484F52545F4E414D450100000000000A00000047524F55505F4B4C4945
      010000000000070000005649445F534F42010000000000070000004F52475F53
      4F420100000000000900000053464552415F444559010000000000060000004F
      545241534C010000000000090000004E414C4F475F4B4F440100000000000900
      00004B4F445F4F4B50524F01000000000003000000494E4E0100000000000700
      00004441545F4E414C010000000000090000004441545F555354415601000000
      00000300000042494B010000000000080000004F54565F4C49434F0100000000
      000C0000004F54565F50415353504F52540100000000000A0000004F54565F49
      53535545440100000000000A0000004F54565F49534441544501000000000009
      000000435553545F5459504501000000000006000000494E4E5F4E4E01000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 32
  end
  object Custdata: TDataSource
    DataSet = Customers
    Left = 208
    Top = 88
  end
  object Account: TOracleDataSet
    SQL.Strings = (
      'select *'
      ' from fsaccs a '
      'order by :title'
      ''
      '')
    Variables.Data = {
      0300000001000000060000003A5449544C4501000000080000006163636B6C69
      640000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000D000000020000004944010000000000050000004143434E4F010000
      000000050000004F574E4944010000000000070000004143434E414D45010000
      000000080000004F50454E444154450100000000000D00000043555252454E43
      59534E414D450100000000000700000042414C414E4345010000000000080000
      004C42414C414E4345010000000000070000004143434B4C4944010000000000
      0600000041434356414C0100000000000A00000041434356414C434F44450100
      00000000060000004355535449440100000000000400000049445F3101000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 136
    Top = 32
  end
  object Provarch: TOracleDataSet
    SQL.Strings = (
      'select * from prov_t')
    QBEDefinition.QBEFieldDefs = {
      0400000007000000030000004441540100000000000500000044454249540100
      000000000600000043524544495401000000000007000000414D4D4F554E5401
      0000000000080000004C414D4D4F554E5401000000000009000000414D4D4F55
      4E545F43010000000000040000004E414D45010000000000}
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 192
    object ProvarchDAT: TDateTimeField
      FieldName = 'DAT'
      Required = True
    end
    object ProvarchDEBIT: TStringField
      FieldName = 'DEBIT'
      Required = True
    end
    object ProvarchCREDIT: TStringField
      FieldName = 'CREDIT'
      Required = True
    end
    object ProvarchAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
      Required = True
    end
    object ProvarchLAMMOUNT: TFloatField
      FieldName = 'LAMMOUNT'
      Required = True
    end
    object ProvarchAMMOUNT_C: TFloatField
      FieldName = 'AMMOUNT_C'
      Required = True
    end
    object ProvarchNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
  end
  object Provdata: TDataSource
    DataSet = Provarch
    Left = 208
    Top = 248
  end
  object archost: TOracleDataSet
    Session = sboapiDataModule.SBSession
    Left = 136
    Top = 632
  end
  object avalute: TOracleDataSet
    Session = sboapiDataModule.SBSession
    Left = 440
    Top = 32
  end
  object ODSLogo: TOracleDataSet
    SQL.Strings = (
      'SELECT *  FROM bankinfo')
    QBEDefinition.QBEFieldDefs = {
      040000002A000000050000004B4F445F420100000000000400000042414E4B01
      000000000007000000415A5F4E414D45010000000000040000004B524E4F0100
      0000000003000000494E4E010000000000050000005345484552010000000000
      0600000041445245535301000000000004000000534544520100000000000700
      0000425548414C54520100000000000300000054454C01000000000003000000
      4641580100000000000500000053574946540100000000000500000054454C45
      5801000000000005000000454D41494C01000000000007000000504F53545F49
      4E010000000000070000004B4F445F46494C0100000000000600000046494C49
      414C0100000000000900000041445245535F46494C0100000000000700000054
      454C5F46494C010000000000070000004641585F46494C010000000000090000
      0053574946545F46494C0100000000000900000054454C45585F46494C010000
      0000000A000000504F5354494E5F46494C010000000000090000005345484552
      5F46494C01000000000007000000494E4E5F46494C010000000000080000004B
      524E4F5F46494C010000000000070000005345445246494C0100000000000900
      0000425548414C5F46494C010000000000080000004B4F445F4246494C010000
      000000020000004E420100000000000700000056414C5F4D4F56010000000000
      040000004C4F474F000000000000040000004C494E4B01000000000003000000
      5344560100000000000300000053564D01000000000002000000424601000000
      00000C0000004D414E414745525449544C450100000000000F0000004143434F
      554E54414E545449544C450100000000000E00000053564D5F43555252454E43
      594944010000000000070000004341504954414C010000000000090000004153
      53495354414E540100000000000E000000415353495354414E545449544C4501
      0000000000}
    Session = sboapiDataModule.SBSession
    Left = 464
    Top = 632
  end
  object SB_STATEMENT: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SB_STATEMENT'
    Left = 160
    Top = 696
  end
  object RatesDataSet: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   Val_Kod'
      '  ,Dat'
      ' ,Ostat'
      '  From Operkurs'
      'Where   Val_Kod = :Val_Kod and Dat =:Dat')
    Variables.Data = {
      0300000002000000080000003A56414C5F4B4F44030000000000000000000000
      040000003A4441540C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000056414C5F4B4F4401000000000003000000444154
      010000000000050000004F53544154010000000000}
    MasterFields = 'CurrencyID;enddate'
    DetailFields = 'Val_Kod;Dat'
    Session = sboapiDataModule.SBSession
    Left = 603
    Top = 632
    object RatesDataSetVAL_KOD: TIntegerField
      FieldName = 'VAL_KOD'
      Required = True
    end
    object RatesDataSetDAT: TDateTimeField
      FieldName = 'DAT'
      Required = True
    end
    object RatesDataSetOSTAT: TFloatField
      FieldName = 'OSTAT'
    end
  end
  object RatesDataSetBegin: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   Val_Kod'
      '  ,Dat'
      ' ,Ostat'
      '  From Operkurs'
      'Where   Val_Kod = :Val_Kod and Dat =:Dat')
    Variables.Data = {
      0300000002000000080000003A56414C5F4B4F44030000000000000000000000
      040000003A4441540C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000056414C5F4B4F4401000000000003000000444154
      010000000000050000004F53544154010000000000}
    MasterFields = 'CurrencyID;datdate'
    DetailFields = 'Val_Kod;Dat'
    Session = sboapiDataModule.SBSession
    Left = 56
    Top = 632
    object IntegerField1: TIntegerField
      FieldName = 'VAL_KOD'
      Required = True
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DAT'
      Required = True
    end
    object FloatField1: TFloatField
      FieldName = 'OSTAT'
    end
  end
  object ODSNotAccId: TOracleDataSet
    Session = sboapiDataModule.SBSession
    Left = 320
    Top = 632
  end
  object ODSFilial: TOracleDataSet
    SQL.Strings = (
      'select * from filial order by id')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 344
    Top = 192
    object ODSFilialID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSFilialNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object DSFilial: TDataSource
    DataSet = ODSFilial
    Left = 344
    Top = 248
  end
  object ODSUsers: TOracleDataSet
    SQL.Strings = (
      'select * from user$')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000040000004E414D4501000000
      0000050000004354494D45010000000000}
    Session = sboapiDataModule.SBSession
    Left = 336
    Top = 336
  end
  object DSUsers: TDataSource
    DataSet = ODSUsers
    Left = 336
    Top = 392
  end
  object ODSCurrency: TOracleDataSet
    SQL.Strings = (
      'select * from avalute')
    QBEDefinition.QBEFieldDefs = {
      04000000170000000600000056414C5554450100000000000800000056414C5F
      4E414D450100000000000900000056414C555F4E414D450100000000000A0000
      0056414C555F53484F5254010000000000060000005553544F52470100000000
      0006000000555354504F4B0100000000000800000056414C555F47454E010000
      0000000700000056414C555F415A010000000000050000005553494E47010000
      0000000A00000056414C555F4F544845520100000000000A00000056414C555F
      494E5445520100000000000900000056414C555F42414C410100000000000900
      0000505249535441564B4101000000000007000000434F554E54525901000000
      0000080000005553545F504F4B31010000000000070000004F46464943414C01
      0000000000050000004C494D4954010000000000050000004445424554010000
      000000060000004B524544495401000000000006000000463535303150010000
      0000000600000046353530315601000000000006000000534445424554010000
      0000000700000053435245444954010000000000}
    Session = sboapiDataModule.SBSession
    Left = 552
    Top = 192
    object ODSCurrencyVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object ODSCurrencyVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object ODSCurrencyVALU_NAME: TStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
    object ODSCurrencyVALU_SHORT: TStringField
      FieldName = 'VALU_SHORT'
      Size = 10
    end
    object ODSCurrencyUSTORG: TFloatField
      FieldName = 'USTORG'
    end
    object ODSCurrencyUSTPOK: TFloatField
      FieldName = 'USTPOK'
    end
    object ODSCurrencyVALU_GEN: TStringField
      FieldName = 'VALU_GEN'
      Size = 10
    end
    object ODSCurrencyVALU_AZ: TStringField
      FieldName = 'VALU_AZ'
      Size = 25
    end
    object ODSCurrencyUSING: TIntegerField
      FieldName = 'USING'
    end
    object ODSCurrencyVALU_OTHER: TStringField
      FieldName = 'VALU_OTHER'
      Size = 25
    end
    object ODSCurrencyVALU_INTER: TStringField
      FieldName = 'VALU_INTER'
      Size = 3
    end
    object ODSCurrencyVALU_BALA: TStringField
      FieldName = 'VALU_BALA'
      Size = 25
    end
    object ODSCurrencyPRISTAVKA: TFloatField
      FieldName = 'PRISTAVKA'
    end
    object ODSCurrencyCOUNTRY: TStringField
      FieldName = 'COUNTRY'
    end
    object ODSCurrencyUST_POK1: TFloatField
      FieldName = 'UST_POK1'
    end
    object ODSCurrencyOFFICAL: TStringField
      FieldName = 'OFFICAL'
      Size = 5
    end
    object ODSCurrencyLIMIT: TFloatField
      FieldName = 'LIMIT'
    end
    object ODSCurrencyDEBET: TFloatField
      FieldName = 'DEBET'
    end
    object ODSCurrencyKREDIT: TFloatField
      FieldName = 'KREDIT'
    end
    object ODSCurrencyF5501P: TFloatField
      FieldName = 'F5501P'
    end
    object ODSCurrencyF5501V: TFloatField
      FieldName = 'F5501V'
    end
    object ODSCurrencySDEBET: TFloatField
      FieldName = 'SDEBET'
    end
    object ODSCurrencySCREDIT: TFloatField
      FieldName = 'SCREDIT'
    end
  end
  object DSCurrency: TDataSource
    DataSet = ODSCurrency
    Left = 552
    Top = 248
  end
  object ODSCardState: TOracleDataSet
    Session = sboapiDataModule.SBSession
    Left = 248
    Top = 632
  end
  object Sysdat: TOracleDataSet
    SQL.Strings = (
      'select tek_dat from sysdat')
    QBEDefinition.QBEFieldDefs = {04000000010000000700000054454B5F444154010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 488
    Top = 192
    object SysdatTEK_DAT: TDateTimeField
      FieldName = 'TEK_DAT'
      Required = True
    end
  end
  object Sysdata: TDataSource
    DataSet = Sysdat
    Left = 488
    Top = 248
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
      '  ac.name as Creditname,'
      '  p.NAME as Destination,'
      '  am.val_name as d_valute'
      'from'
      '  SMART.provarch p,'
      '  SMART.account ac,'
      '  SMART.avalute_t am'
      'where'
      '  (p.dat between :StartDate and :EndDate)'
      '  and (p.debt = :AccountID)'
      '  and (ac.id = p.kredit)'
      '  and (am.valute=ac.val_acc)'
      ' '
      'order by p.dat'
      ' ')
    Variables.Data = {
      03000000030000000A0000003A5354415254444154450C000000000000000000
      0000080000003A454E44444154450C00000000000000000000000A0000003A41
      43434F554E544944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000200000049440100000000000A0000004445424954414343
      49440100000000000D0000004F5045524154494F4E444154450100000000000B
      0000004445424954414D4F554E540100000000000C000000435245444954414D
      4F554E54010000000000070000004C414D4F554E540100000000000B00000043
      52454449544143434E4F0100000000000A0000004352454449544E414D450100
      000000000B00000044455354494E4154494F4E01000000000008000000445F56
      414C555445010000000000}
    DetailFields = 'DebitAccID'
    QueryAllRecords = False
    CountAllRecords = True
    Session = sboapiDataModule.SBSession
    OnCalcFields = DebetTransactionsDataCalcFields
    Left = 428
    Top = 337
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
    object DebetTransactionsDataCREDITACCNO: TStringField
      FieldName = 'CREDITACCNO'
    end
    object DebetTransactionsDataDESTINATION: TStringField
      FieldName = 'DESTINATION'
      Size = 255
    end
    object DebetTransactionsDataRowNumber: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'RowNumber'
      Calculated = True
    end
    object DebetTransactionsDataDebitAccNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'DebitAccNo'
      Size = 32
      Calculated = True
    end
    object DebetTransactionsDataD_VALUTE: TStringField
      FieldName = 'D_VALUTE'
      Size = 10
    end
    object DebetTransactionsDataCREDITNAME: TStringField
      FieldName = 'CREDITNAME'
      Size = 90
    end
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
      '  p.NAME as Destination,'
      '  am.val_name as c_valute,'
      '  ad.name as Debtname'
      ''
      'from'
      '  SMART.provarch p,'
      '  SMART.account ad,'
      '  SMART.avalute_t am'
      'where'
      '  (p.kredit = :AccountID)'
      '  and (p.dat between :StartDate and :EndDate)'
      '  and (ad.id = p.debt)'
      '  and (am.valute=ad.val_acc)'
      ''
      'order by p.dat')
    Variables.Data = {
      03000000030000000A0000003A5354415254444154450C000000000000000000
      0000080000003A454E44444154450C00000000000000000000000A0000003A41
      43434F554E544944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000200000049440100000000000B0000004352454449544143
      4349440100000000000D0000004F5045524154494F4E44415445010000000000
      0B0000004445424954414D4F554E540100000000000C00000043524544495441
      4D4F554E54010000000000070000004C414D4F554E540100000000000A000000
      44454249544143434E4F0100000000000B00000044455354494E4154494F4E01
      000000000008000000435F56414C55544501000000000008000000444542544E
      414D45010000000000}
    MasterFields = 'ACCID'
    DetailFields = 'CreditAccID'
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    OnCalcFields = CreditTransactionsDataCalcFields
    Left = 499
    Top = 337
    object CreditTransactionsDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object IntegerField2: TIntegerField
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
    object CreditTransactionsDataDEBITACCNO: TStringField
      FieldName = 'DEBITACCNO'
    end
    object CreditTransactionsDataDESTINATION: TStringField
      FieldName = 'DESTINATION'
      Size = 255
    end
    object CreditTransactionsDataCreditAccNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'CreditAccNo'
      Size = 32
      Calculated = True
    end
    object CreditTransactionsDataC_VALUTE: TStringField
      FieldName = 'C_VALUTE'
      Size = 10
    end
    object CreditTransactionsDataDEBTNAME: TStringField
      FieldName = 'DEBTNAME'
      Size = 90
    end
  end
  object DebetTransactions: TDataSource
    DataSet = DebetTransactionsData
    Left = 428
    Top = 392
  end
  object CreditTransactions: TDataSource
    DataSet = CreditTransactionsData
    Left = 500
    Top = 392
  end
  object temprate: TOracleDataSet
    Session = sboapiDataModule.SBSession
    Left = 192
    Top = 632
  end
  object Transaction: TOracleDataSet
    SQL.Strings = (
      'select c.rowid,c.* from transaction c')
    QBEDefinition.QBEFieldDefs = {
      040000000A00000007000000444542545F494401000000000009000000435245
      4449545F49440100000000000C000000444542545F414D4D4F554E5401000000
      00000E0000004352454449545F414D4D4F554E5401000000000007000000434F
      4E54454E54010000000000080000004C414D4D4F554E540100000000000B0000
      004352454449545F5241544501000000000009000000444542545F5241544501
      0000000000080000005245504F5254494401000000000008000000434F554E54
      524944010000000000}
    Session = sboapiDataModule.SBSession
    Left = 520
    Top = 32
  end
  object Transdata: TDataSource
    DataSet = Transaction
    Left = 520
    Top = 88
  end
  object OPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'customer_operations'
    Left = 240
    Top = 696
  end
  object Bankinfo: TOracleDataSet
    SQL.Strings = (
      'Select * From  Bankinfo')
    QBEDefinition.QBEFieldDefs = {
      040000002A000000050000004B4F445F420100000000000400000042414E4B01
      000000000007000000415A5F4E414D45010000000000040000004B524E4F0100
      0000000003000000494E4E010000000000050000005345484552010000000000
      0600000041445245535301000000000004000000534544520100000000000700
      0000425548414C54520100000000000300000054454C01000000000003000000
      4641580100000000000500000053574946540100000000000500000054454C45
      5801000000000005000000454D41494C01000000000007000000504F53545F49
      4E010000000000070000004B4F445F46494C0100000000000600000046494C49
      414C0100000000000900000041445245535F46494C0100000000000700000054
      454C5F46494C010000000000070000004641585F46494C010000000000090000
      0053574946545F46494C0100000000000900000054454C45585F46494C010000
      0000000A000000504F5354494E5F46494C010000000000090000005345484552
      5F46494C01000000000007000000494E4E5F46494C010000000000080000004B
      524E4F5F46494C010000000000070000005345445246494C0100000000000900
      0000425548414C5F46494C010000000000080000004B4F445F4246494C010000
      000000020000004E420100000000000700000056414C5F4D4F56010000000000
      040000004C4F474F000000000000040000004C494E4B01000000000003000000
      5344560100000000000300000053564D01000000000002000000424601000000
      00000C0000004D414E414745525449544C450100000000000F0000004143434F
      554E54414E545449544C450100000000000E00000053564D5F43555252454E43
      594944010000000000070000004341504954414C010000000000090000004153
      53495354414E540100000000000E000000415353495354414E545449544C4501
      0000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 288
    Top = 32
  end
  object Bankinfodata: TDataSource
    DataSet = Bankinfo
    Left = 288
    Top = 88
  end
  object memorial_date: TOracleDataSet
    SQL.Strings = (
      'select m.rowid,m.* from memorial_date m')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000A00000053544152545F4441544501000000000008000000
      454E445F44415445010000000000}
    Session = sboapiDataModule.SBSession
    Left = 408
    Top = 192
  end
  object memorial_date_data: TDataSource
    DataSet = memorial_date
    Left = 408
    Top = 248
  end
  object ACC: TOracleDataSet
    SQL.Strings = (
      'Select * from Account order by acc_no')
    QBEDefinition.QBEFieldDefs = {
      0400000016000000020000004944010000000000060000004B4C495F49440100
      00000000050000004F505F4944010000000000060000004143435F4E4F010000
      0000000700000056414C5F414343010000000000040000004E414D4501000000
      0000080000004F50454E5F44415401000000000009000000434C4F53455F4441
      540100000000000700000042414C5F434E310100000000000700000042414C5F
      434E320100000000000700000042414C5F434E33010000000000070000004241
      4C5F434E340100000000000600000046494C49414C0100000000000900000053
      494D5F4F54434554010000000000060000005449504143430100000000000500
      00004C494D49540100000000000A0000004F4C445F4143435F4E4F0100000000
      0008000000504149525F41434301000000000007000000494E53494445520100
      0000000004000000534944230100000000000600000054454D50494401000000
      0000050000004F574E4944010000000000}
    Session = sboapiDataModule.SBSession
    Left = 368
    Top = 32
    object ACCID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ACCKLI_ID: TFloatField
      FieldName = 'KLI_ID'
      Required = True
    end
    object ACCOP_ID: TFloatField
      FieldName = 'OP_ID'
    end
    object ACCACC_NO: TStringField
      FieldName = 'ACC_NO'
      Required = True
    end
    object ACCVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
      Required = True
    end
    object ACCNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object ACCOPEN_DAT: TDateTimeField
      FieldName = 'OPEN_DAT'
      Required = True
    end
    object ACCCLOSE_DAT: TDateTimeField
      FieldName = 'CLOSE_DAT'
    end
    object ACCBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
      Required = True
    end
    object ACCBAL_CN2: TFloatField
      FieldName = 'BAL_CN2'
    end
    object ACCBAL_CN3: TFloatField
      FieldName = 'BAL_CN3'
    end
    object ACCBAL_CN4: TFloatField
      FieldName = 'BAL_CN4'
    end
    object ACCFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object ACCSIM_OTCET: TFloatField
      FieldName = 'SIM_OTCET'
    end
    object ACCTIPACC: TStringField
      FieldName = 'TIPACC'
    end
    object ACCLIMIT: TFloatField
      FieldName = 'LIMIT'
    end
    object ACCOLD_ACC_NO: TStringField
      FieldName = 'OLD_ACC_NO'
    end
    object ACCPAIR_ACC: TFloatField
      FieldName = 'PAIR_ACC'
    end
    object ACCINSIDER: TStringField
      FieldName = 'INSIDER'
      Size = 1
    end
    object ACCSID: TFloatField
      FieldName = 'SID#'
    end
  end
  object ACC_Data: TDataSource
    DataSet = ACC
    Left = 368
    Top = 88
  end
  object avalutedata: TDataSource
    DataSet = avalute
    Left = 440
    Top = 88
  end
  object ACC_: TOracleDataSet
    SQL.Strings = (
      'select * from account order by acc_no')
    QBEDefinition.QBEFieldDefs = {
      0400000016000000020000004944010000000000060000004B4C495F49440100
      00000000050000004F505F4944010000000000060000004143435F4E4F010000
      0000000700000056414C5F414343010000000000040000004E414D4501000000
      0000080000004F50454E5F44415401000000000009000000434C4F53455F4441
      540100000000000700000042414C5F434E310100000000000700000042414C5F
      434E320100000000000700000042414C5F434E33010000000000070000004241
      4C5F434E340100000000000600000046494C49414C0100000000000900000053
      494D5F4F54434554010000000000060000005449504143430100000000000500
      00004C494D49540100000000000A0000004F4C445F4143435F4E4F0100000000
      0008000000504149525F41434301000000000007000000494E53494445520100
      0000000004000000534944230100000000000600000054454D50494401000000
      0000050000004F574E4944010000000000}
    Session = sboapiDataModule.SBSession
    Left = 744
    Top = 32
    object ACC_ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ACC_KLI_ID: TFloatField
      FieldName = 'KLI_ID'
      Required = True
    end
    object ACC_OP_ID: TFloatField
      FieldName = 'OP_ID'
    end
    object ACC_ACC_NO: TStringField
      FieldName = 'ACC_NO'
      Required = True
    end
    object ACC_VAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
      Required = True
    end
    object ACC_NAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object ACC_OPEN_DAT: TDateTimeField
      FieldName = 'OPEN_DAT'
      Required = True
    end
    object ACC_CLOSE_DAT: TDateTimeField
      FieldName = 'CLOSE_DAT'
    end
    object ACC_BAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
      Required = True
    end
    object ACC_BAL_CN2: TFloatField
      FieldName = 'BAL_CN2'
    end
    object ACC_BAL_CN3: TFloatField
      FieldName = 'BAL_CN3'
    end
    object ACC_BAL_CN4: TFloatField
      FieldName = 'BAL_CN4'
    end
    object ACC_FILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object ACC_SIM_OTCET: TFloatField
      FieldName = 'SIM_OTCET'
    end
    object ACC_TIPACC: TStringField
      FieldName = 'TIPACC'
    end
    object ACC_LIMIT: TFloatField
      FieldName = 'LIMIT'
    end
    object ACC_OLD_ACC_NO: TStringField
      FieldName = 'OLD_ACC_NO'
    end
    object ACC_PAIR_ACC: TFloatField
      FieldName = 'PAIR_ACC'
    end
    object ACC_INSIDER: TStringField
      FieldName = 'INSIDER'
      Size = 1
    end
    object ACC_SID: TFloatField
      FieldName = 'SID#'
    end
  end
  object ACC_data_: TDataSource
    DataSet = ACC_
    Left = 744
    Top = 88
  end
  object Trdestination: TOracleDataSet
    SQL.Strings = (
      'select * from Trdestination')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 48
    Top = 336
  end
  object Trdestinationdata: TDataSource
    DataSet = Trdestination
    Left = 48
    Top = 392
  end
  object ConvertationSymbols: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select * from CONVERT_ASSIGNMENTS'
      'order by ID'
      '')
    QBEDefinition.QBEFieldDefs = {
      04000000050000000200000049440100000000000900000053484F52544E414D
      450100000000000800000046554C4C5041544801000000000005000000455854
      524101000000000009000000444946464552454E54010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 632
    Top = 192
  end
  object ConvertationSymbolsData: TDataSource
    DataSet = ConvertationSymbols
    Left = 632
    Top = 248
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
    QBEDefinition.QBEFieldDefs = {
      04000000030000000600000053594D424F4C010000000000040000004E414D45
      0100000000000A0000004D4544494F4352495459010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 288
    Top = 472
    object CashSymbolsSYMBOL: TFloatField
      FieldName = 'SYMBOL'
      Required = True
    end
    object CashSymbolsNAME: TStringField
      FieldName = 'NAME'
      Size = 777
    end
    object CashSymbolsMEDIOCRITY: TFloatField
      FieldName = 'MEDIOCRITY'
    end
  end
  object CashSymbolsData: TDataSource
    DataSet = CashSymbols
    Left = 288
    Top = 528
  end
  object CO_Out: TOracleDataSet
    SQL.Strings = (
      ''
      'select'
      '    commision_trans.Rowid'
      '   ,id'
      '   ,name'
      '   ,debt'
      
        '   ,sb_complex_transactions.getaccountnumber(debt) as DebitAccou' +
        'nt'
      
        '   ,sb_complex_transactions.GetAccountCurrency(debt) as DebitCur' +
        'rency'
      '   ,credit'
      
        '   ,sb_complex_transactions.getaccountnumber(credit) as CreditAc' +
        'count'
      
        '   ,sb_complex_transactions.GetAccountCurrency(credit) as Credit' +
        'Currency'
      '   ,additionalDebt'
      '   ,additionalCredit'
      
        '   ,sb_complex_transactions.getaccountnumber(additionalDebt) as ' +
        'ADebt'
      
        '   ,sb_complex_transactions.GetAccountCurrency(additionalDebt) a' +
        's ADebitCurrency'
      
        '   ,sb_complex_transactions.getaccountnumber(additionalCredit) a' +
        's ACredit'
      
        '   ,sb_complex_transactions.GetAccountCurrency(additionalCredit)' +
        ' as ACreditCurrency'
      '   ,assignment'
      '   ,commisionassignment'
      '   ,UserID   '
      'from'
      '    commision_trans'
      '  where credit>0'
      'order by'
      '    commision_trans.ID'
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
      ''
      ' '
      ' '
      ' '
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
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      0400000011000000020000004944010000000000040000004E414D4501000000
      000004000000444542540100000000000C00000044454249544143434F554E54
      0100000000000D000000444542495443555252454E4359010000000000060000
      004352454449540100000000000D0000004352454449544143434F554E540100
      000000000E00000043524544495443555252454E43590100000000000E000000
      4144444954494F4E414C44454254010000000000100000004144444954494F4E
      414C4352454449540100000000000500000041444542540100000000000E0000
      0041444542495443555252454E43590100000000000700000041435245444954
      0100000000000F0000004143524544495443555252454E43590100000000000A
      00000041535349474E4D454E5401000000000013000000434F4D4D4953494F4E
      41535349474E4D454E5401000000000006000000555345524944010000000000}
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 472
  end
  object CO_Out_data: TDataSource
    DataSet = CO_Out
    Left = 48
    Top = 528
  end
  object CO_In: TOracleDataSet
    SQL.Strings = (
      'select'
      '    commision_trans.Rowid'
      '   ,id'
      '   ,name'
      '   ,debt'
      
        '   ,sb_complex_transactions.getaccountnumber(debt) as DebitAccou' +
        'nt'
      
        '   ,sb_complex_transactions.GetAccountCurrency(debt) as DebitCur' +
        'rency'
      '   ,credit'
      
        '   ,sb_complex_transactions.getaccountnumber(credit) as CreditAc' +
        'count'
      
        '   ,sb_complex_transactions.GetAccountCurrency(credit) as Credit' +
        'Currency'
      '   ,additionalDebt'
      '   ,additionalCredit'
      
        '   ,sb_complex_transactions.getaccountnumber(additionalDebt) as ' +
        'ADebt'
      
        '   ,sb_complex_transactions.GetAccountCurrency(additionalDebt) a' +
        's ADebitCurrency'
      
        '   ,sb_complex_transactions.getaccountnumber(additionalCredit) a' +
        's ACredit'
      
        '   ,sb_complex_transactions.GetAccountCurrency(additionalCredit)' +
        ' as ACreditCurrency'
      '   ,assignment'
      '   ,commisionassignment'
      '   ,UserID   '
      'from'
      '    commision_trans'
      'where debt>0'
      'order by'
      '    commision_trans.ID'
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
      ' '
      ' '
      ' ')
    QBEDefinition.QBEFieldDefs = {
      0400000011000000020000004944010000000000040000004E414D4501000000
      000004000000444542540100000000000C00000044454249544143434F554E54
      0100000000000D000000444542495443555252454E4359010000000000060000
      004352454449540100000000000D0000004352454449544143434F554E540100
      000000000E00000043524544495443555252454E43590100000000000E000000
      4144444954494F4E414C44454254010000000000100000004144444954494F4E
      414C4352454449540100000000000500000041444542540100000000000E0000
      0041444542495443555252454E43590100000000000700000041435245444954
      0100000000000F0000004143524544495443555252454E43590100000000000A
      00000041535349474E4D454E5401000000000013000000434F4D4D4953494F4E
      41535349474E4D454E5401000000000006000000555345524944010000000000}
    Session = sboapiDataModule.SBSession
    Left = 200
    Top = 336
    object CO_InID: TFloatField
      FieldName = 'ID'
    end
    object CO_InNAME: TStringField
      FieldName = 'NAME'
      Size = 150
    end
    object CO_InDEBT: TFloatField
      FieldName = 'DEBT'
    end
    object CO_InDEBITACCOUNT: TStringField
      FieldName = 'DEBITACCOUNT'
      Size = 4000
    end
    object CO_InDEBITCURRENCY: TStringField
      FieldName = 'DEBITCURRENCY'
      Size = 4000
    end
    object CO_InCREDIT: TFloatField
      FieldName = 'CREDIT'
    end
    object CO_InCREDITACCOUNT: TStringField
      FieldName = 'CREDITACCOUNT'
      Size = 4000
    end
    object CO_InCREDITCURRENCY: TStringField
      FieldName = 'CREDITCURRENCY'
      Size = 4000
    end
    object CO_InADDITIONALDEBT: TFloatField
      FieldName = 'ADDITIONALDEBT'
    end
    object CO_InADDITIONALCREDIT: TFloatField
      FieldName = 'ADDITIONALCREDIT'
    end
    object CO_InADEBT: TStringField
      FieldName = 'ADEBT'
      Size = 4000
    end
    object CO_InACREDIT: TStringField
      FieldName = 'ACREDIT'
      Size = 4000
    end
    object CO_InASSIGNMENT: TStringField
      FieldName = 'ASSIGNMENT'
      Size = 300
    end
    object CO_InCOMMISIONASSIGNMENT: TStringField
      FieldName = 'COMMISIONASSIGNMENT'
      Size = 300
    end
    object CO_InADEBITCURRENCY: TStringField
      FieldName = 'ADEBITCURRENCY'
      Size = 4000
    end
    object CO_InACREDITCURRENCY: TStringField
      FieldName = 'ACREDITCURRENCY'
      Size = 4000
    end
    object CO_InUSERID: TFloatField
      FieldName = 'USERID'
    end
  end
  object CO_In_data: TDataSource
    DataSet = CO_In
    Left = 200
    Top = 392
  end
  object OSCT: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SB_COMPLEX_TRANSACTIONS'
    Left = 312
    Top = 696
  end
  object TransactionsData: TDataSource
    DataSet = Transactions
    Left = 200
    Top = 528
  end
  object commission_trans_km: TOracleDataSet
    SQL.Strings = (
      'select * from commision_trans_km')
    QBEDefinition.QBEFieldDefs = {
      0400000006000000020000004944010000000000040000004445425401000000
      00000600000043524544495401000000000007000000435F56414C5545010000
      00000007000000445F56414C5545010000000000050000004444415445010000
      000000}
    Session = sboapiDataModule.SBSession
    Left = 472
    Top = 472
  end
  object commission_trans_data: TDataSource
    DataSet = commission_trans_km
    Left = 472
    Top = 528
  end
  object Transactions: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'Select * from transactionsp order by :title')
    Variables.Data = {
      0300000001000000060000003A5449544C450100000003000000696400000000
      00}
    QBEDefinition.QBEFieldDefs = {
      04000000200000000200000049440100000000000F0000005452414E53414354
      494F4E4441544501000000000007000000444542495449440100000000000A00
      000044454249544143434E4F0100000000000900000044454249544E414D4501
      0000000000070000004E4F5F50524F560100000000000F000000444542495443
      555252454E4359494401000000000012000000444542495443555252454E4359
      534E414D450100000000000800000043524544495449440100000000000B0000
      004352454449544143434E4F0100000000000A0000004352454449544E414D45
      0100000000001000000043524544495443555252454E43594944010000000000
      1300000043524544495443555252454E4359534E414D450100000000000B0000
      004445424954414D4F554E540100000000000C000000435245444954414D4F55
      4E54010000000000070000004C414D4F554E5401000000000009000000444542
      4954524154450100000000000A00000043524544495452415445010000000000
      09000000444542495442414E4B0100000000000A00000043524544495442414E
      4B0100000000000D0000005041434B4147454E554D4245520100000000000A00
      0000435950484552434F44450100000000000D0000004F5045524154494F4E43
      4F44450100000000000D000000494E42414C414E434543484152010000000000
      0E0000004F555442414C414E4345434841520100000000000800000046494C49
      414C49440100000000000C000000444542495442414C414E4345010000000000
      040000004E414D45010000000000060000005354415455530100000000000D00
      000052454A4543545F524541534F4E010000000000080000005245504F525449
      4401000000000008000000434F554E54524944010000000000}
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 200
    Top = 472
    object TransactionsID: TFloatField
      FieldName = 'ID'
    end
    object TransactionsTRANSACTIONDATE: TDateTimeField
      FieldName = 'TRANSACTIONDATE'
    end
    object TransactionsDEBITID: TFloatField
      FieldName = 'DEBITID'
    end
    object TransactionsDEBITACCNO: TStringField
      FieldName = 'DEBITACCNO'
    end
    object TransactionsDEBITNAME: TStringField
      FieldName = 'DEBITNAME'
      Size = 90
    end
    object TransactionsNO_PROV: TStringField
      FieldName = 'NO_PROV'
      Size = 8
    end
    object TransactionsDEBITCURRENCYID: TFloatField
      FieldName = 'DEBITCURRENCYID'
    end
    object TransactionsDEBITCURRENCYSNAME: TStringField
      FieldName = 'DEBITCURRENCYSNAME'
      Size = 10
    end
    object TransactionsCREDITID: TFloatField
      FieldName = 'CREDITID'
    end
    object TransactionsCREDITACCNO: TStringField
      FieldName = 'CREDITACCNO'
    end
    object TransactionsCREDITNAME: TStringField
      FieldName = 'CREDITNAME'
      Size = 90
    end
    object TransactionsCREDITCURRENCYID: TIntegerField
      FieldName = 'CREDITCURRENCYID'
    end
    object TransactionsCREDITCURRENCYSNAME: TStringField
      FieldName = 'CREDITCURRENCYSNAME'
      Size = 10
    end
    object TransactionsDEBITAMOUNT: TFloatField
      FieldName = 'DEBITAMOUNT'
    end
    object TransactionsCREDITAMOUNT: TFloatField
      FieldName = 'CREDITAMOUNT'
    end
    object TransactionsLAMOUNT: TFloatField
      FieldName = 'LAMOUNT'
    end
    object TransactionsDEBITRATE: TFloatField
      FieldName = 'DEBITRATE'
    end
    object TransactionsCREDITRATE: TFloatField
      FieldName = 'CREDITRATE'
    end
    object TransactionsDEBITBANK: TFloatField
      FieldName = 'DEBITBANK'
    end
    object TransactionsCREDITBANK: TFloatField
      FieldName = 'CREDITBANK'
    end
    object TransactionsPACKAGENUMBER: TIntegerField
      FieldName = 'PACKAGENUMBER'
    end
    object TransactionsCYPHERCODE: TIntegerField
      FieldName = 'CYPHERCODE'
    end
    object TransactionsOPERATIONCODE: TIntegerField
      FieldName = 'OPERATIONCODE'
    end
    object TransactionsINBALANCECHAR: TIntegerField
      FieldName = 'INBALANCECHAR'
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
    object TransactionsNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object TransactionsSTATUS: TFloatField
      FieldName = 'STATUS'
    end
    object TransactionsREJECT_REASON: TStringField
      FieldName = 'REJECT_REASON'
      Size = 255
    end
    object TransactionsREPORTID: TFloatField
      FieldName = 'REPORTID'
    end
    object TransactionsCOUNTRID: TFloatField
      FieldName = 'COUNTRID'
    end
  end
  object prov: TOracleDataSet
    Session = sboapiDataModule.SBSession
    Left = 280
    Top = 192
  end
  object prov_data: TDataSource
    DataSet = prov
    Left = 280
    Top = 248
  end
  object OperationTypesData: TDataSource
    DataSet = OperationTypes
    Left = 584
    Top = 528
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
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 584
    Top = 472
  end
  object ODSValuteName: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  valute'
      '  ,valu_name'
      '  ,valu_bala '
      'From'
      '   Avalute '
      ''
      'where valute =:Valute ')
    Variables.Data = {0300000001000000070000003A56414C555445030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000600000056414C5554450100000000000900000056414C55
      5F4E414D450100000000000900000056414C555F42414C41010000000000}
    Session = sboapiDataModule.SBSession
    Left = 392
    Top = 632
    object ODSValuteNameVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object ODSValuteNameVALU_NAME: TStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
    object ODSValuteNameVALU_BALA: TStringField
      FieldName = 'VALU_BALA'
      Size = 25
    end
  end
  object OPCash: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SB_CASHREPORT'
    Left = 512
    Top = 696
  end
  object ODSTransactionsViewer: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PR.DAT,PR.ID as ID'
      
        ' ,AC1.ACC_NO AS DEBIT,AC1.KLI_ID AS DEBTID,AC1.FILIAL as DebetFi' +
        'lial'
      ' ,AC1.NAME AS DNAME,AC2.KLI_ID AS KREDITID'
      
        ' ,PR.VAL_ACC AS DCURRENCY, sb_complex_transactions.GetCurrencyNa' +
        'me(PR.VAL_ACC) as DebtCurName'
      ' ,AC2.ACC_NO AS KREDIT,AC1.KLI_ID,AC2.FILIAL as CreditFilial'
      ' ,AC2.NAME  AS  KNAME'
      ' ,AC1.BAL_CN1 AS DEBTCOME'
      ' ,AC2.BAL_CN1 AS CREDITCOME'
      
        ' ,PR.CURRENCYID_C AS KCURRENCY, sb_complex_transactions.GetCurre' +
        'ncyName(PR.CURRENCYID_C) as CreditCurName'
      ' ,PR.AMMOUNT  AS DAMMOUNT'
      ' ,PR.AMMOUNT_C AS KAMMOUNT'
      ' ,PR.LAMMOUNT AS LAMMOUNT'
      ' ,PR.KASSA_B AS BSYMBOL, PR.NO_PROV'
      ' ,PR.OP_ID AS OperatorID'
      ' ,PR.NAME AS ASSIGNMENT'
      ' FROM  PROVARCH PR,ACCOUNT AC1,ACCOUNT AC2'
      '      ,BAL_SPR1 REFERENCE'
      ' WHERE'
      '        AC1.ID=PR.DEBT'
      '    AND AC2.ID=PR.KREDIT'
      '    AND PR.DAT>=:FIRSTDATE'
      '    AND PR.DAT<=:LASTDATE'
      ''
      '    AND REFERENCE.CASHINCOMING=1'
      ''
      '    ORDER BY  :Title'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Variables.Data = {
      03000000030000000A0000003A4649525354444154450C000000000000000000
      0000090000003A4C415354444154450C0000000000000000000000060000003A
      5449544C45010000000700000050522E4441540000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000018000000030000004441540100000000000200000049440100000000
      0005000000444542495401000000000006000000444542544944010000000000
      0B000000444542455446494C49414C01000000000005000000444E414D450100
      00000000080000004B5245444954494401000000000009000000444355525245
      4E43590100000000000B000000444542544355524E414D450100000000000600
      00004B5245444954010000000000060000004B4C495F49440100000000000C00
      000043524544495446494C49414C010000000000050000004B4E414D45010000
      0000000800000044454254434F4D450100000000000A00000043524544495443
      4F4D45010000000000090000004B43555252454E43590100000000000D000000
      4352454449544355524E414D450100000000000800000044414D4D4F554E5401
      0000000000080000004B414D4D4F554E54010000000000080000004C414D4D4F
      554E54010000000000070000004253594D424F4C010000000000070000004E4F
      5F50524F560100000000000A0000004F50455241544F5249440100000000000A
      00000041535349474E4D454E54010000000000}
    Session = sboapiDataModule.SBSession
    Left = 687
    Top = 472
    object ODSTransactionsViewerDAT: TDateTimeField
      FieldName = 'DAT'
      Required = True
    end
    object ODSTransactionsViewerID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSTransactionsViewerDEBIT: TStringField
      FieldName = 'DEBIT'
      Required = True
    end
    object ODSTransactionsViewerDEBTID: TFloatField
      FieldName = 'DEBTID'
      Required = True
    end
    object ODSTransactionsViewerDEBETFILIAL: TIntegerField
      FieldName = 'DEBETFILIAL'
    end
    object ODSTransactionsViewerDNAME: TStringField
      FieldName = 'DNAME'
      Size = 90
    end
    object ODSTransactionsViewerKREDITID: TFloatField
      FieldName = 'KREDITID'
      Required = True
    end
    object ODSTransactionsViewerDCURRENCY: TFloatField
      FieldName = 'DCURRENCY'
      Required = True
    end
    object ODSTransactionsViewerDEBTCURNAME: TStringField
      FieldName = 'DEBTCURNAME'
      Size = 4000
    end
    object ODSTransactionsViewerKREDIT: TStringField
      FieldName = 'KREDIT'
      Required = True
    end
    object ODSTransactionsViewerKLI_ID: TFloatField
      FieldName = 'KLI_ID'
      Required = True
    end
    object ODSTransactionsViewerCREDITFILIAL: TIntegerField
      FieldName = 'CREDITFILIAL'
    end
    object ODSTransactionsViewerKNAME: TStringField
      FieldName = 'KNAME'
      Size = 90
    end
    object ODSTransactionsViewerDEBTCOME: TFloatField
      FieldName = 'DEBTCOME'
      Required = True
    end
    object ODSTransactionsViewerCREDITCOME: TFloatField
      FieldName = 'CREDITCOME'
      Required = True
    end
    object ODSTransactionsViewerKCURRENCY: TIntegerField
      FieldName = 'KCURRENCY'
      Required = True
    end
    object ODSTransactionsViewerCREDITCURNAME: TStringField
      FieldName = 'CREDITCURNAME'
      Size = 4000
    end
    object ODSTransactionsViewerDAMMOUNT: TFloatField
      FieldName = 'DAMMOUNT'
      Required = True
    end
    object ODSTransactionsViewerKAMMOUNT: TFloatField
      FieldName = 'KAMMOUNT'
      Required = True
    end
    object ODSTransactionsViewerLAMMOUNT: TFloatField
      FieldName = 'LAMMOUNT'
      Required = True
    end
    object ODSTransactionsViewerBSYMBOL: TIntegerField
      FieldName = 'BSYMBOL'
    end
    object ODSTransactionsViewerNO_PROV: TStringField
      FieldName = 'NO_PROV'
      Size = 8
    end
    object ODSTransactionsViewerOPERATORID: TFloatField
      FieldName = 'OPERATORID'
    end
    object ODSTransactionsViewerASSIGNMENT: TStringField
      FieldName = 'ASSIGNMENT'
      Size = 255
    end
  end
  object DataSrcViewer: TDataSource
    DataSet = ODSTransactionsViewer
    Left = 687
    Top = 525
  end
  object BrowseCashInfo: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '       issuedby,'
      '       max(id) as id, '
      '       max(person_doc) as person_doc, '
      '       max(seria) as seria, '
      '       max(docnumber) as docnumber, '
      '       max(fromwhen) as fromwhen'
      'FROM cashinfo '
      'group by issuedby'
      'order by issuedby')
    QBEDefinition.QBEFieldDefs = {
      0400000006000000080000004953535545444259010000000000020000004944
      0100000000000A000000504552534F4E5F444F43010000000000050000005345
      52494101000000000009000000444F434E554D42455201000000000008000000
      46524F4D5748454E010000000000}
    Session = sboapiDataModule.SBSession
    Left = 528
    Top = 632
  end
  object SB_TRANSACTION: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SB_TRANSACTION'
    ParameterMode = pmNamed
    Left = 440
    Top = 696
  end
  object Buyer: TOracleDataSet
    SQL.Strings = (
      'select * from cc_buyers where id in (select ownid from account )')
    Session = sboapiDataModule.SBSession
    Left = 672
    Top = 632
  end
  object Country: TOracleDataSet
    SQL.Strings = (
      'select c.rowid,c.* from  countries c'
      ' ')
    QBEDefinition.QBEFieldDefs = {
      040000000200000002000000494401000000000009000000434E54525F4E414D
      45010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 128
    Top = 336
  end
  object countrydata: TDataSource
    DataSet = Country
    Left = 128
    Top = 392
  end
  object cities: TOracleDataSet
    SQL.Strings = (
      'select * from cities')
    QBEDefinition.QBEFieldDefs = {
      04000000030000000200000049440100000000000A000000434F554E5452595F
      494401000000000009000000434954595F4E414D45010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 680
    Top = 32
  end
  object ctiesdata: TDataSource
    DataSet = cities
    Left = 680
    Top = 88
  end
  object physical_customers: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'PHYSICAL_CUSTOMERSFS'
    Left = 53
    Top = 696
  end
  object ad_citites: TDataSource
    DataSet = ad_cities
    Left = 272
    Top = 392
  end
  object ad_cities: TOracleDataSet
    SQL.Strings = (
      'select * from cities'
      '')
    QBEDefinition.QBEFieldDefs = {
      04000000030000000200000049440100000000000A000000434F554E5452595F
      494401000000000009000000434954595F4E414D45010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 272
    Top = 336
  end
  object ad_country: TOracleDataSet
    SQL.Strings = (
      'select c.rowid,c.* from  countries c'
      ' '
      '')
    QBEDefinition.QBEFieldDefs = {
      040000000200000002000000494401000000000009000000434E54525F4E414D
      45010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 600
    Top = 336
  end
  object ad_countrydata: TDataSource
    DataSet = ad_country
    Left = 600
    Top = 392
  end
  object P_Customers: TOracleDataSet
    SQL.Strings = (
      'Select * from customers_physicalfs order by :title')
    Variables.Data = {
      0300000001000000060000003A5449544C450100000003000000696400000000
      00}
    QBEDefinition.QBEFieldDefs = {
      04000000120000000200000049440100000000000800000050415353504F5254
      010000000000090000004249525448444154450100000000000A000000424952
      5448504C4143450100000000000A00000046414D5F5354415455530100000000
      00060000004144524553530100000000000500000050484F4E45010000000000
      05000000454D41494C010000000000080000004F50454E444154450100000000
      0003000000534558010000000000060000005553455249440100000000000C00
      000050415353505F4E554D4245520100000000000A000000414452535F535441
      544501000000000009000000414452535F434954590100000000000B00000042
      495254485F53544154450100000000000900000050484F4E455F4D4F42010000
      00000009000000435553545F4E414D4501000000000003000000494E4E010000
      000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 376
    Top = 472
    object P_CustomersID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object P_CustomersCUST_NAME: TStringField
      FieldName = 'CUST_NAME'
      Size = 90
    end
    object P_CustomersPASSPORT: TStringField
      FieldName = 'PASSPORT'
      Size = 30
    end
    object P_CustomersBIRTHDATE: TDateTimeField
      FieldName = 'BIRTHDATE'
    end
    object P_CustomersBIRTHPLACE: TStringField
      FieldName = 'BIRTHPLACE'
      Size = 30
    end
    object P_CustomersFAM_STATUS: TIntegerField
      FieldName = 'FAM_STATUS'
    end
    object P_CustomersADRESS: TStringField
      FieldName = 'ADRESS'
      Size = 100
    end
    object P_CustomersPHONE: TStringField
      FieldName = 'PHONE'
      Size = 30
    end
    object P_CustomersEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 30
    end
    object P_CustomersOPENDATE: TDateTimeField
      FieldName = 'OPENDATE'
    end
    object P_CustomersSEX: TIntegerField
      FieldName = 'SEX'
    end
    object P_CustomersUSERID: TFloatField
      FieldName = 'USERID'
    end
    object P_CustomersPASSP_NUMBER: TStringField
      FieldName = 'PASSP_NUMBER'
      Size = 30
    end
    object P_CustomersADRS_STATE: TStringField
      FieldName = 'ADRS_STATE'
      Size = 30
    end
    object P_CustomersADRS_CITY: TStringField
      FieldName = 'ADRS_CITY'
      Size = 30
    end
    object P_CustomersBIRTH_STATE: TStringField
      FieldName = 'BIRTH_STATE'
      Size = 30
    end
    object P_CustomersPHONE_MOB: TStringField
      FieldName = 'PHONE_MOB'
      Size = 30
    end
    object P_CustomersINN: TStringField
      FieldName = 'INN'
    end
  end
  object P_CustomersData: TDataSource
    DataSet = P_Customers
    Left = 376
    Top = 528
  end
  object pasp: TOracleDataSet
    SQL.Strings = (
      'select r.rowid ,r.* from cc_buyers r')
    Session = sboapiDataModule.SBSession
    Left = 712
    Top = 632
  end
  object ODSMainState: TOracleDataSet
    SQL.Strings = (
      'select'
      '  ac.id       as AccountId,'
      '  ac.kli_id   as CustomerId, '
      '  ac.acc_no   as AccountNumber,'
      '  ac.op_id    as OperatorId,'
      '  ac.val_acc  as CurrencyId,'
      '  ac.name     as AccountName,'
      '  c.name      as CustomerName,'
      '  c.inn       as CustomerVoin,'
      '  ac.bal_cn1  as BalanceCode,'
      '  av.val_name as CurrencyName, '
      '  ac.open_dat as OpenDate, '
      
        '  ac.filial   as Filial   from account ac,customers c,avalute av' +
        ',bal_spr1 b  where '
      ' ac.val_acc = av.valute '
      ' and'
      ' ac.kli_id=c.id '
      ' and'
      
        ' ac.bal_cn1=b.bal_cn  and (ac.acc_no in ('#39'1001001'#39') or  ac.Bal_C' +
        'n1 in(1001)) order by ac.acc_no')
    QBEDefinition.QBEFieldDefs = {
      040000000C000000090000004143434F554E5449440100000000000A00000043
      5553544F4D455249440100000000000D0000004143434F554E544E554D424552
      0100000000000A0000004F50455241544F5249440100000000000A0000004355
      5252454E435949440100000000000B0000004143434F554E544E414D45010000
      0000000C000000435553544F4D45524E414D450100000000000C000000435553
      544F4D4552564F494E0100000000000B00000042414C414E4345434F44450100
      000000000C00000043555252454E43594E414D45010000000000080000004F50
      454E444154450100000000000600000046494C49414C010000000000}
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 32
  end
  object DSMainState: TDataSource
    DataSet = ODSMainState
    Left = 48
    Top = 88
  end
  object ODSExtractTrans: TOracleDataSet
    SQL.Strings = (
      '')
    Variables.Data = {
      03000000010000000D0000003A4F574E4143434F554E54494403000000040000
      003C00000000000000}
    Master = ODSMainState
    MasterFields = 'AccountId'
    DetailFields = 'OwnAccountId'
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 192
  end
  object DSExtractTrans: TDataSource
    DataSet = ODSExtractTrans
    Left = 48
    Top = 248
  end
  object AccSettings: TOracleDataSet
    SQL.Strings = (
      
        'select id, accnumber, val_code, val_name, bal_cn1, bal_name, cus' +
        't_id,'
      '       cust_name, open_date, tw_acc_number, acc_symbol, limit,'
      
        '       to_char(sb_aca.getuserfilial(uid)) branch_id, branch_name' +
        ', acc_name, symbol, ostat, pok_ostat'
      ' from acc_Settings order by :title')
    Variables.Data = {
      0300000001000000060000003A5449544C450100000003000000696400000000
      00}
    QBEDefinition.QBEFieldDefs = {
      0400000012000000020000004944010000000000090000004143434E554D4245
      520100000000000800000056414C5F434F44450100000000000800000056414C
      5F4E414D450100000000000700000042414C5F434E3101000000000008000000
      42414C5F4E414D4501000000000007000000435553545F494401000000000009
      000000435553545F4E414D45010000000000090000004F50454E5F4441544501
      00000000000D00000054575F4143435F4E554D4245520100000000000A000000
      4143435F53594D424F4C010000000000050000004C494D495401000000000009
      0000004252414E43485F49440100000000000B0000004252414E43485F4E414D
      45010000000000080000004143435F4E414D450100000000000600000053594D
      424F4C010000000000050000004F5354415401000000000009000000504F4B5F
      4F53544154010000000000}
    Session = sboapiDataModule.SBSession
    Left = 120
    Top = 472
    object AccSettingsACCNUMBER: TStringField
      FieldName = 'ACCNUMBER'
    end
    object AccSettingsVAL_CODE: TStringField
      FieldName = 'VAL_CODE'
      Size = 10
    end
    object AccSettingsVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 40
    end
    object AccSettingsBAL_CN1: TStringField
      FieldName = 'BAL_CN1'
      Size = 10
    end
    object AccSettingsBAL_NAME: TStringField
      FieldName = 'BAL_NAME'
      Size = 181
    end
    object AccSettingsCUST_ID: TStringField
      FieldName = 'CUST_ID'
      Size = 10
    end
    object AccSettingsCUST_NAME: TStringField
      FieldName = 'CUST_NAME'
      Size = 60
    end
    object AccSettingsOPEN_DATE: TStringField
      FieldName = 'OPEN_DATE'
      Size = 10
    end
    object AccSettingsTW_ACC_NUMBER: TStringField
      FieldName = 'TW_ACC_NUMBER'
      Size = 30
    end
    object AccSettingsACC_SYMBOL: TStringField
      FieldName = 'ACC_SYMBOL'
      Size = 10
    end
    object AccSettingsLIMIT: TStringField
      FieldName = 'LIMIT'
      Size = 10
    end
    object AccSettingsBRANCH_ID: TStringField
      FieldName = 'BRANCH_ID'
      Size = 10
    end
    object AccSettingsBRANCH_NAME: TStringField
      FieldName = 'BRANCH_NAME'
      Size = 40
    end
    object AccSettingsACC_NAME: TStringField
      FieldName = 'ACC_NAME'
      Size = 100
    end
    object AccSettingsSYMBOL: TStringField
      FieldName = 'SYMBOL'
      Size = 10
    end
    object AccSettingsOSTAT: TStringField
      FieldName = 'OSTAT'
      Size = 10
    end
    object AccSettingsPOK_OSTAT: TStringField
      FieldName = 'POK_OSTAT'
      Size = 10
    end
  end
  object AccSettingsdata: TDataSource
    DataSet = AccSettings
    Left = 120
    Top = 528
  end
  object AccFlags: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select '#39' '#39' as symbol, '#39'Бцтцн символлар'#39' as Name from Dual'
      'Union All'
      'SELECT symbol, symbol||'#39'     '#39'||description as name'
      '  FROM account_flags')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000600000053594D424F4C010000000000040000004E414D45
      010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 600
    Top = 31
    object AccFlagsSYMBOL: TStringField
      FieldName = 'SYMBOL'
      Size = 1
    end
    object AccFlagsNAME: TStringField
      FieldName = 'NAME'
      Size = 70
    end
  end
  object AccFlagsData: TDataSource
    DataSet = AccFlags
    Left = 600
    Top = 85
  end
  object SBUTIL: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SBUTIL'
    ParameterMode = pmNamed
    Left = 368
    Top = 696
  end
  object AccFlag: TOracleDataSet
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
      'ORDER BY '
      '   :title')
    Variables.Data = {
      0300000001000000060000003A5449544C4501000000070000006163635F6E6F
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000014000000020000004944010000000000060000004B4C495F49440100
      00000000050000004F505F4944010000000000060000004143435F4E4F010000
      0000000700000056414C5F414343010000000000040000004E414D4501000000
      0000080000004F50454E5F44415401000000000009000000434C4F53455F4441
      54010000000000060000005354415455530100000000000700000042414C5F43
      4E310100000000000700000042414C5F434E320100000000000700000042414C
      5F434E330100000000000700000042414C5F434E340100000000000600000046
      494C49414C0100000000000900000053494D5F4F544345540100000000000600
      0000544950414343010000000000050000004C494D49540100000000000A0000
      004F4C445F4143435F4E4F01000000000008000000504149525F414343010000
      00000007000000494E5349444552010000000000}
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 736
    Top = 192
    object AccFlagID: TFloatField
      FieldName = 'ID'
    end
    object AccFlagKLI_ID: TFloatField
      FieldName = 'KLI_ID'
      Required = True
    end
    object AccFlagOP_ID: TFloatField
      FieldName = 'OP_ID'
    end
    object AccFlagACC_NO: TStringField
      DisplayLabel = 'Щесаб №'
      FieldName = 'ACC_NO'
      Required = True
    end
    object AccFlagVAL_ACC: TIntegerField
      DisplayLabel = '$'
      FieldName = 'VAL_ACC'
      Required = True
    end
    object AccFlagNAME: TStringField
      DisplayLabel = 'Щесабын ады'
      FieldName = 'NAME'
      Size = 90
    end
    object AccFlagOPEN_DAT: TDateTimeField
      DisplayLabel = 'Ачылма тарихи'
      FieldName = 'OPEN_DAT'
      Required = True
    end
    object AccFlagCLOSE_DAT: TDateTimeField
      DisplayLabel = 'Баьланма тарихи'
      FieldName = 'CLOSE_DAT'
    end
    object AccFlagSTATUS: TFloatField
      FieldName = 'STATUS'
    end
    object AccFlagBAL_CN1: TFloatField
      DisplayLabel = 'Баланс №'
      FieldName = 'BAL_CN1'
      Required = True
    end
    object AccFlagBAL_CN2: TFloatField
      FieldName = 'BAL_CN2'
    end
    object AccFlagBAL_CN3: TFloatField
      FieldName = 'BAL_CN3'
    end
    object AccFlagBAL_CN4: TFloatField
      FieldName = 'BAL_CN4'
    end
    object AccFlagFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object AccFlagSIM_OTCET: TFloatField
      FieldName = 'SIM_OTCET'
    end
    object AccFlagTIPACC: TStringField
      FieldName = 'TIPACC'
    end
    object AccFlagLIMIT: TFloatField
      FieldName = 'LIMIT'
    end
    object AccFlagOLD_ACC_NO: TStringField
      FieldName = 'OLD_ACC_NO'
    end
    object AccFlagPAIR_ACC: TFloatField
      FieldName = 'PAIR_ACC'
    end
    object AccFlagINSIDER: TStringField
      FieldName = 'INSIDER'
      Size = 1
    end
  end
  object AccountData: TDataSource
    DataSet = AccFlag
    Left = 736
    Top = 248
  end
  object ReportDesc: TOracleDataSet
    SQL.Strings = (
      'select d.*, d.rowid from reportdescs d'
      'order by name')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 670
    Top = 336
  end
  object ReportDescsData: TDataSource
    DataSet = ReportDesc
    Left = 672
    Top = 392
  end
  object Cntries: TOracleDataSet
    SQL.Strings = (
      'select d.*, d.rowid from provcountries d'
      'order by name')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 742
    Top = 336
  end
  object CntriesData: TDataSource
    DataSet = Cntries
    Left = 744
    Top = 392
  end
  object RepSymbol: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select * from REPORT_SYMBOL'
      'order by id')
    Variables.Data = {
      0300000001000000060000003A5449544C4501000000070000006163635F6E6F
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 800
    Top = 192
    object RepSymbolID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object RepSymbolNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 256
    end
  end
  object RepSymbData: TDataSource
    DataSet = RepSymbol
    Left = 800
    Top = 248
  end
end
