object DMCorrectorCardPer: TDMCorrectorCardPer
  OldCreateOrder = False
  Height = 480
  Width = 696
  object TranchesDatSrc: TDataSource
    DataSet = Tranches
    Left = 32
    Top = 24
  end
  object Tranches: TOracleDataSet
    SQL.Strings = (
      '/* Formatted on 2007/06/10 23:21 (Formatter Plus v4.8.6) */'
      'SELECT ID, tranchedate, trancheamount'
      '  FROM cm_tranches'
      ' WHERE creditid = :crdid'
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A00430052004400490044000300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      0500000003000000040000004900440001000000000016000000540052004100
      4E0043004800450044004100540045000100000000001A000000540052004100
      4E0043004800450041004D004F0055004E005400010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 112
    Top = 25
    object TranchesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object TranchesTRANCHEDATE: TDateTimeField
      FieldName = 'TRANCHEDATE'
      Required = True
    end
    object TranchesTRANCHEAMOUNT: TFloatField
      FieldName = 'TRANCHEAMOUNT'
      Required = True
    end
  end
  object RestsDatSrc: TDataSource
    DataSet = Rests
    Left = 32
    Top = 90
  end
  object Rests: TOracleDataSet
    SQL.Strings = (
      '/* Formatted on 2007/06/10 23:39 (Formatter Plus v4.8.6) */'
      'SELECT rowid,hdate,tranchid, rest, intrest,partkey,cardid'
      '  FROM cm_cardrest_curr_state'
      ' WHERE tranchid = :trid'
      'UNION'
      'SELECT rowid,hdate,tranchid, rest, intrest,partkey,cardid'
      '  FROM cm_cardrest_prev_state'
      ' WHERE tranchid = :trid'
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A00540052004900440003000000000000000000
      0000}
    Session = sboapiDataModule.SBSession
    BeforePost = RestsBeforePost
    Left = 112
    Top = 90
    object RestsHDATE: TDateTimeField
      FieldName = 'HDATE'
    end
    object RestsTRANCHID: TFloatField
      FieldName = 'TRANCHID'
    end
    object RestsREST: TFloatField
      FieldName = 'REST'
    end
    object RestsINTREST: TFloatField
      FieldName = 'INTREST'
    end
    object RestsPARTKEY: TFloatField
      FieldName = 'PARTKEY'
    end
    object RestsCARDID: TFloatField
      FieldName = 'CARDID'
    end
    object Restscardsort: TStringField
      FieldKind = fkLookup
      FieldName = 'cardsort'
      LookupDataSet = cardsorts
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIPTION'
      KeyFields = 'CARDID'
      Lookup = True
    end
  end
  object Int: TOracleDataSet
    SQL.Strings = (
      '/* Formatted on 2007/06/10 23:53 (Formatter Plus v4.8.6) */'
      'SELECT rowid,hdate, tranchid, interest,partkey,cardid'
      '  FROM cm_cardintrest_curr_state'
      ' where  tranchid = :trid'
      'UNION'
      'SELECT rowid,hdate, tranchid, interest,partkey,cardid'
      '  FROM cm_cardintrest_prev_state'
      'where tranchid = :trid'
      ''
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A00540052004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      05000000050000000A0000004800440041005400450001000000000010000000
      5400520041004E0043004800490044000100000000001000000049004E005400
      450052004500530054000100000000000E00000050004100520054004B004500
      59000100000000000C000000430041005200440049004400010000000000}
    Session = sboapiDataModule.SBSession
    BeforePost = IntBeforePost
    Left = 112
    Top = 152
    object IntHDATE: TDateTimeField
      FieldName = 'HDATE'
    end
    object IntTRANCHID: TFloatField
      FieldName = 'TRANCHID'
    end
    object IntINTEREST: TFloatField
      FieldName = 'INTEREST'
    end
    object IntPARTKEY: TFloatField
      FieldName = 'PARTKEY'
    end
    object IntCARDID: TFloatField
      FieldName = 'CARDID'
    end
    object Intcardsort: TStringField
      FieldKind = fkLookup
      FieldName = 'cardsort'
      LookupDataSet = cardsorts
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIPTION'
      KeyFields = 'CARDID'
      Lookup = True
    end
  end
  object IntDatSrc: TDataSource
    DataSet = Int
    Left = 32
    Top = 152
  end
  object cardsorts: TOracleDataSet
    SQL.Strings = (
      'SELECT id,description'
      '  FROM cm_calc_cardsorts')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000002000000040000004900440001000000000016000000440045005300
      4300520049005000540049004F004E00010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 264
    Top = 24
    object cardsortsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object cardsortsDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 90
    end
  end
  object cardsortsDatSrc: TDataSource
    DataSet = cardsorts
    Left = 192
    Top = 24
  end
end
