object TransactionPropertiesForm: TTransactionPropertiesForm
  Left = 179
  Top = 146
  Width = 668
  Height = 487
  Caption = 'TransactionPropertiesForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = OnKeyPressed
  PixelsPerInch = 96
  TextHeight = 13
  object AccountGB: TGroupBox
    Left = 0
    Top = 30
    Width = 660
    Height = 185
    Align = alTop
    Caption = 'Щесаблар'
    TabOrder = 0
    object HeaderControl1: THeaderControl
      Left = 2
      Top = 15
      Width = 656
      Height = 17
      DragReorder = False
      Sections = <
        item
          ImageIndex = -1
          Text = 'ДЕБЕТ'
          Width = 327
        end
        item
          ImageIndex = -1
          Text = 'КРЕДИТ'
          Width = 329
        end>
      Style = hsFlat
    end
    object HeaderControl2: THeaderControl
      Left = 2
      Top = 32
      Width = 656
      Height = 17
      DragReorder = False
      Sections = <
        item
          ImageIndex = -1
          Text = 'В. коду'
          Width = 60
        end
        item
          ImageIndex = -1
          Text = 'Валйута'
          Width = 158
        end
        item
          ImageIndex = -1
          Text = 'Мязяння'
          Width = 109
        end
        item
          ImageIndex = -1
          Text = 'В. коду'
          Width = 60
        end
        item
          ImageIndex = -1
          Text = 'Валйута'
          Width = 158
        end
        item
          ImageIndex = -1
          Text = 'Мязяння'
          Width = 109
        end>
      Style = hsFlat
    end
    object Panel1: TPanel
      Left = 2
      Top = 49
      Width = 656
      Height = 81
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 2
      object Panel2: TPanel
        Left = 2
        Top = 0
        Width = 327
        Height = 81
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
        object Panel3: TPanel
          Left = 0
          Top = 63
          Width = 327
          Height = 18
          BevelOuter = bvLowered
          TabOrder = 0
          object Label1: TLabel
            Left = 3
            Top = 2
            Width = 27
            Height = 13
            Caption = 'Галыг:'
          end
          object DebitAccBalanceLabel: TLabel
            Left = 34
            Top = 3
            Width = 115
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'DebitAccBalanceLabel'
          end
          object Label3: TLabel
            Left = 154
            Top = 2
            Width = 59
            Height = 13
            Caption = ', Еквивалент:'
          end
          object DebitLBalanceLabel: TLabel
            Left = 217
            Top = 2
            Width = 109
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'DebitLBalanceLabel'
          end
        end
        object DebetAccNamePanel: TPanel
          Left = 0
          Top = 41
          Width = 327
          Height = 22
          Alignment = taLeftJustify
          BevelInner = bvLowered
          TabOrder = 1
          object DebitAccNameCB: TDBLookupComboBox
            Left = 0
            Top = 1
            Width = 327
            Height = 21
            Color = clSilver
            DataField = 'DEBITID'
            DataSource = TransactionsDataModule.Transactions
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = TransactionsDataModule.DebitAccs
            TabOrder = 0
            TabStop = False
          end
        end
        object DebetAccNoPanel: TPanel
          Left = 0
          Top = 20
          Width = 327
          Height = 22
          Alignment = taLeftJustify
          BevelInner = bvLowered
          TabOrder = 3
          object DebitAccNoSearchEdit: TEdit
            Left = 0
            Top = 1
            Width = 163
            Height = 21
            TabOrder = 0
            Text = 'DebitAccNoSearchEdit'
            OnChange = DebitAccNoSearchEditChange
            OnExit = DebitAccNoSearchEditExit
            OnKeyDown = DebitAccNoSearchEditKeyDown
          end
          object DebitAccNoCB: TDBLookupComboBox
            Left = 163
            Top = 1
            Width = 164
            Height = 21
            Color = clSilver
            DataField = 'DEBITID'
            DataSource = TransactionsDataModule.Transactions
            KeyField = 'ID'
            ListField = 'ACC_NO'
            ListSource = TransactionsDataModule.DebitAccs
            TabOrder = 1
            TabStop = False
          end
        end
        object DebetCurrencyPanel: TPanel
          Left = 0
          Top = 0
          Width = 327
          Height = 22
          Alignment = taLeftJustify
          BevelInner = bvLowered
          TabOrder = 2
          object DebitCurrencyIDEdit: TDBEdit
            Left = 0
            Top = 0
            Width = 60
            Height = 21
            DataField = 'DEBITCURRENCYID'
            DataSource = TransactionsDataModule.Transactions
            TabOrder = 0
          end
          object DBEdit5: TDBEdit
            Left = 215
            Top = 0
            Width = 110
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'DEBITRATE'
            DataSource = TransactionsDataModule.Transactions
            TabOrder = 2
          end
          object DebitCurrencyCB: TDBViewComboBox
            Left = 60
            Top = 0
            Width = 156
            Height = 21
            TabStop = False
            Style = csDropDownList
            Color = clSilver
            ItemHeight = 13
            TabOrder = 1
            OnChange = DebitCurrencyCBChange
            ListSource = TransactionsDataModule.DebitCurrency
            ListFields = 'NAME'
            FieldInterval = 5
            DropDownOnEnter = False
            FirstAfterOpen = True
          end
        end
      end
      object Panel4: TPanel
        Left = 328
        Top = 1
        Width = 327
        Height = 80
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 1
        object Panel5: TPanel
          Left = 0
          Top = 62
          Width = 327
          Height = 18
          BevelOuter = bvLowered
          TabOrder = 0
          object Label4: TLabel
            Left = 3
            Top = 2
            Width = 27
            Height = 13
            Caption = 'Галыг:'
          end
          object CreditAccBalanceLabel: TLabel
            Left = 32
            Top = 3
            Width = 113
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'DebitAccBalanceLabel'
          end
          object Label6: TLabel
            Left = 147
            Top = 2
            Width = 59
            Height = 13
            Caption = ', Еквивалент:'
          end
          object CreditLBalanceLabel: TLabel
            Left = 209
            Top = 2
            Width = 117
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'CreditLBalanceLabel'
          end
        end
        object CreditAccNamePanel: TPanel
          Left = 0
          Top = 40
          Width = 327
          Height = 22
          Alignment = taLeftJustify
          BevelInner = bvLowered
          TabOrder = 1
          object CreditAccNameCB: TDBLookupComboBox
            Left = 0
            Top = 1
            Width = 328
            Height = 21
            Color = clSilver
            DataField = 'CREDITID'
            DataSource = TransactionsDataModule.Transactions
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = TransactionsDataModule.CreditAccs
            TabOrder = 0
            TabStop = False
          end
        end
        object CreditAccNoPanel: TPanel
          Left = 0
          Top = 19
          Width = 327
          Height = 22
          Alignment = taLeftJustify
          BevelInner = bvLowered
          TabOrder = 3
          object CreditAccNoSearchEdit: TEdit
            Left = -1
            Top = 1
            Width = 164
            Height = 21
            TabOrder = 0
            Text = 'CreditAccNoSearchEdit'
            OnChange = CreditAccNoSearchEditChange
            OnExit = CreditAccNoSearchEditExit
            OnKeyDown = DebitAccNoSearchEditKeyDown
          end
          object CreditAccNoCB: TDBLookupComboBox
            Left = 163
            Top = 1
            Width = 164
            Height = 21
            Color = clSilver
            DataField = 'CREDITID'
            DataSource = TransactionsDataModule.Transactions
            KeyField = 'ID'
            ListField = 'ACC_NO'
            ListSource = TransactionsDataModule.CreditAccs
            TabOrder = 1
            TabStop = False
          end
        end
        object CreditCurrencyPanel: TPanel
          Left = 0
          Top = 0
          Width = 327
          Height = 21
          Alignment = taLeftJustify
          BevelInner = bvLowered
          TabOrder = 2
          object CreditCurrencyIDEdit: TDBEdit
            Left = -1
            Top = -1
            Width = 61
            Height = 21
            DataField = 'CREDITCURRENCYID'
            DataSource = TransactionsDataModule.Transactions
            TabOrder = 0
          end
          object DBEdit6: TDBEdit
            Left = 216
            Top = -1
            Width = 111
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'CREDITRATE'
            DataSource = TransactionsDataModule.Transactions
            TabOrder = 2
          end
          object CreditCurrencyCB: TDBViewComboBox
            Left = 60
            Top = -1
            Width = 156
            Height = 21
            TabStop = False
            Style = csDropDownList
            Color = clSilver
            ItemHeight = 13
            TabOrder = 1
            OnChange = CreditCurrencyCBChange
            ListSource = TransactionsDataModule.CreditCurrency
            ListFields = 'NAME'
            FieldInterval = 5
            DropDownOnEnter = False
            FirstAfterOpen = True
          end
        end
      end
    end
    object Panel6: TPanel
      Left = 2
      Top = 130
      Width = 656
      Height = 53
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Panel6'
      TabOrder = 3
      object DebetBankPanel: TPanel
        Left = 1
        Top = 1
        Width = 328
        Height = 51
        Alignment = taLeftJustify
        AutoSize = True
        BevelInner = bvLowered
        TabOrder = 0
        object Panel10: TPanel
          Left = 2
          Top = 2
          Width = 324
          Height = 24
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = 'Банкын коду:'
          TabOrder = 0
          object DBEdit1: TDBEdit
            Left = 175
            Top = 1
            Width = 149
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'DEBITBANK'
            DataSource = TransactionsDataModule.Transactions
            TabOrder = 0
          end
        end
        object Panel11: TPanel
          Left = 2
          Top = 26
          Width = 324
          Height = 23
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = 'Юдяйян банк:'
          TabOrder = 1
          object DBLookupComboBox5: TDBLookupComboBox
            Left = 104
            Top = 1
            Width = 222
            Height = 21
            Color = clSilver
            DataField = 'DEBITBANK'
            DataSource = TransactionsDataModule.Transactions
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = TransactionsDataModule.BankM
            TabOrder = 0
            TabStop = False
          end
        end
      end
      object CreditBankPanel: TPanel
        Left = 329
        Top = 1
        Width = 327
        Height = 51
        Alignment = taLeftJustify
        AutoSize = True
        BevelInner = bvLowered
        TabOrder = 1
        object Panel15: TPanel
          Left = 2
          Top = 2
          Width = 323
          Height = 24
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = 'Банкын коду:'
          TabOrder = 0
          object DBEdit2: TDBEdit
            Left = 174
            Top = 1
            Width = 149
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'CREDITBANK'
            DataSource = TransactionsDataModule.Transactions
            TabOrder = 0
          end
        end
        object Panel16: TPanel
          Left = 2
          Top = 26
          Width = 323
          Height = 23
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = 'Юдяйян банк:'
          TabOrder = 1
          object DBLookupComboBox6: TDBLookupComboBox
            Left = 101
            Top = 1
            Width = 222
            Height = 21
            Color = clSilver
            DataField = 'CREDITBANK'
            DataSource = TransactionsDataModule.Transactions
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = TransactionsDataModule.BankM
            TabOrder = 0
            TabStop = False
          end
        end
      end
    end
  end
  object AmmountGB: TGroupBox
    Left = 0
    Top = 215
    Width = 660
    Height = 66
    Align = alTop
    Caption = 'Мябляг'
    TabOrder = 1
    object DebetTrAmmountPanel: TPanel
      Left = 4
      Top = 15
      Width = 325
      Height = 50
      Alignment = taLeftJustify
      AutoSize = True
      BevelInner = bvLowered
      TabOrder = 0
      object DebetAmmountPanel: TPanel
        Left = 2
        Top = 2
        Width = 321
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = 'Мябляь:'
        TabOrder = 0
        object DebitAmountEdit: TCurrencyEdit
          Left = 96
          Top = 1
          Width = 227
          Height = 21
          TabOrder = 0
          Text = '0'
          OnChange = SetDebitAmmount
        end
      end
      object DebetLAmmountPanel: TPanel
        Left = 2
        Top = 25
        Width = 321
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = 'Милли валйутада:'
        TabOrder = 1
        object DebitLAmountEdit: TCurrencyEdit
          Left = 96
          Top = 1
          Width = 227
          Height = 21
          TabStop = False
          TabOrder = 0
          Text = '0'
          OnChange = SetLAmmount
          OnExit = CreditLAmountEditExit
        end
      end
    end
    object CreditTrAmmountPanel: TPanel
      Left = 329
      Top = 15
      Width = 329
      Height = 50
      Alignment = taLeftJustify
      AutoSize = True
      BevelInner = bvLowered
      TabOrder = 1
      object CreditAmmountPanel: TPanel
        Left = 2
        Top = 2
        Width = 325
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = 'Мябляь:'
        TabOrder = 0
        object CreditAmountEdit: TCurrencyEdit
          Left = 96
          Top = 1
          Width = 227
          Height = 21
          TabOrder = 0
          Text = '0'
          OnChange = SetCreditAmmount
        end
      end
      object CreditLAmmountPanel: TPanel
        Left = 2
        Top = 25
        Width = 325
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = 'Милли валйутада:'
        TabOrder = 1
        object CreditLAmountEdit: TCurrencyEdit
          Left = 96
          Top = 1
          Width = 227
          Height = 21
          TabStop = False
          TabOrder = 0
          Text = '0'
          OnChange = SetLAmmount
          OnExit = CreditLAmountEditExit
        end
      end
    end
  end
  object OtherGB: TGroupBox
    Left = 0
    Top = 281
    Width = 660
    Height = 149
    Align = alTop
    Caption = 'Мялуматлар'
    TabOrder = 2
    object Label14: TLabel
      Left = 4
      Top = 12
      Width = 97
      Height = 13
      Caption = 'Мцряккяб ямялиййат:'
    end
    object Label20: TLabel
      Left = 331
      Top = 10
      Width = 23
      Height = 13
      Caption = 'Филиал:'
    end
    object Label15: TLabel
      Left = 4
      Top = 31
      Width = 87
      Height = 13
      Caption = 'Пачканын нюмряси:'
    end
    object Label2: TLabel
      Left = 3
      Top = 69
      Width = 92
      Height = 13
      Caption = 'Ямялиййатын тяйинаты:'
    end
    object Label17: TLabel
      Left = 7
      Top = 127
      Width = 26
      Height = 13
      Caption = 'ВЮИН'
    end
    object Label12: TLabel
      Left = 333
      Top = 127
      Width = 26
      Height = 13
      Caption = 'ВЮИН'
    end
    object Label22: TLabel
      Left = 5
      Top = 109
      Width = 37
      Height = 13
      Caption = 'Мцштяри:'
    end
    object Label25: TLabel
      Left = 333
      Top = 109
      Width = 37
      Height = 13
      Caption = 'Мцштяри:'
    end
    object CompositeNumberEdit: TDBEdit
      Left = 103
      Top = 7
      Width = 35
      Height = 21
      TabStop = False
      DataField = 'SLOJ_PROV'
      TabOrder = 0
    end
    object CompositeCB: TDBLookupComboBox
      Left = 139
      Top = 7
      Width = 189
      Height = 21
      Color = clSilver
      DataField = 'SLOJ_PROV'
      KeyField = 'ID'
      ListField = 'NAME'
      TabOrder = 1
      TabStop = False
    end
    object DBEdit29: TDBEdit
      Left = 358
      Top = 7
      Width = 38
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'KOD_FIL'
      ReadOnly = True
      TabOrder = 4
      OnKeyPress = OnKeyPressed
    end
    object DBEdit22: TDBEdit
      Left = 397
      Top = 7
      Width = 260
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'FILIAL'
      ReadOnly = True
      TabOrder = 5
      OnKeyPress = OnKeyPressed
    end
    object TrNoEdit: TEdit
      Left = 5
      Top = 83
      Width = 41
      Height = 21
      TabOrder = 6
      OnChange = TrNoEditChange
    end
    object DBEdit14: TDBEdit
      Left = 47
      Top = 126
      Width = 165
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'DEBETINN'
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit16: TDBEdit
      Left = 371
      Top = 126
      Width = 165
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'KREDITINN'
      ReadOnly = True
      TabOrder = 8
    end
    object DBEdit24: TDBEdit
      Left = 47
      Top = 105
      Width = 278
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'DEBET_KLI'
      ReadOnly = True
      TabOrder = 9
    end
    object DBEdit27: TDBEdit
      Left = 371
      Top = 105
      Width = 281
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'KREDIT_KLI'
      ReadOnly = True
      TabOrder = 10
    end
    object GroupBox1: TGroupBox
      Left = 286
      Top = 28
      Width = 371
      Height = 54
      Caption = 'Касса символу:'
      TabOrder = 3
      object Label18: TLabel
        Left = 31
        Top = 15
        Width = 58
        Height = 13
        Caption = 'Балансдахили:'
      end
      object Label19: TLabel
        Left = 21
        Top = 33
        Width = 67
        Height = 13
        Caption = 'Конв. тяйинаты:'
      end
      object InbalanceCharCB: TDBLookupComboBox
        Left = 137
        Top = 10
        Width = 232
        Height = 21
        Color = clSilver
        DataField = 'INBALANCECHAR'
        DataSource = TransactionsDataModule.Transactions
        KeyField = 'SYMBOL'
        ListField = 'Name'
        ListSource = TransactionsDataModule.InBalanceSymbols
        TabOrder = 0
        TabStop = False
      end
      object OutBalanceCharCB: TDBLookupComboBox
        Left = 137
        Top = 31
        Width = 232
        Height = 21
        Color = clSilver
        DataField = 'OUTBALANCECHAR'
        DataSource = TransactionsDataModule.Transactions
        KeyField = 'ID'
        ListField = 'FULLPATH'
        ListSource = TransactionsDataModule.OutbalanceSymbols
        TabOrder = 1
        TabStop = False
      end
      object InBalanceCharEdit: TDBEdit
        Left = 96
        Top = 10
        Width = 41
        Height = 21
        DataField = 'INBALANCECHAR'
        DataSource = TransactionsDataModule.Transactions
        TabOrder = 2
        OnExit = InBalanceCharEditExit
      end
      object DBEdit11: TDBEdit
        Left = 96
        Top = 31
        Width = 41
        Height = 21
        TabStop = False
        Color = clWhite
        DataField = 'OUTBALANCECHAR'
        DataSource = TransactionsDataModule.Transactions
        TabOrder = 3
      end
    end
    object CypherGB: TGroupBox
      Left = 112
      Top = 28
      Width = 173
      Height = 55
      Caption = 'Шифр/Нюв'
      TabOrder = 2
      object OperationNameCB: TDBLookupComboBox
        Left = 2
        Top = 34
        Width = 171
        Height = 21
        Color = clSilver
        DataField = 'OPERATIONCODE'
        DataSource = TransactionsDataModule.Transactions
        KeyField = 'NAME'
        ListField = 'NAME'
        TabOrder = 0
        TabStop = False
      end
      object DBEdit8: TDBEdit
        Left = 3
        Top = 12
        Width = 61
        Height = 21
        TabStop = False
        DataField = 'CYPHERCODE'
        DataSource = TransactionsDataModule.Transactions
        TabOrder = 1
      end
      object DBEdit9: TDBEdit
        Left = 65
        Top = 12
        Width = 105
        Height = 21
        TabStop = False
        DataField = 'OPERATIONCODE'
        DataSource = TransactionsDataModule.Transactions
        TabOrder = 2
      end
    end
    object PackageNumberEdit: TDBEdit
      Left = 4
      Top = 47
      Width = 102
      Height = 21
      TabStop = False
      DataField = 'PACKAGENUMBER'
      DataSource = TransactionsDataModule.Transactions
      TabOrder = 12
    end
    object TrNameEdit: TDBEdit
      Left = 47
      Top = 83
      Width = 610
      Height = 21
      DataField = 'NAME'
      DataSource = TransactionsDataModule.Transactions
      TabOrder = 11
      OnChange = TrNameEditChange
    end
  end
  object Button1: TButton
    Left = 433
    Top = 435
    Width = 75
    Height = 25
    Action = CommitAction
    Anchors = [akRight, akBottom]
    TabOrder = 3
  end
  object Button2: TButton
    Left = 510
    Top = 435
    Width = 75
    Height = 25
    Action = CancelAction
    Anchors = [akRight, akBottom]
    TabOrder = 4
  end
  object Button3: TButton
    Left = 585
    Top = 435
    Width = 75
    Height = 25
    Action = CloseAction
    Anchors = [akRight, akBottom]
    TabOrder = 5
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 660
    Height = 30
    Align = alTop
    TabOrder = 6
    object Label5: TLabel
      Left = 8
      Top = 9
      Width = 85
      Height = 13
      Caption = 'Ямалиййатынын тарихи'
    end
    object TransactionDateEdit: TDateTimePicker
      Left = 132
      Top = 7
      Width = 101
      Height = 21
      CalAlignment = dtaLeft
      Date = 37574.5207394676
      Time = 37574.5207394676
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
      OnChange = TransactionDateEditChange
    end
  end
  object ErrorHintBox: THintBox
    Left = 1
    Top = 432
    Width = 150
    Height = 18
    AutoSize = True
    BevelOuter = bvNone
    Caption = 'ErrorHintBox'
    TabOrder = 7
    Visible = False
    HintStyle = hsAlert
    Timeout = 4000
    BeepOnMessage = True
  end
  object ActionList1: TActionList
    Left = 308
    Top = 376
    object CommitAction: TAction
      Caption = 'Йаддаша йаз'
      ShortCut = 16467
      OnExecute = CommitActionExecute
      OnUpdate = CommitActionUpdate
    end
    object CancelAction: TAction
      Caption = 'Имтина'
      OnExecute = CancelActionExecute
      OnUpdate = CommitActionUpdate
    end
    object CloseAction: TAction
      Caption = 'Чыхыш'
      OnExecute = CloseActionExecute
    end
  end
end
