object FormAccount: TFormAccount
  Left = 213
  Top = 107
  Width = 501
  Height = 325
  Caption = 'FormAccount'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object AccountGB: TGroupBox
    Left = 0
    Top = 0
    Width = 493
    Height = 212
    Align = alTop
    Caption = 'ўесаб'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 34
      Height = 13
      Caption = 'ўесаб:'
    end
    object Label2: TLabel
      Left = 256
      Top = 16
      Width = 38
      Height = 13
      Caption = '¬алйута:'
    end
    object Label3: TLabel
      Left = 8
      Top = 44
      Width = 69
      Height = 13
      Caption = 'Ѕаланс щесабы:'
    end
    object Label4: TLabel
      Left = 8
      Top = 68
      Width = 37
      Height = 13
      Caption = 'ћцшт€ри:'
    end
    object Label5: TLabel
      Left = 8
      Top = 92
      Width = 58
      Height = 13
      Caption = 'јчылма тарихи:'
    end
    object Label6: TLabel
      Left = 8
      Top = 185
      Width = 59
      Height = 13
      Caption = 'ўесабын ады:'
    end
    object Label13: TLabel
      Left = 8
      Top = 116
      Width = 81
      Height = 13
      Caption = 'ўесабат символу:'
    end
    object Label14: TLabel
      Left = 8
      Top = 139
      Width = 23
      Height = 13
      Caption = '‘илиал:'
    end
    object Label15: TLabel
      Left = 8
      Top = 163
      Width = 31
      Height = 13
      Caption = '—имвол'
    end
    object Label7: TLabel
      Left = 280
      Top = 91
      Width = 53
      Height = 13
      Caption = '∆цт щесабы:'
    end
    object Label12: TLabel
      Left = 312
      Top = 116
      Width = 24
      Height = 13
      Caption = 'Ћимит:'
    end
    object Label10: TLabel
      Left = 120
      Top = 160
      Width = 8
      Height = 13
      Caption = '0'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBLookupCurr: TDBLookupComboBox
      Left = 351
      Top = 16
      Width = 138
      Height = 21
      KeyField = 'VALUTE'
      ListField = 'VALU_NAME'
      ListSource = CurrencyData
      TabOrder = 2
      OnClick = DBLookupCurrClick
    end
    object DBLookupBalance1: TDBLookupComboBox
      Left = 161
      Top = 40
      Width = 253
      Height = 21
      DataField = 'BAL_CN1'
      KeyField = 'BAL_CN'
      ListField = 'BALNAME'
      ListSource = BalAccData
      TabOrder = 5
      OnClick = DBLookupBalance1Click
    end
    object DBLookupCust: TDBLookupComboBox
      Left = 161
      Top = 64
      Width = 328
      Height = 21
      DataField = 'KLI_ID'
      KeyField = 'ID'
      ListField = 'BYR_NAME'
      ListSource = CustomersData
      TabOrder = 9
      OnClick = DBLookupCustClick
    end
    object DTPOpenDate: TDateTimePicker
      Left = 120
      Top = 88
      Width = 145
      Height = 21
      CalAlignment = dtaLeft
      Date = 37357.6183236921
      Time = 37357.6183236921
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 10
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 170
      Top = 136
      Width = 166
      Height = 21
      DataField = 'FILIAL'
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = BranchesData
      TabOrder = 16
      OnClick = DBLookupComboBox4Click
    end
    object DBEdit1: TDBEdit
      Left = 352
      Top = 16
      Width = 121
      Height = 21
      DataField = 'VALU_NAME'
      DataSource = CurrencyData
      TabOrder = 3
      OnChange = DBEdit1Change
    end
    object DBEdit2: TDBEdit
      Left = 162
      Top = 40
      Width = 233
      Height = 21
      DataField = 'BALNAME'
      DataSource = BalAccData
      TabOrder = 6
    end
    object DBEdit3: TDBEdit
      Left = 160
      Top = 64
      Width = 313
      Height = 21
      DataField = 'BYR_NAME'
      DataSource = CustomersData
      TabOrder = 8
    end
    object DBEdit5: TDBEdit
      Left = 168
      Top = 136
      Width = 151
      Height = 21
      DataField = 'NAME'
      DataSource = BranchesData
      TabOrder = 15
    end
    object SymbolEdit: TEdit
      Left = 120
      Top = 112
      Width = 145
      Height = 21
      TabOrder = 12
      Text = '0'
    end
    object LimitEdit: TEdit
      Left = 352
      Top = 112
      Width = 137
      Height = 21
      TabOrder = 13
      Text = '0'
    end
    object Twedit: TEdit
      Left = 352
      Top = 88
      Width = 137
      Height = 21
      TabOrder = 11
      Text = '0'
    end
    object DBEditAccNo: TEdit
      Left = 120
      Top = 14
      Width = 130
      Height = 21
      TabOrder = 0
    end
    object DBEditAccName: TEdit
      Left = 120
      Top = 176
      Width = 369
      Height = 21
      TabOrder = 17
    end
    object val_code: TSearchEdit
      Left = 312
      Top = 16
      Width = 34
      Height = 21
      TabOrder = 1
      OnChange = val_codeChange
      DataSource = CurrencyData
      SearchField = 'valute'
    end
    object bal_cn: TSearchEdit
      Left = 120
      Top = 40
      Width = 41
      Height = 21
      TabOrder = 4
      OnChange = bal_cnChange
      DataSource = BalAccData
      SearchField = 'bal_cn'
    end
    object EditCust: TSearchEdit
      Left = 120
      Top = 64
      Width = 41
      Height = 21
      TabOrder = 7
      OnChange = EditCustChange
      DataSource = CustomersData
      SearchField = 'id'
    end
    object Branchedit: TSearchEdit
      Left = 120
      Top = 135
      Width = 41
      Height = 21
      TabOrder = 14
      OnChange = BrancheditChange
      DataSource = BranchesData
      SearchField = 'id'
    end
  end
  object ButtonCommit: TButton
    Left = 336
    Top = 269
    Width = 75
    Height = 25
    Caption = '…аддаша йаз'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = ButtonCommitClick
  end
  object ButtonCancel: TButton
    Left = 416
    Top = 269
    Width = 75
    Height = 25
    Caption = '»мтина'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = ButtonCancelClick
  end
  object DayStartStateGB: TGroupBox
    Left = 0
    Top = 212
    Width = 493
    Height = 49
    Align = alTop
    Caption = '∆ари галыг'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label8: TLabel
      Left = 16
      Top = 21
      Width = 27
      Height = 13
      Caption = '√алыг:'
    end
    object Label9: TLabel
      Left = 272
      Top = 21
      Width = 53
      Height = 13
      Caption = '≈квивалент:'
    end
    object dbedit6: TEdit
      Left = 106
      Top = 18
      Width = 124
      Height = 21
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object dbedit7: TEdit
      Left = 346
      Top = 18
      Width = 124
      Height = 21
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0'
    end
  end
  object accid: TEdit
    Left = 232
    Top = 272
    Width = 57
    Height = 21
    TabOrder = 4
    Visible = False
  end
  object NLSLocalizer1: TNLSLocalizer
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 64
    Top = 200
  end
  object Currency: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select -1 as Valute, '#39'Ѕцтцн валйуталар'#39' as Valu_Name from Dual'
      'Union All'
      'select Valute, Valu_Name from Avalute'
      'Order by valute')
    ReadBuffer = 25
    Optimize = True
    Debug = False
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
    Active = True
    Left = 38
    Top = 45
    object CurrencyVALUTE: TFloatField
      FieldName = 'VALUTE'
    end
    object CurrencyVALU_NAME: TStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
  end
  object CurrencyData: TDataSource
    DataSet = Currency
    Left = 72
    Top = 45
  end
  object BalAcc: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      
        'select '#39'Ѕцтцн баланс щесаблары'#39' as Bal_cn,'#39'Ѕцтцн баланс щесаблар' +
        'ы'#39' as BalName from dual'
      'Union All'
      'select * from '
      '('
      'select to_char(bal_cn), BalName from bal_spr1'
      'order by bal_cn'
      ')')
    ReadBuffer = 25
    Optimize = True
    Debug = False
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
    Active = True
    Left = 38
    Top = 81
    object BalAccBAL_CN: TStringField
      FieldName = 'BAL_CN'
      Size = 40
    end
    object BalAccBALNAME: TStringField
      FieldName = 'BALNAME'
      Size = 181
    end
  end
  object BalAccData: TDataSource
    DataSet = BalAcc
    Left = 72
    Top = 85
  end
  object Customers: TOracleDataSet
    SQL.Strings = (
      'select * from customers_physical'
      ''
      ''
      'order by ID')
    ReadBuffer = 25
    Optimize = True
    Debug = False
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
    Active = True
    Left = 60
    Top = 10
    object CustomersID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CustomersBYR_NAME: TStringField
      FieldName = 'BYR_NAME'
      Size = 50
    end
    object CustomersPASSPORT: TStringField
      FieldName = 'PASSPORT'
      Size = 3
    end
    object CustomersBIRTHDATE: TDateTimeField
      FieldName = 'BIRTHDATE'
    end
    object CustomersBIRTHPLACE: TStringField
      FieldName = 'BIRTHPLACE'
      Size = 30
    end
    object CustomersFAM_STATUS: TIntegerField
      FieldName = 'FAM_STATUS'
    end
    object CustomersADRESS: TStringField
      FieldName = 'ADRESS'
      Size = 50
    end
    object CustomersPHONE: TStringField
      FieldName = 'PHONE'
      Size = 30
    end
    object CustomersEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 30
    end
    object CustomersOPENDATE: TDateTimeField
      FieldName = 'OPENDATE'
    end
    object CustomersSEX: TIntegerField
      FieldName = 'SEX'
    end
    object CustomersUSERID: TIntegerField
      FieldName = 'USERID'
    end
    object CustomersPASSP_NUMBER: TIntegerField
      FieldName = 'PASSP_NUMBER'
    end
    object CustomersADRS_STATE: TStringField
      FieldName = 'ADRS_STATE'
      Size = 30
    end
    object CustomersADRS_CITY: TStringField
      FieldName = 'ADRS_CITY'
    end
    object CustomersBIRTH_STATE: TStringField
      FieldName = 'BIRTH_STATE'
      Size = 30
    end
    object CustomersPHONE_MOB: TStringField
      FieldName = 'PHONE_MOB'
      Size = 30
    end
    object CustomersP_ID: TFloatField
      FieldName = 'P_ID'
    end
  end
  object CustomersData: TDataSource
    DataSet = Customers
    Left = 92
    Top = 10
  end
  object BranchesData: TDataSource
    DataSet = Branches
    Left = 72
    Top = 117
  end
  object Branches: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select -1 as ID, '#39'Ѕцтцн филиаллар'#39' as name from Dual'
      'Union All'
      'select ID, name from filial '
      'order by ID')
    ReadBuffer = 25
    Optimize = True
    Debug = False
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
    Active = True
    Left = 37
    Top = 117
    object BranchesID: TFloatField
      FieldName = 'ID'
    end
    object BranchesNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
end
