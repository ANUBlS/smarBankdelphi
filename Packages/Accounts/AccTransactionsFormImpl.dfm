object AccTransactionsForm: TAccTransactionsForm
  Left = 246
  Top = 167
  Width = 642
  Height = 310
  Caption = 'AccTransactionsForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object TransactionsPageControl: TPageControl
    Left = 0
    Top = 0
    Width = 634
    Height = 257
    ActivePage = DebitTrSheet
    Align = alClient
    MultiLine = True
    TabOrder = 0
    TabPosition = tpBottom
    TabStop = False
    object DebitTrSheet: TTabSheet
      Caption = 'Дебит'
      object DebitTransactionsGrid: TDBGrid
        Left = 0
        Top = 0
        Width = 626
        Height = 183
        Align = alClient
        DataSource = DebitTransactions
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Color = clSilver
            Expanded = False
            FieldName = 'ID'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Caption = '#'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPERATIONDATE'
            Title.Caption = 'Тарих'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DebitAccNo'
            Title.Caption = 'Дебит'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITACCNO'
            Title.Caption = 'Кредит'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITAMOUNT'
            Title.Caption = 'Д.Мябляг'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITAMOUNT'
            Title.Caption = 'К.Мябляг'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LAMOUNT'
            Title.Caption = 'Еквивалент'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 100
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 206
        Width = 626
        Height = 23
        Align = alBottom
        Alignment = taLeftJustify
        Caption = 'Жями:'
        TabOrder = 1
        object Label1: TLabel
          Left = 56
          Top = 5
          Width = 51
          Height = 13
          Caption = 'Дебит цзря:'
        end
        object Label2: TLabel
          Left = 360
          Top = 5
          Width = 53
          Height = 13
          Caption = 'Еквивалент:'
        end
        object Bevel1: TBevel
          Left = 336
          Top = 3
          Width = 3
          Height = 17
        end
        object DebitAmountEdit: TCurrencyEdit
          Left = 128
          Top = 1
          Width = 177
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = '0'
        end
        object DebitLAmountEdit: TCurrencyEdit
          Left = 440
          Top = 1
          Width = 185
          Height = 21
          ReadOnly = True
          TabOrder = 1
          Text = '0'
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 183
        Width = 626
        Height = 23
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object DBEdit1: TDBEdit
          Left = 1
          Top = 1
          Width = 624
          Height = 21
          DataField = 'DESTINATION'
          DataSource = DebitTransactions
          TabOrder = 0
        end
      end
    end
    object CreditTrSheet: TTabSheet
      Caption = 'Кредит'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 626
        Height = 183
        Align = alClient
        DataSource = CreditTransactions
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Color = clSilver
            Expanded = False
            FieldName = 'ID'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Caption = '#'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPERATIONDATE'
            Title.Caption = 'Тарих'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITACCNO'
            Title.Caption = 'Дебит'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CreditAccNo'
            Title.Caption = 'Кредит'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITAMOUNT'
            Title.Caption = 'Д.Мябляг'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITAMOUNT'
            Title.Caption = 'К.Мябляг'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LAMOUNT'
            Title.Caption = 'Еквивалент'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 100
            Visible = True
          end>
      end
      object Panel4: TPanel
        Left = 0
        Top = 183
        Width = 626
        Height = 23
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object DBEdit2: TDBEdit
          Left = 1
          Top = 1
          Width = 624
          Height = 21
          DataField = 'DESTINATION'
          DataSource = CreditTransactions
          TabOrder = 0
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 206
        Width = 626
        Height = 23
        Align = alBottom
        Alignment = taLeftJustify
        Caption = 'Жями:'
        TabOrder = 2
        object Label3: TLabel
          Left = 56
          Top = 5
          Width = 53
          Height = 13
          Caption = 'Кредит цзря:'
        end
        object Label4: TLabel
          Left = 360
          Top = 5
          Width = 53
          Height = 13
          Caption = 'Еквивалент:'
        end
        object Bevel2: TBevel
          Left = 336
          Top = 3
          Width = 3
          Height = 17
        end
        object CreditAmountEdit: TCurrencyEdit
          Left = 128
          Top = 1
          Width = 177
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = '0'
        end
        object CreditLAmountEdit: TCurrencyEdit
          Left = 440
          Top = 1
          Width = 185
          Height = 21
          ReadOnly = True
          TabOrder = 1
          Text = '0'
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 257
    Width = 634
    Height = 26
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Label5: TLabel
      Left = 31
      Top = 10
      Width = 34
      Height = 13
      Caption = ' -   Чап'
    end
    object Label6: TLabel
      Left = 8
      Top = 8
      Width = 22
      Height = 16
      Caption = 'F3 '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object OkButton: TButton
      Left = 558
      Top = 1
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Ok'
      Default = True
      TabOrder = 0
      OnClick = OkButtonClick
    end
  end
  object StartDateEdit: TDateTimePicker
    Left = 438
    Top = 236
    Width = 97
    Height = 21
    Anchors = [akRight, akBottom]
    CalAlignment = dtaLeft
    Date = 37359.7400025926
    Time = 37359.7400025926
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 2
    OnChange = StartDateEditChange
  end
  object EndDateEdit: TDateTimePicker
    Left = 535
    Top = 236
    Width = 96
    Height = 21
    Anchors = [akRight, akBottom]
    CalAlignment = dtaLeft
    Date = 37359.7401165278
    Time = 37359.7401165278
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
    OnChange = EndDateEditChange
  end
  object DebitTransactions: TDataSource
    DataSet = DebitTransactionsData
    Left = 92
    Top = 72
  end
  object CreditTransactions: TDataSource
    DataSet = CreditTransactionsData
    Left = 92
    Top = 104
  end
  object CreditTransactionsData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  p.ID,'
      '  p.kredit as CreditAccID,'
      '  p.dat as OperationDate,'
      '  p.ammount as DebitAmount,'
      '  p.ammount_c as CreditAmount,'
      '  p.lammount as LAmount,'
      '  ad.acc_no as DebitAccNo,'
      '  p.NAME as Destination'
      'from'
      '  provarch p,'
      '  account ad'
      'where'
      '  (p.kredit = :CreditAccID)'
      '  and (p.dat between :StartDate and :EndDate)'
      '  and (ad.id = p.debt)'
      'order by p.dat')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000030000000C0000003A43524544495441434349440300000004000000
      A11B0000000000000A0000003A5354415254444154450C000000000000000000
      0000080000003A454E44444154450C0000000000000000000000}
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
    Master = AccountDataModule.AccountsData
    MasterFields = 'ACCID'
    DetailFields = 'CreditAccID'
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
    AfterOpen = CreditTransactionsDataAfterOpen
    OnCalcFields = CreditTransactionsDataCalcFields
    Left = 124
    Top = 104
    object CreditTransactionsDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object IntegerField1: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'RowNumber'
      Calculated = True
    end
    object CreditTransactionsDataCREDITACCID: TFloatField
      FieldName = 'CREDITACCID'
    end
    object CreditTransactionsDataOPERATIONDATE: TDateTimeField
      FieldName = 'OPERATIONDATE'
    end
    object CreditTransactionsDataDEBITAMOUNT: TFloatField
      FieldName = 'DEBITAMOUNT'
      currency = True
    end
    object CreditTransactionsDataCREDITAMOUNT: TFloatField
      FieldName = 'CREDITAMOUNT'
      currency = True
    end
    object CreditTransactionsDataLAMOUNT: TFloatField
      FieldName = 'LAMOUNT'
      currency = True
    end
    object CreditTransactionsDataDEBITACCNO: TStringField
      FieldName = 'DEBITACCNO'
    end
    object CreditTransactionsDataDESTINATION: TStringField
      FieldName = 'DESTINATION'
      Size = 255
    end
    object CreditTransactionsDataCreditAccNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'CreditAccNo'
      Size = 32
      Calculated = True
    end
  end
  object DebitTransactionsData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  p.ID,'
      '  p.debt as DebitAccID,'
      '  p.dat as OperationDate,'
      '  p.ammount as DebitAmount,'
      '  p.ammount_c as CreditAmount,'
      '  p.lammount as LAmount,'
      '  ac.acc_no as CreditAccNo,'
      '  p.NAME as Destination'
      'from'
      '  provarch p,'
      '  account ac'
      'where'
      '  (p.dat between :StartDate and :EndDate)'
      '  and (p.debt = :DebitAccID)'
      '  and (ac.id = p.kredit)'
      'order by p.dat')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000030000000A0000003A5354415254444154450C000000000000000000
      0000080000003A454E44444154450C00000000000000000000000B0000003A44
      454249544143434944030000000000000000000000}
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
    Master = AccountDataModule.AccountsData
    MasterFields = 'ACCID'
    DetailFields = 'DebitAccID'
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = False
    CountAllRecords = True
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    AfterOpen = DebitTransactionsDataAfterOpen
    OnCalcFields = DebitTransactionsDataCalcFields
    Left = 124
    Top = 70
    object DebitTransactionsDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DebitTransactionsDataDEBITACCID: TFloatField
      FieldName = 'DEBITACCID'
    end
    object DebitTransactionsDataOPERATIONDATE: TDateTimeField
      FieldName = 'OPERATIONDATE'
    end
    object DebitTransactionsDataDEBITAMOUNT: TFloatField
      FieldName = 'DEBITAMOUNT'
      currency = True
    end
    object DebitTransactionsDataCREDITAMOUNT: TFloatField
      FieldName = 'CREDITAMOUNT'
      currency = True
    end
    object DebitTransactionsDataLAMOUNT: TFloatField
      FieldName = 'LAMOUNT'
      currency = True
    end
    object DebitTransactionsDataCREDITACCNO: TStringField
      FieldName = 'CREDITACCNO'
    end
    object DebitTransactionsDataDESTINATION: TStringField
      FieldName = 'DESTINATION'
      Size = 255
    end
    object DebitTransactionsDataRowNumber: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'RowNumber'
      Calculated = True
    end
    object DebitTransactionsDataDebitAccNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'DebitAccNo'
      Size = 32
      Calculated = True
    end
  end
  object AccTrExport: TExcelExporter
    SheetName = 'AccTrans'
    ShowTitles = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial AzLat'
    Font.Style = []
    Left = 300
    Top = 86
  end
end
