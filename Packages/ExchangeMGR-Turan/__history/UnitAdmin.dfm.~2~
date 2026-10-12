object FormAdmin: TFormAdmin
  Left = 476
  Top = 315
  Caption = 'FormAdmin'
  ClientHeight = 183
  ClientWidth = 202
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GrBoxADM: TGroupBox
    Left = 0
    Top = 0
    Width = 202
    Height = 183
    Align = alClient
    Caption = #1048#1076#1072#1088#1103#1077#1090#1084#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object GrBoxUserList: TGroupBox
      Left = 8
      Top = 24
      Width = 185
      Height = 43
      Caption = #1048#1089#1090#1080#1092#1072#1076#1103#1095#1080
      TabOrder = 0
      object DBLC_UserList: TDBLookupComboBox
        Left = 3
        Top = 17
        Width = 177
        Height = 21
        KeyField = 'USER_ID'
        ListField = 'USERNAME'
        ListSource = DataModExch.DSUserList
        TabOrder = 0
      end
    end
    object BtnCreateUser: TBitBtn
      Left = 5
      Top = 93
      Width = 188
      Height = 25
      Caption = #1048#1089#1090#1080#1092#1072#1076#1103#1095#1080' '#1081#1072#1088#1072#1090
      DoubleBuffered = True
      Kind = bkOK
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BtnCreateUserClick
    end
    object ChBoxAdmin: TCheckBox
      Left = 8
      Top = 72
      Width = 185
      Height = 17
      Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088' '#1097#1094#1075#1091#1075#1083#1072#1088#1099' '#1080#1083#1103
      TabOrder = 2
      OnClick = ChBoxAdminClick
    end
    object BtnDropUser: TBitBtn
      Left = 5
      Top = 120
      Width = 188
      Height = 25
      Caption = #1051#1103#1100#1074' '#1077#1090
      DoubleBuffered = True
      Kind = bkCancel
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = BtnDropUserClick
    end
    object GroupBox1: TGroupBox
      Left = 208
      Top = 24
      Width = 257
      Height = 117
      Caption = #1054#1092#1092#1083#1080#1085#1077'  '#1094#1095#1094#1085' '#1080#1089#1090#1080#1092#1072#1076#1103#1095#1080
      TabOrder = 4
      object Label1: TLabel
        Left = 32
        Top = 27
        Width = 45
        Height = 13
        Caption = #1048#1089#1090#1080#1092#1072#1076#1103#1095#1080':'
      end
      object Label2: TLabel
        Left = 34
        Top = 63
        Width = 27
        Height = 13
        Caption = #1055#1072#1088#1086#1083':'
      end
      object EditUserName: TEdit
        Left = 96
        Top = 24
        Width = 153
        Height = 21
        TabOrder = 0
      end
      object EditPassWord: TEdit
        Left = 96
        Top = 56
        Width = 153
        Height = 21
        PasswordChar = '*'
        TabOrder = 1
      end
      object BitBtn1: TBitBtn
        Left = 88
        Top = 87
        Width = 75
        Height = 25
        DoubleBuffered = True
        Kind = bkOK
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 2
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 171
        Top = 87
        Width = 75
        Height = 25
        DoubleBuffered = True
        Kind = bkCancel
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 3
        OnClick = BitBtn2Click
      end
    end
    object ch_box: TEdit
      Left = 165
      Top = 69
      Width = 19
      Height = 21
      TabOrder = 5
      Text = '0'
      Visible = False
    end
    object GroupBox2: TGroupBox
      Left = 466
      Top = 24
      Width = 186
      Height = 117
      Caption = #1054#1092#1092#1083#1080#1085#1077'  '#1094#1095#1094#1085' '#1080#1089#1090#1080#1092#1072#1076#1103#1095#1080' '#1097#1094#1075#1091#1075#1091
      TabOrder = 6
      object DBLC_User: TDBLookupComboBox
        Left = 9
        Top = 24
        Width = 167
        Height = 21
        KeyField = 'ID'
        ListField = 'USERNAME'
        ListSource = DataModExch.DSUsers
        TabOrder = 0
      end
      object chk_box: TEdit
        Left = 157
        Top = 55
        Width = 23
        Height = 21
        TabOrder = 1
        Text = '0'
        Visible = False
      end
      object BitBtn3: TBitBtn
        Left = 64
        Top = 86
        Width = 75
        Height = 25
        Caption = #1043#1103#1073#1091#1083
        DoubleBuffered = True
        Kind = bkOK
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 2
        OnClick = BitBtn3Click
      end
      object CheckBoxAdmin: TCheckBox
        Left = 8
        Top = 56
        Width = 169
        Height = 17
        Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088' '#1097#1094#1075#1091#1075#1083#1072#1088#1099' '#1080#1083#1103
        TabOrder = 3
        OnClick = CheckBoxAdminClick
      end
    end
  end
end
