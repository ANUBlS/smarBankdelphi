object frmDepositContract: TfrmDepositContract
  Left = 255
  Top = 178
  BorderIcons = [biSystemMenu]
  ClientHeight = 378
  ClientWidth = 638
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 348
    Width = 638
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object RefreshListLbl: TLabel
      Left = 16
      Top = 10
      Width = 76
      Height = 14
      Caption = 'F5 -Yenil'#601'm'#601'k'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = RefreshListLblClick
    end
    object BitBtnOk: TBitBtn
      Left = 375
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Qeyd et'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = BitBtnOkClick
    end
    object BitBtnCancel: TBitBtn
      Left = 456
      Top = 4
      Width = 75
      Height = 25
      Caption = #304'mtina'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BitBtnCancelClick
    end
    object BitBtnClose: TBitBtn
      Left = 544
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Ba'#287'la'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = BitBtnCloseClick
    end
    object ContractHint: THintBox
      Left = 8
      Top = 6
      Width = 217
      Height = 21
      AutoSize = True
      BevelOuter = bvNone
      Caption = 'ContractHint'
      Color = clRed
      TabOrder = 3
      Visible = False
      HintStyle = hsAlert
      Timeout = 4000
      BeepOnMessage = False
    end
    object Edit1: TEdit
      Left = 231
      Top = 6
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'Edit1'
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 348
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel3: TPanel
      Left = 2
      Top = 2
      Width = 268
      Height = 344
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Panel4: TPanel
        Left = 2
        Top = 2
        Width = 264
        Height = 32
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label2: TLabel
          Left = 18
          Top = 9
          Width = 20
          Height = 13
          Caption = 'Filial'
        end
        object Label5: TLabel
          Left = 4
          Top = 8
          Width = 6
          Height = 16
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBLCBFilial: TDBLookupComboboxEh
          Tag = 1
          Left = 85
          Top = 4
          Width = 172
          Height = 21
          DataField = 'BRANCHID'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dmDepositContract.FilalsDatSrc
          TabOrder = 0
          Visible = True
          OnKeyPress = DBLCBFilialKeyPress
        end
      end
      object Panel5: TPanel
        Left = 2
        Top = 34
        Width = 264
        Height = 32
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object Label1: TLabel
          Left = 12
          Top = 9
          Width = 72
          Height = 13
          Caption = 'M'#252'qavil'#601'nin '#8470
        end
        object Label3: TLabel
          Left = 4
          Top = 8
          Width = 6
          Height = 16
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEditEh1: TDBEditEh
          Tag = 1
          Left = 85
          Top = 5
          Width = 172
          Height = 21
          DataField = 'CONTRACTNO'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          EditButtons = <>
          TabOrder = 0
          Visible = True
          OnKeyPress = DBLCBFilialKeyPress
        end
      end
      object Panel6: TPanel
        Left = 2
        Top = 66
        Width = 264
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        Color = clSilver
        TabOrder = 2
        object Label6: TLabel
          Left = 13
          Top = 7
          Width = 57
          Height = 13
          Caption = 'A'#231#305'lma tarixi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 4
          Top = 8
          Width = 6
          Height = 16
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DTO: TDBDateTimeEditEh
          Tag = 1
          Left = 139
          Top = 3
          Width = 121
          Height = 21
          Hint = 'dd/mm/yyyy'
          DataField = 'OPENDATE'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          EditButtons = <>
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Visible = True
          OnKeyPress = DBLCBFilialKeyPress
          EditFormat = ''
        end
      end
      object Panel7: TPanel
        Left = 2
        Top = 98
        Width = 264
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        Color = clSilver
        TabOrder = 3
        object Label8: TLabel
          Left = 13
          Top = 7
          Width = 82
          Height = 13
          Caption = 'Ba'#287'lanaca'#287#305' tarix'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 4
          Top = 8
          Width = 6
          Height = 16
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBDateTimeEditEh2: TDBDateTimeEditEh
          Tag = 1
          Left = 138
          Top = 3
          Width = 121
          Height = 21
          Hint = 'dd/mm/yyyy'
          DataField = 'CLOSEDATE'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          EditButtons = <>
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Visible = True
          OnKeyPress = DBLCBFilialKeyPress
          EditFormat = ''
        end
      end
      object Panel13: TPanel
        Left = 2
        Top = 162
        Width = 264
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 5
        object Label20: TLabel
          Left = 17
          Top = 6
          Width = 59
          Height = 13
          Caption = #304'llik faizi (%)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 4
          Top = 7
          Width = 6
          Height = 16
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBNumberEditEh2: TDBNumberEditEh
          Tag = 1
          Left = 109
          Top = 3
          Width = 150
          Height = 21
          currency = True
          DataField = 'INTEREST'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          DecimalPlaces = 4
          EditButtons = <>
          TabOrder = 0
          Visible = True
          OnKeyPress = DBLCBFilialKeyPress
        end
      end
      object Panel43: TPanel
        Left = 2
        Top = 130
        Width = 264
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 4
        object Label98: TLabel
          Left = 15
          Top = 6
          Width = 120
          Height = 13
          Caption = 'Depozitin m'#252'dd'#601'ti aylarla'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label99: TLabel
          Left = 4
          Top = 8
          Width = 6
          Height = 16
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit2: TDBEdit
          Tag = 1
          Left = 138
          Top = 6
          Width = 121
          Height = 21
          DataField = 'PeriodContracts'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          TabOrder = 0
          OnKeyPress = DBLCBFilialKeyPress
        end
      end
      object Panel8: TPanel
        Tag = 1
        Left = 2
        Top = 442
        Width = 261
        Height = 30
        BevelInner = bvLowered
        TabOrder = 11
        object Label12: TLabel
          Left = 13
          Top = 7
          Width = 126
          Height = 14
          Caption = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1082#1072#1090#1077#1075#1086#1081#1072#1089#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 4
          Top = 8
          Width = 6
          Height = 16
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBLookupComboboxEh1: TDBLookupComboboxEh
          Tag = 1
          Left = 119
          Top = 5
          Width = 139
          Height = 21
          DataField = 'PERSONALTYPE'
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'DESCRIPION'
          TabOrder = 0
          Visible = True
        end
      end
      object Panel9: TPanel
        Tag = 1
        Left = 2
        Top = 471
        Width = 261
        Height = 30
        BevelInner = bvLowered
        TabOrder = 12
        object Label14: TLabel
          Left = 13
          Top = 7
          Width = 82
          Height = 14
          Caption = #1044#1077#1087#1086#1079#1080#1090#1080#1085' '#1090#1080#1087#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 4
          Top = 8
          Width = 6
          Height = 16
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBLookupComboboxEh4: TDBLookupComboboxEh
          Tag = 1
          Left = 80
          Top = 5
          Width = 178
          Height = 21
          DataField = 'CREDITTYPE'
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'DESCRIPTION'
          TabOrder = 0
          Visible = True
        end
      end
      object Panel11: TPanel
        Left = 2
        Top = 194
        Width = 264
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 6
        object Label4: TLabel
          Left = 13
          Top = 7
          Width = 73
          Height = 13
          Caption = 'M.'#399'.G faiz (%)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object DBNumberEditEh3: TDBNumberEditEh
          Tag = 1
          Left = 108
          Top = 3
          Width = 150
          Height = 21
          currency = True
          DataField = 'OVERDUEINTEREST'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          DecimalPlaces = 4
          EditButtons = <>
          TabOrder = 0
          Visible = True
          OnKeyPress = DBLCBFilialKeyPress
        end
      end
      object Panel18: TPanel
        Left = 2
        Top = 226
        Width = 264
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 7
        object Label17: TLabel
          Left = 13
          Top = 7
          Width = 71
          Height = 13
          Caption = 'M.S.G faiz (%)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object DBEditEh2: TDBEditEh
          Tag = 1
          Left = 108
          Top = 4
          Width = 149
          Height = 21
          DataField = 'DUEINTEREST'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          EditButtons = <>
          TabOrder = 0
          Visible = True
          OnKeyPress = DBLCBFilialKeyPress
        end
      end
      object Panel17: TPanel
        Left = 2
        Top = 258
        Width = 264
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 8
        object Label25: TLabel
          Left = 13
          Top = 7
          Width = 61
          Height = 13
          Caption = 'Depozitin tipi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 4
          Top = 8
          Width = 6
          Height = 16
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ContractTypes: TDBLookupComboboxEh
          Tag = 1
          Left = 79
          Top = 5
          Width = 181
          Height = 21
          DataField = 'CONTRACTTYPE'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'TYPE'
          ListSource = dmDepositContract.DepositTypesDatSrc
          TabOrder = 0
          Visible = True
          OnKeyPress = DBLCBFilialKeyPress
          OnKeyValueChanged = DBNumberEditehChange
        end
      end
      object Panel10: TPanel
        Left = 2
        Top = 290
        Width = 264
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 9
        object Label10: TLabel
          Left = 13
          Top = 7
          Width = 66
          Height = 13
          Caption = 'M'#252#351't'#601'rinin tipi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 4
          Top = 8
          Width = 6
          Height = 16
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object CBCategories: TDBLookupComboboxEh
          Tag = 1
          Left = 80
          Top = 5
          Width = 180
          Height = 21
          DataField = 'CLIENTTYPE'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'CATEGORY'
          ListSource = dmDepositContract.ClientTypesDatSrc
          TabOrder = 0
          Visible = True
          OnKeyPress = DBLCBFilialKeyPress
        end
      end
      object Panel16: TPanel
        Left = 2
        Top = 322
        Width = 264
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 10
        object Label23: TLabel
          Left = 13
          Top = 6
          Width = 110
          Height = 13
          Caption = 'M'#252#351't'#601'rinin kateqoriyas'#305
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 4
          Top = 8
          Width = 6
          Height = 16
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object CBPersons: TDBLookupComboboxEh
          Tag = 2
          Left = 127
          Top = 1
          Width = 134
          Height = 21
          DataField = 'PERSONALTYPE'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dmDepositContract.personsDatSrc
          TabOrder = 0
          Visible = True
          OnKeyPress = DBLCBFilialKeyPress
        end
      end
    end
    object Panel14: TPanel
      Left = 270
      Top = 2
      Width = 366
      Height = 344
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Panel15: TPanel
        Left = 2
        Top = 2
        Width = 362
        Height = 32
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label16: TLabel
          Left = 18
          Top = 9
          Width = 36
          Height = 13
          Caption = 'Valyuta'
        end
        object Label22: TLabel
          Left = 4
          Top = 8
          Width = 6
          Height = 16
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBLCBValutes: TDBLookupComboboxEh
          Tag = 3
          Left = 165
          Top = 5
          Width = 190
          Height = 21
          DataField = 'CURRENCY'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'VALUTE'
          ListField = 'VALU_NAME'
          ListSource = dmDepositContract.valutesDatSrc
          TabOrder = 0
          Visible = True
          OnKeyPress = DBLCBFilialKeyPress
          OnKeyValueChanged = sged
        end
      end
      object Panel26: TPanel
        Left = 2
        Top = 91
        Width = 362
        Height = 46
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 3
        object Label27: TLabel
          Left = 4
          Top = 24
          Width = 26
          Height = 13
          Caption = 'ID-si:'
        end
        object Label28: TLabel
          Left = 131
          Top = 24
          Width = 19
          Height = 13
          Caption = 'Ad'#305':'
        end
        object StaticText1: TStaticText
          Left = 2
          Top = 2
          Width = 358
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = 'M'#252#351't'#601'ri'
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object DBLookupComboboxEh8: TDBLookupComboboxEh
          Tag = 3
          Left = 151
          Top = 20
          Width = 205
          Height = 21
          DataField = 'CUSTOMERID'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dmDepositContract.CustomersDatSrc
          TabOrder = 2
          Visible = True
          OnChange = DBLookupComboboxEh8Change
          OnKeyPress = DBLCBFilialKeyPress
        end
        object DBEdit1: TDBEdit
          Tag = 3
          Left = 30
          Top = 21
          Width = 81
          Height = 21
          DataField = 'CUSTOMERID'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          TabOrder = 1
          OnKeyPress = DBLCBFilialKeyPress
        end
      end
      object GroupBox1: TGroupBox
        Left = 2
        Top = 137
        Width = 362
        Height = 205
        Align = alBottom
        Caption = 'Hesablar'
        TabOrder = 4
        object Panel25: TPanel
          Left = 2
          Top = 15
          Width = 358
          Height = 48
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Label30: TLabel
            Left = 4
            Top = 7
            Width = 6
            Height = 16
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBLookupComboboxEh9: TDBLookupComboboxEh
            Tag = 3
            Left = 194
            Top = 22
            Width = 159
            Height = 21
            DataField = 'CONTRACTACCID'
            DataSource = dmDepositContract.DepositPorpsDatSrc
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'CLIENTNAME'
            ListSource = dmDepositContract.DepositAccsDatSrc
            TabOrder = 1
            Visible = True
            OnKeyPress = DBLCBFilialKeyPress
            OnKeyValueChanged = DBLookupComboboxEh9KeyValueChanged
          end
          object StaticText2: TStaticText
            Left = 2
            Top = 2
            Width = 354
            Height = 17
            Align = alTop
            Alignment = taCenter
            Caption = 'Depozit Hesab'#305
            Color = clSilver
            ParentColor = False
            TabOrder = 2
          end
          object CMSearchEdit1: TCMSearchEdit
            Tag = 3
            Left = 4
            Top = 22
            Width = 183
            Height = 21
            TabOrder = 0
            OnKeyPress = DBLCBFilialKeyPress
            DataField = 'CONTRACTACCID'
            DataSource = dmDepositContract.DepositPorpsDatSrc
            KeyField = 'ID'
            ListField = 'ACCNO'
            ListSource = dmDepositContract.DepositAccsDatSrc
            ErrorColor = clRed
            BeepOnNotFound = True
          end
        end
        object Panel24: TPanel
          Left = 2
          Top = 63
          Width = 358
          Height = 48
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 1
          object StaticText3: TStaticText
            Left = 2
            Top = 2
            Width = 354
            Height = 17
            Align = alTop
            Alignment = taCenter
            Caption = 'M'#252#351't'#601'ri Hesab'#305
            Color = clSilver
            ParentColor = False
            TabOrder = 0
          end
          object CMSearchEdit2: TCMSearchEdit
            Tag = 3
            Left = 4
            Top = 22
            Width = 183
            Height = 21
            TabOrder = 1
            OnKeyPress = DBLCBFilialKeyPress
            DataField = 'CLIENTACCID'
            DataSource = dmDepositContract.DepositPorpsDatSrc
            KeyField = 'ID'
            ListField = 'ACCNO'
            ListSource = dmDepositContract.ClientaccsDatSrc
            ErrorColor = clRed
            BeepOnNotFound = True
          end
          object DBLookupComboboxEh10: TDBLookupComboboxEh
            Tag = 3
            Left = 194
            Top = 23
            Width = 159
            Height = 21
            DataField = 'CLIENTACCID'
            DataSource = dmDepositContract.DepositPorpsDatSrc
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'CLIENTNAME'
            ListSource = dmDepositContract.ClientaccsDatSrc
            TabOrder = 2
            Visible = True
            OnKeyPress = DBLCBFilialKeyPress
            OnKeyValueChanged = DBLookupComboboxEh9KeyValueChanged
          end
        end
        object Panel23: TPanel
          Left = 2
          Top = 159
          Width = 358
          Height = 48
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 2
          object StaticText4: TStaticText
            Left = 2
            Top = 2
            Width = 354
            Height = 17
            Align = alTop
            Alignment = taCenter
            Caption = 'Faizl'#601'rin '#601'vv'#601'lc'#601'd'#601'n '#246'd'#601'nm'#601'si hesablar'#305
            Color = clSilver
            ParentColor = False
            TabOrder = 0
          end
          object CMSearchEdit3: TCMSearchEdit
            Left = 4
            Top = 20
            Width = 183
            Height = 21
            TabOrder = 1
            OnKeyPress = DBLCBFilialKeyPress
            DataField = 'BEFO_INTERESTPEYTACCID'
            DataSource = dmDepositContract.DepositPorpsDatSrc
            KeyField = 'id'
            ListField = 'ACCNO'
            ListSource = dmDepositContract.DSRBEFO_INTERESTPEYTACC
            ErrorColor = clRed
            BeepOnNotFound = True
          end
          object DBLookupComboboxEh2: TDBLookupComboboxEh
            Left = 194
            Top = 20
            Width = 159
            Height = 21
            DataField = 'BEFO_INTERESTPEYTACCID'
            DataSource = dmDepositContract.DepositPorpsDatSrc
            EditButtons = <>
            KeyField = 'id'
            ListField = 'CLIENTNAME'
            ListSource = dmDepositContract.DSRBEFO_INTERESTPEYTACC
            TabOrder = 2
            Visible = True
            OnKeyPress = DBLCBFilialKeyPress
            OnKeyValueChanged = DBLookupComboboxEh9KeyValueChanged
          end
        end
        object Panel20: TPanel
          Left = 2
          Top = 111
          Width = 358
          Height = 48
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 3
          object CMSearchEdit4: TCMSearchEdit
            Tag = 3
            Left = 4
            Top = 23
            Width = 183
            Height = 21
            TabOrder = 0
            OnKeyPress = DBLCBFilialKeyPress
            DataField = 'INTERESTACCID'
            DataSource = dmDepositContract.DepositPorpsDatSrc
            KeyField = 'ID'
            ListField = 'ACCNO'
            ListSource = dmDepositContract.InterestsAccsDatSrc
            ErrorColor = clRed
            BeepOnNotFound = True
          end
          object StaticText5: TStaticText
            Left = 2
            Top = 2
            Width = 354
            Height = 17
            Align = alTop
            Alignment = taCenter
            Caption = 'Faizl'#601'r Hesab'#305
            Color = clSilver
            ParentColor = False
            TabOrder = 1
          end
          object DBLookupComboboxEh11: TDBLookupComboboxEh
            Left = 194
            Top = 21
            Width = 159
            Height = 21
            DataField = 'INTERESTACCID'
            DataSource = dmDepositContract.DepositPorpsDatSrc
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'CLIENTNAME'
            ListSource = dmDepositContract.InterestsAccsDatSrc
            TabOrder = 2
            Visible = True
            OnKeyPress = DBLCBFilialKeyPress
            OnKeyValueChanged = DBLookupComboboxEh9KeyValueChanged
          end
        end
      end
      object Panel12: TPanel
        Tag = 1
        Left = 2
        Top = 34
        Width = 362
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label18: TLabel
          Left = 14
          Top = 6
          Width = 83
          Height = 13
          Caption = 'Depozitin m'#601'bl'#601#287'i'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 4
          Top = 7
          Width = 6
          Height = 16
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBNumberEditeh: TDBNumberEditEh
          Tag = 3
          Left = 165
          Top = 5
          Width = 190
          Height = 21
          currency = True
          DataField = 'AMOUNT'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          EditButtons = <>
          TabOrder = 0
          Visible = True
          OnChange = DBNumberEditehChange
          OnKeyPress = DBLCBFilialKeyPress
        end
      end
      object Panel19: TPanel
        Left = 2
        Top = 66
        Width = 362
        Height = 27
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 2
        object Label31: TLabel
          Left = 17
          Top = 6
          Width = 100
          Height = 13
          Caption = 'Faizin ilk '#246'd'#601'ni'#351' tarixi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 4
          Top = 7
          Width = 6
          Height = 16
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBDateTimeEditEh1: TDBDateTimeEditEh
          Tag = 3
          Left = 166
          Top = 3
          Width = 190
          Height = 21
          DataField = 'FIRSTINTERESTPAYDAT'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          EditButtons = <>
          TabOrder = 0
          Visible = True
          OnKeyPress = DBLCBFilialKeyPress
          EditFormat = ''
        end
      end
    end
  end
end
