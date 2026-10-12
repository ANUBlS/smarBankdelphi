object FormExAccModify: TFormExAccModify
  Left = 645
  Top = 236
  BorderStyle = bsDialog
  Caption = 'AddAccount'
  ClientHeight = 367
  ClientWidth = 272
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 272
    Height = 367
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object LabelVal: TLabel
      Left = 6
      Top = 41
      Width = 57
      Height = 14
      Caption = #1042#1072#1083#1081#1091#1090#1072#1089#1099
    end
    object Label1: TLabel
      Left = 5
      Top = 80
      Width = 151
      Height = 14
      Caption = #1052#1072#1085#1072#1090' '#1097#1077#1089#1072#1073#1099' ('#1072#1083#1099#1096'/'#1089#1072#1090#1099#1096')'
    end
    object Label2: TLabel
      Left = 4
      Top = 120
      Width = 162
      Height = 14
      Caption = #1042#1072#1083#1081#1091#1090#1072' '#1097#1077#1089#1072#1073#1099' ('#1072#1083#1099#1096'/'#1089#1072#1090#1099#1096')'
    end
    object Label3: TLabel
      Left = 5
      Top = 161
      Width = 142
      Height = 14
      Caption = #1050#1088#1077#1076#1080#1090' '#1097#1077#1089#1072#1073'('#1101#1103#1083#1080#1088'/'#1079#1103#1088#1103#1088')'
    end
    object Label4: TLabel
      Left = 5
      Top = 201
      Width = 140
      Height = 14
      Caption = #1044#1077#1073#1080#1090' '#1097#1077#1089#1072#1073' ('#1101#1103#1083#1080#1088'/'#1079#1103#1088#1103#1088')'
    end
    object Label5: TLabel
      Left = 6
      Top = 3
      Width = 38
      Height = 14
      Caption = #1060#1080#1083#1080#1072#1083
    end
    object Label6: TLabel
      Left = 6
      Top = 243
      Width = 114
      Height = 14
      Caption = #1050#1072#1089#1089#1072' '#1097#1077#1089#1072#1073#1099'('#1084#1072#1085#1072#1090')'
    end
    object Label8: TLabel
      Left = 5
      Top = 282
      Width = 125
      Height = 14
      Caption = #1050#1072#1089#1089#1072' '#1097#1077#1089#1072#1073#1099'('#1074#1072#1083#1081#1091#1090#1072')'
    end
    object DBCBoxValute: TDBLookupComboBox
      Left = 3
      Top = 55
      Width = 254
      Height = 22
      KeyField = 'VALUTE'
      ListField = 'VAL_NAME'
      ListSource = DataModExch.DSExchRateAll
      TabOrder = 1
      OnClick = DBCBoxValuteClick
    end
    object BtnOk: TBitBtn
      Left = 3
      Top = 333
      Width = 259
      Height = 28
      Caption = #1043#1103#1073#1091#1083
      DoubleBuffered = True
      Glyph.Data = {
        66010000424D6601000000000000760000002800000016000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555005555555555555555555555005555555555555555555555005555
        5555544555555555550055555555422455555555550055555554222245555555
        5500555555422222245555555500555554222A2222455555550055555222A5A2
        22455555550055555A2A555A222455555500555555A55555A222455555005555
        555555555A222455550055555555555555A222455500555555555555555A2224
        55005555555555555555A222450055555555555555555A224500555555555555
        555555A225005555555555555555555A55005555555555555555555555005555
        55555555555555555500}
      ParentDoubleBuffered = False
      TabOrder = 7
      OnClick = BtnOkClick
    end
    object CB_Purchase_Acc_No: TDBLookupComboBox
      Left = 3
      Top = 95
      Width = 254
      Height = 22
      KeyField = 'ID'
      ListField = 'ACC_NO'
      ListSource = DataModExch.DSAcc_main_debt
      TabOrder = 2
    end
    object CB_Selling_Acc_No: TDBLookupComboBox
      Left = 3
      Top = 136
      Width = 254
      Height = 22
      KeyField = 'ID'
      ListField = 'ACC_NO'
      ListSource = DataModExch.DSAcc_main_cred
      TabOrder = 3
    end
    object CB_Profit_Acc_No: TDBLookupComboBox
      Left = 3
      Top = 176
      Width = 254
      Height = 22
      KeyField = 'ID'
      ListField = 'ACC_NO'
      ListSource = DataModExch.DSAcc_child_debt
      TabOrder = 4
    end
    object CB_Harm_Acc_No: TDBLookupComboBox
      Left = 4
      Top = 216
      Width = 254
      Height = 22
      KeyField = 'ID'
      ListField = 'ACC_NO'
      ListSource = DataModExch.DSAcc_child_cred
      TabOrder = 5
    end
    object all_filial: TDBLookupComboBox
      Left = 3
      Top = 16
      Width = 254
      Height = 22
      Enabled = False
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DataModExch.DS_Filial
      TabOrder = 0
    end
    object CB_Cash_Acc_No: TDBLookupComboBox
      Left = 3
      Top = 258
      Width = 254
      Height = 22
      KeyField = 'ID'
      ListField = 'ACC_NO'
      ListSource = DataModExch.DSCashDebet
      TabOrder = 6
    end
  end
  object CB_Pur_Acc_No: TDBLookupComboBox
    Left = 3
    Top = 299
    Width = 254
    Height = 21
    KeyField = 'ID'
    ListField = 'ACC_NO'
    ListSource = DataModExch.DSCashKredit
    TabOrder = 1
  end
end
