object PropertiesForm: TPropertiesForm
  Left = 127
  Top = 266
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PropertiesForm'
  ClientHeight = 381
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object But_cancel: TBitBtn
    Left = 506
    Top = 360
    Width = 58
    Height = 19
    Anchors = [akRight, akBottom]
    Caption = '„ыхыш'
    TabOrder = 0
    OnClick = But_cancelClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 569
    Height = 358
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 1
    object Panel4: TPanel
      Left = 304
      Top = 0
      Width = 265
      Height = 358
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 0
      object GroupBox4: TGroupBox
        Left = 2
        Top = 2
        Width = 261
        Height = 354
        Align = alClient
        Caption = 'SWIFT в€ HO — ўесаблары'
        TabOrder = 0
        object DBGrid2: TDBGrid
          Left = 2
          Top = 65
          Width = 257
          Height = 99
          Align = alTop
          BorderStyle = bsNone
          Color = clSilver
          DataSource = HoxDataSource
          Options = [dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 3
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'VAL_NAME'
              Title.Caption = '$'
              Width = 41
              Visible = True
            end
            item
              Alignment = taCenter
              Color = clWhite
              Expanded = False
              FieldName = 'HOX'
              Width = 145
              Visible = True
            end>
        end
        object Panel7: TPanel
          Left = 2
          Top = 15
          Width = 257
          Height = 24
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = ' ¬алйута:'
          TabOrder = 0
          object Combo_valute: TComboBox
            Left = 51
            Top = 1
            Width = 198
            Height = 21
            Style = csDropDownList
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
          end
          object Valute_ID: TListBox
            Left = 127
            Top = 4
            Width = 26
            Height = 16
            ItemHeight = 13
            TabOrder = 1
            Visible = False
          end
        end
        object Panel8: TPanel
          Left = 2
          Top = 39
          Width = 257
          Height = 26
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = ' HO —:'
          TabOrder = 1
          object SpeedButton3: TSpeedButton
            Left = 202
            Top = 3
            Width = 53
            Height = 21
            Anchors = [akRight, akBottom]
            Caption = 'ялав€ ет'
            OnClick = SpeedButton3Click
          end
          object search_hox: TSearchEdit
            Left = 51
            Top = 2
            Width = 146
            Height = 21
            CharCase = ecUpperCase
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier'
            Font.Style = []
            MaxLength = 16
            ParentFont = False
            TabOrder = 0
            DataSource = DataMod.Account_Source
            SearchField = 'acc_no'
          end
        end
        object Panel9: TPanel
          Left = 2
          Top = 164
          Width = 257
          Height = 26
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = ' SWIFT:'
          TabOrder = 2
          object SpeedButton4: TSpeedButton
            Left = 202
            Top = 3
            Width = 53
            Height = 21
            Anchors = [akRight, akBottom]
            Caption = 'ялав€ ет'
            OnClick = SpeedButton4Click
          end
          object search_swift: TSearchEdit
            Left = 51
            Top = 2
            Width = 146
            Height = 21
            CharCase = ecUpperCase
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier'
            Font.Style = []
            MaxLength = 16
            ParentFont = False
            TabOrder = 0
            DataSource = DataMod.Account_Source
            SearchField = 'acc_no'
          end
        end
        object DBGrid1: TDBGrid
          Left = 2
          Top = 190
          Width = 257
          Height = 112
          Align = alTop
          BorderStyle = bsNone
          Color = clSilver
          DataSource = SWDataSource
          Options = [dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 4
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'VAL_NAME'
              Title.Caption = '$'
              Width = 41
              Visible = True
            end
            item
              Alignment = taCenter
              Color = clWhite
              Expanded = False
              FieldName = 'SW'
              Width = 145
              Visible = True
            end>
        end
        object Panel14: TPanel
          Left = 2
          Top = 302
          Width = 257
          Height = 50
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 5
          object SpeedButton14: TSpeedButton
            Left = 200
            Top = 23
            Width = 53
            Height = 21
            Anchors = [akRight, akBottom]
            Caption = '√€бул ет'
            OnClick = SpeedButton14Click
          end
          object DBText1: TDBText
            Left = 2
            Top = 2
            Width = 253
            Height = 17
            Align = alTop
            DataField = 'NAME'
            DataSource = commision_DataSource
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 3
            Top = 23
            Width = 187
            Height = 21
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = commision_DataSource
            TabOrder = 0
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 304
      Height = 358
      Align = alLeft
      BevelInner = bvLowered
      Caption = 'Panel3'
      TabOrder = 1
      object GroupBox3: TGroupBox
        Left = 2
        Top = 80
        Width = 300
        Height = 38
        Align = alTop
        Caption = 'ўќ — -Ћимити'
        TabOrder = 0
        object SpeedButton5: TSpeedButton
          Left = 242
          Top = 11
          Width = 53
          Height = 21
          Anchors = [akRight, akBottom]
          Caption = '√€бул ет'
          OnClick = SpeedButton5Click
        end
        object Edit_limit: TCurrencyEdit
          Left = 10
          Top = 12
          Width = 229
          Height = 21
          TabOrder = 0
          Text = '0'
        end
      end
      object GroupBox1: TGroupBox
        Left = 2
        Top = 2
        Width = 300
        Height = 78
        Align = alTop
        Caption = 'SWIFT в€ HO — суб щесаблары'
        TabOrder = 1
        object Panel2: TPanel
          Left = 2
          Top = 46
          Width = 296
          Height = 31
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = ' ўќ — - мцхбир щесаб:'
          TabOrder = 1
          object SpeedButton1: TSpeedButton
            Left = 239
            Top = 4
            Width = 53
            Height = 21
            Anchors = [akRight, akBottom]
            Caption = '√€бул ет'
            OnClick = SpeedButton1Click
          end
          object Edit_hox: TEdit
            Left = 112
            Top = 4
            Width = 123
            Height = 21
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier'
            Font.Style = []
            MaxLength = 13
            ParentFont = False
            TabOrder = 0
            OnKeyPress = Edit_hoxKeyPress
          end
        end
        object Panel5: TPanel
          Left = 2
          Top = 15
          Width = 296
          Height = 31
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = ' SWIFT - мцхбир щесаб:'
          TabOrder = 0
          object SpeedButton2: TSpeedButton
            Left = 239
            Top = 5
            Width = 53
            Height = 21
            Anchors = [akRight, akBottom]
            Caption = '√€бул ет'
            OnClick = SpeedButton2Click
          end
          object Edit_swift: TEdit
            Left = 112
            Top = 4
            Width = 122
            Height = 21
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier'
            Font.Style = []
            MaxLength = 13
            ParentFont = False
            TabOrder = 0
            OnKeyPress = Edit_hoxKeyPress
          end
        end
      end
      object GroupBox5: TGroupBox
        Left = 2
        Top = 118
        Width = 300
        Height = 67
        Align = alTop
        Caption = 'SWIFT ‘айл директорийалары'
        TabOrder = 2
        object Panel10: TPanel
          Left = 2
          Top = 15
          Width = 296
          Height = 26
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = ' Ё€л€нл€р:'
          TabOrder = 0
          object SpeedButton8: TSpeedButton
            Left = 47
            Top = 4
            Width = 16
            Height = 18
            Caption = '...'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = SpeedButton8Click
          end
          object SpeedButton9: TSpeedButton
            Left = 239
            Top = 3
            Width = 53
            Height = 21
            Anchors = [akRight, akBottom]
            Caption = '√€бул ет'
            OnClick = SpeedButton9Click
          end
          object Edit_swIN: TEdit
            Left = 65
            Top = 3
            Width = 172
            Height = 21
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel11: TPanel
          Left = 2
          Top = 41
          Width = 296
          Height = 24
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = ' Ё€л€нл€р:'
          TabOrder = 1
          object SpeedButton10: TSpeedButton
            Left = 48
            Top = 3
            Width = 16
            Height = 18
            Caption = '...'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = SpeedButton10Click
          end
          object SpeedButton11: TSpeedButton
            Left = 239
            Top = 2
            Width = 53
            Height = 21
            Anchors = [akRight, akBottom]
            Caption = '√€бул ет'
            OnClick = SpeedButton11Click
          end
          object Edit_swOUT: TEdit
            Left = 65
            Top = 1
            Width = 172
            Height = 21
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      object GroupBox2: TGroupBox
        Left = 2
        Top = 185
        Width = 300
        Height = 67
        Align = alTop
        Caption = 'HOKS ‘айл директорийалары'
        TabOrder = 3
        object Panel6: TPanel
          Left = 2
          Top = 15
          Width = 296
          Height = 26
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = ' Ё€л€нл€р:'
          TabOrder = 0
          object But_in: TSpeedButton
            Left = 47
            Top = 4
            Width = 16
            Height = 18
            Caption = '...'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = But_inClick
          end
          object SpeedButton6: TSpeedButton
            Left = 239
            Top = 3
            Width = 53
            Height = 21
            Anchors = [akRight, akBottom]
            Caption = '√€бул ет'
            OnClick = SpeedButton6Click
          end
          object Edit_IN_Dir: TEdit
            Left = 65
            Top = 3
            Width = 172
            Height = 21
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel12: TPanel
          Left = 2
          Top = 41
          Width = 296
          Height = 24
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = ' Ё€л€нл€р:'
          TabOrder = 1
          object But_out: TSpeedButton
            Left = 48
            Top = 3
            Width = 16
            Height = 18
            Caption = '...'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = But_outClick
          end
          object SpeedButton7: TSpeedButton
            Left = 239
            Top = 2
            Width = 53
            Height = 21
            Anchors = [akRight, akBottom]
            Caption = '√€бул ет'
            OnClick = SpeedButton7Click
          end
          object Edit_out_dir: TEdit
            Left = 65
            Top = 1
            Width = 172
            Height = 21
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      object GroupBox6: TGroupBox
        Left = 2
        Top = 252
        Width = 300
        Height = 104
        Align = alClient
        Caption = 'ёд€ниш нювл€ринин  одлары'
        TabOrder = 4
        object SpeedButton13: TSpeedButton
          Left = 243
          Top = 81
          Width = 54
          Height = 21
          Caption = '’ариж ет'
          OnClick = SpeedButton13Click
        end
        object DBGrid3: TDBGrid
          Left = 2
          Top = 46
          Width = 239
          Height = 56
          Align = alLeft
          BorderStyle = bsNone
          Color = clSilver
          DataSource = DataMod.TransCodeDataSource
          Options = [dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NAME'
              Width = 180
              Visible = True
            end
            item
              Alignment = taCenter
              Color = clWhite
              Expanded = False
              FieldName = 'CODE'
              Width = 30
              Visible = True
            end>
        end
        object Panel13: TPanel
          Left = 2
          Top = 15
          Width = 296
          Height = 31
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = 'јды'
          TabOrder = 1
          object SpeedButton12: TSpeedButton
            Left = 239
            Top = 4
            Width = 53
            Height = 21
            Anchors = [akRight, akBottom]
            Caption = 'ялав€ ет'
            OnClick = SpeedButton12Click
          end
          object Edit_transcode_name: TEdit
            Left = 20
            Top = 4
            Width = 173
            Height = 21
            CharCase = ecUpperCase
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            MaxLength = 15
            ParentFont = False
            TabOrder = 0
          end
          object Edit_transCode_value: TSpinEdit
            Left = 194
            Top = 4
            Width = 43
            Height = 22
            MaxLength = 3
            MaxValue = 999
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
        end
      end
    end
  end
  object HOXAccount: TOracleDataSet
    SQL.Strings = (
      'select'
      '    v.val_name,a.acc_no as hox'
      'from'
      '    hoxsw_account h,avalute v, account a '
      'where'
      '    (h.valute=v.valute) and(h.hox_id=a.id)'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
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
    Left = 440
    Top = 47
  end
  object HoxDataSource: TDataSource
    DataSet = HOXAccount
    Left = 408
    Top = 96
  end
  object ForAll: TOracleDataSet
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
    Left = 368
    Top = 32
  end
  object Proper_pack: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'HOXPACK'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 402
    Top = 47
  end
  object SWAccount: TOracleDataSet
    SQL.Strings = (
      'select'
      '    v.val_name,a.acc_no as sw'
      'from'
      '    hoxsw_account h,avalute v, account a '
      'where'
      '    (h.valute=v.valute) and(h.swift_id=a.id)')
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
    Left = 480
    Top = 24
  end
  object SWDataSource: TDataSource
    DataSet = SWAccount
    Left = 440
    Top = 96
  end
  object Commision: TOracleDataSet
    SQL.Strings = (
      'select * from commision_trans')
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
    Left = 352
    Top = 232
  end
  object commision_DataSource: TDataSource
    DataSet = Commision
    Left = 396
    Top = 235
  end
end
