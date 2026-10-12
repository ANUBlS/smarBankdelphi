object DataModMemorial: TDataModMemorial
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 261
  Top = 110
  Height = 375
  Width = 544
  object OraclePackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SB_MEMORIAL'
    Left = 240
    Top = 16
  end
  object DataSrcMain: TDataSource
    DataSet = ODSMain
    Left = 24
    Top = 8
  end
  object ODSMain: TOracleDataSet
    SQL.Strings = (
      'Select  * from Memorial_smart')
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    OnCalcFields = ODSMainCalcFields
    Left = 88
    Top = 8
    object ODSMainDBAL_CN: TFloatField
      FieldName = 'DBAL_CN'
    end
    object ODSMainKBAL_CN: TFloatField
      FieldName = 'KBAL_CN'
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
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 88
    Top = 56
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
    Session = sboapiDataModule.SBSession
    Left = 88
    Top = 104
    object BankInfoINN: TWideStringField
      FieldName = 'INN'
      Size = 15
    end
    object BankInfoBANK: TWideStringField
      FieldName = 'BANK'
      Size = 80
    end
    object BankInfoLOGO: TBlobField
      FieldName = 'LOGO'
      BlobType = ftBlob
    end
  end
  object ReferDataSet: TOracleDataSet
    SQL.Strings = (
      'Select'
      '  RowID,Balance From Memorial')
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 224
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
    Session = sboapiDataModule.SBSession
    Left = 248
    Top = 168
    object UsersListID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object UsersListNAME: TWideStringField
      FieldName = 'NAME'
      Size = 32
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
  end
  object DataSrcBranches: TDataSource
    DataSet = Branches
    Left = 160
    Top = 144
  end
  object ODSSelected: TOracleDataSet
    SQL.Strings = (
      'select m.rowid,m.* from memorial_rep m')
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 160
    object ODSSelectedDBAL_CN: TFloatField
      FieldName = 'DBAL_CN'
    end
    object ODSSelectedKBAL_CN: TFloatField
      FieldName = 'KBAL_CN'
    end
    object ODSSelectedDAT: TDateTimeField
      FieldName = 'DAT'
    end
    object ODSSelectedDIFFRATE: TFloatField
      FieldName = 'DIFFRATE'
    end
    object ODSSelectedNAME: TWideStringField
      FieldName = 'NAME'
      Size = 255
    end
    object ODSSelectedID: TFloatField
      FieldName = 'ID'
    end
    object ODSSelectedSHIFR: TIntegerField
      FieldName = 'SHIFR'
    end
    object ODSSelectedVAL_ACC: TWideStringField
      FieldName = 'VAL_ACC'
      Size = 4000
    end
    object ODSSelectedCURRENCYID_C: TWideStringField
      FieldName = 'CURRENCYID_C'
      Size = 4000
    end
    object ODSSelectedAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSSelectedAMMOUNT_C: TFloatField
      FieldName = 'AMMOUNT_C'
    end
    object ODSSelectedLAMMOUNT: TFloatField
      FieldName = 'LAMMOUNT'
    end
    object ODSSelectedOP_ID: TFloatField
      FieldName = 'OP_ID'
    end
    object ODSSelectedDEBITOR: TWideStringField
      FieldName = 'DEBITOR'
    end
    object ODSSelectedDEBTINN: TFloatField
      FieldName = 'DEBTINN'
    end
    object ODSSelectedDNAME: TWideStringField
      FieldName = 'DNAME'
      Size = 90
    end
    object ODSSelectedKREDITOR: TWideStringField
      FieldName = 'KREDITOR'
    end
    object ODSSelectedKREDINN: TFloatField
      FieldName = 'KREDINN'
    end
    object ODSSelectedKNAME: TWideStringField
      FieldName = 'KNAME'
      Size = 90
    end
    object ODSSelectedDEBT: TFloatField
      FieldName = 'DEBT'
    end
    object ODSSelectedKREDIT: TFloatField
      FieldName = 'KREDIT'
    end
  end
  object DSSelected: TDataSource
    DataSet = ODSSelected
    Left = 208
    Top = 232
  end
end
