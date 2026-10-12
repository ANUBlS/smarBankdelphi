object SFDataModule: TSFDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 696
  object EnabledFieldsData: TOracleDataSet
    SQL.Strings = (
      'select seqno, fieldname,fielddesc'
      'from cr_fields_list '
      'where visible=0'
      'order by seqno')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 184
    object EnabledFieldsDataSEQNO: TFloatField
      FieldName = 'SEQNO'
      Required = True
    end
    object EnabledFieldsDataFIELDNAME: TWideStringField
      FieldName = 'FIELDNAME'
      Required = True
      Size = 64
    end
    object EnabledFieldsDataFIELDDESC: TWideStringField
      FieldName = 'FIELDDESC'
      Required = True
      Size = 128
    end
  end
  object DSEnabledFieldsData: TDataSource
    DataSet = EnabledFieldsData
    Left = 208
    Top = 232
  end
end
