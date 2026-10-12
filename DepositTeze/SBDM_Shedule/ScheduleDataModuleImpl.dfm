object ScheduleDataModule: TScheduleDataModule
  OldCreateOrder = False
  Left = 187
  Top = 160
  Height = 540
  Width = 783
  object sbdm_customers: TOracleDataSet
    SQL.Strings = (
      'select * from customers c ,sbcm_contracts s'
      'where c.id=s.CUSTOMERID and'
      '           s.id=:id'
      ''
      '     '
      ''
      ' ')
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000002C000000020000004944010000000000050000004F505F4944010000
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
      53535545440100000000000A0000004F54565F49534441544501000000000007
      0000004F4C445F494E4E01000000000009000000435553545F54595045010000
      0000000400000049445F31010000000000050000005459504523010000000000
      080000004F50454E4441544501000000000009000000434C4F53454441544501
      000000000006000000414D4F554E540100000000000A000000434F4E54524143
      544E4F0100000000000C000000434F4E5452414354545950450100000000000A
      000000504C45444745545950450100000000000D00000052454C494142494C49
      545949440100000000000A000000434C49454E54545950450100000000000B00
      0000504C45444745505249434501000000000004000000534944230100000000
      00140000004F56455244554552454C494142494C49545949440100000000000C
      000000504552534F4E414C545950450100000000000800000043555252454E43
      59010000000000080000004252414E434849440100000000000A000000435553
      544F4D45524944010000000000130000004649525354494E5445524553545041
      5944415401000000000008000000504552494F444944010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 16
    object sbdm_customersID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sbdm_customersOP_ID: TFloatField
      FieldName = 'OP_ID'
    end
    object sbdm_customersOPEN_DAT: TDateTimeField
      FieldName = 'OPEN_DAT'
    end
    object sbdm_customersCLOSE_DAT: TDateTimeField
      FieldName = 'CLOSE_DAT'
    end
    object sbdm_customersNEREZIDENT: TFloatField
      FieldName = 'NEREZIDENT'
    end
    object sbdm_customersPRINAD_KOD: TFloatField
      FieldName = 'PRINAD_KOD'
    end
    object sbdm_customersNAME: Twidestringfield
      FieldName = 'NAME'
      Size = 90
    end
    object sbdm_customersSHORT_NAME: Twidestringfield
      FieldName = 'SHORT_NAME'
      Size = 50
    end
    object sbdm_customersGROUP_KLIE: TFloatField
      FieldName = 'GROUP_KLIE'
    end
    object sbdm_customersVID_SOB: TFloatField
      FieldName = 'VID_SOB'
    end
    object sbdm_customersORG_SOB: TFloatField
      FieldName = 'ORG_SOB'
    end
    object sbdm_customersSFERA_DEY: TFloatField
      FieldName = 'SFERA_DEY'
    end
    object sbdm_customersOTRASL: TFloatField
      FieldName = 'OTRASL'
    end
    object sbdm_customersNALOG_KOD: TFloatField
      FieldName = 'NALOG_KOD'
    end
    object sbdm_customersKOD_OKPRO: Twidestringfield
      FieldName = 'KOD_OKPRO'
      Size = 10
    end
    object sbdm_customersINN: Twidestringfield
      FieldName = 'INN'
    end
    object sbdm_customersDAT_NAL: TDateTimeField
      FieldName = 'DAT_NAL'
    end
    object sbdm_customersDAT_USTAV: TDateTimeField
      FieldName = 'DAT_USTAV'
    end
    object sbdm_customersBIK: TFloatField
      FieldName = 'BIK'
    end
    object sbdm_customersOTV_LICO: Twidestringfield
      FieldName = 'OTV_LICO'
      Size = 40
    end
    object sbdm_customersOTV_PASSPORT: Twidestringfield
      FieldName = 'OTV_PASSPORT'
    end
    object sbdm_customersOTV_ISSUED: Twidestringfield
      FieldName = 'OTV_ISSUED'
      Size = 40
    end
    object sbdm_customersOTV_ISDATE: TDateTimeField
      FieldName = 'OTV_ISDATE'
    end
    object sbdm_customersOLD_INN: TFloatField
      FieldName = 'OLD_INN'
    end
    object sbdm_customersCUST_TYPE: TIntegerField
      FieldName = 'CUST_TYPE'
    end
    object sbdm_customersID_1: TFloatField
      FieldName = 'ID_1'
      Required = True
    end
    object sbdm_customersTYPE: TFloatField
      FieldName = 'TYPE#'
      Required = True
    end
    object sbdm_customersOPENDATE: TDateTimeField
      FieldName = 'OPENDATE'
      Required = True
    end
    object sbdm_customersCLOSEDATE: TDateTimeField
      FieldName = 'CLOSEDATE'
      Required = True
    end
    object sbdm_customersAMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object sbdm_customersCONTRACTNO: Twidestringfield
      FieldName = 'CONTRACTNO'
      Size = 64
    end
    object sbdm_customersCONTRACTTYPE: TIntegerField
      FieldName = 'CONTRACTTYPE'
    end
    object sbdm_customersPLEDGETYPE: TFloatField
      FieldName = 'PLEDGETYPE'
    end
    object sbdm_customersRELIABILITYID: TIntegerField
      FieldName = 'RELIABILITYID'
    end
    object sbdm_customersCLIENTTYPE: TFloatField
      FieldName = 'CLIENTTYPE'
    end
    object sbdm_customersPLEDGEPRICE: TFloatField
      FieldName = 'PLEDGEPRICE'
    end
    object sbdm_customersSID: TFloatField
      FieldName = 'SID#'
    end
    object sbdm_customersOVERDUERELIABILITYID: TFloatField
      FieldName = 'OVERDUERELIABILITYID'
    end
    object sbdm_customersPERSONALTYPE: TFloatField
      FieldName = 'PERSONALTYPE'
    end
    object sbdm_customersCURRENCY: TFloatField
      FieldName = 'CURRENCY'
    end
    object sbdm_customersBRANCHID: TFloatField
      FieldName = 'BRANCHID'
    end
    object sbdm_customersCUSTOMERID: TFloatField
      FieldName = 'CUSTOMERID'
    end
    object sbdm_customersFIRSTINTERESTPAYDAT: TDateTimeField
      FieldName = 'FIRSTINTERESTPAYDAT'
    end
    object sbdm_customersPERIODID: TFloatField
      FieldName = 'PERIODID'
    end
  end
  object sbdm_dscustomers: TDataSource
    DataSet = sbdm_customers
    Left = 120
    Top = 16
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select * from sbcm_interests'
      'where id#=:id')
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000003000000030000004944230100000000000500000048444154450100
      0000000008000000494E544552455354010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 216
    Top = 17
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 296
    Top = 18
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      'SELECT Z.RowID,Z.*'
      '  FROM SBCM_PAYMENT_SCHEDULE Z'
      'WHERE Z.id#=:Id'
      'ORDER BY HDATE')
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000005000000020000004944010000000000030000004944230100000000
      0005000000484441544501000000000008000000494E54455245535401000000
      00000A0000004950494E544552455354010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 72
    object OracleDataSet2SeqNo: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'SeqNo'
      OnGetText = OracleDataSet2SeqNoGetText
      Calculated = True
    end
    object OracleDataSet2ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OracleDataSet2ID2: TFloatField
      FieldName = 'ID#'
      Required = True
    end
    object OracleDataSet2HDATE: TDateTimeField
      FieldName = 'HDATE'
      Required = True
    end
    object OracleDataSet2INTEREST: TFloatField
      FieldName = 'INTEREST'
      Required = True
    end
    object OracleDataSet2IPINTEREST: TFloatField
      FieldName = 'IPINTEREST'
    end
  end
  object DataSource2: TDataSource
    DataSet = OracleDataSet2
    Left = 112
    Top = 72
  end
  object Sbcm_date: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SBOP'
    Left = 24
    Top = 152
  end
  object sbcm_percent_converting: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'sbcm_percent_converting'
    Left = 128
    Top = 152
  end
  object SBCM_PAYMENT_SCHEDULE1: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SBCM_PAYMENT_SCHEDULE1'
    ParameterMode = pmNamed
    Left = 288
    Top = 152
  end
  object OracleDataSet3: TOracleDataSet
    SQL.Strings = (
      'select * from sbcm_contracts s,sbcm_deposit_types d'
      'where s.CONTRACTTYPE=d.id and'
      '      d.DATEINTERVAL>0 and'
      '      s.id=:v_id'
      '')
    Variables.Data = {0300000001000000050000003A565F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000018000000020000004944010000000000050000005459504523010000
      000000080000004F50454E4441544501000000000009000000434C4F53454441
      544501000000000006000000414D4F554E540100000000000A000000434F4E54
      524143544E4F0100000000000C000000434F4E54524143545459504501000000
      00000A000000504C45444745545950450100000000000D00000052454C494142
      494C49545949440100000000000A000000434C49454E54545950450100000000
      000B000000504C45444745505249434501000000000004000000534944230100
      00000000140000004F56455244554552454C494142494C495459494401000000
      00000C000000504552534F4E414C545950450100000000000800000043555252
      454E4359010000000000080000004252414E434849440100000000000A000000
      435553544F4D45524944010000000000130000004649525354494E5445524553
      5450415944415401000000000008000000504552494F44494401000000000004
      00000049445F3101000000000004000000545950450100000000000E00000041
      44444954494F4E414C545950450100000000000C000000574954484452415754
      5950450100000000000C00000044415445494E54455256414C010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 216
    Top = 72
    object OracleDataSet3ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OracleDataSet3TYPE: TFloatField
      FieldName = 'TYPE#'
    end
    object OracleDataSet3OPENDATE: TDateTimeField
      FieldName = 'OPENDATE'
    end
    object OracleDataSet3CLOSEDATE: TDateTimeField
      FieldName = 'CLOSEDATE'
    end
    object OracleDataSet3AMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object OracleDataSet3CONTRACTNO: Twidestringfield
      FieldName = 'CONTRACTNO'
      Size = 64
    end
    object OracleDataSet3CONTRACTTYPE: TIntegerField
      FieldName = 'CONTRACTTYPE'
    end
    object OracleDataSet3PLEDGETYPE: TFloatField
      FieldName = 'PLEDGETYPE'
    end
    object OracleDataSet3RELIABILITYID: TIntegerField
      FieldName = 'RELIABILITYID'
    end
    object OracleDataSet3CLIENTTYPE: TFloatField
      FieldName = 'CLIENTTYPE'
    end
    object OracleDataSet3PLEDGEPRICE: TFloatField
      FieldName = 'PLEDGEPRICE'
    end
    object OracleDataSet3SID: TFloatField
      FieldName = 'SID#'
    end
    object OracleDataSet3OVERDUERELIABILITYID: TFloatField
      FieldName = 'OVERDUERELIABILITYID'
    end
    object OracleDataSet3PERSONALTYPE: TFloatField
      FieldName = 'PERSONALTYPE'
    end
    object OracleDataSet3CURRENCY: TFloatField
      FieldName = 'CURRENCY'
    end
    object OracleDataSet3BRANCHID: TFloatField
      FieldName = 'BRANCHID'
    end
    object OracleDataSet3CUSTOMERID: TFloatField
      FieldName = 'CUSTOMERID'
    end
    object OracleDataSet3FIRSTINTERESTPAYDAT: TDateTimeField
      FieldName = 'FIRSTINTERESTPAYDAT'
    end
    object OracleDataSet3PERIODID: TFloatField
      FieldName = 'PERIODID'
    end
    object OracleDataSet3ID_1: TFloatField
      FieldName = 'ID_1'
      Required = True
    end
    object OracleDataSet3TYPE2: Twidestringfield
      FieldName = 'TYPE'
      Size = 256
    end
    object OracleDataSet3ADDITIONALTYPE: Twidestringfield
      FieldName = 'ADDITIONALTYPE'
      Size = 32
    end
    object OracleDataSet3WITHDRAWTYPE: Twidestringfield
      FieldName = 'WITHDRAWTYPE'
      Size = 32
    end
    object OracleDataSet3DATEINTERVAL: TIntegerField
      FieldName = 'DATEINTERVAL'
    end
  end
end
