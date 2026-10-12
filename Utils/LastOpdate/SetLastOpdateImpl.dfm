object Form1: TForm1
  Left = 225
  Top = 109
  Width = 395
  Height = 466
  Caption = 'Repair Last Operation Date'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Courier New'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 0
    Top = 368
    Width = 120
    Height = 16
    Caption = 'Account Number:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
  end
  object Memo: TMemo
    Left = 0
    Top = 0
    Width = 387
    Height = 361
    Align = alTop
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'CREATE OR REPLACE '
      'FUNCTION getlastopdate( AccountID IN '
      'Account.id%type, ToDate in Archost.datdate%type) '
      'RETURN  Archost.datdate%type'
      'IS'
      '  Result Archost.datdate%type;'
      'BEGIN '
      ' select max(dat) into Result from Provarch where dat '
      '<= ToDate and (debt = AccountID or kredit = '
      'AccountID)'
      '--RateDifference'
      ';'
      '    RETURN Result ;'
      '--EXCEPTION'
      '  -- WHEN exception_name THEN'
      '    --   statements ;'
      'END;'
      ''
      '')
    ParentFont = False
    TabOrder = 0
    OnKeyDown = MemoKeyDown
  end
  object Button: TButton
    Left = 296
    Top = 368
    Width = 87
    Height = 25
    Caption = 'Execute'
    Default = True
    Enabled = False
    TabOrder = 1
    OnClick = ButtonClick
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 420
    Width = 387
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object SearchEdit1: TSearchEdit
    Left = 123
    Top = 368
    Width = 163
    Height = 22
    TabOrder = 3
    OnChange = SearchEdit1Change
    DataSource = DataSource
    SearchField = 'acc_no'
  end
  object CBRateDif: TCheckBox
    Left = 5
    Top = 398
    Width = 243
    Height = 17
    Caption = 'Rate Difference is Transaction'
    Checked = True
    State = cbChecked
    TabOrder = 4
    OnClick = CBRateDifClick
  end
  object Session: TOracleSession
    Cursor = crHourGlass
    DesignConnection = True
    LogonUsername = 'smart'
    LogonPassword = 'sm'
    LogonDatabase = 'SB'
    ThreadSafe = False
    Preferences.FloatPrecision = 0
    Preferences.IntegerPrecision = 0
    Preferences.SmallIntPrecision = -1
    Preferences.UseOCI7 = False
    Preferences.ConvertCRLF = True
    Preferences.TrimStringFields = True
    Preferences.MaxStringFieldSize = 0
    Preferences.ZeroDateIsNull = True
    Connected = False
    RollbackOnDisconnect = False
    NullValue = nvUnAssigned
    SQLTrace = stUnchanged
    OptimizerGoal = ogUnchanged
    IsolationLevel = ilUnchanged
    BytesPerCharacter = bc1Byte
    Left = 32
    Top = 360
  end
  object Accounts: TOracleDataSet
    SQL.Strings = (
      'select id , acc_no from account order by acc_no')
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
    Session = Session
    DesignActivation = False
    Active = False
    Left = 320
    Top = 392
  end
  object DataSource: TDataSource
    DataSet = Accounts
    Left = 64
    Top = 360
  end
  object OracleLogon: TOracleLogon
    Session = Session
    Retries = 2
    Options = [ldDatabase, ldDatabaseList]
    AliasDropDownCount = 8
    HistorySize = 6
    HistoryWithPassword = False
    Left = 352
    Top = 392
  end
  object QueryAcc: TOracleQuery
    SQL.Strings = (
      'update archost set '
      ' lastopdate = getlastopdate(:AccID, datdate)'
      'where acc_id =:AccID')
    Session = Session
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000060000003A4143434944030000000000000000000000}
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Top = 360
  end
  object QueryTrg: TOracleQuery
    Session = Session
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 288
    Top = 392
  end
end
