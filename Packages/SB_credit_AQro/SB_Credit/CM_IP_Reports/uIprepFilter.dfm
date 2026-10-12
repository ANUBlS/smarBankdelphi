object frmIpRepFilter: TfrmIpRepFilter
  Left = 305
  Top = 155
  BorderStyle = bsSingle
  Caption = 'frmIpRepFilter'
  ClientHeight = 305
  ClientWidth = 688
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 60
    Align = alTop
    TabOrder = 0
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
      Width = 254
      Height = 58
      Align = alClient
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
  object Panel2: TPanel
    Left = 0
    Top = 60
    Width = 688
    Height = 60
    Align = alTop
    TabOrder = 1
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
      Width = 254
      Height = 58
      Align = alClient
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
  object Panel5: TPanel
    Left = 0
    Top = 120
    Width = 688
    Height = 60
    Align = alTop
    TabOrder = 2
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
      Width = 254
      Height = 58
      Align = alClient
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
  object Panel9: TPanel
    Left = 0
    Top = 180
    Width = 688
    Height = 60
    Align = alTop
    TabOrder = 3
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
      Width = 470
      Height = 58
      Align = alClient
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
  object Panel3: TPanel
    Left = 0
    Top = 240
    Width = 688
    Height = 66
    Align = alTop
    TabOrder = 4
    object GroupBox13: TGroupBox
      Left = 1
      Top = 1
      Width = 686
      Height = 64
      Align = alClient
      Caption = 'Щесабат'
      TabOrder = 0
      object Gauge1: TGauge
        Left = 69
        Top = 37
        Width = 336
        Height = 24
        BackColor = clBlue
        Color = clRed
        ForeColor = clAqua
        ParentColor = False
        Progress = 0
        Visible = False
      end
      object CheckBox13: TCheckBox
        Left = 5
        Top = 38
        Width = 64
        Height = 17
        Caption = 'Тятбиг ет'
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 0
      end
      object DBLookupComboboxEh13: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 396
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        EditButtons = <>
        KeyField = 'PROCNAME'
        ListField = 'FULLNAME'
        ListSource = reportSettings
        TabOrder = 1
        Visible = True
      end
      object Button1: TButton
        Left = 603
        Top = 17
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Чап'
        TabOrder = 2
        OnClick = Button1Click
      end
      object rbRepType: TRadioGroup
        Left = 520
        Top = 0
        Width = 81
        Height = 63
        Caption = 'Hesabat tipi'
        ItemIndex = 1
        Items.Strings = (
          'Excel'
          'QReport')
        TabOrder = 3
      end
      object GroupBox12: TGroupBox
        Left = 408
        Top = 0
        Width = 114
        Height = 63
        Caption = 'Ачылма тарихи'
        TabOrder = 4
        object dtp1: TDateTimePicker
          Left = 8
          Top = 16
          Width = 98
          Height = 21
          CalAlignment = dtaLeft
          Date = 39323.7266870949
          Time = 39323.7266870949
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
        end
        object dtp2: TDateTimePicker
          Left = 8
          Top = 38
          Width = 98
          Height = 21
          CalAlignment = dtaLeft
          Date = 39323.7266870949
          Time = 39323.7266870949
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 1
        end
      end
    end
  end
  object ODSCredits: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select id from cm_active'
      ''
      ''
      ''
      ''
      '')
    Session = CMDataModule.CMSession
    Left = 400
    Top = 216
  end
  object CM_IP_REPORTS: TOraclePackage
    Session = CMDataModule.CMSession
    PackageName = 'CM_IP_REPORTS'
    Left = 432
    Top = 216
  end
  object ODSBoorInfo: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      
        'SELECT rownum,creditid, name, age, birthdate, address, worknpost' +
        ', to_number(moneymoney) moneymoney,'
      '       credamtgiven, credamtym, credperiodcred, credperiodym,'
      '       credperccred, credpercym'
      '  FROM cm_ip_boorowerinfo')
    QBEDefinition.QBEFieldDefs = {
      040000000E00000006000000524F574E554D0100000000000800000043524544
      49544944010000000000040000004E414D450100000000000300000041474501
      0000000000090000004249525448444154450100000000000700000041444452
      45535301000000000009000000574F524B4E504F53540100000000000A000000
      4D4F4E45594D4F4E45590100000000000C00000043524544414D54474956454E
      0100000000000900000043524544414D54594D0100000000000E000000435245
      44504552494F44435245440100000000000C00000043524544504552494F4459
      4D0100000000000C0000004352454450455243435245440100000000000A0000
      004352454450455243594D010000000000}
    Session = CMDataModule.CMSession
    Left = 496
    Top = 184
    object ODSBoorInfoROWNUM: TFloatField
      FieldName = 'ROWNUM'
      Visible = False
    end
    object ODSBoorInfoCREDITID: TFloatField
      FieldName = 'CREDITID'
      Visible = False
    end
    object ODSBoorInfoNAME: TStringField
      DisplayLabel = 'Мцштяри'
      FieldName = 'NAME'
      Size = 127
    end
    object ODSBoorInfoAGE: TFloatField
      DisplayLabel = 'Йашы'
      FieldName = 'AGE'
    end
    object ODSBoorInfoBIRTHDATE: TDateTimeField
      DisplayLabel = 'Доьум тарихи'
      FieldName = 'BIRTHDATE'
    end
    object ODSBoorInfoADDRESS: TStringField
      DisplayLabel = 'Цнваны'
      FieldName = 'ADDRESS'
      Size = 63
    end
    object ODSBoorInfoWORKNPOST: TStringField
      DisplayLabel = 'Иш йери'
      FieldName = 'WORKNPOST'
      Size = 127
    end
    object ODSBoorInfoMONEYMONEY: TFloatField
      DisplayLabel = 'Айлыг эялири'
      FieldName = 'MONEYMONEY'
    end
    object ODSBoorInfoCREDAMTGIVEN: TFloatField
      DisplayLabel = 'Вер. кред. мябляьи'
      FieldName = 'CREDAMTGIVEN'
    end
    object ODSBoorInfoCREDAMTYM: TFloatField
      DisplayLabel = 'Й/М-миш кред. мябляьи'
      FieldName = 'CREDAMTYM'
    end
    object ODSBoorInfoCREDPERIODCRED: TFloatField
      DisplayLabel = 'Кредит мцддяти'
      FieldName = 'CREDPERIODCRED'
    end
    object ODSBoorInfoCREDPERIODYM: TFloatField
      DisplayLabel = 'Й/М мцддяти'
      FieldName = 'CREDPERIODYM'
    end
    object ODSBoorInfoCREDPERCCRED: TFloatField
      DisplayLabel = 'Кредит фаизи'
      FieldName = 'CREDPERCCRED'
    end
    object ODSBoorInfoCREDPERCYM: TFloatField
      DisplayLabel = 'Й/М фаизи'
      FieldName = 'CREDPERCYM'
    end
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = 'Филтер панели'
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
    Left = 88
    Top = 198
  end
  object Pledges: TDataSource
    DataSet = ODFPledges
    Left = 120
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
  object ODSMKTsInfo: TOracleDataSet
    SQL.Strings = (
      'select ROWNUM, a.*'
      
        '  from (select   mktname,bank_kod1, sum (1) boorcnt, sum (givenc' +
        'ount)/1000 givencount,'
      
        '                 sum (givenamount)/1000 givenamount,sum (ymamoun' +
        't)/1000 ymamount, '
      '                 sum (REST)/1000 REST,'
      '                 sum (CLOSECRDCOUNT) CLOSECRDCOUNT,'
      
        '                 sum(CLOSECRDYMAMOUNT)/1000 CLOSECRDYMAMOUNT,sum' +
        '(fakcredcount) as fakcredcount,'
      
        '                 sum(fakymkrcount) as fakymkrcount, sum(fakymkrr' +
        'est)/1000as fakymkrrest'
      '            from cm_ip_mktsinfo'
      '        group by mktname,bank_kod1 order by bank_kod1) a'
      '')
    QBEDefinition.QBEFieldDefs = {
      040000000D00000006000000524F574E554D010000000000070000004D4B544E
      414D4501000000000007000000424F4F52434E540100000000000A0000004749
      56454E434F554E540100000000000B000000474956454E414D4F554E54010000
      00000008000000594D414D4F554E540100000000000400000052455354010000
      0000000D000000434C4F5345435244434F554E5401000000000010000000434C
      4F5345435244594D414D4F554E540100000000000C00000046414B4352454443
      4F554E540100000000000C00000046414B594D4B52434F554E54010000000000
      0B00000046414B594D4B52524553540100000000000900000042414E4B5F4B4F
      4431010000000000}
    Session = CMDataModule.CMSession
    Left = 528
    Top = 160
    object ODSMKTsInfoROWNUM: TFloatField
      FieldName = 'ROWNUM'
      Visible = False
    end
    object ODSMKTsInfoMKTNAME: TStringField
      DisplayLabel = 'МКТ'
      FieldName = 'MKTNAME'
      Size = 100
    end
    object ODSMKTsInfoBOORCNT: TFloatField
      DisplayLabel = 'Мцштяри сайы'
      FieldName = 'BOORCNT'
    end
    object ODSMKTsInfoFAKCREDCOUNT: TFloatField
      DisplayLabel = 'Фактики сай'
      FieldName = 'FAKCREDCOUNT'
    end
    object ODSMKTsInfoGIVENAMOUNT: TFloatField
      DisplayLabel = 'Банк тяряфиндян верилмиш мяб.'
      FieldName = 'GIVENAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object ODSMKTsInfoYMAMOUNT: TFloatField
      DisplayLabel = 'Й/М мябляь'
      FieldName = 'YMAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object ODSMKTsInfoREST: TFloatField
      DisplayLabel = 'Галыг'
      FieldName = 'REST'
      DisplayFormat = '#,##0.00'
    end
    object ODSMKTsInfoCLOSECRDCOUNT: TFloatField
      DisplayLabel = 'Баьланмыш.сайы'
      FieldName = 'CLOSECRDCOUNT'
    end
    object ODSMKTsInfoCLOSECRDYMAMOUNT: TFloatField
      DisplayLabel = 'Баьланмыш.Й/М мябляь'
      FieldName = 'CLOSECRDYMAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object ODSMKTsInfoFAKYMKRREST: TFloatField
      DisplayLabel = 'Эцзяштли галыг'
      FieldName = 'FAKYMKRREST'
      DisplayFormat = '#,##0.00'
    end
    object ODSMKTsInfoFAKYMKRCOUNT: TFloatField
      DisplayLabel = 'Эцзяштли сай'
      FieldName = 'FAKYMKRCOUNT'
    end
  end
  object ODFReport: TOracleDataSet
    SQL.Strings = (
      ''
      'select * from cm_ip_repsettings')
    Session = CMDataModule.CMSession
    Left = 352
    Top = 264
    object ODFReportFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 127
    end
    object ODFReportDATASET: TStringField
      FieldName = 'DATASET'
      Size = 31
    end
    object ODFReportPROCNAME: TStringField
      FieldName = 'PROCNAME'
      Size = 31
    end
    object ODFReportQRNAME: TStringField
      FieldName = 'QRNAME'
      Size = 31
    end
  end
  object reportSettings: TDataSource
    DataSet = ODFReport
    Left = 321
    Top = 265
  end
  object ODSMKTInfo: TOracleDataSet
    SQL.Strings = (
      
        'SELECT rownum, creditid, aktno, boorower, credamountgiven, creda' +
        'mountym,'
      
        '       credamountpayed, credamountrest, percentagemkt, percentag' +
        'eaif,'
      
        '       periodcredit, periodym, anuitet, contractdate, contractno' +
        ','
      '       ipcontractdate, ipcontractno, mktname, tickno'
      '  FROM cm_ip_mktinfo'
      ' order by mktname')
    QBEDefinition.QBEFieldDefs = {
      040000001300000006000000524F574E554D0100000000000800000043524544
      4954494401000000000005000000414B544E4F01000000000008000000424F4F
      524F5745520100000000000F00000043524544414D4F554E54474956454E0100
      000000000C00000043524544414D4F554E54594D0100000000000F0000004352
      4544414D4F554E5450415945440100000000000E00000043524544414D4F554E
      54524553540100000000000D00000050455243454E544147454D4B5401000000
      00000D00000050455243454E544147454149460100000000000C000000504552
      494F4443524544495401000000000008000000504552494F44594D0100000000
      0007000000414E55495445540100000000000C000000434F4E54524143544441
      54450100000000000A000000434F4E54524143544E4F0100000000000E000000
      4950434F4E5452414354444154450100000000000C0000004950434F4E545241
      43544E4F010000000000070000004D4B544E414D450100000000000600000054
      49434B4E4F010000000000}
    Session = CMDataModule.CMSession
    Left = 464
    Top = 184
    object ODSMKTInfoROWNUM: TFloatField
      FieldName = 'ROWNUM'
      Visible = False
    end
    object ODSMKTInfoCREDITID: TFloatField
      FieldName = 'CREDITID'
      Visible = False
    end
    object ODSMKTInfoAKTNO: TStringField
      DisplayLabel = 'Тящ. тяс. акт №'
      FieldName = 'AKTNO'
      Size = 10
    end
    object ODSMKTInfoBOOROWER: TStringField
      DisplayLabel = 'Мцштяри'
      FieldName = 'BOOROWER'
      Size = 127
    end
    object ODSMKTInfoCREDAMOUNTGIVEN: TFloatField
      DisplayLabel = 'Верилмиш мябляь'
      FieldName = 'CREDAMOUNTGIVEN'
    end
    object ODSMKTInfoCREDAMOUNTYM: TFloatField
      DisplayLabel = 'Й/М-миш мябляь'
      FieldName = 'CREDAMOUNTYM'
    end
    object ODSMKTInfoCREDAMOUNTPAYED: TFloatField
      DisplayLabel = 'Юдянилмиш мябляь'
      FieldName = 'CREDAMOUNTPAYED'
    end
    object ODSMKTInfoCREDAMOUNTREST: TFloatField
      DisplayLabel = 'Галыг мябляь'
      FieldName = 'CREDAMOUNTREST'
    end
    object ODSMKTInfoPERCENTAGEMKT: TFloatField
      DisplayLabel = 'Фаиз дяр МКТ'
      FieldName = 'PERCENTAGEMKT'
    end
    object ODSMKTInfoPERCENTAGEAIF: TFloatField
      DisplayLabel = 'Фаиз дяр АИФ'
      FieldName = 'PERCENTAGEAIF'
    end
    object ODSMKTInfoPERIODCREDIT: TFloatField
      DisplayLabel = 'Кредит мцддяти'
      FieldName = 'PERIODCREDIT'
    end
    object ODSMKTInfoPERIODYM: TFloatField
      DisplayLabel = 'Й/М мцддяти'
      FieldName = 'PERIODYM'
    end
    object ODSMKTInfoANUITET: TFloatField
      DisplayLabel = 'Аннуитет'
      FieldName = 'ANUITET'
    end
    object ODSMKTInfoCONTRACTDATE: TDateTimeField
      DisplayLabel = 'Кред мцг тярихи'
      FieldName = 'CONTRACTDATE'
    end
    object ODSMKTInfoCONTRACTNO: TStringField
      DisplayLabel = 'Кред мцг №'
      FieldName = 'CONTRACTNO'
    end
    object ODSMKTInfoIPCONTRACTDATE: TDateTimeField
      DisplayLabel = 'Ип. пред. тарихи'
      FieldName = 'IPCONTRACTDATE'
    end
    object ODSMKTInfoIPCONTRACTNO: TStringField
      DisplayLabel = 'Ип. пред. №'
      FieldName = 'IPCONTRACTNO'
    end
    object ODSMKTInfoMKTNAME: TStringField
      FieldName = 'MKTNAME'
      Size = 100
    end
    object ODSMKTInfoTICKNO: TStringField
      FieldName = 'TICKNO'
    end
  end
  object ODSInsurInfo: TOracleDataSet
    SQL.Strings = (
      'SELECT rownum, m.* FROM (select * '
      '  FROM cm_ip_insuranceinfo m'
      ''
      ''
      ''
      ''
      ''
      ''
      'order by mktname'
      ') m')
    QBEDefinition.QBEFieldDefs = {
      040000001100000006000000524F574E554D0100000000000800000043524544
      49544944010000000000070000004D4B544E414D450100000000000800000042
      4F4F524F57455201000000000009000000435244414D4F554E54010000000000
      09000000435244504552494F44010000000000060000004352444E554D010000
      00000007000000435244444154450100000000000A00000050455253414D4F55
      4E540100000000000A00000050455253504552494F440100000000000B000000
      504552534C4153544441540100000000000A00000050524F50414D4F554E5401
      00000000000A00000050524F50504552494F440100000000000B00000050524F
      504C41535444415401000000000010000000494E535552414E4345434F4D5041
      4E590100000000000B000000494E535552414E43454E4F0100000000000D0000
      00494E535552414E434544415445010000000000}
    Session = CMDataModule.CMSession
    Left = 560
    Top = 184
    object ODSInsurInfoROWNUM: TFloatField
      FieldName = 'ROWNUM'
      Visible = False
    end
    object ODSInsurInfoCREDITID: TFloatField
      FieldName = 'CREDITID'
      Visible = False
    end
    object ODSInsurInfoMKTNAME: TStringField
      DisplayLabel = 'MKT'
      FieldName = 'MKTNAME'
      Size = 100
    end
    object ODSInsurInfoBOOROWER: TStringField
      DisplayLabel = 'Мцштяри'
      FieldName = 'BOOROWER'
      Size = 127
    end
    object ODSInsurInfoCRDAMOUNT: TFloatField
      DisplayLabel = 'Кред мябляьи'
      FieldName = 'CRDAMOUNT'
    end
    object ODSInsurInfoCRDPERIOD: TFloatField
      DisplayLabel = 'Кред. периоду'
      FieldName = 'CRDPERIOD'
    end
    object ODSInsurInfoCRDNUM: TStringField
      DisplayLabel = 'Кред. №'
      FieldName = 'CRDNUM'
      Size = 31
    end
    object ODSInsurInfoCRDDATE: TDateTimeField
      DisplayLabel = 'Кред. тарихи'
      FieldName = 'CRDDATE'
    end
    object ODSInsurInfoPERSAMOUNT: TFloatField
      DisplayLabel = 'Фяр. гяз. мяб.'
      FieldName = 'PERSAMOUNT'
    end
    object ODSInsurInfoPERSPERIOD: TFloatField
      DisplayLabel = 'Фяр. гяз. мцд.'
      FieldName = 'PERSPERIOD'
    end
    object ODSInsurInfoPERSLASTDAT: TDateTimeField
      DisplayLabel = 'Фяр. гяз. битмя тарихи'
      FieldName = 'PERSLASTDAT'
    end
    object ODSInsurInfoPROPAMOUNT: TFloatField
      DisplayLabel = 'Ям. гяз. мяб.'
      FieldName = 'PROPAMOUNT'
    end
    object ODSInsurInfoPROPPERIOD: TFloatField
      DisplayLabel = 'Ям. гяз. мцд.'
      FieldName = 'PROPPERIOD'
    end
    object ODSInsurInfoPROPLASTDAT: TDateTimeField
      DisplayLabel = 'Ям. гяз. битмя тарихи'
      FieldName = 'PROPLASTDAT'
    end
    object ODSInsurInfoINSURANCECOMPANY: TStringField
      DisplayLabel = 'Сыьорта ширкятини ады'
      FieldName = 'INSURANCECOMPANY'
      Size = 180
    end
    object ODSInsurInfoINSURANCENO: TStringField
      DisplayLabel = 'Сыьорта полисинин №-си'
      FieldName = 'INSURANCENO'
      Size = 50
    end
    object ODSInsurInfoINSURANCEDATE: TDateTimeField
      DisplayLabel = 'сыьорта полисинин тарихи'
      FieldName = 'INSURANCEDATE'
    end
  end
  object ODSDateInfo: TOracleDataSet
    SQL.Strings = (
      ''
      'SELECT rownum, p.* from (select *'
      '  FROM cm_ip_dateinfo order by mktname)p'
      '')
    QBEDefinition.QBEFieldDefs = {
      040000001400000006000000524F574E554D0100000000000800000043524544
      49544944010000000000040000004E414D450100000000000A000000414E4445
      5246495253540100000000000A000000414E4445524950524544010000000000
      0A000000414E444552414E4B45540100000000000A000000414E444552524550
      5254010000000000090000004352444E554D4245520100000000000800000043
      5244464952535401000000000008000000435244504159454401000000000009
      00000042555953454C4E554D0100000000000900000042555953454C50415901
      00000000000A00000049504F54454B414E554D0100000000000C00000049504F
      54454B4150415045520100000000000F00000049504F54454B41524554504150
      455201000000000005000000594D41494601000000000006000000594D42494C
      4401000000000008000000594D54454856494C01000000000004000000594D54
      49010000000000070000004D4B544E414D45010000000000}
    Session = CMDataModule.CMSession
    Left = 623
    Top = 184
    object ODSDateInfoROWNUM: TFloatField
      FieldName = 'ROWNUM'
      Visible = False
    end
    object ODSDateInfoCREDITID: TFloatField
      FieldName = 'CREDITID'
      Visible = False
    end
    object ODSDateInfoMKTNAME: TStringField
      DisplayLabel = 'MKT'
      FieldName = 'MKTNAME'
      Size = 127
    end
    object ODSDateInfoNAME: TStringField
      DisplayLabel = 'Мцштяри'
      FieldName = 'NAME'
      Size = 127
    end
    object ODSDateInfoANDERFIRST: TDateTimeField
      DisplayLabel = 'Анд. илк. гийм'
      FieldName = 'ANDERFIRST'
    end
    object ODSDateInfoANDERIPRED: TDateTimeField
      DisplayLabel = 'Анд. ип. пред'
      FieldName = 'ANDERIPRED'
    end
    object ODSDateInfoANDERANKET: TDateTimeField
      DisplayLabel = 'Анд. анкет'
      FieldName = 'ANDERANKET'
    end
    object ODSDateInfoANDERREPRT: TDateTimeField
      DisplayLabel = 'Анд. щесабат'
      FieldName = 'ANDERREPRT'
    end
    object ODSDateInfoCRDNUMBER: TDateTimeField
      DisplayLabel = 'кред. мцг.'
      FieldName = 'CRDNUMBER'
    end
    object ODSDateInfoCRDFIRST: TDateTimeField
      DisplayLabel = 'Илкин юдян.'
      FieldName = 'CRDFIRST'
    end
    object ODSDateInfoCRDPAYED: TDateTimeField
      DisplayLabel = 'кред кюч-си'
      FieldName = 'CRDPAYED'
    end
    object ODSDateInfoBUYSELNUM: TDateTimeField
      DisplayLabel = 'алгы-сатгы мцг.'
      FieldName = 'BUYSELNUM'
    end
    object ODSDateInfoBUYSELPAY: TDateTimeField
      DisplayLabel = 'сатыжы иля щес'
      FieldName = 'BUYSELPAY'
    end
    object ODSDateInfoIPOTEKANUM: TDateTimeField
      DisplayLabel = 'ипот. мцг.'
      FieldName = 'IPOTEKANUM'
    end
    object ODSDateInfoIPOTEKAPAPER: TDateTimeField
      DisplayLabel = 'ип. каь. илк. гейд'
      FieldName = 'IPOTEKAPAPER'
    end
    object ODSDateInfoIPOTEKARETPAPER: TDateTimeField
      DisplayLabel = 'ип. каь. тяк. гейд'
      FieldName = 'IPOTEKARETPAPER'
    end
    object ODSDateInfoYMAIF: TDateTimeField
      DisplayLabel = 'AIF-я мцражият'
      FieldName = 'YMAIF'
    end
    object ODSDateInfoYMBILD: TDateTimeField
      DisplayLabel = 'Билдириш'
      FieldName = 'YMBILD'
    end
    object ODSDateInfoYMTEHVIL: TDateTimeField
      DisplayLabel = 'Тяшв. тясл.'
      FieldName = 'YMTEHVIL'
    end
    object ODSDateInfoYMTI: TDateTimeField
      DisplayLabel = 'Тикет'
      FieldName = 'YMTI'
    end
  end
  object ODSPredInfo: TOracleDataSet
    SQL.Strings = (
      'SELECT rownum, p.* from (select *'
      '  FROM cm_ip_predmetinfo order by mktname)p')
    QBEDefinition.QBEFieldDefs = {
      040000001100000006000000524F574E554D0100000000000800000043524544
      49544944010000000000070000004D4B544E414D450100000000000800000042
      4F4F524F57455201000000000007000000495050415354450100000000000500
      0000504144445201000000000006000000505052494345010000000000050000
      005041524541010000000000090000004950434F4E544E554D01000000000009
      0000004950434F4E54444154010000000000090000004950415045524E554D01
      0000000000090000004950415045524441540100000000000900000049504558
      54524E554D010000000000090000004950455854524441540100000000000600
      0000504649524D41010000000000050000005044415445010000000000060000
      00504152415A49010000000000}
    Session = CMDataModule.CMSession
    Left = 591
    Top = 184
    object ODSPredInfoROWNUM: TFloatField
      FieldName = 'ROWNUM'
      Visible = False
    end
    object ODSPredInfoCREDITID: TFloatField
      FieldName = 'CREDITID'
      Visible = False
    end
    object ODSPredInfoMKTNAME: TStringField
      DisplayLabel = 'MKT'
      FieldName = 'MKTNAME'
      Size = 100
    end
    object ODSPredInfoBOOROWER: TStringField
      DisplayLabel = 'Мцштяри'
      FieldName = 'BOOROWER'
      Size = 127
    end
    object ODSPredInfoIPPASTE: TStringField
      DisplayLabel = 'Ипотека гойан'
      FieldName = 'IPPASTE'
      Size = 127
    end
    object ODSPredInfoPADDR: TStringField
      DisplayLabel = 'цнваны'
      FieldName = 'PADDR'
      Size = 50
    end
    object ODSPredInfoPPRICE: TFloatField
      DisplayLabel = 'мябляьи'
      FieldName = 'PPRICE'
    end
    object ODSPredInfoPAREA: TFloatField
      DisplayLabel = 'сащяси'
      FieldName = 'PAREA'
    end
    object ODSPredInfoIPCONTNUM: TStringField
      DisplayLabel = 'мцг. №'
      FieldName = 'IPCONTNUM'
      Size = 50
    end
    object ODSPredInfoIPCONTDAT: TDateTimeField
      DisplayLabel = 'мцг. тарихи'
      FieldName = 'IPCONTDAT'
    end
    object ODSPredInfoIPAPERNUM: TStringField
      DisplayLabel = 'Ип. каьызы №'
      FieldName = 'IPAPERNUM'
      Size = 50
    end
    object ODSPredInfoIPAPERDAT: TDateTimeField
      DisplayLabel = 'Ип. каьызы тарихи'
      FieldName = 'IPAPERDAT'
    end
    object ODSPredInfoIPEXTRNUM: TStringField
      DisplayLabel = 'Йцк. №'
      FieldName = 'IPEXTRNUM'
      Size = 50
    end
    object ODSPredInfoIPEXTRDAT: TDateTimeField
      DisplayLabel = 'Йцк. тярихи'
      FieldName = 'IPEXTRDAT'
    end
    object ODSPredInfoPFIRMA: TStringField
      DisplayLabel = 'Гийм. ширкят'
      FieldName = 'PFIRMA'
      Size = 100
    end
    object ODSPredInfoPDATE: TDateTimeField
      DisplayLabel = 'Гийм. тарихи'
      FieldName = 'PDATE'
    end
    object ODSPredInfoPARAZI: TStringField
      DisplayLabel = 'ярази'
      FieldName = 'PARAZI'
      Size = 100
    end
  end
  object ODSALEVInfo: TOracleDataSet
    SQL.Strings = (
      'SELECT rownum, p.* from (select *'
      '  FROM cm_ip_alevinfo order by mktname)p')
    QBEDefinition.QBEFieldDefs = {
      040000000900000006000000524F574E554D0100000000000800000043524544
      49544944010000000000070000004D4B544E414D450100000000000800000042
      4F4F524F57455201000000000006000000504152415A49010000000000050000
      0050414444520100000000000600000050505249434501000000000005000000
      5041524541010000000000050000005044415445010000000000}
    Session = CMDataModule.CMSession
    Left = 657
    Top = 184
    object ODSALEVInfoROWNUM: TFloatField
      FieldName = 'ROWNUM'
      Visible = False
    end
    object ODSALEVInfoCREDITID: TFloatField
      FieldName = 'CREDITID'
      Visible = False
    end
    object ODSALEVInfoMKTNAME: TStringField
      DisplayLabel = 'MKT'
      FieldName = 'MKTNAME'
      Size = 100
    end
    object ODSALEVInfoBOOROWER: TStringField
      DisplayLabel = 'Мцштяри'
      FieldName = 'BOOROWER'
      Size = 127
    end
    object ODSALEVInfoPARAZI: TStringField
      DisplayLabel = 'Ярази'
      FieldName = 'PARAZI'
      Size = 100
    end
    object ODSALEVInfoPADDR: TStringField
      DisplayLabel = 'Цнван'
      FieldName = 'PADDR'
      Size = 50
    end
    object ODSALEVInfoPPRICE: TFloatField
      DisplayLabel = 'Гиймят'
      FieldName = 'PPRICE'
    end
    object ODSALEVInfoPAREA: TFloatField
      DisplayLabel = 'Сащя'
      FieldName = 'PAREA'
    end
    object ODSALEVInfoPDATE: TDateTimeField
      DisplayLabel = 'Тарих'
      FieldName = 'PDATE'
    end
  end
  object ODSPschedInfo: TOracleDataSet
    SQL.Strings = (
      
        'SELECT a.creditid, a.paymentdate, a.principal, a.restbefore, a.r' +
        'estafter, u.description mktname,'
      '       b.name boorowername, p.numberofcredit crdnum, a.interest'
      
        '  FROM cm_ip_pschedule a, cm_portfolio p, cm_usergroups u, cm_bo' +
        'orowerinfo b'
      ' where a.creditid = p.id and p.usrgroup=u.id and p.id=b.creditid'
      'order by a.creditid, a.paymentdate')
    QBEDefinition.QBEFieldDefs = {
      04000000090000000800000043524544495449440100000000000B0000005041
      594D454E5444415445010000000000090000005052494E434950414C01000000
      00000A000000524553544245464F524501000000000009000000524553544146
      544552010000000000070000004D4B544E414D450100000000000C000000424F
      4F524F5745524E414D45010000000000060000004352444E554D010000000000
      08000000494E544552455354010000000000}
    Session = CMDataModule.CMSession
    Left = 435
    Top = 184
    object ODSPschedInfoCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object ODSPschedInfoPAYMENTDATE: TDateTimeField
      FieldName = 'PAYMENTDATE'
      Required = True
    end
    object ODSPschedInfoPRINCIPAL: TFloatField
      FieldName = 'PRINCIPAL'
      Required = True
    end
    object ODSPschedInfoRESTBEFORE: TFloatField
      FieldName = 'RESTBEFORE'
    end
    object ODSPschedInfoRESTAFTER: TFloatField
      FieldName = 'RESTAFTER'
    end
    object ODSPschedInfoMKTNAME: TStringField
      FieldName = 'MKTNAME'
      Size = 255
    end
    object ODSPschedInfoBOOROWERNAME: TStringField
      FieldName = 'BOOROWERNAME'
      Size = 64
    end
    object ODSPschedInfoCRDNUM: TStringField
      FieldName = 'CRDNUM'
      Size = 32
    end
    object ODSPschedInfoINTEREST: TFloatField
      FieldName = 'INTEREST'
      Required = True
    end
  end
  object Exporter: TCMExcelExport
    ConnectTo = ctNewInstance
    StyleColumnWidth = cwAutoFit
    ColumnWidth = 0
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clNavy
    FontTitles.Height = -13
    FontTitles.Name = 'Azl Sans Serif'
    FontTitles.Style = [fsBold]
    BorderTitles.Weight = bwThin
    BorderTitles.LineStyle = blLine
    OrientationTitles = 0
    FontData.Charset = RUSSIAN_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Azl Sans Serif'
    FontData.Style = []
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Azl Sans Serif'
    FontSummary.Style = []
    SummaryFields.Strings = (
      'IPOTEKA ')
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 344
    Top = 168
  end
  object MKT: TOracleDataSet
    SQL.Strings = (
      'select ROWNUM, a.*'
      
        '  from (select   mktname,bank_kod2, sum (1) boorcnt, sum (givenc' +
        'ount)/1000 givencount,'
      
        '                 sum (givenamount)/1000 givenamount,sum (ymamoun' +
        't)/1000 ymamount, '
      '                 sum (REST)/1000 REST,'
      '                 sum (CLOSECRDCOUNT) CLOSECRDCOUNT,'
      
        '                 sum(CLOSECRDYMAMOUNT)/1000 CLOSECRDYMAMOUNT,sum' +
        '(fakcredcount) as fakcredcount,'
      
        '                 sum(fakymkrcount) as fakymkrcount, sum(fakymkrr' +
        'est)/1000as fakymkrrest'
      '            from cm_ip_mktsinfo where bank_kod2 is not null'
      '        group by mktname,bank_kod2 order by bank_kod2) a'
      '')
    QBEDefinition.QBEFieldDefs = {
      040000000C00000006000000524F574E554D010000000000070000004D4B544E
      414D4501000000000007000000424F4F52434E540100000000000A0000004749
      56454E434F554E540100000000000B000000474956454E414D4F554E54010000
      00000008000000594D414D4F554E540100000000000400000052455354010000
      0000000D000000434C4F5345435244434F554E5401000000000010000000434C
      4F5345435244594D414D4F554E540100000000000C00000046414B4352454443
      4F554E540100000000000C00000046414B594D4B52434F554E54010000000000
      0B00000046414B594D4B5252455354010000000000}
    Session = CMDataModule.CMSession
    Left = 529
    Top = 213
    object MKTROWNUM: TFloatField
      DisplayLabel = '№'
      FieldName = 'ROWNUM'
    end
    object MKTMKTNAME: TStringField
      DisplayLabel = 'МКТ'
      FieldName = 'MKTNAME'
      Size = 100
    end
    object MKTBOORCNT: TFloatField
      DisplayLabel = 'Мцштяри сайы'
      FieldName = 'BOORCNT'
    end
    object MKTFAKYMKRCOUNT: TFloatField
      DisplayLabel = 'Фактики сай'
      FieldName = 'FAKYMKRCOUNT'
    end
    object MKTGIVENAMOUNT: TFloatField
      DisplayLabel = 'Банк тяряфиндян верилмиш мяб.'
      FieldName = 'GIVENAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object MKTYMAMOUNT: TFloatField
      DisplayLabel = 'Й/М мябляь'
      FieldName = 'YMAMOUNT'
    end
    object MKTREST: TFloatField
      DisplayLabel = 'Галыг'
      FieldName = 'REST'
      DisplayFormat = '#,##0.00'
    end
    object MKTCLOSECRDCOUNT: TFloatField
      DisplayLabel = 'Баьланмыш.сайы'
      FieldName = 'CLOSECRDCOUNT'
    end
    object MKTCLOSECRDYMAMOUNT: TFloatField
      DisplayLabel = 'Баьланмыш.Й/М мябляь'
      FieldName = 'CLOSECRDYMAMOUNT'
    end
    object MKTFAKYMKRREST: TFloatField
      DisplayLabel = 'Эцзяштли галыг'
      FieldName = 'FAKYMKRREST'
    end
    object MKTFAKCREDCOUNT: TFloatField
      DisplayLabel = 'Эцзяштли сай'
      FieldName = 'FAKCREDCOUNT'
    end
  end
end
