object TransactionEditForm: TTransactionEditForm
  Left = 400
  Top = 193
  AutoSize = True
  BorderStyle = bsDialog
  ClientHeight = 575
  ClientWidth = 646
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 221
    Width = 646
    Height = 75
    Align = alTop
    Caption = 'M'#601'bl'#601#287'l'#601'r'
    TabOrder = 2
    object Panel11: TPanel
      Left = 4
      Top = 15
      Width = 317
      Height = 26
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'Debet m'#601'bl'#601#287
      TabOrder = 0
      object CurrencyEditDebit: TCurrencyEdit
        Tag = 1
        Left = 77
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
      Width = 319
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
        OnChange = CurrencyEditCreditChange
        OnKeyPress = CurrencyEditCreditKeyPress
      end
    end
    object Panel13: TPanel
      Left = 4
      Top = 42
      Width = 639
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
        OnKeyPress = CurrencyEditLammountKeyPress
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 589
        Top = 3
        Width = 40
        Height = 21
        Color = clSilver
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = TransactionDataModule.OperationTypesData
        TabOrder = 1
        TabStop = False
        Visible = False
      end
    end
  end
  object Panel17: TPanel
    Left = 0
    Top = 547
    Width = 646
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object ButtonCancel: TButton
      Left = 477
      Top = 2
      Width = 75
      Height = 25
      Action = ActionCancel
      TabOrder = 0
    end
    object ButtonClose: TButton
      Left = 558
      Top = 2
      Width = 75
      Height = 25
      Action = ActionExit
      TabOrder = 1
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 0
      Top = 0
      Width = 71
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = TransactionDataModule.BProc
      TabOrder = 2
      Visible = False
    end
    object Button1: TButton
      Left = 72
      Top = 1
      Width = 97
      Height = 25
      Caption = 'Biznes Proses'
      TabOrder = 3
      Visible = False
      OnClick = Button1Click
    end
    object GoAml: TButton
      Left = 111
      Top = 0
      Width = 75
      Height = 25
      Caption = 'GoAml'
      TabOrder = 4
      Visible = False
      OnClick = GoAmlClick
    end
    object ButtonApply: TButton
      Left = 393
      Top = 2
      Width = 75
      Height = 25
      Action = ActionInsert
      TabOrder = 5
      OnMouseMove = ButtonApplyMouseMove
    end
    object Button4: TButton
      Left = 220
      Top = 2
      Width = 167
      Height = 25
      Caption = 'B'#252'dc'#601' mad'#601'l'#601'ri  redakt'#601'si'
      TabOrder = 6
      Visible = False
      OnClick = Button4Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 0
    Width = 646
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
    Width = 646
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
  object Panel20: TPanel
    Left = 0
    Top = 296
    Width = 646
    Height = 245
    Align = alTop
    AutoSize = True
    TabOrder = 3
    object panel_xezne: TPanel
      Left = 1
      Top = 24
      Width = 644
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  X'#601'zin'#601' simvolu'
      TabOrder = 1
      object CashSymbolLookUp: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 450
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
    object Konvertasya_teynat: TPanel
      Left = 1
      Top = 1
      Width = 644
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  Konvertasiya t'#601'yinat'#305
      TabOrder = 0
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
        Width = 450
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
    object Panel16: TPanel
      Left = 1
      Top = 47
      Width = 644
      Height = 24
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  '#399'm'#601'liyyat t'#601'yinat'#305
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
        Width = 450
        Height = 21
        TabOrder = 1
        TabStop = False
        OnClick = ComboBox1Click
        OnDropDown = ComboBox1DropDown
      end
      object DBEditDestination: TDBEdit
        Left = 192
        Top = 1
        Width = 433
        Height = 21
        DataField = 'NAME'
        DataSource = TransactionDataModule.TransactionsData
        TabOrder = 2
        OnChange = DBEditDestinationChange
        OnKeyPress = DBEditDestinationKeyPress
      end
    end
    object Panel_countries: TPanel
      Left = 1
      Top = 71
      Width = 644
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' '#214'lk'#601':'
      TabOrder = 3
      object Label8: TLabel
        Left = 29
        Top = 3
        Width = 6
        Height = 13
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object CountrIDDBEdit: TDBEdit
        Left = 118
        Top = 1
        Width = 74
        Height = 21
        DataField = 'COUNTRID'
        DataSource = TransactionDataModule.TransactionsData
        TabOrder = 0
        OnChange = CountrIDDBEditChange
        OnKeyPress = CountrIDDBEditKeyPress
      end
      object CountrIDLookUp: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 450
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
    object Hesabat_teynat: TPanel
      Left = 1
      Top = 94
      Width = 644
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' Hesabat t'#601'yinat'#305
      TabOrder = 4
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
        Width = 450
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
    object Emelyyatn_novu: TPanel
      Left = 1
      Top = 117
      Width = 644
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' '#399'm'#601'liyyat'#305'n n'#246'v'#252':'
      TabOrder = 5
      object Label9: TLabel
        Left = 100
        Top = 5
        Width = 6
        Height = 13
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBLC_MMX_Transmode: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 421
        Height = 21
        KeyField = 'NAME'
        ListField = 'DESCRIPTION'
        ListSource = TransactionDataModule.DS_MMX_TRANSMODE
        TabOrder = 0
        OnCloseUp = DBLC_MMX_TransmodeCloseUp
        OnKeyPress = DBLC_MMX_TransmodeKeyPress
      end
      object EditTransModeCode: TEdit
        Left = 118
        Top = 1
        Width = 74
        Height = 21
        TabOrder = 1
        OnChange = EditTransModeCodeChange
        OnKeyPress = EditTransModeCodeKeyPress
      end
      object Button2: TButton
        Left = 615
        Top = 3
        Width = 26
        Height = 19
        ImageIndex = 1
        Images = ImageList1
        TabOrder = 2
        OnClick = Button2Click
      end
    end
    object Panel_Budce: TPanel
      Left = 1
      Top = 194
      Width = 644
      Height = 25
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'B'#252'dc'#601' kodu:'
      TabOrder = 6
      object DBLookupComboB_budce: TDBLookupComboBox
        Left = 231
        Top = 2
        Width = 411
        Height = 21
        DataField = 'BDG_CODE'
        DataSource = TransactionDataModule.TransactionsData
        Enabled = False
        KeyField = 'CODE'
        ListField = 'NAME'
        ListSource = TransactionDataModule.Dsrc_budce_subdivision
        TabOrder = 0
        OnCloseUp = DBLookupComboB_budceCloseUp
        OnKeyPress = DBLookupComboB_budceKeyPress
      end
      object DBEdit_BucCode: TDBEdit
        Left = 116
        Top = 2
        Width = 116
        Height = 21
        DataField = 'BDG_CODE'
        DataSource = TransactionDataModule.TransactionsData
        Enabled = False
        TabOrder = 1
        OnChange = DBEdit_BucCodeChange
        OnExit = DBEdit_BucCodeExit
        OnKeyPress = DBEdit_BucCodeKeyPress
      end
    end
    object Tesnf_kodu: TPanel
      Left = 1
      Top = 140
      Width = 644
      Height = 24
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' '#399'. t'#601'snifat kodu:'
      TabOrder = 7
      object Label14: TLabel
        Left = 96
        Top = 5
        Width = 6
        Height = 13
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBLC_MMX_reportcode: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 421
        Height = 21
        KeyField = 'NAME'
        ListField = 'DESCRIPTION'
        ListSource = TransactionDataModule.Dsrc_mmx_reportcode
        TabOrder = 0
        OnCloseUp = DBLC_MMX_reportcodeCloseUp
        OnKeyPress = DBLC_MMX_reportcodeKeyPress
      end
      object Editreportcode: TEdit
        Left = 118
        Top = 1
        Width = 74
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
        OnChange = EditreportcodeChange
        OnExit = EditreportcodeExit
        OnKeyPress = EditreportcodeKeyPress
      end
      object Button3: TButton
        Left = 615
        Top = 3
        Width = 26
        Height = 19
        ImageIndex = 1
        Images = ImageList1
        TabOrder = 2
        OnClick = Button3Click
      end
    end
    object Panel_simcrop: TPanel
      Left = 1
      Top = 164
      Width = 644
      Height = 30
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 8
      object Label12: TLabel
        Left = 6
        Top = 8
        Width = 52
        Height = 13
        Caption = 'SimcorpID:'
      end
      object Label13: TLabel
        Left = 227
        Top = 8
        Width = 41
        Height = 13
        Caption = 'Instype:'
      end
      object Label15: TLabel
        Left = 442
        Top = 8
        Width = 49
        Height = 13
        Caption = 'Isin/ ticer:'
      end
      object Edit_simcropid: TEdit
        Left = 64
        Top = 6
        Width = 144
        Height = 21
        TabOrder = 0
      end
      object Edit_isntype: TEdit
        Left = 276
        Top = 5
        Width = 144
        Height = 21
        TabOrder = 1
      end
      object Edit_isinticer: TEdit
        Left = 493
        Top = 5
        Width = 144
        Height = 21
        TabOrder = 2
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 219
      Width = 644
      Height = 25
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      TabOrder = 9
      object Label16: TLabel
        Left = 221
        Top = 6
        Width = 157
        Height = 13
        Caption = #399'm'#601'liyyatdan 10% tutulma'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 434
        Top = 6
        Width = 157
        Height = 13
        Caption = #399'm'#601'liyyatdan 18% tutulma'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 5
        Top = 6
        Width = 150
        Height = 13
        Caption = #399'm'#601'liyyatdan 6% tutulma'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CheckBox1: TCheckBox
        Left = 382
        Top = 5
        Width = 49
        Height = 17
        Caption = '10%'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 593
        Top = 5
        Width = 48
        Height = 17
        Caption = '18%'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = CheckBox2Click
      end
      object CheckBox3: TCheckBox
        Left = 167
        Top = 5
        Width = 49
        Height = 17
        Caption = '6%'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = CheckBox1Click
      end
    end
  end
  object Panel21: TPanel
    Left = 0
    Top = 541
    Width = 646
    Height = 6
    Align = alTop
    TabOrder = 5
  end
  object Panel19: TPanel
    Left = 0
    Top = 182
    Width = 646
    Height = 39
    Align = alTop
    Alignment = taLeftJustify
    AutoSize = True
    BevelInner = bvLowered
    TabOrder = 0
    object Label10: TLabel
      Left = 6
      Top = 2
      Width = 67
      Height = 13
      Caption = 'Debet m'#252#351't'#601'ri'
    end
    object Label11: TLabel
      Left = 323
      Top = 2
      Width = 66
      Height = 13
      Caption = 'Kredit m'#252#351't'#601'ri'
    end
    object BtnDebtCustomer: TSpeedButton
      Left = 93
      Top = 16
      Width = 15
      Height = 21
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clLime
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = BtnDebtCustomerClick
    end
    object BtnCredCustomer: TSpeedButton
      Left = 414
      Top = 15
      Width = 15
      Height = 21
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clLime
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = BtnCredCustomerClick
    end
    object SpeedButton2: TSpeedButton
      Left = 4
      Top = 16
      Width = 15
      Height = 21
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clLime
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object SpeedButton1: TSpeedButton
      Left = 326
      Top = 16
      Width = 15
      Height = 21
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clLime
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object Edit_CCustId: TEdit
      Left = 343
      Top = 16
      Width = 72
      Height = 21
      ReadOnly = True
      TabOrder = 2
      OnChange = Edit_CCustIdChange
      OnKeyPress = Edit_CCustIDKeyPress
    end
    object Edit_DCustId: TEdit
      Left = 20
      Top = 16
      Width = 72
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnChange = Edit_DCustIdChange
      OnKeyPress = Edit_DCustIDKeyPress
    end
    object DCust: TDBEdit
      Left = 108
      Top = 16
      Width = 212
      Height = 21
      Color = clSilver
      DataField = 'NAME'
      DataSource = TransactionDataModule.DS_DebtCustomer
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object CCust: TDBEdit
      Left = 430
      Top = 15
      Width = 212
      Height = 21
      Color = clSilver
      DataField = 'NAME'
      DataSource = TransactionDataModule.DS_CredCustomer
      Enabled = False
      TabOrder = 3
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 47
    Width = 646
    Height = 135
    Align = alTop
    AutoSize = True
    TabOrder = 1
    object Panel1: TPanel
      Left = 3
      Top = 1
      Width = 320
      Height = 133
      AutoSize = True
      BevelInner = bvLowered
      TabOrder = 0
      object PanelDebit: TPanel
        Left = 2
        Top = 109
        Width = 316
        Height = 22
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 4
        object PanelDebitRest: TPanel
          Left = 1
          Top = 1
          Width = 314
          Height = 20
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 5
            Top = 2
            Width = 28
            Height = 13
            Caption = 'Qal'#305'q:'
          end
          object DBText1: TDBText
            Left = 47
            Top = 2
            Width = 104
            Height = 17
            DataField = 'OSTAT'
            DataSource = TransactionDataModule.DebitAccs
          end
          object Label2: TLabel
            Left = 162
            Top = 2
            Width = 53
            Height = 13
            Caption = 'Ekvivalent:'
          end
          object DBText2: TDBText
            Left = 225
            Top = 2
            Width = 77
            Height = 17
            DataField = 'POK_OSTAT'
            DataSource = TransactionDataModule.DebitAccs
          end
        end
      end
      object Panel4: TPanel
        Left = 2
        Top = 81
        Width = 316
        Height = 28
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object DBEdit1: TDBEdit
          Left = 1
          Top = 4
          Width = 312
          Height = 21
          DataField = 'NAME'
          DataSource = TransactionDataModule.DebitAccs
          ReadOnly = True
          TabOrder = 0
        end
      end
      object PANELDEBT_ACC_NOSEARCH: TPanel
        Left = 2
        Top = 52
        Width = 316
        Height = 29
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvSpace
        TabOrder = 3
        object CMSearchEdit1: TCMSearchEdit
          Left = 62
          Top = 3
          Width = 252
          Height = 21
          TabOrder = 1
          OnClick = CMSearchEdit1Click
          OnEnter = CMSearchEdit1Enter
          OnExit = CMSearchEdit1Exit
          OnKeyPress = CMSearchEdit1KeyPress
          DataField = 'DEBITACCNO'
          DataSource = TransactionDataModule.TransactionsData
          KeyField = 'id'
          ListField = 'ACC_NO'
          ListSource = Dsrc_DEBIT_ACCNO
          ErrorColor = clRed
          BeepOnNotFound = True
        end
        object Edit1: TEdit
          Left = 2
          Top = 3
          Width = 59
          Height = 21
          Enabled = False
          TabOrder = 0
        end
      end
      object PANELDEBT_ACC_NO: TPanel
        Left = 2
        Top = 25
        Width = 316
        Height = 27
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 2
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
          Width = 252
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
        TabOrder = 1
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
          TabOrder = 2
          OnChange = DebitCurrencyRateChange
        end
        object DebitCurrencyLookUp: TDBLookupComboBox
          Left = 32
          Top = 2
          Width = 198
          Height = 21
          Color = clSilver
          DataField = 'DEBITCURRENCYID'
          DataSource = TransactionDataModule.TransactionsData
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = TransactionDataModule.DebitCurrency
          TabOrder = 1
          TabStop = False
          OnCloseUp = DebitCurrencyLookUpCloseUp
          OnEnter = DebitCurrencyLookUpEnter
        end
      end
    end
    object Panel2: TPanel
      Left = 323
      Top = 1
      Width = 321
      Height = 131
      AutoSize = True
      BevelInner = bvLowered
      TabOrder = 1
      object PanelCredit: TPanel
        Left = 2
        Top = 107
        Width = 317
        Height = 22
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 3
        object PanelCreditRest: TPanel
          Left = 1
          Top = 1
          Width = 315
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
            Left = 44
            Top = 2
            Width = 98
            Height = 17
            DataField = 'OSTAT'
            DataSource = TransactionDataModule.CreditAccs
          end
          object Label4: TLabel
            Left = 140
            Top = 3
            Width = 53
            Height = 13
            Caption = 'Ekvivalent:'
          end
          object DBText4: TDBText
            Left = 207
            Top = 2
            Width = 105
            Height = 17
            DataField = 'POK_OSTAT'
            DataSource = TransactionDataModule.CreditAccs
          end
        end
      end
      object Panel8: TPanel
        Left = 2
        Top = 78
        Width = 317
        Height = 29
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 4
        object DBEdit2: TDBEdit
          Tag = 1
          Left = 3
          Top = 4
          Width = 310
          Height = 21
          TabStop = False
          DataField = 'NAME'
          DataSource = TransactionDataModule.CreditAccs
          ReadOnly = True
          TabOrder = 0
        end
      end
      object PANELCREDT_ACC_NO: TPanel
        Left = 2
        Top = 27
        Width = 317
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
          Top = 2
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
        Width = 317
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
          Left = 229
          Top = 2
          Width = 84
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'CREDITRATE'
          DataSource = TransactionDataModule.TransactionsData
          TabOrder = 2
          OnChange = DebitCurrencyRateChange
        end
        object CreditCurrencyLookUp: TDBLookupComboBox
          Left = 33
          Top = 2
          Width = 195
          Height = 21
          Color = clSilver
          DataField = 'CREDITCURRENCYID'
          DataSource = TransactionDataModule.TransactionsData
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = TransactionDataModule.CreditCurrency
          TabOrder = 1
          TabStop = False
          OnCloseUp = CreditCurrencyLookUpCloseUp
          OnEnter = CreditCurrencyLookUpEnter
        end
      end
      object PANELCREDT_ACC_NOSEARCH: TPanel
        Left = 2
        Top = 52
        Width = 317
        Height = 26
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 2
        object Edit2: TEdit
          Left = 1
          Top = 2
          Width = 59
          Height = 21
          Enabled = False
          HideSelection = False
          TabOrder = 0
        end
        object CMSearchEdit2: TCMSearchEdit
          Left = 61
          Top = 2
          Width = 252
          Height = 21
          TabOrder = 1
          OnEnter = CMSearchEdit2Enter
          OnExit = CMSearchEdit2Exit
          OnKeyPress = CMSearchEdit2KeyPress
          DataField = 'CREDITACCNO'
          DataSource = TransactionDataModule.TransactionsData
          KeyField = 'ID'
          ListField = 'ACC_NO'
          ListSource = Dsrc_CREDIT_ACCNO
          ErrorColor = clRed
          BeepOnNotFound = True
        end
      end
    end
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
  object ODS_DEBIT_ACCNO: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  A.ID,'
      '  A.ACC_NO,'
      
        '  SUBSTR(acc_no,(select value from settings where name='#39'AccNoSea' +
        'rchPos'#39'),30) as ACC_No_Search,'
      '  A.VAL_ACC,'
      '  A.NAME,'
      '  B.CASHINCOMING AS ISCACHEACCOUNT,'
      '  A.KLI_ID'
      'FROM'
      '  ACCOUNT A'
      ' ,BAL_SPR1 B '
      'WHERE'
      '  A.BAL_CN1 = B.BAL_CN'
      '  AND'
      '  A.CLOSE_DAT IS NULL'
      '  AND  A.VAL_ACC=:v_Val '
      ''
      ''
      ''
      '--order by id')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A0056005F00560041004C000300000004000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000700000004000000490044000100000000000C000000410043004300
      5F004E004F000100000000001A0000004100430043005F004E004F005F005300
      450041005200430048000100000000000E000000560041004C005F0041004300
      4300010000000000080000004E0041004D0045000100000000001C0000004900
      5300430041004300480045004100430043004F0055004E005400010000000000
      0C0000004B004C0049005F0049004400010000000000}
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 400
    Top = 312
    object ODS_DEBIT_ACCNOID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODS_DEBIT_ACCNOACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 448
    end
    object ODS_DEBIT_ACCNOACC_NO_SEARCH: TWideStringField
      FieldName = 'ACC_NO_SEARCH'
      Size = 120
    end
    object ODS_DEBIT_ACCNOVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object ODS_DEBIT_ACCNONAME: TWideStringField
      FieldName = 'NAME'
      Size = 1440
    end
    object ODS_DEBIT_ACCNOISCACHEACCOUNT: TFloatField
      FieldName = 'ISCACHEACCOUNT'
    end
    object ODS_DEBIT_ACCNOKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
  end
  object Dsrc_DEBIT_ACCNO: TDataSource
    DataSet = ODS_DEBIT_ACCNO
    Left = 504
    Top = 312
  end
  object ODS_CREDIT_ACCNO: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  A.ID,'
      '  A.ACC_NO,'
      
        '  SUBSTR(acc_no,(select value from settings where name='#39'AccNoSea' +
        'rchPos'#39'),30) as ACC_No_Search,'
      '  A.VAL_ACC,'
      '  A.NAME,'
      '  B.CASHINCOMING AS ISCACHEACCOUNT,'
      '  A.KLI_ID'
      'FROM'
      '  ACCOUNT A'
      ' ,BAL_SPR1 B '
      'WHERE'
      '  A.BAL_CN1 = B.BAL_CN'
      '  AND'
      '  A.CLOSE_DAT IS NULL'
      '  AND  A.VAL_ACC=:v_Val '
      '--order by id')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A0056005F00560041004C000300000004000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000700000004000000490044000100000000000C000000410043004300
      5F004E004F000100000000001A0000004100430043005F004E004F005F005300
      450041005200430048000100000000000E000000560041004C005F0041004300
      4300010000000000080000004E0041004D0045000100000000001C0000004900
      5300430041004300480045004100430043004F0055004E005400010000000000
      0C0000004B004C0049005F0049004400010000000000}
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 400
    Top = 376
    object FloatField1: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object WideStringField1: TWideStringField
      FieldName = 'ACC_NO'
      Size = 448
    end
    object WideStringField2: TWideStringField
      FieldName = 'ACC_NO_SEARCH'
      Size = 120
    end
    object IntegerField1: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object WideStringField3: TWideStringField
      FieldName = 'NAME'
      Size = 1440
    end
    object FloatField2: TFloatField
      FieldName = 'ISCACHEACCOUNT'
    end
    object FloatField3: TFloatField
      FieldName = 'KLI_ID'
    end
  end
  object Dsrc_CREDIT_ACCNO: TDataSource
    DataSet = ODS_CREDIT_ACCNO
    Left = 472
    Top = 376
  end
  object ImageList1: TImageList
    Left = 416
    Top = 208
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000000000000000000000000000000000
      0000841084100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000846C8410
      0000844CC6540000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000007C846C
      1042007C085DC618844CC6540000000000000000007C007C007C007C007C0040
      007C007C007C007C007CE07F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C6D003C003C007C007C
      007C007C005C846C007C003C00000000000000000000007C007C007C00400040
      0040007C007C007C007C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A29007C007C007C007C
      E07FE07F003C007C007C003C4A29082100000000000000000042100010000042
      00420042E07FE07FE07F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000C6180821007C007C007C007C
      E07FE07F003C007C007C007C007C083D000000000000000000001F0010001000
      1042104200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000821007C007C007C007C007C007C
      E07DE07D005C007C007C007C005C00000000000000000000FF031F001F001F00
      1000100010421042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000001C846C007C007C007C007C
      E07FE07F003C007C007C007C005C001C0000000000000000FF031F001000FF03
      1F00100010421042104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000842C846C007C007C007C007C
      E07FE07F003C007C007C007C007C007C4A45000000000000FF031F0010001042
      1F001F0010001042104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000842C007C007C007C007C007C007C
      E07FE07F003C007C007C007C844CC6180000000000000000FF03100010421042
      FF031F0010001000104210420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A45007C007C007C007C
      E07FE07F003C007C007C007CC67400000000000000000000FF031F0000000000
      000000001F001F00100010421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000844C007C007C007C007C
      E07FE07F005C007C007C007C007C844C00000000000000000000000000000000
      00000000FF031F001F0010001042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000C618846CC654005C007C007C
      007C007C007C007C007C003C003C842C00000000000000000000000000000000
      000000000000FF031F0010001000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000003C007C006C
      005C007CC674C674007C00000000000000000000000000000000000000000000
      0000000000000000FF031F001000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000842CC6740010
      4A29007C4A290000842CC6180000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C61800000000
      0000105E00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FF3FFFFF00000000F93FFFFF00000000
      F807800700000000C007C00F00000000C001E00F000000008001F07F00000000
      0003E01F000000008001E00F000000008000E00F000000000001E00700000000
      C003E78100000000C001FF81000000008001FFC100000000F00FFFE100000000
      F027FFFF00000000F77FFFFF00000000}
  end
  object ods_parentid: TOracleDataSet
    SQL.Strings = (
      'select id,parentid from provarch  where parentid=:v_id '
      'union all'
      'select id,parentid  from lazytransaction where parentid=:v_id ')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A0056005F004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      0500000002000000040000004900440001000000000010000000500041005200
      45004E00540049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 520
    Top = 160
    object ods_parentidID: TFloatField
      FieldName = 'ID'
    end
    object ods_parentidPARENTID: TFloatField
      FieldName = 'PARENTID'
    end
  end
end
