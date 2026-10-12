object AccountPropertiesForm: TAccountPropertiesForm
  Left = 228
  Top = 305
  ActiveControl = DBEditAccNo
  BorderStyle = bsToolWindow
  Caption = 'Insert & Edit Account'
  ClientHeight = 258
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object AccountGB: TGroupBox
    Left = 0
    Top = 0
    Width = 532
    Height = 173
    Align = alTop
    Caption = #1065#1077#1089#1072#1073
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 22
      Width = 37
      Height = 14
      Caption = #1065#1077#1089#1072#1073':'
    end
    object Label2: TLabel
      Left = 276
      Top = 17
      Width = 46
      Height = 14
      Caption = #1042#1072#1083#1081#1091#1090#1072':'
    end
    object Label3: TLabel
      Left = 9
      Top = 47
      Width = 83
      Height = 14
      Caption = #1041#1072#1083#1072#1085#1089' '#1097#1077#1089#1072#1073#1099':'
    end
    object Label5: TLabel
      Left = 9
      Top = 73
      Width = 84
      Height = 14
      Caption = #1040#1095#1099#1083#1084#1072' '#1090#1072#1088#1080#1093#1080':'
    end
    object Label6: TLabel
      Left = 9
      Top = 148
      Width = 74
      Height = 14
      Caption = #1065#1077#1089#1072#1073#1099#1085' '#1072#1076#1099':'
    end
    object Label13: TLabel
      Left = 9
      Top = 99
      Width = 97
      Height = 14
      Caption = #1065#1077#1089#1072#1073#1072#1090' '#1089#1080#1084#1074#1086#1083#1091':'
    end
    object Label14: TLabel
      Left = 9
      Top = 124
      Width = 41
      Height = 14
      Caption = #1060#1080#1083#1080#1072#1083':'
    end
    object Label7: TLabel
      Left = 302
      Top = 72
      Width = 70
      Height = 14
      Caption = #1046#1094#1090' '#1097#1077#1089#1072#1073#1099':'
    end
    object Label12: TLabel
      Left = 336
      Top = 99
      Width = 36
      Height = 14
      Caption = #1051#1080#1084#1080#1090':'
    end
    object DBEditAccNo: TDBEdit
      Left = 129
      Top = 17
      Width = 131
      Height = 22
      DataField = 'ACC_NO'
      DataSource = InsDataMod.DSAccount
      TabOrder = 0
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBEditCurrID: TDBEdit
      Left = 327
      Top = 17
      Width = 43
      Height = 22
      DataField = 'VAL_ACC'
      DataSource = InsDataMod.DSAccount
      TabOrder = 1
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBLookupCurr: TDBLookupComboBox
      Left = 378
      Top = 17
      Width = 149
      Height = 22
      DataField = 'VAL_ACC'
      DataSource = InsDataMod.DSAccount
      KeyField = 'VALUTE'
      ListField = 'VALU_NAME'
      ListSource = InsDataMod.CurrencyData
      TabOrder = 2
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBEditBalance1: TDBEdit
      Left = 129
      Top = 43
      Width = 44
      Height = 22
      DataField = 'BAL_CN1'
      DataSource = InsDataMod.DSAccount
      TabOrder = 3
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBLookupBalance1: TDBLookupComboBox
      Left = 173
      Top = 43
      Width = 273
      Height = 22
      DataField = 'BAL_CN1'
      DataSource = InsDataMod.DSAccount
      KeyField = 'BAL_CN'
      ListField = 'BALNAME'
      ListSource = InsDataMod.BalAccData
      TabOrder = 4
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DTPOpenDate: TDateTimePicker
      Left = 129
      Top = 69
      Width = 156
      Height = 21
      Date = 37357.618323692100000000
      Time = 37357.618323692100000000
      TabOrder = 5
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBLookupPairAcc: TDBLookupComboBox
      Left = 379
      Top = 69
      Width = 148
      Height = 22
      DataField = 'PAIR_ACC'
      DataSource = InsDataMod.DSAccount
      KeyField = 'ID'
      ListField = 'ACC_NO'
      ListSource = InsDataMod.PairAccountData
      TabOrder = 6
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBEditLimit: TDBEdit
      Left = 379
      Top = 95
      Width = 147
      Height = 22
      DataField = 'LIMIT'
      DataSource = InsDataMod.DSAccount
      TabOrder = 8
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBLookupSimotchet: TDBLookupComboBox
      Left = 129
      Top = 95
      Width = 156
      Height = 22
      DataField = 'SIM_OTCET'
      DataSource = InsDataMod.DSAccount
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = InsDataMod.DSReportSymbols
      TabOrder = 7
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBEdit4: TDBEdit
      Left = 129
      Top = 120
      Width = 62
      Height = 22
      DataField = 'FILIAL'
      DataSource = InsDataMod.DSAccount
      TabOrder = 9
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 192
      Top = 120
      Width = 178
      Height = 22
      DataField = 'FILIAL'
      DataSource = InsDataMod.DSAccount
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = InsDataMod.DSBranches
      TabOrder = 10
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBEditAccName: TDBEdit
      Left = 129
      Top = 143
      Width = 397
      Height = 22
      DataField = 'NAME'
      DataSource = InsDataMod.DSAccount
      TabOrder = 11
      OnKeyPress = DBEditAccNoKeyPress
    end
  end
  object DayStartStateGB: TGroupBox
    Left = 0
    Top = 173
    Width = 532
    Height = 53
    Align = alTop
    Caption = #1046#1072#1088#1080' '#1075#1072#1083#1099#1075
    TabOrder = 1
    object Label8: TLabel
      Left = 17
      Top = 23
      Width = 33
      Height = 14
      Caption = #1043#1072#1083#1099#1075':'
    end
    object Label9: TLabel
      Left = 293
      Top = 23
      Width = 64
      Height = 14
      Caption = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090':'
    end
    object DBEdit6: TDBEdit
      Left = 60
      Top = 18
      Width = 131
      Height = 23
      TabStop = False
      Color = clSilver
      DataField = 'OSTAT'
      DataSource = InsDataMod.DataTenostat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit7: TDBEdit
      Left = 370
      Top = 18
      Width = 131
      Height = 23
      TabStop = False
      Color = clSilver
      DataField = 'POK_OSTAT'
      DataSource = InsDataMod.DataTenostat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object hbErrorBox: THintBox
    Left = 9
    Top = 233
    Width = 319
    Height = 22
    AutoSize = True
    BevelOuter = bvNone
    Caption = 'hbErrorBox'
    TabOrder = 2
    Visible = False
    HintStyle = hsError
    Timeout = 4000
    BeepOnMessage = False
  end
  object btnCancel: TBitBtn
    Left = 443
    Top = 228
    Width = 80
    Height = 27
    Cancel = True
    Caption = #1048#1084#1090#1080#1085#1072
    DoubleBuffered = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = ButtonCancelClick
  end
  object btnOk: TBitBtn
    Left = 348
    Top = 228
    Width = 81
    Height = 27
    Caption = #1043#1103#1073#1091#1083
    DoubleBuffered = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = ButtonCommitClick
  end
end
