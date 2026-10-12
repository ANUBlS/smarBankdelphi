object FormCreateCMAccounts: TFormCreateCMAccounts
  Left = 344
  Top = 346
  BorderIcons = [biSystemMenu]
  ClientHeight = 316
  ClientWidth = 721
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 721
    Height = 284
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Panel3: TPanel
      Left = 2
      Top = 2
      Width = 359
      Height = 280
      Align = alLeft
      BevelInner = bvLowered
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = -22
      ExplicitTop = 1
      ExplicitHeight = 254
      object Label43: TLabel
        Left = 9
        Top = 51
        Width = 74
        Height = 13
        Caption = #1046#1072#1088#1080'  '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label47: TLabel
        Left = 10
        Top = 82
        Width = 111
        Height = 13
        Caption = #1040#1076#1080' '#1077#1097#1090#1080#1081#1072#1090' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
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
        Top = 227
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
      object Label1: TLabel
        Left = 9
        Top = 20
        Width = 74
        Height = 13
        Caption = #1057#1089#1091#1076#1072' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 9
        Top = 111
        Width = 140
        Height = 13
        Caption = #1052#1103#1075#1089#1103#1076#1083#1080' '#1077#1097#1090#1080#1081#1072#1090' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 167
        Width = 132
        Height = 13
        Caption = #1048'.'#1054'.'#1050'.'#1052' '#1072#1076#1080' '#1077#1085#1090#1080#1081#1072#1090' '#1097#1077#1089
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 6
        Top = 196
        Width = 140
        Height = 13
        Caption = #1048'.'#1054'.'#1050'.'#1052' '#1084#1103#1075#1089#1103#1076#1083#1080' '#1077#1085#1090#1080#1081#1072#1090' '
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 4
        Top = 253
        Width = 134
        Height = 13
        Caption = ' G'#601'l'#601'c'#601'k d'#246'vr'#252'n g'#601'lir hesab'#305
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object EditCustAcc: TEdit
        Left = 139
        Top = 47
        Width = 200
        Height = 22
        TabOrder = 1
        Text = 'EditCustAcc'
      end
      object EditResresveAcc: TEdit
        Left = 139
        Top = 78
        Width = 200
        Height = 22
        TabOrder = 2
        Text = 'EditResresveAcc'
      end
      object EditInterestAcc: TEdit
        Left = 139
        Top = 134
        Width = 200
        Height = 22
        TabOrder = 4
        Text = 'EditInterestAcc'
      end
      object EditDueLoanAcc: TEdit
        Left = 139
        Top = 222
        Width = 200
        Height = 22
        TabOrder = 5
        Text = 'EditDueLoanAcc'
      end
      object ChCust: TCheckBox
        Left = 340
        Top = 48
        Width = 17
        Height = 19
        Caption = 'ChCust'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object CHPrRes: TCheckBox
        Left = 340
        Top = 80
        Width = 15
        Height = 18
        Caption = 'CHPrRes'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object CHInt: TCheckBox
        Left = 340
        Top = 135
        Width = 15
        Height = 18
        Caption = 'CHInt'
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object ChDueLoan: TCheckBox
        Left = 340
        Top = 225
        Width = 15
        Height = 18
        Caption = 'ChDueLoan'
        TabOrder = 9
      end
      object EditLoanAcc: TEdit
        Left = 139
        Top = 17
        Width = 200
        Height = 22
        TabOrder = 0
        Text = 'EditCustAcc'
      end
      object ChLoan: TCheckBox
        Left = 340
        Top = 18
        Width = 17
        Height = 19
        Caption = 'ChBoxCust'
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
      object EditPrPurResAcc: TEdit
        Left = 139
        Top = 107
        Width = 200
        Height = 22
        TabOrder = 3
        Text = 'EditResresveAcc'
      end
      object ChPurRes: TCheckBox
        Left = 340
        Top = 110
        Width = 15
        Height = 18
        Caption = 'ChBoxRes'
        Checked = True
        State = cbChecked
        TabOrder = 11
      end
      object Edit1: TEdit
        Left = 139
        Top = 163
        Width = 200
        Height = 22
        TabOrder = 12
        Text = 'EditIResresveAcc'
      end
      object CheckBox1: TCheckBox
        Left = 340
        Top = 166
        Width = 15
        Height = 18
        Caption = 'CHPrRes'
        TabOrder = 13
      end
      object edit2: TEdit
        Left = 139
        Top = 192
        Width = 200
        Height = 22
        TabOrder = 14
        Text = 'edit2'
      end
      object CheckBox2: TCheckBox
        Left = 340
        Top = 195
        Width = 15
        Height = 18
        Caption = 'ChBoxRes'
        TabOrder = 15
      end
      object EditFutureincomeAcc: TEdit
        Left = 139
        Top = 248
        Width = 200
        Height = 22
        TabOrder = 16
        Text = 'EditFutureincomeAcc'
      end
      object ChFutureincomeAcc: TCheckBox
        Left = 340
        Top = 251
        Width = 15
        Height = 18
        Caption = 'ChFutureincomeAcc'
        Checked = True
        State = cbChecked
        TabOrder = 17
      end
    end
    object Panel4: TPanel
      Left = 361
      Top = 2
      Width = 358
      Height = 280
      Align = alClient
      BevelInner = bvLowered
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitHeight = 254
      object Label5: TLabel
        Left = 6
        Top = 45
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
        Top = 75
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
      object Label8: TLabel
        Left = 6
        Top = 106
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
        Left = 6
        Top = 131
        Width = 98
        Height = 13
        Caption = #1041'.'#1050'. '#1057#1089#1091#1076#1072' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 9
        Top = 160
        Width = 92
        Height = 13
        Caption = #1041'.'#1050'. '#1060#1072#1080#1079' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 9
        Top = 190
        Width = 91
        Height = 13
        Caption = #1050'.'#1061'.'#1070'.'#1052' '#1045#1097#1090#1080#1081#1072#1090
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label59: TLabel
        Left = 8
        Top = 17
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
      object Label7: TLabel
        Left = 8
        Top = 226
        Width = 100
        Height = 13
        Caption = #1041'.'#1050'. '#1069#1080#1088#1086#1074' '#1065#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object EditSecresAcc: TEdit
        Left = 135
        Top = 44
        Width = 200
        Height = 22
        TabOrder = 0
        Text = 'EditDueReserveAcc'
      end
      object ChSecPurRes: TCheckBox
        Left = 336
        Top = 45
        Width = 15
        Height = 19
        Caption = 'ChBoxDueRes'
        TabOrder = 6
      end
      object CHDueint: TCheckBox
        Left = 336
        Top = 74
        Width = 15
        Height = 18
        Caption = 'ChBoxDueInt'
        TabOrder = 7
      end
      object EditDueIntAcc: TEdit
        Left = 135
        Top = 72
        Width = 200
        Height = 22
        TabOrder = 1
        Text = 'EditDueInterestAcc'
      end
      object ChObl: TCheckBox
        Left = 336
        Top = 100
        Width = 15
        Height = 18
        Caption = 'ChBoxOutObl'
        TabOrder = 8
      end
      object ChOutLoan: TCheckBox
        Left = 336
        Top = 128
        Width = 15
        Height = 18
        Caption = 'CheckBox1'
        TabOrder = 9
      end
      object ChOutInt: TCheckBox
        Left = 335
        Top = 160
        Width = 15
        Height = 19
        Caption = 'CheckBox1'
        TabOrder = 10
      end
      object ChCrdLineObl: TCheckBox
        Left = 336
        Top = 190
        Width = 15
        Height = 18
        Caption = 'CheckBox1'
        TabOrder = 11
      end
      object EditCrdLineoblAcc: TEdit
        Left = 134
        Top = 188
        Width = 200
        Height = 22
        TabOrder = 5
        Text = 'EditCrdLineOblAcc'
      end
      object EditOutIntAcc: TEdit
        Left = 134
        Top = 157
        Width = 200
        Height = 22
        TabOrder = 4
        Text = 'EditOutInterestAcc'
      end
      object EditOutLoanAcc: TEdit
        Left = 134
        Top = 127
        Width = 200
        Height = 22
        TabOrder = 3
        Text = 'EditOutInterestAcc'
      end
      object EditOutOblAcc: TEdit
        Left = 134
        Top = 99
        Width = 200
        Height = 22
        TabOrder = 2
        Text = 'EditOutOblAcc'
      end
      object EditDueReserveAcc: TEdit
        Left = 134
        Top = 15
        Width = 200
        Height = 22
        TabOrder = 12
        Text = 'EditDueReserveAcc'
      end
      object ChSecRes: TCheckBox
        Left = 336
        Top = 18
        Width = 15
        Height = 18
        Caption = 'ChSecRes'
        TabOrder = 13
      end
      object EditOutPledgAcc: TEdit
        Left = 135
        Top = 219
        Width = 200
        Height = 22
        TabOrder = 14
        Text = 'EditPledgAcc'
        Visible = False
      end
      object ChPledg: TCheckBox
        Left = 336
        Top = 222
        Width = 15
        Height = 17
        Caption = 'ChBoxOutPlg'
        TabOrder = 15
        Visible = False
      end
    end
  end
  object BitBtnOk: TBitBtn
    Left = 546
    Top = 288
    Width = 81
    Height = 26
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
    Left = 627
    Top = 288
    Width = 81
    Height = 26
    Cancel = True
    Caption = #1048#1084#1090#1080#1085#1072
    DoubleBuffered = True
    ModalResult = 2
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 2
  end
  object CM_CREDIT: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CM_CREDIT'
    Left = 32
    Top = 288
  end
end
