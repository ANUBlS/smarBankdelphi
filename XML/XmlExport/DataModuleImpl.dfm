object DataModuleMain: TDataModuleMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 194
  Top = 107
  Height = 378
  Width = 448
  object DataSrcTagSettings: TDataSource
    DataSet = TagSettings
    Left = 40
    Top = 24
  end
  object TagSettings: TTable
    BeforeOpen = TagSettingsBeforeOpen
    DatabaseName = 'XML'
    FieldDefs = <
      item
        Name = 'FieldName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'TagFirst'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'TagLast'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'TagPrefix'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'TagSuffix'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'AlphaField'
        DataType = ftBoolean
      end
      item
        Name = 'FieldGroup'
        DataType = ftInteger
      end
      item
        Name = 'Num'
        DataType = ftInteger
      end
      item
        Name = 'UseField'
        DataType = ftBoolean
      end
      item
        Name = 'ParentGroup'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'TagSettingsIndex1'
        Fields = 'FieldName'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'TagSettings.DB'
    Left = 40
    Top = 80
    object TagSettingsFieldName: TStringField
      FieldName = 'FieldName'
      Size = 255
    end
    object TagSettingsTagFirst: TStringField
      FieldName = 'TagFirst'
      Size = 255
    end
    object TagSettingsTagLast: TStringField
      FieldName = 'TagLast'
      Size = 255
    end
    object TagSettingsTagPrefix: TStringField
      FieldName = 'TagPrefix'
      Size = 255
    end
    object TagSettingsTagSuffix: TStringField
      FieldName = 'TagSuffix'
      Size = 255
    end
    object TagSettingsAlphaField: TBooleanField
      FieldName = 'AlphaField'
    end
    object TagSettingsFieldGroup: TIntegerField
      FieldName = 'FieldGroup'
    end
    object TagSettingsNum: TIntegerField
      FieldName = 'Num'
    end
    object TagSettingsUseField: TBooleanField
      FieldName = 'UseField'
    end
    object TagSettingsParentGroup: TIntegerField
      FieldName = 'ParentGroup'
    end
  end
  object TempTable: TTable
    Left = 136
    Top = 160
  end
  object DataSrcDecoding: TDataSource
    DataSet = UnicodeSettings
    Left = 216
    Top = 48
  end
  object UnicodeSettings: TTable
    BeforeOpen = UnicodeSettingsBeforeOpen
    AfterScroll = UnicodeSettingsAfterScroll
    OnPostError = UnicodeSettingsPostError
    DatabaseName = 'XML'
    TableName = 'UnicodeSettings.DB'
    Left = 216
    Top = 104
    object UnicodeSettingsInvalidCharCode: TIntegerField
      FieldName = 'InvalidCharCode'
    end
    object UnicodeSettingsValidCharCode: TIntegerField
      FieldName = 'ValidCharCode'
    end
    object UnicodeSettingsValidChar: TTntStringField
      FieldKind = fkCalculated
      FieldName = 'ValidChar'
      Size = 0
      Calculated = True
    end
    object UnicodeSettingsInvalidChar: TTntStringField
      FieldKind = fkCalculated
      FieldName = 'InvalidChar'
      Calculated = True
    end
  end
  object EXPORT: TTable
    DatabaseName = 'XML'
    Left = 304
    Top = 240
  end
  object TagSettings__: TQuery
    BeforeOpen = TagSettings__BeforeOpen
    DatabaseName = 'XML'
    SQL.Strings = (
      'select * from TagSettings.db'
      'order by Num')
    Left = 48
    Top = 160
  end
end
