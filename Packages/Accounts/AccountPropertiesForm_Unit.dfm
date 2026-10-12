object AccountPropertiesForm: TAccountPropertiesForm
  Left = 255
  Top = 229
  Width = 501
  Height = 371
  Caption = 'AccountPropertiesForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object DayStartStateGB: TGroupBox
    Left = 0
    Top = 212
    Width = 493
    Height = 49
    Align = alTop
    Caption = '∆ари галыг'
    TabOrder = 1
    object Label8: TLabel
      Left = 16
      Top = 21
      Width = 27
      Height = 13
      Caption = '√алыг:'
    end
    object Label9: TLabel
      Left = 272
      Top = 21
      Width = 53
      Height = 13
      Caption = '≈квивалент:'
    end
    object DBEdit6: TDBEdit
      Left = 56
      Top = 17
      Width = 121
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'AMOUNT'
      DataSource = AccountDataModule.Accounts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit7: TDBEdit
      Left = 344
      Top = 17
      Width = 121
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'LAMOUNT'
      DataSource = AccountDataModule.Accounts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object AccountStateGB: TGroupBox
    Left = 0
    Top = 261
    Width = 493
    Height = 49
    Align = alTop
    Caption = 'Ёцнцн €вв€лин€ галыг'
    TabOrder = 2
    object Label10: TLabel
      Left = 16
      Top = 20
      Width = 27
      Height = 13
      Caption = '√алыг:'
    end
    object Label11: TLabel
      Left = 272
      Top = 20
      Width = 53
      Height = 13
      Caption = '≈квивалент:'
    end
    object DBEdit8: TDBEdit
      Left = 56
      Top = 16
      Width = 121
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'DAYSTARTAMOUNT'
      DataSource = AccountDataModule.Accounts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit9: TDBEdit
      Left = 344
      Top = 16
      Width = 121
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'DAYSTARTLAMOUNT'
      DataSource = AccountDataModule.Accounts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object AccountGB: TGroupBox
    Left = 0
    Top = 0
    Width = 493
    Height = 212
    Align = alTop
    Caption = 'ўесаб'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 34
      Height = 13
      Caption = 'ўесаб:'
    end
    object Label2: TLabel
      Left = 256
      Top = 16
      Width = 38
      Height = 13
      Caption = '¬алйута:'
    end
    object Label3: TLabel
      Left = 8
      Top = 44
      Width = 69
      Height = 13
      Caption = 'Ѕаланс щесабы:'
    end
    object Label4: TLabel
      Left = 8
      Top = 68
      Width = 37
      Height = 13
      Caption = 'ћцшт€ри:'
    end
    object Label5: TLabel
      Left = 8
      Top = 92
      Width = 58
      Height = 13
      Caption = 'јчылма тарихи:'
    end
    object Label7: TLabel
      Left = 280
      Top = 91
      Width = 53
      Height = 13
      Caption = '∆цт щесабы:'
    end
    object Label6: TLabel
      Left = 8
      Top = 185
      Width = 59
      Height = 13
      Caption = 'ўесабын ады:'
    end
    object Label12: TLabel
      Left = 312
      Top = 116
      Width = 24
      Height = 13
      Caption = 'Ћимит:'
    end
    object Label13: TLabel
      Left = 8
      Top = 116
      Width = 81
      Height = 13
      Caption = 'ўесабат символу:'
    end
    object SpeedButton1: TSpeedButton
      Left = 416
      Top = 40
      Width = 73
      Height = 22
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'ƒиэ€р...'
      OnClick = SpeedButton1Click
    end
    object Label14: TLabel
      Left = 8
      Top = 139
      Width = 23
      Height = 13
      Caption = '‘илиал:'
    end
    object Label15: TLabel
      Left = 8
      Top = 163
      Width = 44
      Height = 13
      Caption = '—имволлары'
    end
    object DBText1: TDBText
      Left = 121
      Top = 162
      Width = 5
      Height = 13
      AutoSize = True
      DataField = 'ACCFLAGS'
      DataSource = AccountDataModule.Accounts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object AccNoEdit: TDBEdit
      Left = 120
      Top = 16
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ACCNO'
      DataSource = AccountDataModule.Accounts
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = AccNoEditKeyPress
    end
    object CurencyIDEdit: TDBEdit
      Left = 304
      Top = 16
      Width = 33
      Height = 21
      DataField = 'CURRENCYID'
      DataSource = AccountDataModule.Accounts
      TabOrder = 1
    end
    object CurencyNameCB: TDBLookupComboBox
      Left = 344
      Top = 16
      Width = 145
      Height = 21
      DataField = 'CURRENCYID'
      DataSource = AccountDataModule.Accounts
      KeyField = 'VALUTE'
      ListField = 'VALU_NAME'
      ListSource = AccountDataModule.Currency
      TabOrder = 2
    end
    object SAccNameCB: TDBLookupComboBox
      Left = 161
      Top = 40
      Width = 253
      Height = 21
      DataField = 'SACC'
      DataSource = AccountDataModule.Accounts
      KeyField = 'BAL_CN'
      ListField = 'BALNAME'
      ListSource = AccountDataModule.SAccs
      TabOrder = 4
    end
    object SAccEdit: TDBEdit
      Left = 120
      Top = 40
      Width = 41
      Height = 21
      DataField = 'SACC'
      DataSource = AccountDataModule.Accounts
      TabOrder = 3
    end
    object CustomerNameCB: TDBLookupComboBox
      Left = 161
      Top = 64
      Width = 328
      Height = 21
      DataField = 'CUSTOMERID'
      DataSource = AccountDataModule.Accounts
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = AccountDataModule.Customers
      TabOrder = 6
      OnCloseUp = CustomerNameCBCloseUp
    end
    object CustomerIDEdit: TDBEdit
      Left = 120
      Top = 64
      Width = 41
      Height = 21
      DataField = 'CUSTOMERID'
      DataSource = AccountDataModule.Accounts
      TabOrder = 5
    end
    object OpenDateEdit: TDateTimePicker
      Left = 120
      Top = 88
      Width = 145
      Height = 21
      CalAlignment = dtaLeft
      Date = 37357.6183236921
      Time = 37357.6183236921
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 7
    end
    object PairAccCB: TDBLookupComboBox
      Left = 352
      Top = 88
      Width = 137
      Height = 21
      DataField = 'PAIRACC'
      DataSource = AccountDataModule.Accounts
      KeyField = 'ACCID'
      ListField = 'ACCNO'
      ListSource = Accounts
      TabOrder = 8
    end
    object AccountNameEdit: TDBEdit
      Left = 120
      Top = 181
      Width = 361
      Height = 21
      DataField = 'ACCNAME'
      DataSource = AccountDataModule.Accounts
      TabOrder = 11
    end
    object AccountLimitEdit: TDBEdit
      Left = 352
      Top = 112
      Width = 137
      Height = 21
      DataField = 'ACCLIMIT'
      DataSource = AccountDataModule.Accounts
      TabOrder = 10
    end
    object AccountFlagsGB: TGroupBox
      Left = 400
      Top = 133
      Width = 89
      Height = 43
      TabOrder = 12
      object Button1: TButton
        Left = 9
        Top = 13
        Width = 71
        Height = 22
        Caption = '—имволлар ...'
        TabOrder = 0
        OnClick = Button1Click
      end
    end
    object ReportSymbolCB: TDBLookupComboBox
      Left = 120
      Top = 112
      Width = 145
      Height = 21
      DataField = 'REPORTSYMBOL'
      DataSource = AccountDataModule.Accounts
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = AccountDataModule.ReportSymbol
      TabOrder = 9
    end
    object AdditionalSAccsButton: TPanel
      Left = 120
      Top = 38
      Width = 296
      Height = 80
      TabOrder = 13
      Visible = False
      object DBEdit1: TDBEdit
        Left = 1
        Top = 18
        Width = 41
        Height = 21
        DataField = 'SACC2'
        DataSource = AccountDataModule.Accounts
        TabOrder = 0
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 42
        Top = 18
        Width = 253
        Height = 21
        DataField = 'SACC2'
        DataSource = AccountDataModule.Accounts
        KeyField = 'BAL_CN'
        ListField = 'BALNAME'
        ListSource = AccountDataModule.SAccs2
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 1
        Top = 38
        Width = 41
        Height = 21
        DataField = 'SACC3'
        DataSource = AccountDataModule.Accounts
        TabOrder = 2
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 42
        Top = 38
        Width = 253
        Height = 21
        DataField = 'SACC3'
        DataSource = AccountDataModule.Accounts
        KeyField = 'BAL_CN'
        ListField = 'BALNAME'
        ListSource = AccountDataModule.SAccs3
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 1
        Top = 58
        Width = 41
        Height = 21
        DataField = 'SACC4'
        DataSource = AccountDataModule.Accounts
        TabOrder = 4
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 42
        Top = 58
        Width = 253
        Height = 21
        DataField = 'SACC4'
        DataSource = AccountDataModule.Accounts
        KeyField = 'BAL_CN'
        ListField = 'BALNAME'
        ListSource = AccountDataModule.SAccs4
        TabOrder = 5
      end
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 294
        Height = 16
        Align = alTop
        BevelOuter = bvNone
        Caption = 'ялав€ баланс щесаблары'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
    end
    object DBEdit4: TDBEdit
      Left = 120
      Top = 135
      Width = 57
      Height = 21
      DataField = 'FILIALID'
      DataSource = AccountDataModule.Accounts
      TabOrder = 14
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 178
      Top = 135
      Width = 166
      Height = 21
      DataField = 'FILIALID'
      DataSource = AccountDataModule.Accounts
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = AccountDataModule.Filials
      TabOrder = 15
    end
    object DBLookupComboBox5: TDBLookupComboBox
      Left = 353
      Top = 142
      Width = 24
      Height = 21
      DataSource = AccountDataModule.Accounts
      TabOrder = 16
      Visible = False
    end
  end
  object OkButton: TButton
    Left = 336
    Top = 319
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&…аддаша йаз'
    TabOrder = 3
    OnClick = OkButtonClick
  end
  object CancelButton: TButton
    Left = 416
    Top = 319
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '»мтина'
    TabOrder = 4
    OnClick = CancelButtonClick
  end
  object ErrorHint: THintBox
    Left = 1
    Top = 323
    Width = 313
    Height = 18
    Anchors = [akRight, akBottom]
    AutoSize = True
    BevelOuter = bvNone
    Caption = 'ErrorHint'
    TabOrder = 5
    Visible = False
    HintStyle = hsAlert
    Timeout = 4000
    BeepOnMessage = False
  end
  object Accounts: TDataSource
    DataSet = AccountsData
    Left = 260
    Top = 36
  end
  object AccountsData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  acc.ID as AccID,'
      '  acc.ACC_NO as AccNo'
      'from'
      ' ACCOUNT acc'
      'order by acc.ACC_NO')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000050000004143434944010000000000050000004143434E4F
      010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 292
    Top = 36
  end
end
