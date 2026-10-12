object P_AccSettings: TP_AccSettings
  Left = 420
  Top = 594
  BorderStyle = bsDialog
  Caption = 'P_AccSettings'
  ClientHeight = 242
  ClientWidth = 656
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object AccountGB: TGroupBox
    Tag = 1
    Left = 0
    Top = 0
    Width = 656
    Height = 169
    Align = alTop
    Caption = #1065#1077#1089#1072#1073
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 506
    object Label2: TLabel
      Left = 16
      Top = 16
      Width = 46
      Height = 14
      Caption = #1042#1072#1083#1081#1091#1090#1072':'
    end
    object Label3: TLabel
      Left = 8
      Top = 44
      Width = 83
      Height = 14
      Caption = #1041#1072#1083#1072#1085#1089' '#1097#1077#1089#1072#1073#1099':'
    end
    object Label4: TLabel
      Left = 8
      Top = 68
      Width = 49
      Height = 14
      Caption = #1052#1094#1096#1090#1103#1088#1080':'
    end
    object Label5: TLabel
      Left = 8
      Top = 92
      Width = 84
      Height = 14
      Caption = #1040#1095#1099#1083#1084#1072' '#1090#1072#1088#1080#1093#1080':'
    end
    object Label13: TLabel
      Left = 8
      Top = 116
      Width = 97
      Height = 14
      Caption = #1065#1077#1089#1072#1073#1072#1090' '#1089#1080#1084#1074#1086#1083#1091':'
    end
    object Label14: TLabel
      Left = 8
      Top = 139
      Width = 41
      Height = 14
      Caption = #1060#1080#1083#1080#1072#1083':'
    end
    object Label12: TLabel
      Left = 312
      Top = 106
      Width = 36
      Height = 14
      Caption = #1051#1080#1084#1080#1090':'
    end
    object DBLookupCurr: TDBLookupComboBox
      Tag = 1
      Left = 166
      Top = 14
      Width = 138
      Height = 22
      KeyField = 'VALUTE'
      ListField = 'VALU_NAME'
      ListSource = CurrencyData
      TabOrder = 1
      OnClick = DBLookupCurrClick
      OnKeyPress = DBLookupCurrKeyPress
    end
    object DBLookupCust: TDBLookupComboBox
      Tag = 1
      Left = 166
      Top = 64
      Width = 323
      Height = 22
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = CustomersData
      TabOrder = 5
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
      TabOrder = 6
      OnKeyPress = DTPOpenDateKeyPress
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Tag = 1
      Left = 167
      Top = 136
      Width = 179
      Height = 22
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = Branchdata
      TabOrder = 10
      OnClick = DBLookupComboBox4Click
      OnKeyPress = DBLookupComboBox4KeyPress
    end
    object DBLookupBalance1: TDBLookupComboBox
      Tag = 1
      Left = 164
      Top = 39
      Width = 325
      Height = 22
      KeyField = 'BAL_CN'
      ListField = 'BALNAME'
      ListSource = BalAccData
      TabOrder = 3
      OnClick = DBLookupBalance1Click
      OnKeyPress = DBLookupBalance1KeyPress
    end
    object EditBall: TEdit
      Tag = 1
      Left = 119
      Top = 40
      Width = 44
      Height = 22
      TabOrder = 2
      OnChange = EditBallChange
      OnKeyPress = EditBallKeyPress
    end
    object EditCust: TEdit
      Tag = 1
      Left = 119
      Top = 64
      Width = 44
      Height = 22
      TabOrder = 4
      OnChange = EditCustChange
      OnKeyPress = EditCustKeyPress
    end
    object EditFil: TEdit
      Tag = 1
      Left = 120
      Top = 136
      Width = 44
      Height = 22
      TabOrder = 9
      OnChange = EditFilChange
      OnKeyPress = EditFilKeyPress
    end
    object EditValute: TEdit
      Tag = 1
      Left = 120
      Top = 15
      Width = 43
      Height = 22
      TabOrder = 0
      OnChange = EditValuteChange
      OnKeyPress = EditValuteKeyPress
    end
    object DBEditLimit: TEdit
      Tag = 1
      Left = 343
      Top = 104
      Width = 140
      Height = 22
      TabOrder = 8
      Text = '0'
      OnKeyPress = DBEditLimitKeyPress
    end
    object DBEdit1: TDBEdit
      Left = 307
      Top = 14
      Width = 121
      Height = 22
      DataField = 'VALU_NAME'
      DataSource = CurrencyData
      TabOrder = 11
      Visible = False
    end
    object DBEdit2: TDBEdit
      Left = 504
      Top = 39
      Width = 121
      Height = 22
      DataField = 'BALNAME'
      DataSource = BalAccData
      TabOrder = 12
      Visible = False
    end
    object DBEdit3: TDBEdit
      Left = 504
      Top = 67
      Width = 121
      Height = 22
      DataField = 'NAME'
      DataSource = CustomersData
      TabOrder = 13
      Visible = False
    end
    object symboledit: TEdit
      Tag = 1
      Left = 120
      Top = 112
      Width = 145
      Height = 22
      TabOrder = 7
      OnKeyPress = symboleditKeyPress
    end
    object DBEdit5: TDBEdit
      Left = 349
      Top = 136
      Width = 121
      Height = 22
      DataField = 'NAME'
      DataSource = Branchdata
      TabOrder = 14
      Visible = False
    end
  end
  object Button1: TButton
    Left = 487
    Top = 175
    Width = 75
    Height = 25
    Caption = #1043#1103#1073#1091#1083
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 574
    Top = 175
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
    OnClick = Button2Click
  end
  object Currency: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select -1 as Valute, '#39'B'#252't'#252'n valyutalar'#39' as Valu_Name from Dual'
      'Union All'
      'select Valute, Valu_Name from Avalute'
      'Order by valute')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C000000560041004C005500540045000100000000001200
      0000560041004C0055005F004E0041004D004500010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 352
    Top = 184
    object CurrencyVALUTE: TFloatField
      FieldName = 'VALUTE'
    end
    object CurrencyVALU_NAME: TStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
  end
  object CurrencyData: TDataSource
    DataSet = Currency
    Left = 384
    Top = 184
  end
  object Customers: TOracleDataSet
    SQL.Strings = (
      'select * from CUSTOMERS'
      'where close_dat is null'
      'order by ID')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000001B00000004000000490044000100000000000A0000004F0050005F00
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
      0000000010000000430041005400450047004F00520059000100000000000200
      00005000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 236
    Top = 189
  end
  object CustomersData: TDataSource
    DataSet = Customers
    Left = 292
    Top = 186
  end
  object Branch: TOracleDataSet
    SQL.Strings = (
      'select -1 as ID, '#39'B'#252't'#252'n filiallar'#39' as name from Dual'
      'Union All'
      'select ID, name from filial '
      'order by ID'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 128
    Top = 187
  end
  object Branchdata: TDataSource
    DataSet = Branch
    Left = 176
    Top = 187
  end
  object BalAccData: TDataSource
    DataSet = BalAcc
    Left = 72
    Top = 184
  end
  object BalAcc: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      
        'select '#39'B'#252't'#252'n balans hesablar'#305#39' as Bal_cn,'#39'B'#252't'#252'n balans hesablar' +
        #305#39' as BalName from dual'
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
    Left = 24
    Top = 185
    object BalAccBAL_CN: TStringField
      FieldName = 'BAL_CN'
      Size = 40
    end
    object BalAccBALNAME: TStringField
      FieldName = 'BALNAME'
      Size = 181
    end
  end
end
