object InsDataMod: TInsDataMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 204
  Top = 232
  Height = 602
  Width = 871
  object DSInsCustomers: TDataSource
    DataSet = ODSInsCustomers
    Left = 56
    Top = 64
  end
  object ODSInsCustomers: TOracleDataSet
    SQL.Strings = (
      'select ic.rowid, ic.* from ins_Customers ic WHERE CLOSE_PREFIX=0')
    QBEDefinition.QBEFieldDefs = {
      040000001A00000002000000494401000000000007000000435553545F494401
      0000000000040000004E414D45010000000000070000005355524E414D450100
      000000000A0000004641544845524E414D4501000000000009000000484F4D45
      50484F4E4501000000000009000000574F524B50484F4E450100000000000B00
      00004D4F42494C4550484F4E4501000000000003000000464158010000000000
      07000000414444524553530100000000000B000000444154454F464249525448
      0100000000000C000000504C4143454F46424952544801000000000003000000
      4147450100000000000300000053455801000000000009000000504153504F52
      544E4F010000000000050000004D535F49440100000000000400000043495459
      01000000000006000000494E4445585F0100000000000E0000004D41494C494E
      4741444452455353010000000000060000004F43435F49440100000000000500
      000045445F494401000000000005000000535441544501000000000006000000
      4143545F49440100000000000D000000434F4E54414354504552534F4E010000
      00000012000000434F4E54414354504552534F4E50484F4E450100000000000C
      000000434C4F53455F505245464958010000000000}
    Session = sboapiDataModule.SBSession
    BeforeDelete = ODSInsCustomersBeforeDelete
    AfterScroll = ODSInsCustomersAfterScroll
    Left = 56
    Top = 16
    object ODSInsCustomersID: TIntegerField
      FieldName = 'ID'
    end
    object ODSInsCustomersCUST_ID: TIntegerField
      FieldName = 'CUST_ID'
    end
    object ODSInsCustomersNAME: TStringField
      FieldName = 'NAME'
      Size = 128
    end
    object ODSInsCustomersSURNAME: TStringField
      FieldName = 'SURNAME'
      Size = 128
    end
    object ODSInsCustomersFATHERNAME: TStringField
      FieldName = 'FATHERNAME'
      Size = 128
    end
    object ODSInsCustomersHOMEPHONE: TStringField
      FieldName = 'HOMEPHONE'
      Size = 32
    end
    object ODSInsCustomersWORKPHONE: TStringField
      FieldName = 'WORKPHONE'
      Size = 32
    end
    object ODSInsCustomersMOBILEPHONE: TStringField
      FieldName = 'MOBILEPHONE'
      Size = 32
    end
    object ODSInsCustomersFAX: TStringField
      FieldName = 'FAX'
      Size = 32
    end
    object ODSInsCustomersADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 1024
    end
    object ODSInsCustomersDATEOFBIRTH: TDateTimeField
      FieldName = 'DATEOFBIRTH'
    end
    object ODSInsCustomersPLACEOFBIRTH: TStringField
      FieldName = 'PLACEOFBIRTH'
      Size = 256
    end
    object ODSInsCustomersAGE: TIntegerField
      FieldName = 'AGE'
    end
    object ODSInsCustomersSEX: TIntegerField
      FieldName = 'SEX'
    end
    object ODSInsCustomersPASPORTNO: TStringField
      FieldName = 'PASPORTNO'
      Size = 64
    end
    object ODSInsCustomersMS_ID: TIntegerField
      FieldName = 'MS_ID'
    end
    object ODSInsCustomersCITY: TStringField
      FieldName = 'CITY'
      Size = 64
    end
    object ODSInsCustomersINDEX_: TStringField
      FieldName = 'INDEX_'
      Size = 32
    end
    object ODSInsCustomersMAILINGADDRESS: TStringField
      FieldName = 'MAILINGADDRESS'
      Size = 1024
    end
    object ODSInsCustomersOCC_ID: TIntegerField
      FieldName = 'OCC_ID'
    end
    object ODSInsCustomersED_ID: TIntegerField
      FieldName = 'ED_ID'
    end
    object ODSInsCustomersSTATE: TStringField
      FieldName = 'STATE'
      Size = 64
    end
    object ODSInsCustomersACT_ID: TIntegerField
      FieldName = 'ACT_ID'
    end
    object ODSInsCustomersCONTACTPERSON: TStringField
      FieldName = 'CONTACTPERSON'
      Size = 256
    end
    object ODSInsCustomersCONTACTPERSONPHONE: TStringField
      FieldName = 'CONTACTPERSONPHONE'
      Size = 32
    end
    object ODSInsCustomersCLOSE_PREFIX: TIntegerField
      FieldName = 'CLOSE_PREFIX'
    end
  end
  object DSCustomers: TDataSource
    DataSet = ODSCustomers
    Left = 160
    Top = 64
  end
  object ODSCustomers: TOracleDataSet
    SQL.Strings = (
      'select id, name from customers')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    AfterFetchRecord = ODSCustomersAfterFetchRecord
    Session = sboapiDataModule.SBSession
    Left = 160
    Top = 16
    object ODSCustomersID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ODSCustomersNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object ODSAccount: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'SELECT   '
      
        '   acc.RowID, ID, kli_id, op_id, acc_no, val_acc, NAME, open_dat' +
        ', close_dat,'
      
        '   DECODE (close_dat, NULL, 1, 2) AS status, bal_cn1, bal_cn2, b' +
        'al_cn3,'
      
        '   bal_cn4, filial, sim_otcet, tipacc, LIMIT, old_acc_no, pair_a' +
        'cc,'
      '   insider, ownid, t.ostat, t.pok_ostat'
      'FROM ACCOUNT partition (activacc) acc, tenostat t'
      'where  t.acc_id = acc.id'
      'and'
      ' ownid = :ownid'
      'ORDER BY '
      '   acc_no')
    Variables.Data = {0300000001000000060000003A4F574E4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000017000000020000004944010000000000060000004B4C495F49440100
      00000000050000004F505F4944010000000000060000004143435F4E4F010000
      0000000700000056414C5F414343010000000000040000004E414D4501000000
      0000080000004F50454E5F44415401000000000009000000434C4F53455F4441
      54010000000000060000005354415455530100000000000700000042414C5F43
      4E310100000000000700000042414C5F434E320100000000000700000042414C
      5F434E330100000000000700000042414C5F434E340100000000000600000046
      494C49414C0100000000000900000053494D5F4F544345540100000000000600
      0000544950414343010000000000050000004C494D49540100000000000A0000
      004F4C445F4143435F4E4F01000000000008000000504149525F414343010000
      00000007000000494E5349444552010000000000050000004F574E4944010000
      000000050000004F5354415401000000000009000000504F4B5F4F5354415401
      0000000000}
    Master = ODSContracts
    MasterFields = 'id'
    DetailFields = 'ownid'
    QueryAllRecords = False
    AfterFetchRecord = ODSAccountAfterFetchRecord
    Session = sboapiDataModule.SBSession
    BeforeDelete = ODSAccountBeforeDelete
    OnCalcFields = ODSAccountCalcFields
    Left = 248
    Top = 8
    object ODSAccountID: TFloatField
      FieldName = 'ID'
    end
    object ODSAccountKLI_ID: TFloatField
      FieldName = 'KLI_ID'
      Required = True
    end
    object ODSAccountOP_ID: TFloatField
      FieldName = 'OP_ID'
    end
    object ODSAccountACC_NO: TStringField
      DisplayLabel = 'Щесаб №'
      FieldName = 'ACC_NO'
      Required = True
    end
    object ODSAccountVAL_ACC: TIntegerField
      DisplayLabel = '$'
      FieldName = 'VAL_ACC'
      Required = True
    end
    object ODSAccountNAME: TStringField
      DisplayLabel = 'Щесабын ады'
      FieldName = 'NAME'
      Size = 90
    end
    object ODSAccountOPEN_DAT: TDateTimeField
      DisplayLabel = 'Ачылма тарихи'
      FieldName = 'OPEN_DAT'
      Required = True
    end
    object ODSAccountCLOSE_DAT: TDateTimeField
      DisplayLabel = 'Баьланма тарихи'
      FieldName = 'CLOSE_DAT'
    end
    object ODSAccountSTATUS: TFloatField
      FieldName = 'STATUS'
    end
    object ODSAccountBAL_CN1: TFloatField
      DisplayLabel = 'Баланс №'
      FieldName = 'BAL_CN1'
      Required = True
    end
    object ODSAccountBAL_CN2: TFloatField
      FieldName = 'BAL_CN2'
    end
    object ODSAccountBAL_CN3: TFloatField
      FieldName = 'BAL_CN3'
    end
    object ODSAccountBAL_CN4: TFloatField
      FieldName = 'BAL_CN4'
    end
    object ODSAccountFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object ODSAccountSIM_OTCET: TFloatField
      FieldName = 'SIM_OTCET'
    end
    object ODSAccountTIPACC: TStringField
      FieldName = 'TIPACC'
    end
    object ODSAccountLIMIT: TFloatField
      FieldName = 'LIMIT'
    end
    object ODSAccountOLD_ACC_NO: TStringField
      FieldName = 'OLD_ACC_NO'
    end
    object ODSAccountPAIR_ACC: TFloatField
      FieldName = 'PAIR_ACC'
    end
    object ODSAccountINSIDER: TStringField
      FieldName = 'INSIDER'
      Size = 1
    end
    object ODSAccountVAL_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'VAL_NAME'
      ReadOnly = True
      Size = 10
      Calculated = True
    end
    object ODSAccountOWNID: TFloatField
      FieldName = 'OWNID'
    end
    object ODSAccountOSTAT: TFloatField
      FieldName = 'OSTAT'
      DisplayFormat = '#,##0.00'
    end
    object ODSAccountPOK_OSTAT: TFloatField
      FieldName = 'POK_OSTAT'
      DisplayFormat = '#,##0.00'
    end
  end
  object DSAccount: TDataSource
    DataSet = ODSAccount
    Left = 264
    Top = 64
  end
  object BalAcc: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      ''
      'select to_char(bal_cn) bal_cn, BalName from bal_spr1'
      'order by bal_cn'
      '')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000600000042414C5F434E0100000000000700000042414C4E
      414D45010000000000}
    Session = sboapiDataModule.SBSession
    Left = 344
    Top = 9
    object BalAccBAL_CN: TStringField
      FieldName = 'BAL_CN'
      Size = 40
    end
    object BalAccBALNAME: TStringField
      FieldName = 'BALNAME'
      Size = 181
    end
  end
  object BalAccData: TDataSource
    DataSet = BalAcc
    Left = 344
    Top = 61
  end
  object Currency: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select * from Avalute'
      'Order by valute')
    QBEDefinition.QBEFieldDefs = {
      04000000170000000600000056414C5554450100000000000900000056414C55
      5F4E414D450100000000000800000056414C5F4E414D450100000000000A0000
      0056414C555F53484F5254010000000000050000004445424554010000000000
      060000004B5245444954010000000000060000005553544F5247010000000000
      06000000555354504F4B0100000000000800000056414C555F47454E01000000
      00000700000056414C555F415A010000000000050000005553494E4701000000
      00000A00000056414C555F4F544845520100000000000A00000056414C555F49
      4E5445520100000000000900000056414C555F42414C41010000000000090000
      00505249535441564B4101000000000007000000434F554E5452590100000000
      00080000005553545F504F4B3101000000000006000000463535303150010000
      0000000600000046353530315601000000000006000000534445424554010000
      0000000700000053435245444954010000000000070000004F46464943414C01
      0000000000050000004C494D4954010000000000}
    Session = sboapiDataModule.SBSession
    Left = 424
    Top = 13
    object CurrencyVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object CurrencyVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object CurrencyVALU_NAME: TStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
    object CurrencyVALU_SHORT: TStringField
      FieldName = 'VALU_SHORT'
      Size = 10
    end
  end
  object CurrencyData: TDataSource
    DataSet = Currency
    Left = 424
    Top = 61
  end
  object Tenostat: TOracleDataSet
    SQL.Strings = (
      'select '
      '  acc_id, ostat, pok_ostat '
      'from '
      '  tenostat '
      'where acc_id=:acc_id')
    Variables.Data = {
      0300000001000000070000003A4143435F49440300000004000000A347000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      0400000003000000060000004143435F4944010000000000050000004F535441
      5401000000000009000000504F4B5F4F53544154010000000000}
    MasterFields = 'id'
    DetailFields = 'acc_id'
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 136
    object TenostatOSTAT: TFloatField
      FieldName = 'OSTAT'
      DisplayFormat = '#,##0.00'
    end
    object TenostatPOK_OSTAT: TFloatField
      FieldName = 'POK_OSTAT'
      DisplayFormat = '#,##0.00'
    end
    object TenostatACC_ID: TFloatField
      FieldName = 'ACC_ID'
      Required = True
    end
  end
  object DataTenostat: TDataSource
    DataSet = Tenostat
    Left = 48
    Top = 184
  end
  object PairAccount: TOracleDataSet
    SQL.Strings = (
      'select'
      '  ID,'
      '  acc_no,'
      '  DECODE (close_dat, NULL, 1, 2) AS status'
      'from'
      '  Account'
      'order by acc_no'
      ' ')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000060000004143435F4E4F0100
      0000000006000000535441545553010000000000}
    Session = sboapiDataModule.SBSession
    Left = 160
    Top = 136
  end
  object PairAccountData: TDataSource
    DataSet = PairAccount
    Left = 160
    Top = 184
  end
  object ODSContracts: TOracleDataSet
    SQL.Strings = (
      
        'SELECT ic.rowid, ic.ID , ic.kli_id, ic.blank_id, ic.loanacc_id, ' +
        'ic.curracc_id,'
      ' ii.NAME, ii.mainformguid, ii.changeguid,'
      
        '       ii.suggestionguid, ii.policyguid, ii.mainformname AS tabl' +
        'ename, ic.policy_num, '
      
        'trunc(ic.ins_date) as ins_date, ic.ammount, ic.begin_date, ic.en' +
        'd_date'
      '  FROM ins_contracts ic, ins_insurances ii'
      ' WHERE ii.ID = ic.type_id'
      '   and kli_id = :kli_id'
      'and close_prefix=0')
    Variables.Data = {0300000001000000070000003A4B4C495F4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000010000000020000004944010000000000040000004E414D4501000000
      00000C0000004D41494E464F524D475549440100000000000A0000004348414E
      4745475549440100000000000E00000053554747455354494F4E475549440100
      000000000A000000504F4C49435947554944010000000000060000004B4C495F
      4944010000000000090000005441424C454E414D450100000000000800000042
      4C414E4B5F49440100000000000A0000004C4F414E4143435F49440100000000
      000A000000435552524143435F49440100000000000A000000504F4C4943595F
      4E554D01000000000008000000494E535F444154450100000000000700000041
      4D4D4F554E540100000000000A000000424547494E5F44415445010000000000
      08000000454E445F44415445010000000000}
    Session = sboapiDataModule.SBSession
    AfterScroll = ODSContractsAfterScroll
    OnCalcFields = ODSContractsCalcFields
    Left = 160
    Top = 360
    object ODSContractsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSContractsKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object ODSContractsBLANK_ID: TFloatField
      FieldName = 'BLANK_ID'
    end
    object ODSContractsNAME: TStringField
      FieldName = 'NAME'
      Size = 1024
    end
    object ODSContractsMAINFORMGUID: TStringField
      FieldName = 'MAINFORMGUID'
      Size = 38
    end
    object ODSContractsCHANGEGUID: TStringField
      FieldName = 'CHANGEGUID'
      Size = 38
    end
    object ODSContractsSUGGESTIONGUID: TStringField
      FieldName = 'SUGGESTIONGUID'
      Size = 38
    end
    object ODSContractsPOLICYGUID: TStringField
      FieldName = 'POLICYGUID'
      Size = 38
    end
    object ODSContractsTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 32
    end
    object ODSContractsLOANACC_ID: TFloatField
      FieldName = 'LOANACC_ID'
    end
    object ODSContractsCURRACC_ID: TFloatField
      FieldName = 'CURRACC_ID'
    end
    object ODSContractsPOLICY_NUM: TStringField
      FieldName = 'POLICY_NUM'
      Size = 32
    end
    object ODSContractsINS_DATE: TDateTimeField
      FieldName = 'INS_DATE'
    end
    object ODSContractsSUGGESTION: TStringField
      FieldKind = fkCalculated
      FieldName = 'SUGGESTION'
      Calculated = True
    end
    object ODSContractsAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSContractsBEGIN_DATE: TDateTimeField
      FieldName = 'BEGIN_DATE'
    end
    object ODSContractsEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
  end
  object DSContracts: TDataSource
    DataSet = ODSContracts
    Left = 160
    Top = 408
  end
  object ODSInsurances: TOracleDataSet
    SQL.Strings = (
      'select * from ins_insurances')
    QBEDefinition.QBEFieldDefs = {
      0400000007000000020000004944010000000000040000004E414D4501000000
      00000C0000004D41494E464F524D4E414D450100000000000C0000004D41494E
      464F524D475549440100000000000A0000004348414E47454755494401000000
      00000E00000053554747455354494F4E475549440100000000000A000000504F
      4C49435947554944010000000000}
    Session = sboapiDataModule.SBSession
    Filter = 'CHANGEGUID > 0'
    Filtered = True
    Left = 160
    Top = 248
    object ODSInsurancesID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ODSInsurancesNAME: TStringField
      FieldName = 'NAME'
      Size = 1024
    end
    object ODSInsurancesCHANGEGUID: TStringField
      FieldName = 'CHANGEGUID'
      Size = 38
    end
  end
  object DSInsurances: TDataSource
    DataSet = ODSInsurances
    Left = 160
    Top = 296
  end
  object OPINS: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_PKG_MOTORKASCO'
    Left = 48
    Top = 360
  end
  object DSOccupations: TDataSource
    DataSet = ODSOccupations
    Left = 352
    Top = 184
  end
  object ODSOccupations: TOracleDataSet
    SQL.Strings = (
      'select ido.rowid, ido.* from ins_dict_occupations ido')
    Session = sboapiDataModule.SBSession
    Left = 352
    Top = 136
  end
  object ODSEducations: TOracleDataSet
    SQL.Strings = (
      'select ido.rowid, ido.* from ins_dict_educations ido')
    Session = sboapiDataModule.SBSession
    Left = 432
    Top = 136
  end
  object DSEducations: TDataSource
    DataSet = ODSEducations
    Left = 432
    Top = 184
  end
  object DSActivity: TDataSource
    DataSet = ODSActivity
    Left = 264
    Top = 184
  end
  object ODSActivity: TOracleDataSet
    SQL.Strings = (
      'select ido.rowid, ido.* from ins_dict_activity ido')
    Session = sboapiDataModule.SBSession
    Left = 264
    Top = 136
  end
  object ODSAcc_types: TOracleDataSet
    SQL.Strings = (
      'Select iat.rowid, iat.* from ins_acc_types iat')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000040000004E414D4501000000000002000000494401000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 264
    Top = 248
    object ODSAcc_typesID: TFloatField
      FieldName = 'ID'
    end
    object ODSAcc_typesNAME: TStringField
      FieldName = 'NAME'
      Size = 128
    end
  end
  object DSAcc_types: TDataSource
    DataSet = ODSAcc_types
    Left = 264
    Top = 296
  end
  object ODSBal_cn: TOracleDataSet
    SQL.Strings = (
      'Select a.rowid, a.* from ins_acc_bal_cn a'
      ''
      'where dict_id = :dict_id')
    Variables.Data = {
      0300000001000000080000003A444943545F4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000200000007000000444943545F49440100000000000600000042414C
      5F434E010000000000}
    Master = ODSAcc_types
    MasterFields = 'ID'
    DetailFields = 'DICT_ID'
    Session = sboapiDataModule.SBSession
    BeforeInsert = ODSBal_cnBeforeInsert
    Left = 504
    Top = 16
    object ODSBal_cnDICT_ID: TFloatField
      FieldName = 'DICT_ID'
    end
    object ODSBal_cnBAL_CN: TFloatField
      FieldName = 'BAL_CN'
    end
  end
  object DSBal_cn: TDataSource
    DataSet = ODSBal_cn
    Left = 504
    Top = 64
  end
  object ODSLoanAccLists: TOracleDataSet
    SQL.Strings = (
      'SELECT ID, acc_no, bal_cn1, name'
      '  FROM ACCOUNT partition (activacc)'
      ' WHERE bal_cn1 IN (SELECT bal_cn'
      '                    FROM ins_acc_bal_cn'
      '                   WHERE dict_id = (SELECT MAX (value)'
      '                                      FROM ins_settings'
      '                                     WHERE NAME = '#39'LOANID'#39'))')
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000060000004143435F4E4F0100
      000000000700000042414C5F434E31010000000000040000004E414D45010000
      000000}
    Session = sboapiDataModule.SBSession
    Left = 440
    Top = 248
    object ODSLoanAccListsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSLoanAccListsACC_NO: TStringField
      FieldName = 'ACC_NO'
      Required = True
    end
    object ODSLoanAccListsBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
      Required = True
    end
    object ODSLoanAccListsNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object DSLoanAccLists: TDataSource
    DataSet = ODSLoanAccLists
    Left = 440
    Top = 296
  end
  object ODSCurrAccList: TOracleDataSet
    SQL.Strings = (
      'SELECT ID, acc_no, bal_cn1,name'
      '  FROM ACCOUNT partition (activacc)'
      ' WHERE bal_cn1 IN (SELECT bal_cn'
      '                    FROM ins_acc_bal_cn'
      '                   WHERE dict_id = (SELECT MAX (value)'
      '                                      FROM ins_settings'
      '                                     WHERE NAME = '#39'CURRID'#39'))')
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000060000004143435F4E4F0100
      000000000700000042414C5F434E31010000000000040000004E414D45010000
      000000}
    Session = sboapiDataModule.SBSession
    Left = 352
    Top = 248
    object ODSCurrAccListID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSCurrAccListACC_NO: TStringField
      FieldName = 'ACC_NO'
      Required = True
    end
    object ODSCurrAccListBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
      Required = True
    end
    object ODSCurrAccListNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object DSCurrAccList: TDataSource
    DataSet = ODSCurrAccList
    Left = 352
    Top = 296
  end
  object OPCOMMON: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_COMMON'
    Left = 48
    Top = 408
  end
  object ODSPayPlan: TOracleDataSet
    SQL.Strings = (
      'SELECT a.rowid, a.*'
      '  FROM ins_payment_plan a'
      'where a.ins_id = :insid')
    Variables.Data = {0300000001000000060000003A494E534944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000500000002000000494401000000000006000000494E535F49440100
      00000000080000005041595F4441544501000000000007000000414D4D4F554E
      5401000000000006000000535441545553010000000000}
    Session = sboapiDataModule.SBSession
    OnCalcFields = ODSPayPlanCalcFields
    Left = 264
    Top = 360
    object ODSPayPlanID: TFloatField
      FieldName = 'ID'
    end
    object ODSPayPlanPAY_DATE: TDateTimeField
      FieldName = 'PAY_DATE'
      EditMask = '!90/90/00;1;_'
    end
    object ODSPayPlanAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSPayPlanSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object ODSPayPlanINS_ID: TFloatField
      FieldName = 'INS_ID'
    end
    object ODSPayPlanISPAYED: TStringField
      FieldKind = fkCalculated
      FieldName = 'ISPAYED'
      Calculated = True
    end
  end
  object DSPayPlan: TDataSource
    DataSet = ODSPayPlan
    Left = 264
    Top = 408
  end
  object ODSAgents: TOracleDataSet
    SQL.Strings = (
      'select ia.rowid, ia.* from ins_agents ia')
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000040000004E414D4501000000
      0000070000005355524E414D450100000000000A0000004641544845524E414D
      45010000000000}
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 240
    object ODSAgentsID: TFloatField
      FieldName = 'ID'
    end
    object ODSAgentsNAME: TStringField
      FieldName = 'NAME'
      Size = 128
    end
    object ODSAgentsSURNAME: TStringField
      FieldName = 'SURNAME'
      Size = 128
    end
    object ODSAgentsFATHERNAME: TStringField
      FieldName = 'FATHERNAME'
      Size = 128
    end
  end
  object DSAgents: TDataSource
    DataSet = ODSAgents
    Left = 48
    Top = 288
  end
  object ODSBeneficiary: TOracleDataSet
    SQL.Strings = (
      'select ib.rowid, ib.* from INS_BENEFICIARY ib')
    QBEDefinition.QBEFieldDefs = {
      0400000005000000020000004944010000000000040000004E414D4501000000
      000007000000414444524553530100000000000500000050484F4E4501000000
      00000F00000042414E4B494E475F44455441494C53010000000000}
    Session = sboapiDataModule.SBSession
    BeforeDelete = ODSBeneficiaryBeforeDelete
    Left = 520
    Top = 136
    object ODSBeneficiaryID: TFloatField
      FieldName = 'ID'
    end
    object ODSBeneficiaryNAME: TStringField
      FieldName = 'NAME'
      Size = 128
    end
    object ODSBeneficiaryADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 128
    end
    object ODSBeneficiaryPHONE: TStringField
      FieldName = 'PHONE'
      Size = 64
    end
    object ODSBeneficiaryBANKING_DETAILS: TStringField
      FieldName = 'BANKING_DETAILS'
      Size = 128
    end
  end
  object DSBeneficiary: TDataSource
    DataSet = ODSBeneficiary
    Left = 520
    Top = 184
  end
  object ODSStates: TOracleDataSet
    SQL.Strings = (
      'select ids.* from ins_dict_states ids'
      'order by name')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 352
    Top = 360
    object ODSStatesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSStatesNAME: TStringField
      FieldName = 'NAME'
      Size = 256
    end
  end
  object ODSTariffs: TOracleDataSet
    SQL.Strings = (
      'select it.rowid, it.* from INS_TARIFFS it'
      ''
      'where franshiz_id = :franshiz_id')
    Variables.Data = {
      03000000010000000C0000003A4652414E5348495A5F49440400000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000200000049440100000000000B0000004652414E5348495A
      5F494401000000000007000000414D4D4F554E54010000000000}
    Master = ODSFranshiza
    MasterFields = 'ID'
    DetailFields = 'FRANSHIZ_ID'
    Session = sboapiDataModule.SBSession
    AfterPost = ODSTariffsAfterPost
    Left = 656
    Top = 16
    object ODSTariffsID: TFloatField
      FieldName = 'ID'
    end
    object ODSTariffsFRANSHIZ_ID: TFloatField
      FieldName = 'FRANSHIZ_ID'
    end
    object ODSTariffsAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
  end
  object DSStates: TDataSource
    DataSet = ODSStates
    Left = 352
    Top = 408
  end
  object DSTariffs: TDataSource
    DataSet = ODSTariffs
    Left = 656
    Top = 72
  end
  object ODSBankm: TOracleDataSet
    SQL.Strings = (
      'select * from bankm'
      'order by name')
    QBEDefinition.QBEFieldDefs = {
      0400000007000000020000004944010000000000040000004B524E4F01000000
      0000040000004E414D4501000000000003000000494E4E010000000000050000
      0053574946540100000000000800000042414E4B434F44450100000000000700
      00005355424B524E4F010000000000}
    Session = sboapiDataModule.SBSession
    Left = 520
    Top = 248
    object ODSBankmID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSBankmKRNO: TFloatField
      FieldName = 'KRNO'
    end
    object ODSBankmNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object ODSBankmINN: TStringField
      FieldName = 'INN'
      Size = 32
    end
    object ODSBankmSWIFT: TStringField
      FieldName = 'SWIFT'
      Size = 128
    end
    object ODSBankmBANKCODE: TStringField
      FieldName = 'BANKCODE'
      Size = 32
    end
    object ODSBankmSUBKRNO: TStringField
      FieldName = 'SUBKRNO'
      Size = 17
    end
  end
  object DSBankm: TDataSource
    DataSet = ODSBankm
    Left = 520
    Top = 296
  end
  object Sysdat: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'Select tek_dat from sysdat')
    QBEDefinition.QBEFieldDefs = {04000000010000000700000054454B5F444154010000000000}
    Session = sboapiDataModule.SBSession
    Left = 584
    Top = 16
    object SysdatTEK_DAT: TDateTimeField
      FieldName = 'TEK_DAT'
      Required = True
    end
  end
  object ODSTarifStates: TOracleDataSet
    SQL.Strings = (
      'select its.rowid, its.* from ins_tarif_states its'
      ''
      'where bank_id = :bank_id')
    Variables.Data = {
      0300000001000000080000003A42414E4B5F4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000200000049440100000000000700000042414E4B5F494401
      00000000000800000053544154455F4944010000000000}
    Master = ODSBankm
    MasterFields = 'ID'
    DetailFields = 'BANK_ID'
    Session = sboapiDataModule.SBSession
    AfterPost = ODSTariffsAfterPost
    Left = 440
    Top = 352
    object ODSTarifStatesID: TFloatField
      FieldName = 'ID'
    end
    object ODSTarifStatesBANK_ID: TFloatField
      FieldName = 'BANK_ID'
    end
    object ODSTarifStatesSTATE_ID: TFloatField
      FieldName = 'STATE_ID'
    end
    object ODSTarifStatesStates: TStringField
      FieldKind = fkLookup
      FieldName = 'States'
      LookupDataSet = ODSStates
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'STATE_ID'
      Lookup = True
    end
  end
  object DSTarifStates: TDataSource
    DataSet = ODSTarifStates
    Left = 432
    Top = 408
  end
  object ODSRelDates: TOracleDataSet
    SQL.Strings = (
      'select ird.rowid, ird.* from ins_release_date ird'
      ''
      'where state_id = :state_id')
    Variables.Data = {
      0300000001000000090000003A53544154455F49440400000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000400000002000000494401000000000009000000424547494E444154
      4501000000000007000000454E44444154450100000000000800000053544154
      455F4944010000000000}
    Master = ODSTarifStates
    MasterFields = 'ID'
    DetailFields = 'STATE_ID'
    Session = sboapiDataModule.SBSession
    AfterPost = ODSTariffsAfterPost
    Left = 512
    Top = 360
    object ODSRelDatesID: TFloatField
      FieldName = 'ID'
    end
    object ODSRelDatesBEGINDATE: TDateTimeField
      FieldName = 'BEGINDATE'
    end
    object ODSRelDatesENDDATE: TDateTimeField
      FieldName = 'ENDDATE'
    end
    object ODSRelDatesSTATE_ID: TFloatField
      FieldName = 'STATE_ID'
    end
  end
  object DSRelDates: TDataSource
    DataSet = ODSRelDates
    Left = 512
    Top = 408
  end
  object ODSMonths: TOracleDataSet
    SQL.Strings = (
      'select itm.rowid, itm.* from ins_tarif_months itm'
      ''
      'where release_id = :release_id')
    Variables.Data = {
      03000000010000000B0000003A52454C454153455F4944040000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000200000049440100000000000A00000052454C454153455F
      494401000000000005000000434F554E54010000000000}
    Master = ODSRelDates
    MasterFields = 'ID'
    DetailFields = 'RELEASE_ID'
    Session = sboapiDataModule.SBSession
    AfterPost = ODSTariffsAfterPost
    Left = 656
    Top = 136
    object ODSMonthsID: TFloatField
      FieldName = 'ID'
    end
    object ODSMonthsRELEASE_ID: TFloatField
      FieldName = 'RELEASE_ID'
    end
    object ODSMonthsCOUNT: TFloatField
      FieldName = 'COUNT'
    end
  end
  object DSMonths: TDataSource
    DataSet = ODSMonths
    Left = 656
    Top = 192
  end
  object ODSFranshiza: TOracleDataSet
    SQL.Strings = (
      'select itf.rowid, itf.* from ins_tarif_franshiz itf'
      ''
      'where month_id = :month_id')
    Variables.Data = {
      0300000001000000090000003A4D4F4E54485F49440400000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000080000004D4F4E54485F4944
      01000000000007000000414D4D4F554E54010000000000}
    Master = ODSMonths
    MasterFields = 'ID'
    DetailFields = 'MONTH_ID'
    Session = sboapiDataModule.SBSession
    AfterPost = ODSTariffsAfterPost
    Left = 616
    Top = 256
    object ODSFranshizaID: TFloatField
      FieldName = 'ID'
    end
    object ODSFranshizaMONTH_ID: TFloatField
      FieldName = 'MONTH_ID'
    end
    object ODSFranshizaAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
  end
  object DSFranshiza: TDataSource
    DataSet = ODSFranshiza
    Left = 640
    Top = 312
  end
  object ODSBranches: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select -1 as ID, '#39'Бцтцн филиаллар'#39' as name from Dual'
      'Union All'
      'select ID, name from filial '
      'order by ID')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 45
    Top = 469
    object ODSBranchesID: TFloatField
      FieldName = 'ID'
    end
    object ODSBranchesNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object DSBranches: TDataSource
    DataSet = ODSBranches
    Left = 136
    Top = 469
  end
  object ODSReportSymbol: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select * from REPORT_SYMBOL')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 248
    Top = 472
  end
  object DSReportSymbol: TDataSource
    DataSet = ODSReportSymbol
    Left = 360
    Top = 472
  end
  object DSPolicyNums: TDataSource
    DataSet = ODSPolicyNums
    Left = 552
    Top = 472
  end
  object ODSPolicyNums: TOracleDataSet
    SQL.Strings = (
      
        'select pu.rowid,ii.name,pu.counts,pu.format,pu.prefix from ins_p' +
        'olicynums pu,ins_insurances ii where ii.id=pu.typeid')
    QBEDefinition.QBEFieldDefs = {
      0400000004000000040000004E414D4501000000000006000000434F554E5453
      0100000000000600000050524546495801000000000006000000464F524D4154
      010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 472
    Top = 472
    object ODSPolicyNumsNAME: TStringField
      FieldName = 'NAME'
      Size = 1024
    end
    object ODSPolicyNumsCOUNTS: TFloatField
      FieldName = 'COUNTS'
    end
    object ODSPolicyNumsPREFIX: TStringField
      FieldName = 'PREFIX'
      Size = 32
    end
    object ODSPolicyNumsFORMAT: TStringField
      FieldName = 'FORMAT'
      Size = 32
    end
  end
end
