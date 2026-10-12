object OutRepairEdit: TOutRepairEdit
  Left = 254
  Top = 125
  BorderStyle = bsDialog
  Caption = 'OutRepair'
  ClientHeight = 425
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object pnMain: TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 392
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object pnDebet: TPanel
      Left = 2
      Top = 37
      Width = 332
      Height = 130
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 6
        Width = 39
        Height = 15
        Caption = #1044#1045#1041#1045#1058
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Panel2: TPanel
        Left = 2
        Top = 22
        Width = 328
        Height = 105
        BevelInner = bvSpace
        BevelOuter = bvLowered
        TabOrder = 0
        object Label4: TLabel
          Left = 9
          Top = 9
          Width = 35
          Height = 14
          Caption = #1042'.'#1050#1086#1076#1091
        end
        object Label5: TLabel
          Left = 69
          Top = 9
          Width = 43
          Height = 14
          Caption = #1042#1072#1083#1081#1091#1090#1072
        end
        object Label8: TLabel
          Left = 239
          Top = 9
          Width = 43
          Height = 14
          Caption = #1052#1103#1079#1103#1085#1085#1103
        end
        object dblcCurDebet: TDBLookupComboBox
          Left = 66
          Top = 23
          Width = 168
          Height = 23
          Color = clBtnShadow
          DataField = 'DEBITCURRENCYID'
          DataSource = RepDataModule.Transaction
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          KeyField = 'VALUTE'
          ListField = 'VALU_NAME'
          ListSource = RepDataModule.CurDebet
          ParentFont = False
          TabOrder = 1
          TabStop = False
          OnCloseUp = dblcCurDebetCloseUp
        end
        object dlbcDebitAccNo: TDBLookupComboBox
          Left = 159
          Top = 50
          Width = 164
          Height = 23
          Color = clBtnShadow
          DataField = 'DEBITID'
          DataSource = RepDataModule.Transaction
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'ACC_NO'
          ListSource = RepDataModule.DebetAcc
          ParentFont = False
          TabOrder = 2
          TabStop = False
          OnCloseUp = dlbcDebitAccNoCloseUp
        end
        object dlbcDebitCustomer: TDBLookupComboBox
          Left = 5
          Top = 75
          Width = 318
          Height = 23
          Color = clBtnShadow
          DataField = 'DEBITID'
          DataSource = RepDataModule.Transaction
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = RepDataModule.DebetAcc
          ParentFont = False
          TabOrder = 3
          TabStop = False
          OnCloseUp = dlbcDebitCustomerCloseUp
        end
        object seCurrenIDDebet: TEdit
          Left = 6
          Top = 23
          Width = 56
          Height = 22
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          OnChange = seCurrenIDDebetChange
          OnExit = seCurrenIDDebetExit
        end
        object edDebitAccNo: TSearchEdit
          Left = 6
          Top = 50
          Width = 151
          Height = 22
          TabOrder = 4
          Text = 'edDebitAccNo'
          OnChange = edDebitAccNoChange
          DataSource = RepDataModule.DebetAcc
          SearchField = 'acc_no'
        end
        object ceDebetCurrency: TEdit
          Left = 237
          Top = 23
          Width = 81
          Height = 22
          TabOrder = 5
          OnChange = ceDebetCurrencyChange
        end
      end
    end
    object pnCredit: TPanel
      Left = 334
      Top = 37
      Width = 336
      Height = 130
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        336
        130)
      object Label3: TLabel
        Left = 8
        Top = 8
        Width = 42
        Height = 14
        Caption = #1050#1056#1045#1044#1048#1058
      end
      object Panel3: TPanel
        Left = 3
        Top = 22
        Width = 329
        Height = 105
        Anchors = [akLeft, akTop, akRight]
        BevelInner = bvSpace
        BevelOuter = bvLowered
        TabOrder = 0
        object Label6: TLabel
          Left = 9
          Top = 9
          Width = 35
          Height = 14
          Caption = #1042'.'#1050#1086#1076#1091
        end
        object Label7: TLabel
          Left = 69
          Top = 9
          Width = 43
          Height = 14
          Caption = #1042#1072#1083#1081#1091#1090#1072
        end
        object Label9: TLabel
          Left = 238
          Top = 9
          Width = 43
          Height = 14
          Caption = #1052#1103#1079#1103#1085#1085#1103
        end
        object dblcCurKredit: TDBLookupComboBox
          Left = 66
          Top = 23
          Width = 168
          Height = 23
          Color = clBtnShadow
          DataField = 'CREDITCURRENCYID'
          DataSource = RepDataModule.Transaction
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          KeyField = 'VALUTE'
          ListField = 'VALU_NAME'
          ListSource = RepDataModule.CurKredit
          ParentFont = False
          TabOrder = 2
          TabStop = False
          OnCloseUp = dblcCurKreditCloseUp
        end
        object dlbcKreditAccNo: TDBLookupComboBox
          Left = 160
          Top = 48
          Width = 161
          Height = 23
          Color = clBtnShadow
          DataField = 'CREDITID'
          DataSource = RepDataModule.Transaction
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'ACC_NO'
          ListSource = RepDataModule.CreditAcc
          ParentFont = False
          TabOrder = 3
          TabStop = False
          OnCloseUp = dlbcKreditAccNoCloseUp
        end
        object dlbcKreditCustomer: TDBLookupComboBox
          Left = 5
          Top = 74
          Width = 316
          Height = 22
          Color = clBtnShadow
          DataField = 'CREDITID'
          DataSource = RepDataModule.Transaction
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = RepDataModule.CreditAcc
          TabOrder = 4
          TabStop = False
          OnCloseUp = dlbcKreditCustomerCloseUp
        end
        object edKreditAccNo: TSearchEdit
          Left = 5
          Top = 50
          Width = 153
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = 'edKreditAccNo'
          OnChange = edKreditAccNoChange
          DataSource = RepDataModule.CreditAcc
          SearchField = 'acc_no'
        end
        object seCurrenIDKredit: TEdit
          Left = 6
          Top = 23
          Width = 56
          Height = 22
          TabOrder = 0
          OnChange = seCurrenIDKreditChange
          OnExit = seCurrenIDKreditExit
        end
        object ceKreditCurrency: TEdit
          Left = 237
          Top = 23
          Width = 80
          Height = 22
          TabOrder = 5
          OnChange = ceKreditCurrencyChange
        end
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 668
      Height = 35
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 9
        Top = 9
        Width = 128
        Height = 14
        Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085#1099#1085' '#1090#1072#1088#1080#1093#1080':'
      end
      object Bevel1: TBevel
        Left = 332
        Top = 2
        Width = 334
        Height = 31
        Align = alRight
        Shape = bsFrame
        ExplicitHeight = 30
      end
      object Bevel2: TBevel
        Left = 2
        Top = 2
        Width = 330
        Height = 31
        Align = alClient
        Shape = bsFrame
        ExplicitHeight = 30
      end
      object dtpRepairedit: TDateTimePicker
        Left = 112
        Top = 5
        Width = 130
        Height = 21
        Date = 37989.714998182900000000
        Time = 37989.714998182900000000
        TabOrder = 0
        OnChange = dtpRepaireditChange
      end
      object chProfit: TCheckBox
        Left = 526
        Top = 9
        Width = 130
        Height = 18
        Caption = #1069#1103#1083#1080#1088'-'#1047#1103#1088#1103#1088' '#1073#1072#1100#1083#1072#1085#1089#1099#1085
        TabOrder = 2
      end
      object chRate: TCheckBox
        Left = 351
        Top = 9
        Width = 165
        Height = 18
        Caption = #1052#1103#1079#1103#1085#1085#1103' '#1092#1103#1088#1075#1080' '#1097#1077#1089#1072#1073#1083#1072#1085#1089#1099#1085
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 167
      Width = 668
      Height = 97
      Align = alBottom
      Caption = #1052#1103#1073#1083#1103#1100
      TabOrder = 3
      object SpeedButton1: TSpeedButton
        Left = 5
        Top = 57
        Width = 138
        Height = 32
        Caption = #1044#1077#1073#1077#1090' '#1097#1077#1089#1072#1073#1099#1085#1099#1085' '#1075#1072#1083#1099#1075#1083#1072#1088#1099
        Flat = True
        Visible = False
      end
      object SpeedButton2: TSpeedButton
        Left = 522
        Top = 58
        Width = 138
        Height = 32
        Caption = #1050#1088#1077#1076#1080#1090' '#1097#1077#1089#1072#1073#1099#1085#1099#1085' '#1075#1072#1083#1099#1075#1083#1072#1088#1099
        Flat = True
        Visible = False
      end
      object Panel4: TPanel
        Left = 2
        Top = 17
        Width = 328
        Height = 36
        BevelInner = bvLowered
        TabOrder = 0
        object Label10: TLabel
          Left = 4
          Top = 10
          Width = 76
          Height = 14
          Caption = #1044#1077#1073#1077#1090' '#1084#1103#1073#1083#1103#1100':'
        end
        object ceDebetAmount: TCurrencyEdit
          Left = 95
          Top = 6
          Width = 225
          Height = 22
          TabOrder = 0
          Text = '0'
          OnChange = ceDebetAmountChange
        end
      end
      object Panel5: TPanel
        Left = 333
        Top = 17
        Width = 327
        Height = 36
        BevelInner = bvLowered
        TabOrder = 1
        object Label11: TLabel
          Left = 4
          Top = 10
          Width = 81
          Height = 14
          Caption = #1050#1088#1077#1076#1080#1090' '#1084#1103#1073#1083#1103#1100':'
        end
        object ceKreditAmount: TCurrencyEdit
          Left = 95
          Top = 6
          Width = 225
          Height = 22
          TabOrder = 0
          Text = '0'
          OnChange = ceKreditAmountChange
        end
      end
      object Panel7: TPanel
        Left = 146
        Top = 56
        Width = 372
        Height = 34
        BevelInner = bvLowered
        TabOrder = 2
        object Label12: TLabel
          Left = 3
          Top = 10
          Width = 93
          Height = 14
          Caption = #1052#1080#1083#1083#1080' '#1074#1072#1083#1081#1091#1090#1072#1076#1072':'
        end
        object ceLamount: TCurrencyEdit
          Left = 87
          Top = 6
          Width = 276
          Height = 22
          TabOrder = 0
          Text = '0'
          OnChange = ceLamountChange
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 264
      Width = 668
      Height = 76
      Align = alBottom
      Caption = #1052#1103#1083#1091#1084#1072#1090#1083#1072#1088
      TabOrder = 4
      object Label13: TLabel
        Left = 17
        Top = 22
        Width = 76
        Height = 14
        Caption = #1041#1072#1083#1072#1085#1089#1076#1072#1093#1080#1083#1080':'
      end
      object Label14: TLabel
        Left = 9
        Top = 45
        Width = 85
        Height = 14
        Caption = #1050#1086#1085#1074'. '#1090#1103#1081#1080#1085#1072#1090#1099':'
      end
      object dlbcBalance: TDBLookupComboBox
        Left = 146
        Top = 17
        Width = 516
        Height = 22
        Color = clBtnShadow
        DataField = 'INBALANCECHAR'
        DataSource = RepDataModule.Transaction
        KeyField = 'SYMBOL'
        ListField = 'NAME'
        ListSource = RepDataModule.InBalanceChar
        TabOrder = 0
        TabStop = False
        OnDropDown = dlbcBalanceDropDown
      end
      object dlbcConvertation: TDBLookupComboBox
        Left = 146
        Top = 43
        Width = 516
        Height = 22
        Color = clBtnShadow
        DataField = 'OUTBALANCECHAR'
        DataSource = RepDataModule.Transaction
        KeyField = 'ID'
        ListField = 'FULLPATH'
        ListSource = RepDataModule.OutBalanceChar
        TabOrder = 1
        TabStop = False
      end
      object seOutBalance: TDBEdit
        Left = 86
        Top = 43
        Width = 53
        Height = 22
        DataField = 'OUTBALANCECHAR'
        DataSource = RepDataModule.Transaction
        TabOrder = 3
      end
      object seInBalance: TDBEdit
        Left = 86
        Top = 17
        Width = 53
        Height = 22
        DataField = 'INBALANCECHAR'
        DataSource = RepDataModule.Transaction
        TabOrder = 2
        OnChange = seInBalanceChange
        OnExit = seInBalanceExit
      end
    end
    object GroupBox3: TGroupBox
      Left = 2
      Top = 340
      Width = 668
      Height = 50
      Align = alBottom
      Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085' '#1090#1103#1081#1080#1085#1085#1072#1090#1099
      TabOrder = 5
      object edDescription: TComboBox
        Left = 6
        Top = 17
        Width = 656
        Height = 22
        TabOrder = 0
        OnDropDown = edDescriptionDropDown
      end
    end
  end
  object pnActionButtonsPanel: TPanel
    Left = 0
    Top = 392
    Width = 672
    Height = 33
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      672
      33)
    object btClear: TBitBtn
      Left = 501
      Top = 3
      Width = 81
      Height = 26
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = '&'#1048#1084#1090#1080#1085#1072
      DoubleBuffered = True
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btClearClick
    end
    object btCancel: TBitBtn
      Left = 586
      Top = 3
      Width = 81
      Height = 26
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&'#1063#1099#1093#1099#1096
      DoubleBuffered = True
      ModalResult = 2
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 2
    end
    object ErrorBox: THintBox
      Left = 34
      Top = 5
      Width = 162
      Height = 20
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 3
      Visible = False
      HintStyle = hsAlert
      Timeout = 4000
      BeepOnMessage = True
    end
    object RepAnim: TAnimate
      Left = 9
      Top = 6
      Width = 16
      Height = 16
      Color = clBtnFace
      CommonAVI = aviFindComputer
      ParentColor = False
      StopFrame = 8
      Visible = False
    end
    object btSave: TBitBtn
      Left = 416
      Top = 3
      Width = 80
      Height = 26
      Cursor = crHandPoint
      Caption = '&'#1049#1072#1076#1076#1072#1096#1072' '#1081#1072#1079
      DoubleBuffered = True
      ModalResult = 1
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btSaveClick
    end
  end
end
