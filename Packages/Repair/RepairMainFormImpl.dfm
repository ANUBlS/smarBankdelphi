object RepairMainForm: TRepairMainForm
  Left = 245
  Top = 165
  Width = 774
  Height = 502
  Caption = 'RepairMainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 766
    Height = 475
    Align = alClient
    Alignment = taRightJustify
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 185
      Top = 65
      Width = 3
      Height = 365
      Cursor = crHSplit
    end
    object TPanel
      Left = 1
      Top = 1
      Width = 764
      Height = 64
      Align = alTop
      TabOrder = 1
      object BegDate: TDateTimePicker
        Left = 10
        Top = 7
        Width = 143
        Height = 21
        CalAlignment = dtaLeft
        Date = 37888.796334456
        Time = 37888.796334456
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
      object ButtonRefresh: TButton
        Left = 352
        Top = 8
        Width = 50
        Height = 41
        Caption = 'Refresh'
        TabOrder = 1
        OnClick = ButtonRefreshClick
      end
      object EndDate: TDateTimePicker
        Left = 10
        Top = 32
        Width = 143
        Height = 21
        CalAlignment = dtaLeft
        Date = 37890.5792602083
        Time = 37890.5792602083
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 2
      end
      object ButtonNew: TButton
        Left = 152
        Top = 8
        Width = 50
        Height = 41
        Caption = 'New'
        TabOrder = 3
        OnClick = ButtonNewClick
      end
      object ButtonUpdate: TButton
        Left = 202
        Top = 8
        Width = 50
        Height = 41
        Caption = 'Update'
        TabOrder = 4
        OnClick = ButtonUpdateClick
      end
      object ButtonDelete: TButton
        Left = 252
        Top = 8
        Width = 50
        Height = 41
        Caption = 'Delete'
        TabOrder = 5
        OnClick = ButtonDeleteClick
      end
      object ButtonFiltr: TButton
        Left = 302
        Top = 8
        Width = 50
        Height = 41
        Caption = 'Filtr'
        TabOrder = 6
        OnClick = ButtonFiltrClick
      end
      object ChProfit: TCheckBox
        Left = 600
        Top = 32
        Width = 97
        Height = 17
        Caption = 'Profit&Loss'
        Checked = True
        State = cbChecked
        TabOrder = 7
        OnClick = ChProfitClick
      end
      object ChRate: TCheckBox
        Left = 600
        Top = 10
        Width = 97
        Height = 17
        Caption = 'RateDifference'
        Checked = True
        State = cbChecked
        TabOrder = 8
        OnClick = ChRateClick
      end
    end
    object DBGrid1: TDBGrid
      Left = 188
      Top = 65
      Width = 577
      Height = 365
      Align = alClient
      DataSource = DataMod.DsTransaction
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VID_OP'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USERNAME'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OP_ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'D$'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'D$_NAME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_CURRENCYNAME'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DEBITNUMBER'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'C$'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'C$_NAME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'C$_CURRENCYNAME'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CREDITNUMBER'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DAT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEBT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KREDIT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AMOUNT_D'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LAMOUNT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AMOUNT_C'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_OSTAT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_POK_OSTAT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'C_OSTAT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'C_POK_OSTAT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KASSA_B'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KASSA_Z'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BANK_D'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BANK_K'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RATE_D'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RATE_C'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PARENTID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_OBR_D'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_OBR_K'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_POK_OBR_D'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_POK_OBR_K'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'C_OBR_D'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'C_POK_OBR_D'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'C_OBR_K'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'C_POK_OBR_K'
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 1
      Top = 430
      Width = 764
      Height = 44
      Align = alBottom
      TabOrder = 2
      object DBEdit1: TDBEdit
        Left = 16
        Top = 8
        Width = 737
        Height = 21
        DataField = 'NAME'
        TabOrder = 0
      end
    end
    object FiltrPanel: TPanel
      Left = 1
      Top = 65
      Width = 184
      Height = 365
      Align = alLeft
      TabOrder = 3
      Visible = False
      object LRate_D: TLabel
        Left = 16
        Top = 224
        Width = 37
        Height = 13
        Caption = 'Rate_D'
      end
      object LRate_C: TLabel
        Left = 16
        Top = 240
        Width = 36
        Height = 13
        Caption = 'Rate_C'
      end
      object LD_Currency: TLabel
        Left = 16
        Top = 256
        Width = 62
        Height = 13
        Caption = 'LD_Currency'
      end
      object LC_Currency: TLabel
        Left = 16
        Top = 272
        Width = 61
        Height = 13
        Caption = 'LC_Currency'
      end
      object LTrDate: TLabel
        Left = 16
        Top = 288
        Width = 29
        Height = 13
        Caption = 'trDate'
      end
      object LTrRate_D: TLabel
        Left = 16
        Top = 304
        Width = 53
        Height = 13
        Caption = 'LTrRate_D'
      end
      object LTrRate_C: TLabel
        Left = 16
        Top = 320
        Width = 52
        Height = 13
        Caption = 'LTrRate_C'
      end
      object PageControl1: TPageControl
        Left = 0
        Top = 1
        Width = 184
        Height = 216
        ActivePage = Filial
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Filial: TTabSheet
          Caption = 'Filial'
          object Label1: TLabel
            Left = 7
            Top = 34
            Width = 25
            Height = 13
            Caption = 'Debit'
          end
          object Label2: TLabel
            Left = 7
            Top = 57
            Width = 27
            Height = 13
            Caption = 'Credit'
          end
          object Label3: TLabel
            Left = 6
            Top = 10
            Width = 23
            Height = 13
            Caption = 'Oper'
          end
          object fltFilial_D: TSearchCombo
            Left = 57
            Top = 32
            Width = 87
            Height = 22
            ItemHeight = 16
            TabOrder = 0
            ViewField = 'name'
            DefaultStringUse = False
            DefaultStringColor = clWindowText
          end
          object fltFilial_C: TSearchCombo
            Left = 57
            Top = 56
            Width = 87
            Height = 22
            ItemHeight = 16
            TabOrder = 1
            ViewField = 'name'
            DefaultStringUse = False
            DefaultStringColor = clWindowText
          end
          object cbUser: TSearchCombo
            Left = 57
            Top = 8
            Width = 88
            Height = 22
            ItemHeight = 16
            TabOrder = 2
            ViewField = 'Name'
            DefaultString = 'All Users'
            DefaultStringUse = True
            DefaultStringColor = clWindowText
          end
          object cbFiltr: TComboBox
            Left = 8
            Top = 144
            Width = 161
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 3
            OnChange = cbFiltrChange
            Items.Strings = (
              'All Transactions'
              'NationalCurrency'
              'ForeignCurrency'
              'MultyCurrency'
              'RateDifference'
              'Profit&Loss'
              'Credit'
              'Depozit'
              'HOX'
              'SWIFT'
              'Fixed Assets'
              'Salary'
              'AzCard')
          end
        end
        object SortBy: TTabSheet
          Caption = 'SortBy'
          ImageIndex = 1
          object Number: TRadioButton
            Left = 4
            Top = 6
            Width = 100
            Height = 16
            Caption = 'Number'
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = NumberClick
          end
          object DebitNumber: TRadioButton
            Left = 4
            Top = 25
            Width = 100
            Height = 16
            Caption = 'DebitNumber'
            TabOrder = 1
          end
          object CreditNumber: TRadioButton
            Left = 4
            Top = 44
            Width = 100
            Height = 16
            Caption = 'CreditNumber'
            TabOrder = 2
          end
          object DebitCurrency: TRadioButton
            Left = 4
            Top = 61
            Width = 100
            Height = 16
            Caption = 'DebitCurrency'
            TabOrder = 3
          end
          object CreditCurrency: TRadioButton
            Left = 4
            Top = 80
            Width = 100
            Height = 16
            Caption = 'CreditCurrency'
            TabOrder = 4
          end
          object DebitAmount: TRadioButton
            Left = 4
            Top = 98
            Width = 100
            Height = 16
            Caption = 'DebitAmount'
            TabOrder = 5
          end
          object CreditAmount: TRadioButton
            Left = 4
            Top = 116
            Width = 100
            Height = 16
            Caption = 'CreditAmount'
            TabOrder = 6
          end
          object LAmount: TRadioButton
            Left = 4
            Top = 134
            Width = 100
            Height = 16
            Caption = 'LAmount'
            TabOrder = 7
          end
        end
        object Filtr: TTabSheet
          Caption = 'Filtr'
          ImageIndex = 2
          object grbox: TGroupBox
            Left = -1
            Top = -5
            Width = 177
            Height = 192
            TabOrder = 0
            object NationalCurrency: TCheckBox
              Left = 5
              Top = 10
              Width = 105
              Height = 17
              Caption = 'NationalCurrency'
              TabOrder = 0
              Visible = False
              OnClick = NationalCurrencyClick
            end
            object ForeignCurrency: TCheckBox
              Left = 5
              Top = 25
              Width = 97
              Height = 17
              Caption = 'ForeignCurrency'
              TabOrder = 1
              OnClick = ForeignCurrencyClick
            end
            object MultyCurrency: TCheckBox
              Left = 5
              Top = 39
              Width = 97
              Height = 17
              Caption = 'MultyCurrency'
              TabOrder = 2
              OnClick = MultyCurrencyClick
            end
            object RateDifference: TCheckBox
              Left = 5
              Top = 54
              Width = 97
              Height = 17
              Caption = 'RateDifference'
              TabOrder = 3
              OnClick = RateDifferenceClick
            end
            object ProfitLoss: TCheckBox
              Left = 5
              Top = 69
              Width = 97
              Height = 17
              Caption = 'Profit&Loss'
              TabOrder = 4
              OnClick = ProfitLossClick
            end
            object Hox: TCheckBox
              Left = 5
              Top = 112
              Width = 60
              Height = 15
              Caption = 'HOX'
              TabOrder = 5
              OnClick = HoxClick
            end
            object Swift: TCheckBox
              Left = 5
              Top = 127
              Width = 60
              Height = 16
              Caption = 'SWIFT'
              TabOrder = 6
              OnClick = SwiftClick
            end
            object Salary: TCheckBox
              Left = 5
              Top = 168
              Width = 97
              Height = 16
              Caption = 'Salary'
              TabOrder = 7
              OnClick = SalaryClick
            end
            object AzCard: TCheckBox
              Left = 5
              Top = 140
              Width = 68
              Height = 15
              Caption = 'AzCard'
              TabOrder = 8
              OnClick = AzCardClick
            end
            object Credit: TCheckBox
              Left = 5
              Top = 83
              Width = 60
              Height = 17
              Caption = 'Credit'
              TabOrder = 9
              OnClick = CreditClick
            end
            object Depozit: TCheckBox
              Left = 5
              Top = 97
              Width = 68
              Height = 17
              Caption = 'Depozit'
              TabOrder = 10
              OnClick = DepozitClick
            end
            object FixedAssets: TCheckBox
              Left = 5
              Top = 152
              Width = 97
              Height = 17
              Caption = 'Fixed Assets'
              TabOrder = 11
            end
          end
        end
      end
    end
  end
  object ImageList1: TImageList
    Left = 721
    Top = 25
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000C0C0C00080808000808080000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000808080008080
      8000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00C0C0C000C0C0C0008080
      8000808080000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0C000C0C0
      C000808080008080800000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C000C0C0C0008080800080808000000000008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C0C0C000C0C0C00080808000808080000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00C0C0C000C0C0C000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00808080008080800000000000000000000000
      0000FFFFFF00C0C0C00080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C0C0C000808080000000000080808000000000000000
      000000000000C0C0C00080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C0C0C000808080000000000080808000000000000000
      000000000000C0C0C00080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C0C0C000808080000000000080808000000000000000
      000000000000C0C0C00080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C0C0C000808080008080800080808000808080008080
      80000000000000000000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00808080008080800080808000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF008080800080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0007FF00000000000003FF000000000000
      01FF00000000000000FF0000000000008007000000000000C003000000000000
      E001000000000000F000000000000000F800000000000000F830000000000000
      F838000000000000F838000000000000F808000000000000F804000000000000
      FC03000000000000FE0300000000000000000000000000000000000000000000
      000000000000}
  end
end
