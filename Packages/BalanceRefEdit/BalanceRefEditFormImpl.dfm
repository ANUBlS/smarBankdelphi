object BalanceRefEditForm: TBalanceRefEditForm
  Left = 245
  Top = 160
  Width = 568
  Height = 453
  Caption = 'BalanceRefEditForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 560
    Height = 28
    ButtonHeight = 21
    TabOrder = 0
    object DBNavigator: TDBNavigator
      Left = 0
      Top = 2
      Width = 240
      Height = 21
      DataSource = DataSource1
      Flat = True
      Ctl3D = False
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ToolButton1: TToolButton
      Left = 240
      Top = 2
      Width = 16
      Caption = 'ToolButton1'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object Label1: TLabel
      Left = 256
      Top = 2
      Width = 81
      Height = 21
      AutoSize = False
      Caption = 'Щесаб планлары'
    end
    object ComboBoxPlan: TComboBox
      Left = 337
      Top = 2
      Width = 145
      Height = 21
      Color = 14811135
      ItemHeight = 13
      TabOrder = 1
      Text = '1 щесаб планы'
      Items.Strings = (
        '1 щесаб планы'
        '2 щесаб планы'
        '3 щесаб планы'
        '4 щесаб планы'
        'English')
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 367
    Width = 560
    Height = 59
    Align = alBottom
    Caption = 'Ахтарма'
    TabOrder = 1
    object EditSearch: TEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 21
      Color = clInfoBk
      TabOrder = 0
      OnChange = EditSearchChange
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 164
    Width = 560
    Height = 203
    Align = alClient
    BorderStyle = bsNone
    Color = 16777088
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'BAL_CN'
        Title.Alignment = taCenter
        Title.Caption = 'Бал.щесабы'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TYPEID'
        PickList.Strings = (
          'А'
          'П'
          'А-П')
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADDITIONALTYPEID'
        Title.Alignment = taCenter
        Title.Caption = 'Ялавя тип'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDO'
        Title.Alignment = taCenter
        Title.Caption = 'Салдолашма'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RATEDIFFERENCE'
        Title.Alignment = taCenter
        Title.Caption = 'Курс фярги'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PART'
        Title.Alignment = taCenter
        Title.Caption = 'Синиф'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BALNAME'
        Title.Alignment = taCenter
        Title.Caption = 'Щесабын ады'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QROUP'
        Title.Alignment = taCenter
        Title.Caption = 'Груп'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KLAS'
        Title.Alignment = taCenter
        Title.Caption = 'Синиф'
        Visible = True
      end>
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 28
    Width = 560
    Height = 136
    Align = alTop
    Caption = 'Редактя'
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 66
      Height = 13
      Caption = 'Баланс щесабы'
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 8
      Top = 56
      Width = 96
      Height = 13
      Caption = 'Баланс щесабынын типи'
    end
    object Label4: TLabel
      Left = 259
      Top = 56
      Width = 23
      Height = 13
      Caption = 'Груп'
      FocusControl = DBEdit3
    end
    object Label6: TLabel
      Left = 364
      Top = 56
      Width = 20
      Height = 13
      Caption = 'Синиф'
      FocusControl = DBEdit5
    end
    object Label7: TLabel
      Left = 8
      Top = 96
      Width = 100
      Height = 13
      Caption = 'Баланс щесабынын ады:'
      FocusControl = DBEdit6
    end
    object Label8: TLabel
      Left = 161
      Top = 56
      Width = 42
      Height = 13
      Caption = 'Ялавя тип'
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 32
      Width = 64
      Height = 21
      DataField = 'BAL_CN'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 291
      Top = 48
      Width = 64
      Height = 21
      DataField = 'ACCGROUP'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBCheckBox1: TDBCheckBox
      Left = 8
      Top = 74
      Width = 97
      Height = 17
      Caption = 'Салдолашма'
      DataField = 'SALDO'
      DataSource = DataSource1
      TabOrder = 5
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 120
      Top = 74
      Width = 97
      Height = 17
      Caption = 'Курс фярги'
      DataField = 'RATEDIFFERENCE'
      DataSource = DataSource1
      TabOrder = 6
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBEdit5: TDBEdit
      Left = 396
      Top = 48
      Width = 64
      Height = 21
      DataField = 'PART'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 8
      Top = 110
      Width = 545
      Height = 21
      DataField = 'BALNAME'
      TabOrder = 7
    end
    object DBComboBox1: TDBComboBox
      Left = 110
      Top = 48
      Width = 47
      Height = 21
      DataField = 'TYPEID'
      DataSource = DataSource1
      ItemHeight = 13
      Items.Strings = (
        'А'
        'П'
        'А-П')
      TabOrder = 1
    end
    object DBComboBox2: TDBComboBox
      Left = 206
      Top = 48
      Width = 47
      Height = 21
      DataField = 'ADDITIONALTYPEID'
      DataSource = DataSource1
      ItemHeight = 13
      Items.Strings = (
        'А'
        'П')
      TabOrder = 2
    end
    object DBComboBox3: TDBComboBox
      Left = 160
      Top = 16
      Width = 145
      Height = 21
      Style = csDropDownList
      DataField = 'TYPEID'
      DataSource = DataSource1
      ItemHeight = 13
      Items.Strings = (
        'А'
        'П'
        'А-П')
      TabOrder = 8
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select b.*, b.rowid from bal_spr1 b')
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
    DesignActivation = False
    Active = False
    Left = 384
    Top = 224
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 304
    Top = 224
  end
end
