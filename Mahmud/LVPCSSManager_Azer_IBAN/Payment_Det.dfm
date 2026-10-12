object PaymentDetalsForm: TPaymentDetalsForm
  Left = 358
  Top = 164
  Caption = 'Payment Detals'
  ClientHeight = 516
  ClientWidth = 717
  Color = clBtnFace
  Constraints.MinHeight = 530
  Constraints.MinWidth = 691
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
  OnKeyUp = FormKeyUp
  DesignSize = (
    717
    516)
  PixelsPerInch = 96
  TextHeight = 14
  object AccountGB: TGroupBox
    Left = 0
    Top = 0
    Width = 717
    Height = 480
    Align = alTop
    Caption = #1050#1102#1095#1094#1088#1084#1103' '#1103#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085#1072' '#1103#1083#1072#1074#1103
    TabOrder = 0
    ExplicitLeft = 112
    ExplicitTop = 16
    object Panel1: TPanel
      Left = 2
      Top = 16
      Width = 713
      Height = 339
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 0
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 338
        Height = 337
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = -5
        ExplicitTop = -4
        object GroupBox3: TGroupBox
          Left = 0
          Top = 180
          Width = 338
          Height = 125
          Align = alTop
          Caption = #1070#1076#1103#1085#1080#1096' '#1058#1072#1087#1096#1099#1088#1099#1100#1099
          TabOrder = 1
          ExplicitLeft = -4
          ExplicitTop = 186
          object P13: TPanel
            Left = 2
            Top = 16
            Width = 334
            Height = 27
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' '#1043#1077#1081#1076#1080#1081#1081#1072#1090' '#8470':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 3
            ExplicitTop = 14
            object SpeedButton2: TSpeedButton
              Left = 305
              Top = 4
              Width = 25
              Height = 20
              Caption = '...'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Azl Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = SpeedButton2Click
            end
            object Edit_Referens: TEdit
              Left = 107
              Top = 2
              Width = 196
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier'
              Font.Style = []
              MaxLength = 16
              ParentFont = False
              TabOrder = 0
              OnChange = Edit_ReferensChange
              OnKeyPress = Edit_ReferensKeyPress
            end
          end
          object P14: TPanel
            Left = 2
            Top = 43
            Width = 334
            Height = 27
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' '#1042#1072#1083#1081#1091#1090#1072':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object Combo_Valute: TComboBox
              Left = 107
              Top = 2
              Width = 224
              Height = 23
              Style = csDropDownList
              Color = clSilver
              Enabled = False
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
            end
            object Valute_ID: TListBox
              Left = 108
              Top = 4
              Width = 36
              Height = 19
              ItemHeight = 15
              TabOrder = 1
              Visible = False
            end
          end
          object P16: TPanel
            Left = 2
            Top = 97
            Width = 334
            Height = 27
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' '#1070#1076#1103#1085#1080#1096' '#1085#1102#1074'. '#1082#1086#1076#1091':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object SpeedButton1: TSpeedButton
              Left = 305
              Top = 4
              Width = 25
              Height = 20
              Caption = '...'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Azl Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = SpeedButton1Click
            end
            object Edit_TransCode: TEdit
              Left = 107
              Top = 1
              Width = 58
              Height = 21
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier'
              Font.Style = []
              MaxLength = 3
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P15: TPanel
            Left = 2
            Top = 70
            Width = 334
            Height = 27
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' '#1052#1103#1073#1083#1103#1100':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object Edit_Amount1: TEdit
              Left = 107
              Top = 1
              Width = 225
              Height = 21
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier'
              Font.Style = []
              MaxLength = 15
              ParentFont = False
              TabOrder = 0
              Visible = False
              OnKeyPress = Edit_Amount1KeyPress
            end
            object Edit_amount: TCurrencyEdit
              Left = 106
              Top = 1
              Width = 225
              Height = 23
              Color = clWhite
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = 4194304
              Font.Height = -12
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              MaxLength = 15
              ParentFont = False
              TabOrder = 1
              Text = '0'
              OnChange = Edit_BankName_SelfChange
              OnEnter = Edit_amountEnter
              OnExit = Edit_amountExit
            end
          end
        end
        object GroupBox4: TGroupBox
          Left = 0
          Top = 0
          Width = 338
          Height = 180
          Align = alTop
          Caption = #1070#1076#1103#1081#1103#1085' '#1041#1072#1085#1082
          TabOrder = 0
          ExplicitLeft = 6
          ExplicitTop = 22
          object P2: TPanel
            Left = 2
            Top = 43
            Width = 334
            Height = 27
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' '#1041#1072#1085#1082#1099#1085' '#1082#1086#1076#1091':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object Edit_BankCode_Self: TEdit
              Left = 107
              Top = 2
              Width = 225
              Height = 21
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P3: TPanel
            Left = 2
            Top = 70
            Width = 334
            Height = 27
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' '#1041#1072#1085#1082#1099#1085' '#1084#1094#1093'.'#1097#1077#1089'.:'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object Edit_account_Self: TEdit
              Left = 107
              Top = 2
              Width = 225
              Height = 21
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P4: TPanel
            Left = 2
            Top = 97
            Width = 334
            Height = 27
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' '#1042#1070#1045#1053':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object Edit_Voen_Self: TEdit
              Left = 107
              Top = 2
              Width = 225
              Height = 21
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P5: TPanel
            Left = 2
            Top = 124
            Width = 334
            Height = 27
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' '#1052#1094#1093#1073#1080#1088' '#1089#1091#1073' '#1097#1077#1089#1072#1073':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            object Edit_account_sub_Self: TEdit
              Left = 107
              Top = 2
              Width = 225
              Height = 21
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
              OnKeyPress = Edit_account_sub_SelfKeyPress
            end
          end
          object P6: TPanel
            Left = 2
            Top = 151
            Width = 334
            Height = 27
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' S.W.F.I.T. '#1041#1080#1082':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            object Edit_BIK_Self: TEdit
              Left = 107
              Top = 2
              Width = 225
              Height = 21
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P1: TPanel
            Left = 2
            Top = 16
            Width = 334
            Height = 27
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' '#1041#1072#1085#1082#1099#1085' '#1072#1076#1099':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 1
            ExplicitTop = 5
            object Edit_BankName_Self: TEdit
              Left = 107
              Top = 2
              Width = 225
              Height = 24
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
            end
          end
        end
        object Button1: TButton
          Left = 43
          Top = 308
          Width = 105
          Height = 27
          Caption = 'Yadda saxla'
          Enabled = False
          TabOrder = 2
          OnClick = Button1Click
        end
        object Button5: TButton
          Left = 172
          Top = 308
          Width = 116
          Height = 27
          Caption = #1049#1094#1082#1083#1103
          TabOrder = 3
          OnClick = Button5Click
        end
      end
      object Panel3: TPanel
        Left = 339
        Top = 1
        Width = 373
        Height = 337
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object GroupBox1: TGroupBox
          Left = 0
          Top = 208
          Width = 373
          Height = 129
          Align = alClient
          Caption = #1040#1083#1072#1085' '#1084#1094#1096#1090#1103#1088#1080
          TabOrder = 1
          object P18: TPanel
            Left = 2
            Top = 43
            Width = 369
            Height = 26
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' '#1040#1076#1099':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object Edit_Client_Name: TEdit
              Left = 107
              Top = 2
              Width = 256
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 35
              ParentFont = False
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
              OnKeyPress = Edit_ReferensKeyPress
            end
          end
          object P19: TPanel
            Left = 2
            Top = 69
            Width = 369
            Height = 28
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' '#1050#1086#1076#1091':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object Edit_Client_Code: TEdit
              Left = 107
              Top = 2
              Width = 256
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 35
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
              OnKeyPress = Edit_ReferensKeyPress
            end
          end
          object P17: TPanel
            Left = 2
            Top = 16
            Width = 369
            Height = 27
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' '#1065#1077#1089#1072#1073' '#8470':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Edit_Client_acc_no: TEdit
              Left = 107
              Top = 2
              Width = 256
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier'
              Font.Style = []
              MaxLength = 34
              ParentFont = False
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
              OnKeyPress = Edit_ReferensKeyPress
            end
            object DBComboBox_Institution: TDBLookupComboBox
              Left = 107
              Top = 2
              Width = 256
              Height = 23
              KeyField = 'ID'
              ListField = 'DESCRIPTION'
              ListSource = DataMod.DS_Institution
              TabOrder = 1
              Visible = False
            end
          end
          object P20: TPanel
            Left = 2
            Top = 97
            Width = 369
            Height = 27
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' '#1042#1070#1045#1053':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object Edit_Client_Voen: TEdit
              Left = 107
              Top = 2
              Width = 256
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8404992
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 35
              ParentFont = False
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
              OnKeyPress = Edit_ReferensKeyPress
            end
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 373
          Height = 208
          Align = alTop
          Caption = #1040#1083#1072#1085' '#1041#1072#1085#1082
          TabOrder = 0
          ExplicitLeft = 16
          ExplicitTop = 126
          object P7: TPanel
            Left = 2
            Top = 43
            Width = 369
            Height = 26
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' '#1041#1072#1085#1082#1099#1085' '#1072#1076#1099':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object Combo_BankName: TComboBox
              Left = 106
              Top = 2
              Width = 256
              Height = 23
              Color = clWhite
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = Combo_BankNameChange
              OnKeyPress = Combo_BankNameKeyPress
            end
            object Bank_ID: TListBox
              Left = 108
              Top = 4
              Width = 40
              Height = 19
              ItemHeight = 15
              TabOrder = 1
              Visible = False
            end
          end
          object P12: TPanel
            Left = 2
            Top = 177
            Width = 369
            Height = 28
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' S.W.F.I.T. '#1041#1080#1082':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            object Edit_Bik: TEdit
              Left = 106
              Top = 2
              Width = 256
              Height = 24
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P11: TPanel
            Left = 2
            Top = 150
            Width = 369
            Height = 27
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' '#1052#1094#1093#1073#1080#1088' '#1089#1091#1073' '#1097#1077#1089#1072#1073':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            object Edit_Account_Sub: TEdit
              Left = 106
              Top = 2
              Width = 256
              Height = 21
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier'
              Font.Style = []
              MaxLength = 13
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
              OnKeyPress = Edit_account_sub_SelfKeyPress
            end
          end
          object P8: TPanel
            Left = 2
            Top = 69
            Width = 369
            Height = 27
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' '#1041#1072#1085#1082#1099#1085' '#1082#1086#1076#1091':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            object Edit_BankCode: TEdit
              Left = 106
              Top = 2
              Width = 256
              Height = 21
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P9: TPanel
            Left = 2
            Top = 96
            Width = 369
            Height = 27
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' '#1041#1072#1085#1082#1099#1085' '#1084#1094#1093'.'#1097#1077#1089'.:'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object Edit_account: TEdit
              Left = 106
              Top = 2
              Width = 256
              Height = 21
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P10: TPanel
            Left = 2
            Top = 123
            Width = 369
            Height = 27
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' '#1042#1070#1045#1053':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            object Edit_Voen: TEdit
              Left = 106
              Top = 2
              Width = 256
              Height = 21
              CharCase = ecUpperCase
              Color = clSilver
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = Edit_BankName_SelfChange
            end
          end
          object P21: TPanel
            Left = 2
            Top = 16
            Width = 369
            Height = 27
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = ' '#1041#1072#1085#1082#1099#1085' '#1082#1086#1076#1091':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = -14
            ExplicitTop = 14
          end
        end
      end
    end
    object GroupBox5: TGroupBox
      Left = 2
      Top = 355
      Width = 339
      Height = 123
      Align = alLeft
      Caption = #1070#1076#1103#1085#1080#1096#1080#1085' '#1090#1103#1081#1080#1085#1072#1090#1099' '#1074#1103' '#1103#1089#1072#1089#1099
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 3
      object Edit_tey1: TEdit
        Left = 3
        Top = 17
        Width = 328
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier'
        Font.Style = []
        MaxLength = 35
        ParentFont = False
        TabOrder = 0
        OnChange = Edit_BankName_SelfChange
        OnKeyPress = Edit_ReferensKeyPress
      end
      object Edit_tey2: TEdit
        Left = 5
        Top = 44
        Width = 328
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier'
        Font.Style = []
        MaxLength = 35
        ParentFont = False
        TabOrder = 1
        OnChange = Edit_BankName_SelfChange
        OnKeyPress = Edit_ReferensKeyPress
      end
      object Edit_tey3: TEdit
        Left = 9
        Top = 71
        Width = 328
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier'
        Font.Style = []
        MaxLength = 35
        ParentFont = False
        TabOrder = 2
        OnChange = Edit_BankName_SelfChange
        OnKeyPress = Edit_ReferensKeyPress
      end
      object Edit_tey4: TEdit
        Left = 9
        Top = 87
        Width = 328
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier'
        Font.Style = []
        MaxLength = 35
        ParentFont = False
        TabOrder = 3
        OnChange = Edit_BankName_SelfChange
        OnKeyPress = Edit_ReferensKeyPress
      end
      object DBComboBox_BudgetLevel: TDBLookupComboBox
        Left = 44
        Top = 16
        Width = 327
        Height = 23
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = DataMod.DS_BudgetLevel
        TabOrder = 4
        Visible = False
      end
      object DBComboBox_Destination: TDBLookupComboBox
        Left = 33
        Top = 45
        Width = 327
        Height = 23
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = DataMod.DS_Destination
        TabOrder = 5
        Visible = False
      end
    end
    object GroupBox6: TGroupBox
      Left = 341
      Top = 355
      Width = 713
      Height = 123
      Align = alLeft
      Caption = #1071#1083#1072#1074#1103' '#1084#1103#1083#1091#1084#1072#1090
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnEnter = GroupBox6Enter
      ExplicitLeft = 362
      object Edit_inf1: TEdit
        Left = 6
        Top = 18
        Width = 363
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier'
        Font.Style = []
        MaxLength = 35
        ParentFont = False
        TabOrder = 0
        OnChange = Edit_BankName_SelfChange
        OnKeyPress = Edit_ReferensKeyPress
      end
      object Edit_inf2: TEdit
        Left = 6
        Top = 43
        Width = 363
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier'
        Font.Style = []
        MaxLength = 35
        ParentFont = False
        TabOrder = 1
        OnChange = Edit_BankName_SelfChange
        OnKeyPress = Edit_ReferensKeyPress
      end
      object Edit_inf3: TEdit
        Left = 6
        Top = 70
        Width = 363
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier'
        Font.Style = []
        MaxLength = 35
        ParentFont = False
        TabOrder = 2
        OnChange = Edit_BankName_SelfChange
        OnKeyPress = Edit_ReferensKeyPress
      end
    end
  end
  object Button4: TButton
    Left = 327
    Top = 489
    Width = 122
    Height = 24
    Anchors = [akRight, akBottom]
    Caption = #1071#1083#1103#1074#1103' '#1074#1103' '#1085#1102#1074#1073#1103#1090#1080'  >>'
    TabOrder = 1
    OnClick = Button4Click
  end
  object ButtonFinish: TButton
    Left = 452
    Top = 489
    Width = 89
    Height = 24
    Anchors = [akRight, akBottom]
    Caption = #1057#1054#1053
    TabOrder = 2
    OnClick = ButtonFinishClick
  end
  object Button2: TButton
    Left = 541
    Top = 489
    Width = 88
    Height = 24
    Anchors = [akRight, akBottom]
    Caption = #1048#1084#1090#1080#1085#1072
    Enabled = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 629
    Top = 489
    Width = 88
    Height = 24
    Anchors = [akRight, akBottom]
    Caption = #1063#1099#1093#1099#1096
    TabOrder = 4
    OnClick = Button3Click
  end
  object GroupBox7: TGroupBox
    Left = 0
    Top = 486
    Width = 182
    Height = 35
    Caption = #1071#1084#1103#1083#1080#1081#1072#1090' '#1085#1102#1074#1094
    TabOrder = 5
    object RB_102T: TRadioButton
      Left = 93
      Top = 14
      Width = 78
      Height = 18
      Caption = 'MT102 T'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = RB_102TClick
    end
    object RB_102: TRadioButton
      Left = 9
      Top = 14
      Width = 78
      Height = 18
      Caption = 'MT102'
      Checked = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = True
      OnClick = RB_102Click
    end
  end
end
