object FormCreateCMAccounts: TFormCreateCMAccounts
  Left = 350
  Top = 337
  BorderIcons = [biSystemMenu]
  ClientHeight = 265
  ClientWidth = 712
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 712
    Height = 227
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Panel3: TPanel
      Left = 2
      Top = 2
      Width = 353
      Height = 223
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 0
      object Label43: TLabel
        Left = 9
        Top = 51
        Width = 76
        Height = 14
        Caption = #1046#1072#1088#1080'  '#1097#1077#1089#1072#1073#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label47: TLabel
        Left = 10
        Top = 82
        Width = 110
        Height = 14
        Caption = #1040#1076#1080' '#1077#1097#1090#1080#1081#1072#1090' '#1097#1077#1089#1072#1073#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label51: TLabel
        Left = 8
        Top = 140
        Width = 68
        Height = 13
        Caption = #1060#1072#1080#1079' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label55: TLabel
        Left = 8
        Top = 168
        Width = 128
        Height = 13
        Caption = #1069#1077#1078#1080#1082#1084#1080#1096' '#1089#1089#1091#1076#1072' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label59: TLabel
        Left = 3
        Top = 197
        Width = 139
        Height = 13
        Caption = #1069#1077#1078'. '#1040#1076#1080' '#1077#1097#1090#1080#1081#1072#1090' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 9
        Top = 20
        Width = 74
        Height = 14
        Caption = #1057#1089#1091#1076#1072' '#1097#1077#1089#1072#1073#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 9
        Top = 111
        Width = 138
        Height = 14
        Caption = #1052#1103#1075#1089#1103#1076#1083#1080' '#1077#1097#1090#1080#1081#1072#1090' '#1097#1077#1089#1072#1073#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EditCustAcc: TEdit
        Left = 137
        Top = 47
        Width = 187
        Height = 22
        TabOrder = 1
        Text = 'EditCustAcc'
      end
      object EditResresveAcc: TEdit
        Left = 137
        Top = 78
        Width = 187
        Height = 22
        TabOrder = 2
        Text = 'EditResresveAcc'
      end
      object EditInterestAcc: TEdit
        Left = 137
        Top = 134
        Width = 187
        Height = 22
        TabOrder = 4
        Text = 'EditInterestAcc'
      end
      object EditDueLoanAcc: TEdit
        Left = 137
        Top = 163
        Width = 187
        Height = 22
        TabOrder = 5
        Text = 'EditDueLoanAcc'
      end
      object EditDueReserveAcc: TEdit
        Left = 137
        Top = 190
        Width = 187
        Height = 22
        TabOrder = 6
        Text = 'EditDueReserveAcc'
      end
      object ChCust: TCheckBox
        Left = 332
        Top = 48
        Width = 17
        Height = 19
        Caption = 'ChCust'
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object CHPrRes: TCheckBox
        Left = 332
        Top = 81
        Width = 15
        Height = 18
        Caption = 'CHPrRes'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object CHInt: TCheckBox
        Left = 332
        Top = 135
        Width = 15
        Height = 18
        Caption = 'CHInt'
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
      object ChDueLoan: TCheckBox
        Left = 332
        Top = 166
        Width = 15
        Height = 18
        Caption = 'ChDueLoan'
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
      object ChSecRes: TCheckBox
        Left = 332
        Top = 191
        Width = 15
        Height = 18
        Caption = 'ChSecRes'
        TabOrder = 11
      end
      object EditLoanAcc: TEdit
        Left = 137
        Top = 17
        Width = 187
        Height = 22
        TabOrder = 0
        Text = 'EditCustAcc'
      end
      object ChLoan: TCheckBox
        Left = 332
        Top = 18
        Width = 17
        Height = 19
        Caption = 'ChBoxCust'
        Checked = True
        State = cbChecked
        TabOrder = 12
      end
      object EditPrPurResAcc: TEdit
        Left = 137
        Top = 107
        Width = 187
        Height = 22
        TabOrder = 3
        Text = 'EditResresveAcc'
      end
      object ChPurRes: TCheckBox
        Left = 332
        Top = 110
        Width = 15
        Height = 18
        Caption = 'ChBoxRes'
        Checked = True
        State = cbChecked
        TabOrder = 13
      end
    end
    object Panel4: TPanel
      Left = 355
      Top = 2
      Width = 355
      Height = 223
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object Label5: TLabel
        Left = 6
        Top = 19
        Width = 136
        Height = 13
        Caption = #1069#1077#1078'.'#1052#1103#1075'.'#1077#1097#1090#1080#1081#1072#1090' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 6
        Top = 51
        Width = 124
        Height = 13
        Caption = #1069#1077#1078#1080#1082#1084#1080#1096' '#1092#1072#1080#1079' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 82
        Width = 100
        Height = 13
        Caption = #1041'.'#1050'. '#1069#1080#1088#1086#1074' '#1065#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 8
        Top = 110
        Width = 119
        Height = 13
        Caption = #1041'.'#1050'. '#1070#1097#1076#1103#1083#1080#1082' '#1065#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 8
        Top = 136
        Width = 97
        Height = 14
        Caption = #1041'.'#1050'. '#1057#1089#1091#1076#1072' '#1097#1077#1089#1072#1073#1099
      end
      object Label10: TLabel
        Left = 10
        Top = 165
        Width = 91
        Height = 14
        Caption = #1041'.'#1050'. '#1060#1072#1080#1079' '#1097#1077#1089#1072#1073#1099
      end
      object Label11: TLabel
        Left = 10
        Top = 190
        Width = 89
        Height = 14
        Caption = #1050'.'#1061'.'#1070'.'#1052' '#1045#1097#1090#1080#1081#1072#1090
      end
      object EditSecresAcc: TEdit
        Left = 135
        Top = 18
        Width = 187
        Height = 22
        TabOrder = 0
        Text = 'EditDueReserveAcc'
      end
      object ChSecPurRes: TCheckBox
        Left = 327
        Top = 19
        Width = 15
        Height = 19
        Caption = 'ChBoxDueRes'
        TabOrder = 7
      end
      object CHDueint: TCheckBox
        Left = 327
        Top = 48
        Width = 15
        Height = 18
        Caption = 'ChBoxDueInt'
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object EditDueIntAcc: TEdit
        Left = 135
        Top = 46
        Width = 187
        Height = 22
        TabOrder = 1
        Text = 'EditDueInterestAcc'
      end
      object EditOutPledgAcc: TEdit
        Left = 135
        Top = 74
        Width = 187
        Height = 22
        TabOrder = 2
        Text = 'EditPledgAcc'
      end
      object ChPledg: TCheckBox
        Left = 327
        Top = 76
        Width = 15
        Height = 18
        Caption = 'ChBoxOutPlg'
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
      object ChObl: TCheckBox
        Left = 327
        Top = 104
        Width = 15
        Height = 19
        Caption = 'ChBoxOutObl'
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
      object ChOutLoan: TCheckBox
        Left = 327
        Top = 132
        Width = 15
        Height = 19
        Caption = 'CheckBox1'
        Checked = True
        State = cbChecked
        TabOrder = 11
      end
      object ChOutInt: TCheckBox
        Left = 327
        Top = 164
        Width = 15
        Height = 18
        Caption = 'CheckBox1'
        Checked = True
        State = cbChecked
        TabOrder = 12
      end
      object ChCrdLineObl: TCheckBox
        Left = 327
        Top = 194
        Width = 15
        Height = 18
        Caption = 'CheckBox1'
        Checked = True
        State = cbChecked
        TabOrder = 13
      end
      object EditCrdLineoblAcc: TEdit
        Left = 135
        Top = 190
        Width = 187
        Height = 22
        TabOrder = 6
        Text = 'EditCrdLineOblAcc'
      end
      object EditOutIntAcc: TEdit
        Left = 135
        Top = 162
        Width = 187
        Height = 22
        TabOrder = 5
        Text = 'EditOutInterestAcc'
      end
      object EditOutLoanAcc: TEdit
        Left = 135
        Top = 131
        Width = 187
        Height = 22
        TabOrder = 4
        Text = 'EditOutInterestAcc'
      end
      object EditOutOblAcc: TEdit
        Left = 135
        Top = 103
        Width = 187
        Height = 22
        TabOrder = 3
        Text = 'EditOutOblAcc'
      end
    end
  end
  object BitBtnOk: TBitBtn
    Left = 517
    Top = 229
    Width = 81
    Height = 27
    Caption = #1043#1103#1073#1091#1083
    Default = True
    DoubleBuffered = True
    ModalResult = 1
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = BitBtnOkClick
  end
  object BitBtnCancel: TBitBtn
    Left = 606
    Top = 230
    Width = 81
    Height = 27
    Cancel = True
    Caption = #1048#1084#1090#1080#1085#1072
    DoubleBuffered = True
    ModalResult = 2
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 2
  end
  object CM_CREDIT: TOraclePackage
    PackageName = 'CM_CREDIT'
    Left = 8
    Top = 256
  end
end
