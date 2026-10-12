object DMCardSeting: TDMCardSeting
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 696
  object Categories: TOracleDataSet
    SQL.Strings = (
      'SELECT id, description'
      '  FROM cm_categories')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 32
    object CategoriesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CategoriesDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 128
    end
  end
  object CategoriesDatSrc: TDataSource
    DataSet = Categories
    Left = 150
    Top = 32
  end
  object cardsorts: TOracleDataSet
    SQL.Strings = (
      'SELECT rowid,id, name, description,calcmethod'
      '  FROM cm_calc_cardsorts'
      'order by id')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 88
    object cardsortsID: TFloatField
      FieldName = 'ID'
    end
    object cardsortsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 35
    end
    object cardsortsDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 90
    end
    object cardsortsCALCMETHOD: TFloatField
      FieldName = 'CALCMETHOD'
    end
  end
  object cardsortsDatSrc: TDataSource
    DataSet = cardsorts
    Left = 149
    Top = 90
  end
  object cardsettings: TOracleDataSet
    SQL.Strings = (
      
        'SELECT rowid,cardid, beginperiod, endperiod, annualintrate, fixe' +
        'dday'
      '  FROM cm_calc_cardsettings'
      ''
      'where cardid = :cardid')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A00430041005200440049004400040000000000
      000000000000}
    Master = cardsorts
    MasterFields = 'ID'
    DetailFields = 'CARDID'
    Session = sboapiDataModule.SBSession
    Left = 45
    Top = 144
    object cardsettingsCARDID: TFloatField
      FieldName = 'CARDID'
      Required = True
    end
    object cardsettingsBEGINPERIOD: TFloatField
      FieldName = 'BEGINPERIOD'
    end
    object cardsettingsENDPERIOD: TFloatField
      FieldName = 'ENDPERIOD'
    end
    object cardsettingsANNUALINTRATE: TFloatField
      FieldName = 'ANNUALINTRATE'
    end
    object cardsettingsFIXEDDAY: TFloatField
      FieldName = 'FIXEDDAY'
    end
  end
  object cardsettingsDatSrc: TDataSource
    DataSet = cardsettings
    Left = 150
    Top = 144
  end
  object cardcustsettings: TOracleDataSet
    SQL.Strings = (
      'SELECT rowid,id, cardid, categoryid'
      '  FROM cm_calc_cardcustsettings'
      'where cardid = :cardid')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A00430041005200440049004400040000000000
      000000000000}
    Master = cardsorts
    MasterFields = 'ID'
    DetailFields = 'CARDID'
    Session = sboapiDataModule.SBSession
    Left = 46
    Top = 199
    object cardcustsettingsID: TFloatField
      FieldName = 'ID'
    end
    object cardcustsettingsCARDID: TFloatField
      FieldName = 'CARDID'
      Required = True
    end
    object cardcustsettingsCATEGORYID: TFloatField
      FieldName = 'CATEGORYID'
      Required = True
    end
    object cardcustsettingscategoryname: TWideStringField
      DisplayLabel = #1058#1103#1081#1080#1085#1072#1090#1099
      FieldKind = fkLookup
      FieldName = 'categoryname'
      LookupDataSet = Categories
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIPTION'
      KeyFields = 'CATEGORYID'
      Size = 255
      Lookup = True
    end
  end
  object cardcustsettingsDatSrc: TDataSource
    DataSet = cardcustsettings
    Left = 153
    Top = 203
  end
  object cm_cards: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'cm_cards'
    Left = 264
    Top = 40
  end
  object cardmethods: TOracleDataSet
    SQL.Strings = (
      'SELECT id, description'
      '  FROM cm_calc_cardmethods'
      'order by id')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 256
    object cardmethodsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object cardmethodsDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Required = True
      Size = 50
    end
  end
  object cardmethodsDatSrc: TDataSource
    DataSet = cardmethods
    Left = 160
    Top = 256
  end
end
