object frmContractReport: TfrmContractReport
  Left = 340
  Top = 294
  Width = 201
  Height = 174
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  OnCanResize = FormCanResize
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 3
    Width = 101
    Height = 16
    Caption = 'ћцгавил€нин чапы'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 114
    Width = 75
    Height = 25
    Caption = 'OK'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object GroupBox1: TGroupBox
    Left = 5
    Top = 20
    Width = 179
    Height = 86
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object RadioButton1: TRadioButton
      Left = 24
      Top = 24
      Width = 76
      Height = 17
      Caption = '…атырым'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 24
      Top = 56
      Width = 147
      Height = 17
      Caption = 'яман€тин гайтарылмасы цзр€'
      TabOrder = 1
    end
  end
  object BitBtn2: TBitBtn
    Left = 95
    Top = 114
    Width = 75
    Height = 25
    Caption = '„ыхыш'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object ODSDepozitWithDraw: TOracleDataSet
    SQL.Strings = (
      'Select'
      '    C.ID'
      '   ,C.ContractNo'
      '   ,C.OpenDate'
      '   ,C.CloseDate'
      '   ,C.Amount'
      '   ,i.interest'
      '   ,oi.overdueinterest as overdueinterest'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(CA.ContractAccID) as' +
        ' ContractAccNo'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(CA.ClientAccID) as C' +
        'lientAccNo'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(CA.InterestAccID) as' +
        ' InterestAccNo'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccName(CA.ContractAccID) as Con' +
        'tractAccName'
      
        '   ,SBCM_Stored_Programs.SBCMGetCurrencyShortName(CA.ContractAcc' +
        'ID)as ContractCurrency'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccName(CA.ClientAccID) as Clien' +
        'tAccName'
      '   ,p.*'
      '  From'
      '   SBCM_Contracts C'
      '  ,SBCM_Contract_Accounts CA'
      '  ,sbcm_interests i'
      '  ,sbcm_payments p'
      '  ,sbcm_overdueinterests oi'
      '  Where'
      '    C.Type# = ('
      '       Select ID from'
      '              SBCM_CONTRACT_TYPES'
      '              Where upper(Name) = '#39'DEPOSIT'#39
      '               )'
      '           And C.ID = CA.ID#'
      '           And i.id# = C.ID'
      '           and oi.id#=c.id'
      '           and C.ID=p.id#'
      '           and C.ID=:ContID')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000070000003A434F4E54494403000000040000003902000000
      000000}
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
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 104
    Top = 56
  end
  object ODSDepozitMoney: TOracleDataSet
    SQL.Strings = (
      'Select'
      '    C.ID'
      '   ,C.ContractNo'
      '   ,C.OpenDate'
      '   ,C.CloseDate'
      '   ,C.Amount'
      '   ,i.interest'
      '   ,oi.overdueinterest as overdueinterest'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(CA.ContractAccID) as' +
        ' ContractAccNo'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(CA.ClientAccID) as C' +
        'lientAccNo'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(CA.InterestAccID) as' +
        ' InterestAccNo'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccName(CA.ContractAccID) as Con' +
        'tractAccName'
      
        '   ,SBCM_Stored_Programs.SBCMGetCurrencyShortName(CA.ContractAcc' +
        'ID)as ContractCurrency'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccName(CA.ClientAccID) as Clien' +
        'tAccName'
      '   ,t.*'
      '  From'
      '   SBCM_Contracts C'
      '  ,SBCM_Contract_Accounts CA'
      '  ,sbcm_interests i'
      '  ,sbcm_tranches t'
      '  ,sbcm_overdueinterests oi'
      '  Where'
      '    C.Type# = ('
      '       Select ID from'
      '              SBCM_CONTRACT_TYPES'
      '              Where upper(Name) = '#39'DEPOSIT'#39
      '               )'
      '           And C.ID = CA.ID#'
      '           And i.id# = C.ID'
      '           and oi.id#=c.id'
      '           and C.ID=t.id#'
      '           and C.ID=:ContID'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000070000003A434F4E54494403000000040000003902000000
      000000}
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
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 104
    Top = 8
  end
  object ODSContarcts: TOracleDataSet
    SQL.Strings = (
      ''
      'SELECT per.NAME, cat.CATEGORY, dt.TYPE'
      '  FROM sbcm_persons per,'
      '       sbcm_categories cat,'
      '       sbcm_deposit_types dt,'
      '       sbcm_contracts c'
      ' WHERE per.ID = c.personaltype'
      '   AND cat.ID = c.clienttype'
      '   AND dt.ID = c.contracttype'
      '   AND c.ID =:ContID')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000070000003A434F4E54494405000000040000003536390000
      000000}
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
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 104
    Top = 88
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = 'ћцгавил€нин чапы'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 120
    Top = 8
  end
end
