object DataModIncExpenses: TDataModIncExpenses
  OldCreateOrder = False
  Height = 580
  Width = 808
  object OrDSSysDat: TOracleDataSet
    SQL.Strings = (
      'select Tek_Dat from SysDat')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 6
    object OrDSSysDatTEK_DAT: TDateTimeField
      FieldName = 'TEK_DAT'
      Required = True
    end
  end
  object OrDSFilial: TOracleDataSet
    SQL.Strings = (
      'select * from Filial')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 104
    Top = 6
    object OrDSFilialID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OrDSFilialNAME: TStringField
      FieldName = 'NAME'
    end
  end
  object OrDSFilialCode: TOracleDataSet
    SQL.Strings = (
      'select ID,NAME from Filial'
      '--where '
      '   --       Name =:FilialName')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 160
    Top = 6
    object OrDSFilialCodeID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OrDSFilialCodeNAME: TStringField
      FieldName = 'NAME'
    end
  end
  object OrDSBankInfo: TOracleDataSet
    SQL.Strings = (
      'select BANK from BankInfo')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 240
    Top = 6
    object OrDSBankInfoBANK: TStringField
      FieldName = 'BANK'
    end
  end
  object OrDSIncomes: TOracleDataSet
    SQL.Strings = (
      'select bal_cn1,acc_no,name, Rest from ('
      'select bal_cn1,acc_no,name, Rest'
      ' from ('
      
        '  select bal_cn1,acc_no,name, 0 - (sum(decode(Rest1, null, 0, Re' +
        'st1)-decode(Rest2, null, 0, Rest2))) as Rest'
      '  from ('
      '    select a.bal_cn1,a.acc_no,a.name,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      '          and (debt = a.ID)'
      
        '          and (kredit not in (select ID from Account_Inc where b' +
        'al_cn1 = 5501))) as Rest1,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      
        '          and (debt not in (select ID from Account_Inc where bal' +
        '_cn1 = 5501))'
      '          and (kredit = a.ID)) as Rest2'
      '    from Account_Inc a'
      
        '    where (a.bal_cn1 between 6000 and 9999) and a.Filial in (:Fi' +
        'lialCode))'
      '  group by bal_cn1,acc_no,name)'
      '  where (bal_cn1 < 8000) and (bal_cn1 not in (:SeprAccs))'
      'union all'
      'select bal_cn1,acc_no,name, Rest'
      ' from ('
      
        '  select bal_cn1,acc_no,name, 0 - (sum(0-decode(Rest2, null, 0, ' +
        'Rest2))) as Rest'
      '  from ('
      '    select a.bal_cn1,a.acc_no,a.name,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      
        '          and (debt not in (select ID from Account_Inc where bal' +
        '_cn1 = 5501))'
      '          and (kredit = a.ID)) as Rest2'
      '    from Account_Inc a'
      
        '    where (a.bal_cn1 between 6000 and 9999) and a.Filial in (:Fi' +
        'lialCode))'
      '  group by bal_cn1,acc_no,name)'
      '  where (bal_cn1 in (:SeprAccs)))'
      'order by bal_cn1  '
      ' '
      ' ')
    Optimize = False
    Variables.Data = {
      0400000004000000100000003A0042004500470044004100540045000C000000
      0000000000000000100000003A0045004E00440044004100540045000C000000
      0000000000000000160000003A00460049004C00490041004C0043004F004400
      4500010000000000000000000000120000003A00530045005000520041004300
      43005300010000000000000000000000}
    Session = sboapiDataModule.SBSession
    Filtered = True
    Left = 24
    Top = 112
    object OrDSIncomesBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
    end
    object OrDSIncomesACC_NO: TStringField
      FieldName = 'ACC_NO'
    end
    object OrDSIncomesNAME: TStringField
      FieldName = 'NAME'
    end
    object OrDSIncomesREST: TFloatField
      FieldName = 'REST'
    end
  end
  object OrDSExpenses: TOracleDataSet
    SQL.Strings = (
      'select bal_cn1,acc_no,name, Rest from ('
      'select bal_cn1,acc_no,name, Rest'
      
        ' from (select bal_cn1,acc_no,name, 0 + (sum(decode(Rest1, null, ' +
        '0, Rest1)-decode(Rest2, null, 0, Rest2))) as Rest'
      '  from (select a.bal_cn1,a.acc_no,a.name,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      '          and (debt = a.ID)'
      
        '          and (kredit not in (select ID from Account_Inc where b' +
        'al_cn1 = 5501))) as Rest1,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      
        '          and (debt not in (select ID from Account_Inc where bal' +
        '_cn1 = 5501))'
      '          and (kredit = a.ID)) as Rest2'
      '    from  Account_Inc a'
      
        '    where (a.bal_cn1 between 6000 and 9999) and a.Filial in (:Fi' +
        'lialCode))'
      '  group by bal_cn1,acc_no,name)'
      '  where (bal_cn1 > 8000) and (bal_cn1 not in (:SeprAccs))'
      'union all'
      'select bal_cn1,acc_no,name, Rest'
      
        ' from (select bal_cn1,acc_no,name, 0 + (sum(decode(Rest1, null, ' +
        '0, Rest1)-0)) as Rest'
      '  from (select a.bal_cn1,a.acc_no,a.name,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      '          and (debt = a.ID)'
      
        '          and (kredit not in (select ID from Account_Inc where b' +
        'al_cn1 = 5501))) as Rest1'
      '    from  Account_Inc a'
      
        '    where (a.bal_cn1 between 6000 and 9999) and a.Filial in (:Fi' +
        'lialCode))'
      '  group by bal_cn1,acc_no,name)'
      '  where (bal_cn1 in (:SeprAccs)))'
      'order by bal_cn1')
    Optimize = False
    Variables.Data = {
      0400000004000000100000003A0042004500470044004100540045000C000000
      0000000000000000100000003A0045004E00440044004100540045000C000000
      0000000000000000160000003A00460049004C00490041004C0043004F004400
      4500010000000000000000000000120000003A00530045005000520041004300
      43005300010000000000000000000000}
    Session = sboapiDataModule.SBSession
    Filtered = True
    Left = 64
    Top = 112
    object OrDSExpensesBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
    end
    object OrDSExpensesACC_NO: TStringField
      FieldName = 'ACC_NO'
    end
    object OrDSExpensesNAME: TStringField
      FieldName = 'NAME'
    end
    object OrDSExpensesREST: TFloatField
      FieldName = 'REST'
    end
  end
  object OrDSIncomesGeneral: TOracleDataSet
    SQL.Strings = (
      'select bal_cn1,acc_no,name, Rest from ('
      'select bal_cn1,acc_no,name, Rest'
      
        ' from (select bal_cn1,acc_no,name, 0 - (sum(decode(Rest1, null, ' +
        '0, Rest1)-decode(Rest2, null, 0, Rest2))) as Rest'
      '  from (select a.bal_cn1,a.acc_no,a.name,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      '          and (debt = a.ID)'
      
        '          and (kredit not in (select ID from Account_Inc where b' +
        'al_cn1 = 5501))) as Rest1,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      
        '          and (debt not in (select ID from Account_Inc where bal' +
        '_cn1 = 5501))'
      '          and (kredit = a.ID)) as Rest2'
      '    from Account_Inc a'
      '    where (a.bal_cn1 between 6000 and 9999))'
      '  group by bal_cn1,acc_no,name)'
      '  where (bal_cn1 < 8000) and (bal_cn1 not in (:SeprAccs))'
      'union all'
      'select bal_cn1,acc_no,name, Rest'
      
        ' from (select bal_cn1,acc_no,name, 0 - (sum(0-decode(Rest2, null' +
        ', 0, Rest2))) as Rest'
      '  from (select a.bal_cn1,a.acc_no,a.name,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      
        '          and (debt not in (select ID from Account_Inc where bal' +
        '_cn1 = 5501))'
      '          and (kredit = a.ID)) as Rest2'
      '    from Account_Inc a'
      '    where (a.bal_cn1 between 6000 and 9999))'
      '  group by bal_cn1,acc_no,name)'
      '  where (bal_cn1 in (:SeprAccs)))'
      'order by bal_cn1')
    Optimize = False
    Variables.Data = {
      0400000003000000100000003A0042004500470044004100540045000C000000
      0000000000000000100000003A0045004E00440044004100540045000C000000
      0000000000000000120000003A00530045005000520041004300430053000100
      00000000000000000000}
    Session = sboapiDataModule.SBSession
    Filtered = True
    Left = 24
    Top = 164
    object OrDSIncomesGeneralBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
    end
    object OrDSIncomesGeneralACC_NO: TStringField
      FieldName = 'ACC_NO'
    end
    object OrDSIncomesGeneralNAME: TStringField
      FieldName = 'NAME'
    end
    object OrDSIncomesGeneralREST: TFloatField
      FieldName = 'REST'
    end
  end
  object OrDSExpensesGeneral: TOracleDataSet
    SQL.Strings = (
      'select bal_cn1,acc_no,name, Rest ('
      'select bal_cn1,acc_no,name, Rest'
      
        ' from (select bal_cn1,acc_no,name, 0 + (sum(decode(Rest1, null, ' +
        '0, Rest1)-decode(Rest2, null, 0, Rest2))) as Rest'
      '  from (select a.bal_cn1,a.acc_no,a.name,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      '          and (debt = a.ID)'
      
        '          and (kredit not in (select ID from Account_Inc where b' +
        'al_cn1 = 5501))) as Rest1,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      
        '          and (debt not in (select ID from Account_Inc where bal' +
        '_cn1 = 5501))'
      '          and (kredit = a.ID)) as Rest2'
      '    from Account_Inc a'
      '    where(a.bal_cn1 between 6000 and 9999))'
      '  group by bal_cn1,acc_no,name)'
      '  where (bal_cn1 > 8000) and (bal_cn1 not in (:SeprAccs))'
      'union all'
      'select bal_cn1,acc_no,name, Rest'
      
        ' from (select bal_cn1,acc_no,name, 0 + (sum(decode(Rest1, null, ' +
        '0, Rest1)-0)) as Rest'
      '  from (select a.bal_cn1,a.acc_no,a.name,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      '          and (debt = a.ID)'
      
        '          and (kredit not in (select ID from Account_Inc where b' +
        'al_cn1 = 5501))) as Rest1'
      '    from Account_Inc a'
      '    where(a.bal_cn1 between 6000 and 9999))'
      '  group by bal_cn1,acc_no,name)'
      '  where (bal_cn1 in (:SeprAccs)))'
      'order by bal_cn1')
    Optimize = False
    Variables.Data = {
      0400000003000000100000003A0042004500470044004100540045000C000000
      0000000000000000100000003A0045004E00440044004100540045000C000000
      0000000000000000120000003A00530045005000520041004300430053000100
      00000000000000000000}
    Session = sboapiDataModule.SBSession
    Filtered = True
    Left = 64
    Top = 164
    object OrDSExpensesGeneralBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
    end
    object OrDSExpensesGeneralACC_NO: TStringField
      FieldName = 'ACC_NO'
    end
    object OrDSExpensesGeneralNAME: TStringField
      FieldName = 'NAME'
    end
    object OrDSExpensesGeneralREST: TFloatField
      FieldName = 'REST'
    end
  end
  object OrDSIncomesBal: TOracleDataSet
    SQL.Strings = (
      'select bal_cn1,balname, Rest from ('
      'select bal_cn1,balname, Rest'
      
        ' from (select bal_cn1,balname, 0 - (sum(decode(Rest1, null, 0, R' +
        'est1)-decode(Rest2, null, 0, Rest2))) as Rest'
      '  from (select a.bal_cn1, b.balname,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      '          and (debt = a.ID)'
      
        '          and (kredit not in (select ID from Account_Inc where b' +
        'al_cn1 = 5501))) as Rest1,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      
        '          and (debt not in (select ID from Account_Inc where bal' +
        '_cn1 = 5501))'
      '          and (kredit = a.ID)) as Rest2'
      '    from Account_Inc a, bal_spr1 b'
      
        '    where (a.bal_cn1 between 6000 and 9999) and a.Filial in (:Fi' +
        'lialCode)'
      '      and b.bal_cn=a.bal_cn1)'
      '  group by bal_cn1,balname)'
      '  where (bal_cn1 < 8000) and (bal_cn1 not in (:SeprAccs))'
      'union all'
      'select bal_cn1,balname, Rest'
      
        ' from (select bal_cn1,balname, 0 - (sum(0-decode(Rest2, null, 0,' +
        ' Rest2))) as Rest'
      '  from (select a.bal_cn1, b.balname,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      
        '          and (debt not in (select ID from Account_Inc where bal' +
        '_cn1 = 5501))'
      '          and (kredit = a.ID)) as Rest2'
      '    from Account_Inc a, bal_spr1 b'
      
        '    where (a.bal_cn1 between 6000 and 9999) and a.Filial in (:Fi' +
        'lialCode)'
      '      and b.bal_cn=a.bal_cn1)'
      '  group by bal_cn1,balname)'
      '  where (bal_cn1 in (:SeprAccs)))'
      'order by bal_cn1')
    Optimize = False
    Variables.Data = {
      0400000004000000100000003A0042004500470044004100540045000C000000
      0000000000000000100000003A0045004E00440044004100540045000C000000
      0000000000000000160000003A00460049004C00490041004C0043004F004400
      4500010000000000000000000000120000003A00530045005000520041004300
      43005300010000000000000000000000}
    Session = sboapiDataModule.SBSession
    Filtered = True
    Left = 192
    Top = 112
    object OrDSIncomesBalBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
    end
    object OrDSIncomesBalBALNAME: TStringField
      FieldName = 'BALNAME'
    end
    object OrDSIncomesBalREST: TFloatField
      FieldName = 'REST'
    end
  end
  object OrDSExpGenBal: TOracleDataSet
    SQL.Strings = (
      'select bal_cn1,balname, Rest from ('
      'select bal_cn1,balname, Rest'
      
        ' from (select bal_cn1,balname, 0 + (sum(decode(Rest1, null, 0, R' +
        'est1)-decode(Rest2, null, 0, Rest2))) as Rest'
      '  from (select a.bal_cn1, b.balname,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      '          and (debt = a.ID)'
      
        '          and (kredit not in (select ID from Account_Inc where b' +
        'al_cn1 = 5501))) as Rest1,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      
        '          and (debt not in (select ID from Account_Inc where bal' +
        '_cn1 = 5501))'
      '          and (kredit = a.ID)) as Rest2'
      '    from  Account_Inc a, bal_spr1 b'
      
        '    where (a.bal_cn1 between 6000 and 9999) and b.bal_cn=a.bal_c' +
        'n1)'
      '  group by bal_cn1,balname)'
      '  where (bal_cn1 > 8000) and (bal_cn1 not in (:SeprAccs))'
      'union all'
      'select bal_cn1,balname, Rest'
      
        ' from (select bal_cn1,balname, 0 + (sum(decode(Rest1, null, 0, R' +
        'est1)-0)) as Rest'
      '  from (select a.bal_cn1, b.balname,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      '          and (debt = a.ID)'
      
        '          and (kredit not in (select ID from Account_Inc where b' +
        'al_cn1 = 5501))) as Rest1'
      '    from  Account_Inc a, bal_spr1 b'
      
        '    where (a.bal_cn1 between 6000 and 9999) and b.bal_cn=a.bal_c' +
        'n1)'
      '  group by bal_cn1,balname)'
      '  where (bal_cn1 in (:SeprAccs)))'
      'order by bal_cn1')
    Optimize = False
    Variables.Data = {
      0400000003000000100000003A0042004500470044004100540045000C000000
      0000000000000000100000003A0045004E00440044004100540045000C000000
      0000000000000000120000003A00530045005000520041004300430053000100
      00000000000000000000}
    Session = sboapiDataModule.SBSession
    Filtered = True
    Left = 264
    Top = 164
    object OrDSExpGenBalBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
    end
    object OrDSExpGenBalBALNAME: TStringField
      FieldName = 'BALNAME'
    end
    object OrDSExpGenBalREST: TFloatField
      FieldName = 'REST'
    end
  end
  object DSIncomes: TDataSource
    Left = 24
    Top = 256
  end
  object DSExpenses: TDataSource
    Left = 88
    Top = 256
  end
  object OrDSExpensesBal: TOracleDataSet
    SQL.Strings = (
      'select bal_cn1,balname, Rest from ('
      'select bal_cn1,balname, Rest'
      
        ' from (select bal_cn1,balname, 0 + (sum(decode(Rest1, null, 0, R' +
        'est1)-decode(Rest2, null, 0, Rest2))) as Rest'
      '  from (select a.bal_cn1, b.balname,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      '          and (debt = a.ID)'
      
        '          and (kredit not in (select ID from Account_Inc where b' +
        'al_cn1 = 5501))) as Rest1,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      
        '          and (debt not in (select ID from Account_Inc where bal' +
        '_cn1 = 5501))'
      '          and (kredit = a.ID)) as Rest2'
      '    from Account_Inc a, bal_spr1 b'
      
        '    where (a.bal_cn1 between 6000 and 9999) and a.Filial in (:Fi' +
        'lialCode)'
      '      and b.bal_cn=a.bal_cn1)'
      '  group by bal_cn1,balname)'
      '  where (bal_cn1 > 8000) and (bal_cn1 not in (:SeprAccs))'
      'union all'
      'select bal_cn1,balname, Rest'
      
        ' from (select bal_cn1,balname, 0 + (sum(decode(Rest1, null, 0, R' +
        'est1)-0)) as Rest'
      '  from (select a.bal_cn1, b.balname,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      '          and (debt = a.ID)'
      
        '          and (kredit not in (select ID from Account_Inc where b' +
        'al_cn1 = 5501))) as Rest1'
      '    from Account_Inc a, bal_spr1 b'
      
        '    where (a.bal_cn1 between 6000 and 9999) and a.Filial in (:Fi' +
        'lialCode)'
      '      and b.bal_cn=a.bal_cn1)'
      '  group by bal_cn1,balname)'
      '  where (bal_cn1 in (:SeprAccs)))'
      'order by bal_cn1')
    Optimize = False
    Variables.Data = {
      0400000004000000100000003A0042004500470044004100540045000C000000
      0000000000000000100000003A0045004E00440044004100540045000C000000
      0000000000000000160000003A00460049004C00490041004C0043004F004400
      4500010000000000000000000000120000003A00530045005000520041004300
      43005300010000000000000000000000}
    Session = sboapiDataModule.SBSession
    Filtered = True
    Left = 264
    Top = 112
    object OrDSExpensesBalBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
    end
    object OrDSExpensesBalBALNAME: TStringField
      FieldName = 'BALNAME'
    end
    object OrDSExpensesBalREST: TFloatField
      FieldName = 'REST'
    end
  end
  object OrDSIncGenBal: TOracleDataSet
    SQL.Strings = (
      'select bal_cn1,balname, Rest from ('
      'select bal_cn1,balname, Rest'
      
        ' from (select bal_cn1,balname, 0 - (sum(decode(Rest1, null, 0, R' +
        'est1)-decode(Rest2, null, 0, Rest2))) as Rest'
      '  from (select a.bal_cn1, b.balname,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      '          and (debt = a.ID)'
      
        '          and (kredit not in (select ID from Account_Inc where b' +
        'al_cn1 = 5501))) as Rest1,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      
        '          and (debt not in (select ID from Account_Inc where bal' +
        '_cn1 = 5501))'
      '          and (kredit = a.ID)) as Rest2'
      '    from  Account_Inc a, bal_spr1 b'
      '    where(a.bal_cn1 between 6000 and 9999)'
      '      and b.bal_cn=a.bal_cn1)'
      '  group by bal_cn1,balname)'
      '  where (bal_cn1 < 8000) and (bal_cn1 not in (:SeprAccs))'
      'union all'
      'select bal_cn1,balname, Rest'
      
        ' from (select bal_cn1,balname, 0 - (sum(0-decode(Rest2, null, 0,' +
        ' Rest2))) as Rest'
      '  from (select a.bal_cn1, b.balname,'
      '      (select sum(lammount) as rest from provarch'
      '        where (dat between :BegDate and :EndDate)'
      
        '          and (debt not in (select ID from Account_Inc where bal' +
        '_cn1 = 5501))'
      '          and (kredit = a.ID)) as Rest2'
      '    from  Account_Inc a, bal_spr1 b'
      '    where(a.bal_cn1 between 6000 and 9999)'
      '      and b.bal_cn=a.bal_cn1)'
      '  group by bal_cn1,balname)'
      '  where (bal_cn1 in (:SeprAccs)))'
      'order by bal_cn1')
    Optimize = False
    Variables.Data = {
      0400000003000000100000003A0042004500470044004100540045000C000000
      0000000000000000100000003A0045004E00440044004100540045000C000000
      0000000000000000120000003A00530045005000520041004300430053000100
      00000000000000000000}
    Session = sboapiDataModule.SBSession
    Filtered = True
    Left = 192
    Top = 164
    object OrDSIncGenBalBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
    end
    object OrDSIncGenBalBALNAME: TStringField
      FieldName = 'BALNAME'
    end
    object OrDSIncGenBalREST: TFloatField
      FieldName = 'REST'
    end
  end
  object OrDSBegOstatGen: TOracleDataSet
    SQL.Strings = (
      'select sum(Ar.Pok_Ostat) as Sumer from Account Ac,ArchOst Ar'
      'where '
      ' Ac.Bal_CN1=5501 and'
      ' Ac.ID=Ar.Acc_ID and'
      
        ' Ar.DatDate=(select max(DatDate) from ArchOst where datdate<:Beg' +
        'Date)'
      ' ')
    Optimize = False
    Variables.Data = {
      0400000001000000100000003A0042004500470044004100540045000C000000
      0000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 360
    Top = 16
    object OrDSBegOstatGenSUMER: TFloatField
      FieldName = 'SUMER'
    end
  end
  object OrDSEndOstatGen: TOracleDataSet
    SQL.Strings = (
      'select sum(Ar.Pok_Ostat) as Sumer from Account Ac,ArchOst Ar'
      'where '
      ' Ac.Bal_CN1=5501 and'
      ' Ac.ID=Ar.Acc_ID and'
      ' Ar.DatDate=:EndDate'
      '')
    Optimize = False
    Variables.Data = {
      0400000001000000100000003A0045004E00440044004100540045000C000000
      0000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 440
    Top = 16
    object OrDSEndOstatGenSUMER: TFloatField
      FieldName = 'SUMER'
    end
  end
  object OrDSBegOstat: TOracleDataSet
    SQL.Strings = (
      'select sum(Ar.Pok_Ostat) as Sumer from Account Ac,ArchOst Ar'
      'where '
      ' Ac.Bal_CN1=5501 and'
      ' Ac.Filial in (:FilialCode) and'
      ' Ac.ID=Ar.Acc_ID and'
      
        ' Ar.DatDate=(select max(DatDate) from ArchOst where datdate<:Beg' +
        'Date)'
      '')
    Optimize = False
    Variables.Data = {
      0400000002000000100000003A0042004500470044004100540045000C000000
      0000000000000000160000003A00460049004C00490041004C0043004F004400
      4500010000000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 360
    Top = 64
    object OrDSBegOstatSUMER: TFloatField
      FieldName = 'SUMER'
    end
  end
  object OrDSEndOstat: TOracleDataSet
    SQL.Strings = (
      'select sum(Ar.Pok_Ostat) as Sumer from Account Ac,ArchOst Ar'
      'where '
      ' Ac.Bal_CN1=5501 and'
      ' Ac.Filial in (:FilialCode) and'
      ' Ac.ID=Ar.Acc_ID and'
      ' Ar.DatDate=:EndDate '
      '')
    Optimize = False
    Variables.Data = {
      0400000002000000100000003A0045004E00440044004100540045000C000000
      0000000000000000160000003A00460049004C00490041004C0043004F004400
      4500010000000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 440
    Top = 64
    object OrDSEndOstatSUMER: TFloatField
      FieldName = 'SUMER'
    end
  end
  object OrDSIncOtherFilials: TOracleDataSet
    SQL.Strings = (
      'select FilialNo, Filial, Rest'
      ' from ('
      
        '  select FilialNo, Filial, 0 - (sum(decode(Rest1, null, 0, Rest1' +
        ')-decode(Rest2, null, 0, Rest2))) as Rest'
      '  from ('
      '    select'
      '      f.ID as FilialNo,'
      '      f.Name as Filial,'
      '      ('
      '        select sum(lammount) as rest'
      '        from provarch'
      '        where'
      '          (dat between :BegDate and :EndDate)'
      '          and (debt = a.ID)'
      '          and ('
      '            kredit not in ('
      '              select ID from Account_Inc'
      '              where bal_cn1 = 5501'
      ''
      '            )'
      '          )'
      '      ) as Rest1,'
      '      ('
      '        select sum(lammount) as rest'
      '        from provarch'
      '        where'
      '          (dat between :BegDate and :EndDate)'
      '          and ('
      '            debt not in ('
      '              select ID from Account_Inc'
      '              where bal_cn1 = 5501'
      ''
      '            )'
      '          )'
      '          and (kredit = a.ID)'
      '      ) as Rest2'
      '    from'
      '      Account_Inc a,'
      '      Filial f'
      '    where'
      '      (a.bal_cn1 between 6000 and 7999)'
      '      and a.Filial not in (:FilialCode)'
      '      and f.ID = a.Filial'
      '  )'
      '  group by FilialNo, Filial'
      ')'
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
      ' ')
    Optimize = False
    Variables.Data = {
      0400000003000000100000003A0042004500470044004100540045000C000000
      0000000000000000100000003A0045004E00440044004100540045000C000000
      0000000000000000160000003A00460049004C00490041004C0043004F004400
      4500050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000300000010000000460049004C00490041004C004E004F0001000000
      00000C000000460049004C00490041004C000100000000000800000052004500
      53005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 192
    Top = 272
    object OrDSIncOtherFilialsFILIALNO: TFloatField
      FieldName = 'FILIALNO'
      Required = True
    end
    object OrDSIncOtherFilialsFILIAL: TStringField
      FieldName = 'FILIAL'
    end
    object OrDSIncOtherFilialsREST: TFloatField
      FieldName = 'REST'
    end
  end
  object OrDSExpOtherFilials: TOracleDataSet
    SQL.Strings = (
      'select FilialNo, Filial, Rest'
      ' from ('
      
        '  select FilialNo, Filial, 0 + (sum(decode(Rest1, null, 0, Rest1' +
        ')-decode(Rest2, null, 0, Rest2))) as Rest'
      '  from ('
      '    select'
      '      f.ID as FilialNo,'
      '      f.Name as Filial,'
      '      ('
      '        select sum(lammount) as rest'
      '        from provarch'
      '        where'
      '          (dat between :BegDate and :EndDate)'
      '          and (debt = a.ID)'
      '          and ('
      '            kredit not in ('
      '              select ID from Account_Inc'
      '              where bal_cn1 = 5501'
      ''
      '            )'
      '          )'
      '      ) as Rest1,'
      '      ('
      '        select sum(lammount) as rest'
      '        from provarch'
      '        where'
      '          (dat between :BegDate and :EndDate)'
      '          and ('
      '            debt not in ('
      '              select ID from Account_Inc'
      '              where bal_cn1 = 5501'
      ''
      '            )'
      '          )'
      '          and (kredit = a.ID)'
      '      ) as Rest2'
      '    from'
      '      Account_Inc a,'
      '      Filial f'
      '    where'
      '      (a.bal_cn1 between 8000 and 9999)'
      '      and a.Filial not in (:FilialCode)'
      '      and f.ID = a.Filial'
      '  )'
      '  group by FilialNo, Filial'
      ')'
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
      ' ')
    Optimize = False
    Variables.Data = {
      0400000003000000100000003A0042004500470044004100540045000C000000
      0000000000000000100000003A0045004E00440044004100540045000C000000
      0000000000000000160000003A00460049004C00490041004C0043004F004400
      4500050000000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 256
    Top = 272
    object OrDSExpOtherFilialsREST: TFloatField
      FieldName = 'REST'
    end
    object OrDSExpOtherFilialsFILIAL: TStringField
      FieldName = 'FILIAL'
    end
    object OrDSExpOtherFilialsFILIALNO: TFloatField
      FieldName = 'FILIALNO'
      Required = True
    end
  end
  object OPack_SL: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SL_Control'
    Left = 48
    Top = 368
  end
end
