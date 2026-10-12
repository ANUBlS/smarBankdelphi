object CO_MemorialForm: TCO_MemorialForm
  Left = 207
  Top = 142
  ActiveControl = DBEdit5
  BorderStyle = bsDialog
  ClientHeight = 370
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object page3: TPageControl
    Left = 0
    Top = 0
    Width = 585
    Height = 337
    ActivePage = TabSheet1
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 0
    TabPosition = tpBottom
    object TabSheet1: TTabSheet
      Caption = 'Debet'
      object Panel1: TPanel
        Left = 0
        Top = 286
        Width = 577
        Height = 23
        Align = alBottom
        Alignment = taLeftJustify
        Caption = 'Жями:'
        TabOrder = 0
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
          Left = 280
          Top = 1
          Width = 25
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = '0'
          Visible = False
        end
        object DebitLAmountEdit: TCurrencyEdit
          Left = 552
          Top = 1
          Width = 73
          Height = 21
          ReadOnly = True
          TabOrder = 1
          Text = '0'
          Visible = False
        end
        object DBEdit5: TDBEdit
          Left = 112
          Top = 0
          Width = 193
          Height = 21
          DataField = 'DEBITAMOUNT'
          DataSource = CO_DataMod.DebetTransactions
          TabOrder = 2
        end
        object DBEdit6: TDBEdit
          Left = 416
          Top = 0
          Width = 161
          Height = 21
          DataField = 'LAMOUNT'
          DataSource = CO_DataMod.DebetTransactions
          TabOrder = 3
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 263
        Width = 577
        Height = 23
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object DBEdit1: TDBEdit
          Left = 1
          Top = 1
          Width = 575
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'DESTINATION'
          DataSource = CO_DataMod.DebetTransactions
          TabOrder = 0
        end
      end
      object DebitTransactionsGrid: TDBGrid
        Left = 0
        Top = 0
        Width = 577
        Height = 263
        Align = alClient
        DataSource = CO_DataMod.DebetTransactions
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = RUSSIAN_CHARSET
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
            Width = 52
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
            Width = 66
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
            Width = 84
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
            Width = 86
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
            Width = 71
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
            Width = 75
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
    end
    object TabSheet2: TTabSheet
      Caption = 'Kredit'
      ImageIndex = 1
      object Panel5: TPanel
        Left = 0
        Top = 286
        Width = 577
        Height = 23
        Align = alBottom
        Alignment = taLeftJustify
        Caption = 'Жями:'
        TabOrder = 0
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
          Left = 272
          Top = 1
          Width = 33
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = '0'
          Visible = False
        end
        object CreditLAmountEdit: TCurrencyEdit
          Left = 552
          Top = 1
          Width = 73
          Height = 21
          ReadOnly = True
          TabOrder = 1
          Text = '0'
          Visible = False
        end
        object DBEdit3: TDBEdit
          Left = 120
          Top = 0
          Width = 185
          Height = 21
          DataField = 'CREDITAMOUNT'
          DataSource = CO_DataMod.CreditTransactions
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 416
          Top = 0
          Width = 161
          Height = 21
          DataField = 'LAMOUNT'
          DataSource = CO_DataMod.CreditTransactions
          TabOrder = 3
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 263
        Width = 577
        Height = 23
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object DBEdit2: TDBEdit
          Left = 1
          Top = 1
          Width = 575
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'DESTINATION'
          DataSource = CO_DataMod.CreditTransactions
          TabOrder = 0
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 577
        Height = 263
        Align = alClient
        DataSource = CO_DataMod.CreditTransactions
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        OnKeyDown = DBGrid1KeyDown
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
            Width = 47
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
            Width = 96
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
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITAMOUNT'
            Title.Caption = 'Д.Мябляь'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITAMOUNT'
            Title.Caption = 'К.Мябляь'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 68
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
    end
  end
  object Panel3: TPanel
    Left = -8
    Top = 336
    Width = 593
    Height = 31
    BevelOuter = bvNone
    TabOrder = 1
    object Button2: TButton
      Left = 402
      Top = 5
      Width = 127
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Чап'
      Default = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      OnClick = Button2Click
    end
  end
  object NLSLocalizer1: TNLSLocalizer
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 244
    Top = 70
  end
end
