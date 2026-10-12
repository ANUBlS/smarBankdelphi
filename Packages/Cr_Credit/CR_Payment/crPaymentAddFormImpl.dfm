object PaymentAddForm: TPaymentAddForm
  Left = 357
  Top = 167
  ActiveControl = DBLookupComboboxEhCustAcc
  BorderIcons = [biSystemMenu]
  Caption = 'PaymentAddForm'
  ClientHeight = 414
  ClientWidth = 461
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
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
    Width = 461
    Height = 42
    Align = alTop
    AutoSize = True
    TabOrder = 0
    ExplicitWidth = 433
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 459
      Height = 40
      Align = alBottom
      Caption = #214'd'#601'm'#601' hesab'#305
      TabOrder = 0
      ExplicitWidth = 431
      object Label1: TLabel
        Left = 244
        Top = 18
        Width = 35
        Height = 15
        Caption = 'Qal'#305#287#305':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 18
        Top = 16
        Width = 17
        Height = 18
        Caption = #8470
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBLookupComboboxEhCustAcc: TDBLookupComboboxEh
        Left = 43
        Top = 15
        Width = 195
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ACCID'
        ListField = 'ACCOUNTNUMBER'
        ListSource = PaymentDataModuleCr.DataSrcPaymentAccounts
        TabOrder = 0
        Visible = True
        OnKeyValueChanged = DBLookupComboboxEhCustAccKeyValueChanged
      end
      object DBEditEh1: TDBEditEh
        Left = 305
        Top = 15
        Width = 151
        Height = 21
        TabStop = False
        DataField = 'REST'
        DataSource = PaymentDataModuleCr.DataSrcPaymentAccounts
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 42
    Width = 461
    Height = 292
    Align = alTop
    AutoSize = True
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitWidth = 433
    object GroupBox5: TGroupBox
      Left = 2
      Top = 2
      Width = 457
      Height = 60
      Align = alTop
      Caption = #399'sas borc'
      TabOrder = 0
      ExplicitTop = 1
      ExplicitWidth = 459
      object Panel4: TPanel
        Left = 2
        Top = 15
        Width = 186
        Height = 43
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        ExplicitTop = 16
        ExplicitHeight = 42
        object StaticText2: TStaticText
          Left = 2
          Top = 2
          Width = 182
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = 'Hesab'#305'n '#8470
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 67
        end
        object DBEditEh3: TDBEditEh
          Left = 0
          Top = 18
          Width = 185
          Height = 21
          TabStop = False
          Alignment = taLeftJustify
          Color = clInfoBk
          DataField = 'ACC_NO'
          DataSource = PaymentDataModuleCr.DSLoanRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel5: TPanel
        Left = 188
        Top = 15
        Width = 123
        Height = 43
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        ExplicitTop = 16
        ExplicitHeight = 42
        object StaticText3: TStaticText
          Left = 2
          Top = 2
          Width = 119
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = 'Qal'#601'q'
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 37
        end
        object DBEditEh4: TDBEditEh
          Left = 0
          Top = 18
          Width = 122
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clSilver
          DataField = 'REST'
          DataSource = PaymentDataModuleCr.DSLoanRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel6: TPanel
        Left = 311
        Top = 15
        Width = 145
        Height = 43
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object StaticText4: TStaticText
          Left = 2
          Top = 2
          Width = 141
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = #214'd'#601'nil'#601'c'#601'k m'#601'bl'#601#287
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 111
        end
        object MainAmtEdit: TCMCurrencyEdit
          Tag = 1
          Left = 1
          Top = 18
          Width = 142
          Height = 21
          TabOrder = 1
          Text = '0'
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 62
      Width = 457
      Height = 56
      Align = alTop
      Caption = 'Faiz borcu'
      TabOrder = 1
      ExplicitWidth = 429
      object Panel3: TPanel
        Left = 2
        Top = 15
        Width = 186
        Height = 39
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        ExplicitTop = 16
        ExplicitHeight = 38
        object StaticText1: TStaticText
          Left = 2
          Top = 2
          Width = 182
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = 'Hesab'#305'n '#8470
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 67
        end
        object DBEditEh2: TDBEditEh
          Left = 0
          Top = 18
          Width = 185
          Height = 21
          TabStop = False
          Alignment = taLeftJustify
          Color = clInfoBk
          DataField = 'ACC_NO'
          DataSource = PaymentDataModuleCr.DSIntRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel7: TPanel
        Left = 188
        Top = 15
        Width = 123
        Height = 39
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        ExplicitTop = 16
        ExplicitHeight = 38
        object StaticText5: TStaticText
          Left = 2
          Top = 2
          Width = 119
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = 'Qal'#601'q'
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 37
        end
        object DBEditEh5: TDBEditEh
          Left = 0
          Top = 18
          Width = 122
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clSilver
          DataField = 'INTERESTREST'
          DataSource = PaymentDataModuleCr.DSIntRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel8: TPanel
        Left = 311
        Top = 15
        Width = 145
        Height = 39
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object StaticText6: TStaticText
          Left = 2
          Top = 2
          Width = 141
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = #214'd'#601'nil'#601'c'#601'k m'#601'bl'#601#287
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 111
        end
        object IntAmtEdit: TCMCurrencyEdit
          Tag = 1
          Left = 1
          Top = 18
          Width = 142
          Height = 21
          TabOrder = 1
          Text = '0'
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 2
      Top = 118
      Width = 457
      Height = 56
      Align = alTop
      Caption = 'Gecikmi'#351' '#601'sas borc'
      TabOrder = 2
      ExplicitWidth = 429
      object Panel9: TPanel
        Left = 2
        Top = 15
        Width = 186
        Height = 39
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        ExplicitTop = 16
        ExplicitHeight = 38
        object StaticText7: TStaticText
          Left = 2
          Top = 2
          Width = 182
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = 'Hesab'#305'n '#8470
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 67
        end
        object DBEditEh6: TDBEditEh
          Left = 0
          Top = 18
          Width = 185
          Height = 21
          TabStop = False
          Alignment = taLeftJustify
          Color = clInfoBk
          DataField = 'ACC_NO'
          DataSource = PaymentDataModuleCr.DSDueRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel10: TPanel
        Left = 188
        Top = 15
        Width = 123
        Height = 39
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        ExplicitTop = 16
        ExplicitHeight = 38
        object StaticText8: TStaticText
          Left = 2
          Top = 2
          Width = 119
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = 'Qal'#601'q'
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 37
        end
        object DBEditEh7: TDBEditEh
          Left = 0
          Top = 18
          Width = 122
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clSilver
          DataField = 'DUEREST'
          DataSource = PaymentDataModuleCr.DSDueRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel11: TPanel
        Left = 311
        Top = 15
        Width = 145
        Height = 39
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object StaticText9: TStaticText
          Left = 2
          Top = 2
          Width = 141
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = #214'd'#601'nil'#601'c'#601'k m'#601'bl'#601#287
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 111
        end
        object DueAmtEdit: TCMCurrencyEdit
          Tag = 1
          Left = 1
          Top = 18
          Width = 142
          Height = 21
          TabOrder = 1
          Text = '0'
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 2
      Top = 230
      Width = 457
      Height = 60
      Align = alTop
      Caption = 'Peniya'
      TabOrder = 3
      ExplicitWidth = 429
      object Panel12: TPanel
        Left = 2
        Top = 15
        Width = 186
        Height = 43
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        ExplicitTop = 16
        ExplicitHeight = 42
        object StaticText10: TStaticText
          Left = 2
          Top = 2
          Width = 182
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = 'Hesab'#305'n '#8470
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 67
        end
        object DBEditEh8: TDBEditEh
          Left = 0
          Top = 18
          Width = 185
          Height = 21
          TabStop = False
          Alignment = taLeftJustify
          Color = clInfoBk
          DataField = 'PENALTYACCNO'
          DataSource = PaymentDataModuleCr.DSLoanRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel13: TPanel
        Left = 188
        Top = 15
        Width = 123
        Height = 43
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        ExplicitTop = 16
        ExplicitHeight = 42
        object StaticText11: TStaticText
          Left = 2
          Top = 2
          Width = 119
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = 'Qal'#601'q'
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 37
        end
        object DBEditEh9: TDBEditEh
          Left = 0
          Top = 18
          Width = 122
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clSilver
          DataField = 'PENALTYREST'
          DataSource = PaymentDataModuleCr.DSLoanRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel14: TPanel
        Left = 311
        Top = 15
        Width = 145
        Height = 43
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object StaticText12: TStaticText
          Left = 2
          Top = 2
          Width = 141
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = #214'd'#601'nil'#601'c'#601'k m'#601'bl'#601#287
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 111
        end
        object PenaltyAmtEdit: TCMCurrencyEdit
          Tag = 1
          Left = 1
          Top = 18
          Width = 142
          Height = 21
          TabOrder = 1
          Text = '0'
        end
      end
    end
    object GroupBox6: TGroupBox
      Left = 2
      Top = 174
      Width = 457
      Height = 56
      Align = alTop
      Caption = 'Gecikmi'#351' faiz borcu'
      TabOrder = 4
      ExplicitWidth = 429
      object Panel15: TPanel
        Left = 2
        Top = 15
        Width = 186
        Height = 39
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        ExplicitTop = 16
        ExplicitHeight = 38
        object StaticText13: TStaticText
          Left = 2
          Top = 2
          Width = 182
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = 'Hesab'#305'n '#8470
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 67
        end
        object DBEditEh10: TDBEditEh
          Left = 0
          Top = 18
          Width = 185
          Height = 21
          TabStop = False
          Alignment = taLeftJustify
          Color = clInfoBk
          DataField = 'ACC_NO'
          DataSource = PaymentDataModuleCr.DSDueIntRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel16: TPanel
        Left = 188
        Top = 15
        Width = 123
        Height = 39
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        ExplicitTop = 16
        ExplicitHeight = 38
        object StaticText14: TStaticText
          Left = 2
          Top = 2
          Width = 119
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = 'Qal'#601'q'
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 37
        end
        object DBEditEh11: TDBEditEh
          Left = 0
          Top = 18
          Width = 122
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clSilver
          DataField = 'DUEINTERESTREST'
          DataSource = PaymentDataModuleCr.DSDueIntRest
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
      end
      object Panel17: TPanel
        Left = 311
        Top = 15
        Width = 145
        Height = 39
        Align = alLeft
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object StaticText15: TStaticText
          Left = 2
          Top = 2
          Width = 141
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = #214'd'#601'nil'#601'c'#601'k m'#601'bl'#601#287
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 111
        end
        object DueIntAmtEdit: TCMCurrencyEdit
          Tag = 1
          Left = 1
          Top = 18
          Width = 142
          Height = 21
          TabOrder = 1
          Text = '0'
        end
      end
    end
  end
  object Button1: TButton
    Left = 292
    Top = 386
    Width = 81
    Height = 26
    Action = ActnAccept
    Caption = '&Q'#601'bul'
    TabOrder = 2
  end
  object Button2: TButton
    Left = 378
    Top = 386
    Width = 81
    Height = 26
    Action = ActnClose
    Caption = '&'#304'mtina'
    TabOrder = 3
  end
  object Panel20: TPanel
    Left = 0
    Top = 334
    Width = 461
    Height = 48
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object Panel19: TPanel
      Left = 315
      Top = 2
      Width = 144
      Height = 44
      Align = alRight
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object StaticText17: TStaticText
        Left = 2
        Top = 2
        Width = 140
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'C'#601'mi '#246'd'#601'nil'#601'c'#601'k m'#601'b'#601'l'#287
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 142
      end
      object FullPayAmt: TCMCurrencyEdit
        Tag = 1
        Left = 1
        Top = 18
        Width = 142
        Height = 21
        TabOrder = 1
        Text = '0'
      end
    end
    object Panel18: TPanel
      Left = 192
      Top = 2
      Width = 123
      Height = 44
      Align = alRight
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object StaticText16: TStaticText
        Left = 2
        Top = 2
        Width = 119
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Gec. g'#252'nl'#601'rin say'#305
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 102
      end
      object ExpdateCount: TCMCurrencyEdit
        Tag = 1
        Left = 2
        Top = 18
        Width = 119
        Height = 21
        TabOrder = 1
        Text = '0'
      end
    end
    object CBFullPay: TCheckBox
      Left = 6
      Top = 5
      Width = 124
      Height = 15
      Caption = 'Tam '#246'd'#601'ni'#351
      TabOrder = 2
      OnClick = CBFullPayClick
    end
    object ChBchangePlandat: TCheckBox
      Left = 6
      Top = 25
      Width = 168
      Height = 18
      Caption = 'Planda '#246'd'#601'ni'#351' tarixini d'#601'yi'#351
      Checked = True
      State = cbChecked
      TabOrder = 3
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
