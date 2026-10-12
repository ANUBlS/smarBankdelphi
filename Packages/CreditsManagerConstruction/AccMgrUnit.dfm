object AccMgrForm: TAccMgrForm
  Left = 358
  Top = 107
  BorderIcons = [biSystemMenu]
  Caption = 'AccMgrForm'
  ClientHeight = 306
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AccountGB: TGroupBox
    Left = 0
    Top = 0
    Width = 494
    Height = 212
    Align = alTop
    Caption = 'Hesab'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 55
      Height = 13
      Caption = 'Hesab N-si:'
    end
    object Label2: TLabel
      Left = 256
      Top = 16
      Width = 40
      Height = 13
      Caption = 'Valyuta:'
    end
    object Label3: TLabel
      Left = 8
      Top = 44
      Width = 69
      Height = 13
      Caption = 'Balans hesab'#305':'
    end
    object Label4: TLabel
      Left = 8
      Top = 68
      Width = 39
      Height = 13
      Caption = 'M'#252#351't'#601'ri:'
    end
    object Label5: TLabel
      Left = 8
      Top = 92
      Width = 61
      Height = 13
      Caption = 'A'#231#305'lma tarixi:'
    end
    object Label6: TLabel
      Left = 8
      Top = 185
      Width = 59
      Height = 13
      Caption = 'Hesab'#305'n ad'#305':'
    end
    object Label13: TLabel
      Left = 8
      Top = 116
      Width = 82
      Height = 13
      Caption = 'Hesabat simvolu:'
    end
    object Label14: TLabel
      Left = 8
      Top = 139
      Width = 24
      Height = 13
      Caption = 'Filial:'
    end
    object Label15: TLabel
      Left = 8
      Top = 163
      Width = 42
      Height = 13
      Caption = 'Simvollar'
    end
    object Label12: TLabel
      Left = 312
      Top = 106
      Width = 25
      Height = 13
      Caption = 'Limit:'
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
      ListSource = AvaluteDatSrc
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
      ListSource = CustomersDatSrc
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
      TabOrder = 7
      OnKeyPress = DTPOpenDateKeyPress
    end
    object DBLookupSimotchet: TDBLookupComboBox
      Tag = 1
      Left = 120
      Top = 112
      Width = 145
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = RepSymbolsDatSrc
      TabOrder = 8
      OnKeyPress = DBLookupSimotchetKeyPress
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Tag = 1
      Left = 167
      Top = 135
      Width = 179
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = FilialsDatSrc
      TabOrder = 10
      OnClick = DBLookupComboBox4Click
      OnKeyPress = DBLookupComboBox4KeyPress
    end
    object AccountFlagsGB: TGroupBox
      Left = 399
      Top = 133
      Width = 89
      Height = 43
      TabOrder = 12
      Visible = False
      object Button3: TButton
        Left = 9
        Top = 13
        Width = 71
        Height = 22
        Caption = 'Simvollar...'
        TabOrder = 0
      end
    end
    object DBLookupBalance1: TDBLookupComboBox
      Tag = 1
      Left = 164
      Top = 39
      Width = 325
      Height = 21
      KeyField = 'BAL_CN'
      ListField = 'BALNAME'
      ListSource = BalAccDatSrc
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
    object EditAccName: TEdit
      Tag = 1
      Left = 120
      Top = 180
      Width = 279
      Height = 21
      TabOrder = 11
      OnKeyPress = EditAccNameKeyPress
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
      Left = 343
      Top = 104
      Width = 140
      Height = 21
      TabOrder = 13
      Text = '0'
    end
  end
  object ButtonCommit: TButton
    Left = 336
    Top = 217
    Width = 75
    Height = 25
    Caption = 'Yadda saxla'
    TabOrder = 1
    OnClick = ButtonCommitClick
  end
  object ButtonCancel: TButton
    Left = 416
    Top = 217
    Width = 75
    Height = 25
    Caption = #304'mtina'
    ModalResult = 2
    TabOrder = 2
  end
  object Customers: TOracleDataSet
    SQL.Strings = (
      'select id,name from customers')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 134
    Top = 204
    object CustomersID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object CustomersNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object BalAcc: TOracleDataSet
    SQL.Strings = (
      'SELECT bal_cn,'
      '        balname'
      '  FROM bal_spr1')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C000000420041004C005F0043004E000100000000000E00
      0000420041004C004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 64
    Top = 204
    object BalAccBAL_CN: TFloatField
      FieldName = 'BAL_CN'
      Required = True
    end
    object BalAccBALNAME: TWideStringField
      FieldName = 'BALNAME'
      Size = 181
    end
  end
  object Avalute: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name from avalute')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C000000560041004C005500540045000100000000001200
      0000560041004C0055005F004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 103
    Top = 204
    object AvaluteVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object AvaluteVALU_NAME: TWideStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
  end
  object CustomersDatSrc: TDataSource
    DataSet = Customers
    Left = 156
    Top = 252
  end
  object BalAccDatSrc: TDataSource
    DataSet = BalAcc
    Left = 72
    Top = 252
  end
  object AvaluteDatSrc: TDataSource
    DataSet = Avalute
    Left = 111
    Top = 260
  end
  object Filials: TOracleDataSet
    SQL.Strings = (
      'SELECT id,name'
      '  FROM filial')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 166
    Top = 196
    object FilialsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FilialsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object FilialsDatSrc: TDataSource
    DataSet = Filials
    Left = 202
    Top = 252
  end
  object ReportSymbol: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select * from REPORT_SYMBOL')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 496
    Top = 328
  end
  object ReportSymbolData: TDataSource
    DataSet = ReportSymbol
    Left = 496
    Top = 376
  end
  object OracleDataSet3: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select * from REPORT_SYMBOL')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 496
    Top = 328
  end
  object DataSource6: TDataSource
    DataSet = OracleDataSet3
    Left = 496
    Top = 376
  end
  object OracleDataSet6: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select * from REPORT_SYMBOL')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 496
    Top = 328
  end
  object RepSymbols: TOracleDataSet
    SQL.Strings = (
      'select * from REPORT_SYMBOL'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 206
    Top = 198
    object RepSymbolsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object RepSymbolsNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 256
    end
  end
  object RepSymbolsDatSrc: TDataSource
    DataSet = RepSymbols
    Left = 249
    Top = 255
  end
  object CC_GENERAL: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CC_GENERAL'
    ParameterMode = pmNamed
    Cursor = crSQLWait
    Left = 259
    Top = 200
  end
end
