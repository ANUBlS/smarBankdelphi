object PaymentAddForm: TPaymentAddForm
  Left = 457
  Top = 112
  ActiveControl = DBLookupComboboxEhCustAcc
  BorderIcons = [biSystemMenu]
  Caption = 'PaymentAddForm'
  ClientHeight = 437
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCanResize = FormCanResize
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 433
    Height = 39
    Align = alTop
    AutoSize = True
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 431
      Height = 37
      Align = alBottom
      Caption = #1070#1076#1103#1085#1080#1096' '#1065#1077#1089#1072#1073#1099
      TabOrder = 0
      object Label1: TLabel
        Left = 227
        Top = 17
        Width = 50
        Height = 13
        Caption = #1043#1040#1051#1067#1068#1067' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 17
        Top = 15
        Width = 16
        Height = 16
        Caption = #8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBLookupComboboxEhCustAcc: TDBLookupComboboxEh
        Left = 40
        Top = 14
        Width = 181
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ACCID'
        ListField = 'ACCOUNTNUMBER'
        ListSource = PaymentDataModule.DataSrcPaymentAccounts
        TabOrder = 0
        Visible = True
        OnKeyValueChanged = DBLookupComboboxEhCustAccKeyValueChanged
      end
      object DBEditEh1: TDBEditEh
        Left = 283
        Top = 14
        Width = 140
        Height = 21
        TabStop = False
        DataField = 'REST'
        DataSource = PaymentDataModule.DataSrcPaymentAccounts
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 39
    Width = 433
    Height = 271
    Align = alTop
    AutoSize = True
    BevelInner = bvLowered
    TabOrder = 1
    object GroupBox5: TGroupBox
      Left = 2
      Top = 2
      Width = 429
      Height = 56
      Align = alTop
      Caption = #1071#1089#1072#1089' '#1073#1086#1088#1078
      TabOrder = 0
      object Panel4: TPanel
        Left = 2
        Top = 15
        Width = 173
        Height = 39
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object StaticText2: TStaticText
          Left = 2
          Top = 2
          Width = 169
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1065#1077#1089#1072#1073#1099#1085' '#8470
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEditEh3: TDBEditEh
          Left = 0
          Top = 17
          Width = 172
          Height = 21
          TabStop = False
          Alignment = taLeftJustify
          Color = clInfoBk
          DataField = 'ACC_NO'
          DataSource = PaymentDataModule.DSLoanRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel5: TPanel
        Left = 175
        Top = 15
        Width = 114
        Height = 39
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object StaticText3: TStaticText
          Left = 2
          Top = 2
          Width = 110
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1043#1072#1083#1099#1075
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEditEh4: TDBEditEh
          Left = 0
          Top = 17
          Width = 113
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clSilver
          DataField = 'REST'
          DataSource = PaymentDataModule.DSLoanRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel6: TPanel
        Left = 289
        Top = 15
        Width = 134
        Height = 39
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object StaticText4: TStaticText
          Left = 2
          Top = 2
          Width = 130
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1070#1076#1103#1085#1080#1083#1103#1078#1103#1082' '#1084#1103#1073#1083#1103#1100
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object MainAmtEdit: TCMCurrencyEdit
          Tag = 1
          Left = 1
          Top = 17
          Width = 132
          Height = 21
          TabOrder = 1
          Text = '0'
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 58
      Width = 429
      Height = 52
      Align = alTop
      Caption = #1060#1072#1080#1079' '#1073#1086#1088#1078#1091
      TabOrder = 1
      object Panel3: TPanel
        Left = 2
        Top = 15
        Width = 173
        Height = 35
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object StaticText1: TStaticText
          Left = 2
          Top = 2
          Width = 169
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1065#1077#1089#1072#1073#1099#1085' '#8470
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEditEh2: TDBEditEh
          Left = 0
          Top = 17
          Width = 172
          Height = 21
          TabStop = False
          Alignment = taLeftJustify
          Color = clInfoBk
          DataField = 'ACC_NO'
          DataSource = PaymentDataModule.DSIntRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel7: TPanel
        Left = 175
        Top = 15
        Width = 114
        Height = 35
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object StaticText5: TStaticText
          Left = 2
          Top = 2
          Width = 110
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1043#1072#1083#1099#1075
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEditEh5: TDBEditEh
          Left = 0
          Top = 17
          Width = 113
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clSilver
          DataField = 'INTERESTREST'
          DataSource = PaymentDataModule.DSIntRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel8: TPanel
        Left = 289
        Top = 15
        Width = 134
        Height = 35
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object StaticText6: TStaticText
          Left = 2
          Top = 2
          Width = 130
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1070#1076#1103#1085#1080#1083#1103#1078#1103#1082' '#1084#1103#1073#1083#1103#1100
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object IntAmtEdit: TCMCurrencyEdit
          Tag = 1
          Left = 1
          Top = 17
          Width = 132
          Height = 21
          TabOrder = 1
          Text = '0'
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 2
      Top = 110
      Width = 429
      Height = 52
      Align = alTop
      Caption = #1069#1077#1078#1080#1082#1084#1080#1096' '#1103#1089#1072#1089' '#1073#1086#1088#1078
      TabOrder = 2
      object Panel9: TPanel
        Left = 2
        Top = 15
        Width = 173
        Height = 35
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object StaticText7: TStaticText
          Left = 2
          Top = 2
          Width = 169
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1065#1077#1089#1072#1073#1099#1085' '#8470
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEditEh6: TDBEditEh
          Left = 0
          Top = 17
          Width = 172
          Height = 21
          TabStop = False
          Alignment = taLeftJustify
          Color = clInfoBk
          DataField = 'ACC_NO'
          DataSource = PaymentDataModule.DSDueRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel10: TPanel
        Left = 175
        Top = 15
        Width = 114
        Height = 35
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object StaticText8: TStaticText
          Left = 2
          Top = 2
          Width = 110
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1043#1072#1083#1099#1075
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEditEh7: TDBEditEh
          Left = 0
          Top = 17
          Width = 113
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clSilver
          DataField = 'DUEREST'
          DataSource = PaymentDataModule.DSDueRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel11: TPanel
        Left = 289
        Top = 15
        Width = 134
        Height = 35
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object StaticText9: TStaticText
          Left = 2
          Top = 2
          Width = 130
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1070#1076#1103#1085#1080#1083#1103#1078#1103#1082' '#1084#1103#1073#1083#1103#1100
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DueAmtEdit: TCMCurrencyEdit
          Tag = 1
          Left = 1
          Top = 17
          Width = 132
          Height = 21
          TabOrder = 1
          Text = '0'
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 2
      Top = 214
      Width = 429
      Height = 55
      Align = alTop
      Caption = #1055#1077#1085#1080#1081#1072
      TabOrder = 3
      object Panel12: TPanel
        Left = 2
        Top = 15
        Width = 173
        Height = 38
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object StaticText10: TStaticText
          Left = 2
          Top = 2
          Width = 169
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1065#1077#1089#1072#1073#1099#1085' '#8470
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEditEh8: TDBEditEh
          Left = 0
          Top = 17
          Width = 172
          Height = 21
          TabStop = False
          Alignment = taLeftJustify
          Color = clInfoBk
          DataField = 'PENALTYACCNO'
          DataSource = PaymentDataModule.DSLoanRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel13: TPanel
        Left = 175
        Top = 15
        Width = 114
        Height = 38
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object StaticText11: TStaticText
          Left = 2
          Top = 2
          Width = 110
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1043#1072#1083#1099#1075
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEditEh9: TDBEditEh
          Left = 0
          Top = 17
          Width = 113
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clSilver
          DataField = 'PENALTYREST'
          DataSource = PaymentDataModule.DSLoanRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel14: TPanel
        Left = 289
        Top = 15
        Width = 134
        Height = 38
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object StaticText12: TStaticText
          Left = 2
          Top = 2
          Width = 130
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1070#1076#1103#1085#1080#1083#1103#1078#1103#1082' '#1084#1103#1073#1083#1103#1100
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object PenaltyAmtEdit: TCMCurrencyEdit
          Tag = 1
          Left = 1
          Top = 17
          Width = 132
          Height = 21
          TabOrder = 1
          Text = '0'
        end
      end
    end
    object GroupBox6: TGroupBox
      Left = 2
      Top = 162
      Width = 429
      Height = 52
      Align = alTop
      Caption = #1069#1077#1078#1080#1082#1084#1080#1096' '#1092#1072#1080#1079' '#1073#1086#1088#1078#1091
      TabOrder = 4
      object Panel15: TPanel
        Left = 2
        Top = 15
        Width = 173
        Height = 35
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object StaticText13: TStaticText
          Left = 2
          Top = 2
          Width = 169
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1065#1077#1089#1072#1073#1099#1085' '#8470
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEditEh10: TDBEditEh
          Left = 0
          Top = 17
          Width = 172
          Height = 21
          TabStop = False
          Alignment = taLeftJustify
          Color = clInfoBk
          DataField = 'ACC_NO'
          DataSource = PaymentDataModule.DSDueIntRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel16: TPanel
        Left = 175
        Top = 15
        Width = 114
        Height = 35
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object StaticText14: TStaticText
          Left = 2
          Top = 2
          Width = 110
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1043#1072#1083#1099#1075
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEditEh11: TDBEditEh
          Left = 0
          Top = 17
          Width = 113
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clSilver
          DataField = 'DUEINTERESTREST'
          DataSource = PaymentDataModule.DSDueIntRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel17: TPanel
        Left = 289
        Top = 15
        Width = 134
        Height = 35
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object StaticText15: TStaticText
          Left = 2
          Top = 2
          Width = 130
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1070#1076#1103#1085#1080#1083#1103#1078#1103#1082' '#1084#1103#1073#1083#1103#1100
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DueIntAmtEdit: TCMCurrencyEdit
          Tag = 1
          Left = 1
          Top = 17
          Width = 132
          Height = 21
          TabOrder = 1
          Text = '0'
        end
      end
    end
  end
  object Button1: TButton
    Left = 277
    Top = 411
    Width = 75
    Height = 25
    Action = ActnAccept
    TabOrder = 2
  end
  object Button2: TButton
    Left = 357
    Top = 411
    Width = 75
    Height = 25
    Action = ActnClose
    TabOrder = 3
  end
  object Panel20: TPanel
    Left = 0
    Top = 365
    Width = 433
    Height = 45
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object Panel19: TPanel
      Left = 288
      Top = 2
      Width = 143
      Height = 41
      Align = alRight
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object StaticText17: TStaticText
        Left = 2
        Top = 2
        Width = 139
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = #1046#1103#1084#1080' '#1070#1076#1103#1085#1080#1083#1103#1078#1103#1082' '#1084#1103#1073#1083#1103#1100
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object FullPayAmt: TCMCurrencyEdit
        Tag = 1
        Left = 4
        Top = 17
        Width = 137
        Height = 21
        TabOrder = 1
        Text = '0'
        OnKeyPress = FullPayAmtKeyPress
      end
    end
    object Panel18: TPanel
      Left = 174
      Top = 2
      Width = 114
      Height = 41
      Align = alRight
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object StaticText16: TStaticText
        Left = 2
        Top = 2
        Width = 110
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = #1069#1077#1078'. '#1101#1094#1085#1083#1103#1088#1080#1085' '#1089#1072#1081#1099
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object ExpdateCount: TCMCurrencyEdit
        Tag = 1
        Left = 2
        Top = 17
        Width = 110
        Height = 21
        TabOrder = 1
        Text = '0'
      end
    end
    object CBFullPay: TCheckBox
      Left = 6
      Top = 5
      Width = 115
      Height = 14
      Caption = #1058#1072#1084' '#1102#1076#1103#1085#1080#1096
      TabOrder = 2
      OnClick = CBFullPayClick
    end
    object ChBchangePlandat: TCheckBox
      Left = 5
      Top = 22
      Width = 156
      Height = 17
      Caption = #1055#1083#1072#1085#1076#1072' '#1102#1076#1103#1085#1080#1096' '#1090#1072#1088#1080#1093#1080#1085#1080' '#1076#1103#1081#1080#1096
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 3
    end
  end
  object GroupBox7: TGroupBox
    Left = 0
    Top = 310
    Width = 433
    Height = 55
    Align = alTop
    Caption = #1041#1072#1083#1072#1085#1089#1076#1072#1085' '#1082#1103#1085#1072#1088' '#1092#1072#1080#1079' '#1073#1086#1088#1078#1091
    TabOrder = 5
    object Panel21: TPanel
      Left = 2
      Top = 15
      Width = 173
      Height = 38
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object StaticText18: TStaticText
        Left = 2
        Top = 2
        Width = 169
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = #1065#1077#1089#1072#1073#1099#1085' '#8470
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object DBEditEh12: TDBEditEh
        Left = 0
        Top = 17
        Width = 172
        Height = 21
        TabStop = False
        Alignment = taLeftJustify
        Color = clInfoBk
        DataField = 'BKACC_NO'
        DataSource = PaymentDataModule.DSIntRest
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
    end
    object Panel22: TPanel
      Left = 175
      Top = 15
      Width = 116
      Height = 38
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object StaticText19: TStaticText
        Left = 2
        Top = 2
        Width = 112
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = #1043#1072#1083#1099#1075
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object DBEditEh13: TDBEditEh
        Left = 0
        Top = 17
        Width = 113
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clSilver
        DataField = 'BKINTERESTREST'
        DataSource = PaymentDataModule.DSIntRest
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
    end
    object Panel23: TPanel
      Left = 291
      Top = 15
      Width = 138
      Height = 38
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object StaticText20: TStaticText
        Left = 2
        Top = 2
        Width = 134
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = #1070#1076#1103#1085#1080#1083#1103#1078#1103#1082' '#1084#1103#1073#1083#1103#1100
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object CMCurrencyEdit1: TCMCurrencyEdit
        Tag = 1
        Left = 1
        Top = 17
        Width = 133
        Height = 21
        TabOrder = 1
        Text = '0'
      end
    end
  end
  object ActionList1: TActionList
    Left = 160
    Top = 144
    object ActnAccept: TAction
      Caption = '&'#1043#1103#1073#1091#1083
      OnExecute = ActnAcceptExecute
      OnUpdate = ActnAcceptUpdate
    end
    object ActnClose: TAction
      Caption = '&'#1048#1084#1090#1080#1085#1072
      OnExecute = ActnCloseExecute
    end
  end
end
