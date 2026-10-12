object DataModuleTicketMan: TDataModuleTicketMan
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 480
  Width = 762
  object ODSTickets: TOracleDataSet
    SQL.Strings = (
      'select a.*,u.name tuser from sba_tm_archive a, user$ u'
      'where '
      '(u.id=a.userid)'
      
        'and (status in (select nvl(max (s.id),1) statusid from smart.tm_' +
        'status s, sba_advanced_grants g, sba_usergrants_advanced a'
      
        '                    where s.privname = g.grantname and g.id = a.' +
        'advancedgrantid and username = user))'
      ''
      'order by 1')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000001D00000004000000490044000100000000000A000000500044004100
      540045000100000000000800000050004E0055004D0001000000000016000000
      4400420041004E004B00460049004C00490041004C0001000000000012000000
      4400420041004E004B0043004F00440045000100000000001200000044004200
      41004E004B004E0041004D004500010000000000100000004400420041004E00
      4B0049004E004E00010000000000140000004400420041004E004B0053005700
      490046005400010000000000120000004400420041004E004B004B0041004300
      43000100000000000E00000044004100430043005F004E004F00010000000000
      1000000044004100430043004E0041004D0045000100000000000E0000004400
      41004300430049004E004E00010000000000160000004B00420041004E004B00
      460049004C00490041004C00010000000000120000004B00420041004E004B00
      43004F0044004500010000000000120000004B00420041004E004B004E004100
      4D004500010000000000100000004B00420041004E004B0049004E004E000100
      00000000140000004B00420041004E004B005300570049004600540001000000
      0000120000004B00420041004E004B004B004100430043000100000000001800
      00004B00420041004E004B005300550042004B00410043004300010000000000
      0E0000004B004100430043005F004E004F00010000000000100000004B004100
      430043004E0041004D0045000100000000000E0000004B004100430043004900
      4E004E000100000000000E00000041004D004D004F0055004E00540001000000
      0000160000004400450053004300520049005000540049004F004E0001000000
      00001600000049004E0046004F0052004D004100540049004F004E0001000000
      00000C0000005500530045005200490044000100000000000C00000053005400
      4100540055005300010000000000100000005400490043004B00540059005000
      45000100000000000A00000054005500530045005200010000000000}
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 32
    object ODSTicketsID: TFloatField
      FieldName = 'ID'
    end
    object ODSTicketsPDATE: TDateTimeField
      FieldName = 'PDATE'
    end
    object ODSTicketsPNUM: TFloatField
      FieldName = 'PNUM'
    end
    object ODSTicketsDBANKFILIAL: TFloatField
      FieldName = 'DBANKFILIAL'
    end
    object ODSTicketsDBANKCODE: TWideStringField
      FieldName = 'DBANKCODE'
      Size = 40
    end
    object ODSTicketsDBANKNAME: TWideStringField
      FieldName = 'DBANKNAME'
      Size = 1280
    end
    object ODSTicketsDBANKINN: TWideStringField
      FieldName = 'DBANKINN'
      Size = 240
    end
    object ODSTicketsDBANKSWIFT: TWideStringField
      FieldName = 'DBANKSWIFT'
      Size = 320
    end
    object ODSTicketsDBANKKACC: TWideStringField
      FieldName = 'DBANKKACC'
      Size = 448
    end
    object ODSTicketsDACC_NO: TWideStringField
      FieldName = 'DACC_NO'
      Size = 200
    end
    object ODSTicketsDACCNAME: TWideStringField
      FieldName = 'DACCNAME'
      Size = 1200
    end
    object ODSTicketsDACCINN: TWideStringField
      FieldName = 'DACCINN'
      Size = 60
    end
    object ODSTicketsKBANKFILIAL: TFloatField
      FieldName = 'KBANKFILIAL'
    end
    object ODSTicketsKBANKCODE: TWideStringField
      FieldName = 'KBANKCODE'
      Size = 512
    end
    object ODSTicketsKBANKNAME: TWideStringField
      FieldName = 'KBANKNAME'
      Size = 4000
    end
    object ODSTicketsKBANKINN: TWideStringField
      FieldName = 'KBANKINN'
      Size = 512
    end
    object ODSTicketsKBANKSWIFT: TWideStringField
      FieldName = 'KBANKSWIFT'
      Size = 512
    end
    object ODSTicketsKBANKKACC: TWideStringField
      FieldName = 'KBANKKACC'
      Size = 448
    end
    object ODSTicketsKBANKSUBKACC: TWideStringField
      FieldName = 'KBANKSUBKACC'
      Size = 448
    end
    object ODSTicketsKACC_NO: TWideStringField
      FieldName = 'KACC_NO'
      Size = 200
    end
    object ODSTicketsKACCNAME: TWideStringField
      FieldName = 'KACCNAME'
      Size = 1200
    end
    object ODSTicketsKACCINN: TWideStringField
      FieldName = 'KACCINN'
      Size = 60
    end
    object ODSTicketsAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSTicketsDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 2000
    end
    object ODSTicketsINFORMATION: TWideStringField
      FieldName = 'INFORMATION'
      Size = 2000
    end
    object ODSTicketsUSERID: TFloatField
      FieldName = 'USERID'
    end
    object ODSTicketsSTATUS: TFloatField
      FieldName = 'STATUS'
    end
    object ODSTicketsTICKTYPE: TFloatField
      FieldName = 'TICKTYPE'
    end
    object ODSTicketsTUSER: TWideStringField
      FieldName = 'TUSER'
      Required = True
      Size = 128
    end
  end
  object Tickets: TDataSource
    DataSet = ODSTickets
    Left = 16
    Top = 80
  end
  object ODSArchive: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      
        'select a.status, a.id, a.pdate, a.pnum, a.dbankfilial, a.dbankco' +
        'de, a.dbankname,'
      
        '       a.dbankinn, a.dbankswift, a.dbankkacc, a.dacc_no, a.daccn' +
        'ame,'
      
        '       a.daccinn, a.kbankfilial, a.kbankcode, a.kbankname, a.kba' +
        'nkinn,'
      
        '       a.kbankswift, a.kbankkacc, a.kbanksubkacc, a.kacc_no, a.k' +
        'accname,'
      
        '       a.kaccinn, a.ammount, a.description, a.information, a.use' +
        'rid, u.name tuser'
      '  from sba_tm_archive a, user$ u'
      ' where (u.id=a.userid) order by a.id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000001C0000000C0000005300540041005400550053000100000000000400
      0000490044000100000000000A00000050004400410054004500010000000000
      0800000050004E0055004D00010000000000160000004400420041004E004B00
      460049004C00490041004C00010000000000120000004400420041004E004B00
      43004F0044004500010000000000120000004400420041004E004B004E004100
      4D004500010000000000100000004400420041004E004B0049004E004E000100
      00000000140000004400420041004E004B005300570049004600540001000000
      0000120000004400420041004E004B004B004100430043000100000000000E00
      000044004100430043005F004E004F0001000000000010000000440041004300
      43004E0041004D0045000100000000000E000000440041004300430049004E00
      4E00010000000000160000004B00420041004E004B00460049004C0049004100
      4C00010000000000120000004B00420041004E004B0043004F00440045000100
      00000000120000004B00420041004E004B004E0041004D004500010000000000
      100000004B00420041004E004B0049004E004E00010000000000140000004B00
      420041004E004B0053005700490046005400010000000000120000004B004200
      41004E004B004B00410043004300010000000000180000004B00420041004E00
      4B005300550042004B004100430043000100000000000E0000004B0041004300
      43005F004E004F00010000000000100000004B004100430043004E0041004D00
      45000100000000000E0000004B0041004300430049004E004E00010000000000
      0E00000041004D004D004F0055004E0054000100000000001600000044004500
      53004300520049005000540049004F004E000100000000001600000049004E00
      46004F0052004D004100540049004F004E000100000000000C00000055005300
      45005200490044000100000000000A0000005400550053004500520001000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 99
    Top = 32
    object ODSArchiveSTATUS: TFloatField
      FieldName = 'STATUS'
    end
    object ODSArchiveID: TFloatField
      FieldName = 'ID'
    end
    object ODSArchivePDATE: TDateTimeField
      FieldName = 'PDATE'
    end
    object ODSArchivePNUM: TFloatField
      FieldName = 'PNUM'
    end
    object ODSArchiveDBANKFILIAL: TFloatField
      FieldName = 'DBANKFILIAL'
    end
    object ODSArchiveDBANKCODE: TWideStringField
      FieldName = 'DBANKCODE'
      Size = 40
    end
    object ODSArchiveDBANKNAME: TWideStringField
      FieldName = 'DBANKNAME'
      Size = 1280
    end
    object ODSArchiveDBANKINN: TWideStringField
      FieldName = 'DBANKINN'
      Size = 240
    end
    object ODSArchiveDBANKSWIFT: TWideStringField
      FieldName = 'DBANKSWIFT'
      Size = 320
    end
    object ODSArchiveDBANKKACC: TWideStringField
      FieldName = 'DBANKKACC'
      Size = 448
    end
    object ODSArchiveDACC_NO: TWideStringField
      FieldName = 'DACC_NO'
      Size = 200
    end
    object ODSArchiveDACCNAME: TWideStringField
      FieldName = 'DACCNAME'
      Size = 1200
    end
    object ODSArchiveDACCINN: TWideStringField
      FieldName = 'DACCINN'
      Size = 60
    end
    object ODSArchiveKBANKFILIAL: TFloatField
      FieldName = 'KBANKFILIAL'
    end
    object ODSArchiveKBANKCODE: TWideStringField
      FieldName = 'KBANKCODE'
      Size = 512
    end
    object ODSArchiveKBANKNAME: TWideStringField
      FieldName = 'KBANKNAME'
      Size = 4000
    end
    object ODSArchiveKBANKINN: TWideStringField
      FieldName = 'KBANKINN'
      Size = 512
    end
    object ODSArchiveKBANKSWIFT: TWideStringField
      FieldName = 'KBANKSWIFT'
      Size = 512
    end
    object ODSArchiveKBANKKACC: TWideStringField
      FieldName = 'KBANKKACC'
      Size = 448
    end
    object ODSArchiveKBANKSUBKACC: TWideStringField
      FieldName = 'KBANKSUBKACC'
      Size = 448
    end
    object ODSArchiveKACC_NO: TWideStringField
      FieldName = 'KACC_NO'
      Size = 200
    end
    object ODSArchiveKACCNAME: TWideStringField
      FieldName = 'KACCNAME'
      Size = 1200
    end
    object ODSArchiveKACCINN: TWideStringField
      FieldName = 'KACCINN'
      Size = 60
    end
    object ODSArchiveAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSArchiveDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 2000
    end
    object ODSArchiveINFORMATION: TWideStringField
      FieldName = 'INFORMATION'
      Size = 2000
    end
    object ODSArchiveUSERID: TFloatField
      FieldName = 'USERID'
    end
    object ODSArchiveTUSER: TWideStringField
      FieldName = 'TUSER'
      Required = True
      Size = 128
    end
  end
  object Archive: TDataSource
    DataSet = ODSArchive
    Left = 98
    Top = 80
  end
  object TM_MANAGE: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'TM_MANAGE'
    Left = 424
    Top = 152
  end
  object ODSAccount: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      ' /* select a.id, a.name, a.acc_no, c.inn'
      '    from account a, customers c'
      '   where a.kli_id = c.id*/'
      '  select a.id, a.name, a.acc_no, c.inn'
      '    from account a, customers c'
      '   where a.kli_id = c.id and a.kli_id=23745'
      '     and a.close_dat is null'
      '     and c.close_dat is null'
      'order by acc_no')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000040000000400000049004400010000000000080000004E0041004D00
      45000100000000000C0000004100430043005F004E004F000100000000000600
      000049004E004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 176
    Top = 32
    object ODSAccountID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSAccountNAME: TWideStringField
      FieldName = 'NAME'
      Size = 1440
    end
    object ODSAccountACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 448
    end
    object ODSAccountINN: TWideStringField
      FieldName = 'INN'
      Size = 80
    end
  end
  object Account: TDataSource
    DataSet = ODSAccount
    Left = 176
    Top = 80
  end
  object ODSBankM: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      
        'select id, bankcode||'#39'-'#39'||NVL (name, id || '#39' '#8470'-li Bank'#39') bname,i' +
        'nn, swift, bankcode, krno, subkrno from bankm order by name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000700000004000000490044000100000000000A00000042004E004100
      4D0045000100000000000600000049004E004E000100000000000A0000005300
      570049004600540001000000000010000000420041004E004B0043004F004400
      4500010000000000080000004B0052004E004F000100000000000E0000005300
      550042004B0052004E004F00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 264
    Top = 32
    object ODSBankMID: TFloatField
      FieldName = 'ID'
    end
    object ODSBankMBNAME: TWideStringField
      FieldName = 'BNAME'
      Size = 4000
    end
    object ODSBankMINN: TWideStringField
      FieldName = 'INN'
      Size = 512
    end
    object ODSBankMSWIFT: TWideStringField
      FieldName = 'SWIFT'
      Size = 512
    end
    object ODSBankMBANKCODE: TWideStringField
      FieldName = 'BANKCODE'
      Size = 512
    end
    object ODSBankMKRNO: TWideStringField
      FieldName = 'KRNO'
      Size = 448
    end
    object ODSBankMSUBKRNO: TWideStringField
      FieldName = 'SUBKRNO'
      Size = 448
    end
  end
  object BankM: TDataSource
    DataSet = ODSBankM
    Left = 264
    Top = 80
  end
  object ODSAllTickets: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select a.rowid, a.* from tm_archive a'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000001100000004000000490044000100000000000A000000500044004100
      540045000100000000000800000050004E0055004D0001000000000016000000
      4400420041004E004B00460049004C00490041004C000100000000000E000000
      44004100430043005F004E004F00010000000000100000004400410043004300
      4E0041004D0045000100000000000E000000440041004300430049004E004E00
      010000000000160000004B00420041004E004B00460049004C00490041004C00
      0100000000000E0000004B004100430043005F004E004F000100000000001000
      00004B004100430043004E0041004D0045000100000000000E0000004B004100
      4300430049004E004E000100000000000E00000041004D004D004F0055004E00
      5400010000000000160000004400450053004300520049005000540049004F00
      4E000100000000001600000049004E0046004F0052004D004100540049004F00
      4E000100000000000C0000005500530045005200490044000100000000000C00
      0000530054004100540055005300010000000000100000005400490043004B00
      5400590050004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 424
    Top = 32
    object ODSAllTicketsID: TFloatField
      FieldName = 'ID'
    end
    object ODSAllTicketsPDATE: TDateTimeField
      FieldName = 'PDATE'
    end
    object ODSAllTicketsPNUM: TFloatField
      FieldName = 'PNUM'
    end
    object ODSAllTicketsDBANKFILIAL: TFloatField
      FieldName = 'DBANKFILIAL'
    end
    object ODSAllTicketsDACC_NO: TWideStringField
      FieldName = 'DACC_NO'
      Size = 200
    end
    object ODSAllTicketsDACCNAME: TWideStringField
      FieldName = 'DACCNAME'
      Size = 1200
    end
    object ODSAllTicketsDACCINN: TWideStringField
      FieldName = 'DACCINN'
      Size = 60
    end
    object ODSAllTicketsKBANKFILIAL: TFloatField
      FieldName = 'KBANKFILIAL'
    end
    object ODSAllTicketsKACC_NO: TWideStringField
      FieldName = 'KACC_NO'
      Size = 200
    end
    object ODSAllTicketsKACCNAME: TWideStringField
      FieldName = 'KACCNAME'
      Size = 1200
    end
    object ODSAllTicketsKACCINN: TWideStringField
      FieldName = 'KACCINN'
      Size = 60
    end
    object ODSAllTicketsAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSAllTicketsDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 2000
    end
    object ODSAllTicketsINFORMATION: TWideStringField
      FieldName = 'INFORMATION'
      Size = 2000
    end
    object ODSAllTicketsUSERID: TFloatField
      FieldName = 'USERID'
    end
    object ODSAllTicketsSTATUS: TFloatField
      FieldName = 'STATUS'
    end
  end
  object AllTickets: TDataSource
    DataSet = ODSAllTickets
    Left = 424
    Top = 88
  end
  object ODSforPrint: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      
        'select a.status, a.id, a.pdate, a.pnum, a.dbankfilial, a.dbankco' +
        'de, a.dbankname,'
      
        '       a.dbankinn, a.dbankswift, a.dbankkacc, a.dacc_no, a.daccn' +
        'ame,'
      
        '       a.daccinn, a.kbankfilial, a.kbankcode, a.kbankname, a.kba' +
        'nkinn,'
      
        '       a.kbankswift, a.kbankkacc, a.kbanksubkacc, a.kacc_no, a.k' +
        'accname,'
      
        '       a.kaccinn, a.ammount, a.description, a.information, a.use' +
        'rid, u.name tuser'
      '  from sba_tm_archive a, user$ u'
      ' where (u.id=a.userid)'
      '   and a.id = :id '
      '')
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001C0000000C0000005300540041005400550053000100000000000400
      0000490044000100000000000A00000050004400410054004500010000000000
      0800000050004E0055004D00010000000000160000004400420041004E004B00
      460049004C00490041004C00010000000000120000004400420041004E004B00
      43004F0044004500010000000000120000004400420041004E004B004E004100
      4D004500010000000000100000004400420041004E004B0049004E004E000100
      00000000140000004400420041004E004B005300570049004600540001000000
      0000120000004400420041004E004B004B004100430043000100000000000E00
      000044004100430043005F004E004F0001000000000010000000440041004300
      43004E0041004D0045000100000000000E000000440041004300430049004E00
      4E00010000000000160000004B00420041004E004B00460049004C0049004100
      4C00010000000000120000004B00420041004E004B0043004F00440045000100
      00000000120000004B00420041004E004B004E0041004D004500010000000000
      100000004B00420041004E004B0049004E004E00010000000000140000004B00
      420041004E004B0053005700490046005400010000000000120000004B004200
      41004E004B004B00410043004300010000000000180000004B00420041004E00
      4B005300550042004B004100430043000100000000000E0000004B0041004300
      43005F004E004F00010000000000100000004B004100430043004E0041004D00
      45000100000000000E0000004B0041004300430049004E004E00010000000000
      0E00000041004D004D004F0055004E0054000100000000001600000044004500
      53004300520049005000540049004F004E000100000000001600000049004E00
      46004F0052004D004100540049004F004E000100000000000C00000055005300
      45005200490044000100000000000A0000005400550053004500520001000000
      0000}
    DetailFields = 'ID'
    Session = sboapiDataModule.SBSession
    Left = 616
    Top = 32
    object ODSforPrintSTATUS: TFloatField
      FieldName = 'STATUS'
    end
    object ODSforPrintID: TFloatField
      FieldName = 'ID'
    end
    object ODSforPrintPDATE: TDateTimeField
      FieldName = 'PDATE'
    end
    object ODSforPrintPNUM: TFloatField
      FieldName = 'PNUM'
    end
    object ODSforPrintDBANKFILIAL: TFloatField
      FieldName = 'DBANKFILIAL'
    end
    object ODSforPrintDBANKCODE: TWideStringField
      FieldName = 'DBANKCODE'
      Size = 40
    end
    object ODSforPrintDBANKNAME: TWideStringField
      FieldName = 'DBANKNAME'
      Size = 1280
    end
    object ODSforPrintDBANKINN: TWideStringField
      FieldName = 'DBANKINN'
      Size = 240
    end
    object ODSforPrintDBANKSWIFT: TWideStringField
      FieldName = 'DBANKSWIFT'
      Size = 320
    end
    object ODSforPrintDBANKKACC: TWideStringField
      FieldName = 'DBANKKACC'
      Size = 448
    end
    object ODSforPrintDACC_NO: TWideStringField
      FieldName = 'DACC_NO'
      Size = 200
    end
    object ODSforPrintDACCNAME: TWideStringField
      FieldName = 'DACCNAME'
      Size = 1200
    end
    object ODSforPrintDACCINN: TWideStringField
      FieldName = 'DACCINN'
      Size = 60
    end
    object ODSforPrintKBANKFILIAL: TFloatField
      FieldName = 'KBANKFILIAL'
    end
    object ODSforPrintKBANKCODE: TWideStringField
      FieldName = 'KBANKCODE'
      Size = 512
    end
    object ODSforPrintKBANKNAME: TWideStringField
      FieldName = 'KBANKNAME'
      Size = 4000
    end
    object ODSforPrintKBANKINN: TWideStringField
      FieldName = 'KBANKINN'
      Size = 512
    end
    object ODSforPrintKBANKSWIFT: TWideStringField
      FieldName = 'KBANKSWIFT'
      Size = 512
    end
    object ODSforPrintKBANKKACC: TWideStringField
      FieldName = 'KBANKKACC'
      Size = 448
    end
    object ODSforPrintKBANKSUBKACC: TWideStringField
      FieldName = 'KBANKSUBKACC'
      Size = 448
    end
    object ODSforPrintKACC_NO: TWideStringField
      FieldName = 'KACC_NO'
      Size = 200
    end
    object ODSforPrintKACCNAME: TWideStringField
      FieldName = 'KACCNAME'
      Size = 1200
    end
    object ODSforPrintKACCINN: TWideStringField
      FieldName = 'KACCINN'
      Size = 60
    end
    object ODSforPrintAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSforPrintDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 2000
    end
    object ODSforPrintINFORMATION: TWideStringField
      FieldName = 'INFORMATION'
      Size = 2000
    end
    object ODSforPrintUSERID: TFloatField
      FieldName = 'USERID'
    end
    object ODSforPrintTUSER: TWideStringField
      FieldName = 'TUSER'
      Required = True
      Size = 128
    end
  end
  object ODSSettings: TOracleDataSet
    SQL.Strings = (
      
        'SELECT rowid, id, reportname, lblabel, lbtitle, lbdescr, lbbnumb' +
        ',formatdat'
      '  FROM tm_report_settings')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000007000000040000004900440001000000000014000000520045005000
      4F00520054004E0041004D0045000100000000000E0000004C0042004C004100
      420045004C000100000000000E0000004C0042005400490054004C0045000100
      000000000E0000004C004200440045005300430052000100000000000E000000
      4C00420042004E0055004D0042000100000000001200000046004F0052004D00
      41005400440041005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 688
    Top = 32
    object ODSSettingsID: TFloatField
      FieldName = 'ID'
    end
    object ODSSettingsREPORTNAME: TWideStringField
      FieldName = 'REPORTNAME'
      Size = 400
    end
    object ODSSettingsLBLABEL: TWideStringField
      FieldName = 'LBLABEL'
      Size = 8
    end
    object ODSSettingsLBTITLE: TWideStringField
      FieldName = 'LBTITLE'
      Size = 200
    end
    object ODSSettingsLBDESCR: TWideStringField
      FieldName = 'LBDESCR'
      Size = 1020
    end
    object ODSSettingsLBBNUMB: TWideStringField
      FieldName = 'LBBNUMB'
      Size = 80
    end
    object ODSSettingsFORMATDAT: TWideStringField
      FieldName = 'FORMATDAT'
      Size = 80
    end
  end
  object Settings: TDataSource
    DataSet = ODSSettings
    Left = 520
    Top = 96
  end
  object ODSStatuses: TOracleDataSet
    SQL.Strings = (
      'select * from (select * from tm_status'
      
        'where (id  <= (select nvl(max (s.id),6) statusid from smart.tm_s' +
        'tatus s, sba_advanced_grants g, sba_usergrants_advanced a'
      
        '                    where s.privname = g.grantname and g.id = a.' +
        'advancedgrantid and username = user))'
      'union all '
      'select -1,'#39'-'#39','#39#1065#1072#1084#1099#1089#1099#39' from dual)'
      'order by id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000003000000040000004900440001000000000010000000500052004900
      56004E0041004D00450001000000000010000000500052004900560044004500
      53004300010000000000}
    Session = sboapiDataModule.SBSession
    Left = 336
    Top = 32
    object ODSStatusesID: TFloatField
      FieldName = 'ID'
    end
    object ODSStatusesPRIVNAME: TWideStringField
      FieldName = 'PRIVNAME'
      Size = 120
    end
    object ODSStatusesPRIVDESC: TWideStringField
      FieldName = 'PRIVDESC'
      Size = 120
    end
  end
  object Statuses: TDataSource
    DataSet = ODSStatuses
    Left = 336
    Top = 88
  end
  object ODSPaymentDecree: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      
        'select a.id, a.pdate, a.pnum, a.dbankfilial, a.dbankcode, a.dban' +
        'kname,'
      
        '       a.dbankinn, a.dbankswift, a.dbankkacc, a.dacc_no, a.daccn' +
        'ame,'
      
        '       a.daccinn, a.kbankfilial, a.kbankcode, a.kbankname, a.kba' +
        'nkinn,'
      
        '       a.kbankswift, a.kbankkacc, a.kbanksubkacc, a.kacc_no, a.k' +
        'accname,'
      
        '       a.kaccinn, a.ammount, a.description, a.information, a.use' +
        'rid, a.status'
      '  from sba_tm_archive a'
      ' where a.id=:id')
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001B00000004000000490044000100000000000A000000500044004100
      540045000100000000000800000050004E0055004D0001000000000016000000
      4400420041004E004B00460049004C00490041004C0001000000000012000000
      4400420041004E004B0043004F00440045000100000000001200000044004200
      41004E004B004E0041004D004500010000000000100000004400420041004E00
      4B0049004E004E00010000000000140000004400420041004E004B0053005700
      490046005400010000000000120000004400420041004E004B004B0041004300
      43000100000000000E00000044004100430043005F004E004F00010000000000
      1000000044004100430043004E0041004D0045000100000000000E0000004400
      41004300430049004E004E00010000000000160000004B00420041004E004B00
      460049004C00490041004C00010000000000120000004B00420041004E004B00
      43004F0044004500010000000000120000004B00420041004E004B004E004100
      4D004500010000000000100000004B00420041004E004B0049004E004E000100
      00000000140000004B00420041004E004B005300570049004600540001000000
      0000120000004B00420041004E004B004B004100430043000100000000001800
      00004B00420041004E004B005300550042004B00410043004300010000000000
      0E0000004B004100430043005F004E004F00010000000000100000004B004100
      430043004E0041004D0045000100000000000E0000004B004100430043004900
      4E004E000100000000000E00000041004D004D004F0055004E00540001000000
      0000160000004400450053004300520049005000540049004F004E0001000000
      00001600000049004E0046004F0052004D004100540049004F004E0001000000
      00000C0000005500530045005200490044000100000000000C00000053005400
      4100540055005300010000000000}
    Session = sboapiDataModule.SBSession
    Left = 520
    Top = 32
    object ODSPaymentDecreeID: TFloatField
      FieldName = 'ID'
    end
    object ODSPaymentDecreePDATE: TDateTimeField
      FieldName = 'PDATE'
    end
    object ODSPaymentDecreePNUM: TFloatField
      FieldName = 'PNUM'
    end
    object ODSPaymentDecreeDBANKFILIAL: TFloatField
      FieldName = 'DBANKFILIAL'
    end
    object ODSPaymentDecreeDBANKCODE: TWideStringField
      FieldName = 'DBANKCODE'
      Size = 40
    end
    object ODSPaymentDecreeDBANKNAME: TWideStringField
      FieldName = 'DBANKNAME'
      Size = 1280
    end
    object ODSPaymentDecreeDBANKINN: TWideStringField
      FieldName = 'DBANKINN'
      Size = 240
    end
    object ODSPaymentDecreeDBANKSWIFT: TWideStringField
      FieldName = 'DBANKSWIFT'
      Size = 320
    end
    object ODSPaymentDecreeDBANKKACC: TWideStringField
      FieldName = 'DBANKKACC'
      Size = 448
    end
    object ODSPaymentDecreeDACC_NO: TWideStringField
      FieldName = 'DACC_NO'
      Size = 200
    end
    object ODSPaymentDecreeDACCNAME: TWideStringField
      FieldName = 'DACCNAME'
      Size = 1200
    end
    object ODSPaymentDecreeDACCINN: TWideStringField
      FieldName = 'DACCINN'
      Size = 60
    end
    object ODSPaymentDecreeKBANKFILIAL: TFloatField
      FieldName = 'KBANKFILIAL'
    end
    object ODSPaymentDecreeKBANKCODE: TWideStringField
      FieldName = 'KBANKCODE'
      Size = 512
    end
    object ODSPaymentDecreeKBANKNAME: TWideStringField
      FieldName = 'KBANKNAME'
      Size = 4000
    end
    object ODSPaymentDecreeKBANKINN: TWideStringField
      FieldName = 'KBANKINN'
      Size = 512
    end
    object ODSPaymentDecreeKBANKSWIFT: TWideStringField
      FieldName = 'KBANKSWIFT'
      Size = 512
    end
    object ODSPaymentDecreeKBANKKACC: TWideStringField
      FieldName = 'KBANKKACC'
      Size = 448
    end
    object ODSPaymentDecreeKBANKSUBKACC: TWideStringField
      FieldName = 'KBANKSUBKACC'
      Size = 448
    end
    object ODSPaymentDecreeKACC_NO: TWideStringField
      FieldName = 'KACC_NO'
      Size = 200
    end
    object ODSPaymentDecreeKACCNAME: TWideStringField
      FieldName = 'KACCNAME'
      Size = 1200
    end
    object ODSPaymentDecreeKACCINN: TWideStringField
      FieldName = 'KACCINN'
      Size = 60
    end
    object ODSPaymentDecreeAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSPaymentDecreeDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 2000
    end
    object ODSPaymentDecreeINFORMATION: TWideStringField
      FieldName = 'INFORMATION'
      Size = 2000
    end
    object ODSPaymentDecreeUSERID: TFloatField
      FieldName = 'USERID'
    end
    object ODSPaymentDecreeSTATUS: TFloatField
      FieldName = 'STATUS'
    end
  end
  object ChangeStat: TDataSource
    DataSet = ODSStatuses
    Left = 336
    Top = 141
  end
end
