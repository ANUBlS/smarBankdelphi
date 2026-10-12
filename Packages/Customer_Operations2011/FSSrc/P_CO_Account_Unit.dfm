object P_CO_Account_Form: TP_CO_Account_Form
  Left = 108
  Top = 285
  BorderStyle = bsDialog
  Caption = 'P_CO_Account_Form'
  ClientHeight = 304
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonCommit: TButton
    Tag = 1
    Left = 296
    Top = 267
    Width = 75
    Height = 25
    Caption = '…аддаша йаз'
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
    Left = 392
    Top = 267
    Width = 75
    Height = 25
    Caption = '»мтина'
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
    Width = 497
    Height = 212
    Align = alTop
    Caption = 'ўесаб'
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
    object Label4: TLabel
      Left = 8
      Top = 68
      Width = 37
      Height = 13
      Caption = 'ћцшт€ри:'
    end
    object Label5: TLabel
      Left = 8
      Top = 92
      Width = 58
      Height = 13
      Caption = 'јчылма тарихи:'
    end
    object Label6: TLabel
      Left = 8
      Top = 185
      Width = 59
      Height = 13
      Caption = 'ўесабын ады:'
    end
    object Label13: TLabel
      Left = 8
      Top = 116
      Width = 81
      Height = 13
      Caption = 'ўесабат символу:'
    end
    object Label14: TLabel
      Left = 8
      Top = 139
      Width = 23
      Height = 13
      Caption = '‘илиал:'
    end
    object Label15: TLabel
      Left = 8
      Top = 163
      Width = 44
      Height = 13
      Caption = '—имволлары'
    end
    object Label12: TLabel
      Left = 312
      Top = 106
      Width = 24
      Height = 13
      Caption = 'Ћимит:'
    end
    object DBText8: TDBText
      Left = 120
      Top = 161
      Width = 65
      Height = 17
      Color = clBtnFace
      DataField = 'TIPACC'
      DataSource = P_DataModuleFS.AccountData
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
      ListSource = CurrencyData
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
      ListSource = CustomersData
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
      CalAlignment = dtaLeft
      Date = 37357.6183236921
      Time = 37357.6183236921
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
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
      ListSource = BranchesData
      TabOrder = 11
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
      ListSource = BalAccData
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
      TabOrder = 10
      OnChange = EditFilChange
      OnKeyPress = EditFilKeyPress
    end
    object EditValute: TEdit
      Tag = 1
      Left = 302
      Top = 15
      Width = 44
      Height = 21
      TabOrder = 1
      OnChange = EditValuteChange
      OnKeyPress = EditValuteKeyPress
    end
    object DBEditLimit: TEdit
      Tag = 1
      Left = 343
      Top = 104
      Width = 140
      Height = 21
      TabOrder = 8
      Text = '0'
      OnKeyPress = DBEditAccNameKeyPress
    end
    object DBEdit1: TDBEdit
      Left = 352
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 13
      Visible = False
    end
    object DBEdit2: TDBEdit
      Left = 176
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 14
      Visible = False
    end
    object DBEdit3: TDBEdit
      Left = 176
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 15
      Visible = False
    end
    object EditAccName: TEdit
      Tag = 1
      Left = 121
      Top = 180
      Width = 364
      Height = 21
      TabOrder = 12
      OnKeyPress = BrancheditKeyPress
    end
    object DBEdit5: TDBEdit
      Left = 176
      Top = 136
      Width = 121
      Height = 21
      TabOrder = 16
      Visible = False
    end
    object symboledit_: TEdit
      Tag = 1
      Left = 120
      Top = 112
      Width = 145
      Height = 21
      TabOrder = 9
      Text = '0'
      OnKeyPress = DBEditAccNameKeyPress
    end
    object AccountFlagsGB: TGroupBox
      Left = 399
      Top = 133
      Width = 89
      Height = 43
      TabOrder = 17
      object Button3: TButton
        Left = 9
        Top = 13
        Width = 71
        Height = 22
        Caption = '—имволлар ...'
        TabOrder = 0
        TabStop = False
        OnClick = Button3Click
      end
    end
  end
  object DayStartStateGB: TGroupBox
    Left = 0
    Top = 212
    Width = 497
    Height = 49
    Align = alTop
    Caption = '∆ари галыг'
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
      Caption = '√алыг:'
    end
    object Label9: TLabel
      Left = 272
      Top = 21
      Width = 53
      Height = 13
      Caption = '≈квивалент:'
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
    Left = 128
    Top = 272
    Width = 81
    Height = 21
    DataField = 'ID'
    DataSource = P_DataModuleFS.P_CustomersData
    TabOrder = 5
    Visible = False
  end
  object dbrepsymb: TDBLookupComboBox
    Tag = 1
    Left = 119
    Top = 111
    Width = 146
    Height = 21
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = P_DataModule.RepSymbData
    TabOrder = 6
  end
  object tipacc: TEdit
    Left = 8
    Top = 272
    Width = 121
    Height = 21
    TabOrder = 7
    Visible = False
  end
  object NLSLocalizer1: TNLSLocalizer
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 64
    Top = 200
  end
  object Currency: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select -1 as Valute, '#39'Ѕцтцн валйуталар'#39' as Valu_Name from Dual'
      'Union All'
      'select Valute, Valu_Name from Avalute'
      'Order by valute')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000600000056414C5554450100000000000900000056414C55
      5F4E414D45010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 38
    Top = 45
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
    Left = 72
    Top = 45
  end
  object BalAcc: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      
        'select '#39'Ѕцтцн баланс щесаблары'#39' as Bal_cn,'#39'Ѕцтцн баланс щесаблар' +
        'ы'#39' as BalName from dual'
      'Union All'
      'select * from '
      '('
      'select to_char(bal_cn), BalName from bal_spr1'
      'order by bal_cn'
      ')')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000600000042414C5F434E0100000000000700000042414C4E
      414D45010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 38
    Top = 81
    object BalAccBAL_CN: TStringField
      FieldName = 'BAL_CN'
      Size = 40
    end
    object BalAccBALNAME: TStringField
      FieldName = 'BALNAME'
      Size = 181
    end
  end
  object BalAccData: TDataSource
    DataSet = BalAcc
    Left = 72
    Top = 85
  end
  object Customers: TOracleDataSet
    SQL.Strings = (
      'select * from CUSTOMERS'
      'where close_dat is null'
      'order by ID')
    QBEDefinition.QBEFieldDefs = {
      0400000019000000020000004944010000000000050000004F505F4944010000
      000000080000004F50454E5F44415401000000000009000000434C4F53455F44
      41540100000000000A0000004E4552455A4944454E540100000000000A000000
      5052494E41445F4B4F44010000000000040000004E414D450100000000000A00
      000053484F52545F4E414D450100000000000A00000047524F55505F4B4C4945
      010000000000070000005649445F534F42010000000000070000004F52475F53
      4F420100000000000900000053464552415F444559010000000000060000004F
      545241534C010000000000090000004E414C4F475F4B4F440100000000000900
      00004B4F445F4F4B50524F01000000000003000000494E4E0100000000000700
      00004441545F4E414C010000000000090000004441545F555354415601000000
      00000300000042494B010000000000080000004F54565F4C49434F0100000000
      000C0000004F54565F50415353504F52540100000000000A0000004F54565F49
      53535545440100000000000A0000004F54565F49534441544501000000000006
      000000494E4E5F4E4E01000000000009000000435553545F5459504501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 60
    Top = 10
  end
  object CustomersData: TDataSource
    DataSet = Customers
    Left = 92
    Top = 10
  end
  object BranchesData: TDataSource
    DataSet = Branches
    Left = 72
    Top = 117
  end
  object Branches: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select -1 as ID, '#39'Ѕцтцн филиаллар'#39' as name from Dual'
      'Union All'
      'select ID, name from filial '
      'order by ID')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 37
    Top = 117
    object BranchesID: TFloatField
      FieldName = 'ID'
    end
    object BranchesNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object NLSLocalizer2: TNLSLocalizer
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 64
    Top = 200
  end
  object NLSLocalizer3: TNLSLocalizer
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 240
    Top = 168
  end
end
