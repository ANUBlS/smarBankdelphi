object frmIPINFO: TfrmIPINFO
  Left = 233
  Top = 208
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Additional Information'
  ClientHeight = 350
  ClientWidth = 546
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 273
    Height = 308
    Align = alLeft
    Caption = #220'mumi m'#601'lumat'
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 63
      Height = 13
      Caption = 'Ail'#601' v'#601'ziyy'#601'ti'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 8
      Top = 56
      Width = 48
      Height = 13
      Caption = 'Ayl'#305'q g'#601'liri'
      FocusControl = DBEdit3
    end
    object Label5: TLabel
      Left = 8
      Top = 96
      Width = 140
      Height = 13
      Caption = #350#601'xsiyy'#601'ti t'#601'sdiq ed'#601'n s'#601'n'#601'd'
      FocusControl = DBEdit5
    end
    object Label7: TLabel
      Left = 8
      Top = 136
      Width = 143
      Height = 13
      Caption = 'Aid oldu'#287'u g'#252'z'#601#351'tli kateqoriya'
      FocusControl = DBEdit7
    end
    object Label12: TLabel
      Left = 8
      Top = 176
      Width = 104
      Height = 13
      Caption = 'Unikal s'#305#287'orta n'#246'mr'#601'si'
    end
    object Label25: TLabel
      Left = 8
      Top = 216
      Width = 27
      Height = 13
      Caption = 'V'#214'EN'
      FocusControl = DBEdit25
    end
    object Label26: TLabel
      Left = 8
      Top = 256
      Width = 141
      Height = 13
      Caption = 'Borcalanla qohumluq d'#601'r'#601'c'#601'si'
      FocusControl = DBEdit26
    end
    object DBEdit2: TDBLookupComboBox
      Left = 8
      Top = 32
      Width = 250
      Height = 21
      DataField = 'MARRIAGE'
      DataSource = IpInfo
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = Marriage1
      TabOrder = 0
      OnCloseUp = DBEdit3Change
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 72
      Width = 250
      Height = 21
      DataField = 'MONTHLYPROFIT'
      DataSource = IpInfo
      TabOrder = 1
      OnChange = DBEdit3Change
    end
    object DBEdit5: TDBLookupComboBox
      Left = 8
      Top = 112
      Width = 250
      Height = 21
      DataField = 'PASSTYPE'
      DataSource = IpInfo
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = PassType1
      TabOrder = 2
      OnCloseUp = DBEdit3Change
    end
    object DBEdit7: TDBLookupComboBox
      Left = 8
      Top = 152
      Width = 250
      Height = 21
      DataField = 'SOCCATEGORY'
      DataSource = IpInfo
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = SocCategory1
      TabOrder = 3
      OnCloseUp = DBEdit3Change
    end
    object DBEdit10: TDBEdit
      Left = 8
      Top = 192
      Width = 250
      Height = 21
      DataField = 'UNIQUEINSID'
      DataSource = IpInfo
      TabOrder = 4
      OnChange = DBEdit3Change
    end
    object DBEdit25: TDBEdit
      Left = 8
      Top = 232
      Width = 250
      Height = 21
      DataField = 'BB_INN'
      DataSource = IpInfo
      TabOrder = 5
      OnChange = DBEdit3Change
    end
    object DBEdit26: TDBLookupComboBox
      Left = 8
      Top = 272
      Width = 250
      Height = 21
      DataField = 'BB_FAMILYSTATUS'
      DataSource = IpInfo
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = Family
      TabOrder = 6
      OnCloseUp = DBEdit3Change
    end
  end
  object GroupBox2: TGroupBox
    Left = 273
    Top = 0
    Width = 273
    Height = 308
    Align = alRight
    Caption = #399'lav'#601' m'#601'lumat'
    TabOrder = 1
    object Label8: TLabel
      Left = 8
      Top = 16
      Width = 240
      Height = 13
      Caption = 'Borcalan'#305' f'#601'rdi q'#601'zalardan s'#305#287'ortalayan '#351'irk'#601'tin ad'#305
      FocusControl = DBEdit8
    end
    object Label9: TLabel
      Left = 8
      Top = 56
      Width = 95
      Height = 13
      Caption = 'S'#305#287'orta polisinin N-si'
      FocusControl = DBEdit9
    end
    object Label10: TLabel
      Left = 8
      Top = 136
      Width = 127
      Height = 13
      Caption = 'S'#305#287'orta m'#252'qavil'#601'sinin tarixi'
      FocusControl = cb_INSCONTRACTDATE
    end
    object Label11: TLabel
      Left = 8
      Top = 216
      Width = 141
      Height = 13
      Caption = 'S'#305#287'orta m'#252'qavil'#601'sinin m'#252'dd'#601'ti'
      FocusControl = cb_INSCONTRACTPREIOD
    end
    object Label13: TLabel
      Left = 6
      Top = 176
      Width = 156
      Height = 13
      Caption = 'S'#305#287'orta m'#252'qavil'#601'sinin bitm'#601' tarixi'
      FocusControl = cb_INSCONTRLASTDATE
    end
    object Label14: TLabel
      Left = 8
      Top = 256
      Width = 123
      Height = 13
      Caption = 'S'#305#287'orta '#246'd'#601'ni'#351'inin periodu'
      FocusControl = DBLookupComboBox1
    end
    object Label15: TLabel
      Left = 8
      Top = 96
      Width = 73
      Height = 13
      Caption = 'S'#305#287'orta m'#601'bl'#601#287'i'
      FocusControl = DBEdit11
    end
    object DBEdit8: TDBLookupComboBox
      Left = 8
      Top = 32
      Width = 250
      Height = 21
      DataField = 'INSURANCECOMP'
      DataSource = IpInfo
      KeyField = 'ID'
      ListField = 'DESCRIPTION'
      ListSource = Insurances
      TabOrder = 0
      OnCloseUp = DBEdit3Change
    end
    object DBEdit9: TDBEdit
      Left = 8
      Top = 72
      Width = 250
      Height = 21
      DataField = 'INSPOLICNUM'
      DataSource = IpInfo
      TabOrder = 1
      OnChange = DBEdit3Change
    end
    object cb_INSCONTRACTDATE: TDateTimePicker
      Left = 8
      Top = 152
      Width = 250
      Height = 21
      Date = 38896.493089363400000000
      Time = 38896.493089363400000000
      TabOrder = 2
      OnChange = DBEdit3Change
    end
    object cb_INSCONTRACTPREIOD: TDateTimePicker
      Left = 8
      Top = 232
      Width = 250
      Height = 21
      Date = 39001.657935474500000000
      Time = 39001.657935474500000000
      TabOrder = 3
      OnChange = DBEdit3Change
    end
    object cb_INSCONTRLASTDATE: TDateTimePicker
      Left = 7
      Top = 192
      Width = 250
      Height = 21
      Date = 38896.493089363400000000
      Time = 38896.493089363400000000
      TabOrder = 4
      OnChange = DBEdit3Change
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 8
      Top = 272
      Width = 250
      Height = 21
      DataField = 'INSPERIODID'
      DataSource = IpInfo
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = Periods
      TabOrder = 5
      OnCloseUp = DBEdit3Change
    end
    object DBEdit11: TDBEdit
      Left = 8
      Top = 112
      Width = 250
      Height = 21
      DataField = 'INSAMOUNT'
      DataSource = IpInfo
      TabOrder = 6
      OnChange = DBEdit3Change
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 308
    Width = 546
    Height = 42
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label6: TLabel
      Left = 112
      Top = 136
      Width = 144
      Height = 13
      Caption = #1057#1103#1085#1103#1076#1080#1085' '#1089#1077#1088#1080#1081#1072' '#1074#1103' '#1085#1102#1084#1088#1103#1089#1080
      FocusControl = DBEdit6
    end
    object Label4: TLabel
      Left = 112
      Top = 96
      Width = 38
      Height = 13
      Caption = #1055#1077#1096#1103#1089#1080
      FocusControl = DBEdit4
    end
    object Label1: TLabel
      Left = 112
      Top = 56
      Width = 71
      Height = 13
      Caption = #1044#1086#1100#1091#1084' '#1090#1072#1088#1080#1093#1080
      FocusControl = cb_BDATE
    end
    object Button1: TButton
      Left = 272
      Top = 8
      Width = 129
      Height = 25
      Caption = 'Yadda saxla'
      Default = True
      Enabled = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 408
      Top = 8
      Width = 115
      Height = 25
      Cancel = True
      Caption = 'Ba'#287'la'
      ModalResult = 2
      TabOrder = 1
    end
    object DBEdit6: TDBEdit
      Left = 112
      Top = 152
      Width = 41
      Height = 21
      DataField = 'PASSSERIE'
      DataSource = IpInfo
      TabOrder = 2
      OnChange = DBEdit3Change
    end
    object DBEdit1: TDBEdit
      Left = 160
      Top = 152
      Width = 201
      Height = 21
      DataField = 'PASSNUM'
      DataSource = IpInfo
      TabOrder = 3
      OnChange = DBEdit3Change
    end
    object DBEdit4: TDBEdit
      Left = 112
      Top = 112
      Width = 250
      Height = 21
      DataField = 'PROFESSION'
      DataSource = IpInfo
      TabOrder = 4
      OnChange = DBEdit3Change
    end
    object cb_BDATE: TDateTimePicker
      Left = 112
      Top = 72
      Width = 250
      Height = 21
      Date = 38896.493063148100000000
      Time = 38896.493063148100000000
      TabOrder = 5
      OnChange = DBEdit3Change
    end
  end
  object ODSIpInfo: TOracleDataSet
    SQL.Strings = (
      'select i.rowid,i.* from custipinfo i'
      'where custid=:custid'
      'and cardid=:cardid')
    Optimize = False
    Variables.Data = {
      04000000020000000E0000003A00430055005300540049004400030000000000
      0000000000000E0000003A004300410052004400490044000300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      05000000140000000C0000004300550053005400490044000100000000000A00
      000042004400410054004500010000000000100000004D004100520052004900
      4100470045000100000000001A0000004D004F004E00540048004C0059005000
      52004F0046004900540001000000000014000000500052004F00460045005300
      530049004F004E00010000000000100000005000410053005300540059005000
      4500010000000000120000005000410053005300530045005200490045000100
      000000001600000053004F004300430041005400450047004F00520059000100
      000000001A00000049004E0053005500520041004E004300450043004F004D00
      50000100000000001600000049004E00530050004F004C00490043004E005500
      4D000100000000001E00000049004E00530043004F004E005400520041004300
      540044004100540045000100000000002200000049004E00530043004F004E00
      5400520041004300540050005200450049004F0044000100000000000C000000
      420042005F0049004E004E000100000000001E000000420042005F0046004100
      4D0049004C0059005300540041005400550053000100000000000E0000005000
      4100530053004E0055004D000100000000000C00000043004100520044004900
      44000100000000001600000055004E00490051005500450049004E0053004900
      44000100000000002000000049004E00530043004F004E00540052004C004100
      5300540044004100540045000100000000001600000049004E00530050004500
      520049004F004400490044000100000000001200000049004E00530041004D00
      4F0055004E005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 504
    Top = 24
    object ODSIpInfoCUSTID: TFloatField
      FieldName = 'CUSTID'
    end
    object ODSIpInfoBDATE: TDateTimeField
      FieldName = 'BDATE'
    end
    object ODSIpInfoMARRIAGE: TFloatField
      FieldName = 'MARRIAGE'
    end
    object ODSIpInfoMONTHLYPROFIT: TFloatField
      FieldName = 'MONTHLYPROFIT'
    end
    object ODSIpInfoPROFESSION: TWideStringField
      FieldName = 'PROFESSION'
      Size = 63
    end
    object ODSIpInfoPASSTYPE: TFloatField
      FieldName = 'PASSTYPE'
    end
    object ODSIpInfoPASSSERIE: TWideStringField
      FieldName = 'PASSSERIE'
      Size = 7
    end
    object ODSIpInfoSOCCATEGORY: TFloatField
      FieldName = 'SOCCATEGORY'
    end
    object ODSIpInfoINSURANCECOMP: TFloatField
      FieldName = 'INSURANCECOMP'
    end
    object ODSIpInfoINSPOLICNUM: TWideStringField
      FieldName = 'INSPOLICNUM'
      Size = 15
    end
    object ODSIpInfoINSCONTRACTDATE: TDateTimeField
      FieldName = 'INSCONTRACTDATE'
    end
    object ODSIpInfoINSCONTRACTPREIOD: TDateTimeField
      FieldName = 'INSCONTRACTPREIOD'
    end
    object ODSIpInfoBB_INN: TWideStringField
      FieldName = 'BB_INN'
      Size = 15
    end
    object ODSIpInfoBB_FAMILYSTATUS: TFloatField
      FieldName = 'BB_FAMILYSTATUS'
    end
    object ODSIpInfoPASSNUM: TWideStringField
      FieldName = 'PASSNUM'
      Size = 15
    end
    object ODSIpInfoCARDID: TFloatField
      FieldName = 'CARDID'
    end
    object ODSIpInfoUNIQUEINSID: TWideStringField
      FieldName = 'UNIQUEINSID'
    end
    object ODSIpInfoINSCONTRLASTDATE: TDateTimeField
      FieldName = 'INSCONTRLASTDATE'
    end
    object ODSIpInfoINSPERIODID: TFloatField
      FieldName = 'INSPERIODID'
    end
    object ODSIpInfoINSAMOUNT: TFloatField
      FieldName = 'INSAMOUNT'
    end
  end
  object IpInfo: TDataSource
    DataSet = ODSIpInfo
    Left = 474
    Top = 26
  end
  object ODSMarriage: TOracleDataSet
    Tag = 3
    SQL.Strings = (
      'select 0 id, '#39'Evli'#39' name from dual'
      'union select 1 id, '#39'Subay'#39' name from dual')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 505
    Top = 56
  end
  object Marriage1: TDataSource
    DataSet = ODSMarriage
    Left = 441
    Top = 56
  end
  object Marriage2: TDataSource
    DataSet = ODSMarriage
    Left = 473
    Top = 56
  end
  object ODSInsurance: TOracleDataSet
    Tag = 3
    SQL.Strings = (
      'select * from ip_insurances'
      'order by id')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 505
    Top = 176
  end
  object PassType1: TDataSource
    DataSet = ODSPassTypes
    Left = 441
    Top = 89
  end
  object PassType2: TDataSource
    DataSet = ODSPassTypes
    Left = 473
    Top = 89
  end
  object ODSPassTypes: TOracleDataSet
    Tag = 3
    SQL.Strings = (
      'select * from doc_types order by id')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 505
    Top = 89
  end
  object Insurances: TDataSource
    DataSet = ODSInsurance
    Left = 473
    Top = 176
  end
  object SocCategory1: TDataSource
    DataSet = ODSSocCategories
    Left = 441
    Top = 142
  end
  object ODSSocCategories: TOracleDataSet
    Tag = 3
    SQL.Strings = (
      'select * from custsoccategories'
      'order by id')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 505
    Top = 142
  end
  object SocCategory2: TDataSource
    DataSet = ODSSocCategories
    Left = 473
    Top = 142
  end
  object Family: TDataSource
    DataSet = ODSFamily
    Left = 473
    Top = 210
  end
  object ODSFamily: TOracleDataSet
    Tag = 3
    SQL.Strings = (
      'select * from custfamily'
      'order by id')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 505
    Top = 210
  end
  object Periods: TDataSource
    DataSet = ODSPeriods
    Left = 473
    Top = 245
  end
  object ODSPeriods: TOracleDataSet
    Tag = 3
    SQL.Strings = (
      'select * from ip_insperiods'
      'order by name')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 505
    Top = 245
  end
end
