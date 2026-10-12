object FormCreateCMAccounts: TFormCreateCMAccounts
  Left = 344
  Top = 346
  BorderIcons = [biSystemMenu]
  ClientHeight = 267
  ClientWidth = 670
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 670
    Height = 240
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Panel3: TPanel
      Left = 2
      Top = 2
      Width = 333
      Height = 236
      Align = alLeft
      BevelInner = bvLowered
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label43: TLabel
        Left = 8
        Top = 47
        Width = 61
        Height = 11
        Caption = #1046#1072#1088#1080'  '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label47: TLabel
        Left = 9
        Top = 76
        Width = 94
        Height = 11
        Caption = #1040#1076#1080' '#1077#1097#1090#1080#1081#1072#1090' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label51: TLabel
        Left = 7
        Top = 130
        Width = 57
        Height = 11
        Caption = #1060#1072#1080#1079' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label55: TLabel
        Left = 7
        Top = 211
        Width = 108
        Height = 11
        Caption = #1069#1077#1078#1080#1082#1084#1080#1096' '#1089#1089#1091#1076#1072' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 8
        Top = 19
        Width = 62
        Height = 11
        Caption = #1057#1089#1091#1076#1072' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 103
        Width = 118
        Height = 11
        Caption = #1052#1103#1075#1089#1103#1076#1083#1080' '#1077#1097#1090#1080#1081#1072#1090' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 7
        Top = 155
        Width = 115
        Height = 11
        Caption = #1048'.'#1054'.'#1050'.'#1052' '#1072#1076#1080' '#1077#1085#1090#1080#1081#1072#1090' '#1097#1077#1089
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 6
        Top = 182
        Width = 123
        Height = 11
        Caption = #1048'.'#1054'.'#1050'.'#1052' '#1084#1103#1075#1089#1103#1076#1083#1080' '#1077#1085#1090#1080#1081#1072#1090' '
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object EditCustAcc: TEdit
        Left = 127
        Top = 44
        Width = 186
        Height = 21
        TabOrder = 1
        Text = 'EditCustAcc'
      end
      object EditResresveAcc: TEdit
        Left = 127
        Top = 72
        Width = 186
        Height = 21
        TabOrder = 2
        Text = 'EditResresveAcc'
      end
      object EditInterestAcc: TEdit
        Left = 127
        Top = 124
        Width = 186
        Height = 21
        TabOrder = 4
        Text = 'EditInterestAcc'
      end
      object EditDueLoanAcc: TEdit
        Left = 127
        Top = 206
        Width = 186
        Height = 21
        TabOrder = 5
        Text = 'EditDueLoanAcc'
      end
      object ChCust: TCheckBox
        Left = 316
        Top = 45
        Width = 16
        Height = 17
        Caption = 'ChCust'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object CHPrRes: TCheckBox
        Left = 316
        Top = 74
        Width = 14
        Height = 17
        Caption = 'CHPrRes'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object CHInt: TCheckBox
        Left = 316
        Top = 125
        Width = 14
        Height = 17
        Caption = 'CHInt'
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object ChDueLoan: TCheckBox
        Left = 316
        Top = 209
        Width = 14
        Height = 17
        Caption = 'ChDueLoan'
        TabOrder = 9
      end
      object EditLoanAcc: TEdit
        Left = 127
        Top = 16
        Width = 186
        Height = 21
        TabOrder = 0
        Text = 'EditCustAcc'
      end
      object ChLoan: TCheckBox
        Left = 316
        Top = 17
        Width = 16
        Height = 17
        Caption = 'ChBoxCust'
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
      object EditPrPurResAcc: TEdit
        Left = 127
        Top = 99
        Width = 186
        Height = 21
        TabOrder = 3
        Text = 'EditResresveAcc'
      end
      object ChPurRes: TCheckBox
        Left = 316
        Top = 102
        Width = 14
        Height = 17
        Caption = 'ChBoxRes'
        Checked = True
        State = cbChecked
        TabOrder = 11
      end
      object Edit1: TEdit
        Left = 128
        Top = 151
        Width = 186
        Height = 21
        TabOrder = 12
        Text = 'EditIResresveAcc'
      end
      object CheckBox1: TCheckBox
        Left = 315
        Top = 154
        Width = 14
        Height = 17
        Caption = 'CHPrRes'
        TabOrder = 13
      end
      object edit2: TEdit
        Left = 128
        Top = 178
        Width = 186
        Height = 21
        TabOrder = 14
        Text = 'edit2'
      end
      object CheckBox2: TCheckBox
        Left = 315
        Top = 181
        Width = 14
        Height = 17
        Caption = 'ChBoxRes'
        TabOrder = 15
      end
    end
    object Panel4: TPanel
      Left = 335
      Top = 2
      Width = 333
      Height = 236
      Align = alClient
      BevelInner = bvLowered
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label5: TLabel
        Left = 6
        Top = 42
        Width = 117
        Height = 11
        Caption = #1069#1077#1078'.'#1052#1103#1075'.'#1077#1097#1090#1080#1081#1072#1090' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 6
        Top = 70
        Width = 106
        Height = 11
        Caption = #1069#1077#1078#1080#1082#1084#1080#1096' '#1092#1072#1080#1079' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 6
        Top = 98
        Width = 97
        Height = 11
        Caption = #1041'.'#1050'. '#1070#1097#1076#1103#1083#1080#1082' '#1065#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 6
        Top = 122
        Width = 82
        Height = 11
        Caption = #1041'.'#1050'. '#1057#1089#1091#1076#1072' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 8
        Top = 149
        Width = 77
        Height = 11
        Caption = #1041'.'#1050'. '#1060#1072#1080#1079' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 8
        Top = 176
        Width = 80
        Height = 11
        Caption = #1050'.'#1061'.'#1070'.'#1052' '#1045#1097#1090#1080#1081#1072#1090
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label59: TLabel
        Left = 7
        Top = 16
        Width = 120
        Height = 11
        Caption = #1069#1077#1078'. '#1040#1076#1080' '#1077#1097#1090#1080#1081#1072#1090' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 7
        Top = 210
        Width = 84
        Height = 11
        Caption = #1041'.'#1050'. '#1069#1080#1088#1086#1074' '#1065#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object EditSecresAcc: TEdit
        Left = 125
        Top = 41
        Width = 186
        Height = 21
        TabOrder = 0
        Text = 'EditDueReserveAcc'
      end
      object ChSecPurRes: TCheckBox
        Left = 312
        Top = 42
        Width = 14
        Height = 17
        Caption = 'ChBoxDueRes'
        TabOrder = 6
      end
      object CHDueint: TCheckBox
        Left = 312
        Top = 69
        Width = 14
        Height = 16
        Caption = 'ChBoxDueInt'
        TabOrder = 7
      end
      object EditDueIntAcc: TEdit
        Left = 125
        Top = 67
        Width = 186
        Height = 21
        TabOrder = 1
        Text = 'EditDueInterestAcc'
      end
      object ChObl: TCheckBox
        Left = 312
        Top = 93
        Width = 14
        Height = 17
        Caption = 'ChBoxOutObl'
        TabOrder = 8
      end
      object ChOutLoan: TCheckBox
        Left = 312
        Top = 119
        Width = 14
        Height = 17
        Caption = 'CheckBox1'
        TabOrder = 9
      end
      object ChOutInt: TCheckBox
        Left = 311
        Top = 149
        Width = 14
        Height = 17
        Caption = 'CheckBox1'
        TabOrder = 10
      end
      object ChCrdLineObl: TCheckBox
        Left = 312
        Top = 176
        Width = 14
        Height = 17
        Caption = 'CheckBox1'
        TabOrder = 11
      end
      object EditCrdLineoblAcc: TEdit
        Left = 124
        Top = 175
        Width = 186
        Height = 21
        TabOrder = 5
        Text = 'EditCrdLineOblAcc'
      end
      object EditOutIntAcc: TEdit
        Left = 124
        Top = 146
        Width = 186
        Height = 21
        TabOrder = 4
        Text = 'EditOutInterestAcc'
      end
      object EditOutLoanAcc: TEdit
        Left = 124
        Top = 118
        Width = 186
        Height = 21
        TabOrder = 3
        Text = 'EditOutInterestAcc'
      end
      object EditOutOblAcc: TEdit
        Left = 124
        Top = 92
        Width = 186
        Height = 21
        TabOrder = 2
        Text = 'EditOutOblAcc'
      end
      object EditDueReserveAcc: TEdit
        Left = 124
        Top = 14
        Width = 186
        Height = 21
        TabOrder = 12
        Text = 'EditDueReserveAcc'
      end
      object ChSecRes: TCheckBox
        Left = 312
        Top = 17
        Width = 14
        Height = 16
        Caption = 'ChSecRes'
        TabOrder = 13
      end
      object EditOutPledgAcc: TEdit
        Left = 125
        Top = 203
        Width = 186
        Height = 21
        TabOrder = 14
        Text = 'EditPledgAcc'
        Visible = False
      end
      object ChPledg: TCheckBox
        Left = 312
        Top = 206
        Width = 14
        Height = 16
        Caption = 'ChBoxOutPlg'
        TabOrder = 15
        Visible = False
      end
    end
  end
  object BitBtnOk: TBitBtn
    Left = 507
    Top = 241
    Width = 75
    Height = 25
    Caption = #1043#1103#1073#1091#1083
    Default = True
    DoubleBuffered = True
    ModalResult = 1
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 1
  end
  object BitBtnCancel: TBitBtn
    Left = 582
    Top = 241
    Width = 75
    Height = 25
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
    Left = 8
    Top = 256
  end
end
