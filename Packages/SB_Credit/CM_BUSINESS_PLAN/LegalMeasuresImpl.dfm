object LMMainForm: TLMMainForm
  Left = 192
  Top = 107
  ActiveControl = DBEdit2
  AutoSize = True
  BorderStyle = bsDialog
  ClientHeight = 348
  ClientWidth = 740
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClick = FormClick
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 740
    Height = 41
    Align = alTop
    Caption = 'Мцштяри'
    TabOrder = 0
    object DBEdit1: TDBEdit
      Left = 5
      Top = 16
      Width = 492
      Height = 21
      DataField = 'NAME'
      DataSource = DSCreditInfo
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 41
    Width = 740
    Height = 184
    Align = alTop
    Caption = 'Щцгуги тядбирляр'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 736
      Height = 167
      Align = alClient
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindow
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NUM'
          Title.Caption = '№'
          Title.Color = clNavy
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROTOCOL'
          Title.Caption = 'Прот'
          Title.Color = clNavy
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PARAGRAPH'
          Title.Caption = 'Параг'
          Title.Color = clNavy
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GRANTDATE'
          Title.Caption = 'Тяг. Тарихи'
          Title.Color = clNavy
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GIVEDATE'
          Title.Caption = 'Вер. Тарихи'
          Title.Color = clNavy
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEASURECODE'
          Title.Caption = 'Код'
          Title.Color = clNavy
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTALAMOUNT'
          Title.Caption = 'Жями мяб.'
          Title.Color = clNavy
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MAINDEBT'
          Title.Caption = 'О жцм ясас борж'
          Title.Color = clNavy
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MeasureDesc'
          Title.Caption = 'Тядбирин ады'
          Title.Color = clNavy
          Width = 170
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 225
    Width = 740
    Height = 40
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 2
    object Button1: TButton
      Left = 176
      Top = 5
      Width = 75
      Height = 25
      Action = Action1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 337
      Top = 5
      Width = 75
      Height = 25
      Action = Action2
      TabOrder = 1
    end
    object Button3: TButton
      Left = 419
      Top = 5
      Width = 75
      Height = 25
      Action = Action3
      TabOrder = 2
    end
    object Button4: TButton
      Left = 502
      Top = 5
      Width = 75
      Height = 25
      Action = Action4
      TabOrder = 3
    end
    object Button5: TButton
      Left = 256
      Top = 5
      Width = 75
      Height = 25
      Action = Action5
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 265
    Width = 740
    Height = 83
    Align = alTop
    TabOrder = 3
    object Label1: TLabel
      Left = 6
      Top = 6
      Width = 20
      Height = 13
      Caption = '№ : '
    end
    object Label2: TLabel
      Left = 97
      Top = 6
      Width = 47
      Height = 26
      Caption = 'Тягдимат      тарихи'
      WordWrap = True
    end
    object Label3: TLabel
      Left = 272
      Top = 6
      Width = 64
      Height = 13
      Caption = 'Верилмя тарихи :'
    end
    object Label4: TLabel
      Left = 8
      Top = 46
      Width = 31
      Height = 13
      Caption = 'Коду :'
    end
    object Label5: TLabel
      Left = 464
      Top = 6
      Width = 25
      Height = 13
      Caption = 'Прот :'
    end
    object Label6: TLabel
      Left = 576
      Top = 6
      Width = 34
      Height = 13
      Caption = 'Параг :'
    end
    object Label7: TLabel
      Left = 120
      Top = 46
      Width = 21
      Height = 13
      Caption = 'Ады :'
    end
    object Label8: TLabel
      Left = 430
      Top = 46
      Width = 55
      Height = 13
      Caption = 'Жями мяб. :'
    end
    object Label9: TLabel
      Left = 599
      Top = 41
      Width = 46
      Height = 26
      Caption = 'О жцм ясас борж'
      WordWrap = True
    end
    object DBEdit2: TDBEdit
      Left = 30
      Top = 3
      Width = 65
      Height = 21
      DataField = 'NUM'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 146
      Top = 3
      Width = 121
      Height = 21
      DataField = 'GRANTDATE'
      DataSource = DataSource1
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
    end
    object DBDateTimeEditEh2: TDBDateTimeEditEh
      Left = 341
      Top = 3
      Width = 121
      Height = 21
      DataField = 'GIVEDATE'
      DataSource = DataSource1
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 2
      Visible = True
    end
    object DBEdit3: TDBEdit
      Left = 494
      Top = 3
      Width = 75
      Height = 21
      DataField = 'PROTOCOL'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 614
      Top = 3
      Width = 83
      Height = 21
      DataField = 'PARAGRAPH'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit5: TDBEdit
      Left = 44
      Top = 44
      Width = 67
      Height = 21
      DataField = 'MEASURECODE'
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBNumberEditEh1: TDBNumberEditEh
      Left = 488
      Top = 43
      Width = 107
      Height = 21
      DataField = 'TOTALAMOUNT'
      DataSource = DataSource1
      EditButtons = <>
      TabOrder = 6
      Visible = True
    end
    object DBNumberEditEh2: TDBNumberEditEh
      Left = 648
      Top = 42
      Width = 87
      Height = 21
      DataField = 'MAINDEBT'
      DataSource = DataSource1
      EditButtons = <>
      TabOrder = 7
      Visible = True
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 144
      Top = 42
      Width = 281
      Height = 21
      DataField = 'MEASURECODE'
      DataSource = DataSource1
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'DESCRIPTION'
      ListSource = DataSource2
      TabOrder = 8
      Visible = True
    end
  end
  object Localizer: TNLSLocalizer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 512
    Top = 8
  end
  object ActionList1: TActionList
    Left = 368
    Top = 185
    object Action1: TAction
      Caption = 'Йени'
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Йаддаша йаз'
      OnExecute = Action2Execute
      OnUpdate = Action2Update
    end
    object Action3: TAction
      Caption = 'Имтина'
      OnExecute = Action3Execute
      OnUpdate = Action2Update
    end
    object Action4: TAction
      Caption = 'Чыхыш'
      OnExecute = Action4Execute
    end
    object Action5: TAction
      Caption = 'Силмяк'
      OnExecute = Action5Execute
      OnUpdate = Action5Update
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      
        'SELECT rowid,id, creditid, protocol, paragraph, grantdate, gived' +
        'ate,'
      '       measurecode, totalamount, maindebt, num'
      '  FROM cm_legal_measures'
      'WHERE CreditID=:CreditID')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000090000003A43524544495449440300000000000000000000
      00}
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    AfterInsert = OracleDataSet1AfterInsert
    AfterPost = OracleDataSet1AfterPost
    Left = 570
    Top = 235
    object OracleDataSet1ID: TFloatField
      FieldName = 'ID'
    end
    object OracleDataSet1CREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object OracleDataSet1PROTOCOL: TFloatField
      FieldName = 'PROTOCOL'
    end
    object OracleDataSet1PARAGRAPH: TFloatField
      FieldName = 'PARAGRAPH'
    end
    object OracleDataSet1GRANTDATE: TDateTimeField
      FieldName = 'GRANTDATE'
    end
    object OracleDataSet1GIVEDATE: TDateTimeField
      FieldName = 'GIVEDATE'
    end
    object OracleDataSet1MEASURECODE: TFloatField
      FieldName = 'MEASURECODE'
      Required = True
    end
    object OracleDataSet1TOTALAMOUNT: TFloatField
      FieldName = 'TOTALAMOUNT'
    end
    object OracleDataSet1MAINDEBT: TFloatField
      FieldName = 'MAINDEBT'
    end
    object OracleDataSet1NUM: TFloatField
      FieldName = 'NUM'
    end
    object OracleDataSet1MeasureDesc: TWideStringField
      FieldKind = fkLookup
      FieldName = 'MeasureDesc'
      LookupDataSet = OracleDataSet2
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIPTION'
      KeyFields = 'MEASURECODE'
      Size = 255
      Lookup = True
    end
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 602
    Top = 235
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      'SELECT id, description'
      '  FROM cm_legal_measure_names')
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 536
    Top = 161
  end
  object DataSource2: TDataSource
    DataSet = OracleDataSet2
    Left = 432
    Top = 137
  end
  object CreditInfo: TOracleDataSet
    SQL.Strings = (
      'Select '
      '   Name'
      'From '
      '  CM_BOOROWERINFO '
      'Where '
      '   CreditID=:CreditID'
      '   ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000090000003A43524544495449440300000000000000000000
      00}
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
    Cursor = crSQLWait
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
    Left = 64
    Top = 136
  end
  object DSCreditInfo: TDataSource
    DataSet = CreditInfo
    Left = 104
    Top = 136
  end
end
