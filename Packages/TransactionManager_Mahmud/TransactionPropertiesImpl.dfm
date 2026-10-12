object TransactionEditForm: TTransactionEditForm
  Left = 398
  Top = 183
  ActiveControl = DebitCurrencyIDEdit
  BorderStyle = bsDialog
  ClientHeight = 402
  ClientWidth = 647
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 47
    Width = 647
    Height = 105
    Align = alTop
    TabOrder = 0
    object Panel1: TPanel
      Left = 2
      Top = 0
      Width = 320
      Height = 102
      BevelInner = bvLowered
      TabOrder = 0
      object PanelDebit: TPanel
        Left = 2
        Top = 78
        Width = 316
        Height = 22
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 2
        object PanelDebitRest: TPanel
          Left = 1
          Top = 1
          Width = 314
          Height = 20
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 4
            Top = 3
            Width = 28
            Height = 13
            Caption = 'Qal'#305'q:'
          end
          object DBText1: TDBText
            Left = 35
            Top = 3
            Width = 109
            Height = 17
            DataField = 'OSTAT'
            DataSource = TransactionDataModule.DebitAccs
          end
          object Label2: TLabel
            Left = 146
            Top = 3
            Width = 53
            Height = 13
            Caption = 'Ekvivalent:'
          end
          object DBText2: TDBText
            Left = 204
            Top = 3
            Width = 115
            Height = 17
            DataField = 'POK_OSTAT'
            DataSource = TransactionDataModule.DebitAccs
          end
        end
      end
      object Panel4: TPanel
        Left = 2
        Top = 52
        Width = 316
        Height = 26
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 3
        object DBEdit1: TDBEdit
          Left = 1
          Top = 3
          Width = 312
          Height = 21
          DataField = 'NAME'
          DataSource = TransactionDataModule.DebitAccs
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel5: TPanel
        Left = 2
        Top = 25
        Width = 316
        Height = 27
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object EditDebtBal_CN: TSearchEdit
          Left = 1
          Top = 3
          Width = 59
          Height = 21
          TabOrder = 0
          OnDblClick = EditDebtBal_CNDblClick
          OnKeyPress = EditDebtBal_CNKeyPress
          DataSource = TransactionDataModule.DEB_BAL_SPR1
          SearchField = 'BAL_CN'
        end
        object EditDebtAccNo: TEdit
          Left = 60
          Top = 3
          Width = 253
          Height = 21
          ReadOnly = True
          TabOrder = 1
          OnDblClick = EditDebtAccNoDblClick
          OnKeyPress = EditDebtAccNoKeyPress
        end
      end
      object Panel6: TPanel
        Left = 2
        Top = 2
        Width = 316
        Height = 23
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object DebitCurrencyIDEdit: TDBEdit
          Left = 1
          Top = 1
          Width = 30
          Height = 21
          DataField = 'DEBITCURRENCYID'
          DataSource = TransactionDataModule.TransactionsData
          TabOrder = 0
          OnExit = DebitCurrencyIDEditExit
          OnKeyPress = DebitCurrencyIDEditKeyPress
        end
        object DebitCurrencyRate: TDBEdit
          Left = 230
          Top = 1
          Width = 83
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'DEBITRATE'
          DataSource = TransactionDataModule.TransactionsData
          TabOrder = 1
          OnChange = DebitCurrencyRateChange
        end
        object DebitCurrencyLookUp: TDBLookupComboBox
          Left = 31
          Top = 1
          Width = 198
          Height = 21
          Color = clSilver
          DataField = 'DEBITCURRENCYID'
          DataSource = TransactionDataModule.TransactionsData
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = TransactionDataModule.DebitCurrency
          TabOrder = 2
          TabStop = False
        end
      end
    end
    object Panel2: TPanel
      Left = 322
      Top = 0
      Width = 320
      Height = 102
      BevelInner = bvLowered
      TabOrder = 1
      object PanelCredit: TPanel
        Left = 2
        Top = 78
        Width = 316
        Height = 22
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 2
        object PanelCreditRest: TPanel
          Left = 1
          Top = 1
          Width = 314
          Height = 20
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label3: TLabel
            Left = 4
            Top = 3
            Width = 28
            Height = 13
            Caption = 'Qal'#305'q:'
          end
          object DBText3: TDBText
            Left = 35
            Top = 3
            Width = 109
            Height = 17
            DataField = 'OSTAT'
            DataSource = TransactionDataModule.CreditAccs
          end
          object Label4: TLabel
            Left = 146
            Top = 3
            Width = 53
            Height = 13
            Caption = 'Ekvivalent:'
          end
          object DBText4: TDBText
            Left = 204
            Top = 3
            Width = 115
            Height = 17
            DataField = 'POK_OSTAT'
            DataSource = TransactionDataModule.CreditAccs
          end
        end
      end
      object Panel8: TPanel
        Left = 2
        Top = 52
        Width = 316
        Height = 26
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 3
        object DBEdit2: TDBEdit
          Left = 1
          Top = 3
          Width = 311
          Height = 21
          DataField = 'NAME'
          DataSource = TransactionDataModule.CreditAccs
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel9: TPanel
        Left = 2
        Top = 27
        Width = 316
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object EditKredBal_CN: TSearchEdit
          Left = 1
          Top = 1
          Width = 59
          Height = 21
          TabOrder = 0
          OnDblClick = EditKredBal_CNDblClick
          OnKeyPress = EditKredBal_CNKeyPress
          DataSource = TransactionDataModule.KRED_BAL_SPR1
          SearchField = 'BAL_CN'
        end
        object EditCredAccNo: TEdit
          Left = 60
          Top = 1
          Width = 252
          Height = 21
          ReadOnly = True
          TabOrder = 1
          OnDblClick = EditCredAccNoDblClick
          OnKeyPress = EditCredAccNoKeyPress
        end
      end
      object Panel10: TPanel
        Left = 2
        Top = 2
        Width = 316
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object CreditCurrencyIDEdit: TDBEdit
          Left = 1
          Top = 2
          Width = 30
          Height = 21
          DataField = 'CREDITCURRENCYID'
          DataSource = TransactionDataModule.TransactionsData
          TabOrder = 0
          OnExit = CreditCurrencyIDEditExit
          OnKeyPress = CreditCurrencyIDEditKeyPress
        end
        object CreditCurrencyRate: TDBEdit
          Left = 228
          Top = 2
          Width = 84
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'CREDITRATE'
          DataSource = TransactionDataModule.TransactionsData
          TabOrder = 1
          OnChange = DebitCurrencyRateChange
        end
        object CreditCurrencyLookUp: TDBLookupComboBox
          Left = 31
          Top = 2
          Width = 195
          Height = 21
          Color = clSilver
          DataField = 'CREDITCURRENCYID'
          DataSource = TransactionDataModule.TransactionsData
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = TransactionDataModule.CreditCurrency
          TabOrder = 2
          TabStop = False
        end
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 152
    Width = 647
    Height = 75
    Align = alTop
    Caption = 'M'#601'bl'#601#287'l'#601'r'
    TabOrder = 1
    object Panel11: TPanel
      Left = 5
      Top = 15
      Width = 317
      Height = 26
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'Debet m'#601'bl'#601#287
      TabOrder = 0
      object CurrencyEditDebit: TCurrencyEdit
        Tag = 1
        Left = 75
        Top = 3
        Width = 236
        Height = 21
        TabOrder = 0
        Text = '0'
        OnChange = CurrencyEditDebitChange
        OnKeyPress = CurrencyEditDebitKeyPress
      end
    end
    object Panel12: TPanel
      Left = 324
      Top = 15
      Width = 316
      Height = 26
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'Kredit m'#601'bl'#601#287
      TabOrder = 1
      object CurrencyEditCredit: TCurrencyEdit
        Tag = 2
        Left = 75
        Top = 3
        Width = 236
        Height = 21
        TabOrder = 0
        Text = '0'
        OnChange = CurrencyEditDebitChange
        OnKeyPress = CurrencyEditCreditKeyPress
      end
    end
    object Panel13: TPanel
      Left = 4
      Top = 42
      Width = 635
      Height = 26
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'Milli valyutada ekvivalent'
      TabOrder = 2
      object CurrencyEditLammount: TCurrencyEdit
        Tag = 3
        Left = 204
        Top = 3
        Width = 219
        Height = 21
        TabStop = False
        TabOrder = 0
        Text = '0'
        OnChange = CurrencyEditDebitChange
        OnKeyPress = CurrencyEditLammountKeyPress
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 227
    Width = 647
    Height = 137
    Align = alTop
    Caption = 'M'#601'lumat'
    TabOrder = 2
    object Panel14: TPanel
      Left = 2
      Top = 38
      Width = 643
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'Konvertasiya t'#601'yinat'#305
      TabOrder = 1
      object ConvertationSymbolIDBEdit: TDBEdit
        Left = 118
        Top = 1
        Width = 74
        Height = 21
        DataField = 'OUTBALANCECHAR'
        DataSource = TransactionDataModule.TransactionsData
        TabOrder = 0
        OnChange = DBEditDestinationChange
        OnExit = ConvertationSymbolIDBEditExit
        OnKeyPress = ConvertationSymbolIDBEditKeyPress
      end
      object ConvertationSymbolLookUp: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 442
        Height = 21
        Color = clSilver
        DataField = 'OUTBALANCECHAR'
        DataSource = TransactionDataModule.TransactionsData
        KeyField = 'ID'
        ListField = 'FULLPATH'
        ListSource = TransactionDataModule.ConvertationSymbolsData
        TabOrder = 1
        TabStop = False
        OnKeyPress = ConvertationSymbolLookUpKeyPress
      end
    end
    object Panel15: TPanel
      Left = 2
      Top = 15
      Width = 643
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'X'#601'zin'#601' simvolu'
      TabOrder = 0
      object CashSymbolLookUp: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 442
        Height = 21
        Color = clSilver
        DataField = 'INBALANCECHAR'
        DataSource = TransactionDataModule.TransactionsData
        KeyField = 'SYMBOL'
        ListField = 'NAME'
        ListSource = TransactionDataModule.CashSymbolsData
        TabOrder = 1
        TabStop = False
        OnDropDown = CashSymbolDBEditEnter
        OnKeyPress = CashSymbolLookUpKeyPress
      end
      object CashSymbolDBEdit: TDBEdit
        Left = 118
        Top = 1
        Width = 74
        Height = 21
        CharCase = ecUpperCase
        DataField = 'INBALANCECHAR'
        DataSource = TransactionDataModule.TransactionsData
        TabOrder = 0
        OnChange = DBEditDestinationChange
        OnEnter = CashSymbolDBEditEnter
        OnExit = CashSymbolDBEditExit
        OnKeyPress = CashSymbolDBEditKeyPress
      end
    end
    object Panel16: TPanel
      Left = 2
      Top = 61
      Width = 643
      Height = 24
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = #399'm'#601'liyyat t'#601'yinat'#305
      TabOrder = 2
      object TrDestNoEdit: TEdit
        Left = 118
        Top = 2
        Width = 74
        Height = 21
        TabOrder = 0
        OnChange = TrDestNoEditChange
        OnKeyPress = TrDestNoEditKeyPress
      end
      object ComboBox1: TComboBox
        Left = 192
        Top = 1
        Width = 442
        Height = 21
        TabOrder = 1
        TabStop = False
        OnClick = ComboBox1Click
        OnDropDown = ComboBox1DropDown
      end
      object DBEditDestination: TDBEdit
        Left = 192
        Top = 1
        Width = 423
        Height = 21
        DataField = 'NAME'
        DataSource = TransactionDataModule.TransactionsData
        TabOrder = 2
        OnChange = DBEditDestinationChange
        OnKeyPress = DBEditDestinationKeyPress
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 108
      Width = 643
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'Hesabat t'#601'yinat'#305
      TabOrder = 3
      object ReportIDDBEdit: TDBEdit
        Left = 118
        Top = 1
        Width = 74
        Height = 21
        DataField = 'REPORTID'
        DataSource = TransactionDataModule.TransactionsData
        TabOrder = 0
        OnKeyPress = ReportIDDBEditKeyPress
      end
      object ReportIDLookUp: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 442
        Height = 21
        DataField = 'REPORTID'
        DataSource = TransactionDataModule.TransactionsData
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = TransactionDataModule.ReportDescsData
        TabOrder = 1
        OnCloseUp = DBEditDestinationChange
        OnKeyPress = ReportIDLookUpKeyPress
      end
    end
    object Panel7: TPanel
      Left = 2
      Top = 85
      Width = 643
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = #214'lk'#601
      TabOrder = 4
      object CountrIDDBEdit: TDBEdit
        Left = 118
        Top = 1
        Width = 74
        Height = 21
        DataField = 'COUNTRID'
        DataSource = TransactionDataModule.TransactionsData
        TabOrder = 0
        OnKeyPress = CountrIDDBEditKeyPress
      end
      object CountrIDLookUp: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 442
        Height = 21
        DataField = 'COUNTRID'
        DataSource = TransactionDataModule.TransactionsData
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = TransactionDataModule.CountryData
        TabOrder = 1
        OnCloseUp = DBEditDestinationChange
        OnKeyPress = CountrIDLookUpKeyPress
      end
    end
  end
  object Panel17: TPanel
    Left = 0
    Top = 367
    Width = 647
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object ButtonApply: TButton
      Left = 405
      Top = 4
      Width = 75
      Height = 25
      Action = ActionInsert
      TabOrder = 0
    end
    object ButtonCancel: TButton
      Left = 485
      Top = 4
      Width = 75
      Height = 25
      Action = ActionCancel
      TabOrder = 1
    end
    object ButtonClose: TButton
      Left = 565
      Top = 4
      Width = 75
      Height = 25
      Action = ActionExit
      TabOrder = 2
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 8
      Top = 4
      Width = 145
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = TransactionDataModule.BProc
      TabOrder = 3
      Visible = False
    end
    object Button1: TButton
      Left = 160
      Top = 4
      Width = 97
      Height = 25
      Caption = 'Biznes Proses'
      TabOrder = 4
      Visible = False
      OnClick = Button1Click
    end
    object GoAml: TButton
      Left = 264
      Top = 4
      Width = 75
      Height = 25
      Caption = 'GoAml'
      TabOrder = 5
      Visible = False
      OnClick = GoAmlClick
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 0
    Width = 647
    Height = 30
    Align = alTop
    TabOrder = 4
    object Label5: TLabel
      Left = 8
      Top = 9
      Width = 75
      Height = 13
      Caption = #399'm'#601'liyyat tarixi'
    end
    object Label6: TLabel
      Left = 208
      Top = 11
      Width = 64
      Height = 13
      Caption = #399'm'#601'liyyat '#8470
    end
    object Label7: TLabel
      Left = 351
      Top = 7
      Width = 65
      Height = 13
      Caption = #399'm'#601'liyyat tipi'
    end
    object TransDate: TDateTimePicker
      Left = 96
      Top = 7
      Width = 105
      Height = 21
      Date = 38125.661002002300000000
      Time = 38125.661002002300000000
      TabOrder = 0
      OnChange = TransDateChange
    end
    object DBEditOperationNo: TDBEdit
      Left = 278
      Top = 7
      Width = 58
      Height = 21
      DataField = 'OPERATIONNO'
      DataSource = TransactionDataModule.TransactionsData
      TabOrder = 1
      OnChange = DBEditDestinationChange
    end
    object DBEdit4: TDBEdit
      Left = 428
      Top = 7
      Width = 48
      Height = 21
      DataField = 'OPERATIONCODE'
      DataSource = TransactionDataModule.TransactionsData
      TabOrder = 2
      OnChange = DBEditDestinationChange
    end
    object OperationTypeLookUp: TDBLookupComboBox
      Left = 482
      Top = 7
      Width = 151
      Height = 21
      Color = clSilver
      DataField = 'OPERATIONCODE'
      DataSource = TransactionDataModule.TransactionsData
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = TransactionDataModule.OperationTypesData
      TabOrder = 3
      TabStop = False
    end
  end
  object HeaderControl1: THeaderControl
    Left = 0
    Top = 30
    Width = 647
    Height = 17
    Sections = <
      item
        ImageIndex = -1
        Text = 'DEBET'
        Width = 321
      end
      item
        ImageIndex = -1
        Text = 'KRED'#304'T'
        Width = 360
      end>
    Style = hsFlat
  end
  object ActionList1: TActionList
    Left = 472
    Top = 6
    object ActionInsert: TAction
      Caption = '&Q'#601'bul'
      OnExecute = ActionInsertExecute
      OnUpdate = ActionInsertUpdate
    end
    object ActionCancel: TAction
      Caption = '&'#304'mtina'
      OnExecute = ActionCancelExecute
      OnUpdate = ActionInsertUpdate
    end
    object ActionExit: TAction
      Caption = #199#305'x'#305#351
      OnExecute = ActionExitExecute
    end
  end
end
