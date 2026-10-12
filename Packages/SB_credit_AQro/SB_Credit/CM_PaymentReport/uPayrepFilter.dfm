object frmPayRepFilter: TfrmPayRepFilter
  Left = 243
  Top = 177
  AutoSize = True
  BorderStyle = bsSingle
  Caption = 'frmIpRepFilter'
  ClientHeight = 287
  ClientWidth = 919
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 238
    Width = 918
    Height = 49
    TabOrder = 0
    object rbRepType: TRadioGroup
      Left = 1
      Top = 1
      Width = 216
      Height = 58
      Caption = 'Hesabat tipi'
      ItemIndex = 1
      Items.Strings = (
        'Excel'
        'QReport')
      TabOrder = 0
      Visible = False
    end
    object GroupBox13: TGroupBox
      Left = 1
      Top = 1
      Width = 210
      Height = 47
      Align = alLeft
      Caption = 'Щесабат тарихи'
      TabOrder = 1
      object Label1: TLabel
        Left = 98
        Top = 16
        Width = 13
        Height = 20
        Caption = ' - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object pick1: TDateTimePicker
        Left = 8
        Top = 16
        Width = 89
        Height = 21
        CalAlignment = dtaLeft
        Date = 39128.4876531713
        Time = 39128.4876531713
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
      object pick2: TDateTimePicker
        Left = 113
        Top = 16
        Width = 89
        Height = 21
        CalAlignment = dtaLeft
        Date = 39128.4876531713
        Time = 39128.4876531713
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
    end
    object GroupBox12: TGroupBox
      Left = 323
      Top = 1
      Width = 358
      Height = 47
      Align = alLeft
      Caption = 'Щесабат типи'
      TabOrder = 2
      object Label2: TLabel
        Left = 8
        Top = 24
        Width = 24
        Height = 13
        Caption = 'Ясас'
      end
      object Label3: TLabel
        Left = 143
        Top = 24
        Width = 19
        Height = 13
        Caption = 'Фаиз'
      end
      object cbRepType: TComboBox
        Left = 40
        Top = 16
        Width = 99
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Щамысы'
          'Мянфиляр'
          'Сыфырлар'
          'Мцсбятляр')
      end
      object cbRepType2: TComboBox
        Left = 169
        Top = 16
        Width = 99
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'Щамысы'
          'Мянфиляр'
          'Сыфырлар'
          'Мцсбятляр')
      end
    end
    object GroupBox14: TGroupBox
      Left = 211
      Top = 1
      Width = 112
      Height = 47
      Align = alLeft
      Caption = ' Faiz borc тарихи'
      TabOrder = 3
      object dtpfi: TDateTimePicker
        Left = 8
        Top = 16
        Width = 89
        Height = 21
        CalAlignment = dtaLeft
        Date = 39128.4876531713
        Time = 39128.4876531713
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
    end
    object Button1: TButton
      Left = 747
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Чап'
      TabOrder = 4
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 832
      Top = 16
      Width = 71
      Height = 25
      Caption = 'Баьла'
      TabOrder = 5
      OnClick = Button2Click
    end
  end
  object Panel1: TPanel
    Left = 681
    Top = 0
    Width = 238
    Height = 238
    BevelOuter = bvLowered
    TabOrder = 1
    object Label4: TLabel
      Left = 5
      Top = 19
      Width = 107
      Height = 13
      Caption = 'Боржаланын категорйасы'
    end
    object LookPersonelType: TEvanescence
      Tag = 3112
      Left = 2
      Top = 32
      Width = 232
      Height = 204
      ItemHeight = 13
      TabOrder = 0
      DataSource = Categories
      ListField = 'DESCRIPTION'
      KeyField = 'ID'
    end
    object challPersonalType: TButton
      Left = 3
      Top = 2
      Width = 67
      Height = 17
      Caption = 'Hamыsыnы seч'
      TabOrder = 1
      OnClick = challPersonalTypeClick
    end
    object unchallPersonalType: TButton
      Left = 83
      Top = 2
      Width = 67
      Height = 17
      Caption = 'Tяmizlя'
      TabOrder = 2
      OnClick = unchallPersonalTypeClick
    end
  end
  object Panel9: TPanel
    Left = 0
    Top = 0
    Width = 682
    Height = 60
    TabOrder = 2
    object GroupBox10: TGroupBox
      Left = 1
      Top = 1
      Width = 216
      Height = 58
      Align = alLeft
      Caption = 'Эиров'
      TabOrder = 0
      object CheckBox10: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object DBLookupComboboxEh10: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 204
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = Pledges
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox11: TGroupBox
      Left = 217
      Top = 1
      Width = 464
      Height = 58
      Align = alLeft
      Caption = 'Мцштяри'
      TabOrder = 1
      object CheckBox11: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object DBLookupComboboxEh11: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 452
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = Customers
        TabOrder = 1
        Visible = True
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 119
    Width = 682
    Height = 60
    TabOrder = 3
    object GroupBox7: TGroupBox
      Left = 1
      Top = 1
      Width = 216
      Height = 58
      Align = alLeft
      Caption = 'Боржаланын типи'
      TabOrder = 0
      object CheckBox7: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object DBLookupComboboxEh7: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 204
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPION'
        ListSource = Persons
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox8: TGroupBox
      Left = 433
      Top = 1
      Width = 248
      Height = 58
      Caption = 'Кредитин новц'
      TabOrder = 1
      object CheckBox9: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object DBLookupComboboxEh9: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 236
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = CrdType
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox9: TGroupBox
      Left = 217
      Top = 1
      Width = 216
      Height = 58
      Align = alLeft
      Caption = 'Боржаланын категорйасы'
      Enabled = False
      TabOrder = 2
      object CheckBox8: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object DBLookupComboboxEh8: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 204
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = Categories
        TabOrder = 1
        Visible = True
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 60
    Width = 682
    Height = 60
    TabOrder = 4
    object GroupBox4: TGroupBox
      Left = 1
      Top = 1
      Width = 216
      Height = 58
      Align = alLeft
      Caption = 'Тяснифат'
      TabOrder = 0
      object CheckBox4: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object DBLookupComboboxEh4: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 204
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'FULLDESC'
        ListSource = Reserves
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox5: TGroupBox
      Left = 433
      Top = 1
      Width = 248
      Height = 58
      Align = alLeft
      Caption = 'Истифадячи'
      TabOrder = 1
      object DBLookupComboboxEh6: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 236
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = Users
        TabOrder = 0
        Visible = True
      end
      object CheckBox6: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 1
      end
    end
    object GroupBox6: TGroupBox
      Left = 217
      Top = 1
      Width = 216
      Height = 58
      Align = alLeft
      Caption = 'Эежикмиш тяснифат'
      TabOrder = 2
      object DBLookupComboboxEh5: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 204
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'FULLDESC'
        ListSource = DueReserve
        TabOrder = 0
        Visible = True
      end
      object CheckBox5: TCheckBox
        Left = 7
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 179
    Width = 682
    Height = 60
    TabOrder = 5
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 216
      Height = 58
      Align = alLeft
      Caption = 'Валйута'
      TabOrder = 0
      object CheckBox1: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 204
        Height = 21
        EditButtons = <>
        KeyField = 'VALUTE'
        ListField = 'VALU_NAME'
        ListSource = Valute
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox2: TGroupBox
      Left = 433
      Top = 1
      Width = 248
      Height = 58
      Align = alLeft
      Caption = 'МКТ'
      TabOrder = 1
      object DBLookupComboboxEh3: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 236
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = UsrGroup
        TabOrder = 0
        Visible = True
      end
      object CheckBox3: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 217
      Top = 1
      Width = 216
      Height = 58
      Align = alLeft
      Caption = 'Филиал'
      TabOrder = 2
      object DBLookupComboboxEh2: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 204
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = Branch
        TabOrder = 0
        Visible = True
      end
      object CheckBox2: TCheckBox
        Left = 6
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 1
      end
    end
  end
  object ODSCredits: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select id from cm_active_credits p'
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
    QBEDefinition.QBEFieldDefs = {0400000001000000020000004944010000000000}
    Session = CMDataModule.CMSession
    Left = 432
    Top = 184
    object ODSCreditsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
  end
  object CM_REPORTS: TOraclePackage
    Session = CMDataModule.CMSession
    PackageName = 'CM_PREPORTS'
    ParameterMode = pmNamed
    Left = 472
    Top = 168
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = 'Юдянишляр цзря  щесабат'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 113
    Top = 41
  end
  object ODFValute: TOracleDataSet
    SQL.Strings = (
      'select * from sb_avalute')
    Session = CMDataModule.CMSession
    Left = 24
    Top = 16
  end
  object Valute: TDataSource
    DataSet = ODFValute
    Left = 56
    Top = 16
  end
  object ODFBranch: TOracleDataSet
    SQL.Strings = (
      'select * from sb_filial')
    Session = CMDataModule.CMSession
    Left = 248
    Top = 24
  end
  object Branch: TDataSource
    DataSet = ODFBranch
    Left = 280
    Top = 24
  end
  object ODFUsrGroup: TOracleDataSet
    SQL.Strings = (
      'select * from cm_usergroups')
    Session = CMDataModule.CMSession
    Left = 472
    Top = 16
  end
  object UsrGroup: TDataSource
    DataSet = ODFUsrGroup
    Left = 504
    Top = 16
  end
  object ODFReserves: TOracleDataSet
    SQL.Strings = (
      
        'select id,code,percent,description, percent||'#39'% - '#39'||description' +
        ' fulldesc from cm_reserves')
    Session = CMDataModule.CMSession
    Left = 80
    Top = 80
  end
  object Reserves: TDataSource
    DataSet = ODFReserves
    Left = 112
    Top = 80
  end
  object DueReserve: TDataSource
    DataSet = ODFReserves
    Left = 288
    Top = 80
  end
  object ODFUsers: TOracleDataSet
    SQL.Strings = (
      'select * from sb_user$')
    Session = CMDataModule.CMSession
    Left = 472
    Top = 78
  end
  object Users: TDataSource
    DataSet = ODFUsers
    Left = 504
    Top = 78
  end
  object ODFPersons: TOracleDataSet
    SQL.Strings = (
      'select * from cm_persons')
    Session = CMDataModule.CMSession
    Left = 88
    Top = 142
  end
  object Persons: TDataSource
    DataSet = ODFPersons
    Left = 120
    Top = 142
  end
  object ODFCategories: TOracleDataSet
    SQL.Strings = (
      'select * from cm_categories')
    Session = CMDataModule.CMSession
    Left = 240
    Top = 134
  end
  object Categories: TDataSource
    DataSet = ODFCategories
    Left = 272
    Top = 134
  end
  object ODFCrdTypes: TOracleDataSet
    SQL.Strings = (
      'select * from cm_credittypes')
    Session = CMDataModule.CMSession
    Left = 464
    Top = 134
  end
  object CrdType: TDataSource
    DataSet = ODFCrdTypes
    Left = 496
    Top = 134
  end
  object ODFPledges: TOracleDataSet
    SQL.Strings = (
      'select * from cm_pledges')
    Session = CMDataModule.CMSession
    Left = 96
    Top = 198
  end
  object Pledges: TDataSource
    DataSet = ODFPledges
    Left = 128
    Top = 198
  end
  object ODFCustomers: TOracleDataSet
    SQL.Strings = (
      'select * from sb_customers')
    Session = CMDataModule.CMSession
    Left = 296
    Top = 198
  end
  object Customers: TDataSource
    DataSet = ODFCustomers
    Left = 336
    Top = 198
  end
  object ODSPayInfo: TOracleDataSet
    SQL.Strings = (
      
        'SELECT rownum, creditid, groupname, boorower, crdnum, mainschedu' +
        'le, mainpayed, /*(-mainschedule+mainpayed) as maindiff */  intrs' +
        'chedule, intrpayed,  (-intrschedule+intrpayed) as intrdiff,irest'
      
        ' ,CREDITLINEAMMOUNT,SUMPAY,SUMSHEDULE,rest qaliq,(rest-(CREDITLI' +
        'NEAMMOUNT-SUMSHEDULE)) maindiff ,'
      
        'mainschedule-mainpayed "Я.Б цзря аз юдяниш" ,irest-intrpayed "Фа' +
        'из аз юдяниш",ESASHES,FAIZHES  FROM cm_report_payments p'
      'where creditid>0'
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
      ' order by groupname')
    QBEDefinition.QBEFieldDefs = {
      040000001400000006000000524F574E554D0100000000000800000043524544
      4954494401000000000008000000424F4F524F57455201000000000009000000
      47524F55504E414D45010000000000060000004352444E554D0100000000000C
      0000004D41494E5343484544554C45010000000000090000004D41494E504159
      4544010000000000080000004D41494E444946460100000000000C000000494E
      54525343484544554C4501000000000009000000494E54525041594544010000
      00000008000000494E5452444946460100000000000500000049524553540100
      00000000110000004352454449544C494E45414D4D4F554E5401000000000006
      00000053554D5041590100000000000A00000053554D53484544554C45010000
      0000000500000051414C495101000000000012000000DF2EC120F6E7F0FF20E0
      E720FEE4FFEDE8F80100000000000E000000D4E0E8E720E0E720FEE4FFEDE8F8
      0100000000000700000045534153484553010000000000070000004641495A48
      4553010000000000}
    Session = CMDataModule.CMSession
    Left = 560
    Top = 224
    object ODSPayInfoROWNUM: TFloatField
      FieldName = 'ROWNUM'
      Visible = False
    end
    object ODSPayInfoCREDITID: TFloatField
      FieldName = 'CREDITID'
      Visible = False
    end
    object ODSPayInfoGROUPNAME: TStringField
      DisplayLabel = 'МКТ'
      FieldName = 'GROUPNAME'
      Size = 127
    end
    object ODSPayInfoESASHES: TStringField
      DisplayLabel = 'Ссуда щесабы'
      FieldName = 'ESASHES'
      Size = 50
    end
    object ODSPayInfoFAIZHES: TStringField
      DisplayLabel = '% щесабы '
      FieldName = 'FAIZHES'
      Size = 50
    end
    object ODSPayInfoBOOROWER: TStringField
      DisplayLabel = 'Мцштяри'
      FieldName = 'BOOROWER'
      Size = 127
    end
    object ODSPayInfoCRDNUM: TStringField
      DisplayLabel = 'Мцгавиля №'
      FieldName = 'CRDNUM'
      Size = 30
    end
    object ODSPayInfoCREDITLINEAMMOUNT: TFloatField
      DisplayLabel = 'Кредитин мябляьи'
      FieldName = 'CREDITLINEAMMOUNT'
    end
    object ODSPayInfoSUMSHEDULE: TFloatField
      DisplayLabel = ' Юдянилмяли Я.Б.'
      FieldName = 'SUMSHEDULE'
    end
    object ODSPayInfoSUMPAY: TFloatField
      DisplayLabel = 'Юдянилмиш Я.Б.'
      FieldName = 'SUMPAY'
    end
    object ODSPayInfoIREST: TFloatField
      DisplayLabel = 'Фаиз Боржу'
      FieldName = 'IREST'
    end
    object ODSPayInfoINTRPAYED: TFloatField
      DisplayLabel = 'Юдянилмиш Ф.Б.'
      FieldName = 'INTRPAYED'
    end
    object ODSPayInfoINTRSCHEDULE: TFloatField
      DisplayLabel = 'Юдянилмяли Ф.Б.'
      FieldName = 'INTRSCHEDULE'
    end
    object ODSPayInfoMAINSCHEDULE: TFloatField
      DisplayLabel = 'Щесабат айында Юдянилмяли Я.Б.'
      FieldName = 'MAINSCHEDULE'
    end
    object ODSPayInfoMAINPAYED: TFloatField
      DisplayLabel = 'Щесабат айында юдянилмиш Я.Б.'
      FieldName = 'MAINPAYED'
    end
    object ODSPayInfoQALIQ: TFloatField
      DisplayLabel = 'Галыг мябляь'
      FieldName = 'QALIQ'
    end
    object ODSPayInfoMAINDIFF: TFloatField
      DisplayLabel = 'Фярг Я.Б.'
      FieldName = 'MAINDIFF'
    end
    object ODSPayInfoDSDesigner: TFloatField
      FieldName = 'Я.Б цзря аз юдяниш'
    end
    object ODSPayInfoDSDesigner2: TFloatField
      FieldName = 'Фаиз аз юдяниш'
    end
    object ODSPayInfoINTRDIFF: TFloatField
      DisplayLabel = 'Фярг Ф.Б.'
      FieldName = 'INTRDIFF'
    end
  end
  object Exporter: TCMExcelExport
    StyleColumnWidth = cwAutoFit
    ColumnWidth = 0
    FontTitles.Charset = RUSSIAN_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -13
    FontTitles.Name = 'Arial Az Lat'
    FontTitles.Style = []
    BorderTitles.BorderColor = clNavy
    BorderTitles.Weight = bwThick
    BorderTitles.LineStyle = blLine
    OrientationTitles = 0
    FontData.Charset = RUSSIAN_CHARSET
    FontData.Color = clNavy
    FontData.Height = -11
    FontData.Name = 'Azl Sans Serif'
    FontData.Style = [fsBold]
    BorderData.BorderColor = clNavy
    BorderData.Weight = bwThin
    BorderData.LineStyle = blLine
    FontSummary.Charset = RUSSIAN_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Azl Sans Serif'
    FontSummary.Style = []
    BorderSummary.BorderColor = clGreen
    SummaryFields.Strings = (
      'выакввпспвап')
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 72
    Top = 192
  end
end
