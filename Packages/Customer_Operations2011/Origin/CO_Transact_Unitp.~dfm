object CO_Transactions: TCO_Transactions
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'CO_Transactions'
  ClientHeight = 375
  ClientWidth = 658
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 30
    Width = 658
    Height = 125
    Align = alTop
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object HeaderControl1: THeaderControl
      Left = 2
      Top = 15
      Width = 654
      Height = 17
      DragReorder = False
      Sections = <
        item
          ImageIndex = -1
          Text = 'ƒ≈Ѕ≈“'
          Width = 327
        end
        item
          ImageIndex = -1
          Text = ' –≈ƒ»“'
          Width = 360
        end>
      Style = hsFlat
    end
    object Panel1: TPanel
      Left = 2
      Top = 32
      Width = 326
      Height = 92
      BevelInner = bvLowered
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object PanelDebit: TPanel
        Left = 2
        Top = 68
        Width = 322
        Height = 22
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 2
        object PanelDebitRest: TPanel
          Left = 1
          Top = 1
          Width = 320
          Height = 20
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 4
            Top = 3
            Width = 27
            Height = 13
            Caption = '√алыг:'
          end
          object Label2: TLabel
            Left = 146
            Top = 3
            Width = 53
            Height = 13
            Caption = '≈квивалент:'
          end
          object d_pok_ostat: TLabel
            Left = 202
            Top = 3
            Width = 59
            Height = 13
            Caption = 'd_pok_ostat'
            Visible = False
          end
          object d_ostat: TLabel
            Left = 56
            Top = 4
            Width = 35
            Height = 13
            Caption = 'd_ostat'
            Visible = False
          end
        end
      end
      object Panel4: TPanel
        Left = 2
        Top = 46
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 3
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 0
          Top = 0
          Width = 321
          Height = 21
          KeyField = 'NAME'
          ListField = 'NAME'
          ListSource = DebitAccs
          TabOrder = 0
          TabStop = False
          OnClick = DBLookupComboBox2Click
        end
        object DBEdit2: TDBEdit
          Left = 0
          Top = 0
          Width = 305
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'NAME'
          DataSource = DebitAccs
          TabOrder = 1
        end
      end
      object Panel5: TPanel
        Left = 2
        Top = 24
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object DebtAccSearchEdit: TSearchEdit
          Tag = 1
          Left = 1
          Top = 1
          Width = 156
          Height = 21
          TabOrder = 1
          OnChange = DebtAccSearchEditChange
          OnKeyPress = DebtAccSearchEditKeyPress
          DataSource = DebitAccs
          SearchField = 'acc_no'
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 160
          Top = 0
          Width = 161
          Height = 21
          KeyField = 'ACC_NO'
          ListField = 'ACC_NO'
          ListSource = DebitAccs
          TabOrder = 0
          TabStop = False
          OnClick = DBLookupComboBox1Click
        end
        object DBEdit1: TDBEdit
          Left = 160
          Top = 0
          Width = 145
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'ACC_NO'
          DataSource = DebitAccs
          TabOrder = 2
        end
      end
      object Panel6: TPanel
        Left = 2
        Top = 2
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object editrate: TDBEdit
          Left = 240
          Top = 0
          Width = 80
          Height = 21
          TabStop = False
          DataField = 'RATE'
          DataSource = DebitCurrency
          TabOrder = 0
        end
        object val_code: TEdit
          Left = 0
          Top = 0
          Width = 69
          Height = 21
          TabOrder = 1
          OnChange = val_codeChange
          OnKeyPress = val_codeKeyPress
        end
      end
      object acc_id: TDBEdit
        Left = 176
        Top = 24
        Width = 73
        Height = 21
        TabStop = False
        DataField = 'ID'
        DataSource = DebitAccs
        TabOrder = 4
        Visible = False
      end
    end
    object Panel2: TPanel
      Left = 329
      Top = 33
      Width = 326
      Height = 92
      BevelInner = bvLowered
      TabOrder = 2
      object Panel7: TPanel
        Left = 2
        Top = 68
        Width = 322
        Height = 22
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 2
        object Panel8: TPanel
          Left = 1
          Top = 1
          Width = 320
          Height = 20
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label3: TLabel
            Left = 4
            Top = 3
            Width = 27
            Height = 13
            Caption = '√алыг:'
          end
          object Label4: TLabel
            Left = 146
            Top = 3
            Width = 53
            Height = 13
            Caption = '≈квивалент:'
          end
          object c_ostat: TLabel
            Left = 35
            Top = 4
            Width = 35
            Height = 13
            Caption = 'c_ostat'
            Visible = False
          end
          object c_pok_ostat: TLabel
            Left = 202
            Top = 3
            Width = 59
            Height = 13
            Caption = 'c_pok_ostat'
            Visible = False
          end
        end
      end
      object Panel9: TPanel
        Left = 2
        Top = 46
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 3
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 0
          Top = 0
          Width = 323
          Height = 21
          KeyField = 'NAME'
          ListField = 'NAME'
          ListSource = CreditAccs
          TabOrder = 0
          TabStop = False
          OnClick = DBLookupComboBox3Click
        end
        object DBEdit3: TDBEdit
          Left = 1
          Top = 1
          Width = 305
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'NAME'
          DataSource = CreditAccs
          TabOrder = 1
        end
      end
      object Panel10: TPanel
        Left = 2
        Top = 24
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object CreditAccSearchEdit: TSearchEdit
          Tag = 1
          Left = 1
          Top = 1
          Width = 156
          Height = 21
          TabOrder = 2
          OnChange = CreditAccSearchEditChange
          OnKeyPress = CreditAccSearchEditKeyPress
          DataSource = CreditAccs
          SearchField = 'acc_no'
        end
        object DBLookupComboBox4: TDBLookupComboBox
          Left = 157
          Top = 0
          Width = 167
          Height = 21
          KeyField = 'ACC_NO'
          ListField = 'ACC_NO'
          ListSource = CreditAccs
          TabOrder = 0
          TabStop = False
          OnClick = DBLookupComboBox4Click
        end
        object DBEdit5: TDBEdit
          Left = 157
          Top = 0
          Width = 149
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'ACC_NO'
          DataSource = CreditAccs
          TabOrder = 1
        end
      end
      object Panel11: TPanel
        Left = 2
        Top = 2
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object cur_val_code: TEdit
          Tag = 1
          Left = 0
          Top = 0
          Width = 64
          Height = 21
          TabOrder = 0
          OnChange = cur_val_codeChange
          OnKeyPress = cur_val_codeKeyPress
        end
        object editrate_: TDBEdit
          Left = 238
          Top = 0
          Width = 80
          Height = 21
          TabStop = False
          DataField = 'RATE'
          DataSource = CreditCurrency
          TabOrder = 1
        end
        object editvalute_: TDBLookupComboBox
          Left = 64
          Top = 0
          Width = 177
          Height = 21
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = CreditCurrency
          TabOrder = 2
          TabStop = False
          OnClick = editvalute_Click
          OnCloseUp = editvalute_CloseUp
        end
      end
    end
    object acc_id_: TDBEdit
      Left = 432
      Top = 40
      Width = 81
      Height = 21
      DataField = 'ID'
      DataSource = CreditAccs
      TabOrder = 3
      Visible = False
    end
    object editvalute: TDBLookupComboBox
      Left = 74
      Top = 34
      Width = 171
      Height = 21
      Color = clSilver
      DataField = 'DEBITCURRENCYID'
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DebitCurrency
      TabOrder = 4
      TabStop = False
      OnClick = editvaluteClick
      OnCloseUp = editvaluteCloseUp
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 155
    Width = 658
    Height = 64
    Align = alTop
    Caption = 'ћ€бл€ьл€р'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Panel3: TPanel
      Left = 4
      Top = 15
      Width = 326
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'ƒебет м€бл€ь'
      TabOrder = 0
      object debtvalue: TEdit
        Left = 87
        Top = 2
        Width = 232
        Height = 21
        TabOrder = 0
        Text = '0'
        OnChange = debtvalueChange
        OnKeyPress = debtvalueKeyPress
      end
    end
    object Panel12: TPanel
      Left = 328
      Top = 15
      Width = 326
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  редит м€бл€ь'
      TabOrder = 1
      object creditvalue: TEdit
        Left = 78
        Top = 0
        Width = 246
        Height = 21
        TabStop = False
        TabOrder = 0
        Text = '0'
        OnChange = creditvalueChange
      end
    end
    object Panel13: TPanel
      Left = 2
      Top = 38
      Width = 652
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' ћилли валйутада еквивалент'
      TabOrder = 2
      object ekv: TEdit
        Left = 200
        Top = 2
        Width = 249
        Height = 21
        TabStop = False
        TabOrder = 0
        Text = '0'
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 219
    Width = 658
    Height = 64
    Align = alTop
    Caption = 'ћ€луматлар'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Panel14: TPanel
      Left = 2
      Top = 38
      Width = 654
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  онвертасийа т€йинаты'
      Enabled = False
      TabOrder = 1
      object ConvertationSymbolLookUp: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 460
        Height = 21
        Color = clSilver
        KeyField = 'ID'
        ListField = 'FULLPATH'
        TabOrder = 0
        TabStop = False
      end
      object SearchEdit2: TSearchEdit
        Left = 118
        Top = 0
        Width = 73
        Height = 21
        TabStop = False
        Enabled = False
        TabOrder = 1
        SearchField = 'id'
      end
      object DBEdit7: TDBEdit
        Left = 192
        Top = 0
        Width = 441
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'FULLPATH'
        Enabled = False
        TabOrder = 2
      end
    end
    object Panel15: TPanel
      Left = 2
      Top = 15
      Width = 654
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  асса символу'
      TabOrder = 0
      object CashSymbolLookUp: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 460
        Height = 21
        Color = clSilver
        DataField = 'INBALANCECHAR'
        Enabled = False
        KeyField = 'SYMBOL'
        ListField = 'NAME'
        TabOrder = 0
        TabStop = False
      end
      object SearchEdit3: TSearchEdit
        Left = 118
        Top = 0
        Width = 72
        Height = 21
        TabStop = False
        Enabled = False
        TabOrder = 1
        SearchField = 'symbol '
      end
      object DBEdit8: TDBEdit
        Left = 193
        Top = 0
        Width = 440
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'NAME'
        Enabled = False
        TabOrder = 2
      end
    end
  end
  object Panel16: TPanel
    Left = 0
    Top = 282
    Width = 657
    Height = 23
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = ' ям€лиййатын т€йинаты'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object DBLookupComboBox5: TDBLookupComboBox
      Left = 194
      Top = 0
      Width = 460
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = CO_DataMod.Trdestinationdata
      TabOrder = 0
      TabStop = False
      OnClick = DBLookupComboBox5Click
    end
    object Trdest: TEdit
      Left = 120
      Top = 0
      Width = 73
      Height = 21
      TabOrder = 1
      OnChange = TrdestChange
      OnKeyPress = TrdestKeyPress
    end
    object dbedit6: TEdit
      Left = 192
      Top = 0
      Width = 441
      Height = 21
      TabOrder = 2
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 0
    Width = 658
    Height = 30
    Align = alTop
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Label5: TLabel
      Left = 8
      Top = 9
      Width = 77
      Height = 13
      Caption = 'ям€лиййатын тарихи'
    end
    object TransDate: TDateTimePicker
      Left = 96
      Top = 7
      Width = 105
      Height = 21
      CalAlignment = dtaLeft
      Date = 38125.6610020023
      Time = 38125.6610020023
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
  end
  object Panel17: TPanel
    Left = 0
    Top = 340
    Width = 658
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object ButtonApply: TButton
      Left = 421
      Top = 4
      Width = 75
      Height = 25
      Caption = '&√€бул'
      Enabled = False
      TabOrder = 0
      OnClick = ButtonApplyClick
    end
    object ButtonCancel: TButton
      Left = 501
      Top = 4
      Width = 75
      Height = 25
      Caption = '»мтина'
      Enabled = False
      TabOrder = 1
      TabStop = False
      OnClick = ButtonCancelClick
    end
    object ButtonClose: TButton
      Left = 581
      Top = 4
      Width = 75
      Height = 25
      Caption = '„ыхыш'
      TabOrder = 2
      TabStop = False
      OnClick = ButtonCloseClick
    end
  end
  object NLSLocalizer1: TNLSLocalizer
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsItalic]
    Left = 200
    Top = 312
  end
  object DebitCurrencyData: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select'
      '  currency.valute as ID,'
      '  currency.val_name as SName,'
      '  currency.valu_name as Name,'
      '  rates.OSTAT as Rate'
      'from'
      '  avalute currency,'
      '  TEMPRATE rates'
      'where'
      '  rates.VAL_KOD = currency.VALUTE'
      'order by currency.valute')
    QBEDefinition.QBEFieldDefs = {
      040000000400000002000000494401000000000005000000534E414D45010000
      000000040000004E414D450100000000000400000052415445010000000000}
    ReadOnly = True
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 16
    Top = 33
    object DebitCurrencyDataID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object DebitCurrencyDataSNAME: TStringField
      FieldName = 'SNAME'
      Size = 10
    end
    object DebitCurrencyDataNAME: TStringField
      FieldName = 'NAME'
      Size = 25
    end
    object DebitCurrencyDataRATE: TFloatField
      FieldName = 'RATE'
    end
  end
  object DebitCurrency: TDataSource
    DataSet = DebitCurrencyData
    Left = 50
    Top = 33
  end
  object DebitAccData: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  A.ID,'
      '  A.ACC_NO,'
      '  A.VAL_ACC,'
      '  A.NAME,'
      '  B.CASHINCOMING AS ISCACHEACCOUNT'
      'FROM'
      '  ACCOUNT A'
      ' ,BAL_SPR1 B '
      'WHERE'
      '  A.BAL_CN1 = B.BAL_CN'
      '  AND'
      '  A.CLOSE_DAT IS NULL'
      'ORDER BY ACC_NO'
      ' ')
    QBEDefinition.QBEFieldDefs = {
      0400000005000000020000004944010000000000060000004143435F4E4F0100
      000000000700000056414C5F414343010000000000040000004E414D45010000
      0000000E000000495343414348454143434F554E54010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 79
    Top = 37
  end
  object DebitAccs: TDataSource
    DataSet = DebitAccData
    Left = 114
    Top = 37
  end
  object CreditCurrencyData: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select'
      '  currency.valute as ID,'
      '  currency.val_name as SName,'
      '  currency.valu_name as Name,'
      '  rates.OSTAT as Rate'
      'from'
      '  avalute currency,'
      '  TEMPRATE rates'
      'where'
      '  rates.VAL_KOD = currency.VALUTE'
      'order by currency.valute')
    QBEDefinition.QBEFieldDefs = {
      040000000400000002000000494401000000000005000000534E414D45010000
      000000040000004E414D450100000000000400000052415445010000000000}
    ReadOnly = True
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 16
    Top = 65
    object CreditCurrencyDataID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object CreditCurrencyDataSNAME: TStringField
      FieldName = 'SNAME'
      Size = 10
    end
    object CreditCurrencyDataNAME: TStringField
      FieldName = 'NAME'
      Size = 25
    end
    object CreditCurrencyDataRATE: TFloatField
      FieldName = 'RATE'
    end
  end
  object CreditCurrency: TDataSource
    DataSet = CreditCurrencyData
    Left = 48
    Top = 65
  end
  object CreditAccData: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  A.ID,'
      '  A.ACC_NO,'
      '  A.VAL_ACC,'
      '  A.NAME,'
      '  B.CASHINCOMING AS ISCACHEACCOUNT'
      'FROM'
      '  ACCOUNT A'
      ' ,BAL_SPR1 B '
      'WHERE  '
      '  A.BAL_CN1 = B.BAL_CN'
      '  AND'
      '  A.CLOSE_DAT IS NULL'
      ''
      'ORDER BY ACC_NO')
    QBEDefinition.QBEFieldDefs = {
      0400000005000000020000004944010000000000060000004143435F4E4F0100
      000000000700000056414C5F414343010000000000040000004E414D45010000
      0000000E000000495343414348454143434F554E54010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 82
    Top = 61
  end
  object CreditAccs: TDataSource
    DataSet = CreditAccData
    Left = 114
    Top = 69
  end
end
