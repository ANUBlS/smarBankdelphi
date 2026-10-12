object frmTransaction: TfrmTransaction
  Left = 196
  Top = 106
  Width = 726
  Height = 416
  Caption = 'frmTransaction'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 219
    Top = 358
    Width = 3
    Height = 13
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 718
    Height = 389
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object AccRest: TPanel
      Left = 0
      Top = 136
      Width = 653
      Height = 22
      Caption = 'AccRest'
      TabOrder = 15
      object Label1: TLabel
        Left = 3
        Top = 4
        Width = 34
        Height = 13
        Caption = 'Галыг:'
      end
      object DebitAccBalanceLabel: TLabel
        Left = 34
        Top = 4
        Width = 115
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'DebitAccBalanceLabel'
      end
      object Label3: TLabel
        Left = 154
        Top = 4
        Width = 69
        Height = 13
        Caption = ', Еквивалент:'
      end
      object DebitLBalanceLabel: TLabel
        Left = 225
        Top = 4
        Width = 109
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'DebitLBalanceLabel'
      end
      object Label4: TLabel
        Left = 331
        Top = 4
        Width = 34
        Height = 13
        Caption = 'Галыг:'
      end
      object CreditAccBalanceLabel: TLabel
        Left = 360
        Top = 4
        Width = 113
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'DebitAccBalanceLabel'
      end
      object Label6: TLabel
        Left = 475
        Top = 4
        Width = 69
        Height = 13
        Caption = ', Еквивалент:'
      end
      object CreditLBalanceLabel: TLabel
        Left = 549
        Top = 4
        Width = 102
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'CreditLBalanceLabel'
      end
    end
    object DescriptionPanel: TPanel
      Left = 0
      Top = 217
      Width = 653
      Height = 27
      Alignment = taLeftJustify
      Caption = '  Ямялиййатын тяйинаты:'
      TabOrder = 14
      object TrNameEdit: TEdit
        Left = 142
        Top = 1
        Width = 480
        Height = 21
        TabOrder = 0
        Text = 'TrNameEdit'
      end
      object TrNameCB: TDBLookupComboBox
        Left = 143
        Top = 2
        Width = 480
        Height = 21
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = DataMod.dsDescription
        TabOrder = 2
        Visible = False
        OnClick = TrNameCBClick
        OnExit = TrNameCBExit
      end
      object TrNameB: TButton
        Left = 625
        Top = 2
        Width = 23
        Height = 21
        Caption = '...'
        TabOrder = 1
        OnClick = TrNameBClick
      end
    end
    object TrDatePanel: TPanel
      Left = 0
      Top = 0
      Width = 328
      Height = 24
      Alignment = taLeftJustify
      Caption = '  Ямалиййатынын тарихи'
      TabOrder = 0
      object TransactionDateEdit: TDateTimePicker
        Left = 140
        Top = 2
        Width = 101
        Height = 20
        CalAlignment = dtaLeft
        Date = 37574.5207394676
        Time = 37574.5207394676
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 157
      Width = 654
      Height = 35
      Caption = 'Касса символу:'
      TabOrder = 1
      object Label18: TLabel
        Left = 7
        Top = 15
        Width = 75
        Height = 13
        Caption = 'Балансдахили:'
      end
      object Label19: TLabel
        Left = 327
        Top = 14
        Width = 82
        Height = 13
        Caption = 'Конв. тяйинаты:'
      end
      object OutBalanceCharCB: TDBLookupComboBox
        Left = 465
        Top = 8
        Width = 185
        Height = 21
        Color = clSilver
        KeyField = 'ID'
        ListField = 'FULLPATH'
        ListSource = DataMod.dsOutBalanceChar
        TabOrder = 0
        OnExit = OutBalanceCharCBExit
      end
      object OutBalanceCharEdit: TFieldSearchEdit
        Left = 422
        Top = 9
        Width = 41
        Height = 21
        TabOrder = 1
        Text = 'OutBalanceCharEdit'
        OnExit = OutBalanceCharEditExit
        DataSource = DataMod.dsOutBalanceChar
        SearchField = 'id'
      end
      object InBalanceCharEdit: TFieldSearchEdit
        Left = 89
        Top = 9
        Width = 49
        Height = 21
        TabOrder = 2
        Text = 'InBalanceCharEdit'
        DataSource = DataMod.dsInBalanceSymbols
      end
      object InBalanceCharCB: TDBLookupComboBox
        Left = 142
        Top = 9
        Width = 179
        Height = 21
        Color = clSilver
        DataSource = DataMod.dsInBalanceSymbols
        TabOrder = 3
      end
    end
    object DebitCurrencyIDEdit: TFieldSearchEdit
      Left = 1
      Top = 65
      Width = 55
      Height = 21
      TabOrder = 2
      Text = 'DebitCurrencyIDEdit'
      OnExit = DebitCurrencyIDEditExit
      DataSource = DataMod.dsDCurrency
      SearchField = 'valute'
    end
    object DebitCurrencyCB: TDBLookupComboBox
      Left = 58
      Top = 66
      Width = 157
      Height = 21
      Color = clSilver
      KeyField = 'VALUTE'
      ListField = 'VALU_NAME'
      ListSource = DataMod.dsDCurrency
      TabOrder = 3
      OnClick = DebitCurrencyCBClick
    end
    object DebitRateEdit: TEdit
      Left = 216
      Top = 65
      Width = 111
      Height = 21
      TabOrder = 4
      Text = 'DebitRateEdit'
    end
    object CreditCurrencyIDEdit: TFieldSearchEdit
      Left = 330
      Top = 64
      Width = 58
      Height = 21
      TabOrder = 5
      Text = 'CreditCurrencyIDEdit'
      OnExit = CreditCurrencyIDEditExit
      DataSource = DataMod.dsCCurrency
      SearchField = 'valute'
    end
    object CreditCurrencyCB: TDBLookupComboBox
      Left = 391
      Top = 64
      Width = 152
      Height = 21
      Color = clSilver
      KeyField = 'VALUTE'
      ListField = 'VALU_NAME'
      ListSource = DataMod.dsCCurrency
      TabOrder = 6
      OnClick = CreditCurrencyCBClick
    end
    object CreditRateEdit: TEdit
      Left = 544
      Top = 64
      Width = 108
      Height = 21
      TabOrder = 7
      Text = 'CreditRateEdit'
    end
    object DebitAccNoSearchEdit: TFieldSearchEdit
      Left = 0
      Top = 89
      Width = 161
      Height = 21
      TabOrder = 8
      OnExit = DebitAccNoSearchEditExit
      DataSource = DataMod.dsDebitAcc
      SearchField = 'AccountNumber'
    end
    object DebitAccNoCB: TSearchCombo
      Left = 163
      Top = 88
      Width = 165
      Height = 22
      Color = clSilver
      ItemHeight = 16
      TabOrder = 9
      OnChange = DebitAccNoCBChange
      DataSource = DataMod.dsDebitAcc
      ViewField = 'AccountNumber'
      DefaultString = '  '
      DefaultStringUse = False
      DefaultStringColor = clWindowText
    end
    object CreditAccNoSearchEdit: TFieldSearchEdit
      Left = 329
      Top = 86
      Width = 162
      Height = 21
      TabOrder = 10
      OnExit = CreditAccNoSearchEditExit
      DataSource = DataMod.dsCreditAcc
      SearchField = 'AccountNumber'
    end
    object CreditAccNoCB: TSearchCombo
      Left = 491
      Top = 85
      Width = 165
      Height = 22
      Color = clSilver
      ItemHeight = 16
      TabOrder = 11
      OnChange = CreditAccNoCBChange
      DataSource = DataMod.dsCreditAcc
      ViewField = 'AccountNumber'
      DefaultStringUse = False
      DefaultStringColor = clWindowText
    end
    object DebitAccNameCB: TSearchCombo
      Left = 0
      Top = 112
      Width = 328
      Height = 22
      Color = clSilver
      ItemHeight = 16
      TabOrder = 12
      OnChange = DebitAccNameCBChange
      DataSource = DataMod.dsDebitAcc
      ViewField = 'AccountName'
      DefaultStringUse = False
      DefaultStringColor = clWindowText
    end
    object CreditAccNameCB: TSearchCombo
      Left = 328
      Top = 111
      Width = 327
      Height = 22
      Color = clSilver
      ItemHeight = 16
      TabOrder = 13
      OnChange = CreditAccNameCBChange
      DataSource = DataMod.dsCreditAcc
      ViewField = 'AccountName'
      DefaultStringUse = False
      DefaultStringColor = clWindowText
    end
    object DebetAmmountPanel: TPanel
      Left = 0
      Top = 193
      Width = 197
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'Мябляь:'
      TabOrder = 16
      object DebitAmountEdit: TCurrencyEdit
        Left = 49
        Top = 1
        Width = 143
        Height = 21
        TabOrder = 0
        Text = '0'
        OnChange = DebitAmountEditChange
      end
    end
    object CreditAmmountPanel: TPanel
      Left = 453
      Top = 192
      Width = 200
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'Мябляь:'
      TabOrder = 17
      object CreditAmountEdit: TCurrencyEdit
        Left = 48
        Top = 0
        Width = 147
        Height = 21
        TabOrder = 0
        Text = '0'
        OnChange = CreditAmountEditChange
      end
    end
    object DebetLAmmountPanel: TPanel
      Left = 198
      Top = 192
      Width = 254
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'Милли валйутада:'
      TabOrder = 18
      object LAmountEdit: TCurrencyEdit
        Left = 104
        Top = 1
        Width = 145
        Height = 21
        TabOrder = 0
        Text = '0'
        OnChange = LAmountEditChange
        OnExit = LAmountEditExit
      end
    end
    object DebetPanel: TPanel
      Left = 0
      Top = 24
      Width = 328
      Height = 17
      Alignment = taLeftJustify
      Caption = '  ДЕБЕТ'
      TabOrder = 19
    end
    object CreditPanel: TPanel
      Left = 330
      Top = 24
      Width = 323
      Height = 17
      Alignment = taLeftJustify
      Caption = '  КРЕДИТ'
      TabOrder = 20
    end
    object DebitHeader: TPanel
      Left = 0
      Top = 42
      Width = 328
      Height = 21
      Alignment = taLeftJustify
      TabOrder = 21
      object Label7: TLabel
        Left = 4
        Top = 4
        Width = 45
        Height = 13
        Caption = '  В. коду '
      end
      object HeaderPanel: TLabel
        Left = 99
        Top = 4
        Width = 41
        Height = 13
        Caption = 'Валйута'
      end
      object Label9: TLabel
        Left = 244
        Top = 4
        Width = 45
        Height = 13
        Caption = 'Мязяння'
      end
    end
    object CredittHeader: TPanel
      Left = 330
      Top = 41
      Width = 323
      Height = 21
      Alignment = taLeftJustify
      TabOrder = 22
      object Label16: TLabel
        Left = 12
        Top = 4
        Width = 45
        Height = 13
        Caption = '  В. коду '
      end
      object Label21: TLabel
        Left = 99
        Top = 4
        Width = 41
        Height = 13
        Caption = 'Валйута'
      end
      object Label23: TLabel
        Left = 244
        Top = 4
        Width = 45
        Height = 13
        Caption = 'Мязяння'
      end
    end
    object ButtonPanel: TPanel
      Left = 330
      Top = 0
      Width = 323
      Height = 24
      TabOrder = 23
      object SaveButton: TButton
        Left = 177
        Top = 3
        Width = 77
        Height = 19
        Anchors = [akRight, akBottom]
        Caption = 'Йаддаша йаз'
        TabOrder = 0
        OnClick = SaveButtonClick
      end
      object Button3: TButton
        Left = 263
        Top = 3
        Width = 55
        Height = 18
        Anchors = [akRight, akBottom]
        Caption = 'Чыхыш'
        TabOrder = 1
      end
      object ErrorHintBox: THintBox
        Left = 7
        Top = 3
        Width = 150
        Height = 18
        AutoSize = True
        BevelOuter = bvNone
        Caption = 'ErrorHintBox'
        TabOrder = 2
        Visible = False
        HintStyle = hsAlert
        Timeout = 4000
        BeepOnMessage = True
      end
    end
  end
end
