object CO_MemorialForm: TCO_MemorialForm
  Left = 52
  Top = 147
  ActiveControl = DBEdit5
  BorderStyle = bsDialog
  ClientHeight = 398
  ClientWidth = 896
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object page3: TPageControl
    Left = 0
    Top = 0
    Width = 897
    Height = 363
    ActivePage = TabSheet1
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
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
        Top = 310
        Width = 889
        Height = 25
        Align = alBottom
        Alignment = taLeftJustify
        Caption = #1046#1103#1084#1080':'
        TabOrder = 0
        object Label1: TLabel
          Left = 60
          Top = 5
          Width = 67
          Height = 15
          Caption = #1044#1077#1073#1080#1090' '#1094#1079#1088#1103':'
        end
        object Label2: TLabel
          Left = 388
          Top = 5
          Width = 69
          Height = 15
          Caption = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090':'
        end
        object Bevel1: TBevel
          Left = 362
          Top = 3
          Width = 3
          Height = 19
        end
        object DebitAmountEdit: TCurrencyEdit
          Left = 302
          Top = 1
          Width = 26
          Height = 23
          ReadOnly = True
          TabOrder = 0
          Text = '0'
          Visible = False
        end
        object DebitLAmountEdit: TCurrencyEdit
          Left = 594
          Top = 1
          Width = 79
          Height = 23
          ReadOnly = True
          TabOrder = 1
          Text = '0'
          Visible = False
        end
        object DBEdit5: TDBEdit
          Left = 121
          Top = 0
          Width = 207
          Height = 23
          DataField = 'DEBITAMOUNT'
          DataSource = CO_DataMod.DebetTransactions
          TabOrder = 2
        end
        object DBEdit6: TDBEdit
          Left = 448
          Top = 0
          Width = 173
          Height = 23
          DataField = 'LAMOUNT'
          DataSource = CO_DataMod.DebetTransactions
          TabOrder = 3
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 285
        Width = 889
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          889
          25)
        object DBEdit1: TDBEdit
          Left = 0
          Top = 1
          Width = 887
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          DataField = 'DESTINATION'
          DataSource = CO_DataMod.DebetTransactions
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object DebitTransactionsGrid: TDBGrid
        Left = 0
        Top = 0
        Width = 889
        Height = 285
        Align = alClient
        DataSource = CO_DataMod.DebetTransactions
        DrawingStyle = gdsGradient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
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
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Caption = '#'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPERATIONDATE'
            Title.Caption = 'Tarix'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DebitAccNo'
            Title.Caption = 'Debit'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITACCNO'
            Title.Caption = 'Kredit'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITAMOUNT'
            Title.Caption = 'D. M'#601'bl'#601#287
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITAMOUNT'
            Title.Caption = 'K. M'#601'bl'#601#287
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LAMOUNT'
            Title.Caption = 'Ekvivalent'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
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
        Top = 310
        Width = 889
        Height = 25
        Align = alBottom
        Alignment = taLeftJustify
        Caption = #1046#1103#1084#1080':'
        TabOrder = 0
        object Label3: TLabel
          Left = 60
          Top = 5
          Width = 73
          Height = 15
          Caption = #1050#1088#1077#1076#1080#1090' '#1094#1079#1088#1103':'
        end
        object Label4: TLabel
          Left = 388
          Top = 5
          Width = 69
          Height = 15
          Caption = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090':'
        end
        object Bevel2: TBevel
          Left = 362
          Top = 3
          Width = 3
          Height = 19
        end
        object CreditAmountEdit: TCurrencyEdit
          Left = 293
          Top = 1
          Width = 35
          Height = 23
          ReadOnly = True
          TabOrder = 0
          Text = '0'
          Visible = False
        end
        object CreditLAmountEdit: TCurrencyEdit
          Left = 594
          Top = 1
          Width = 79
          Height = 23
          ReadOnly = True
          TabOrder = 1
          Text = '0'
          Visible = False
        end
        object DBEdit3: TDBEdit
          Left = 129
          Top = 0
          Width = 199
          Height = 23
          DataField = 'CREDITAMOUNT'
          DataSource = CO_DataMod.CreditTransactions
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 448
          Top = 0
          Width = 173
          Height = 23
          DataField = 'LAMOUNT'
          DataSource = CO_DataMod.CreditTransactions
          TabOrder = 3
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 285
        Width = 889
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          889
          25)
        object DBEdit2: TDBEdit
          Left = 0
          Top = 1
          Width = 887
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          DataField = 'DESTINATION'
          DataSource = CO_DataMod.CreditTransactions
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 889
        Height = 285
        Align = alClient
        DataSource = CO_DataMod.CreditTransactions
        DrawingStyle = gdsGradient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
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
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPERATIONDATE'
            Title.Caption = 'Tarix'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITACCNO'
            Title.Caption = 'Debit'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CreditAccNo'
            Title.Caption = 'Kredit'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITAMOUNT'
            Title.Caption = 'D. M'#601'bl'#601#287
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITAMOUNT'
            Title.Caption = 'K. M'#601'bl'#601#287
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LAMOUNT'
            Title.Caption = 'Ekvivalent'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 100
            Visible = True
          end>
      end
    end
  end
  object Panel3: TPanel
    Left = -9
    Top = 362
    Width = 906
    Height = 33
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      906
      33)
    object Button2: TButton
      Left = 700
      Top = 5
      Width = 137
      Height = 27
      Anchors = [akRight, akBottom]
      Caption = #1063#1072#1087
      Default = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      OnClick = Button2Click
    end
  end
end
