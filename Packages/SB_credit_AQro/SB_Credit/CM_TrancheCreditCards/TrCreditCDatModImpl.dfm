object CreditCardDatMod: TCreditCardDatMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 173
  Top = 157
  Height = 486
  Width = 710
  object CreditCards: TOracleDataSet
    SQL.Strings = (
      'select id from cm_active_credits '
      
        '                where CM_CARDS.iscreditcards(id)=1 and CM_CARDS.' +
        'Get_CustOstat(id)<0')
    Session = CMDataModule.CMSession
    Left = 32
    Top = 64
    object CreditCardsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
  end
  object CreditCardsDatSrc: TDataSource
    DataSet = CreditCards
    Left = 32
    Top = 112
  end
  object Transactions: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   A.ACC_NO as DebitAccNo, '
      '   D.VAL_NAME as DebitCurrency, '
      '   C.ACC_NO as CreditAccNo, '
      '   T.Ostat,'
      '   E.VAL_NAME  as CreditCurrency,'
      '   B.TRDATE ,'
      '   B.CANPROCESS , '
      '   B.INBALANCECHAR , '
      '   B.FLAGS , '
      '   B.DEBITAMOUNT , '
      '   B.CREDITAMOUNT , '
      '   B.NATAMOUNT ,'
      '   B.TrDescription'
      'FROM'
      '   SB_ACCOUNT A'
      ' , SB_AVALUTE D'
      ' , CM_TRANSACTIONS B'
      ' , SB_ACCOUNT C'
      ' , SB_AVALUTE E'
      ' ,SB_TENOSTAT T'
      'WHERE'
      '     (B.DEBITACCID = A.ID)'
      ' AND (D.VALUTE = A.VAL_ACC)'
      ' AND (B.CREDITACCID = C.ID)'
      ' AND (C.VAL_ACC = E.VALUTE)'
      ' and (T.ACC_ID = B.CREDITACCID)'
      ''
      ''
      'union '
      ''
      'SELECT'
      '   A.ACC_NO as DebitAccNo, '
      '   D.VAL_NAME as DebitCurrency, '
      '   C.ACC_NO as CreditAccNo, '
      '   T.Ostat,'
      '   E.VAL_NAME  as CreditCurrency,'
      '   B.TRDATE ,'
      '   B.CANPROCESS , '
      '   B.INBALANCECHAR , '
      '   B.FLAGS , '
      '   B.DEBITAMOUNT , '
      '   B.CREDITAMOUNT , '
      '   B.NATAMOUNT ,'
      '   B.TrDescription'
      'FROM'
      '   SBOUT_ACCOUNT A'
      ' , SB_AVALUTE D'
      ' , CM_TRANSACTIONS B'
      ' , SBOUT_ACCOUNT C'
      ' , SB_AVALUTE E'
      ' ,smart.out_TENOSTAT T'
      'WHERE'
      '     (B.DEBITACCID = A.ID)'
      ' AND (D.VALUTE = A.VAL_ACC)'
      ' AND (B.CREDITACCID = C.ID)'
      ' AND (C.VAL_ACC = E.VALUTE)'
      ' and (T.ACC_ID = B.CREDITACCID)'
      ''
      ''
      '')
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 144
    Top = 64
    object TransactionsDEBITACCNO: TStringField
      FieldName = 'DEBITACCNO'
      Required = True
    end
    object TransactionsDEBITCURRENCY: TStringField
      FieldName = 'DEBITCURRENCY'
      Size = 10
    end
    object TransactionsCREDITACCNO: TStringField
      FieldName = 'CREDITACCNO'
      Required = True
    end
    object TransactionsOSTAT: TFloatField
      FieldName = 'OSTAT'
    end
    object TransactionsCREDITCURRENCY: TStringField
      FieldName = 'CREDITCURRENCY'
      Size = 10
    end
    object TransactionsTRDATE: TDateTimeField
      FieldName = 'TRDATE'
      Required = True
    end
    object TransactionsCANPROCESS: TFloatField
      FieldName = 'CANPROCESS'
      Required = True
    end
    object TransactionsINBALANCECHAR: TFloatField
      FieldName = 'INBALANCECHAR'
    end
    object TransactionsFLAGS: TFloatField
      FieldName = 'FLAGS'
      Required = True
    end
    object TransactionsDEBITAMOUNT: TFloatField
      FieldName = 'DEBITAMOUNT'
    end
    object TransactionsCREDITAMOUNT: TFloatField
      FieldName = 'CREDITAMOUNT'
    end
    object TransactionsNATAMOUNT: TFloatField
      FieldName = 'NATAMOUNT'
    end
    object TransactionsTRDESCRIPTION: TStringField
      FieldName = 'TRDESCRIPTION'
      Required = True
      Size = 255
    end
  end
  object TransactionsDatSrc: TDataSource
    DataSet = Transactions
    Left = 144
    Top = 112
  end
  object Controls: TOracleDataSet
    SQL.Strings = (
      'select p.numberofcredit,'
      
        '       cm_common.accountnumber_get(a.contractaccid) as contractn' +
        'o,'
      '       cm_common.accountrest_get(a.booroweraccid) as CustRest,'
      '       h.rest '
      'from cm_active_credits p,'
      '     cm_accounts a,'
      '     cm_curr_state h'
      'where p.id = a.creditid'
      'and   p.id=h.creditid '
      'and   cm_common.accountrest_get(a.booroweraccid)<0'
      '            ')
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 248
    Top = 64
    object ControlsNUMBEROFCREDIT: TStringField
      DisplayLabel = 'Мцгавилянин №-си'
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object ControlsCONTRACTNO: TStringField
      DisplayLabel = 'Щесабын №-си'
      FieldName = 'CONTRACTNO'
      Size = 4000
    end
    object ControlsCUSTREST: TFloatField
      DisplayLabel = 'Жари Щесабынын галыьы'
      FieldName = 'CUSTREST'
    end
    object ControlsREST: TFloatField
      DisplayLabel = 'Я.Б Галыг'
      FieldName = 'REST'
      Required = True
    end
  end
  object ControlsDatSrc: TDataSource
    DataSet = Controls
    Left = 248
    Top = 112
  end
  object Branches: TOracleDataSet
    SQL.Strings = (
      'select -1 as id,'#39'Бцтцн филиаллар'#39' as name from dual'
      'union'
      'select id ,name from sb_filial'
      'order by id')
    Session = CMDataModule.CMSession
    Left = 344
    Top = 64
    object BranchesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object BranchesNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object BranchesDatSrc: TDataSource
    DataSet = Branches
    Left = 344
    Top = 120
  end
  object CM_CARDS: TOraclePackage
    Session = CMDataModule.CMSession
    PackageName = 'CM_CARDS'
    Left = 40
    Top = 16
  end
end
