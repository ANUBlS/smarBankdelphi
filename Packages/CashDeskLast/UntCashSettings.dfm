object FormCashSettings: TFormCashSettings
  Left = 388
  Top = 201
  BorderStyle = bsDialog
  Caption = 'Cash Balance & Report Settings'
  ClientHeight = 423
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 7
    Top = 389
    Width = 137
    Height = 24
    Caption = #1064#1103#1082#1080#1083'  '#1103#1083#1072#1074#1103' '#1077#1090
    OnClick = SpeedButton1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = -2
    Width = 405
    Height = 243
    Align = alCustom
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 17
      Width = 405
      Height = 44
      Align = alTop
      AutoSize = True
      TabOrder = 0
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 208
        Height = 42
        Align = alLeft
        AutoSize = True
        BevelOuter = bvLowered
        TabOrder = 0
        object StaticText2: TStaticText
          Left = 1
          Top = 1
          Width = 206
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1052#1080#1083#1083#1080' '#1074#1072#1083#1081#1091#1090#1072#1076#1072
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object NatBalance: TEdit
          Left = 3
          Top = 18
          Width = 203
          Height = 21
          TabOrder = 1
        end
      end
      object Panel4: TPanel
        Left = 209
        Top = 1
        Width = 195
        Height = 42
        Align = alClient
        AutoSize = True
        BevelOuter = bvLowered
        TabOrder = 1
        object StaticText3: TStaticText
          Left = 1
          Top = 1
          Width = 193
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1061#1072#1088#1080#1078#1080' '#1074#1072#1083#1081#1091#1090#1072#1076#1072
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object ForBalance: TEdit
          Left = 3
          Top = 18
          Width = 189
          Height = 21
          TabOrder = 1
        end
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 78
      Width = 405
      Height = 43
      Align = alTop
      TabOrder = 1
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 210
        Height = 41
        Align = alLeft
        AutoSize = True
        BevelOuter = bvLowered
        TabOrder = 0
        object StaticText5: TStaticText
          Left = 1
          Top = 1
          Width = 208
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1052#1080#1083#1083#1080
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object DescriptionAz: TEdit
          Left = 3
          Top = 16
          Width = 204
          Height = 21
          TabOrder = 1
        end
      end
      object Panel7: TPanel
        Left = 211
        Top = 1
        Width = 193
        Height = 41
        Align = alClient
        AutoSize = True
        BevelOuter = bvLowered
        TabOrder = 1
        object StaticText6: TStaticText
          Left = 1
          Top = 1
          Width = 191
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1061#1072#1088#1080#1078#1080
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object DescriptionEng: TEdit
          Left = 1
          Top = 16
          Width = 189
          Height = 21
          TabOrder = 1
        end
      end
    end
    object Panel8: TPanel
      Left = 0
      Top = 138
      Width = 405
      Height = 43
      Align = alTop
      TabOrder = 2
      object Panel9: TPanel
        Left = 1
        Top = 1
        Width = 211
        Height = 41
        Align = alLeft
        AutoSize = True
        BevelOuter = bvLowered
        TabOrder = 0
        object StaticText8: TStaticText
          Left = 1
          Top = 1
          Width = 209
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1048#1084#1079#1072' '#1085#1094#1084#1091#1085#1103#1089#1080
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object signatyre: TEdit
          Left = 2
          Top = 16
          Width = 205
          Height = 21
          TabOrder = 1
        end
      end
      object Panel10: TPanel
        Left = 212
        Top = 1
        Width = 192
        Height = 41
        Align = alClient
        AutoSize = True
        BevelOuter = bvLowered
        TabOrder = 1
        object StaticText9: TStaticText
          Left = 1
          Top = 1
          Width = 190
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = #1052#1103#1089#1091#1083' '#1096#1103#1093#1089' '
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object responsible_person: TEdit
          Left = 1
          Top = 16
          Width = 189
          Height = 21
          TabOrder = 1
        end
      end
    end
    object StaticText1: TStaticText
      Left = 0
      Top = 0
      Width = 405
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = #1050#1072#1089#1089#1072' '#1094#1095#1094#1085' '#1073#1072#1083#1072#1085#1089' '#1097#1077#1089#1072#1073#1083#1072#1088#1099
      Color = clNavy
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 3
    end
    object StaticText4: TStaticText
      Left = 0
      Top = 61
      Width = 405
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = #1041#1072#1085#1082#1099#1085' '#1093#1094#1089#1091#1089#1080#1081#1081#1103#1090#1080' '
      Color = clNavy
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 4
    end
    object StaticText7: TStaticText
      Left = 0
      Top = 121
      Width = 405
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = #1052#1103#1076#1072#1093#1080#1083' / '#1052#1103#1093#1072#1088#1080#1078' '#1066#1091#1088#1085#1072#1083#1099
      Color = clNavy
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 5
    end
    object StaticText10: TStaticText
      Left = 4
      Top = 201
      Width = 47
      Height = 17
      Align = alCustom
      Alignment = taCenter
      Caption = #399'm'#601'liyyat'#231#305
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 6
    end
    object EditOperator: TEdit
      Left = 4
      Top = 218
      Width = 204
      Height = 21
      TabOrder = 7
    end
    object EditAccountant: TEdit
      Left = 214
      Top = 218
      Width = 187
      Height = 21
      TabOrder = 8
    end
    object StaticText11: TStaticText
      Left = 0
      Top = 181
      Width = 405
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = 'Kassa kitab'#305
      Color = clNavy
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 9
    end
    object StaticText12: TStaticText
      Left = 212
      Top = 202
      Width = 41
      Height = 17
      Align = alCustom
      Alignment = taCenter
      Caption = 'M'#252'hasib'
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 10
    end
  end
  object CommitButton: TButton
    Left = 203
    Top = 389
    Width = 75
    Height = 24
    Caption = '&'#1043#1103#1073#1091#1083
    Default = True
    TabOrder = 1
    OnClick = CommitButtonClick
  end
  object CancelButton: TButton
    Left = 299
    Top = 388
    Width = 75
    Height = 25
    Caption = '&'#1048#1084#1090#1080#1085#1072
    Default = True
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object GroupBox1: TGroupBox
    Left = -2
    Top = 238
    Width = 405
    Height = 138
    Align = alCustom
    TabOrder = 3
    object GroupBox2: TGroupBox
      Left = 4
      Top = 7
      Width = 203
      Height = 125
      Caption = #1052#1103#1076#1072#1093#1080#1083' '#1086#1088#1076#1077#1088#1080
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 35
        Top = 24
        Width = 115
        Height = 13
        Caption = #1058#1103#1097#1074#1080#1083' '#1074#1077#1088#1076#1080#1084'/Handover'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 35
        Top = 62
        Width = 64
        Height = 13
        Caption = #1056#1103#1097#1073#1103#1088'/Chief'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 35
        Top = 81
        Width = 99
        Height = 13
        Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090#1095#1099'/Operator'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 35
        Top = 43
        Width = 92
        Height = 13
        Caption = #399'm'#601'liyyat'#231#305' / Kassir'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 35
        Top = 101
        Width = 94
        Height = 13
        Caption = #1053#1103#1079#1072#1088#1103#1090#1095#1080'/Controller'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Chck1: TCheckBox
        Tag = 1
        Left = 15
        Top = 20
        Width = 17
        Height = 17
        TabOrder = 0
        OnClick = Chck1Click
      end
      object Chck3: TCheckBox
        Tag = 1
        Left = 15
        Top = 80
        Width = 17
        Height = 17
        TabOrder = 1
        OnClick = Chck3Click
      end
      object Chck2: TCheckBox
        Tag = 1
        Left = 15
        Top = 60
        Width = 17
        Height = 17
        TabOrder = 2
        OnClick = Chck2Click
      end
      object Chck4: TCheckBox
        Tag = 1
        Left = 15
        Top = 40
        Width = 17
        Height = 19
        TabOrder = 3
        OnClick = Chck4Click
      end
      object handover: TEdit
        Left = 176
        Top = 24
        Width = 17
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        Visible = False
      end
      object chief: TEdit
        Left = 176
        Top = 60
        Width = 17
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        Visible = False
      end
      object cashier: TEdit
        Left = 176
        Top = 44
        Width = 17
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        Visible = False
      end
      object chk5: TCheckBox
        Left = 15
        Top = 100
        Width = 17
        Height = 17
        TabOrder = 7
        OnClick = chk5Click
      end
      object controller: TEdit
        Left = 176
        Top = 102
        Width = 17
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        Visible = False
      end
      object p_operator: TEdit
        Left = 176
        Top = 80
        Width = 16
        Height = 21
        TabOrder = 9
        Visible = False
      end
    end
    object GroupBox3: TGroupBox
      Left = 213
      Top = 7
      Width = 194
      Height = 126
      Caption = #1052#1103#1093#1072#1088#1080#1078' '#1086#1088#1076#1077#1088#1080
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label3: TLabel
        Left = 25
        Top = 21
        Width = 146
        Height = 13
        Caption = #1042#1103#1089#1072#1080#1090' '#1072#1083#1076#1099#1084'/Amount Received'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 25
        Top = 56
        Width = 64
        Height = 13
        Caption = #1056#1103#1097#1073#1103#1088'/Chief'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 25
        Top = 109
        Width = 146
        Height = 13
        Caption = #1041#1072#1096' '#1084#1094#1097#1072#1089#1080#1073'/Chief accountant'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 32
        Top = 72
        Width = 3
        Height = 13
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 25
        Top = 38
        Width = 92
        Height = 13
        Caption = #399'm'#601'liyyat'#231#305' / Kassir'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 25
        Top = 91
        Width = 99
        Height = 13
        Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090#1095#1099'/Operator'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 25
        Top = 73
        Width = 94
        Height = 13
        Caption = #1053#1103#1079#1072#1088#1103#1090#1095#1080'/Controller'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Chck5: TCheckBox
        Tag = 1
        Left = 5
        Top = 20
        Width = 17
        Height = 17
        TabOrder = 0
        OnClick = Chck5Click
      end
      object Chck6: TCheckBox
        Left = 5
        Top = 54
        Width = 17
        Height = 17
        TabOrder = 1
        OnClick = Chck6Click
      end
      object Chck7: TCheckBox
        Tag = 1
        Left = 5
        Top = 105
        Width = 17
        Height = 17
        TabOrder = 2
        OnClick = Chck7Click
      end
      object Chck8: TCheckBox
        Tag = 1
        Left = 5
        Top = 88
        Width = 17
        Height = 17
        TabOrder = 3
        OnClick = Chck8Click
      end
      object Chck9: TCheckBox
        Tag = 1
        Left = 5
        Top = 37
        Width = 17
        Height = 17
        TabOrder = 4
        OnClick = Chck9Click
      end
      object amount: TEdit
        Left = 172
        Top = 18
        Width = 19
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        Visible = False
      end
      object chief_: TEdit
        Left = 172
        Top = 51
        Width = 19
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        Visible = False
      end
      object accountant: TEdit
        Left = 172
        Top = 105
        Width = 19
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        Visible = False
      end
      object operator_: TEdit
        Left = 172
        Top = 87
        Width = 19
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        Visible = False
      end
      object cashier_: TEdit
        Left = 172
        Top = 37
        Width = 19
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        Visible = False
      end
      object controller_: TEdit
        Left = 172
        Top = 73
        Width = 19
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        Visible = False
      end
      object chk_82: TCheckBox
        Left = 5
        Top = 71
        Width = 17
        Height = 17
        TabOrder = 11
        OnClick = chk_82Click
      end
    end
  end
end
