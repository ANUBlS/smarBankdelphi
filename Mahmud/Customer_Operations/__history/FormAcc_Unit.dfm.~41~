object FormAccount: TFormAccount
  Left = 433
  Top = 287
  BorderStyle = bsDialog
  Caption = 'P_CO_Account_Form'
  ClientHeight = 307
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonCommit: TButton
    Tag = 1
    Left = 386
    Top = 279
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
    OnKeyPress = DBEditAccNameKeyPress
  end
  object ButtonCancel: TButton
    Left = 467
    Top = 279
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
    Left = 92
    Top = 222
    Width = 39
    Height = 21
    TabOrder = 3
    Visible = False
  end
  object AccountGB: TGroupBox
    Left = 0
    Top = 0
    Width = 550
    Height = 225
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
      Left = 312
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
      Top = 201
      Width = 59
      Height = 13
      Caption = #1065#1077#1089#1072#1073#1099#1085' '#1072#1076#1099':'
    end
    object Label13: TLabel
      Left = 8
      Top = 116
      Width = 58
      Height = 13
      Caption = #1040#1085#1072#1083#1080#1090#1080#1082' '#1082#1086#1076':'
    end
    object Label14: TLabel
      Left = 8
      Top = 150
      Width = 23
      Height = 13
      Caption = #1060#1080#1083#1080#1072#1083':'
    end
    object Label15: TLabel
      Left = 8
      Top = 174
      Width = 44
      Height = 13
      Caption = #1057#1080#1084#1074#1086#1083#1083#1072#1088#1099
    end
    object Label12: TLabel
      Left = 344
      Top = 90
      Width = 24
      Height = 13
      Caption = #1051#1080#1084#1080#1090':'
    end
    object DBText8: TDBText
      Left = 117
      Top = 174
      Width = 65
      Height = 17
      Color = clBtnFace
      DataField = 'TIPACC'
      DataSource = CO_DataMod.AccountData
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
      Left = 406
      Top = 14
      Width = 139
      Height = 21
      KeyField = 'VALUTE'
      ListField = 'VALU_NAME'
      ListSource = CurrencyData
      TabOrder = 2
      OnClick = DBLookupCurrClick
      OnKeyPress = DBLookupCurrKeyPress
    end
    object DBLookupCust: TDBLookupComboBox
      Tag = 1
      Left = 164
      Top = 64
      Width = 381
      Height = 21
      Enabled = False
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = CustomersData
      TabOrder = 6
      OnClick = DBLookupCustClick
      OnKeyPress = DBLookupCustKeyPress
    end
    object DTPOpenDate: TDateTimePicker
      Tag = 1
      Left = 117
      Top = 88
      Width = 174
      Height = 21
      Date = 37357.618323692100000000
      Time = 37357.618323692100000000
      TabOrder = 7
      OnKeyPress = DTPOpenDateKeyPress
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Tag = 1
      Left = 164
      Top = 146
      Width = 192
      Height = 21
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = BranchesData
      ParentFont = False
      TabOrder = 12
      OnClick = DBLookupComboBox4Click
      OnKeyPress = DBLookupComboBox4KeyPress
    end
    object DBLookupBalance1: TDBLookupComboBox
      Tag = 1
      Left = 164
      Top = 40
      Width = 381
      Height = 21
      KeyField = 'BAL_CN'
      ListField = 'BALNAME'
      ListSource = BalAccData
      TabOrder = 4
      OnClick = DBLookupBalance1Click
      OnKeyPress = DBLookupBalance1KeyPress
    end
    object EditBall: TSearchEdit
      Tag = 1
      Left = 117
      Top = 40
      Width = 44
      Height = 21
      TabOrder = 3
      OnChange = EditBallChange
      OnKeyPress = EditBallKeyPress
      DataSource = BalAccData
      SearchField = 'bal_cn'
    end
    object EditAcc: TEdit
      Tag = 1
      Left = 117
      Top = 14
      Width = 190
      Height = 21
      TabOrder = 0
      OnKeyPress = EditAccKeyPress
    end
    object EditCust: TEdit
      Tag = 1
      Left = 117
      Top = 64
      Width = 44
      Height = 21
      Enabled = False
      TabOrder = 5
      OnChange = EditCustChange
      OnKeyPress = EditCustKeyPress
    end
    object EditFil: TSearchEdit
      Tag = 1
      Left = 117
      Top = 146
      Width = 44
      Height = 21
      TabOrder = 11
      OnChange = EditFilChange
      OnKeyPress = EditFilKeyPress
      DataSource = BranchesData
      SearchField = 'id'
    end
    object EditValute: TSearchEdit
      Tag = 1
      Left = 358
      Top = 14
      Width = 44
      Height = 21
      TabOrder = 1
      OnChange = EditValuteChange
      OnKeyPress = EditValuteKeyPress
      DataSource = CurrencyData
      SearchField = 'valute'
    end
    object DBEditLimit: TEdit
      Tag = 1
      Left = 379
      Top = 88
      Width = 166
      Height = 21
      TabOrder = 8
      Text = '0'
      OnKeyPress = DBEditAccNameKeyPress
    end
    object DBEdit1: TDBEdit
      Left = 406
      Top = 14
      Width = 121
      Height = 21
      TabOrder = 15
      Visible = False
    end
    object DBEdit2: TDBEdit
      Left = 176
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 16
      Visible = False
    end
    object DBEdit3: TDBEdit
      Left = 176
      Top = 64
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 17
      Visible = False
    end
    object EditAccName: TEdit
      Tag = 1
      Left = 117
      Top = 195
      Width = 428
      Height = 21
      TabOrder = 14
      OnKeyPress = BrancheditKeyPress
    end
    object DBEdit5: TDBEdit
      Left = 176
      Top = 147
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 18
      Visible = False
    end
    object SymbolEdit_: TSearchEdit
      Tag = 1
      Left = 117
      Top = 112
      Width = 44
      Height = 21
      TabOrder = 9
      Text = '0'
      OnChange = SymbolEdit_Change
      OnKeyPress = DBEditAccNameKeyPress
      DataSource = CO_DataMod.RepSymbData
      SearchField = 'ID'
    end
    object AccountFlagsGB: TGroupBox
      Left = 409
      Top = 140
      Width = 136
      Height = 33
      TabOrder = 13
      object Button3: TButton
        Left = 9
        Top = 5
        Width = 120
        Height = 22
        Caption = #1057#1080#1084#1074#1086#1083#1083#1072#1088' ...'
        TabOrder = 0
        TabStop = False
        OnClick = Button3Click
      end
    end
    object DBRepSymb: TDBLookupComboBox
      Left = 164
      Top = 112
      Width = 381
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = CO_DataMod.RepSymbData
      TabOrder = 10
      OnCloseUp = DBRepSymbCloseUp
    end
  end
  object DayStartStateGB: TGroupBox
    Left = 0
    Top = 225
    Width = 550
    Height = 49
    Align = alTop
    Caption = #1046#1072#1088#1080' '#1075#1072#1083#1099#1075
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
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
    object dbedit6: TEdit
      Left = 106
      Top = 18
      Width = 124
      Height = 21
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0'
    end
    object dbedit7: TEdit
      Left = 346
      Top = 18
      Width = 124
      Height = 21
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
  end
  object custid: TDBEdit
    Left = 241
    Top = 280
    Width = 81
    Height = 21
    DataField = 'ID'
    TabOrder = 5
    Visible = False
  end
  object dbrepsymb1: TDBLookupComboBox
    Tag = 1
    Left = 328
    Top = 280
    Width = 56
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = CO_DataMod.RepSymbData
    ParentFont = False
    TabOrder = 6
    Visible = False
  end
  object tipacc: TEdit
    Left = 114
    Top = 280
    Width = 121
    Height = 21
    TabOrder = 7
    Visible = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 280
    Width = 161
    Height = 23
    BevelInner = bvLowered
    Caption = 'Avto hesab ( CTRL+H )'
    TabOrder = 8
    object SpeedButton1: TSpeedButton
      Left = 2
      Top = 2
      Width = 19
      Height = 19
      Flat = True
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF804F8FFFFFFFFFFFFFFFFFFFFFFF804
        04F8FFFFFFFFFFFFFFFFFFFFFFFF0404F8FFFFFFFFFFFFFFFFFFFFFFFFF804F8
        FFFFFFFFFFFFFFFFFFFFFFFFFF0404FFFFFFFFFFFFFFFFFFFFFFFFFFFF0404FF
        FFFF0404040404FFFFFFFFFFFF0404F8FFFFFFF8040404FFFFFFFFFFFFF80404
        F8FFF804040404FFFFFFFFFFFFFF04040404040404F804FFFFFFFFFFFFFFFFF8
        040404F8FFFF04FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = SpeedButton1Click
    end
  end
  object Currency: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select -1 as Valute, '#39'B'#252't'#252'n Valyutalar'#39' as Valu_Name from Dual'
      'Union All'
      'select Valute, Valu_Name from Avalute'
      'Order by valute')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C000000560041004C005500540045000100000000001200
      0000560041004C0055005F004E0041004D004500010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 14
    Top = 61
    object CurrencyVALUTE: TFloatField
      FieldName = 'VALUTE'
    end
    object CurrencyVALU_NAME: TWideStringField
      FieldName = 'VALU_NAME'
      Size = 31
    end
  end
  object CurrencyData: TDataSource
    DataSet = Currency
    Left = 48
    Top = 61
  end
  object BalAcc: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select '#39'-1'#39' as Bal_cn,'#39'   '#39' as BalName from dual'
      'Union All'
      'select * from '
      '('
      'select to_char(bal_cn), BalName from bal_spr1'
      'order by bal_cn'
      ')')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C000000420041004C005F0043004E000100000000000E00
      0000420041004C004E0041004D004500010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 14
    Top = 97
    object BalAccBAL_CN: TWideStringField
      FieldName = 'BAL_CN'
      Size = 42
    end
    object BalAccBALNAME: TWideStringField
      FieldName = 'BALNAME'
      Size = 181
    end
  end
  object BalAccData: TDataSource
    DataSet = BalAcc
    Left = 48
    Top = 101
  end
  object Customers: TOracleDataSet
    SQL.Strings = (
      'select * from CUSTOMERS'
      'where close_dat is null'
      'order by ID')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000001A00000004000000490044000100000000000A0000004F0050005F00
      49004400010000000000100000004F00500045004E005F004400410054000100
      000000001200000043004C004F00530045005F00440041005400010000000000
      140000004E004500520045005A004900440045004E0054000100000000001400
      00005000520049004E00410044005F004B004F00440001000000000008000000
      4E0041004D00450001000000000014000000530048004F00520054005F004E00
      41004D00450001000000000014000000470052004F00550050005F004B004C00
      490045000100000000000E0000005600490044005F0053004F00420001000000
      00000E0000004F00520047005F0053004F004200010000000000120000005300
      46004500520041005F004400450059000100000000000C0000004F0054005200
      410053004C00010000000000120000004E0041004C004F0047005F004B004F00
      4400010000000000120000004B004F0044005F004F004B00500052004F000100
      000000000600000049004E004E000100000000000E0000004400410054005F00
      4E0041004C00010000000000120000004400410054005F005500530054004100
      560001000000000006000000420049004B00010000000000100000004F005400
      56005F004C00490043004F00010000000000180000004F00540056005F005000
      41005300530050004F0052005400010000000000140000004F00540056005F00
      490053005300550045004400010000000000140000004F00540056005F004900
      530044004100540045000100000000001200000043005500530054005F005400
      5900500045000100000000000E0000004F004C0044005F0049004E004E000100
      0000000010000000430041005400450047004F0052005900010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 36
    Top = 26
  end
  object CustomersData: TDataSource
    DataSet = Customers
    Left = 68
    Top = 26
  end
  object BranchesData: TDataSource
    DataSet = Branches
    Left = 48
    Top = 133
  end
  object Branches: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      '--select -1 as ID, '#39'B'#252't'#252'n filiallar'#39' as name from Dual'
      '--Union All'
      'select ID, name from filial '
      'order by ID')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 13
    Top = 133
    object BranchesID: TFloatField
      FieldName = 'ID'
    end
    object BranchesNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object ActionList1: TActionList
    Left = 504
    Top = 232
    object AccountAutoCreat: TAction
      Caption = 'AccountAutoCreat'
      ShortCut = 16456
      OnExecute = AccountAutoCreatExecute
    end
  end
end
