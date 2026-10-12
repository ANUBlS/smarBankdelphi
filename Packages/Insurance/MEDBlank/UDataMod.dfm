object MedBDataMod: TMedBDataMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 191
  Top = 103
  Height = 480
  Width = 696
  object ODSMedical: TOracleDataSet
    SQL.Strings = (
      'select im.rowid, im.* from ins_medical im'
      'where'
      'id = :ID')
    Variables.Data = {0300000001000000030000003A4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000001B00000002000000494401000000000006000000454D504E554D0100
      000000000600000047524F5550410100000000000E00000047524F555041434F
      5645524147450100000000000600000047524F5550420100000000000E000000
      47524F555042434F5645524147450100000000000600000047524F5550430100
      000000000E00000047524F555043434F5645524147450100000000000A000000
      494E5350524F4752414D01000000000007000000534552565F49440100000000
      0009000000424547494E4441544501000000000007000000454E444441544501
      000000000007000000454D50535F494401000000000009000000494E50415453
      4552560100000000000A0000004F555450415453455256010000000000070000
      00454D45524149440100000000000A0000005052455343445255475301000000
      00000800000044454E54534552560100000000000A00000050524F5048595345
      52560100000000000900000050524F504859494E530100000000000A00000053
      414E41544F5249554D0100000000000A0000004348494C444249525448010000
      0000000D000000505249564154454452534552560100000000000B0000004D45
      444943414C455641430100000000000800000050524F5354494E530100000000
      00110000004348454D4F524144494F5448455241505901000000000006000000
      4B4C495F4944010000000000}
    Session = sboapiDataModule.SBSession
    Left = 56
    Top = 32
    object ODSMedicalID: TIntegerField
      FieldName = 'ID'
    end
    object ODSMedicalEMPNUM: TIntegerField
      FieldName = 'EMPNUM'
    end
    object ODSMedicalGROUPA: TIntegerField
      FieldName = 'GROUPA'
    end
    object ODSMedicalGROUPACOVERAGE: TStringField
      FieldName = 'GROUPACOVERAGE'
      Size = 1024
    end
    object ODSMedicalGROUPB: TIntegerField
      FieldName = 'GROUPB'
    end
    object ODSMedicalGROUPBCOVERAGE: TStringField
      FieldName = 'GROUPBCOVERAGE'
      Size = 1024
    end
    object ODSMedicalGROUPC: TIntegerField
      FieldName = 'GROUPC'
    end
    object ODSMedicalGROUPCCOVERAGE: TStringField
      FieldName = 'GROUPCCOVERAGE'
      Size = 1024
    end
    object ODSMedicalINSPROGRAM: TStringField
      FieldName = 'INSPROGRAM'
      Size = 256
    end
    object ODSMedicalSERV_ID: TIntegerField
      FieldName = 'SERV_ID'
    end
    object ODSMedicalBEGINDATE: TDateTimeField
      FieldName = 'BEGINDATE'
    end
    object ODSMedicalENDDATE: TDateTimeField
      FieldName = 'ENDDATE'
    end
    object ODSMedicalEMPS_ID: TStringField
      FieldName = 'EMPS_ID'
      Size = 1
    end
    object ODSMedicalINPATSERV: TIntegerField
      Tag = 777
      FieldName = 'INPATSERV'
    end
    object ODSMedicalOUTPATSERV: TIntegerField
      Tag = 777
      FieldName = 'OUTPATSERV'
    end
    object ODSMedicalEMERAID: TIntegerField
      Tag = 777
      FieldName = 'EMERAID'
    end
    object ODSMedicalPRESCDRUGS: TIntegerField
      Tag = 777
      FieldName = 'PRESCDRUGS'
    end
    object ODSMedicalDENTSERV: TIntegerField
      Tag = 777
      FieldName = 'DENTSERV'
    end
    object ODSMedicalPROPHYSERV: TIntegerField
      Tag = 777
      FieldName = 'PROPHYSERV'
    end
    object ODSMedicalPROPHYINS: TIntegerField
      Tag = 777
      FieldName = 'PROPHYINS'
    end
    object ODSMedicalSANATORIUM: TIntegerField
      Tag = 777
      FieldName = 'SANATORIUM'
    end
    object ODSMedicalCHILDBIRTH: TIntegerField
      Tag = 777
      FieldName = 'CHILDBIRTH'
    end
    object ODSMedicalPRIVATEDRSERV: TIntegerField
      Tag = 777
      FieldName = 'PRIVATEDRSERV'
    end
    object ODSMedicalMEDICALEVAC: TIntegerField
      Tag = 777
      FieldName = 'MEDICALEVAC'
    end
    object ODSMedicalPROSTINS: TIntegerField
      Tag = 777
      FieldName = 'PROSTINS'
    end
    object ODSMedicalCHEMORADIOTHERAPY: TIntegerField
      Tag = 777
      FieldName = 'CHEMORADIOTHERAPY'
    end
    object ODSMedicalKLI_ID: TIntegerField
      FieldName = 'KLI_ID'
      Required = True
    end
  end
  object ODSCusts: TOracleDataSet
    SQL.Strings = (
      'select * from ('
      'SELECT a.id, a.surname || '#39'  '#39' ||a.name name, a.ADDRESS'
      '  FROM ins_customers a'
      '  order by a.surname'
      ''
      ')')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000040000004E414D4501000000
      00000700000041444452455353010000000000}
    Session = sboapiDataModule.SBSession
    Left = 168
    Top = 32
    object ODSCustsID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ODSCustsNAME: TStringField
      FieldName = 'NAME'
      Size = 258
    end
    object ODSCustsADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 1024
    end
  end
  object DSCusts: TDataSource
    DataSet = ODSCusts
    Left = 168
    Top = 80
  end
  object ODSMedServices: TOracleDataSet
    SQL.Strings = (
      'select * from ins_dict_medicalservices'
      '')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 264
    Top = 176
    object ODSMedServicesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSMedServicesNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object DSMedServices: TDataSource
    DataSet = ODSMedServices
    Left = 264
    Top = 232
  end
  object ODSEmployees: TOracleDataSet
    SQL.Strings = (
      'select ie.rowid, ie.* from ins_employees ie'
      'where med_id = :med_id')
    Variables.Data = {0300000001000000070000003A4D45445F4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000009000000020000004944010000000000060000004D45445F49440100
      00000000040000004E414D45010000000000070000005355524E414D45010000
      0000000A0000004641544845524E414D450100000000000B000000444154454F
      46424952544801000000000003000000534558010000000000060000004F4343
      5F49440100000000000600000047524F55505F010000000000}
    Session = sboapiDataModule.SBSession
    AfterInsert = ODSEmployeesAfterInsert
    Left = 248
    Top = 33
    object ODSEmployeesID: TIntegerField
      FieldName = 'ID'
    end
    object ODSEmployeesMED_ID: TIntegerField
      FieldName = 'MED_ID'
      Required = True
    end
    object ODSEmployeesNAME: TStringField
      FieldName = 'NAME'
      Size = 256
    end
    object ODSEmployeesSURNAME: TStringField
      FieldName = 'SURNAME'
      Size = 256
    end
    object ODSEmployeesFATHERNAME: TStringField
      FieldName = 'FATHERNAME'
      Size = 256
    end
    object ODSEmployeesDATEOFBIRTH: TDateTimeField
      FieldName = 'DATEOFBIRTH'
      EditMask = '!90/90/00;1;_'
    end
    object ODSEmployeesSEX: TIntegerField
      FieldName = 'SEX'
    end
    object ODSEmployeesOCC_ID: TIntegerField
      FieldName = 'OCC_ID'
    end
    object ODSEmployeesGROUP_: TStringField
      FieldName = 'GROUP_'
      Size = 5
    end
    object ODSEmployeesOCCCombo: TStringField
      FieldKind = fkLookup
      FieldName = 'OCCCombo'
      LookupDataSet = ODSOccupation
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'OCC_ID'
      Lookup = True
    end
  end
  object DSEmployees: TDataSource
    DataSet = ODSEmployees
    Left = 248
    Top = 81
  end
  object ODSOccupation: TOracleDataSet
    SQL.Strings = (
      'select * from ins_dict_occupations')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 360
    Top = 176
    object ODSOccupationID: TFloatField
      FieldName = 'ID'
    end
    object ODSOccupationNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object DSOccupation: TDataSource
    DataSet = ODSOccupation
    Left = 360
    Top = 232
  end
  object DSMedical: TDataSource
    DataSet = ODSMedical
    Left = 56
    Top = 80
  end
  object OPCOMMON: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_COMMON'
    Left = 176
    Top = 176
  end
end
