object DMPayment: TDMPayment
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 406
  Width = 736
  object ODSPayments: TOracleDataSet
    SQL.Strings = (
      
        'select p.rowid,p.id,p.ins_id,p.traid,p.ammount,p.paydate ,sb_p.n' +
        'ame,p.planid,'
      '/*CASE p.planid'
      '  WHEN 2 THEN '#39'Hadiseye gore'#39
      '  WHEN 1 THEN '#39'Plan uzre'#39
      '  END as plantype*/'
      ' decode( p.planid, 2,'#39'Hadiseye gore'#39','
      '                   1,'#39'Plan uzre'#39','
      '                    0,'#39'Plandan kenar'#39')as plantype'
      
        'from ins_payments p,sb_business_processes sb_p,sb_business_opers' +
        ' sb_o,provarch pr'
      'where p.traid=sb_o.parentid'
      'and sb_o.busproc=sb_p.id'
      'and  p.ins_id=:pcid'
      'and sb_o.busproc in(14,15,16,17,18,19,20,63)'
      'and pr.id=sb_o.parentid')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A00500043004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      050000000800000004000000490044000100000000000E000000500041005900
      44004100540045000100000000000E00000041004D004D004F0055004E005400
      0100000000000A000000540052004100490044000100000000000C0000004900
      4E0053005F0049004400010000000000080000004E0041004D00450001000000
      00001000000050004C0041004E0054005900500045000100000000000C000000
      50004C0041004E0049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 64
    Top = 24
    object ODSPaymentsPAYDATE: TDateTimeField
      DisplayLabel = 'Tarix'
      FieldName = 'PAYDATE'
    end
    object ODSPaymentsAMMOUNT: TFloatField
      DisplayLabel = 'M'#601'bl'#601#287
      FieldName = 'AMMOUNT'
    end
    object ODSPaymentsNAME: TWideStringField
      DisplayLabel = 'S'#305#287'orta tipi'
      FieldName = 'NAME'
      Size = 600
    end
    object ODSPaymentsPLANTYPE: TWideStringField
      DisplayLabel = 'Plan'
      FieldName = 'PLANTYPE'
      Size = 14
    end
    object ODSPaymentsPLANID: TFloatField
      FieldName = 'PLANID'
      Visible = False
    end
    object ODSPaymentsTRAID: TFloatField
      FieldName = 'TRAID'
      Visible = False
    end
    object ODSPaymentsINS_ID: TFloatField
      FieldName = 'INS_ID'
      Visible = False
    end
    object ODSPaymentsID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
  end
  object DSPayments: TDataSource
    DataSet = ODSPayments
    Left = 64
    Top = 80
  end
  object ODSPlan: TOracleDataSet
    SQL.Strings = (
      
        'SELECT 1 as ID, '#39'Plan uzre'#39' as paydate, 0 as ammount, 0 as statu' +
        's'
      '  FROM DUAL'
      'UNION ALL'
      
        'SELECT 2 as ID, '#39'Hadiseye gore'#39' as paydate, 0 as ammount, 0 as s' +
        'tatus'
      '  FROM DUAL'
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000400000004000000490044000100000000000E00000041004D004D00
      4F0055004E0054000100000000000C0000005300540041005400550053000100
      000000000E0000005000410059004400410054004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 160
    Top = 32
    object ODSPlanID: TFloatField
      FieldName = 'ID'
    end
    object ODSPlanPAYDATE: TWideStringField
      FieldName = 'PAYDATE'
      Size = 30
    end
    object ODSPlanAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSPlanSTATUS: TFloatField
      FieldName = 'STATUS'
    end
  end
  object DSPlan: TDataSource
    DataSet = ODSPlan
    Left = 160
    Top = 80
  end
  object OPSBOP: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SBOP'
    Left = 64
    Top = 142
  end
  object OPCOMMON: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_COMMON'
    Left = 160
    Top = 140
  end
  object DSRRestPayment: TDataSource
    DataSet = DSRestPayment
    Left = 672
    Top = 96
  end
  object DSRestPayment: TOracleDataSet
    SQL.Strings = (
      'select '
      
        'nvl((select nvl(ammount,0)+nvl(INS_PREMIUM,0)+nvl(RESP_PREMIUM,0' +
        ')  as qaliq'
      
        'from ins_contracts c,ins_contr_per_acc_motor f,ins_contract_resp' +
        'onsibility m'
      'where c.id=:pcid'
      'and   f.cid(+)=c.id'
      'and   m.cid(+)=c.id)-'
      
        '(select nvl(sum(ammount),0) as ammount from ins_payments p, sb_b' +
        'usiness_opers b'
      'where p.ins_id=:pcid'
      'and p.traid=b.parentid'
      'and p.planid=1'
      'and busproc in(35,36,37,38,39,40,41) ),0) as qaliq'
      ''
      ' from dual')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A00500043004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {05000000010000000A000000510041004C0049005100010000000000}
    Session = sboapiDataModule.SBSession
    Left = 672
    Top = 40
    object DSRestPaymentQALIQ: TFloatField
      FieldName = 'QALIQ'
    end
  end
  object DSContracts: TOracleDataSet
    SQL.Strings = (
      'select * from ins_contracts'
      'where id=:pcid')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A00500043004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      050000002000000004000000490044000100000000000E000000540059005000
      45005F00490044000100000000001000000049004E0053005F00440041005400
      45000100000000001400000042004500470049004E005F004400410054004500
      0100000000001000000045004E0044005F004400410054004500010000000000
      12000000560041004C005500540045005F00490044000100000000000E000000
      41004D004D004F0055004E0054000100000000001800000043004C004F005300
      45005F005000520045004600490058000100000000000C0000004B004C004900
      5F0049004400010000000000140000004C004F0041004E004100430043005F00
      490044000100000000001400000043005500520052004100430043005F004900
      44000100000000001400000050004F004C004900430059005F004E0055004D00
      0100000000000E00000049004E005300530055004D004D000100000000001000
      00004600520041004E005300480049005A000100000000000C00000054004100
      52004900460046000100000000000A0000005300540041005400450001000000
      0000100000004100470045004E0054005F004900440001000000000008000000
      50004E0055004D000100000000000C000000420045004E005F00490044000100
      0000000016000000420045004E00450046004900430049004100520059000100
      000000001400000043004F004E0044004900540049004F004E00530001000000
      00000C0000005300550047004E0055004D000100000000001000000042004C00
      41004E004B005F00490044000100000000000A0000004F0050005F0049004400
      0100000000000A0000005200450049004E0053000100000000000E0000004300
      48004B00410053004B004F0001000000000006000000430048004D0001000000
      00000800000043004800460051000100000000001600000043004F004D004D00
      490054004F0050005F00490044000100000000001600000043004F004D004D00
      490054005F00440041005400450001000000000014000000430041004E004300
      45004C004F0050004900440001000000000014000000430041004E0043004500
      4C004400410054004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 368
    Top = 32
    object DSContractsID: TFloatField
      FieldName = 'ID'
    end
    object DSContractsTYPE_ID: TFloatField
      FieldName = 'TYPE_ID'
    end
    object DSContractsINS_DATE: TDateTimeField
      FieldName = 'INS_DATE'
    end
    object DSContractsBEGIN_DATE: TDateTimeField
      FieldName = 'BEGIN_DATE'
    end
    object DSContractsEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
    object DSContractsVALUTE_ID: TFloatField
      FieldName = 'VALUTE_ID'
    end
    object DSContractsAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object DSContractsCLOSE_PREFIX: TIntegerField
      FieldName = 'CLOSE_PREFIX'
    end
    object DSContractsKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object DSContractsLOANACC_ID: TFloatField
      FieldName = 'LOANACC_ID'
    end
    object DSContractsCURRACC_ID: TFloatField
      FieldName = 'CURRACC_ID'
    end
    object DSContractsPOLICY_NUM: TWideStringField
      FieldName = 'POLICY_NUM'
      Size = 128
    end
    object DSContractsINSSUMM: TFloatField
      FieldName = 'INSSUMM'
    end
    object DSContractsFRANSHIZ: TFloatField
      FieldName = 'FRANSHIZ'
    end
    object DSContractsTARIFF: TFloatField
      FieldName = 'TARIFF'
    end
    object DSContractsSTATE: TIntegerField
      FieldName = 'STATE'
    end
    object DSContractsAGENT_ID: TFloatField
      FieldName = 'AGENT_ID'
    end
    object DSContractsPNUM: TFloatField
      FieldName = 'PNUM'
    end
    object DSContractsBEN_ID: TFloatField
      FieldName = 'BEN_ID'
    end
    object DSContractsBENEFICIARY: TWideStringField
      FieldName = 'BENEFICIARY'
      Size = 4000
    end
    object DSContractsCONDITIONS: TWideStringField
      FieldName = 'CONDITIONS'
      Size = 4000
    end
    object DSContractsSUGNUM: TWideStringField
      FieldName = 'SUGNUM'
      Size = 128
    end
    object DSContractsBLANK_ID: TFloatField
      FieldName = 'BLANK_ID'
    end
    object DSContractsOP_ID: TFloatField
      FieldName = 'OP_ID'
    end
    object DSContractsREINS: TFloatField
      FieldName = 'REINS'
    end
    object DSContractsCHKASKO: TFloatField
      FieldName = 'CHKASKO'
    end
    object DSContractsCHM: TFloatField
      FieldName = 'CHM'
    end
    object DSContractsCHFQ: TFloatField
      FieldName = 'CHFQ'
    end
    object DSContractsCOMMITOP_ID: TFloatField
      FieldName = 'COMMITOP_ID'
    end
    object DSContractsCOMMIT_DATE: TDateTimeField
      FieldName = 'COMMIT_DATE'
    end
    object DSContractsCANCELOPID: TFloatField
      FieldName = 'CANCELOPID'
    end
    object DSContractsCANCELDATE: TDateTimeField
      FieldName = 'CANCELDATE'
    end
  end
  object DSRContracts: TDataSource
    DataSet = DSContracts
    Left = 368
    Top = 80
  end
  object DSPlansetting: TOracleDataSet
    SQL.Strings = (
      'select * from ins_payment_plan_setting'
      'where cid=:pcid')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A00500043004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      0500000007000000040000004900440001000000000006000000430049004400
      010000000000180000005000410059004D0045004E0054005F00540059005000
      45000100000000000E000000500045005200430045004E005400010000000000
      12000000500045005200430045004E0054005F00460001000000000012000000
      500045005200430045004E0054005F004D000100000000000A0000004F005000
      5F0049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 352
    Top = 144
    object DSPlansettingID: TFloatField
      FieldName = 'ID'
    end
    object DSPlansettingCID: TFloatField
      FieldName = 'CID'
    end
    object DSPlansettingPAYMENT_TYPE: TFloatField
      FieldName = 'PAYMENT_TYPE'
    end
    object DSPlansettingPERCENT: TFloatField
      FieldName = 'PERCENT'
    end
    object DSPlansettingPERCENT_F: TFloatField
      FieldName = 'PERCENT_F'
    end
    object DSPlansettingPERCENT_M: TFloatField
      FieldName = 'PERCENT_M'
    end
    object DSPlansettingOP_ID: TFloatField
      FieldName = 'OP_ID'
    end
  end
  object DSRHesab: TDataSource
    DataSet = DSHesab
    Left = 65
    Top = 242
  end
  object DSHesab: TOracleDataSet
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 64
    Top = 191
  end
  object DSpaymentAcc: TOracleDataSet
    SQL.Strings = (
      
        'select id, acc_no from account where id in(select acc_id from in' +
        's_dict_acc_payment_loss)'
      'union'
      'select id, acc_no from account where bal_cn1 in(563)')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000000C000000410043004300
      5F004E004F000100000000000C0000004B004C0049005F004900440001000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 480
    Top = 40
    object DSpaymentAccID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DSpaymentAccACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 448
    end
  end
  object DSRpaymentAcc: TDataSource
    DataSet = DSpaymentAcc
    Left = 480
    Top = 88
  end
  object DSRPaymentReal: TDataSource
    DataSet = DSPaymentReal
    Left = 568
    Top = 88
  end
  object DSPaymentReal: TOracleDataSet
    SQL.Strings = (
      
        'select p.rowid,p.id,p.ins_id,p.traid,p.ammount,p.paydate ,sb_p.n' +
        'ame,p.planid,'
      '/*CASE p.planid'
      '  WHEN 2 THEN '#39'Hadis'#601'y'#601' g'#246'r'#601#39
      '  WHEN 1 THEN '#39'Hadis'#601'y'#601' g'#246'r'#601#39
      '  END as plantype*/'
      ' decode( p.planid, 2,'#39'Hadiseye gore'#39','
      '                   1,'#39'Plan uzre'#39')as plantype'
      
        'from ins_payments p,sb_business_processes sb_p,sb_business_opers' +
        ' sb_o'
      'where p.traid=sb_o.parentid'
      'and sb_o.busproc=sb_p.id'
      'and  p.ins_id=:pcid'
      'and sb_o.busproc in(35,36,37,38,39,40,41,64)')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A00500043004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      050000000800000004000000490044000100000000000C00000049004E005300
      5F00490044000100000000000A00000054005200410049004400010000000000
      0E00000041004D004D004F0055004E0054000100000000000E00000050004100
      59004400410054004500010000000000080000004E0041004D00450001000000
      00000C00000050004C0041004E00490044000100000000001000000050004C00
      41004E005400590050004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 568
    Top = 40
    object DSPaymentRealPAYDATE: TDateTimeField
      DisplayLabel = 'Tarix'
      FieldName = 'PAYDATE'
    end
    object DSPaymentRealAMMOUNT: TFloatField
      DisplayLabel = 'M'#601'bl'#601#287
      FieldName = 'AMMOUNT'
    end
    object DSPaymentRealNAME: TWideStringField
      DisplayLabel = 'S'#305#287'orta tipi'
      FieldName = 'NAME'
      Size = 600
    end
    object DSPaymentRealPLANTYPE: TWideStringField
      DisplayLabel = 'Plan'
      FieldName = 'PLANTYPE'
      Size = 13
    end
    object DSPaymentRealPLANID: TFloatField
      FieldName = 'PLANID'
      Visible = False
    end
    object DSPaymentRealTRAID: TFloatField
      FieldName = 'TRAID'
      Visible = False
    end
    object DSPaymentRealID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object DSPaymentRealINS_ID: TFloatField
      FieldName = 'INS_ID'
      Visible = False
    end
  end
  object DSTSighaqqı: TOracleDataSet
    SQL.Strings = (
      'select(select nvl(sum(p.ammount),0) '
      
        'from ins_payments p,sb_business_processes sb_p,sb_business_opers' +
        ' sb_o,provarch pr'
      'where p.traid=sb_o.parentid'
      'and sb_o.busproc=sb_p.id'
      'and  p.ins_id=:pcid'
      'and sb_o.busproc in(14,15,16,17,18,19,20,63)'
      'and p.planid in (1,0)'
      'and pr.id=sb_o.parentid)-'
      '(select nvl(sum(p.ammount),0) '
      
        'from ins_payments p,sb_business_processes sb_p,sb_business_opers' +
        ' sb_o'
      'where p.traid=sb_o.parentid'
      'and sb_o.busproc=sb_p.id'
      'and  p.ins_id=:pcid'
      'and sb_o.busproc in(35,36,37,38,39,40,41,64)'
      'and p.planid=1) as Sighaqqiqaliq from dual')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A00500043004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      05000000010000001A0000005300490047004800410051005100490051004100
      4C0049005100010000000000}
    Session = sboapiDataModule.SBSession
    Left = 304
    Top = 223
    object DSTSighaqqıSIGHAQQIQALIQ: TFloatField
      FieldName = 'SIGHAQQIQALIQ'
    end
  end
  object DSTSighaqqıK: TOracleDataSet
    SQL.Strings = (
      'select(select nvl(sum(p.ammount),0) '
      ''
      
        'from ins_payments p,sb_business_processes sb_p,sb_business_opers' +
        ' sb_o,provarch pr'
      'where p.traid=sb_o.parentid'
      'and sb_o.busproc=sb_p.id'
      'and  p.ins_id=:pcid'
      'and sb_o.busproc in(14)'
      'and p.planid in (1,0)'
      'and pr.id=sb_o.parentid)-'
      '(select nvl(sum(p.ammount),0) '
      ''
      
        'from ins_payments p,sb_business_processes sb_p,sb_business_opers' +
        ' sb_o'
      'where p.traid=sb_o.parentid'
      'and sb_o.busproc=sb_p.id'
      'and  p.ins_id=:pcid'
      'and sb_o.busproc in(35)'
      'and p.planid=1) as Sighaqqiqaliq from dual')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A00500043004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      05000000010000001A0000005300490047004800410051005100490051004100
      4C0049005100010000000000}
    Session = sboapiDataModule.SBSession
    Left = 400
    Top = 222
    object DSTSighaqqıKSIGHAQQIQALIQ: TFloatField
      FieldName = 'SIGHAQQIQALIQ'
    end
  end
  object DSTSighaqqıM: TOracleDataSet
    SQL.Strings = (
      'select(select nvl(sum(p.ammount),0) '
      ''
      
        'from ins_payments p,sb_business_processes sb_p,sb_business_opers' +
        ' sb_o,provarch pr'
      'where p.traid=sb_o.parentid'
      'and sb_o.busproc=sb_p.id'
      'and  p.ins_id=:pcid'
      'and sb_o.busproc in(15)'
      'and p.planid in(1,0)'
      'and pr.id=sb_o.parentid)-'
      '(select nvl(sum(p.ammount),0)'
      ''
      
        'from ins_payments p,sb_business_processes sb_p,sb_business_opers' +
        ' sb_o'
      'where p.traid=sb_o.parentid'
      'and sb_o.busproc=sb_p.id'
      'and  p.ins_id=:pcid'
      'and sb_o.busproc in(36)'
      'and p.planid=1)  as Sighaqqiqaliq from dual')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A00500043004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      05000000010000001A0000005300490047004800410051005100490051004100
      4C0049005100010000000000}
    Session = sboapiDataModule.SBSession
    Left = 496
    Top = 222
    object DSTSighaqqıMSIGHAQQIQALIQ: TFloatField
      FieldName = 'SIGHAQQIQALIQ'
    end
  end
  object DSTSighaqqıFQ: TOracleDataSet
    SQL.Strings = (
      'select(select nvl(sum(p.ammount),0)'
      ''
      
        'from ins_payments p,sb_business_processes sb_p,sb_business_opers' +
        ' sb_o,provarch pr'
      'where p.traid=sb_o.parentid'
      'and sb_o.busproc=sb_p.id'
      'and  p.ins_id=:pcid'
      'and sb_o.busproc in(16)'
      'and p.planid in (1,0)'
      'and pr.id=sb_o.parentid)-'
      '(select nvl(sum(p.ammount),0)'
      ''
      
        'from ins_payments p,sb_business_processes sb_p,sb_business_opers' +
        ' sb_o'
      'where p.traid=sb_o.parentid'
      'and sb_o.busproc=sb_p.id'
      'and  p.ins_id=:pcid'
      'and sb_o.busproc in(37)'
      'and p.planid=1) as Sighaqqiqaliq from dual')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A00500043004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      05000000010000001A0000005300490047004800410051005100490051004100
      4C0049005100010000000000}
    Session = sboapiDataModule.SBSession
    Left = 600
    Top = 222
    object DSTSighaqqıFQSIGHAQQIQALIQ: TFloatField
      FieldName = 'SIGHAQQIQALIQ'
    end
  end
  object DSRins_dict_next_event_per: TDataSource
    DataSet = DSins_dict_next_event_per
    Left = 72
    Top = 352
  end
  object DSins_dict_next_event_per: TOracleDataSet
    SQL.Strings = (
      'SELECT a.percent'
      '  FROM ins_dict_next_event_percent a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000010000000E000000500045005200430045004E005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 72
    Top = 296
    object DSins_dict_next_event_perPERCENT: TFloatField
      FieldName = 'PERCENT'
    end
  end
  object sb_aca: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'sb_aca'
    Left = 184
    Top = 216
  end
  object dscustname: TOracleDataSet
    SQL.Strings = (
      'select name from customers'
      'where id=:pid')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A00500049004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {0500000001000000080000004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 496
    Top = 272
    object dscustnameNAME: TWideStringField
      FieldName = 'NAME'
      Size = 360
    end
  end
  object dsRcustname: TDataSource
    DataSet = dscustname
    Left = 512
    Top = 328
  end
  object dsotherkdhesab: TOracleDataSet
    SQL.Strings = (
      'select id,acc_no from account'
      'where close_dat is  null'
      'and id in (select acc_id from ins_dict_acc_payment_loss)'
      'and bal_cn1=601'
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000200000004000000490044000100000000000C000000410043004300
      5F004E004F00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 224
    Top = 288
    object dsotherkdhesabID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object dsotherkdhesabACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 448
    end
  end
  object dsotherdbhesab: TOracleDataSet
    SQL.Strings = (
      'select id,acc_no from account'
      'where close_dat is  null'
      'and ownid=:pcid')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A00500043004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      050000000200000004000000490044000100000000000C000000410043004300
      5F004E004F00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 328
    Top = 288
    object dsotherdbhesabID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object dsotherdbhesabACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 448
    end
  end
  object dsrotherkdhesab: TDataSource
    DataSet = dsotherkdhesab
    Left = 208
    Top = 344
  end
  object dsrotherdbhesab: TDataSource
    DataSet = dsotherdbhesab
    Left = 336
    Top = 352
  end
  object Dskassabalans: TOracleDataSet
    SQL.Strings = (
      'select id,kli_id,bal_cn1 from account'
      'where acc_no=:p_acc_no')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A0050005F004100430043005F004E004F000500
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000000C0000004B004C004900
      5F00490044000100000000000E000000420041004C005F0043004E0031000100
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 600
    Top = 288
    object DskassabalansID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DskassabalansKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object DskassabalansBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
    end
  end
end
