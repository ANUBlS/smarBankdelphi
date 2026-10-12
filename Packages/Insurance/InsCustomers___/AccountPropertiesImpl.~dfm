object AccountPropertiesForm: TAccountPropertiesForm
  Left = 228
  Top = 305
  ActiveControl = DBEditAccNo
  BorderStyle = bsToolWindow
  Caption = 'Insert & Edit Account'
  ClientHeight = 240
  ClientWidth = 494
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
  TextHeight = 13
  object AccountGB: TGroupBox
    Left = 0
    Top = 0
    Width = 494
    Height = 161
    Align = alTop
    Caption = 'ўесаб'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 34
      Height = 13
      Caption = 'ўесаб:'
    end
    object Label2: TLabel
      Left = 256
      Top = 16
      Width = 38
      Height = 13
      Caption = '¬алйута:'
    end
    object Label3: TLabel
      Left = 8
      Top = 44
      Width = 69
      Height = 13
      Caption = 'Ѕаланс щесабы:'
    end
    object Label5: TLabel
      Left = 8
      Top = 68
      Width = 58
      Height = 13
      Caption = 'јчылма тарихи:'
    end
    object Label6: TLabel
      Left = 8
      Top = 137
      Width = 59
      Height = 13
      Caption = 'ўесабын ады:'
    end
    object Label13: TLabel
      Left = 8
      Top = 92
      Width = 81
      Height = 13
      Caption = 'ўесабат символу:'
    end
    object Label14: TLabel
      Left = 8
      Top = 115
      Width = 23
      Height = 13
      Caption = '‘илиал:'
    end
    object Label7: TLabel
      Left = 280
      Top = 67
      Width = 53
      Height = 13
      Caption = '∆цт щесабы:'
    end
    object Label12: TLabel
      Left = 312
      Top = 92
      Width = 24
      Height = 13
      Caption = 'Ћимит:'
    end
    object DBEditAccNo: TDBEdit
      Left = 120
      Top = 16
      Width = 121
      Height = 21
      DataField = 'ACC_NO'
      DataSource = InsDataMod.DSAccount
      TabOrder = 0
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBEditCurrID: TDBEdit
      Left = 304
      Top = 16
      Width = 40
      Height = 21
      DataField = 'VAL_ACC'
      DataSource = InsDataMod.DSAccount
      TabOrder = 1
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBLookupCurr: TDBLookupComboBox
      Left = 351
      Top = 16
      Width = 138
      Height = 21
      DataField = 'VAL_ACC'
      DataSource = InsDataMod.DSAccount
      KeyField = 'VALUTE'
      ListField = 'VALU_NAME'
      ListSource = InsDataMod.CurrencyData
      TabOrder = 2
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBEditBalance1: TDBEdit
      Left = 120
      Top = 40
      Width = 41
      Height = 21
      DataField = 'BAL_CN1'
      DataSource = InsDataMod.DSAccount
      TabOrder = 3
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBLookupBalance1: TDBLookupComboBox
      Left = 161
      Top = 40
      Width = 253
      Height = 21
      DataField = 'BAL_CN1'
      DataSource = InsDataMod.DSAccount
      KeyField = 'BAL_CN'
      ListField = 'BALNAME'
      ListSource = InsDataMod.BalAccData
      TabOrder = 4
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DTPOpenDate: TDateTimePicker
      Left = 120
      Top = 64
      Width = 145
      Height = 21
      CalAlignment = dtaLeft
      Date = 37357.6183236921
      Time = 37357.6183236921
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 5
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBLookupPairAcc: TDBLookupComboBox
      Left = 352
      Top = 64
      Width = 137
      Height = 21
      DataField = 'PAIR_ACC'
      DataSource = InsDataMod.DSAccount
      KeyField = 'ID'
      ListField = 'ACC_NO'
      ListSource = InsDataMod.PairAccountData
      TabOrder = 6
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBEditLimit: TDBEdit
      Left = 352
      Top = 88
      Width = 136
      Height = 21
      DataField = 'LIMIT'
      DataSource = InsDataMod.DSAccount
      TabOrder = 8
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBLookupSimotchet: TDBLookupComboBox
      Left = 120
      Top = 88
      Width = 145
      Height = 21
      DataField = 'SIM_OTCET'
      DataSource = InsDataMod.DSAccount
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = InsDataMod.DSReportSymbol
      TabOrder = 7
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBEdit4: TDBEdit
      Left = 120
      Top = 111
      Width = 57
      Height = 21
      DataField = 'FILIAL'
      DataSource = InsDataMod.DSAccount
      TabOrder = 9
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 178
      Top = 111
      Width = 166
      Height = 21
      DataField = 'FILIAL'
      DataSource = InsDataMod.DSAccount
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = InsDataMod.DSBranches
      TabOrder = 10
      OnKeyPress = DBEditAccNoKeyPress
    end
    object DBEditAccName: TDBEdit
      Left = 120
      Top = 133
      Width = 368
      Height = 21
      DataField = 'NAME'
      DataSource = InsDataMod.DSAccount
      TabOrder = 11
      OnKeyPress = DBEditAccNoKeyPress
    end
  end
  object DayStartStateGB: TGroupBox
    Left = 0
    Top = 161
    Width = 494
    Height = 49
    Align = alTop
    Caption = '∆ари галыг'
    TabOrder = 1
    object Label8: TLabel
      Left = 16
      Top = 21
      Width = 27
      Height = 13
      Caption = '√алыг:'
    end
    object Label9: TLabel
      Left = 272
      Top = 21
      Width = 53
      Height = 13
      Caption = '≈квивалент:'
    end
    object DBEdit6: TDBEdit
      Left = 56
      Top = 17
      Width = 121
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'OSTAT'
      DataSource = InsDataMod.DataTenostat
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
      DataSource = InsDataMod.DataTenostat
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
  object hbErrorBox: THintBox
    Left = 8
    Top = 216
    Width = 297
    Height = 21
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
    Left = 411
    Top = 212
    Width = 75
    Height = 25
    Cancel = True
    Caption = '»мтина'
    TabOrder = 4
    OnClick = ButtonCancelClick
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
  end
  object btnOk: TBitBtn
    Left = 323
    Top = 212
    Width = 75
    Height = 25
    Caption = '√€бул'
    TabOrder = 3
    OnClick = ButtonCommitClick
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
  end
end
