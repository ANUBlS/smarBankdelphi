object FormConfig: TFormConfig
  Left = 513
  Top = 176
  BorderStyle = bsSingle
  ClientHeight = 422
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 392
    Width = 357
    Height = 30
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object BitBtn2: TBitBtn
      Left = 295
      Top = 4
      Width = 57
      Height = 22
      Cancel = True
      Caption = '&Баьла'
      TabOrder = 0
      OnClick = BitBtn2Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 357
    Height = 179
    Align = alTop
    Caption = 'Кючцрцлмцш Мябляь'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = 8404992
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 62
      Width = 353
      Height = 115
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 351
        Height = 113
        Align = alClient
        BorderStyle = bsNone
        Color = clWhite
        DataSource = DS_AccountPrincipial
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = 8404992
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Color = 14737632
            Expanded = False
            FieldName = 'VAL_NAME'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = '$'
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ACC_NO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Щесаб'
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 151
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TYPE'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BRANCHNAME'
            Title.Alignment = taCenter
            Title.Caption = 'Филиал'
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 95
            Visible = True
          end>
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 15
      Width = 353
      Height = 47
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object SpeedButton1: TSpeedButton
        Left = 324
        Top = 0
        Width = 25
        Height = 21
        Caption = '+'
        Flat = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object Principial: TSearchEdit
        Left = 2
        Top = 0
        Width = 180
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DataSource = DataModWU.DSAccount
        SearchField = 'ACC_NO'
      end
      object DBViewComboBox1: TDBViewComboBox
        Left = 184
        Top = 0
        Width = 57
        Height = 21
        Style = csDropDownList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        ListSource = DataModWU.DSValute
        ListFields = 'VAL_NAME'
        FieldInterval = 5
        DropDownOnEnter = False
      end
      object P_ComboDC: TComboBox
        Left = 242
        Top = 0
        Width = 79
        Height = 21
        Style = csDropDownList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 2
        Items.Strings = (
          'DEBIT'
          'CREDIT')
      end
      object CheckBox1: TCheckBox
        Left = 188
        Top = 28
        Width = 128
        Height = 17
        Caption = 'Ямялиййат апарылсын'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = CheckBox1Click
      end
      object P_ComboBranch: TDBViewComboBox
        Left = 2
        Top = 24
        Width = 180
        Height = 21
        Style = csDropDownList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 4
        ListSource = DataModWU.DSBranch
        ListFields = 'BRANCHNAME'
        FieldInterval = 5
        DropDownOnEnter = False
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 179
    Width = 357
    Height = 174
    Align = alClient
    Caption = 'Эялир'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = 8404992
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Panel3: TPanel
      Left = 2
      Top = 67
      Width = 353
      Height = 105
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object DBGrid2: TDBGrid
        Left = 1
        Top = 1
        Width = 351
        Height = 103
        Align = alClient
        BorderStyle = bsNone
        Color = clWhite
        DataSource = DS_AccountRevenue
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = 8404992
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Color = 14737632
            Expanded = False
            FieldName = 'VAL_NAME'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = '$'
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ACC_NO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Щесаб'
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 151
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TYPE'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BRANCHNAME'
            Title.Alignment = taCenter
            Title.Caption = 'Филиал'
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 95
            Visible = True
          end>
      end
    end
    object Panel5: TPanel
      Left = 2
      Top = 15
      Width = 353
      Height = 52
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object SpeedButton2: TSpeedButton
        Left = 323
        Top = 5
        Width = 28
        Height = 21
        Caption = '+'
        Flat = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton2Click
      end
      object Revenue: TSearchEdit
        Left = 2
        Top = 5
        Width = 180
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DataSource = DataModWU.DSAccount
        SearchField = 'ACC_NO'
      end
      object DBViewComboBox3: TDBViewComboBox
        Left = 184
        Top = 5
        Width = 57
        Height = 21
        Style = csDropDownList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        ListSource = DataModWU.DSValute
        ListFields = 'VAL_NAME'
        FieldInterval = 5
        DropDownOnEnter = False
      end
      object R_ComboDC: TComboBox
        Left = 242
        Top = 5
        Width = 79
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        Items.Strings = (
          'DEBIT'
          'CREDIT')
      end
      object R_ComboBranch: TDBViewComboBox
        Left = 2
        Top = 28
        Width = 180
        Height = 21
        Style = csDropDownList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 3
        ListSource = DataModWU.DSBranch
        ListFields = 'BRANCHNAME'
        FieldInterval = 5
        DropDownOnEnter = False
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 353
    Width = 357
    Height = 39
    Align = alBottom
    Caption = 'Ямялиййатлар'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = 8404992
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
    object CheckBox2: TCheckBox
      Left = 13
      Top = 16
      Width = 140
      Height = 17
      Caption = 'Цмумиляшдирилмиш формада'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object AccountPrincipial: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   wu.RowID,'
      '   wu.*,'
      '   v.val_name,'
      '   a.acc_no,'
      '   wb.branchname'
      'from'
      '  wu_accounts wu,'
      '  avalute v,'
      '  account a,'
      '  wu_branch wb'
      'where'
      '  wu.currency = v.valute and'
      '  wu.accid=a.id and'
      '  accounttype = 0 and'
      '  wu.branchid = wb.branchid'
      'order by currency')
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
    Left = 296
    Top = 144
  end
  object DS_AccountPrincipial: TDataSource
    DataSet = AccountPrincipial
    Left = 256
    Top = 144
  end
  object DS_AccountRevenue: TDataSource
    DataSet = AccountRevenue
    Left = 280
    Top = 336
  end
  object AccountRevenue: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   wu.RowID,'
      '   wu.*,'
      '   v.val_name,'
      '   a.acc_no,'
      '   wb.branchname'
      'from'
      '  wu_accounts wu,'
      '  avalute v,'
      '  account a,'
      '  wu_branch wb'
      'where'
      '  wu.currency = v.valute and'
      '  wu.accid=a.id and'
      '  accounttype = 1 and'
      '  wu.branchid = wb.branchid'
      'order by currency')
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
    Left = 312
    Top = 336
  end
end
