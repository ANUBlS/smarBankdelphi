object DMPaymentLoss: TDMPaymentLoss
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 298
  Width = 649
  object DSRPaymentLoss: TDataSource
    DataSet = DSPaymentLoss
    Left = 128
    Top = 24
  end
  object DSPaymentLoss: TOracleDataSet
    SQL.Strings = (
      'select  '
      'ins_d.id,'
      'ins_d.cid,'
      'ins_s.trid,'
      'ins_s.stage_tesdiq_dat,'
      'nvl(pr.lammount,0) as mebleg,'
      'sb_p.name'
      'from'
      'ins_claim_description ins_d,'
      'ins_claim_status ins_s,'
      'sb_business_opers sb_o,'
      'sb_business_processes sb_p,'
      'provarch pr'
      'where ins_d.id=:dpid'
      'and  ins_s.dep_id=ins_d.id'
      'and  ins_s.trid=sb_o.parentid'
      'and  pr.id=sb_o.parentid'
      'and  sb_o.busproc in(28,29,30,31,32,33,34)'
      'and  sb_p.id=sb_o.busproc')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A00440050004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      0500000006000000040000004900440001000000000006000000430049004400
      0100000000000800000054005200490044000100000000002000000053005400
      4100470045005F005400450053004400490051005F0044004100540001000000
      0000080000004E0041004D0045000100000000000C0000004D00450042004C00
      45004700010000000000}
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 24
    object DSPaymentLossID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object DSPaymentLossCID: TFloatField
      FieldName = 'CID'
      Visible = False
    end
    object DSPaymentLossTRID: TFloatField
      DisplayLabel = #399'm'#601'liyyat '#8470
      FieldName = 'TRID'
    end
    object DSPaymentLossSTAGE_TESDIQ_DAT: TDateTimeField
      DisplayLabel = 'Tarix'
      FieldName = 'STAGE_TESDIQ_DAT'
    end
    object DSPaymentLossNAME: TWideStringField
      DisplayLabel = #399'm'#601'liyyatin Ad'#305
      FieldName = 'NAME'
      Size = 600
    end
    object DSPaymentLossMEBLEG: TFloatField
      DisplayLabel = 'M'#601'bl'#601#287
      FieldName = 'MEBLEG'
    end
  end
  object DSPaymentLossReal: TOracleDataSet
    SQL.Strings = (
      'select '
      'ins_cp.id as pid, '
      'ins_d.id,'
      'ins_d.cid,'
      'ins_cp.traid,'
      'ins_cp.paydate,'
      'nvl(ins_cp.ammount,0) as mebleg,'
      'sb_p.name'
      'from'
      'ins_claim_description ins_d,'
      'ins_claim_payment ins_cp,'
      'sb_business_opers sb_o,'
      'sb_business_processes sb_p'
      'where ins_d.id=:dpid'
      'and  ins_cp.dep_id=ins_d.id'
      'and  ins_cp.traid=sb_o.parentid'
      'and  sb_o.busproc in(42,43,44,45,46,47,48)'
      'and  sb_p.id=sb_o.busproc')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A00440050004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      0500000007000000040000004900440001000000000006000000430049004400
      0100000000000A000000540052004100490044000100000000000E0000005000
      4100590044004100540045000100000000000C0000004D00450042004C004500
      4700010000000000080000004E0041004D004500010000000000060000005000
      49004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 80
    object DSPaymentLossRealID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object DSPaymentLossRealCID: TFloatField
      FieldName = 'CID'
      Visible = False
    end
    object DSPaymentLossRealTRAID: TFloatField
      DisplayLabel = #399'm'#601'liyyat '#8470
      FieldName = 'TRAID'
    end
    object DSPaymentLossRealPAYDATE: TDateTimeField
      DisplayLabel = 'Tarix'
      FieldName = 'PAYDATE'
    end
    object DSPaymentLossRealNAME: TWideStringField
      DisplayLabel = #399'm'#601'liyyatin Ad'#305
      FieldName = 'NAME'
      Size = 600
    end
    object DSPaymentLossRealMEBLEG: TFloatField
      DisplayLabel = 'M'#601'bl'#601#287
      FieldName = 'MEBLEG'
    end
    object DSPaymentLossRealPID: TFloatField
      FieldName = 'PID'
      Visible = False
    end
  end
  object DSSysdat: TOracleDataSet
    SQL.Strings = (
      'select * from sysdat')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000040000000E000000540045004B005F00440041005400010000000000
      1000000050005200450044005F004400410054000100000000000E0000004100
      520043005F004400410059000100000000000A00000043004C004F0053004500
      010000000000}
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 152
    object DSSysdatTEK_DAT: TDateTimeField
      FieldName = 'TEK_DAT'
    end
    object DSSysdatPRED_DAT: TDateTimeField
      FieldName = 'PRED_DAT'
    end
    object DSSysdatARC_DAY: TDateTimeField
      FieldName = 'ARC_DAY'
    end
    object DSSysdatCLOSE: TIntegerField
      FieldName = 'CLOSE'
    end
  end
  object DSRPaymentLossReal: TDataSource
    DataSet = DSPaymentLossReal
    Left = 128
    Top = 88
  end
  object DSRSysdat: TDataSource
    DataSet = DSSysdat
    Left = 136
    Top = 152
  end
  object DSpaymentAcc: TOracleDataSet
    SQL.Strings = (
      
        'select id, acc_no from account where id in(select acc_id from in' +
        's_dict_acc_payment_loss)'
      'union '
      'select id,acc_no from account where bal_cn1=211')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000200000004000000490044000100000000000C000000410043004300
      5F004E004F00010000000000}
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
  object Pins_common: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'ins_common'
    Left = 304
    Top = 40
  end
  object sb_aca: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'sb_aca'
    Left = 296
    Top = 96
  end
  object DSLossBarderoSay: TOracleDataSet
    SQL.Strings = (
      'select count(*) as say from ins_loss_bardero'
      'where dep_id=:pdep_id')
    Optimize = False
    Variables.Data = {
      0400000001000000100000003A0050004400450050005F004900440003000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {050000000100000006000000530041005900010000000000}
    Session = sboapiDataModule.SBSession
    Left = 384
    Top = 192
    object DSLossBarderoSaySAY: TFloatField
      FieldName = 'SAY'
    end
  end
  object ODSClaimDescription: TOracleDataSet
    SQL.Strings = (
      'select icd.rowid, icd.* '
      'from ins_claim_description icd'
      'where icd.id=:id'
      '')
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000003100000004000000490044000100000000000C000000520045004700
      49004F004E000100000000000C00000053005400520045004500540001000000
      00000C000000440045005400410049004C000100000000000C00000050004500
      520053004F004E00010000000000080000004D00410052004B00010000000000
      10000000530054004100540045004E0055004D00010000000000140000004100
      560054004F005300450052005600490053000100000000000A0000004D004F00
      440045004C000100000000000E00000041005000500044004100540045000100
      00000000140000004C0045005400540045005200440041005400450001000000
      0000120000004C00450054005400450052004E0055004D000100000000000C00
      00005300500052004E0055004D000100000000000C0000005000520054004E00
      55004D000100000000000E000000410043005400440041005400450001000000
      00000A0000004D004B005F004900440001000000000006000000430049004400
      0100000000000E0000004D004F00440045004C00490044000100000000000E00
      00004D00410052004B004100490044000100000000001200000043004C004100
      49004D005F004E0055004D000100000000001400000043004C00410049004D00
      5F00440041005400450001000000000016000000530055004200520041005100
      410053004900590041000100000000001000000045004D0050004C005F004100
      430043000100000000000C000000500052004F00420045004700010000000000
      30000000550054004F005F005400520041004E00530050004F00520054004100
      540049004F004E005F0043004F00530054005300010000000000220000004600
      49004E0041004C005F0041004D004F0055004E0054005F004C004F0053005300
      010000000000220000004100550054004F005F00410053005300450053005300
      5F0043004F005300540053000100000000002A000000560041004C0055004500
      5F004E00450057005F00530050004100520045005F0050004100520054005300
      010000000000160000004F0054004800450052005F0043004F00530054005300
      010000000000220000004D0041004E004100470045004D0045004E0054005F00
      5200490047004800540053000100000000003000000049004E0053005F004100
      4700410049004E00530054005F004F005200470041004E0049005A0041005400
      49004F004E000100000000002C00000049004E0053005F004100470041004900
      4E00530054005F0050004F004C00490053004E005F0044004100540001000000
      00002E0000004500560045004E0054005F005000550042005F00410055005400
      48004F0052004900540059005F005200450047000100000000002C0000004100
      550054004F005F005200450041004C005F004D00410052004B00450054005F00
      560041004C00550045000100000000001A000000520045004D00410049004E00
      53005F00560041004C005500450001000000000014000000420041004E004B00
      5F004100430043004E004F000100000000000800000054005900500045000100
      000000000C00000043005F005400590050004500010000000000180000004300
      4C00410049004D005F005300540041005400550053000100000000000C000000
      44005200490056004500520001000000000032000000460049004E0041004C00
      5F005000410059004D0045004E0054005F0041004D004F0055004E0054005F00
      4C004F00530053000100000000002800000041004D004F005200540049005A00
      410053004900590041005F0041004D004D004F0055004E005400010000000000
      2200000045004B005300500045005200540049005A0041005F0041004D004F00
      55004E0054000100000000002600000041005000500052004F00580049004D00
      4100540045005F0041004D004D004F0055004E00540001000000000018000000
      4F0054004800450052005F004400520049005600450052000100000000001E00
      00005200450046005500530041004C005F0041004D004D004F0055004E005400
      010000000000180000005200450046005500530041004C005F00440041005400
      4500010000000000260000005200450046005500530041004C005F0044004500
      53004300520049005000540049004F004E000100000000002200000049004E00
      53005F0041004700410049004E00530054005F004F0057004E00450052000100
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 575
    Top = 214
    object ODSClaimDescriptionID: TFloatField
      FieldName = 'ID'
    end
    object ODSClaimDescriptionREGION: TWideStringField
      FieldName = 'REGION'
      Size = 64
    end
    object ODSClaimDescriptionSTREET: TWideStringField
      FieldName = 'STREET'
      Size = 64
    end
    object ODSClaimDescriptionDETAIL: TWideStringField
      FieldName = 'DETAIL'
      Size = 1024
    end
    object ODSClaimDescriptionPERSON: TWideStringField
      FieldName = 'PERSON'
      Size = 64
    end
    object ODSClaimDescriptionSTATENUM: TWideStringField
      FieldName = 'STATENUM'
      Size = 64
    end
    object ODSClaimDescriptionAVTOSERVIS: TWideStringField
      FieldName = 'AVTOSERVIS'
      Size = 64
    end
    object ODSClaimDescriptionAPPDATE: TDateTimeField
      FieldName = 'APPDATE'
    end
    object ODSClaimDescriptionLETTERDATE: TDateTimeField
      FieldName = 'LETTERDATE'
    end
    object ODSClaimDescriptionLETTERNUM: TWideStringField
      FieldName = 'LETTERNUM'
      Size = 16
    end
    object ODSClaimDescriptionSPRNUM: TWideStringField
      FieldName = 'SPRNUM'
      Size = 16
    end
    object ODSClaimDescriptionPRTNUM: TWideStringField
      FieldName = 'PRTNUM'
      Size = 16
    end
    object ODSClaimDescriptionACTDATE: TDateTimeField
      FieldName = 'ACTDATE'
    end
    object ODSClaimDescriptionMK_ID: TFloatField
      FieldName = 'MK_ID'
    end
    object ODSClaimDescriptionCID: TFloatField
      FieldName = 'CID'
    end
    object ODSClaimDescriptionMARK: TWideStringField
      FieldName = 'MARK'
      Size = 256
    end
    object ODSClaimDescriptionMODEL: TWideStringField
      FieldName = 'MODEL'
      Size = 256
    end
    object ODSClaimDescriptionMODELID: TFloatField
      FieldName = 'MODELID'
    end
    object ODSClaimDescriptionMARKAID: TFloatField
      FieldName = 'MARKAID'
    end
    object ODSClaimDescriptionCLAIM_NUM: TWideStringField
      FieldName = 'CLAIM_NUM'
      Size = 200
    end
    object ODSClaimDescriptionCLAIM_DATE: TDateTimeField
      FieldName = 'CLAIM_DATE'
    end
    object ODSClaimDescriptionSUBRAQASIYA: TFloatField
      FieldName = 'SUBRAQASIYA'
    end
    object ODSClaimDescriptionEMPL_ACC: TFloatField
      FieldName = 'EMPL_ACC'
    end
    object ODSClaimDescriptionPROBEG: TFloatField
      FieldName = 'PROBEG'
    end
    object ODSClaimDescriptionUTO_TRANSPORTATION_COSTS: TFloatField
      FieldName = 'UTO_TRANSPORTATION_COSTS'
    end
    object ODSClaimDescriptionFINAL_AMOUNT_LOSS: TFloatField
      FieldName = 'FINAL_AMOUNT_LOSS'
    end
    object ODSClaimDescriptionAUTO_ASSESS_COSTS: TFloatField
      FieldName = 'AUTO_ASSESS_COSTS'
    end
    object ODSClaimDescriptionVALUE_NEW_SPARE_PARTS: TFloatField
      FieldName = 'VALUE_NEW_SPARE_PARTS'
    end
    object ODSClaimDescriptionOTHER_COSTS: TFloatField
      FieldName = 'OTHER_COSTS'
    end
    object ODSClaimDescriptionMANAGEMENT_RIGHTS: TWideStringField
      FieldName = 'MANAGEMENT_RIGHTS'
    end
    object ODSClaimDescriptionINS_AGAINST_ORGANIZATION: TFloatField
      FieldName = 'INS_AGAINST_ORGANIZATION'
    end
    object ODSClaimDescriptionINS_AGAINST_POLISN_DAT: TWideStringField
      FieldName = 'INS_AGAINST_POLISN_DAT'
      Size = 200
    end
    object ODSClaimDescriptionEVENT_PUB_AUTHORITY_REG: TWideStringField
      FieldName = 'EVENT_PUB_AUTHORITY_REG'
      Size = 200
    end
    object ODSClaimDescriptionAUTO_REAL_MARKET_VALUE: TFloatField
      FieldName = 'AUTO_REAL_MARKET_VALUE'
    end
    object ODSClaimDescriptionREMAINS_VALUE: TFloatField
      FieldName = 'REMAINS_VALUE'
    end
    object ODSClaimDescriptionBANK_ACCNO: TWideStringField
      FieldName = 'BANK_ACCNO'
      Size = 200
    end
    object ODSClaimDescriptionTYPE: TFloatField
      FieldName = 'TYPE'
    end
    object ODSClaimDescriptionC_TYPE: TFloatField
      FieldName = 'C_TYPE'
    end
    object ODSClaimDescriptionCLAIM_STATUS: TFloatField
      FieldName = 'CLAIM_STATUS'
    end
    object ODSClaimDescriptionDRIVER: TWideStringField
      FieldName = 'DRIVER'
      Size = 200
    end
    object ODSClaimDescriptionFINAL_PAYMENT_AMOUNT_LOSS: TFloatField
      FieldName = 'FINAL_PAYMENT_AMOUNT_LOSS'
    end
    object ODSClaimDescriptionAMORTIZASIYA_AMMOUNT: TFloatField
      FieldName = 'AMORTIZASIYA_AMMOUNT'
    end
    object ODSClaimDescriptionEKSPERTIZA_AMOUNT: TFloatField
      FieldName = 'EKSPERTIZA_AMOUNT'
    end
    object ODSClaimDescriptionAPPROXIMATE_AMMOUNT: TFloatField
      FieldName = 'APPROXIMATE_AMMOUNT'
    end
    object ODSClaimDescriptionOTHER_DRIVER: TFloatField
      FieldName = 'OTHER_DRIVER'
    end
    object ODSClaimDescriptionREFUSAL_AMMOUNT: TFloatField
      FieldName = 'REFUSAL_AMMOUNT'
    end
    object ODSClaimDescriptionREFUSAL_DATE: TDateTimeField
      FieldName = 'REFUSAL_DATE'
    end
    object ODSClaimDescriptionREFUSAL_DESCRIPTION: TWideStringField
      FieldName = 'REFUSAL_DESCRIPTION'
      Size = 1000
    end
    object ODSClaimDescriptionINS_AGAINST_OWNER: TWideStringField
      FieldName = 'INS_AGAINST_OWNER'
      Size = 200
    end
  end
  object DSClaimDescription: TDataSource
    DataSet = ODSClaimDescription
    Left = 578
    Top = 159
  end
  object dsqaliq: TOracleDataSet
    SQL.Strings = (
      'select (select  '
      'sum(nvl(pr.lammount,0)) as mebleg'
      'from'
      'ins_claim_description ins_d,'
      'ins_claim_status ins_s,'
      'sb_business_opers sb_o,'
      'sb_business_processes sb_p,'
      'provarch pr'
      'where ins_d.id=:dpid  '
      'and  ins_s.dep_id=ins_d.id'
      'and  ins_s.trid=sb_o.parentid'
      'and  pr.id=sb_o.parentid'
      'and  sb_o.busproc in(28,29,30,31,32,33,34)'
      'and  sb_p.id=sb_o.busproc)-((select nvl((select '
      'sum(ins_cp.ammount)'
      'from'
      'ins_claim_description ins_d,'
      'ins_claim_payment ins_cp,'
      'sb_business_opers sb_o,'
      'sb_business_processes sb_p'
      'where ins_d.id=:dpid  '
      'and  ins_cp.dep_id=ins_d.id'
      'and  ins_cp.traid=sb_o.parentid'
      'and  sb_o.busproc in(42,43,44,45,46,47,48)'
      'and  sb_p.id=sb_o.busproc),0) from dual)'
      ') as qaliq from dual')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A00440050004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {05000000010000000A000000510041004C0049005100010000000000}
    Session = sboapiDataModule.SBSession
    Left = 72
    Top = 224
    object dsqaliqQALIQ: TFloatField
      FieldName = 'QALIQ'
    end
  end
  object Ds_contracts: TOracleDataSet
    SQL.Strings = (
      'select a.rowid,a.* from ins_contracts a'
      'where a.id=:cid')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A00430049004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000002300000004000000490044000100000000000E000000540059005000
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
      4C0044004100540045000100000000000C000000460049004C00490041004C00
      0100000000001000000042004E0046005F005400590050004500010000000000
      14000000550053004500520049004E005300450052005400010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 176
    Top = 240
    object Ds_contractsID: TFloatField
      FieldName = 'ID'
    end
    object Ds_contractsTYPE_ID: TFloatField
      FieldName = 'TYPE_ID'
    end
    object Ds_contractsINS_DATE: TDateTimeField
      FieldName = 'INS_DATE'
    end
    object Ds_contractsBEGIN_DATE: TDateTimeField
      FieldName = 'BEGIN_DATE'
    end
    object Ds_contractsEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
    object Ds_contractsVALUTE_ID: TFloatField
      FieldName = 'VALUTE_ID'
    end
    object Ds_contractsAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object Ds_contractsCLOSE_PREFIX: TIntegerField
      FieldName = 'CLOSE_PREFIX'
    end
    object Ds_contractsKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object Ds_contractsLOANACC_ID: TFloatField
      FieldName = 'LOANACC_ID'
    end
    object Ds_contractsCURRACC_ID: TFloatField
      FieldName = 'CURRACC_ID'
    end
    object Ds_contractsPOLICY_NUM: TWideStringField
      FieldName = 'POLICY_NUM'
      Size = 128
    end
    object Ds_contractsINSSUMM: TFloatField
      FieldName = 'INSSUMM'
    end
    object Ds_contractsFRANSHIZ: TFloatField
      FieldName = 'FRANSHIZ'
    end
    object Ds_contractsTARIFF: TFloatField
      FieldName = 'TARIFF'
    end
    object Ds_contractsSTATE: TIntegerField
      FieldName = 'STATE'
    end
    object Ds_contractsAGENT_ID: TFloatField
      FieldName = 'AGENT_ID'
    end
    object Ds_contractsPNUM: TFloatField
      FieldName = 'PNUM'
    end
    object Ds_contractsBEN_ID: TFloatField
      FieldName = 'BEN_ID'
    end
    object Ds_contractsBENEFICIARY: TWideStringField
      FieldName = 'BENEFICIARY'
      Size = 4000
    end
    object Ds_contractsCONDITIONS: TWideStringField
      FieldName = 'CONDITIONS'
      Size = 4000
    end
    object Ds_contractsSUGNUM: TWideStringField
      FieldName = 'SUGNUM'
      Size = 128
    end
    object Ds_contractsBLANK_ID: TFloatField
      FieldName = 'BLANK_ID'
    end
    object Ds_contractsOP_ID: TFloatField
      FieldName = 'OP_ID'
    end
    object Ds_contractsREINS: TFloatField
      FieldName = 'REINS'
    end
    object Ds_contractsCHKASKO: TFloatField
      FieldName = 'CHKASKO'
    end
    object Ds_contractsCHM: TFloatField
      FieldName = 'CHM'
    end
    object Ds_contractsCHFQ: TFloatField
      FieldName = 'CHFQ'
    end
    object Ds_contractsCOMMITOP_ID: TFloatField
      FieldName = 'COMMITOP_ID'
    end
    object Ds_contractsCOMMIT_DATE: TDateTimeField
      FieldName = 'COMMIT_DATE'
    end
    object Ds_contractsCANCELOPID: TFloatField
      FieldName = 'CANCELOPID'
    end
    object Ds_contractsCANCELDATE: TDateTimeField
      FieldName = 'CANCELDATE'
    end
    object Ds_contractsFILIAL: TFloatField
      FieldName = 'FILIAL'
    end
    object Ds_contractsBNF_TYPE: TFloatField
      FieldName = 'BNF_TYPE'
    end
  end
end
