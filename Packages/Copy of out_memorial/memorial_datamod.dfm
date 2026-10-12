object memorial_DataModule: Tmemorial_DataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 696
  object OraclePackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'OUT_SB_MEMORIAL'
    Left = 248
    Top = 16
  end
  object DataSrcMain: TDataSource
    DataSet = ODSMain
    Left = 24
    Top = 8
  end
  object ODSMain: TOracleDataSet
    SQL.Strings = (
      'Select  * from out_Memorial_smart')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000150000000E0000004400420041004C005F0043004E00010000000000
      0E0000004B00420041004C005F0043004E000100000000000600000044004100
      5400010000000000100000004400490046004600520041005400450001000000
      0000080000004E0041004D004500010000000000040000004900440001000000
      00000A000000530048004900460052000100000000000E000000560041004C00
      5F0041004300430001000000000018000000430055005200520045004E004300
      5900490044005F0043000100000000000E00000041004D004D004F0055004E00
      54000100000000001200000041004D004D004F0055004E0054005F0043000100
      00000000100000004C0041004D004D004F0055004E0054000100000000000A00
      00004F0050005F00490044000100000000000E00000044004500420049005400
      4F0052000100000000000E000000440045004200540049004E004E0001000000
      00000A00000044004E0041004D004500010000000000100000004B0052004500
      4400490054004F0052000100000000000E0000004B0052004500440049004E00
      4E000100000000000A0000004B004E0041004D00450001000000000008000000
      44004500420054000100000000000C0000004B00520045004400490054000100
      00000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 88
    Top = 8
    object ODSMainDBAL_CN: TFloatField
      FieldName = 'DBAL_CN'
      Required = True
    end
    object ODSMainKBAL_CN: TFloatField
      FieldName = 'KBAL_CN'
      Required = True
    end
    object ODSMainDAT: TDateTimeField
      FieldName = 'DAT'
      Required = True
    end
    object ODSMainDIFFRATE: TFloatField
      FieldName = 'DIFFRATE'
    end
    object ODSMainNAME: TWideStringField
      FieldName = 'NAME'
      Size = 255
    end
    object ODSMainID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSMainSHIFR: TIntegerField
      FieldName = 'SHIFR'
    end
    object ODSMainVAL_ACC: TWideStringField
      FieldName = 'VAL_ACC'
      Size = 4000
    end
    object ODSMainCURRENCYID_C: TWideStringField
      FieldName = 'CURRENCYID_C'
      Size = 4000
    end
    object ODSMainAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
      Required = True
    end
    object ODSMainAMMOUNT_C: TFloatField
      FieldName = 'AMMOUNT_C'
      Required = True
    end
    object ODSMainLAMMOUNT: TFloatField
      FieldName = 'LAMMOUNT'
      Required = True
    end
    object ODSMainOP_ID: TFloatField
      FieldName = 'OP_ID'
    end
    object ODSMainDEBITOR: TWideStringField
      FieldName = 'DEBITOR'
      Required = True
    end
    object ODSMainDEBTINN: TFloatField
      FieldName = 'DEBTINN'
    end
    object ODSMainDNAME: TWideStringField
      FieldName = 'DNAME'
      Size = 90
    end
    object ODSMainKREDITOR: TWideStringField
      FieldName = 'KREDITOR'
      Required = True
    end
    object ODSMainKREDINN: TFloatField
      FieldName = 'KREDINN'
    end
    object ODSMainKNAME: TWideStringField
      FieldName = 'KNAME'
      Size = 90
    end
    object ODSMainDEBT: TFloatField
      FieldName = 'DEBT'
      Required = True
    end
    object ODSMainKREDIT: TFloatField
      FieldName = 'KREDIT'
      Required = True
    end
  end
  object ODSRate: TOracleDataSet
    SQL.Strings = (
      'Select  Valute,Valu_Name from aValute')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C000000560041004C005500540045000100000000001200
      0000560041004C0055005F004E0041004D004500010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 88
    Top = 56
    object ODSRateVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object ODSRateVALU_NAME: TWideStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
  end
  object DataSrcRate: TDataSource
    DataSet = ODSRate
    Left = 24
    Top = 56
  end
  object BankInfo: TOracleDataSet
    SQL.Strings = (
      'Select'
      ' Bank,INN,logo from BankInfo')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000008000000420041004E004B00010000000000060000004900
      4E004E00010000000000080000004C004F0047004F00000000000000}
    Session = sboapiDataModule.SBSession
    Left = 88
    Top = 104
    object BankInfoBANK: TWideStringField
      FieldName = 'BANK'
      Size = 80
    end
    object BankInfoINN: TWideStringField
      FieldName = 'INN'
      Size = 15
    end
    object BankInfoLOGO: TBlobField
      FieldName = 'LOGO'
      BlobType = ftOraBlob
    end
  end
  object ReferDataSet: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  RowID,Balance From Out_Memorial')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000010000000E000000420041004C0041004E0043004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 224
    object ReferDataSetBALANCE: TFloatField
      FieldName = 'BALANCE'
      Required = True
    end
  end
  object DataSrcRefer: TDataSource
    DataSet = ReferDataSet
    Left = 120
    Top = 224
  end
  object UsersList: TOracleDataSet
    SQL.Strings = (
      'select '
      '  ID ,'
      '  NAME'
      'from USER$')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 248
    Top = 168
    object UsersListID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object UsersListNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
  end
  object DataSrcUsersList: TDataSource
    DataSet = UsersList
    Left = 248
    Top = 120
  end
  object Branches: TOracleDataSet
    SQL.Strings = (
      'select * from filial')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000140000004B004F0044005F00460049004C00490041004C00
      010000000000}
    Session = sboapiDataModule.SBSession
    Left = 160
    Top = 88
    object BranchesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object BranchesNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
    object BranchesKOD_FILIAL: TWideStringField
      FieldName = 'KOD_FILIAL'
      Size = 6
    end
  end
  object DataSrcBranches: TDataSource
    DataSet = Branches
    Left = 160
    Top = 144
  end
end
