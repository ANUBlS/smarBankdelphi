object FrmIEAddEdit: TFrmIEAddEdit
  Left = 431
  Top = 232
  BorderIcons = []
  Caption = 'FrmIEAddEdit'
  ClientHeight = 275
  ClientWidth = 269
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 110
    Top = 247
    Width = 75
    Height = 25
    Caption = #1043#1103#1073#1091#1083
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 193
    Top = 247
    Width = 75
    Height = 25
    Caption = #1048#1084#1090#1080#1085#1072
    TabOrder = 1
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 269
    Height = 242
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 5
      Top = 69
      Width = 27
      Height = 13
      Caption = #1060#1080#1083#1080#1072#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 5
      Top = 109
      Width = 43
      Height = 13
      Caption = #1042#1072#1083#1081#1091#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 5
      Top = 152
      Width = 53
      Height = 13
      Caption = #1065#1077#1089#1072#1073' '#8470
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 6
      Top = 196
      Width = 68
      Height = 13
      Caption = #1065#1077#1089#1072#1073#1099#1085' '#1072#1076#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 161
      Top = 109
      Width = 80
      Height = 13
      Caption = 'Balans hesab'#305
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 6
      Top = 14
      Width = 76
      Height = 13
      Caption = 'Kreditin n'#246'v'#252
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CBBranch: TDBLookupComboBox
      Left = 5
      Top = 85
      Width = 156
      Height = 21
      DataField = 'BRANCHID'
      DataSource = ActFrom.DataSrcLinkValues
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DataSrcBranchList
      ParentFont = False
      TabOrder = 0
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 5
      Top = 125
      Width = 108
      Height = 21
      DataField = 'CURRENCYID'
      DataSource = ActFrom.DataSrcLinkValues
      KeyField = 'VALUTE'
      ListField = 'VAL_NAME'
      ListSource = DataSrcCurrencyList
      TabOrder = 1
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 6
      Top = 171
      Width = 260
      Height = 21
      DataField = 'ACCOUNTID'
      DataSource = ActFrom.DataSrcLinkValues
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'ACC_NO'
      ListSource = DataSrcIEAccountList
      TabOrder = 2
      Visible = True
      OnDropDown = DBLookupComboboxEh1DropDown
    end
    object DBEdit1: TDBEdit
      Left = 6
      Top = 211
      Width = 258
      Height = 21
      DataField = 'NAME'
      DataSource = DataSrcIEAccountList
      Enabled = False
      TabOrder = 3
    end
    object Edit1: TEdit
      Left = 140
      Top = 125
      Width = 117
      Height = 21
      TabOrder = 4
    end
    object DBLookupComboboxEh2: TDBLookupComboboxEh
      Left = 5
      Top = 36
      Width = 260
      Height = 21
      DataField = 'MEHSULID'
      DataSource = ActFrom.DataSrcLinkValues
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsrc_meh
      TabOrder = 5
      Visible = True
      OnDropDown = DBLookupComboboxEh1DropDown
    end
  end
  object IEAccountList: TOracleDataSet
    SQL.Strings = (
      'select* from ('
      'SELECT'
      '   id,Acc_No||'#39'  '#39'||Name Acc_No,Val_Acc,Name,FILIAL,bal_cn1'
      '  FROM ACCOUNT'
      ' WHERE (bal_cn1 IN (SELECT accountnumber'
      '                           FROM smart.cm_aginfo'
      '                          WHERE groupid = (SELECT g.id'
      
        '                                             FROM smart.cm_accou' +
        'ntgroups g'
      
        '                                            WHERE g.iname = '#39'Inc' +
        'ExpAccounts'#39')))'
      'and (Close_Dat is Null) and FILIAL in (select id from sb_filial)'
      'and FILIAL in(select id from filial)'
      'union all'
      ''
      'SELECT'
      '   id,Acc_No||'#39'  '#39'||Name Acc_No,Val_Acc,Name,FILIAL,bal_cn1'
      '  FROM out_ACCOUNT'
      ' WHERE (bal_cn1 IN (SELECT accountnumber'
      '                           FROM smart.cm_aginfo'
      '                          WHERE groupid = (SELECT g.id'
      
        '                                             FROM smart.cm_accou' +
        'ntgroups g'
      
        '                                            WHERE g.iname = '#39'Inc' +
        'ExpAccounts'#39')))'
      'and (Close_Dat is Null) and FILIAL in (select id from sb_filial)'
      'and FILIAL in(select id from filial))'
      ''
      ''
      ''
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000600000004000000490044000100000000000C000000410043004300
      5F004E004F000100000000000E000000560041004C005F004100430043000100
      00000000080000004E0041004D0045000100000000000E000000410043004300
      5F004E004F0031000100000000000C000000460049004C00490041004C000100
      00000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 80
    Top = 8
    object IEAccountListID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object IEAccountListACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 500
    end
    object IEAccountListVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object IEAccountListNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object BranchList: TOracleDataSet
    SQL.Strings = (
      'SELECT id, name'
      '  FROM filial')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 16
    object BranchListID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object BranchListNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object DataSrcIEAccountList: TDataSource
    DataSet = IEAccountList
    Left = 48
    Top = 56
  end
  object DataSrcBranchList: TDataSource
    DataSet = BranchList
    Left = 128
    Top = 56
  end
  object CurrencyList: TOracleDataSet
    SQL.Strings = (
      'SELECT VAlute,Val_Name'
      '  FROM AVALUTE')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C000000560041004C005500540045000100000000001000
      0000560041004C005F004E0041004D004500010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 112
    Top = 8
    object CurrencyListVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object CurrencyListVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
  end
  object DataSrcCurrencyList: TDataSource
    DataSet = CurrencyList
    Left = 168
    Top = 8
  end
  object ods_meh: TOracleDataSet
    SQL.Strings = (
      'select*from cm_mehsul_links_settings')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      45000100000000000A0000004D004500480049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 120
    Top = 128
  end
  object dsrc_meh: TDataSource
    DataSet = ods_meh
    Left = 200
    Top = 128
  end
end
