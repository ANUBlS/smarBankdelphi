object FormAccBuyers: TFormAccBuyers
  Left = 547
  Top = 543
  BorderStyle = bsDialog
  Caption = #1065#1077#1089#1072#1073#1099#1085' '#1103#1083#1072#1074#1103' '#1077#1076#1080#1083#1084#1103#1089#1080
  ClientHeight = 303
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonCommit: TButton
    Left = 312
    Top = 269
    Width = 75
    Height = 25
    Caption = #1049#1072#1076#1076#1072#1096#1072' '#1081#1072#1079
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = ButtonCommitClick
  end
  object ButtonCancel: TButton
    Left = 400
    Top = 269
    Width = 75
    Height = 25
    Caption = #1048#1084#1090#1080#1085#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = ButtonCancelClick
  end
  object buyerid: TEdit
    Left = 76
    Top = 270
    Width = 39
    Height = 21
    TabOrder = 4
    Visible = False
  end
  object AccountGB: TGroupBox
    Left = 0
    Top = 0
    Width = 492
    Height = 212
    Align = alTop
    Caption = #1065#1077#1089#1072#1073
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 34
      Height = 13
      Caption = #1065#1077#1089#1072#1073':'
    end
    object Label2: TLabel
      Left = 256
      Top = 16
      Width = 38
      Height = 13
      Caption = #1042#1072#1083#1081#1091#1090#1072':'
    end
    object Label3: TLabel
      Left = 8
      Top = 44
      Width = 69
      Height = 13
      Caption = #1041#1072#1083#1072#1085#1089' '#1097#1077#1089#1072#1073#1099':'
    end
    object Label4: TLabel
      Left = 8
      Top = 68
      Width = 37
      Height = 13
      Caption = #1052#1094#1096#1090#1103#1088#1080':'
    end
    object Label5: TLabel
      Left = 8
      Top = 92
      Width = 58
      Height = 13
      Caption = #1040#1095#1099#1083#1084#1072' '#1090#1072#1088#1080#1093#1080':'
    end
    object Label6: TLabel
      Left = 8
      Top = 185
      Width = 59
      Height = 13
      Caption = #1065#1077#1089#1072#1073#1099#1085' '#1072#1076#1099':'
    end
    object Label13: TLabel
      Left = 8
      Top = 116
      Width = 81
      Height = 13
      Caption = #1065#1077#1089#1072#1073#1072#1090' '#1089#1080#1084#1074#1086#1083#1091':'
      Visible = False
    end
    object Label14: TLabel
      Left = 8
      Top = 139
      Width = 23
      Height = 13
      Caption = #1060#1080#1083#1080#1072#1083':'
    end
    object Label15: TLabel
      Left = 8
      Top = 163
      Width = 44
      Height = 13
      Caption = #1057#1080#1084#1074#1086#1083#1083#1072#1088#1099
      Visible = False
    end
    object Label12: TLabel
      Left = 312
      Top = 106
      Width = 24
      Height = 13
      Caption = #1051#1080#1084#1080#1090':'
      Visible = False
    end
    object DBText1: TDBText
      Left = 120
      Top = 161
      Width = 65
      Height = 17
      Color = clBtnFace
      DataField = 'TIPACC'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object DBLookupCurr: TDBLookupComboBox
      Tag = 1
      Left = 350
      Top = 14
      Width = 138
      Height = 21
      KeyField = 'VALUTE'
      ListField = 'VALU_NAME'
      ListSource = DataMod_Buyers.CurrencyData
      TabOrder = 2
      OnClick = DBLookupCurrClick
      OnKeyPress = DBLookupCurrKeyPress
    end
    object DBLookupCust: TDBLookupComboBox
      Tag = 1
      Left = 166
      Top = 64
      Width = 323
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DataMod_Buyers.CustomersData
      TabOrder = 6
      OnClick = DBLookupCustClick
      OnKeyPress = DBLookupCustKeyPress
    end
    object DTPOpenDate: TDateTimePicker
      Tag = 1
      Left = 120
      Top = 88
      Width = 145
      Height = 21
      Date = 37357.618323692100000000
      Time = 37357.618323692100000000
      Enabled = False
      TabOrder = 7
      OnKeyPress = DTPOpenDateKeyPress
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Tag = 1
      Left = 167
      Top = 135
      Width = 179
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DataMod_Buyers.Branchdata
      TabOrder = 10
      OnClick = DBLookupComboBox4Click
      OnKeyPress = DBLookupComboBox4KeyPress
    end
    object DBLookupBalance1: TDBLookupComboBox
      Tag = 1
      Left = 164
      Top = 39
      Width = 325
      Height = 21
      KeyField = 'BAL_CN'
      ListField = 'BALNAME'
      ListSource = DataMod_Buyers.BalAccData
      TabOrder = 4
      OnClick = DBLookupBalance1Click
      OnKeyPress = DBLookupBalance1KeyPress
    end
    object EditBall: TEdit
      Tag = 1
      Left = 119
      Top = 40
      Width = 44
      Height = 21
      TabOrder = 3
      OnChange = EditBallChange
      OnKeyPress = EditBallKeyPress
    end
    object EditAcc: TEdit
      Tag = 1
      Left = 119
      Top = 13
      Width = 134
      Height = 21
      TabOrder = 0
      OnKeyPress = EditAccKeyPress
    end
    object EditCust: TEdit
      Tag = 1
      Left = 119
      Top = 64
      Width = 44
      Height = 21
      TabOrder = 5
      OnChange = EditCustChange
      OnKeyPress = EditCustKeyPress
    end
    object EditFil: TEdit
      Tag = 1
      Left = 120
      Top = 136
      Width = 44
      Height = 21
      TabOrder = 9
      OnChange = EditFilChange
      OnKeyPress = EditBallKeyPress
    end
    object EditValute: TEdit
      Tag = 1
      Left = 302
      Top = 15
      Width = 44
      Height = 21
      TabOrder = 1
      OnChange = EditValuteChange
      OnKeyPress = EditBallKeyPress
    end
    object DBEditLimit: TEdit
      Tag = 1
      Left = 343
      Top = 104
      Width = 140
      Height = 21
      TabOrder = 8
      Text = '0'
      Visible = False
      OnKeyPress = DBEditAccNameKeyPress
    end
    object DBEdit1: TDBEdit
      Left = 368
      Top = 136
      Width = 121
      Height = 21
      TabOrder = 12
      Visible = False
    end
    object DBEdit2: TDBEdit
      Left = 176
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 13
      Visible = False
    end
    object DBEdit3: TDBEdit
      Left = 176
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 14
      Visible = False
    end
    object EditAccName: TEdit
      Tag = 1
      Left = 121
      Top = 180
      Width = 364
      Height = 21
      TabOrder = 11
      OnKeyPress = BrancheditKeyPress
    end
    object DBEdit5: TDBEdit
      Left = 176
      Top = 136
      Width = 121
      Height = 21
      TabOrder = 15
      Visible = False
    end
    object symboledit_: TEdit
      Left = 120
      Top = 112
      Width = 145
      Height = 21
      TabOrder = 16
      Text = 'symboledit_'
      Visible = False
    end
  end
  object DayStartStateGB: TGroupBox
    Left = 0
    Top = 212
    Width = 492
    Height = 49
    Align = alTop
    Caption = #1046#1072#1088#1080' '#1075#1072#1083#1099#1075
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label8: TLabel
      Left = 16
      Top = 21
      Width = 27
      Height = 13
      Caption = #1043#1072#1083#1099#1075':'
    end
    object Label9: TLabel
      Left = 272
      Top = 21
      Width = 53
      Height = 13
      Caption = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090':'
    end
    object DBEdit6: TDBEdit
      Left = 56
      Top = 17
      Width = 121
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'OSTAT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit7: TDBEdit
      Left = 344
      Top = 17
      Width = 121
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'POK_OSTAT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
end
