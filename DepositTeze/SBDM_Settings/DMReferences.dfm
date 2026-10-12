object DataModReferences: TDataModReferences
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 484
  Width = 637
  object TVSubItems: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   *'
      '  From'
      '     SBCM_References'
      '   Where'
      '    ParentID =:ParentID')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A0050004100520045004E005400490044000300
      00000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 72
    Top = 8
    object TVSubItemsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object TVSubItemsNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object TVSubItemsLNAME: TStringField
      FieldName = 'LNAME'
      Size = 128
    end
    object TVSubItemsPARENTID: TFloatField
      FieldName = 'PARENTID'
      Required = True
    end
    object TVSubItemsVALUE: TStringField
      FieldName = 'VALUE'
      Size = 556
    end
    object TVSubItemsSOURCELIST: TStringField
      FieldName = 'SOURCELIST'
      Size = 2048
    end
  end
  object ReferLink: TOracleDataSet
    SQL.Strings = (
      'Select * From  SBCM_References')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 224
    Top = 16
    object ReferLinkID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ReferLinkNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object ReferLinkLNAME: TStringField
      FieldName = 'LNAME'
      Size = 128
    end
    object ReferLinkPARENTID: TFloatField
      FieldName = 'PARENTID'
      Required = True
    end
    object ReferLinkVALUE: TStringField
      FieldName = 'VALUE'
      Size = 556
    end
    object ReferLinkSOURCELIST: TStringField
      FieldName = 'SOURCELIST'
      Size = 2048
    end
  end
  object ReferPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'sbcm_rpdepository'
    Left = 24
    Top = 80
  end
end
