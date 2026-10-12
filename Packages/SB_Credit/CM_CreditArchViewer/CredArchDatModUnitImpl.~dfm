object CredArchDatMod: TCredArchDatMod
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 233
  Top = 193
  Height = 480
  Width = 696
  object DatSetCreditArchView: TOracleDataSet
    SQL.Strings = (
      'select '
      '       p.hdate,'
      '       p.numberofcredit,'
      '       cm_common.Get_CreditCurrency(p.currency) as val_name,'
      '       p.creditlineamount,'
      '       p.annualyinterestrate,'
      '       p.annualyoverduerate,'
      '       p.annualypenaltyrate,'
      '       p.dateofconclusion,'
      '       p.duedatefirstcontract,'
      '       p.purposeofcredit,'
      '       CM_AK_REPORTS.Get_userNameByID(p.op_id) as op_id ,'
      '       /*nvl(*/p.defCalcInt/*,1)*/ as defCalcInt,'
      '       CM_AK_REPORTS.get_custname(p.boorowerid) as custname,'
      
        '       CM_AK_REPORTS.get_catdesc(p.customertype) as catdescripti' +
        'on,'
      
        '       CM_AK_REPORTS.get_perdesc(p.personaltype) as perdescripio' +
        'n,'
      
        '       CM_AK_REPORTS.get_crdtypedesc(p.credittype) as crdtypedes' +
        'cription,'
      
        '       CM_AK_REPORTS.get_usergrdesc(p.usrgroup) as usrgrdescript' +
        'ion,'
      '       CM_AK_REPORTS.get_filialname(p.branchid) as filname,'
      '       cm_common.accountnumber_get(p.loanaccid) as LoanAccNo,'
      
        '       cm_common.accountnumber_get(p.Interestaccid) as InterestA' +
        'ccNo,'
      
        '       cm_common.accountnumber_get(p.DueLoanaccid) as DueLoanAcc' +
        'No,'
      
        '       cm_common.accountnumber_get(p.DueInterestaccid) as DueInt' +
        'erestAccNo,'
      
        '       CM_AK_REPORTS.get_creditcalcmethod(INTCALCMETHOD) as Calc' +
        'method'
      'from '
      '  cm_portfolio_archive p'
      'where  p.id = :CrdID  '
      '  '
      '  '
      '   ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000060000003A4352444944030000000000000000000000}
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crHourGlass
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 48
    Top = 24
    object DatSetCreditArchViewHDATE: TDateTimeField
      DisplayLabel = '“арих'
      FieldName = 'HDATE'
      Required = True
    end
    object DatSetCreditArchViewNUMBEROFCREDIT: TStringField
      DisplayLabel = 'ћцгавил€нин є-си'
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object DatSetCreditArchViewVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object DatSetCreditArchViewCREDITLINEAMOUNT: TFloatField
      DisplayLabel = ' редитин м€бл€ьи'
      FieldName = 'CREDITLINEAMOUNT'
      Required = True
    end
    object DatSetCreditArchViewANNUALYINTERESTRATE: TFloatField
      DisplayLabel = '»ллик %'
      FieldName = 'ANNUALYINTERESTRATE'
      Required = True
    end
    object DatSetCreditArchViewANNUALYOVERDUERATE: TFloatField
      DisplayLabel = '№еж.%'
      FieldName = 'ANNUALYOVERDUERATE'
      Required = True
    end
    object DatSetCreditArchViewANNUALYPENALTYRATE: TFloatField
      DisplayLabel = '∆€рим€ %'
      FieldName = 'ANNUALYPENALTYRATE'
      Required = True
    end
    object DatSetCreditArchViewDATEOFCONCLUSION: TDateTimeField
      DisplayLabel = 'јчылма тарихи'
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object DatSetCreditArchViewDUEDATEFIRSTCONTRACT: TDateTimeField
      DisplayLabel = 'Ѕаьланма тарихи'
      FieldName = 'DUEDATEFIRSTCONTRACT'
      Required = True
    end
    object DatSetCreditArchViewPURPOSEOFCREDIT: TStringField
      DisplayLabel = ' редитин м€гс€ди'
      FieldName = 'PURPOSEOFCREDIT'
      Size = 128
    end
    object DatSetCreditArchViewCUSTNAME: TStringField
      DisplayLabel = 'ћцшт€ри'
      FieldName = 'CUSTNAME'
      Size = 4000
    end
    object DatSetCreditArchViewCATDESCRIPTION: TStringField
      DisplayLabel = 'Ѕоржаланын катеэорийасы'
      FieldName = 'CATDESCRIPTION'
      Size = 4000
    end
    object DatSetCreditArchViewPERDESCRIPION: TStringField
      DisplayLabel = 'Ѕоржаланын типи'
      FieldName = 'PERDESCRIPION'
      Size = 4000
    end
    object DatSetCreditArchViewCRDTYPEDESCRIPTION: TStringField
      DisplayLabel = ' редитин типи'
      FieldName = 'CRDTYPEDESCRIPTION'
      Size = 4000
    end
    object DatSetCreditArchViewUSRGRDESCRIPTION: TStringField
      DisplayLabel = '»стифад€чи эрупу'
      FieldName = 'USRGRDESCRIPTION'
      Size = 4000
    end
    object DatSetCreditArchViewFILNAME: TStringField
      DisplayLabel = '‘илиал'
      FieldName = 'FILNAME'
      Size = 4000
    end
    object DatSetCreditArchViewLOANACCNO: TStringField
      DisplayLabel = '—суда щесабынын є-си'
      FieldName = 'LOANACCNO'
      Size = 4000
    end
    object DatSetCreditArchViewINTERESTACCNO: TStringField
      DisplayLabel = '‘аиз щесабынын є-си'
      FieldName = 'INTERESTACCNO'
      Size = 4000
    end
    object DatSetCreditArchViewDUELOANACCNO: TStringField
      DisplayLabel = '№еж —суда щесабынын є-си'
      FieldName = 'DUELOANACCNO'
      Size = 4000
    end
    object DatSetCreditArchViewDUEINTERESTACCNO: TStringField
      DisplayLabel = '№еж фаиз щесабынын є-си'
      FieldName = 'DUEINTERESTACCNO'
      Size = 4000
    end
    object DatSetCreditArchViewDEFCALCINT: TFloatField
      FieldName = 'DEFCALCINT'
    end
    object DatSetCreditArchViewOP_ID: TStringField
      DisplayLabel = '»стифад€чи'
      FieldName = 'OP_ID'
      Size = 4000
    end
    object DatSetCreditArchViewCALCMETHOD: TStringField
      DisplayLabel = 'ўесаблама гайд€сы'
      FieldName = 'CALCMETHOD'
      Size = 4000
    end
  end
  object DatSrcCredArch: TDataSource
    DataSet = DatSetCreditArchView
    Left = 152
    Top = 24
  end
end
