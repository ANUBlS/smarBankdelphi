object TransactionEditForm: TTransactionEditForm
  Left = 192
  Top = 107
  ActiveControl = DebitCurrencyIDEdit
  BorderStyle = bsDialog
  Caption = 'TransactionEditForm'
  ClientHeight = 374
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
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
  object ButtonApply: TButton
    Left = 412
    Top = 340
    Width = 75
    Height = 25
    Action = ActionInsert
    Caption = '&Q'#601'bul'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyDown = ButtonApplyKeyDown
  end
  object ButtonCancel: TButton
    Left = 493
    Top = 340
    Width = 75
    Height = 25
    Action = ActionCancel
    Caption = '&'#304'mtina'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyDown = ButtonCancelKeyDown
  end
  object ButtonClose: TButton
    Left = 577
    Top = 340
    Width = 75
    Height = 25
    Action = ActionExit
    Caption = #199#305'x'#305#351
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TabStop = False
    OnKeyDown = ButtonCloseKeyDown
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 30
    Width = 659
    Height = 152
    Align = alTop
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object HeaderControl1: THeaderControl
      Left = 2
      Top = 16
      Width = 655
      Height = 14
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
      Top = 30
      Width = 326
      Height = 125
      BevelInner = bvLowered
      TabOrder = 0
      object PanelDebit: TPanel
        Left = 2
        Top = 97
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
            Width = 21
            Height = 14
            Caption = 'Ql'#305'q:'
          end
          object DBText1: TDBText
            Left = 35
            Top = 3
            Width = 109
            Height = 17
            DataField = 'BALANCE'
            DataSource = out_transactionDataModule.DebitAccs
          end
          object Label2: TLabel
            Left = 146
            Top = 3
            Width = 51
            Height = 14
            Caption = 'Ekvivalent:'
          end
          object DBText2: TDBText
            Left = 204
            Top = 3
            Width = 115
            Height = 17
            DataField = 'LBALANCE'
            DataSource = out_transactionDataModule.DebitAccs
          end
        end
      end
      object Panel4: TPanel
        Left = 2
        Top = 75
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 3
        object DebitAccNameCB: TDBLookupComboBox
          Left = 1
          Top = 1
          Width = 320
          Height = 21
          Color = clSilver
          DataField = 'DEBITID'
          DataSource = out_transactionDataModule.TransactionsData
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = out_transactionDataModule.DebitAccs
          ParentFont = False
          TabOrder = 0
          TabStop = False
          OnDropDown = DebitAccNoLookUpDropDown
        end
      end
      object Panel5: TPanel
        Left = 2
        Top = 53
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object DebitAccNoLookUp: TDBLookupComboBox
          Left = 157
          Top = 3
          Width = 164
          Height = 22
          Color = clSilver
          DataField = 'DEBITID'
          DataSource = out_transactionDataModule.TransactionsData
          DragKind = dkDock
          DropDownAlign = daCenter
          DropDownRows = 20
          DropDownWidth = 200
          KeyField = 'ID'
          ListField = 'ACC_NO'
          ListSource = out_transactionDataModule.DebitAccs
          TabOrder = 1
          OnDropDown = DebitAccNoLookUpDropDown
        end
        object DebtAccSearchEdit: TSearchEdit
          Left = 1
          Top = 1
          Width = 156
          Height = 22
          TabOrder = 0
          OnChange = DebtAccSearchEditChange
          OnEnter = DebtAccSearchEditEnter
          DataSource = out_transactionDataModule.DebitAccs
          SearchField = 'acc_no'
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
        object DebitCurrencyIDEdit: TDBEdit
          Left = 1
          Top = 0
          Width = 59
          Height = 22
          DataField = 'DEBITCURRENCYID'
          DataSource = out_transactionDataModule.TransactionsData
          TabOrder = 0
          OnExit = DebitCurrencyIDEditExit
          OnKeyDown = DebitCurrencyIDEditKeyDown
        end
        object DebitCurrencyRate: TDBEdit
          Left = 216
          Top = 0
          Width = 105
          Height = 22
          TabStop = False
          Color = clSilver
          DataField = 'DEBITRATE'
          DataSource = out_transactionDataModule.TransactionsData
          TabOrder = 1
          OnChange = DebitCurrencyRateChange
        end
        object DebitCurrencyLookUp: TDBLookupComboBox
          Left = 60
          Top = 0
          Width = 156
          Height = 22
          Color = clSilver
          DataField = 'DEBITCURRENCYID'
          DataSource = out_transactionDataModule.TransactionsData
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = out_transactionDataModule.DebitCurrency
          TabOrder = 2
          OnCloseUp = DebitCurrencyLookUpCloseUp
        end
      end
      object Panel3: TPanel
        Left = 2
        Top = 24
        Width = 322
        Height = 29
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 4
        object Label8: TLabel
          Left = 4
          Top = 8
          Width = 75
          Height = 14
          Caption = 'Debt M'#252#351't'#601'ri '#304'D:'
        end
        object Debt_Custid: TEdit
          Left = 80
          Top = 4
          Width = 239
          Height = 22
          Alignment = taCenter
          TabOrder = 0
          OnChange = Debt_CustidChange
          OnExit = Debt_CustidExit
        end
      end
    end
    object Panel2: TPanel
      Left = 328
      Top = 30
      Width = 326
      Height = 125
      BevelInner = bvLowered
      TabOrder = 1
      object PanelCredit: TPanel
        Left = 2
        Top = 97
        Width = 322
        Height = 22
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 2
        object PanelCreditRest: TPanel
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
            Height = 14
            Caption = 'Qal'#305'q:'
          end
          object DBText3: TDBText
            Left = 35
            Top = 3
            Width = 109
            Height = 17
            DataField = 'BALANCE'
            DataSource = out_transactionDataModule.CreditAccs
          end
          object Label4: TLabel
            Left = 146
            Top = 3
            Width = 51
            Height = 14
            Caption = 'Ekvivalent:'
          end
          object DBText4: TDBText
            Left = 204
            Top = 3
            Width = 115
            Height = 17
            DataField = 'LBALANCE'
            DataSource = out_transactionDataModule.CreditAccs
          end
        end
      end
      object Panel8: TPanel
        Left = 2
        Top = 75
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 3
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 1
          Top = 1
          Width = 320
          Height = 21
          Color = clSilver
          DataField = 'CREDITID'
          DataSource = out_transactionDataModule.TransactionsData
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = out_transactionDataModule.CreditAccs
          ParentFont = False
          TabOrder = 0
          TabStop = False
          OnDropDown = CreditAccNoLookUpDropDown
        end
      end
      object Panel9: TPanel
        Left = 2
        Top = 53
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object CreditAccNoLookUp: TDBLookupComboBox
          Left = 157
          Top = 1
          Width = 164
          Height = 22
          Color = clSilver
          DataField = 'CREDITID'
          DataSource = out_transactionDataModule.TransactionsData
          DropDownAlign = daCenter
          DropDownRows = 20
          DropDownWidth = 200
          KeyField = 'ID'
          ListField = 'ACC_NO'
          ListSource = out_transactionDataModule.CreditAccs
          TabOrder = 1
          OnDropDown = CreditAccNoLookUpDropDown
        end
        object CreditAccSearchEdit: TSearchEdit
          Left = 1
          Top = 1
          Width = 156
          Height = 22
          TabOrder = 0
          OnChange = CreditAccSearchEditChange
          OnEnter = CreditAccSearchEditEnter
          OnKeyDown = CreditAccSearchEditKeyDown
          DataSource = out_transactionDataModule.CreditAccs
          SearchField = 'acc_no'
        end
      end
      object Panel10: TPanel
        Left = 2
        Top = 2
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object CreditCurrencyIDEdit: TDBEdit
          Left = 1
          Top = 1
          Width = 59
          Height = 22
          DataField = 'CREDITCURRENCYID'
          DataSource = out_transactionDataModule.TransactionsData
          TabOrder = 0
          OnExit = CreditCurrencyIDEditExit
          OnKeyDown = CreditCurrencyIDEditKeyDown
        end
        object CreditCurrencyRate: TDBEdit
          Left = 216
          Top = 0
          Width = 105
          Height = 22
          TabStop = False
          Color = clSilver
          DataField = 'CREDITRATE'
          DataSource = out_transactionDataModule.TransactionsData
          TabOrder = 1
          OnChange = DebitCurrencyRateChange
        end
        object CreditCurrencyLookUp: TDBLookupComboBox
          Left = 60
          Top = 0
          Width = 156
          Height = 22
          Color = clSilver
          DataField = 'CREDITCURRENCYID'
          DataSource = out_transactionDataModule.TransactionsData
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = out_transactionDataModule.CreditCurrency
          TabOrder = 2
          TabStop = False
          OnCloseUp = CreditCurrencyLookUpCloseUp
        end
      end
      object Panel7: TPanel
        Left = 2
        Top = 24
        Width = 322
        Height = 29
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 4
        object Label9: TLabel
          Left = 4
          Top = 8
          Width = 84
          Height = 14
          Caption = 'Kredit  M'#252#351't'#601'ri '#304'D:'
        end
        object Kredit_Custid: TEdit
          Left = 89
          Top = 4
          Width = 232
          Height = 22
          Alignment = taCenter
          TabOrder = 0
          OnChange = Kredit_CustidChange
        end
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 182
    Width = 659
    Height = 64
    Align = alTop
    Caption = 'M'#601'bl'#601#287'l'#601'r'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Panel11: TPanel
      Left = 1
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
        Height = 22
        TabOrder = 0
        Text = '0'
        OnChange = CurrencyEditDebitChange
        OnExit = CurrencyEditDebitChange
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
        Height = 22
        TabOrder = 0
        Text = '0'
        OnChange = CurrencyEditDebitChange
        OnExit = CurrencyEditDebitChange
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
        Height = 22
        TabStop = False
        TabOrder = 0
        Text = '0'
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 246
    Width = 659
    Height = 64
    Align = alTop
    Caption = 'M'#601'lumatlar'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object Panel14: TPanel
      Left = 2
      Top = 39
      Width = 655
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
        Height = 22
        DataField = 'OUTBALANCECHAR'
        Enabled = False
        TabOrder = 0
        OnExit = ConvertationSymbolIDBEditExit
      end
      object ConvertationSymbolLookUp: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 460
        Height = 22
        Color = clSilver
        DataField = 'OUTBALANCECHAR'
        Enabled = False
        KeyField = 'ID'
        ListField = 'FULLPATH'
        TabOrder = 1
        TabStop = False
      end
    end
    object Panel15: TPanel
      Left = 2
      Top = 16
      Width = 655
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'Kassa simvolu'
      TabOrder = 0
      object CashSymbolLookUp: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 460
        Height = 22
        Color = clSilver
        DataField = 'INBALANCECHAR'
        Enabled = False
        KeyField = 'SYMBOL'
        ListField = 'NAME'
        TabOrder = 1
        TabStop = False
        OnDropDown = CashSymbolDBEditEnter
      end
      object CashSymbolDBEdit: TDBEdit
        Left = 118
        Top = 1
        Width = 74
        Height = 22
        DataField = 'INBALANCECHAR'
        Enabled = False
        TabOrder = 0
        OnEnter = CashSymbolDBEditEnter
        OnExit = CashSymbolDBEditExit
      end
    end
  end
  object Panel16: TPanel
    Left = 0
    Top = 311
    Width = 657
    Height = 24
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = #399'm'#601'liyyat'#305'n t'#601'yinat'#305
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object TrDestNoEdit: TEdit
      Left = 120
      Top = 1
      Width = 74
      Height = 22
      TabOrder = 0
      OnChange = TrDestNoEditChange
      OnKeyDown = TrDestNoEditKeyDown
    end
    object ComboBox1: TComboBox
      Left = 194
      Top = 1
      Width = 462
      Height = 22
      TabOrder = 1
      TabStop = False
      OnClick = ComboBox1Click
      OnDropDown = ComboBox1DropDown
    end
    object DBEditDestination: TDBEdit
      Left = 194
      Top = 1
      Width = 443
      Height = 22
      DataField = 'NAME'
      DataSource = out_transactionDataModule.TransactionsData
      TabOrder = 2
      OnKeyDown = DBEditDestinationKeyDown
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 0
    Width = 659
    Height = 30
    Align = alTop
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    object Label5: TLabel
      Left = 8
      Top = 9
      Width = 81
      Height = 14
      Caption = #399'm'#601'liyyat'#305'n tarixi'
    end
    object Label6: TLabel
      Left = 212
      Top = 9
      Width = 71
      Height = 14
      Caption = #399'm'#601'liyyat'#305'n '#8470
    end
    object Label7: TLabel
      Left = 374
      Top = 10
      Width = 63
      Height = 14
      Caption = #399'm'#601'liyyat tipi'
      Enabled = False
    end
    object TransDate: TDateTimePicker
      Left = 96
      Top = 7
      Width = 105
      Height = 21
      Date = 38125.661002002300000000
      Time = 38125.661002002300000000
      TabOrder = 0
      TabStop = False
      OnChange = TransDateChange
      OnKeyDown = TransDateKeyDown
    end
    object OperationTypeLookUp: TDBLookupComboBox
      Left = 504
      Top = 7
      Width = 151
      Height = 22
      Color = clSilver
      DataField = 'OPERATIONCODE'
      Enabled = False
      KeyField = 'ID'
      ListField = 'NAME'
      TabOrder = 2
      TabStop = False
    end
    object DBEditOperationNo: TDBEdit
      Left = 287
      Top = 7
      Width = 78
      Height = 22
      TabStop = False
      DataField = 'OPERATIONNO'
      TabOrder = 1
      OnChange = DBEditOperationNoChange
      OnKeyDown = DBEditOperationNoKeyDown
    end
    object DBEdit4: TDBEdit
      Left = 447
      Top = 7
      Width = 57
      Height = 22
      DataField = 'OPERATIONCODE'
      Enabled = False
      TabOrder = 3
    end
  end
  object ActionList1: TActionList
    Left = 576
    Top = 14
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
