object CallBackTransactionsForm: TCallBackTransactionsForm
  Left = 220
  Top = 113
  Width = 571
  Height = 467
  Caption = 'CallBackTransactionsForm'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 563
    Height = 440
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object StatusBar: TStatusBar
      Left = 0
      Top = 421
      Width = 563
      Height = 19
      Panels = <
        item
          Width = 50
        end
        item
          Width = 50
        end>
      SimplePanel = False
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 361
      Height = 421
      BevelInner = bvLowered
      TabOrder = 1
      object GroupBox1: TGroupBox
        Left = 2
        Top = 2
        Width = 193
        Height = 80
        Caption = 'Дебет'
        TabOrder = 0
        object DBLookupDebetBranch: TDBLookupComboBox
          Left = 9
          Top = 16
          Width = 181
          Height = 21
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = DebetBranchData
          TabOrder = 0
        end
        object DBLookupDebet: TDBLookupComboBox
          Left = 9
          Top = 47
          Width = 181
          Height = 21
          KeyField = 'ID'
          ListField = 'ACC_NO'
          ListSource = DebetData
          TabOrder = 1
          OnClick = CheckListOperationsClickCheck
        end
      end
      object Panel5: TPanel
        Left = 2
        Top = 378
        Width = 357
        Height = 41
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        object ButtonCommit: TButton
          Left = 201
          Top = 7
          Width = 145
          Height = 25
          Caption = 'Ямялиййатлары йериня йетир'
          Default = True
          Enabled = False
          TabOrder = 0
          OnClick = ButtonCommitClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 2
        Top = 91
        Width = 193
        Height = 80
        Caption = 'Кредит'
        TabOrder = 2
        object DBLookupCreditBranch: TDBLookupComboBox
          Left = 9
          Top = 16
          Width = 181
          Height = 21
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = CreditBranchData
          TabOrder = 0
        end
        object DBLookupCredit: TDBLookupComboBox
          Left = 9
          Top = 47
          Width = 181
          Height = 21
          KeyField = 'ID'
          ListField = 'ACC_NO'
          ListSource = CreditData
          TabOrder = 1
          OnClick = CheckListOperationsClickCheck
        end
      end
      object Panel6: TPanel
        Left = 198
        Top = 2
        Width = 161
        Height = 376
        Align = alRight
        BevelInner = bvLowered
        TabOrder = 3
        object CheckListOperations: TCheckListBox
          Left = 2
          Top = 19
          Width = 157
          Height = 355
          OnClickCheck = CheckListOperationsClickCheck
          Align = alClient
          BorderStyle = bsNone
          Color = clBtnFace
          ItemHeight = 13
          TabOrder = 0
        end
        object StaticText1: TStaticText
          Left = 2
          Top = 2
          Width = 157
          Height = 17
          Align = alTop
          Alignment = taCenter
          BorderStyle = sbsSingle
          Caption = 'Вериляжяк ямялиййат'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 1
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 399
      Top = 0
      Width = 164
      Height = 421
      Align = alRight
      Caption = 'Вериляжяк ямялиййат'
      TabOrder = 2
      Visible = False
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 9
        Top = 16
        Width = 152
        Height = 21
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = OperationsData
        TabOrder = 0
      end
    end
  end
  object OperationType: TOracleQuery
    SQL.Strings = (
      'select  '
      '   ID, Name '
      'from '
      '   Vid_op '
      'where'
      '   Internal = 1'
      'order by ID'
      '')
    Session = sboapiDataModule.SBSession
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = True
    ThreadSynchronized = True
    OnThreadRecord = OperationTypeThreadRecord
    Left = 528
    Top = 280
  end
  object DebetSide: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   ID, acc_no, filial'
      'From '
      '   Account'
      'where filial = :filial'
      'Order by'
      '   acc_no'
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000070000003A46494C49414C030000000000000000000000}
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
    Master = DebetBranch
    MasterFields = 'ID'
    DetailFields = 'FILIAL'
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
    Left = 448
    Top = 8
  end
  object CreditSide: TOracleDataSet
    SQL.Strings = (
      'Select '
      '   ID, acc_no, filial'
      'From '
      '   Account'
      ''
      'where filial = :filial'
      'Order by'
      '   acc_no')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000070000003A46494C49414C030000000000000000000000}
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
    Master = CreditBranch
    MasterFields = 'ID'
    DetailFields = 'FILIAL'
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
    Left = 478
    Top = 336
  end
  object DebetData: TDataSource
    DataSet = DebetSide
    Left = 448
    Top = 49
  end
  object CreditData: TDataSource
    DataSet = CreditSide
    Left = 480
    Top = 384
  end
  object DebetBranch: TOracleDataSet
    SQL.Strings = (
      'select  '
      '   ID, Name '
      'from '
      '   Filial'
      'order by ID'
      ''
      '')
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
    Active = False
    Left = 396
    Top = 8
  end
  object CreditBranch: TOracleDataSet
    SQL.Strings = (
      'select  '
      '   ID, Name '
      'from '
      '   Filial'
      'order by ID'
      ''
      '')
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
    Active = False
    Left = 528
    Top = 336
  end
  object DebetBranchData: TDataSource
    DataSet = DebetBranch
    Left = 397
    Top = 49
  end
  object CreditBranchData: TDataSource
    DataSet = CreditBranch
    Left = 528
    Top = 384
  end
  object OPCallBack: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SB_CALLBACK_TRANSACTIONS'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 479
    Top = 280
  end
  object Operations: TOracleDataSet
    SQL.Strings = (
      'select  '
      '   ID, Name '
      'from '
      '   Vid_op '
      'where'
      '   Internal = 1'
      'order by ID'
      ''
      '')
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
    Active = False
    Left = 477
    Top = 191
  end
  object OperationsData: TDataSource
    DataSet = Operations
    Left = 478
    Top = 232
  end
end
