object CrPRDataModule: TCrPRDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 480
  Width = 696
  object CalculatorPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CR_CALCULATOR'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Left = 152
    Top = 80
  end
  object IntCache: TOracleDataSet
    SQL.Strings = (
      'select '
      '            *'
      '  from'
      '            CR_INTCACHE'
      'order by :OrderField')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A004F0052004400450052004600490045004C00
      440001000000050000004E414D450000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000016000000040000004900440001000000000010000000430055005200
      520045004E00430059000100000000001400000042004F004F0052004F005700
      45005200490044000100000000001C0000004E0055004D004200450052004F00
      4600430052004500440049005400010000000000100000005500530052004700
      52004F0055005000010000000000100000004200520041004E00430048004900
      4400010000000000080000005500530049004400010000000000180000004300
      5500530054004F004D0045005200540059005000450001000000000018000000
      50004500520053004F004E0041004C0054005900500045000100000000001400
      0000430052004500440049005400540059005000450001000000000018000000
      530054004F005000430041004C00430044004100540045000100000000000800
      000052004500530054000100000000001800000049004E005400450052004500
      5300540052004500530054000100000000000E00000044005500450052004500
      530054000100000000001E00000044005500450049004E005400450052004500
      5300540052004500530054000100000000001A00000043004F004E0054005200
      4100430054004100430043004E004F000100000000001E000000500045004E00
      41004C005400590049004E005400450052004500530054000100000000001000
      0000560041004C005F004E0041004D004500010000000000080000004E004100
      4D0045000100000000001000000049004E005400450052004500530054000100
      000000001600000044005500450049004E005400450052004500530054000100
      000000001600000054005200500052004F004300450053005300450044000100
      00000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 96
    object IntCacheNUMBEROFCREDIT: TWideStringField
      DefaultExpression = #8470
      DisplayLabel = #8470
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object IntCacheCONTRACTACCNO: TWideStringField
      DisplayLabel = #1065#1077#1089#1072#1073' -'#1099#1085' '#8470
      FieldName = 'CONTRACTACCNO'
      Size = 110
    end
    object IntCacheVAL_NAME: TWideStringField
      DisplayLabel = '$'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object IntCacheNAME: TWideStringField
      DisplayLabel = #1041#1086#1088#1078#1072#1083#1072#1085' '
      FieldName = 'NAME'
      Size = 64
    end
    object IntCacheREST: TFloatField
      DisplayLabel = #1071#1089#1072#1089' '#1073#1086#1088#1078
      FieldName = 'REST'
      Required = True
    end
    object IntCacheINTERESTREST: TFloatField
      DisplayLabel = #1041#1086#1088#1078' '#1094#1079#1088#1103' %'
      FieldName = 'INTERESTREST'
      Required = True
    end
    object IntCacheDUEREST: TFloatField
      DisplayLabel = #1069#1077#1078#1080#1082#1084#1080#1096' '#1073#1086#1088#1078
      FieldName = 'DUEREST'
      Required = True
    end
    object IntCacheDUEINTERESTREST: TFloatField
      DisplayLabel = #1069#1077#1078#1080#1082#1084#1080#1096' '#1073#1086#1088#1078' %'
      FieldName = 'DUEINTERESTREST'
      Required = True
    end
    object IntCacheBRANCHID: TFloatField
      FieldName = 'BRANCHID'
      Required = True
      Visible = False
    end
    object IntCacheUSID: TFloatField
      FieldName = 'USID'
      Required = True
      Visible = False
    end
    object IntCacheUSRGROUP: TFloatField
      FieldName = 'USRGROUP'
      Required = True
      Visible = False
    end
    object IntCacheSTOPCALCDATE: TDateTimeField
      FieldName = 'STOPCALCDATE'
      Visible = False
    end
    object IntCacheBOOROWERID: TFloatField
      FieldName = 'BOOROWERID'
      Required = True
      Visible = False
    end
    object IntCacheID: TFloatField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object IntCacheCURRENCY: TFloatField
      FieldName = 'CURRENCY'
      Required = True
      Visible = False
    end
    object IntCacheINTEREST: TFloatField
      DisplayLabel = #1071'.'#1041'. '#1065#1077#1089#1072#1073#1083#1072#1085#1099#1073
      FieldName = 'INTEREST'
      Required = True
    end
    object IntCacheDUEINTEREST: TFloatField
      DisplayLabel = #1069'.'#1041'. '#1065#1077#1089#1072#1073#1083#1072#1085#1099#1073
      FieldName = 'DUEINTEREST'
      Required = True
    end
    object IntCacheTRPROCESSED: TFloatField
      FieldName = 'TRPROCESSED'
      Required = True
      Visible = False
    end
    object IntCacheCUSTOMERTYPE: TFloatField
      FieldName = 'CUSTOMERTYPE'
      Required = True
      Visible = False
    end
    object IntCachePERSONALTYPE: TFloatField
      FieldName = 'PERSONALTYPE'
      Required = True
      Visible = False
    end
    object IntCacheCREDITTYPE: TFloatField
      FieldName = 'CREDITTYPE'
      Required = True
      Visible = False
    end
    object IntCachePENALTYINTEREST: TFloatField
      FieldName = 'PENALTYINTEREST'
    end
  end
  object DataSrcIntCache: TDataSource
    DataSet = IntCache
    Left = 40
    Top = 152
  end
  object cr_autoexp: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'cr_autoexp'
    Cursor = crSQLWait
    Left = 160
    Top = 152
  end
end
