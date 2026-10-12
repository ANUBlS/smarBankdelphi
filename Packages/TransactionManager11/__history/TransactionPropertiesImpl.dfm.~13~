object TransactionEditForm: TTransactionEditForm
  Left = 398
  Top = 183
  ActiveControl = DebitCurrencyIDEdit
  BorderStyle = bsDialog
  Caption = 'TransactionEditForm'
  ClientHeight = 391
  ClientWidth = 804
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 30
    Width = 804
    Height = 125
    Align = alTop
    TabOrder = 0
    object HeaderControl1: THeaderControl
      Left = 2
      Top = 15
      Width = 800
      Height = 17
      Sections = <
        item
          ImageIndex = -1
          Text = 'DEBET'
          Width = 327
        end
        item
          ImageIndex = -1
          Text = 'KRED'#304'T'
          Width = 360
        end>
      Style = hsFlat
    end
    object Panel1: TPanel
      Left = 2
      Top = 32
      Width = 399
      Height = 92
      BevelInner = bvLowered
      TabOrder = 0
      object PanelDebit: TPanel
        Left = 2
        Top = 68
        Width = 395
        Height = 22
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 2
        object PanelDebitRest: TPanel
          Left = 1
          Top = 1
          Width = 393
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
            DataField = 'BALANCE'
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
            DataField = 'LBALANCE'
            DataSource = TransactionDataModule.DebitAccs
          end
        end
      end
      object Panel4: TPanel
        Left = 2
        Top = 46
        Width = 395
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 3
        object DebitAccNameCB: TDBLookupComboBox
          Left = 1
          Top = 1
          Width = 391
          Height = 21
          Color = clSilver
          DataField = 'DEBITID'
          DataSource = TransactionDataModule.TransactionsData
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = TransactionDataModule.DebitAccs
          TabOrder = 0
          TabStop = False
          OnDropDown = DebitAccNoLookUpDropDown
        end
      end
      object Panel5: TPanel
        Left = 2
        Top = 24
        Width = 395
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object DebitAccNoLookUp: TDBLookupComboBox
          Left = 192
          Top = 1
          Width = 200
          Height = 21
          Color = clSilver
          DataField = 'DEBITID'
          DataSource = TransactionDataModule.TransactionsData
          KeyField = 'ID'
          ListField = 'ACC_NO'
          ListSource = TransactionDataModule.DebitAccs
          TabOrder = 1
          TabStop = False
          OnDropDown = DebitAccNoLookUpDropDown
        end
        object DebtAccSearchEdit: TSearchEdit
          Left = 1
          Top = 1
          Width = 190
          Height = 21
          TabOrder = 0
          OnChange = DebtAccSearchEditChange
          OnEnter = DebtAccSearchEditEnter
          DataSource = TransactionDataModule.DebitAccs
          SearchField = 'ACC_NO_SEARCH'
        end
      end
      object Panel6: TPanel
        Left = 2
        Top = 2
        Width = 395
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object DebitCurrencyIDEdit: TDBEdit
          Left = 1
          Top = 0
          Width = 59
          Height = 21
          DataField = 'DEBITCURRENCYID'
          DataSource = TransactionDataModule.TransactionsData
          TabOrder = 0
          OnExit = DebitCurrencyIDEditExit
        end
        object DebitCurrencyRate: TDBEdit
          Left = 285
          Top = 1
          Width = 107
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'DEBITRATE'
          DataSource = TransactionDataModule.TransactionsData
          TabOrder = 1
          OnChange = DebitCurrencyRateChange
        end
        object DebitCurrencyLookUp: TDBLookupComboBox
          Left = 60
          Top = 0
          Width = 223
          Height = 21
          Color = clSilver
          DataField = 'DEBITCURRENCYID'
          DataSource = TransactionDataModule.TransactionsData
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = TransactionDataModule.DebitCurrency
          TabOrder = 2
          TabStop = False
          OnCloseUp = DebitCurrencyLookUpCloseUp
        end
      end
    end
    object Panel2: TPanel
      Left = 401
      Top = 32
      Width = 400
      Height = 92
      BevelInner = bvLowered
      TabOrder = 1
      object PanelCredit: TPanel
        Left = 2
        Top = 68
        Width = 396
        Height = 22
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 2
        object PanelCreditRest: TPanel
          Left = 1
          Top = 1
          Width = 394
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
            DataField = 'BALANCE'
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
            DataField = 'LBALANCE'
            DataSource = TransactionDataModule.CreditAccs
          end
        end
      end
      object Panel8: TPanel
        Left = 2
        Top = 46
        Width = 396
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 3
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 1
          Top = 1
          Width = 392
          Height = 21
          Color = clSilver
          DataField = 'CREDITID'
          DataSource = TransactionDataModule.TransactionsData
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = TransactionDataModule.CreditAccs
          TabOrder = 0
          TabStop = False
          OnDropDown = CreditAccNoLookUpDropDown
        end
      end
      object Panel9: TPanel
        Left = 2
        Top = 24
        Width = 396
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object CreditAccNoLookUp: TDBLookupComboBox
          Left = 193
          Top = 0
          Width = 200
          Height = 21
          Color = clSilver
          DataField = 'CREDITID'
          DataSource = TransactionDataModule.TransactionsData
          KeyField = 'ID'
          ListField = 'ACC_NO'
          ListSource = TransactionDataModule.CreditAccs
          TabOrder = 1
          TabStop = False
          OnDropDown = CreditAccNoLookUpDropDown
        end
        object CreditAccSearchEdit: TSearchEdit
          Left = 1
          Top = 1
          Width = 190
          Height = 21
          TabOrder = 0
          OnChange = CreditAccSearchEditChange
          OnEnter = CreditAccSearchEditEnter
          DataSource = TransactionDataModule.CreditAccs
          SearchField = 'ACC_NO_SEARCH'
        end
      end
      object Panel10: TPanel
        Left = 2
        Top = 2
        Width = 396
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object CreditCurrencyIDEdit: TDBEdit
          Left = 1
          Top = 0
          Width = 59
          Height = 21
          DataField = 'CREDITCURRENCYID'
          DataSource = TransactionDataModule.TransactionsData
          TabOrder = 0
          OnExit = CreditCurrencyIDEditExit
        end
        object CreditCurrencyRate: TDBEdit
          Left = 283
          Top = 0
          Width = 112
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'CREDITRATE'
          DataSource = TransactionDataModule.TransactionsData
          TabOrder = 1
          OnChange = DebitCurrencyRateChange
        end
        object CreditCurrencyLookUp: TDBLookupComboBox
          Left = 60
          Top = 0
          Width = 222
          Height = 21
          Color = clSilver
          DataField = 'CREDITCURRENCYID'
          DataSource = TransactionDataModule.TransactionsData
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = TransactionDataModule.CreditCurrency
          TabOrder = 2
          TabStop = False
          OnCloseUp = CreditCurrencyLookUpCloseUp
        end
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 155
    Width = 804
    Height = 64
    Align = alTop
    Caption = 'M'#601'bl'#601#287'l'#601'r'
    TabOrder = 1
    object Panel11: TPanel
      Left = 2
      Top = 15
      Width = 326
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'Debet m'#601'bl'#601#287
      TabOrder = 0
      object CurrencyEditDebit: TCurrencyEdit
        Tag = 1
        Left = 96
        Top = 1
        Width = 229
        Height = 21
        TabOrder = 0
        Text = '0'
        OnChange = CurrencyEditDebitChange
      end
    end
    object Panel12: TPanel
      Left = 328
      Top = 15
      Width = 326
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'Kredit m'#601'bl'#601#287
      TabOrder = 1
      object CurrencyEditCredit: TCurrencyEdit
        Tag = 2
        Left = 96
        Top = 1
        Width = 229
        Height = 21
        TabOrder = 0
        Text = '0'
        OnChange = CurrencyEditDebitChange
      end
    end
    object Panel13: TPanel
      Left = 2
      Top = 38
      Width = 652
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'Milli valyutada ekvivalent'
      TabOrder = 2
      object CurrencyEditLammount: TCurrencyEdit
        Tag = 3
        Left = 211
        Top = 1
        Width = 229
        Height = 21
        TabStop = False
        TabOrder = 0
        Text = '0'
        OnChange = CurrencyEditDebitChange
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 219
    Width = 804
    Height = 64
    Align = alTop
    Caption = 'M'#601'lumat'
    TabOrder = 2
    object Panel14: TPanel
      Left = 2
      Top = 38
      Width = 800
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
      end
      object ConvertationSymbolLookUp: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 605
        Height = 21
        Color = clSilver
        DataField = 'OUTBALANCECHAR'
        DataSource = TransactionDataModule.TransactionsData
        KeyField = 'ID'
        ListField = 'FULLPATH'
        ListSource = TransactionDataModule.ConvertationSymbolsData
        TabOrder = 1
        TabStop = False
      end
    end
    object Panel15: TPanel
      Left = 2
      Top = 15
      Width = 800
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'X'#601'zin'#601' simvolu'
      TabOrder = 0
      object CashSymbolLookUp: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 605
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
      end
    end
  end
  object Panel16: TPanel
    Left = 0
    Top = 282
    Width = 804
    Height = 23
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = #399'm'#601'liyyat t'#601'yinat'#305
    TabOrder = 3
    object TrDestNoEdit: TEdit
      Left = 120
      Top = 1
      Width = 74
      Height = 21
      TabOrder = 0
      OnChange = TrDestNoEditChange
    end
    object ComboBox1: TComboBox
      Left = 194
      Top = 1
      Width = 605
      Height = 21
      TabOrder = 1
      TabStop = False
      OnClick = ComboBox1Click
      OnDropDown = ComboBox1DropDown
    end
    object DBEditDestination: TDBEdit
      Left = 194
      Top = 1
      Width = 587
      Height = 21
      DataField = 'NAME'
      DataSource = TransactionDataModule.TransactionsData
      TabOrder = 2
      OnChange = DBEditDestinationChange
    end
  end
  object Panel17: TPanel
    Left = 0
    Top = 356
    Width = 804
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
    object ButtonApply: TButton
      Left = 566
      Top = 4
      Width = 75
      Height = 25
      Action = ActionInsert
      Caption = '&Q'#601'bul'
      TabOrder = 0
    end
    object ButtonCancel: TButton
      Left = 646
      Top = 4
      Width = 75
      Height = 25
      Action = ActionCancel
      Caption = '&'#304'mtina'
      TabOrder = 1
    end
    object ButtonClose: TButton
      Left = 726
      Top = 4
      Width = 75
      Height = 25
      Action = ActionExit
      Caption = #199#305'x'#305#351
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
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 0
    Width = 804
    Height = 30
    Align = alTop
    TabOrder = 7
    object Label5: TLabel
      Left = 8
      Top = 9
      Width = 75
      Height = 13
      Caption = #399'm'#601'liyyat tarixi'
    end
    object Label6: TLabel
      Left = 287
      Top = 8
      Width = 64
      Height = 13
      Caption = #399'm'#601'liyyat '#8470
    end
    object Label7: TLabel
      Left = 517
      Top = 9
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
    object OperationTypeLookUp: TDBLookupComboBox
      Left = 645
      Top = 6
      Width = 151
      Height = 21
      Color = clSilver
      DataField = 'OPERATIONCODE'
      DataSource = TransactionDataModule.TransactionsData
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = TransactionDataModule.OperationTypesData
      TabOrder = 2
      TabStop = False
    end
    object DBEditOperationNo: TDBEdit
      Left = 358
      Top = 6
      Width = 78
      Height = 21
      DataField = 'OPERATIONNO'
      DataSource = TransactionDataModule.TransactionsData
      TabOrder = 1
      OnChange = DBEditDestinationChange
    end
    object DBEdit4: TDBEdit
      Left = 588
      Top = 6
      Width = 57
      Height = 21
      DataField = 'OPERATIONCODE'
      DataSource = TransactionDataModule.TransactionsData
      TabOrder = 3
      OnChange = DBEditDestinationChange
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 305
    Width = 804
    Height = 23
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = 'Hesabat t'#601'yinat'#305
    TabOrder = 4
    object ReportIDDBEdit: TDBEdit
      Left = 120
      Top = 1
      Width = 74
      Height = 21
      DataField = 'REPORTID'
      DataSource = TransactionDataModule.TransactionsData
      TabOrder = 0
    end
    object ReportIDLookUp: TDBLookupComboBox
      Left = 194
      Top = 1
      Width = 605
      Height = 21
      DataField = 'REPORTID'
      DataSource = TransactionDataModule.TransactionsData
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = TransactionDataModule.ReportDescsData
      TabOrder = 1
      OnCloseUp = DBEditDestinationChange
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 328
    Width = 804
    Height = 23
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = #214'lk'#601
    TabOrder = 5
    object CountrIDDBEdit: TDBEdit
      Left = 120
      Top = 1
      Width = 74
      Height = 21
      DataField = 'COUNTRID'
      DataSource = TransactionDataModule.TransactionsData
      TabOrder = 0
    end
    object CountrIDLookUp: TDBLookupComboBox
      Left = 194
      Top = 1
      Width = 605
      Height = 21
      DataField = 'COUNTRID'
      DataSource = TransactionDataModule.TransactionsData
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = TransactionDataModule.CountryData
      TabOrder = 1
      OnCloseUp = DBEditDestinationChange
    end
  end
  object ActionList1: TActionList
    Left = 560
    Top = 38
    object ActionInsert: TAction
      Caption = '&'#1043#1103#1073#1091#1083
      OnExecute = ActionInsertExecute
      OnUpdate = ActionInsertUpdate
    end
    object ActionCancel: TAction
      Caption = '&'#1048#1084#1090#1080#1085#1072
      OnExecute = ActionCancelExecute
      OnUpdate = ActionInsertUpdate
    end
    object ActionExit: TAction
      Caption = #1063#1099#1093#1099#1096
      OnExecute = ActionExitExecute
    end
  end
end
