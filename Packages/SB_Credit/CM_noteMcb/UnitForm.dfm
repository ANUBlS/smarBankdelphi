object FormNote: TFormNote
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 574
  ClientWidth = 752
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 752
    Height = 392
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 114
      Height = 13
      Caption = 'M'#252#351't'#601'ri nec'#601' c'#601'lb edilib:'
    end
    object Label2: TLabel
      Left = 8
      Top = 43
      Width = 52
      Height = 13
      Caption = 'Unikal kod:'
    end
    object Label3: TLabel
      Left = 8
      Top = 150
      Width = 120
      Height = 13
      Caption = 'M'#252#351't'#601'ri hans'#305' sektordad'#305'r'
    end
    object Label4: TLabel
      Left = 8
      Top = 70
      Width = 77
      Height = 13
      Caption = 'TOP 10 m'#252#351't'#601'ri:'
    end
    object Label5: TLabel
      Left = 315
      Top = 70
      Width = 86
      Height = 13
      Caption = 'Avadanl'#305#287#305'n qrupu'
    end
    object Label6: TLabel
      Left = 315
      Top = 96
      Width = 203
      Height = 13
      Caption = 'N'#601'qliyyat vasit'#601'l'#601'rinin qeydiyyat n'#246'mr'#601'l'#601'ri'
    end
    object Label7: TLabel
      Left = 8
      Top = 203
      Width = 175
      Height = 13
      Caption = 'ki'#351'il'#601'r '#252#231#252'n ne'#231#601' yeni i'#351' yeri yarad'#305'l'#305'b'
    end
    object Label8: TLabel
      Left = 8
      Top = 96
      Width = 126
      Height = 13
      Caption = 'M'#252#351't'#601'ri qeydiyyat n'#246'mr'#601'si'
    end
    object Label9: TLabel
      Left = 8
      Top = 230
      Width = 177
      Height = 13
      Caption = 'Qad'#305'n '#252#231#252'n ne'#231#601' yeni i'#351' yeri yarad'#305'l'#305'b'
    end
    object Label10: TLabel
      Left = 8
      Top = 255
      Width = 166
      Height = 13
      Caption = 'Kredit veril'#601'n '#351'irk'#601'td'#601' ne'#231#601' i'#231#351'i var'
    end
    object Label11: TLabel
      Left = 315
      Top = 125
      Width = 230
      Height = 13
      Caption = 'Kredit veril'#601'n '#351'irk'#601'in  illik d'#246'vriyy'#601'si n'#601' q'#601'd'#601'rdir?'
    end
    object Label12: TLabel
      Left = 315
      Top = 20
      Width = 100
      Height = 13
      Caption = 'Maliy'#601'l'#601#351'm'#601' m'#601'nb'#601'yi'
    end
    object Label13: TLabel
      Left = 315
      Top = 151
      Width = 254
      Height = 13
      Caption = #399'M (annuitet, b'#601'rab'#601'r hiss'#601'l'#601'rl'#601', m'#252'dd'#601'tin sonunda)'
    end
    object Label14: TLabel
      Left = 315
      Top = 43
      Width = 78
      Height = 13
      Caption = 'Portfel seqmenti'
    end
    object Label15: TLabel
      Left = 8
      Top = 123
      Width = 122
      Height = 13
      Caption = 'Yeni yoxsa t'#601'krar m'#252#351't'#601'ri'
    end
    object Label16: TLabel
      Left = 8
      Top = 176
      Width = 68
      Height = 13
      Caption = 'Biznesin sahibi'
    end
    object Label17: TLabel
      Left = 8
      Top = 280
      Width = 38
      Height = 13
      Caption = 'Haircut:'
    end
    object Label18: TLabel
      Left = 315
      Top = 176
      Width = 190
      Height = 13
      Caption = #214'd'#601'ni'#351' qrafikind'#601' g'#252'z'#601#351't m'#252'dd'#601'ti (ayla)'
    end
    object Label19: TLabel
      Left = 315
      Top = 202
      Width = 99
      Height = 13
      Caption = 'Restruktizasiya say'#305':'
    end
    object Label20: TLabel
      Left = 315
      Top = 228
      Width = 145
      Height = 13
      Caption = 'Sonuncu restruktizasiya tarixi:'
    end
    object Label21: TLabel
      Left = 315
      Top = 254
      Width = 116
      Height = 13
      Caption = 'Restruktizasiya m'#601'bl'#601#287'i:'
    end
    object Label22: TLabel
      Left = 315
      Top = 280
      Width = 184
      Height = 13
      Caption = 'Restruktizasiya tarixin'#601' gecikm'#601' g'#252'n'#252':'
    end
    object Label23: TLabel
      Left = 315
      Top = 311
      Width = 181
      Height = 13
      Caption = 'M'#252'qavil'#601' hans'#305' banka girova qoyulub?'
    end
    object Label24: TLabel
      Left = 5
      Top = 311
      Width = 195
      Height = 13
      Caption = 'M'#252'qavil'#601'nin banka girova qoyulma tarixi:'
    end
    object Label25: TLabel
      Left = 579
      Top = 187
      Width = 26
      Height = 16
      Caption = 'FIFD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 5
      Top = 339
      Width = 14
      Height = 13
      Caption = 'MV'
    end
    object Label27: TLabel
      Left = 144
      Top = 339
      Width = 18
      Height = 13
      Caption = 'FSV'
    end
    object Label28: TLabel
      Left = 5
      Top = 369
      Width = 107
      Height = 13
      Caption = 'Restruktizasiya  d'#246'vr'#252
    end
    object Label29: TLabel
      Left = 315
      Top = 350
      Width = 110
      Height = 13
      Caption = 'Restruktizasiya  s'#601'b'#601'bi'
    end
    object Edit1: TEdit
      Left = 138
      Top = 40
      Width = 150
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 138
      Top = 67
      Width = 150
      Height = 21
      TabOrder = 1
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 138
      Top = 16
      Width = 150
      Height = 21
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsrc_cel
      TabOrder = 2
      Visible = True
    end
    object Edit3: TEdit
      Left = 140
      Top = 94
      Width = 150
      Height = 21
      TabOrder = 3
    end
    object DBLookupComboboxEh2: TDBLookupComboboxEh
      Left = 421
      Top = 16
      Width = 148
      Height = 21
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsrc_maliye
      TabOrder = 4
      Visible = True
    end
    object DBLookupComboboxEh3: TDBLookupComboboxEh
      Left = 138
      Top = 147
      Width = 150
      Height = 21
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsrc_sector
      TabOrder = 5
      Visible = True
    end
    object Edit4: TEdit
      Left = 188
      Top = 200
      Width = 112
      Height = 21
      TabOrder = 6
    end
    object Edit5: TEdit
      Left = 188
      Top = 225
      Width = 112
      Height = 21
      TabOrder = 7
    end
    object DBLookupComboboxEh4: TDBLookupComboboxEh
      Left = 421
      Top = 43
      Width = 148
      Height = 21
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsrc_portstatus
      TabOrder = 8
      Visible = True
      OnCloseUp = DBLookupComboboxEh4CloseUp
    end
    object Edit6: TEdit
      Left = 188
      Top = 252
      Width = 112
      Height = 21
      TabOrder = 9
    end
    object Edit7: TEdit
      Left = 581
      Top = 95
      Width = 121
      Height = 21
      TabOrder = 10
    end
    object Edit8: TEdit
      Left = 581
      Top = 122
      Width = 121
      Height = 21
      TabOrder = 11
    end
    object DBLookupComboboxEh6: TDBLookupComboboxEh
      Left = 581
      Top = 149
      Width = 121
      Height = 21
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsrc_shedule
      TabOrder = 12
      Visible = True
    end
    object DBLookupComboboxEh5: TDBLookupComboboxEh
      Left = 421
      Top = 67
      Width = 148
      Height = 21
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsrc_group
      TabOrder = 13
      Visible = True
    end
    object Edit12: TEdit
      Left = 522
      Top = 176
      Width = 53
      Height = 21
      TabOrder = 14
    end
    object Edit13: TEdit
      Left = 520
      Top = 200
      Width = 54
      Height = 21
      TabOrder = 15
    end
    object Edit14: TEdit
      Left = 471
      Top = 251
      Width = 103
      Height = 21
      TabOrder = 16
    end
    object Edit15: TEdit
      Left = 520
      Top = 277
      Width = 54
      Height = 21
      TabOrder = 17
    end
    object Edit16: TEdit
      Left = 501
      Top = 308
      Width = 241
      Height = 21
      TabOrder = 18
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 202
      Top = 307
      Width = 98
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 19
      Visible = True
    end
    object DBDateTimeEditEh2: TDBDateTimeEditEh
      Left = 472
      Top = 225
      Width = 102
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 20
      Visible = True
    end
    object DBLookupComboboxEh7: TDBLookupComboboxEh
      Left = 138
      Top = 173
      Width = 150
      Height = 21
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsrc_bussnes
      TabOrder = 21
      Visible = True
    end
    object DBLookupComboboxEh8: TDBLookupComboboxEh
      Left = 138
      Top = 118
      Width = 150
      Height = 21
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsrc_newOld
      TabOrder = 22
      Visible = True
    end
    object DBLookupComboboxEh9: TDBLookupComboboxEh
      Left = 188
      Top = 278
      Width = 112
      Height = 21
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsrc_hucrat
      TabOrder = 23
      Visible = True
    end
    object Edit9: TEdit
      Left = 606
      Top = 186
      Width = 94
      Height = 21
      TabOrder = 24
      OnKeyPress = Edit9KeyPress
    end
    object edit10: TEdit
      Left = 23
      Top = 336
      Width = 110
      Height = 21
      TabOrder = 25
      OnKeyPress = Edit10KeyPress
    end
    object edit11: TEdit
      Left = 169
      Top = 336
      Width = 110
      Height = 21
      TabOrder = 26
      OnKeyPress = Edit11KeyPress
    end
    object Edit17: TEdit
      Left = 158
      Top = 363
      Width = 121
      Height = 21
      TabOrder = 27
      OnKeyPress = Edit17KeyPress
    end
    object Memo1: TMemo
      Left = 428
      Top = 336
      Width = 314
      Height = 49
      TabOrder = 28
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 392
    Width = 752
    Height = 141
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 1
    ExplicitTop = 361
    ExplicitHeight = 112
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 748
      Height = 137
      Align = alClient
      DataSource = dsrc_not
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CREDITID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR1'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR2'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR3'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR4'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR5'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR6'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR7'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR8'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR9'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR10'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR11'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR12'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR13'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR14'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR15'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR16'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR17'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR18'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR19'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR20'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR21'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR22'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR23'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR24'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR25'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR26'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR27'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR28'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAR29'
          Width = 200
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 533
    Width = 752
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 2
    ExplicitTop = 537
    object Button1: TButton
      Left = 500
      Top = 10
      Width = 62
      Height = 25
      Caption = 'Q'#601'bul'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 628
      Top = 10
      Width = 62
      Height = 25
      Caption = 'Ba'#287'la'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 564
      Top = 10
      Width = 62
      Height = 25
      Caption = 'Sil'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object ods_cel: TOracleDataSet
    SQL.Strings = (
      'select 1 as id ,'#39'SMS'#39' as name from dual'
      'union'
      'select 2 as id ,'#39'Partner'#39' as name from dual'
      'union'
      'select 3 as id ,'#39'Existing'#39' as name from dual'
      'union'
      'select 4 as id ,'#39'Direct'#39' as name from dual')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 64
    Top = 8
    object ods_celID: TFloatField
      FieldName = 'ID'
    end
    object ods_celNAME: TWideStringField
      FieldName = 'NAME'
      Size = 8
    end
  end
  object dsrc_cel: TDataSource
    DataSet = ods_cel
    Left = 112
    Top = 8
  end
  object ods_sector: TOracleDataSet
    SQL.Strings = (
      'select 1 as id ,'#39'Car Rentals'#39' as name from dual'
      'union'
      'select 2 as id ,'#39'Cargo transport'#39' as name from dual'
      'union'
      'select 3 as id ,'#39'Construction'#39' as name from dual'
      'union'
      'select 4 as id ,'#39'Esthetics-Cosmetology'#39' as name from dual'
      'union'
      'select 5 as id ,'#39'Farming'#39' as name from dual'
      'union'
      'select 6 as id ,'#39'Food and beverages'#39' as name from dual'
      'union'
      'select 7 as id ,'#39'Food processing'#39' as name from dual'
      'union'
      'select 8 as id ,'#39'Health'#39' as name from dual'
      'union'
      'select 9 as id ,'#39'Hotel and restaurants'#39' as name from dual'
      'union'
      'select 10 as id ,'#39'ICT'#39' as name from dual'
      'union'
      'select 11 as id ,'#39'Industrial production'#39' as name from dual'
      'union'
      
        'select 12 as id ,'#39'Infrastructure (government funded) '#39' as name f' +
        'rom dual'
      'union'
      'select 13 as id ,'#39'Other services'#39' as name from dual'
      'union'
      'select 14 as id ,'#39'Printing and  Publishing'#39' as name from dual'
      'union'
      'select 15 as id ,'#39'Public transport'#39' as name from dual'
      'union'
      'select 16 as id ,'#39'Staff'#39' as name from dual'
      'union'
      'select 17 as id ,'#39'Tourism'#39' as name from dual'
      'union'
      'select 18 as id ,'#39'Trade'#39' as name from dual')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 40
    Top = 48
    object ods_sectorID: TFloatField
      FieldName = 'ID'
    end
    object ods_sectorNAME: TWideStringField
      FieldName = 'NAME'
      Size = 35
    end
  end
  object dsrc_sector: TDataSource
    DataSet = ods_sector
    Left = 104
    Top = 48
  end
  object ods_maliye: TOracleDataSet
    SQL.Strings = (
      'select 1 as id ,'#39'Bank krediti'#39' as name from dual'
      'union'
      'select 2 as id ,'#39'AK'#304'A'#39' as name from dual'
      'union'
      'select 3 as id ,'#39'S'#304'F'#39' as name from dual'
      'union'
      'select 4 as id ,'#39'Kapital'#39' as name from dual')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 384
    Top = 40
    object FloatField1: TFloatField
      FieldName = 'ID'
    end
    object WideStringField1: TWideStringField
      FieldName = 'NAME'
      Size = 32
    end
  end
  object dsrc_maliye: TDataSource
    DataSet = ods_maliye
    Left = 456
    Top = 8
  end
  object ods_portstatus: TOracleDataSet
    SQL.Strings = (
      'select 1 as id ,'#39'Auto'#39' as name from dual'
      'union'
      'select 2 as id ,'#39'Commercial'#39' as name from dual'
      'union'
      'select 3 as id ,'#39'Consumer'#39' as name from dual'
      'union'
      'select 4 as id ,'#39'Real Estate'#39' as name from dual'
      'union'
      'select 5 as id ,'#39'Gold'#39' as name from dual'
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 656
    Top = 8
    object FloatField2: TFloatField
      FieldName = 'ID'
    end
    object WideStringField2: TWideStringField
      FieldName = 'NAME'
      Size = 11
    end
  end
  object ods_not: TOracleDataSet
    SQL.Strings = (
      'select * from cm_notesmcb '
      'where creditid=:v_id')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A0056005F004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      050000001F000000040000004900440001000000000010000000430052004500
      4400490054004900440001000000000008000000500041005200310001000000
      0000080000005000410052003200010000000000080000005000410052003300
      0100000000000800000050004100520034000100000000000800000050004100
      5200350001000000000008000000500041005200360001000000000008000000
      5000410052003700010000000000080000005000410052003800010000000000
      0800000050004100520039000100000000000A00000050004100520031003000
      0100000000000A000000500041005200310031000100000000000A0000005000
      41005200310032000100000000000A0000005000410052003100330001000000
      00000A000000500041005200310034000100000000000A000000500041005200
      310035000100000000000A000000500041005200310036000100000000000A00
      0000500041005200310037000100000000000A00000050004100520031003800
      0100000000000A000000500041005200310039000100000000000A0000005000
      41005200320030000100000000000A0000005000410052003200310001000000
      00000A000000500041005200320032000100000000000A000000500041005200
      320033000100000000000A000000500041005200320034000100000000000A00
      0000500041005200320035000100000000000A00000050004100520032003600
      0100000000000A000000500041005200320037000100000000000A0000005000
      41005200320038000100000000000A0000005000410052003200390001000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 400
    Top = 408
    object ods_notID: TFloatField
      FieldName = 'ID'
    end
    object ods_notCREDITID: TFloatField
      FieldName = 'CREDITID'
    end
    object ods_notPAR1: TWideStringField
      FieldName = 'PAR1'
      Size = 200
    end
    object ods_notPAR2: TWideStringField
      FieldName = 'PAR2'
      Size = 200
    end
    object ods_notPAR3: TWideStringField
      FieldName = 'PAR3'
      Size = 200
    end
    object ods_notPAR4: TWideStringField
      FieldName = 'PAR4'
      Size = 200
    end
    object ods_notPAR5: TWideStringField
      FieldName = 'PAR5'
      Size = 200
    end
    object ods_notPAR6: TWideStringField
      FieldName = 'PAR6'
      Size = 200
    end
    object ods_notPAR7: TWideStringField
      FieldName = 'PAR7'
      Size = 200
    end
    object ods_notPAR8: TWideStringField
      FieldName = 'PAR8'
      Size = 1000
    end
    object ods_notPAR9: TWideStringField
      FieldName = 'PAR9'
      Size = 1000
    end
    object ods_notPAR10: TWideStringField
      FieldName = 'PAR10'
      Size = 1000
    end
    object ods_notPAR11: TWideStringField
      FieldName = 'PAR11'
      Size = 1000
    end
    object ods_notPAR12: TWideStringField
      FieldName = 'PAR12'
      Size = 1000
    end
    object ods_notPAR13: TWideStringField
      FieldName = 'PAR13'
      Size = 1000
    end
    object ods_notPAR14: TWideStringField
      FieldName = 'PAR14'
      Size = 1000
    end
    object ods_notPAR15: TWideStringField
      FieldName = 'PAR15'
      Size = 1000
    end
    object ods_notPAR16: TWideStringField
      FieldName = 'PAR16'
      Size = 1000
    end
    object ods_notPAR17: TWideStringField
      FieldName = 'PAR17'
      Size = 1000
    end
    object ods_notPAR18: TWideStringField
      FieldName = 'PAR18'
      Size = 1000
    end
    object ods_notPAR19: TWideStringField
      FieldName = 'PAR19'
      Size = 1000
    end
    object ods_notPAR20: TWideStringField
      FieldName = 'PAR20'
      Size = 1000
    end
    object ods_notPAR21: TWideStringField
      FieldName = 'PAR21'
      Size = 1000
    end
    object ods_notPAR22: TWideStringField
      FieldName = 'PAR22'
      Size = 100
    end
    object ods_notPAR23: TDateTimeField
      FieldName = 'PAR23'
    end
    object ods_notPAR24: TDateTimeField
      FieldName = 'PAR24'
    end
    object ods_notPAR25: TWideStringField
      FieldName = 'PAR25'
      Size = 50
    end
    object ods_notPAR26: TWideStringField
      FieldName = 'PAR26'
      Size = 50
    end
    object ods_notPAR27: TWideStringField
      FieldName = 'PAR27'
      Size = 50
    end
    object ods_notPAR28: TFloatField
      FieldName = 'PAR28'
    end
    object ods_notPAR29: TWideStringField
      FieldName = 'PAR29'
      Size = 1000
    end
  end
  object dsrc_not: TDataSource
    DataSet = ods_not
    Left = 488
    Top = 424
  end
  object dsrc_portstatus: TDataSource
    DataSet = ods_portstatus
    Left = 584
    Top = 8
  end
  object OraclePackage1: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'cm_credit'
    ParameterMode = pmNamed
    Left = 240
    Top = 32
  end
  object ods_group: TOracleDataSet
    SQL.Strings = (
      'select 1 as id , '#39'Agricultural Machinery'#39' as name from dual'
      'union'
      'select 2 as id , '#39'Asset Group'#39' as name from dual'
      'union'
      'select 3 as id , '#39'Big Passenger Bus'#39' as name from dual'
      'union'
      'select 4 as id , '#39'Business car'#39' as name from dual'
      'union'
      'select 5 as id , '#39'Commercial Real Estate'#39' as name from dual'
      'union'
      'select 6 as id , '#39'Construction Machinery'#39' as name from dual'
      'union'
      'select 7as id , '#39'Consumer Car'#39' as name from dual'
      'union'
      
        'select 8 as id , '#39'Esthetics/Cosmetology equipment'#39' as name from ' +
        'dual'
      'union'
      'select 9 as id , '#39'Heavy Weight Truck >15tons'#39' as name from dual'
      'union'
      'select 10 as id ,'#39'Light Weigh Truck <5tons'#39' as name from dual'
      'union'
      'select 11 as id ,'#39'Medical Equipment'#39' as name from dual'
      'union'
      'select 12 as id ,'#39'Middle Sized Bus'#39' as name from dual'
      'union'
      
        'select 13 as id ,'#39'Middle Weight Truck >5<15tons'#39' as name from du' +
        'al'
      'union'
      'select 14 as id ,'#39'None'#39' as name from dual'
      'union'
      'select 15 as id ,'#39'Other Equipment'#39' as name from dual'
      'union'
      
        'select 16 as id ,'#39'Printing and publishing equipment'#39' as name fro' +
        'm dual'
      'union'
      'select 17 as id ,'#39'Residential Real Estate'#39' as name from dual'
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 232
    Top = 80
    object ods_groupID: TFloatField
      FieldName = 'ID'
    end
    object ods_groupNAME: TWideStringField
      FieldName = 'NAME'
      Size = 33
    end
  end
  object dsrc_group: TDataSource
    DataSet = ods_group
    Left = 464
    Top = 64
  end
  object dsrc_shedule: TDataSource
    DataSet = ods_shedule
    Left = 688
    Top = 72
  end
  object ods_shedule: TOracleDataSet
    SQL.Strings = (
      'select 1 id ,'#39'Annuitet'#39' as name from dual'
      'union'
      'select 2 id ,'#39'B'#601'rab'#601'r'#39' as name from dual '
      'union'
      'select 3 id ,'#39'm'#252'dd'#601'tin sonunda'#39' as name from dual '
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 624
    Top = 64
    object ods_sheduleID: TFloatField
      FieldName = 'ID'
    end
    object ods_sheduleNAME: TWideStringField
      FieldName = 'NAME'
      Size = 18
    end
  end
  object ods_bussnes: TOracleDataSet
    SQL.Strings = (
      'select 1 id ,'#39'Male'#39' as name from dual'
      'union'
      'select 2 id ,'#39'Female'#39' as name from dual ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 608
    Top = 216
  end
  object dsrc_bussnes: TDataSource
    DataSet = ods_bussnes
    Left = 624
    Top = 256
  end
  object ods_newOld: TOracleDataSet
    SQL.Strings = (
      'select 1 id ,'#39'New'#39' as name from dual'
      'union'
      'select 2 id ,'#39'Repeat'#39' as name from dual '
      'union'
      'select 3 id ,'#39'Staff'#39' as name from dual ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 680
    Top = 216
  end
  object dsrc_newOld: TDataSource
    DataSet = ods_newOld
    Left = 688
    Top = 248
  end
  object ods_hucrat: TOracleDataSet
    SQL.Strings = (
      'select* from('
      'select 1 id ,'#39'80%'#39' as name from dual'
      'union'
      'select 2 id ,'#39'80%'#39' as name from dual '
      'union'
      'select 3 id ,'#39'100%'#39' as name from dual'
      'union'
      'select 4 id ,'#39'60%'#39' as name from dual'
      'union'
      'select 5 id ,'#39'50%'#39' as name from dual)'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Filtered = True
    Left = 480
    Top = 192
    object ods_hucratID: TFloatField
      FieldName = 'ID'
    end
    object ods_hucratNAME: TWideStringField
      FieldName = 'NAME'
      Size = 4
    end
  end
  object dsrc_hucrat: TDataSource
    DataSet = ods_hucrat
    Left = 480
    Top = 240
  end
end
