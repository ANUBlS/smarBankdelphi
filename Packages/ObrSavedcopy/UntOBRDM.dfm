object DataModMain: TDataModMain
  OldCreateOrder = False
  Height = 387
  Width = 503
  object ODSLocate: TOracleDataSet
    SQL.Strings = (
      'Select   *    from  Turn_Smart'
      ' ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000E0000000C0000004100430043005F004E004F000100000000000E00
      0000420041004C004E0041004D00450001000000000010000000560041004C00
      5F004E0041004D0045000100000000000A0000004F00420052005F0044000100
      000000000A0000004F00420052005F004B000100000000001200000050004F00
      4B005F004F00420052005F0044000100000000001200000050004F004B005F00
      4F00420052005F004B000100000000000A00000053005F004100430054000100
      000000000A00000053005F005000410053000100000000000A00000050005F00
      4100430054000100000000000A00000050005F00500041005300010000000000
      100000004C0041005300540044004100540045000100000000000C0000004200
      41004C005F0043004E000100000000000C000000540049005000410043004300
      010000000000}
    Session = sboapiDataModule.SBSession
    Left = 93
    Top = 8
    object ODSLocateACC_NO: TWideStringField
      DisplayLabel = 'Hesab '#8470
      FieldName = 'ACC_NO'
      Size = 28
    end
    object ODSLocateBALNAME: TWideStringField
      DisplayLabel = 'Hesab'#305'n ad'#305
      FieldName = 'BALNAME'
      Size = 150
    end
    object ODSLocateVAL_NAME: TWideStringField
      DisplayLabel = 'Valyuta'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object ODSLocateOBR_D: TFloatField
      DisplayLabel = 'Debet d'#246'vriyy'#601
      FieldName = 'OBR_D'
    end
    object ODSLocateOBR_K: TFloatField
      DisplayLabel = 'Kredit d'#246'vriyy'#601
      FieldName = 'OBR_K'
    end
    object ODSLocatePOK_OBR_D: TFloatField
      DisplayLabel = 'Debet d'#246'vriyy'#601' Ekv'
      FieldName = 'POK_OBR_D'
    end
    object ODSLocatePOK_OBR_K: TFloatField
      DisplayLabel = 'Kredit d'#246'vriyy'#601' Ekv'
      FieldName = 'POK_OBR_K'
    end
    object ODSLocateS_ACT: TFloatField
      DisplayLabel = 'Qal'#305'q aktiv'
      FieldName = 'S_ACT'
    end
    object ODSLocateS_PAS: TFloatField
      DisplayLabel = 'Qal'#305'q passiv'
      FieldName = 'S_PAS'
    end
    object ODSLocateP_ACT: TFloatField
      DisplayLabel = 'Qal'#305'q aktiv ekv'
      FieldName = 'P_ACT'
    end
    object ODSLocateP_PAS: TFloatField
      DisplayLabel = 'Qal'#305'q passiv ekv'
      FieldName = 'P_PAS'
    end
    object ODSLocateLASTDATE: TDateTimeField
      DisplayLabel = 'Tarix'
      FieldName = 'LASTDATE'
    end
    object ODSLocateBAL_CN: TFloatField
      DisplayLabel = 'Balans Hesab'#305'n'#305'n '#8470
      FieldName = 'BAL_CN'
    end
  end
  object DataSrcLocate: TDataSource
    DataSet = ODSLocate
    Left = 19
    Top = 8
  end
  object OpackMain: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SB_MTOUTVIEW'
    Left = 248
    Top = 8
  end
  object ODSSysKod: TOracleDataSet
    SQL.Strings = (
      'select  valu_name ,valute from avalute')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 77
    Top = 54
  end
  object DataSrcSysKod: TDataSource
    DataSet = ODSSysKod
    Left = 19
    Top = 54
  end
  object ODSSum: TOracleDataSet
    SQL.Strings = (
      
        'SELECT  Sum(s_act),Sum(p_act),Sum(s_pas),Sum(p_pas),Sum(Obr_k),S' +
        'um(Obr_d),Sum(pok_Obr_k),Sum(pok_Obr_d)  from  Turn_Smart')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 74
    Top = 116
  end
  object DataSrcSum: TDataSource
    DataSet = ODSSum
    Left = 18
    Top = 116
  end
  object DataSrcValute: TDataSource
    DataSet = ODSValute
    Left = 18
    Top = 161
  end
  object ODSValute: TOracleDataSet
    SQL.Strings = (
      'Select '
      '   Currency.Val_Name as Name'
      '  ,Rate.Ostat as DefaultRate'
      '  From AValute Currency,Operkurs Rate'
      '  Where   (Currency.Valute=Rate.Val_Kod)'
      '         And (Rate.Dat=:ADate)')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00410044004100540045000C00000000000000
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 76
    Top = 162
  end
  object BranchesData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  ID ,'
      '  Name'
      'from'
      '  Filial'
      ''
      '  '
      ' ')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 160
    Top = 96
  end
end
