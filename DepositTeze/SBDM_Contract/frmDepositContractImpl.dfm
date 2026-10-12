object frmDepositContract: TfrmDepositContract
  Left = 255
  Top = 178
  BorderIcons = [biSystemMenu]
  ClientHeight = 389
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
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
    Top = 359
    Width = 632
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object RefreshListLbl: TLabel
      Left = 16
      Top = 10
      Width = 81
      Height = 13
      Caption = 'F5 -'#1049#1077#1085#1080#1083#1103#1084#1103#1082
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = RefreshListLblClick
    end
    object Label13: TLabel
      Left = 109
      Top = 9
      Width = 45
      Height = 13
      Caption = #1048#1089#1090#1080#1092#1072#1076#1103#1095#1080':'
      Color = clBtnFace
      ParentColor = False
    end
    object Lbluser: TLabel
      Left = 158
      Top = 9
      Width = 34
      Height = 13
      Caption = 'Lbluser'
      Color = clBtnFace
      ParentColor = False
    end
    object BitBtnOk: TBitBtn
      Left = 377
      Top = 4
      Width = 75
      Height = 25
      Caption = #1043#1077#1081#1076' '#1077#1090
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
      Caption = #1048#1084#1090#1080#1085#1072' '#1077#1090
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BitBtnCancelClick
    end
    object BitBtnClose: TBitBtn
      Left = 537
      Top = 4
      Width = 75
      Height = 25
      Caption = #1041#1072#1100#1083#1072
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = BitBtnCloseClick
    end
    object ContractHint: THintBox
      Left = 9
      Top = 2
      Width = 217
      Height = 24
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 359
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel3: TPanel
      Left = 2
      Top = 2
      Width = 268
      Height = 355
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Panel17: TPanel
        Left = 2
        Top = 2
        Width = 264
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label25: TLabel
          Left = 9
          Top = 7
          Width = 60
          Height = 13
          Caption = #1044#1077#1087#1086#1079#1080#1090#1080#1085' '#1090#1080#1087#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 1
          Top = 8
          Width = 7
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
          Left = 98
          Top = 7
          Width = 162
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
          OnKeyPress = ContractTypesKeyPress
          OnKeyValueChanged = ContractTypesKeyValueChanged
        end
      end
      object Panel43: TPanel
        Left = 2
        Top = 66
        Width = 264
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 2
        object Label98: TLabel
          Left = 9
          Top = 7
          Width = 56
          Height = 13
          Caption = #1052#1094#1076#1076#1103#1090' ('#1072#1081')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label99: TLabel
          Left = 3
          Top = 8
          Width = 7
          Height = 16
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 147
          Top = 8
          Width = 37
          Height = 13
          Caption = #1050#1072#1087'.'#1087#1077#1088
        end
        object LCBPeriods: TDBLookupComboboxEh
          Tag = 1
          Left = 72
          Top = 5
          Width = 74
          Height = 21
          DataField = 'PERIODID'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'DESCRIPTION'
          ListSource = dmDepositContract.DepPeriodsds
          TabOrder = 0
          Visible = True
          OnChange = LCBPeriodsChange
          OnKeyPress = ContractTypesKeyPress
          OnKeyValueChanged = LCBPeriodsKeyValueChanged
        end
        object LCBCapPer: TDBLookupComboboxEh
          Tag = 1
          Left = 186
          Top = 4
          Width = 74
          Height = 21
          DataField = 'CAPITALPERID'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'DESCRIPTION'
          ListSource = dmDepositContract.DepCapperiodds
          TabOrder = 1
          Visible = True
          OnChange = LCBCapPerChange
          OnKeyPress = LCBCapPerKeyPress
        end
      end
      object Panel15: TPanel
        Left = 2
        Top = 34
        Width = 264
        Height = 32
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object Label16: TLabel
          Left = 18
          Top = 9
          Width = 35
          Height = 13
          Caption = #1042#1072#1083#1081#1091#1090#1072
        end
        object Label22: TLabel
          Left = 4
          Top = 8
          Width = 7
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
          Left = 72
          Top = 4
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
          OnKeyPress = ContractTypesKeyPress
          OnKeyValueChanged = sged
        end
      end
      object Panel6: TPanel
        Left = 2
        Top = 98
        Width = 264
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        Color = clSilver
        TabOrder = 3
        object Label6: TLabel
          Left = 13
          Top = 7
          Width = 55
          Height = 13
          Caption = #1040#1095#1099#1083#1084#1072' '#1090#1072#1088#1080#1093#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 4
          Top = 8
          Width = 7
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
          Kind = dtkDateEh
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
          Visible = True
          OnKeyPress = DBLCBFilialKeyPress
        end
      end
      object Panel7: TPanel
        Left = 2
        Top = 130
        Width = 264
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        Color = clSilver
        TabOrder = 4
        object Label8: TLabel
          Left = 13
          Top = 7
          Width = 81
          Height = 13
          Caption = #1041#1072#1100#1083#1072#1085#1072#1078#1072#1100#1099' '#1090#1072#1088#1080#1093
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 4
          Top = 8
          Width = 7
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
          Left = 140
          Top = 4
          Width = 121
          Height = 21
          Hint = 'dd/mm/yyyy'
          DataField = 'CLOSEDATE'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          EditButtons = <>
          Kind = dtkDateEh
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
          Visible = True
          OnKeyPress = DBLCBFilialKeyPress
        end
      end
      object Panel13: TPanel
        Left = 2
        Top = 192
        Width = 264
        Height = 32
        BevelInner = bvLowered
        TabOrder = 6
        object Label20: TLabel
          Left = 17
          Top = 6
          Width = 53
          Height = 13
          Caption = #1048#1083#1083#1080#1082' '#1092#1072#1080#1079#1080' (%)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 4
          Top = 7
          Width = 7
          Height = 16
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEditEh3: TDBEditEh
          Left = 109
          Top = 3
          Width = 151
          Height = 21
          Alignment = taRightJustify
          DataField = 'INTEREST'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          EditButtons = <>
          ReadOnly = True
          TabOrder = 0
          Visible = True
        end
      end
      object Panel11: TPanel
        Left = 2
        Top = 224
        Width = 264
        Height = 32
        BevelInner = bvLowered
        TabOrder = 7
        object Label4: TLabel
          Left = 13
          Top = 7
          Width = 67
          Height = 13
          Caption = #1052'.'#1071'.'#1069' '#1092#1072#1080#1079' (%)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
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
          DataField = 'DUEINTEREST'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          DecimalPlaces = 4
          EditButtons = <>
          ReadOnly = True
          TabOrder = 0
          Visible = True
        end
      end
      object Panel18: TPanel
        Left = 2
        Top = 256
        Width = 264
        Height = 32
        BevelInner = bvLowered
        TabOrder = 8
        object Label17: TLabel
          Left = 13
          Top = 7
          Width = 66
          Height = 13
          Caption = #1052'.'#1057'.'#1069' '#1092#1072#1080#1079' (%)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEditEh2: TDBEditEh
          Tag = 1
          Left = 108
          Top = 4
          Width = 149
          Height = 21
          Alignment = taRightJustify
          DataField = 'OVERDUEINTEREST'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          EditButtons = <>
          ReadOnly = True
          TabOrder = 0
          Visible = True
        end
      end
      object Panel10: TPanel
        Left = 2
        Top = 288
        Width = 264
        Height = 32
        BevelInner = bvLowered
        TabOrder = 9
        object Label10: TLabel
          Left = 13
          Top = 7
          Width = 64
          Height = 13
          Caption = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1090#1080#1087#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 4
          Top = 8
          Width = 7
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
          Left = 112
          Top = 5
          Width = 148
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
        end
      end
      object Panel16: TPanel
        Left = 2
        Top = 320
        Width = 264
        Height = 32
        BevelInner = bvLowered
        TabOrder = 10
        object Label23: TLabel
          Left = 13
          Top = 7
          Width = 102
          Height = 13
          Caption = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1082#1072#1090#1077#1075#1086#1081#1072#1089#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 4
          Top = 8
          Width = 7
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
          Left = 149
          Top = 5
          Width = 112
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
        end
      end
      object Panel12: TPanel
        Tag = 1
        Left = 2
        Top = 160
        Width = 264
        Height = 32
        BevelInner = bvLowered
        TabOrder = 5
        object Label18: TLabel
          Left = 14
          Top = 6
          Width = 83
          Height = 13
          Caption = #1044#1077#1087#1086#1079#1080#1090#1080#1085' '#1084#1103#1073#1083#1103#1100#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 4
          Top = 7
          Width = 7
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
          Left = 109
          Top = 3
          Width = 151
          Height = 21
          currency = True
          DataField = 'AMOUNT'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          EditButtons = <>
          TabOrder = 0
          Visible = True
          OnKeyPress = ContractTypesKeyPress
        end
      end
    end
    object Panel14: TPanel
      Left = 270
      Top = 2
      Width = 360
      Height = 355
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object Panel26: TPanel
        Left = 2
        Top = 102
        Width = 356
        Height = 46
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 3
        object Label27: TLabel
          Left = 4
          Top = 27
          Width = 24
          Height = 13
          Caption = 'ID-si:'
        end
        object Label28: TLabel
          Left = 117
          Top = 27
          Width = 18
          Height = 13
          Caption = #1040#1076#1099':'
        end
        object StaticText1: TStaticText
          Left = 2
          Top = 2
          Width = 352
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1052#1094#1096#1090#1103#1088#1080
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object DBLookupComboboxEh8: TDBLookupComboboxEh
          Tag = 3
          Left = 149
          Top = 23
          Width = 204
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
          OnKeyPress = DBLCBFilialKeyPress
        end
        object DBEdit1: TDBEdit
          Tag = 3
          Left = 30
          Top = 20
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
        Top = 148
        Width = 356
        Height = 205
        Align = alBottom
        Caption = #1065#1077#1089#1072#1073#1083#1072#1088
        TabOrder = 4
        object Panel25: TPanel
          Left = 2
          Top = 15
          Width = 352
          Height = 48
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 0
          object Label30: TLabel
            Left = 4
            Top = 7
            Width = 7
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
            Left = 182
            Top = 22
            Width = 169
            Height = 21
            DataField = 'CONTRACTACCID'
            DataSource = dmDepositContract.DepositPorpsDatSrc
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'CLIENTNAME'
            ListSource = dmDepositContract.DepositAccsDatSrc
            TabOrder = 2
            Visible = True
            OnKeyPress = DBLCBFilialKeyPress
            OnKeyValueChanged = DBLookupComboboxEh9KeyValueChanged
          end
          object StaticText2: TStaticText
            Left = 2
            Top = 2
            Width = 348
            Height = 17
            Align = alTop
            Alignment = taCenter
            Caption = #1044#1077#1087#1086#1079#1080#1090' '#1065#1077#1089#1072#1073#1099
            Color = clSilver
            ParentColor = False
            TabOrder = 0
          end
          object CMSearchEdit1: TCMSearchEdit
            Tag = 3
            Left = 4
            Top = 22
            Width = 176
            Height = 21
            TabOrder = 1
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
          Width = 352
          Height = 49
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 1
          object StaticText3: TStaticText
            Left = 2
            Top = 2
            Width = 348
            Height = 17
            Align = alTop
            Alignment = taCenter
            Caption = #1052#1094#1096#1090#1103#1088#1080' '#1065#1077#1089#1072#1073#1099
            Color = clSilver
            ParentColor = False
            TabOrder = 0
          end
          object CMSearchEdit2: TCMSearchEdit
            Tag = 3
            Left = 4
            Top = 22
            Width = 176
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
            Left = 182
            Top = 22
            Width = 169
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
          Width = 352
          Height = 48
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 3
          object CMSearchEdit3: TCMSearchEdit
            Tag = 3
            Left = 4
            Top = 22
            Width = 176
            Height = 21
            TabOrder = 1
            OnKeyPress = DBLCBFilialKeyPress
            DataField = 'INTERESTACCID'
            DataSource = dmDepositContract.DepositPorpsDatSrc
            KeyField = 'ID'
            ListField = 'ACCNO'
            ListSource = dmDepositContract.InterestsAccsDatSrc
            ErrorColor = clRed
            BeepOnNotFound = True
          end
          object DBLookupComboboxEh11: TDBLookupComboboxEh
            Tag = 3
            Left = 182
            Top = 21
            Width = 169
            Height = 21
            DataField = 'INTERESTACCID'
            DataSource = dmDepositContract.DepositPorpsDatSrc
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'CLIENTNAME'
            ListSource = dmDepositContract.InterestsAccsDatSrc
            TabOrder = 2
            Visible = True
            OnKeyPress = DBLCBFilialKeyPress
            OnKeyValueChanged = DBLookupComboboxEh9KeyValueChanged
          end
          object StaticText4: TStaticText
            Left = 2
            Top = 2
            Width = 343
            Height = 17
            Alignment = taCenter
            Caption = 
              '                                        '#1060#1072#1080#1079#1083#1103#1088' '#1065#1077#1089#1072#1073#1099'          ' +
              '                                         '
            Color = clSilver
            ParentColor = False
            TabOrder = 0
          end
        end
        object Panel20: TPanel
          Left = 2
          Top = 112
          Width = 352
          Height = 47
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 2
          object StaticText5: TStaticText
            Left = 2
            Top = 2
            Width = 348
            Height = 17
            Align = alTop
            Alignment = taCenter
            Caption = #1049#1099#1100#1099#1083#1084#1099#1096' '#1092#1072#1080#1079#1083#1103#1088' '#1094#1095#1094#1085' '#1082#1102#1095#1094#1088#1094#1083#1084#1103' '#1065#1077#1089#1072#1073#1099
            Color = clSilver
            ParentColor = False
            TabOrder = 0
          end
          object CMSearchEdit4: TCMSearchEdit
            Tag = 3
            Left = 4
            Top = 22
            Width = 176
            Height = 21
            TabOrder = 1
            OnKeyPress = DBLCBFilialKeyPress
            DataField = 'BOOROWERACCID'
            DataSource = dmDepositContract.DepositPorpsDatSrc
            KeyField = 'ID'
            ListField = 'ACCNO'
            ListSource = dmDepositContract.BoorowerAccsds
            ErrorColor = clRed
            BeepOnNotFound = True
          end
          object DBLookupComboboxEh2: TDBLookupComboboxEh
            Tag = 3
            Left = 182
            Top = 21
            Width = 169
            Height = 21
            DataField = 'BOOROWERACCID'
            DataSource = dmDepositContract.DepositPorpsDatSrc
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'CLIENTNAME'
            ListSource = dmDepositContract.BoorowerAccsds
            TabOrder = 2
            Visible = True
            OnKeyPress = DBLCBFilialKeyPress
            OnKeyValueChanged = DBLookupComboboxEh9KeyValueChanged
          end
        end
      end
      object Panel19: TPanel
        Left = 2
        Top = 66
        Width = 356
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 2
        object Label31: TLabel
          Left = 13
          Top = 7
          Width = 98
          Height = 13
          Caption = #1060#1072#1080#1079#1080#1085' '#1080#1083#1082' '#1102#1076#1103#1085#1080#1096' '#1090#1072#1088#1080#1093#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 4
          Top = 7
          Width = 7
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
          Left = 153
          Top = 3
          Width = 108
          Height = 21
          DataField = 'FIRSTINTERESTPAYDAT'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 0
          Visible = True
          OnKeyPress = DBLCBFilialKeyPress
        end
        object ChAutopr: TCheckBox
          Left = 263
          Top = 4
          Width = 83
          Height = 17
          Caption = #1040#1074#1090#1086' '#1087#1088#1086#1083#1086#1085#1075'.'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
      object Panel4: TPanel
        Left = 2
        Top = 34
        Width = 356
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label5: TLabel
          Left = 18
          Top = 9
          Width = 20
          Height = 13
          Caption = #1060#1080#1083#1080#1072#1083
        end
        object Label32: TLabel
          Left = 4
          Top = 8
          Width = 7
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
          Left = 153
          Top = 4
          Width = 190
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
        Top = 2
        Width = 356
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 12
          Top = 9
          Width = 71
          Height = 13
          Caption = #1052#1094#1075#1072#1074#1080#1083#1103#1085#1080#1085' '#8470
        end
        object Label2: TLabel
          Left = 4
          Top = 8
          Width = 7
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
          Left = 153
          Top = 5
          Width = 186
          Height = 21
          DataField = 'CONTRACTNO'
          DataSource = dmDepositContract.DepositPorpsDatSrc
          EditButtons = <>
          TabOrder = 0
          Visible = True
        end
      end
    end
  end
end
