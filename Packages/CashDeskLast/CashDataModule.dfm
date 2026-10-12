object CashDataMod: TCashDataMod
  OldCreateOrder = False
  Height = 588
  Width = 769
  object ODSCurrency: TOracleDataSet
    SQL.Strings = (
      'Select Valute ,Valu_Name From AValute order by VALUTE')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 232
    Top = 176
  end
  object ODSCashReport: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT'
      '  SUM(PR.LAMMOUNT)  /*/1000 */ AS LAMMOUNTS'
      ' ,PR.KASSA_B     AS BSYMBOL'
      ' ,MAX(CASH.NAME) AS NAME'
      ' ,MIN(CASH.MEDIOCRITY) AS MEDIOCRITY'
      ' FROM PROVARCH PR,KASSA_B CASH'
      ' WHERE'
      '     DAT>=:FIRSTDATE'
      ' AND DAT<=:LASTDATE'
      ' AND CASH.SYMBOL=PR.KASSA_B'
      ''
      
        '  AND((debt in (Select ac.Id from account ac,Bal_spr1 b where b.' +
        'cashincoming=1 and b.Bal_cn=ac.Bal_cn1))'
      ' OR'
      
        ' (Kredit in (Select ac.Id from account ac,Bal_spr1 b where b.cas' +
        'hincoming=1 and b.Bal_cn=ac.Bal_cn1)))'
      ''
      '  GROUP BY PR.KASSA_B'
      ''
      'UNION'
      ''
      'Select '
      '  ABS(Sum(Ar.pok_ostat))  /*/1000*/ as LAMMOUNTS'
      ' ,'#39'35'#39' as BSYMBOL'
      ' ,'#39'Hesabat tarixinin '#601'vv'#601'lin'#601' kassan'#305'n qal'#305#287#305#39' as NAME'
      ' ,0 as MEDIOCRITY'
      'from '
      '  ACCOUNT AC'
      ' ,ARCHOST AR'
      ''
      'where'
      '  AC.ID = AR.ACC_ID '
      
        '   and AC.BAL_CN1 in (Select bal_cn from Bal_spr1 where cashinco' +
        'ming=1)'
      
        '   and AR.datdate = (Select max(dat) from operkurs where dat<:Fi' +
        'rstDate)'
      '   and ac.val_acc=0'
      ''
      'UNION'
      ''
      'Select '
      '  ABS(Sum(Ar.pok_ostat)) /*/1000 */ as LAMMOUNTS'
      ' ,'#39'70'#39' as BSYMBOL'
      ' ,'#39'Hesabat tarixinin sonuna kassan'#305'n qal'#305#287#305#39' as NAME'
      ' ,1 as MEDIOCRITY'
      'from '
      '  ACCOUNT AC'
      ' ,ARCHOST AR'
      ''
      'where'
      '  AC.ID = AR.ACC_ID '
      
        '   and AC.BAL_CN1 in (Select bal_cn from Bal_spr1 where cashinco' +
        'ming=1)'
      
        '   and AR.datdate = (Select max(dat) from operkurs where dat<=:L' +
        'astDate)'
      '   and ac.val_acc=0'
      ''
      ''
      'ORDER BY'
      ' MEDIOCRITY'
      ',BSYMBOL'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Optimize = False
    Variables.Data = {
      0400000002000000140000003A00460049005200530054004400410054004500
      0C0000000000000000000000120000003A004C00410053005400440041005400
      45000C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000004000000120000004C0041004D004D004F0055004E00540053000100
      000000000E0000004200530059004D0042004F004C0001000000000008000000
      4E0041004D004500010000000000140000004D004500440049004F0043005200
      490054005900010000000000}
    Session = sboapiDataModule.SBSession
    Left = 144
    Top = 136
    object ODSCashReportLAMMOUNTS: TFloatField
      FieldName = 'LAMMOUNTS'
    end
    object ODSCashReportNAME: TWideStringField
      FieldName = 'NAME'
      Size = 777
    end
    object ODSCashReportMEDIOCRITY: TFloatField
      FieldName = 'MEDIOCRITY'
    end
    object ODSCashReportBSYMBOL: TWideStringField
      FieldName = 'BSYMBOL'
      Size = 5
    end
  end
  object DataSrcCashReort: TDataSource
    DataSet = ODSCashReport
    Left = 40
    Top = 136
  end
  object OPCash: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SB_CASHREPORT'
    Left = 232
    Top = 13
  end
  object ODSIOCome: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  PR.LAMMOUNT,PR.AMMOUNT'
      ' ,PR.KASSA_B AS BSYMBOL'
      ' ,AC.ACC_NO AS ACCOUNTNUMBER, PR.NO_PROV'
      ' FROM  ACCOUNT AC,  :prov PR'
      ' WHERE PR.DAT >= :FIRSTDATE AND PR.DAT<=:LASTDATE'
      '     AND PR.DEBT = AC.ID'
      
        '     AND (PR.KREDIT IN (SELECT AC.ID FROM ACCOUNT AC,BAL_SPR1 B ' +
        'WHERE B.BAL_CN=AC.BAL_CN1 AND B.CASHINCOMING=1))'
      ''
      'ORDER BY'
      '   pr.no_prov, Pr.kassa_b'
      '  ,Ac.acc_no'
      '     '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Optimize = False
    Variables.Data = {
      0400000003000000140000003A00460049005200530054004400410054004500
      0C0000000000000000000000120000003A004C00410053005400440041005400
      45000C00000000000000000000000A0000003A00500052004F00560001000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000005000000100000004C0041004D004D004F0055004E00540001000000
      00000E00000041004D004D004F0055004E0054000100000000000E0000004200
      530059004D0042004F004C000100000000001A0000004100430043004F005500
      4E0054004E0055004D004200450052000100000000000E0000004E004F005F00
      500052004F005600010000000000}
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 24
    object ODSIOComeLAMMOUNT: TFloatField
      FieldName = 'LAMMOUNT'
    end
    object ODSIOComeBSYMBOL: TWideStringField
      FieldName = 'BSYMBOL'
      Size = 5
    end
    object ODSIOComeACCOUNTNUMBER: TWideStringField
      FieldName = 'ACCOUNTNUMBER'
      Size = 28
    end
    object ODSIOComeAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSIOComeNO_PROV: TWideStringField
      FieldName = 'NO_PROV'
      Size = 8
    end
  end
  object DataSrcViewer: TDataSource
    DataSet = ODSTransactionsViewer
    Left = 71
    Top = 85
  end
  object ODSTransactionsViewer: TOracleDataSet
    SQL.Strings = (
      '/*SELECT DISTINCT'
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
      ' ,PR.OP_ID AS OperatorID , PR.COMMIT_OPID AS CommitterID'
      
        ' ,PR.NAME AS ASSIGNMENT,c.issuedby,c.seria,c.docnumber,c.person_' +
        'doc,c.fromwhen'
      '  FROM  PROVARCH PR,ACCOUNT AC1,ACCOUNT AC2'
      '      ,BAL_SPR1 REFERENCE'
      ' WHERE'
      '        AC1.ID=PR.DEBT and pr.id=c.id(+)'
      '    AND AC2.ID=PR.KREDIT'
      '    AND PR.DAT>=:FIRSTDATE'
      '    AND PR.DAT<=:LASTDATE'
      ''
      '    AND REFERENCE.CASHINCOMING=1'
      '    and ac1.bal_cn1<>ac2.bal_cn1 --S.M.21.09.2013'
      '  '
      ''
      ''
      ''
      '*/'
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
      ''
      'ORDER BY  pr.id'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Optimize = False
    Session = sboapiDataModule.SBSession
    AfterScroll = ODSTransactionsViewerAfterScroll
    Left = 135
    Top = 21
    object ODSTransactionsViewerDAT: TDateTimeField
      DisplayLabel = 'Tarix'
      FieldName = 'DAT'
    end
    object ODSTransactionsViewerID: TFloatField
      DisplayLabel = 'G'#220'N'#220'N S'#399'N'#399'D'#304'ND'#399' '#304'D'
      FieldName = 'ID'
      Required = True
    end
    object ODSTransactionsViewerDEBIT: TWideStringField
      DisplayLabel = 'DEBET'
      FieldName = 'DEBIT'
      Size = 28
    end
    object ODSTransactionsViewerDNAME: TWideStringField
      DisplayLabel = 'Debet hesab'#305'n ad'#305
      FieldName = 'DNAME'
      Size = 90
    end
    object ODSTransactionsViewerDEBTID: TFloatField
      DisplayLabel = 'DEBET ID'
      FieldName = 'DEBTID'
    end
    object ODSTransactionsViewerKREDITID: TFloatField
      DisplayLabel = 'KREDIT ID'
      FieldName = 'KREDITID'
    end
    object ODSTransactionsViewerDCURRENCY: TFloatField
      DisplayLabel = 'Debet valyuta'
      FieldName = 'DCURRENCY'
    end
    object ODSTransactionsViewerKREDIT: TWideStringField
      FieldName = 'KREDIT'
      Size = 28
    end
    object ODSTransactionsViewerKLI_ID: TFloatField
      DisplayLabel = 'KL'#304'_'#304'D'
      FieldName = 'KLI_ID'
    end
    object ODSTransactionsViewerKNAME: TWideStringField
      DisplayLabel = 'Kredithesab'#305'n ad'#305
      FieldName = 'KNAME'
      Size = 90
    end
    object ODSTransactionsViewerDEBTCOME: TFloatField
      DisplayLabel = 'DEBET BALANS'
      FieldName = 'DEBTCOME'
    end
    object ODSTransactionsViewerCREDITCOME: TFloatField
      DisplayLabel = 'KRED'#304'T BALANS'
      FieldName = 'CREDITCOME'
    end
    object ODSTransactionsViewerKCURRENCY: TIntegerField
      DisplayLabel = 'KRED'#304'T VALYUTA'
      FieldName = 'KCURRENCY'
    end
    object ODSTransactionsViewerDAMMOUNT: TFloatField
      DisplayLabel = 'DEBET M'#399'BL'#399#286
      FieldName = 'DAMMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object ODSTransactionsViewerKAMMOUNT: TFloatField
      DisplayLabel = 'KRED'#304'T  M'#399'BL'#399#286
      FieldName = 'KAMMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object ODSTransactionsViewerLAMMOUNT: TFloatField
      DisplayLabel = ' M'#399'BL'#399#286
      FieldName = 'LAMMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object ODSTransactionsViewerBSYMBOL: TWideStringField
      DisplayLabel = 'KASSA S'#304'MVOLU'
      FieldName = 'BSYMBOL'
      Size = 5
    end
    object ODSTransactionsViewerASSIGNMENT: TWideStringField
      DisplayLabel = 'T'#399'Y'#304'NATI'
      FieldName = 'ASSIGNMENT'
      Size = 255
    end
    object ODSTransactionsViewerISSUEDBY: TWideStringField
      FieldName = 'ISSUEDBY'
      Size = 1600
    end
    object ODSTransactionsViewerPERSON_DOC: TWideStringField
      FieldName = 'PERSON_DOC'
      Size = 640
    end
    object ODSTransactionsViewerSERIA: TWideStringField
      FieldName = 'SERIA'
      Size = 640
    end
    object ODSTransactionsViewerDOCNUMBER: TWideStringField
      FieldName = 'DOCNUMBER'
      Size = 640
    end
    object ODSTransactionsViewerFROMWHEN: TWideStringField
      FieldName = 'FROMWHEN'
      Size = 1600
    end
    object ODSTransactionsViewerval_name: TWideStringField
      DisplayLabel = 'VALYUTANIN ADI'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'val_name'
      LookupDataSet = ODSValute
      LookupKeyFields = 'VALUTE'
      LookupResultField = 'VAL_NAME'
      KeyFields = 'DCURRENCY'
      Lookup = True
    end
    object ODSTransactionsViewerDEBETFILIAL: TIntegerField
      DisplayLabel = 'DEBET FILIAL'
      FieldName = 'DEBETFILIAL'
    end
    object ODSTransactionsViewerCREDITFILIAL: TIntegerField
      DisplayLabel = 'KREDIT FILIAL'
      FieldName = 'CREDITFILIAL'
    end
    object ODSTransactionsViewerRecordNo: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'RecordNo'
      OnGetText = ODSTransactionsViewerRecordNoGetText
      Calculated = True
    end
    object ODSTransactionsViewerDEBTCURNAME: TWideStringField
      DisplayLabel = 'DEBET VALYUTA'
      FieldName = 'DEBTCURNAME'
      Size = 4000
    end
    object ODSTransactionsViewerCREDITCURNAME: TWideStringField
      DisplayLabel = 'KRED'#304'T VALYUTA'
      FieldName = 'CREDITCURNAME'
      Size = 4000
    end
    object ODSTransactionsViewerNO_PROV: TWideStringField
      FieldName = 'NO_PROV'
      Size = 8
    end
    object ODSTransactionsViewerOPERATORID: TFloatField
      DisplayLabel = 'DAX'#304'L ED'#399'N'
      FieldName = 'OPERATORID'
    end
    object ODSTransactionsViewerCommitterID: TFloatField
      DisplayLabel = 'T'#399'SD'#304'Q ED'#399'N'
      FieldName = 'CommitterID'
    end
  end
  object ODSLogo: TOracleDataSet
    SQL.Strings = (
      'Select '
      '   logo From BankInfo'
      ' ')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 232
    Top = 72
    object ODSLogoLOGO: TBlobField
      FieldName = 'LOGO'
    end
  end
  object ODSCashInfo: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  C.RowID,'
      '  C.*'
      'From'
      '  CashInfo C'
      'Where'
      '  ID=:ID')
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000006000000040000004900440001000000000014000000500045005200
      53004F004E005F0044004F004300010000000000100000004900530053005500
      45004400420059000100000000000A0000005300450052004900410001000000
      00001200000044004F0043004E0055004D004200450052000100000000001000
      0000460052004F004D005700480045004E00010000000000}
    Master = ODSTransactionsViewer2
    MasterFields = 'ID'
    DetailFields = 'ID'
    Session = sboapiDataModule.SBSession
    Left = 144
    Top = 192
    object ODSCashInfoID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSCashInfoPERSON_DOC: TWideStringField
      FieldName = 'PERSON_DOC'
      Size = 40
    end
    object ODSCashInfoISSUEDBY: TWideStringField
      FieldName = 'ISSUEDBY'
      Size = 500
    end
    object ODSCashInfoSERIA: TWideStringField
      FieldName = 'SERIA'
      Size = 40
    end
    object ODSCashInfoDOCNUMBER: TWideStringField
      FieldName = 'DOCNUMBER'
      Size = 40
    end
    object ODSCashInfoFROMWHEN: TWideStringField
      FieldName = 'FROMWHEN'
      Size = 100
    end
  end
  object DSCashInfo: TDataSource
    DataSet = ODSCashInfo
    Left = 24
    Top = 184
  end
  object ODSCashB: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   symbol'
      'From'
      '   Kassa_B'
      'Order by symbol')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 232
    Top = 128
  end
  object ODSRates: TOracleDataSet
    SQL.Strings = (
      'Select'
      ' Currencys.Val_Name as Currency'
      ',Rates.Ostat as Rate'
      ',Rates.Dat  as PresentDate '
      '  From OperKurs Rates,AValute Currencys'
      '  Where'
      '      Currencys.Valute=Rates.VAL_KOD'
      '  And Rates.Dat =:ADate'
      '  And Currencys.Valute =:Currency'
      ''
      ''
      ''
      ' ')
    Optimize = False
    Variables.Data = {
      04000000020000000C0000003A00410044004100540045000C00000000000000
      00000000120000003A00430055005200520045004E0043005900030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000300000010000000430055005200520045004E004300590001000000
      0000080000005200410054004500010000000000160000005000520045005300
      45004E0054004400410054004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 232
    Top = 224
    object ODSRatesRATE: TFloatField
      FieldName = 'RATE'
    end
    object ODSRatesPRESENTDATE: TDateTimeField
      FieldName = 'PRESENTDATE'
      Required = True
    end
    object ODSRatesCURRENCY: TWideStringField
      FieldName = 'CURRENCY'
      Size = 10
    end
  end
  object ODSValute: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  valute,'
      '  val_name'
      'From'
      '  Avalute ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C000000560041004C005500540045000100000000001000
      0000560041004C005F004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 104
    Top = 264
    object ODSValuteVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object ODSValuteVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
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
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A00560041004C00550054004500030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000030000000C000000560041004C005500540045000100000000001200
      0000560041004C0055005F004E0041004D004500010000000000120000005600
      41004C0055005F00420041004C004100010000000000}
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 256
    object ODSValuteNameVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object ODSValuteNameVALU_NAME: TWideStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
    object ODSValuteNameVALU_BALA: TWideStringField
      FieldName = 'VALU_BALA'
      Size = 25
    end
  end
  object Filials: TOracleDataSet
    SQL.Strings = (
      'Select * from Filial '
      'order by id')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 320
  end
  object CashSymbols: TOracleDataSet
    SQL.Strings = (
      'Select * from KAssa_B '
      'order by symbol')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 168
    Top = 256
  end
  object TotalResult: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   DLAMMOUNT'
      '  ,DAMMOUNT'
      '  ,DCOUNT'
      '  ,CLAMMOUNT'
      '  ,CAMMOUNT'
      '  ,CCOUNT'
      '  ,CASHREMAINDER'
      'FROM'
      ''
      '('
      ' SELECT'
      '   SUM(PR.LAMMOUNT) as DLAMMOUNT'
      '  ,SUM(PR.AMMOUNT) as  DAMMOUNT'
      '  ,COUNT(*) as DCOUNT'
      ' FROM  ACCOUNT AC,PROVARCH PR'
      ' WHERE PR.DAT >=:FirstDate AND PR.DAT<=:LastDate'
      '     AND PR.KREDIT = AC.ID'
      
        '     AND (PR.DEBT IN (SELECT AC.ID FROM ACCOUNT AC,BAL_SPR1 B WH' +
        'ERE B.BAL_CN=AC.BAL_CN1 AND B.CASHINCOMING=1))'
      '     AND ((PR.val_acc =:CurrencyID) ) AND AC.FILIAL=:BRANCHID'
      '     AND'
      '     --NOT PR.KASSA_B IS NULL'
      '     (Decode(PR.VID_OP,null,1,1,0,1)=1)'
      '     )'
      ','
      '('
      ' SELECT'
      '   SUM(PR.LAMMOUNT) as CLAMMOUNT'
      '  ,SUM(PR.AMMOUNT_C) as CAMMOUNT'
      '  ,COUNT(*) as CCOUNT'
      ' FROM  ACCOUNT AC,PROVARCH PR'
      ' WHERE PR.DAT >=:FirstDate AND PR.DAT<=:LastDate'
      '     AND PR.DEBT = AC.ID'
      
        '     AND (PR.KREDIT IN (SELECT AC.ID FROM ACCOUNT AC,BAL_SPR1 B ' +
        'WHERE B.BAL_CN=AC.BAL_CN1 AND B.CASHINCOMING=1))'
      
        '     AND ((PR.CURRENCYID_C =:CurrencyID)) AND AC.FILIAL=:BRANCHI' +
        'D'
      '     AND'
      '     --NOT PR.KASSA_B IS NULL'
      '     (Decode(PR.VID_OP,null,1,1,0,1)=1)'
      '     )'
      ','
      '('
      'Select'
      '  ABS(Sum(Ar.ostat)) as CASHREMAINDER'
      'from'
      '  ACCOUNT AC'
      ' ,ARCHOST AR'
      'where'
      '  AC.ID = AR.ACC_ID'
      
        '   and AC.BAL_CN1 in (Select bal_cn from Bal_spr1 where cashinco' +
        'ming=1)'
      
        '   and AR.datdate = (Select max(dat) from operkurs where dat<=:L' +
        'astDate)'
      '   and ac.val_acc=:CurrencyID and ac.filial=:BRANCHID'
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
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Optimize = False
    Variables.Data = {
      0400000004000000140000003A00460049005200530054004400410054004500
      0C0000000000000000000000120000003A004C00410053005400440041005400
      45000C0000000000000000000000160000003A00430055005200520045004E00
      4300590049004400030000000000000000000000120000003A00420052004100
      4E004300480049004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000070000001200000044004C0041004D004D004F0055004E0054000100
      0000000010000000440041004D004D004F0055004E0054000100000000000C00
      0000440043004F0055004E0054000100000000001200000043004C0041004D00
      4D004F0055004E00540001000000000010000000430041004D004D004F005500
      4E0054000100000000000C000000430043004F0055004E005400010000000000
      1A0000004300410053004800520045004D00410049004E004400450052000100
      00000000}
    Session = sboapiDataModule.SBSession
    OnCalcFields = TotalResultCalcFields
    Left = 232
    Top = 296
    object TotalResultDLAMMOUNT: TFloatField
      FieldName = 'DLAMMOUNT'
    end
    object TotalResultDAMMOUNT: TFloatField
      FieldName = 'DAMMOUNT'
    end
    object TotalResultDCOUNT: TFloatField
      FieldName = 'DCOUNT'
    end
    object TotalResultCLAMMOUNT: TFloatField
      FieldName = 'CLAMMOUNT'
    end
    object TotalResultCAMMOUNT: TFloatField
      FieldName = 'CAMMOUNT'
    end
    object TotalResultCCOUNT: TFloatField
      FieldName = 'CCOUNT'
    end
    object TotalResultOperationDate: TDateField
      FieldKind = fkCalculated
      FieldName = 'OperationDate'
      Calculated = True
    end
    object TotalResultCASHREMAINDER: TFloatField
      FieldName = 'CASHREMAINDER'
    end
  end
  object Settings: TOracleDataSet
    SQL.Strings = (
      'SELECT a.*,rowid'
      ''
      'FROM'
      '    cash_settings a'
      ' ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000014000000260000004300410053004800420041004C0041004E004300
      45004E004100540049004F004E0041004C000100000000002400000043004100
      53004800420041004C0041004E004300450045004E0047004C00490053004800
      0100000000001C0000004400450053004300520049005000540049004F004E00
      5F0041005A000100000000001E00000044004500530043005200490050005400
      49004F004E005F0045004E004700010000000000120000005300490047004E00
      410054005900520045000100000000002400000052004500530050004F004E00
      5300490042004C0045005F0050004500520053004F004E000100000000000A00
      0000500048004F0054004F0000000000000010000000480041004E0044004F00
      5600450052000100000000000A00000043004800490045004600010000000000
      100000004F00500045005200410054004F0052000100000000000E0000004300
      4100530048004900450052000100000000000C00000041004D004F0055004E00
      540001000000000012000000430048004900450046005F004F00550054000100
      00000000180000004F00500045005200410054004F0052005F004F0055005400
      0100000000001600000043004100530048004900450052005F004F0055005400
      010000000000140000004100430043004F0055004E00540041004E0054000100
      000000001400000043004F004E00540052004F004C004C004500520001000000
      00001C00000043004F004E00540052004F004C004C00450052005F004F005500
      54000100000000001A0000004F00500045005200410054004F00520054004900
      54004C0045000100000000001E0000004100430043004F0055004E0054004100
      4E0054005400490054004C004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 477
    Top = 185
    object SettingsCASHBALANCENATIONAL: TFloatField
      FieldName = 'CASHBALANCENATIONAL'
    end
    object SettingsCASHBALANCEENGLISH: TFloatField
      FieldName = 'CASHBALANCEENGLISH'
    end
    object SettingsDESCRIPTION_AZ: TWideStringField
      FieldName = 'DESCRIPTION_AZ'
      Size = 150
    end
    object SettingsDESCRIPTION_ENG: TWideStringField
      FieldName = 'DESCRIPTION_ENG'
      Size = 150
    end
    object SettingsSIGNATYRE: TWideStringField
      FieldName = 'SIGNATYRE'
      Size = 150
    end
    object SettingsRESPONSIBLE_PERSON: TWideStringField
      FieldName = 'RESPONSIBLE_PERSON'
      Size = 150
    end
    object SettingsHANDOVER: TWideStringField
      FieldName = 'HANDOVER'
      Size = 10
    end
    object SettingsCHIEF: TWideStringField
      FieldName = 'CHIEF'
      Size = 10
    end
    object SettingsOPERATOR: TWideStringField
      FieldName = 'OPERATOR'
      Size = 10
    end
    object SettingsCASHIER: TWideStringField
      FieldName = 'CASHIER'
      Size = 10
    end
    object SettingsAMOUNT: TWideStringField
      FieldName = 'AMOUNT'
      Size = 10
    end
    object SettingsCHIEF_OUT: TWideStringField
      FieldName = 'CHIEF_OUT'
      Size = 10
    end
    object SettingsOPERATOR_OUT: TWideStringField
      FieldName = 'OPERATOR_OUT'
      Size = 10
    end
    object SettingsCASHIER_OUT: TWideStringField
      FieldName = 'CASHIER_OUT'
      Size = 10
    end
    object SettingsACCOUNTANT: TWideStringField
      FieldName = 'ACCOUNTANT'
      Size = 10
    end
    object SettingsCONTROLLER: TWideStringField
      FieldName = 'CONTROLLER'
      Size = 10
    end
    object SettingsCONTROLLER_OUT: TWideStringField
      FieldName = 'CONTROLLER_OUT'
      Size = 10
    end
    object SettingsPHOTO: TBlobField
      FieldName = 'PHOTO'
      BlobType = ftOraBlob
    end
    object SettingsOPERATORTITLE: TWideStringField
      FieldName = 'OPERATORTITLE'
      Size = 30
    end
    object SettingsACCOUNTANTTITLE: TWideStringField
      FieldName = 'ACCOUNTANTTITLE'
      Size = 50
    end
  end
  object SettingsData: TDataSource
    DataSet = Settings
    Left = 560
    Top = 281
  end
  object BrowseCashInfo: TOracleDataSet
    SQL.Strings = (
      '/*SELECT '
      '       issuedby,'
      '       max(id) as id, '
      '       max(person_doc) as person_doc, '
      '       max(seria) as seria, '
      '       max(docnumber) as docnumber, '
      '       max(fromwhen) as fromwhen'
      'FROM cashinfo '
      'group by issuedby'
      'order by issuedby'
      '*/'
      'begin'
      ' pkg_report.get_cashinfo('
      '   p_result=>:p_result);'
      'end;')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A0050005F0052004500530055004C0054007400
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000006000000100000004900530053005500450044004200590001000000
      000004000000490044000100000000001400000050004500520053004F004E00
      5F0044004F0043000100000000000A0000005300450052004900410001000000
      00001200000044004F0043004E0055004D004200450052000100000000001000
      0000460052004F004D005700480045004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 400
    Top = 208
  end
  object DataBrowseCashInfo: TDataSource
    DataSet = BrowseCashInfo
    Left = 312
    Top = 232
  end
  object ODSOperator: TOracleDataSet
    SQL.Strings = (
      ' select -1 as ID, '#39'Butun operatorlar'#39' as Name from Dual'
      'Union all'
      'select id,name from ('
      ' select ID, Name from User$'
      'Order by name) '
      ' ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 304
    Top = 12
    object ODSOperatorID: TFloatField
      FieldName = 'ID'
    end
    object ODSOperatorNAME: TWideStringField
      FieldName = 'NAME'
      Size = 33
    end
  end
  object DataOperator: TDataSource
    DataSet = ODSOperator
    Left = 379
    Top = 11
  end
  object OrDS_CashBook: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT'
      '  SUM(PR.LAMMOUNT)  /*/1000 */ AS LAMMOUNTS'
      ' ,PR.KASSA_B     AS BSYMBOL'
      ' ,MAX(CASH.NAME) AS NAME'
      ' ,MIN(CASH.MEDIOCRITY) AS MEDIOCRITY'
      ' FROM PROVARCH PR,KASSA_B CASH'
      ' WHERE'
      '     DAT>=:FIRSTDATE'
      ' AND DAT<=:LASTDATE'
      ' AND CASH.SYMBOL=PR.KASSA_B'
      ''
      
        '  AND((debt in (Select ac.Id from account ac,Bal_spr1 b where b.' +
        'cashincoming=1 and b.Bal_cn=ac.Bal_cn1))'
      ' OR'
      
        ' (Kredit in (Select ac.Id from account ac,Bal_spr1 b where b.cas' +
        'hincoming=1 and b.Bal_cn=ac.Bal_cn1)))'
      ''
      '  GROUP BY PR.KASSA_B'
      ''
      'UNION'
      ''
      'Select '
      '  ABS(Sum(Ar.pok_ostat))  /*/1000*/ as LAMMOUNTS'
      ' ,35 as BSYMBOL'
      ' ,'#39'Hesabat tarixinin '#601'vv'#601'lin'#601' kassan'#305'n qal'#305#287#305#39' as NAME'
      ' ,0 as MEDIOCRITY'
      'from '
      '  ACCOUNT AC'
      ' ,ARCHOST AR'
      ''
      'where'
      '  AC.ID = AR.ACC_ID '
      
        '   and AC.BAL_CN1 in (Select bal_cn from Bal_spr1 where cashinco' +
        'ming=1)'
      
        '   and AR.datdate = (Select max(dat) from operkurs where dat<:Fi' +
        'rstDate)'
      '   and ac.val_acc=0'
      ''
      'UNION'
      ''
      'Select '
      '  ABS(Sum(Ar.pok_ostat)) /*/1000 */ as LAMMOUNTS'
      ' ,70 as BSYMBOL'
      ' ,'#39'Hesabat tarixinin sonuna kassan'#305'n qal'#305#287#305#39' as NAME'
      ' ,1 as MEDIOCRITY'
      'from '
      '  ACCOUNT AC'
      ' ,ARCHOST AR'
      ''
      'where'
      '  AC.ID = AR.ACC_ID '
      
        '   and AC.BAL_CN1 in (Select bal_cn from Bal_spr1 where cashinco' +
        'ming=1)'
      
        '   and AR.datdate = (Select max(dat) from operkurs where dat<=:L' +
        'astDate)'
      '   and ac.val_acc=0'
      ''
      ''
      'ORDER BY'
      ' MEDIOCRITY'
      ',BSYMBOL')
    Optimize = False
    Variables.Data = {
      0400000002000000140000003A00460049005200530054004400410054004500
      0C0000000000000000000000120000003A004C00410053005400440041005400
      45000C0000000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 312
    Top = 280
    object FloatField1: TFloatField
      FieldName = 'LAMMOUNTS'
    end
    object StringField1: TWideStringField
      FieldName = 'NAME'
      Size = 556
    end
    object FloatField2: TFloatField
      FieldName = 'MEDIOCRITY'
    end
    object FloatField3: TFloatField
      FieldName = 'BSYMBOL'
    end
  end
  object ODS_L_CHIN: TOracleDataSet
    SQL.Strings = (
      'select rownum, s.* from (SELECT DISTINCT'
      '  PR.ID as ID'
      
        ' ,case when AC1.BAL_CN1=:cn then decode(AC1.BAL_CN1,:cn,AC2.ACC_' +
        'NO,:cn2,AC2.ACC_NO,AC1.ACC_NO) else decode(AC1.BAL_CN1,:cn,AC2.A' +
        'CC_NO,:cn2,AC2.ACC_NO,AC1.ACC_NO)end as hesab'
      
        ' ,AC1.ACC_NO AS DEBIT,AC1.KLI_ID AS DEBTID,AC1.FILIAL as DebetFi' +
        'lial,AC1.NAME AS DNAME,AC2.KLI_ID AS KREDITID'
      
        ' ,case when AC1.BAL_CN1=:cn then decode(AC1.BAL_CN1,:cn,AC2.NAME' +
        ',:cn2,AC2.NAME,AC1.NAME) else decode(AC1.BAL_CN1,:cn,AC2.NAME,:c' +
        'n2,AC2.NAME,AC1.NAME)end as hesab_adi'
      
        ' ,PR.VAL_ACC AS DCURRENCY, sb_complex_transactions.GetCurrencyNa' +
        'me(PR.VAL_ACC) as DebtCurName,AC2.ACC_NO AS KREDIT,AC1.KLI_ID,AC' +
        '2.FILIAL as CreditFilial'
      
        ' ,AC2.NAME  AS  KNAME ,AC1.BAL_CN1 AS DEBTCOME ,AC2.BAL_CN1 AS C' +
        'REDITCOME'
      
        ' ,case when AC1.BAL_CN1=:cn then decode(AC1.BAL_CN1,:cn,0,:cn2,0' +
        ',:amount) else decode(AC1.BAL_CN1,:cn,0,:cn2,0,:amount) end as m' +
        'exaric'
      
        ' ,case when AC2.BAL_CN1=:cn then decode(AC2.BAL_CN1,:cn,0,:cn2,0' +
        ',:amount) else decode(AC2.BAL_CN1,:cn,0,:cn2,0,:amount) end as m' +
        'edaxil'
      
        '  ,PR.CURRENCYID_C AS KCURRENCY, sb_complex_transactions.GetCurr' +
        'encyName(PR.CURRENCYID_C) as CreditCurName'
      
        '  ,PR.AMMOUNT  AS DAMMOUNT ,PR.AMMOUNT_C AS KAMMOUNT ,PR.LAMMOUN' +
        'T AS LAMMOUNT'
      
        '  ,PR.KASSA_B AS BSYMBOL, PR.NO_PROV ,PR.OP_ID AS OperatorID, PR' +
        '.Commit_OpID as CommitterID'
      ''
      ''
      ''
      ' ,PR.NAME AS ASSIGNMENT'
      ' FROM  PROVARCH PR,ACCOUNT AC1,ACCOUNT AC2'
      '      ,BAL_SPR1 REFERENCE'
      ' WHERE'
      '        AC2.ID=PR.KREDIT'
      '    AND AC1.ID=PR.DEBT'
      
        '    AND PR.DAT>=:FIRSTDATE and ((decode(AC2.BAL_CN1,:cn,null,:cn' +
        '2,null,:amount) is not null) or (decode(AC1.BAL_CN1,:cn,null,:cn' +
        '2,null,:amount) is not null))'
      '    AND PR.DAT<=:LASTDATE'
      ''
      '    AND REFERENCE.CASHINCOMING=1'
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
      ''
      ''
      ''
      ''
      ''
      ''
      '    ORDER BY mexaric,medaxil) s'
      ''
      ''
      '')
    Optimize = False
    Variables.Data = {
      0400000005000000140000003A00460049005200530054004400410054004500
      0C0000000000000000000000120000003A004C00410053005400440041005400
      45000C0000000000000000000000060000003A0043004E000500000000000000
      00000000080000003A0043004E0032000500000000000000000000000E000000
      3A0041004D004F0055004E005400010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001D0000000C00000052004F0057004E0055004D000100000000000400
      0000490044000100000000000A00000048004500530041004200010000000000
      0A000000440045004200490054000100000000000C0000004400450042005400
      490044000100000000001600000044004500420045005400460049004C004900
      41004C000100000000000A00000044004E0041004D0045000100000000001000
      00004B0052004500440049005400490044000100000000001200000048004500
      5300410042005F00410044004900010000000000120000004400430055005200
      520045004E004300590001000000000016000000440045004200540043005500
      52004E0041004D0045000100000000000C0000004B0052004500440049005400
      0100000000000C0000004B004C0049005F004900440001000000000018000000
      430052004500440049005400460049004C00490041004C000100000000000A00
      00004B004E0041004D0045000100000000001000000044004500420054004300
      4F004D0045000100000000001400000043005200450044004900540043004F00
      4D0045000100000000000E0000004D00450044004100580049004C0001000000
      00000E0000004D00450058004100520049004300010000000000120000004B00
      430055005200520045004E00430059000100000000001A000000430052004500
      4400490054004300550052004E0041004D004500010000000000100000004400
      41004D004D004F0055004E005400010000000000100000004B0041004D004D00
      4F0055004E005400010000000000100000004C0041004D004D004F0055004E00
      54000100000000000E0000004200530059004D0042004F004C00010000000000
      0E0000004E004F005F00500052004F005600010000000000140000004F005000
      45005200410054004F005200490044000100000000001600000043004F004D00
      4D00490054005400450052004900440001000000000014000000410053005300
      490047004E004D0045004E005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 304
    Top = 128
    object ODS_L_CHINsayi: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'sayi'
      OnGetText = ODS_L_CHINsayiGetText
      Calculated = True
    end
    object ODS_L_CHINROWNUM: TFloatField
      FieldName = 'ROWNUM'
    end
    object ODS_L_CHINID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODS_L_CHINHESAB: TWideStringField
      FieldName = 'HESAB'
      Size = 28
    end
    object ODS_L_CHINDEBIT: TWideStringField
      FieldName = 'DEBIT'
    end
    object ODS_L_CHINDEBTID: TFloatField
      FieldName = 'DEBTID'
    end
    object ODS_L_CHINDEBETFILIAL: TIntegerField
      FieldName = 'DEBETFILIAL'
    end
    object ODS_L_CHINDNAME: TWideStringField
      FieldName = 'DNAME'
      Size = 90
    end
    object ODS_L_CHINKREDITID: TFloatField
      FieldName = 'KREDITID'
    end
    object ODS_L_CHINHESAB_ADI: TWideStringField
      FieldName = 'HESAB_ADI'
      Size = 90
    end
    object ODS_L_CHINDCURRENCY: TFloatField
      FieldName = 'DCURRENCY'
      Required = True
    end
    object ODS_L_CHINDEBTCURNAME: TWideStringField
      FieldName = 'DEBTCURNAME'
      Size = 4000
    end
    object ODS_L_CHINKREDIT: TWideStringField
      FieldName = 'KREDIT'
    end
    object ODS_L_CHINKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object ODS_L_CHINCREDITFILIAL: TIntegerField
      FieldName = 'CREDITFILIAL'
    end
    object ODS_L_CHINKNAME: TWideStringField
      FieldName = 'KNAME'
      Size = 90
    end
    object ODS_L_CHINDEBTCOME: TFloatField
      FieldName = 'DEBTCOME'
    end
    object ODS_L_CHINCREDITCOME: TFloatField
      FieldName = 'CREDITCOME'
    end
    object ODS_L_CHINMEDAXIL: TFloatField
      FieldName = 'MEDAXIL'
    end
    object ODS_L_CHINMEXARIC: TFloatField
      FieldName = 'MEXARIC'
    end
    object ODS_L_CHINKCURRENCY: TIntegerField
      FieldName = 'KCURRENCY'
      Required = True
    end
    object ODS_L_CHINCREDITCURNAME: TWideStringField
      FieldName = 'CREDITCURNAME'
      Size = 4000
    end
    object ODS_L_CHINDAMMOUNT: TFloatField
      FieldName = 'DAMMOUNT'
      Required = True
    end
    object ODS_L_CHINKAMMOUNT: TFloatField
      FieldName = 'KAMMOUNT'
      Required = True
    end
    object ODS_L_CHINLAMMOUNT: TFloatField
      FieldName = 'LAMMOUNT'
      Required = True
    end
    object ODS_L_CHINBSYMBOL: TWideStringField
      FieldName = 'BSYMBOL'
      Size = 5
    end
    object ODS_L_CHINNO_PROV: TWideStringField
      FieldName = 'NO_PROV'
      Size = 8
    end
    object ODS_L_CHINOPERATORID: TFloatField
      FieldName = 'OPERATORID'
    end
    object ODS_L_CHINASSIGNMENT: TWideStringField
      FieldName = 'ASSIGNMENT'
      Size = 255
    end
    object ODS_L_CHINCOMMITTERID: TFloatField
      FieldName = 'COMMITTERID'
    end
  end
  object ODS_EVV_SON_QALIQ: TOracleDataSet
    SQL.Strings = (
      'select sel1.Evvele_qaliq,Sel2.Sona_qaliq From'
      '(select sum(-AR.OSTAT) Evvele_qaliq'
      'from archost AR, Account AC'
      'where AC.id=AR.acc_id'
      '  and AC.BAL_CN1 in (:c,:c2)'
      ''
      ''
      '  and datdate='
      
        '              :FIRSTDATE-1)/*(select max(AR_S.datdate) from arch' +
        'ost AR_S where AR_S.datdate<:FIRSTDATE))*/ sel1,'
      ''
      '(select sum(-AR.OSTAT) Sona_qaliq'
      'from archost AR, Account AC'
      'where AC.id=AR.acc_id'
      '  and AC.BAL_CN1 in (:c,:c2)'
      ''
      ''
      '  and datdate='
      
        '              :LASTDATE/*(select max(AR_S.datdate) from archost ' +
        'AR_S where AR_S.datdate<=:LASTDATE)*/) sel2'
      '')
    Optimize = False
    Variables.Data = {
      0400000004000000140000003A00460049005200530054004400410054004500
      0C0000000000000000000000120000003A004C00410053005400440041005400
      45000C0000000000000000000000040000003A00430003000000000000000000
      0000060000003A0043003200030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000020000001800000045005600560045004C0045005F00510041004C00
      490051000100000000001400000053004F004E0041005F00510041004C004900
      5100010000000000}
    Session = sboapiDataModule.SBSession
    Left = 432
    Top = 280
  end
  object OrDS_Comitters: TOracleDataSet
    SQL.Strings = (
      ' select -1 as ID, '#39'Butun operatorlar'#39' as Name from Dual'
      'Union all'
      'select id,name from ('
      ' select ID, Name from User$'
      'Order by name) ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 304
    Top = 72
    object FloatField4: TFloatField
      FieldName = 'ID'
    end
    object OrDS_ComittersNAME: TWideStringField
      FieldName = 'NAME'
      Size = 33
    end
  end
  object DS_Committers: TDataSource
    DataSet = OrDS_Comitters
    Left = 392
    Top = 73
  end
  object ODSBank: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  Bank,Inn,KOD_B From BankInfo')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000008000000420041004E004B00010000000000060000004900
      4E004E000100000000000A0000004B004F0044005F004200010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 304
    Top = 176
    object ODSBankBANK: TWideStringField
      FieldName = 'BANK'
      Size = 80
    end
    object ODSBankINN: TWideStringField
      FieldName = 'INN'
      Size = 15
    end
    object ODSBankKOD_B: TFloatField
      FieldName = 'KOD_B'
    end
  end
  object ForFizFsVoen: TOracleDataSet
    SQL.Strings = (
      'select decode(bl.cust_type,null,0,bl.cust_type) as cust_type'
      ' from  bal_spr1 bl, account a'
      'where '
      #9'a.bal_cn1=bl.bal_cn '
      'and '#9'a.acc_no=:v_acc_no')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A0056005F004100430043005F004E004F000500
      00000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 408
    Top = 144
  end
  object OrPackTransaction: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SB_Transaction'
    Left = 96
    Top = 376
  end
  object newods_lchin: TOracleDataSet
    SQL.Strings = (
      'select rownum, s.* from (SELECT DISTINCT'
      '  PR.ID as ID'
      
        ' ,case when AC1.BAL_CN1='#39'10010'#39' then decode(AC1.BAL_CN1,'#39'10010'#39',' +
        'AC2.ACC_NO,'#39'10020'#39',AC2.ACC_NO,AC1.ACC_NO) else decode(AC1.BAL_CN' +
        '1,'#39'1001'#39',AC2.ACC_NO,'#39'1011'#39',AC2.ACC_NO,AC1.ACC_NO)end as hesab'
      
        ' ,AC1.ACC_NO AS DEBIT,AC1.KLI_ID AS DEBTID,AC1.FILIAL as DebetFi' +
        'lial,AC1.NAME AS DNAME,AC2.KLI_ID AS KREDITID'
      
        ' ,case when AC1.BAL_CN1='#39'10010'#39' then decode(AC1.BAL_CN1,'#39'10010'#39',' +
        'AC2.NAME,'#39'10020'#39',AC2.NAME,AC1.NAME) else decode(AC1.BAL_CN1,'#39'100' +
        '1'#39',AC2.NAME,'#39'1011'#39',AC2.NAME,AC1.NAME)end as hesab_adi'
      
        ' ,PR.VAL_ACC AS DCURRENCY, sb_complex_transactions.GetCurrencyNa' +
        'me(PR.VAL_ACC) as DebtCurName,AC2.ACC_NO AS KREDIT,AC1.KLI_ID,AC' +
        '2.FILIAL as CreditFilial'
      
        ' ,AC2.NAME  AS  KNAME ,AC1.BAL_CN1 AS DEBTCOME ,AC2.BAL_CN1 AS C' +
        'REDITCOME'
      
        ' ,case when AC1.BAL_CN1='#39'10010'#39' then decode(AC1.BAL_CN1,'#39'10010'#39',' +
        '0,'#39'10020'#39',0,PR.AMMOUNT) else decode(AC1.BAL_CN1,'#39'1001'#39',0,'#39'1011'#39',' +
        '0,PR.AMMOUNT) end as mexaric'
      
        ' ,case when AC2.BAL_CN1='#39'10010'#39' then decode(AC2.BAL_CN1,'#39'10010'#39',' +
        '0,'#39'10020'#39',0,PR.AMMOUNT_C) else decode(AC2.BAL_CN1,'#39'1001'#39',0,'#39'1011' +
        #39',0,PR.AMMOUNT_C) end as medaxil'
      
        '  ,PR.CURRENCYID_C AS KCURRENCY, sb_complex_transactions.GetCurr' +
        'encyName(PR.CURRENCYID_C) as CreditCurName'
      
        '  ,PR.AMMOUNT  AS DAMMOUNT ,PR.AMMOUNT_C AS KAMMOUNT ,PR.LAMMOUN' +
        'T AS LAMMOUNT'
      
        '  ,PR.KASSA_B AS BSYMBOL, PR.NO_PROV ,PR.OP_ID AS OperatorID, PR' +
        '.Commit_OpID as CommitterID'
      ''
      ''
      ''
      ' ,PR.NAME AS ASSIGNMENT'
      ' FROM  PROVARCH PR,ACCOUNT AC1,ACCOUNT AC2'
      '      ,BAL_SPR1 REFERENCE'
      ' WHERE'
      '        AC2.ID=PR.KREDIT'
      '    AND AC1.ID=PR.DEBT'
      
        '    AND PR.DAT>=:FIRSTDATE and ((decode(AC2.BAL_CN1,'#39'10010'#39',null' +
        ','#39'10020'#39',null,PR.AMMOUNT_C) is not null) or (decode(AC1.BAL_CN1,' +
        #39'1001'#39',null,'#39'1011'#39',null,PR.AMMOUNT) is not null))'
      '    AND PR.DAT<=:LASTDATE'
      ''
      '    AND REFERENCE.CASHINCOMING=1'
      ''
      '    ORDER BY mexaric,medaxil) s'
      ''
      'select rownum, s.* from (SELECT DISTINCT'
      '  PR.ID as ID'
      
        ' ,case when AC1.BAL_CN1=cn then decode(AC1.BAL_CN1,cn,AC2.ACC_NO' +
        ',cn2,AC2.ACC_NO,AC1.ACC_NO) else decode(AC1.BAL_CN1,cn,AC2.ACC_N' +
        'O,cn2,AC2.ACC_NO,AC1.ACC_NO)end as hesab'
      
        ' ,AC1.ACC_NO AS DEBIT,AC1.KLI_ID AS DEBTID,AC1.FILIAL as DebetFi' +
        'lial,AC1.NAME AS DNAME,AC2.KLI_ID AS KREDITID'
      
        ' ,case when AC1.BAL_CN1=cn then decode(AC1.BAL_CN1,cn,AC2.NAME,c' +
        'n2,AC2.NAME,AC1.NAME) else decode(AC1.BAL_CN1,cn,AC2.NAME,cn2,AC' +
        '2.NAME,AC1.NAME)end as hesab_adi'
      
        ' ,PR.VAL_ACC AS DCURRENCY, sb_complex_transactions.GetCurrencyNa' +
        'me(PR.VAL_ACC) as DebtCurName,AC2.ACC_NO AS KREDIT,AC1.KLI_ID,AC' +
        '2.FILIAL as CreditFilial'
      
        ' ,AC2.NAME  AS  KNAME ,AC1.BAL_CN1 AS DEBTCOME ,AC2.BAL_CN1 AS C' +
        'REDITCOME'
      
        ' ,case when AC1.BAL_CN1=cn then decode(AC1.BAL_CN1,cn,0,cn2,0,PR' +
        '.AMMOUNT) else decode(AC1.BAL_CN1,cn,0,cn2,0,PR.AMMOUNT) end as ' +
        'mexaric'
      
        ' ,case when AC2.BAL_CN1=cn then decode(AC2.BAL_CN1,cn,0,cn2,0,PR' +
        '.AMMOUNT_C) else decode(AC2.BAL_CN1,cn,0,cn2,0,PR.AMMOUNT_C) end' +
        ' as medaxil'
      
        '  ,PR.CURRENCYID_C AS KCURRENCY, sb_complex_transactions.GetCurr' +
        'encyName(PR.CURRENCYID_C) as CreditCurName'
      
        '  ,PR.AMMOUNT  AS DAMMOUNT ,PR.AMMOUNT_C AS KAMMOUNT ,PR.LAMMOUN' +
        'T AS LAMMOUNT'
      
        '  ,PR.KASSA_B AS BSYMBOL, PR.NO_PROV ,PR.OP_ID AS OperatorID, PR' +
        '.Commit_OpID as CommitterID'
      ''
      ''
      ''
      ' ,PR.NAME AS ASSIGNMENT'
      ' FROM  PROVARCH PR,ACCOUNT AC1,ACCOUNT AC2'
      '      ,BAL_SPR1 REFERENCE'
      ' WHERE'
      '        AC2.ID=PR.KREDIT'
      '    AND AC1.ID=PR.DEBT'
      
        '    AND PR.DAT>=:FIRSTDATE and ((decode(AC2.BAL_CN1,'#39'10010'#39',null' +
        ','#39'10020'#39',null,PR.AMMOUNT_C) is not null) or (decode(AC1.BAL_CN1,' +
        #39'1001'#39',null,'#39'1011'#39',null,PR.AMMOUNT) is not null))'
      '    AND PR.DAT<=:LASTDATE'
      ''
      '    AND REFERENCE.CASHINCOMING=1'
      ''
      '    ORDER BY mexaric,medaxil) s')
    Optimize = False
    Variables.Data = {
      0400000002000000140000003A00460049005200530054004400410054004500
      050000000000000000000000120000003A004C00410053005400440041005400
      4500050000000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 472
    Top = 64
  end
  object ODSTransactionsViewer2: TOracleDataSet
    SQL.Strings = (
      'begin'
      ' get_cash_transactions('
      '   p_begindate=>:p_begindate,'
      'p_enddate=>:p_enddate,'
      ' p_currencyid=>:p_currencyid,'
      ''
      'p_userinsert=>:p_userinsert ,'
      'p_cashsymbol=>:p_cashsymbol,'
      'p_creditbranch=>:p_creditbranch,'
      'p_usercommit=>:p_usercommit,'
      'p_debitbranch=>:p_debitbranch,'
      'p_transtype=>:p_transtype,'
      'p_balance=>:p_balance,'
      'p_orderby=>:p_orderby,'
      ''
      ' p_result=>:p_result);'
      'end;')
    Optimize = False
    Variables.Data = {
      040000000C000000180000003A0050005F0042004500470049004E0044004100
      540045000C0000000000000000000000140000003A0050005F0045004E004400
      44004100540045000C00000000000000000000001A0000003A0050005F004300
      55005200520045004E0043005900490044000300000000000000000000001200
      00003A0050005F0052004500530055004C005400740000000000000000000000
      1A0000003A0050005F00550053004500520049004E0053004500520054000500
      000000000000000000001A0000003A0050005F00430041005300480053005900
      4D0042004F004C000500000000000000000000001A0000003A0050005F005500
      53004500520043004F004D004D00490054000500000000000000000000001E00
      00003A0050005F004300520045004400490054004200520041004E0043004800
      0500000000000000000000001C0000003A0050005F0044004500420049005400
      4200520041004E0043004800050000000000000000000000180000003A005000
      5F005400520041004E0053005400590050004500030000000000000000000000
      140000003A0050005F00420041004C0041004E00430045000300000000000000
      00000000140000003A0050005F004F0052004400450052004200590005000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001A000000060000004400410054000100000000000400000049004400
      010000000000120000004400430055005200520045004E004300590001000000
      00001A0000004300520045004400490054004300550052004E0041004D004500
      010000000000100000004C0041004D004D004F0055004E005400010000000000
      0E0000004E004F005F00500052004F0056000100000000001000000044004500
      4200490054004100430043000100000000001000000044004500420049005400
      4300550053000100000000001600000044004500420049005400420052004100
      4E004300480001000000000012000000440045004200490054004E0041004D00
      450001000000000018000000440045004200490054004300550052004E004100
      4D0045000100000000001800000044004500420049005400420041004C004100
      4E00430045000100000000001200000043005200450044004900540041004300
      4300010000000000120000004300520045004400490054004300550053000100
      00000000180000004300520045004400490054004200520041004E0043004800
      010000000000140000004300520045004400490054004E0041004D0045000100
      00000000120000004300430055005200520045004E0043005900010000000000
      1A000000430052004500440049005400420041004C0041004E00430045000100
      000000000E00000041004D004D004F0055004E00540001000000000012000000
      41004D004D004F0055004E0054005F0043000100000000000E0000004B004100
      5300530041005F0042000100000000000A0000004F0050005F00490044000100
      000000001600000043004F004D004D00490054005F004F005000490044000100
      0000000014000000550053004500520049004E00530045005200540001000000
      000014000000550053004500520043004F004D004D0049005400010000000000
      080000004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    AfterScroll = ODSTransactionsViewerAfterScroll
    Left = 679
    Top = 117
    object ODSTransactionsViewer2rown: TFloatField
      DisplayLabel = #8470
      FieldName = 'rown'
    end
    object ODSTransactionsViewer2DAT: TDateTimeField
      FieldName = 'DAT'
    end
    object ODSTransactionsViewer2ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSTransactionsViewer2DEBITACC: TWideStringField
      FieldName = 'DEBITACC'
      Size = 448
    end
    object ODSTransactionsViewer2DEBITCUS: TFloatField
      FieldName = 'DEBITCUS'
    end
    object ODSTransactionsViewer2DEBITBRANCH: TIntegerField
      FieldName = 'DEBITBRANCH'
    end
    object ODSTransactionsViewer2DEBITNAME: TWideStringField
      FieldName = 'DEBITNAME'
      Size = 1440
    end
    object ODSTransactionsViewer2DCURRENCY: TFloatField
      FieldName = 'DCURRENCY'
    end
    object ODSTransactionsViewer2DEBITCURNAME: TWideStringField
      FieldName = 'DEBITCURNAME'
      Size = 10
    end
    object ODSTransactionsViewer2DEBITBALANCE: TFloatField
      FieldName = 'DEBITBALANCE'
    end
    object ODSTransactionsViewer2CREDITACC: TWideStringField
      FieldName = 'CREDITACC'
      Size = 448
    end
    object ODSTransactionsViewer2CREDITCUS: TFloatField
      FieldName = 'CREDITCUS'
    end
    object ODSTransactionsViewer2CREDITNAME: TWideStringField
      FieldName = 'CREDITNAME'
      Size = 1440
    end
    object ODSTransactionsViewer2CREDITBRANCH: TIntegerField
      FieldName = 'CREDITBRANCH'
    end
    object ODSTransactionsViewer2CCURRENCY: TIntegerField
      FieldName = 'CCURRENCY'
    end
    object ODSTransactionsViewer2CREDITCURNAME: TWideStringField
      FieldName = 'CREDITCURNAME'
      Size = 10
    end
    object ODSTransactionsViewer2CREDITBALANCE: TFloatField
      FieldName = 'CREDITBALANCE'
    end
    object ODSTransactionsViewer2AMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSTransactionsViewer2AMMOUNT_C: TFloatField
      FieldName = 'AMMOUNT_C'
    end
    object ODSTransactionsViewer2LAMMOUNT: TFloatField
      FieldName = 'LAMMOUNT'
    end
    object ODSTransactionsViewer2KASSA_B: TWideStringField
      FieldName = 'KASSA_B'
    end
    object ODSTransactionsViewer2NO_PROV: TWideStringField
      FieldName = 'NO_PROV'
      Size = 32
    end
    object ODSTransactionsViewer2OP_ID: TFloatField
      FieldName = 'OP_ID'
    end
    object ODSTransactionsViewer2COMMIT_OPID: TFloatField
      FieldName = 'COMMIT_OPID'
    end
    object ODSTransactionsViewer2USERINSERT: TWideStringField
      FieldName = 'USERINSERT'
      Size = 30
    end
    object ODSTransactionsViewer2USERCOMMIT: TWideStringField
      FieldName = 'USERCOMMIT'
      Size = 30
    end
    object ODSTransactionsViewer2NAME: TWideStringField
      FieldName = 'NAME'
      Size = 1020
    end
    object ODSTransactionsViewer2SERIA: TStringField
      FieldKind = fkLookup
      FieldName = 'SERIA'
      LookupDataSet = ODSCashInfo
      LookupKeyFields = 'ID'
      LookupResultField = 'SERIA'
      KeyFields = 'ID'
      Lookup = True
    end
    object ODSTransactionsViewer2debtostat: TFloatField
      FieldName = 'debtostat'
    end
    object ODSTransactionsViewer2kredostat: TFloatField
      FieldName = 'kredostat'
    end
    object ODSTransactionsViewer2d1: TWideStringField
      FieldName = 'd1'
      Size = 0
    end
  end
  object DataSrcViewer2: TDataSource
    DataSet = ODSTransactionsViewer2
    Left = 615
    Top = 69
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'begin'
      'get_cash_transactions_excel('
      '   p_begindate=>:p_begindate,'
      'p_enddate=>:p_enddate,'
      ' p_currencyid=>:p_currencyid,'
      ''
      'p_userinsert=>:p_userinsert ,'
      'p_cashsymbol=>:p_cashsymbol,'
      'p_creditbranch=>:p_creditbranch,'
      'p_usercommit=>:p_usercommit,'
      'p_debitbranch=>:p_debitbranch,'
      'p_transtype=>:p_transtype,'
      'p_balance=>:p_balance,'
      'p_orderby=>:p_orderby,'
      ''
      ' p_result=>:p_result);'
      'end;')
    Optimize = False
    Variables.Data = {
      040000000C000000180000003A0050005F0042004500470049004E0044004100
      540045000C0000000000000000000000140000003A0050005F0045004E004400
      44004100540045000C00000000000000000000001A0000003A0050005F004300
      55005200520045004E0043005900490044000300000000000000000000001A00
      00003A0050005F00550053004500520049004E00530045005200540005000000
      00000000000000001A0000003A0050005F004300410053004800530059004D00
      42004F004C000500000000000000000000001E0000003A0050005F0043005200
      45004400490054004200520041004E0043004800050000000000000000000000
      1A0000003A0050005F00550053004500520043004F004D004D00490054000500
      000000000000000000001C0000003A0050005F00440045004200490054004200
      520041004E0043004800050000000000000000000000180000003A0050005F00
      5400520041004E00530054005900500045000300000000000000000000001400
      00003A0050005F00420041004C0041004E004300450003000000000000000000
      0000140000003A0050005F004F00520044004500520042005900050000000000
      000000000000120000003A0050005F0052004500530055004C00540074000000
      0000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 632
    Top = 200
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 664
    Top = 272
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      'select sb_aca.getuserfilialid(:usr) as id from dual')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A00550053005200050000000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 552
    Top = 208
  end
  object OracleDataSet3: TOracleDataSet
    SQL.Strings = (
      'select sblogin.username from dual')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000010000001000000055005300450052004E0041004D00450001000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 712
    Top = 208
    object OracleDataSet3USERNAME: TWideStringField
      FieldName = 'USERNAME'
      Size = 4000
    end
  end
end
