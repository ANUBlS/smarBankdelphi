object frmIpRepFilter: TfrmIpRepFilter
  Left = 305
  Top = 155
  BorderStyle = bsSingle
  Caption = 'frmIpRepFilter'
  ClientHeight = 328
  ClientWidth = 741
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
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 741
    Height = 65
    Align = alTop
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 233
      Height = 63
      Align = alLeft
      Caption = #1042#1072#1083#1081#1091#1090#1072
      TabOrder = 0
      object CheckBox1: TCheckBox
        Left = 5
        Top = 41
        Width = 105
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 0
      end
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 220
        Height = 22
        EditButtons = <>
        KeyField = 'VALUTE'
        ListField = 'VALU_NAME'
        ListSource = Valute
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox2: TGroupBox
      Left = 466
      Top = 1
      Width = 274
      Height = 63
      Align = alClient
      Caption = #1052#1050#1058
      TabOrder = 1
      object DBLookupComboboxEh3: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 255
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = UsrGroup
        TabOrder = 0
        Visible = True
      end
      object CheckBox3: TCheckBox
        Left = 5
        Top = 41
        Width = 105
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 234
      Top = 1
      Width = 232
      Height = 63
      Align = alLeft
      Caption = #1060#1080#1083#1080#1072#1083
      TabOrder = 2
      object DBLookupComboboxEh2: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 220
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = Branch
        TabOrder = 0
        Visible = True
      end
      object CheckBox2: TCheckBox
        Left = 6
        Top = 41
        Width = 105
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 741
    Height = 64
    Align = alTop
    TabOrder = 1
    object GroupBox4: TGroupBox
      Left = 1
      Top = 1
      Width = 233
      Height = 62
      Align = alLeft
      Caption = #1058#1103#1089#1085#1080#1092#1072#1090
      TabOrder = 0
      object CheckBox4: TCheckBox
        Left = 5
        Top = 41
        Width = 105
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 0
      end
      object DBLookupComboboxEh4: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 220
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'FULLDESC'
        ListSource = Reserves
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox5: TGroupBox
      Left = 466
      Top = 1
      Width = 274
      Height = 62
      Align = alClient
      Caption = #1048#1089#1090#1080#1092#1072#1076#1103#1095#1080
      TabOrder = 1
      object DBLookupComboboxEh6: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 255
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = Users
        TabOrder = 0
        Visible = True
      end
      object CheckBox6: TCheckBox
        Left = 5
        Top = 41
        Width = 105
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 1
      end
    end
    object GroupBox6: TGroupBox
      Left = 234
      Top = 1
      Width = 232
      Height = 62
      Align = alLeft
      Caption = #1069#1077#1078#1080#1082#1084#1080#1096' '#1090#1103#1089#1085#1080#1092#1072#1090
      TabOrder = 2
      object DBLookupComboboxEh5: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 220
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'FULLDESC'
        ListSource = DueReserve
        TabOrder = 0
        Visible = True
      end
      object CheckBox5: TCheckBox
        Left = 8
        Top = 41
        Width = 104
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 1
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 129
    Width = 741
    Height = 65
    Align = alTop
    TabOrder = 2
    object GroupBox7: TGroupBox
      Left = 1
      Top = 1
      Width = 233
      Height = 63
      Align = alLeft
      Caption = #1041#1086#1088#1078#1072#1083#1072#1085#1099#1085' '#1090#1080#1087#1080
      TabOrder = 0
      object CheckBox7: TCheckBox
        Left = 5
        Top = 41
        Width = 105
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 0
      end
      object DBLookupComboboxEh7: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 220
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPION'
        ListSource = Persons
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox8: TGroupBox
      Left = 466
      Top = 1
      Width = 274
      Height = 63
      Align = alClient
      Caption = #1050#1088#1077#1076#1080#1090#1080#1085' '#1085#1086#1074#1094
      TabOrder = 1
      object CheckBox9: TCheckBox
        Left = 5
        Top = 41
        Width = 105
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 0
      end
      object DBLookupComboboxEh9: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 255
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = CrdType
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox9: TGroupBox
      Left = 234
      Top = 1
      Width = 232
      Height = 63
      Align = alLeft
      Caption = #1041#1086#1088#1078#1072#1083#1072#1085#1099#1085' '#1082#1072#1090#1077#1075#1086#1088#1081#1072#1089#1099
      TabOrder = 2
      object CheckBox8: TCheckBox
        Left = 5
        Top = 41
        Width = 105
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 0
      end
      object DBLookupComboboxEh8: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 220
        Height = 22
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
    Top = 194
    Width = 741
    Height = 64
    Align = alTop
    TabOrder = 3
    object GroupBox10: TGroupBox
      Left = 1
      Top = 1
      Width = 233
      Height = 62
      Align = alLeft
      Caption = #1069#1080#1088#1086#1074
      TabOrder = 0
      object CheckBox10: TCheckBox
        Left = 5
        Top = 41
        Width = 105
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 0
      end
      object DBLookupComboboxEh10: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 220
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = Pledges
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox11: TGroupBox
      Left = 234
      Top = 1
      Width = 506
      Height = 62
      Align = alClient
      Caption = #1052#1094#1096#1090#1103#1088#1080
      TabOrder = 1
      object CheckBox11: TCheckBox
        Left = 5
        Top = 41
        Width = 105
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 0
      end
      object DBLookupComboboxEh11: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 487
        Height = 22
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
    Top = 258
    Width = 741
    Height = 72
    Align = alTop
    TabOrder = 4
    object GroupBox13: TGroupBox
      Left = 1
      Top = 1
      Width = 739
      Height = 70
      Align = alClient
      Caption = #1065#1077#1089#1072#1073#1072#1090
      TabOrder = 0
      DesignSize = (
        739
        70)
      object Gauge1: TGauge
        Left = 74
        Top = 40
        Width = 362
        Height = 26
        BackColor = clBlue
        Color = clRed
        ForeColor = clAqua
        ParentColor = False
        Progress = 0
        Visible = False
      end
      object CheckBox13: TCheckBox
        Left = 5
        Top = 41
        Width = 69
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 0
      end
      object DBLookupComboboxEh13: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 427
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        EditButtons = <>
        KeyField = 'PROCNAME'
        ListField = 'FULLNAME'
        ListSource = reportSettings
        TabOrder = 1
        Visible = True
      end
      object Button1: TButton
        Left = 649
        Top = 18
        Width = 81
        Height = 27
        Anchors = [akTop, akRight]
        Caption = #1063#1072#1087
        TabOrder = 2
        OnClick = Button1Click
      end
      object rbRepType: TRadioGroup
        Left = 560
        Top = 0
        Width = 87
        Height = 68
        Caption = 'Hesabat tipi'
        ItemIndex = 1
        Items.Strings = (
          'Excel'
          'QReport')
        TabOrder = 3
      end
      object GroupBox12: TGroupBox
        Left = 439
        Top = 0
        Width = 123
        Height = 68
        Caption = #1040#1095#1099#1083#1084#1072' '#1090#1072#1088#1080#1093#1080
        TabOrder = 4
        object dtp1: TDateTimePicker
          Left = 9
          Top = 17
          Width = 105
          Height = 21
          Date = 39323.726687094910000000
          Time = 39323.726687094910000000
          TabOrder = 0
        end
        object dtp2: TDateTimePicker
          Left = 9
          Top = 41
          Width = 105
          Height = 21
          Date = 39323.726687094910000000
          Time = 39323.726687094910000000
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
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 400
    Top = 216
  end
  object CM_IP_REPORTS: TOraclePackage
    Session = sboapiDataModule.SBSession
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
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000E0000000C00000052004F0057004E0055004D000100000000001000
      000043005200450044004900540049004400010000000000080000004E004100
      4D00450001000000000006000000410047004500010000000000120000004200
      490052005400480044004100540045000100000000000E000000410044004400
      52004500530053000100000000001200000057004F0052004B004E0050004F00
      53005400010000000000140000004D004F004E00450059004D004F004E004500
      590001000000000018000000430052004500440041004D005400470049005600
      45004E0001000000000012000000430052004500440041004D00540059004D00
      0100000000001C000000430052004500440050004500520049004F0044004300
      5200450044000100000000001800000043005200450044005000450052004900
      4F00440059004D00010000000000180000004300520045004400500045005200
      4300430052004500440001000000000014000000430052004500440050004500
      5200430059004D00010000000000}
    Session = sboapiDataModule.SBSession
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
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080
      FieldName = 'NAME'
      Size = 127
    end
    object ODSBoorInfoAGE: TFloatField
      DisplayLabel = #1049#1072#1096#1099
      FieldName = 'AGE'
    end
    object ODSBoorInfoBIRTHDATE: TDateTimeField
      DisplayLabel = #1044#1086#1100#1091#1084' '#1090#1072#1088#1080#1093#1080
      FieldName = 'BIRTHDATE'
    end
    object ODSBoorInfoADDRESS: TStringField
      DisplayLabel = #1062#1085#1074#1072#1085#1099
      FieldName = 'ADDRESS'
      Size = 63
    end
    object ODSBoorInfoWORKNPOST: TStringField
      DisplayLabel = #1048#1096' '#1081#1077#1088#1080
      FieldName = 'WORKNPOST'
      Size = 127
    end
    object ODSBoorInfoMONEYMONEY: TFloatField
      DisplayLabel = #1040#1081#1083#1099#1075' '#1101#1103#1083#1080#1088#1080
      FieldName = 'MONEYMONEY'
    end
    object ODSBoorInfoCREDAMTGIVEN: TFloatField
      DisplayLabel = #1042#1077#1088'. '#1082#1088#1077#1076'. '#1084#1103#1073#1083#1103#1100#1080
      FieldName = 'CREDAMTGIVEN'
    end
    object ODSBoorInfoCREDAMTYM: TFloatField
      DisplayLabel = #1049'/'#1052'-'#1084#1080#1096' '#1082#1088#1077#1076'. '#1084#1103#1073#1083#1103#1100#1080
      FieldName = 'CREDAMTYM'
    end
    object ODSBoorInfoCREDPERIODCRED: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090' '#1084#1094#1076#1076#1103#1090#1080
      FieldName = 'CREDPERIODCRED'
    end
    object ODSBoorInfoCREDPERIODYM: TFloatField
      DisplayLabel = #1049'/'#1052' '#1084#1094#1076#1076#1103#1090#1080
      FieldName = 'CREDPERIODYM'
    end
    object ODSBoorInfoCREDPERCCRED: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090' '#1092#1072#1080#1079#1080
      FieldName = 'CREDPERCCRED'
    end
    object ODSBoorInfoCREDPERCYM: TFloatField
      DisplayLabel = #1049'/'#1052' '#1092#1072#1080#1079#1080
      FieldName = 'CREDPERCYM'
    end
  end
  object ODFValute: TOracleDataSet
    SQL.Strings = (
      'select * from sb_avalute')
    Optimize = False
    Session = sboapiDataModule.SBSession
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
    Optimize = False
    Session = sboapiDataModule.SBSession
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
    Optimize = False
    Session = sboapiDataModule.SBSession
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
    Optimize = False
    Session = sboapiDataModule.SBSession
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
    Optimize = False
    Session = sboapiDataModule.SBSession
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
    Optimize = False
    Session = sboapiDataModule.SBSession
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
    Optimize = False
    Session = sboapiDataModule.SBSession
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
    Optimize = False
    Session = sboapiDataModule.SBSession
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
    Optimize = False
    Session = sboapiDataModule.SBSession
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
      'select * from customers')
    Optimize = False
    Session = sboapiDataModule.SBSession
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
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000D0000000C00000052004F0057004E0055004D000100000000000E00
      00004D004B0054004E0041004D0045000100000000000E00000042004F004F00
      520043004E0054000100000000001400000047004900560045004E0043004F00
      55004E0054000100000000001600000047004900560045004E0041004D004F00
      55004E0054000100000000001000000059004D0041004D004F0055004E005400
      0100000000000800000052004500530054000100000000001A00000043004C00
      4F005300450043005200440043004F0055004E00540001000000000020000000
      43004C004F005300450043005200440059004D0041004D004F0055004E005400
      01000000000018000000460041004B00430052004500440043004F0055004E00
      540001000000000018000000460041004B0059004D004B00520043004F005500
      4E00540001000000000016000000460041004B0059004D004B00520052004500
      5300540001000000000012000000420041004E004B005F004B004F0044003100
      010000000000}
    Session = sboapiDataModule.SBSession
    Left = 528
    Top = 160
    object ODSMKTsInfoROWNUM: TFloatField
      FieldName = 'ROWNUM'
      Visible = False
    end
    object ODSMKTsInfoMKTNAME: TStringField
      DisplayLabel = #1052#1050#1058
      FieldName = 'MKTNAME'
      Size = 100
    end
    object ODSMKTsInfoBOORCNT: TFloatField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080' '#1089#1072#1081#1099
      FieldName = 'BOORCNT'
    end
    object ODSMKTsInfoFAKCREDCOUNT: TFloatField
      DisplayLabel = #1060#1072#1082#1090#1080#1082#1080' '#1089#1072#1081
      FieldName = 'FAKCREDCOUNT'
    end
    object ODSMKTsInfoGIVENAMOUNT: TFloatField
      DisplayLabel = #1041#1072#1085#1082' '#1090#1103#1088#1103#1092#1080#1085#1076#1103#1085' '#1074#1077#1088#1080#1083#1084#1080#1096' '#1084#1103#1073'.'
      FieldName = 'GIVENAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object ODSMKTsInfoYMAMOUNT: TFloatField
      DisplayLabel = #1049'/'#1052' '#1084#1103#1073#1083#1103#1100
      FieldName = 'YMAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object ODSMKTsInfoREST: TFloatField
      DisplayLabel = #1043#1072#1083#1099#1075
      FieldName = 'REST'
      DisplayFormat = '#,##0.00'
    end
    object ODSMKTsInfoCLOSECRDCOUNT: TFloatField
      DisplayLabel = #1041#1072#1100#1083#1072#1085#1084#1099#1096'.'#1089#1072#1081#1099
      FieldName = 'CLOSECRDCOUNT'
    end
    object ODSMKTsInfoCLOSECRDYMAMOUNT: TFloatField
      DisplayLabel = #1041#1072#1100#1083#1072#1085#1084#1099#1096'.'#1049'/'#1052' '#1084#1103#1073#1083#1103#1100
      FieldName = 'CLOSECRDYMAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object ODSMKTsInfoFAKYMKRREST: TFloatField
      DisplayLabel = #1069#1094#1079#1103#1096#1090#1083#1080' '#1075#1072#1083#1099#1075
      FieldName = 'FAKYMKRREST'
      DisplayFormat = '#,##0.00'
    end
    object ODSMKTsInfoFAKYMKRCOUNT: TFloatField
      DisplayLabel = #1069#1094#1079#1103#1096#1090#1083#1080' '#1089#1072#1081
      FieldName = 'FAKYMKRCOUNT'
    end
  end
  object ODFReport: TOracleDataSet
    SQL.Strings = (
      ''
      'select * from cm_ip_repsettings')
    Optimize = False
    Session = sboapiDataModule.SBSession
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
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000130000000C00000052004F0057004E0055004D000100000000001000
      0000430052004500440049005400490044000100000000000A00000041004B00
      54004E004F000100000000001000000042004F004F0052004F00570045005200
      0100000000001E000000430052004500440041004D004F0055004E0054004700
      4900560045004E0001000000000018000000430052004500440041004D004F00
      55004E00540059004D000100000000001E000000430052004500440041004D00
      4F0055004E005400500041005900450044000100000000001C00000043005200
      4500440041004D004F0055004E00540052004500530054000100000000001A00
      0000500045005200430045004E0054004100470045004D004B00540001000000
      00001A000000500045005200430045004E005400410047004500410049004600
      0100000000001800000050004500520049004F00440043005200450044004900
      54000100000000001000000050004500520049004F00440059004D0001000000
      00000E00000041004E0055004900540045005400010000000000180000004300
      4F004E0054005200410043005400440041005400450001000000000014000000
      43004F004E00540052004100430054004E004F000100000000001C0000004900
      500043004F004E00540052004100430054004400410054004500010000000000
      180000004900500043004F004E00540052004100430054004E004F0001000000
      00000E0000004D004B0054004E0041004D0045000100000000000C0000005400
      490043004B004E004F00010000000000}
    Session = sboapiDataModule.SBSession
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
      DisplayLabel = #1058#1103#1097'. '#1090#1103#1089'. '#1072#1082#1090' '#8470
      FieldName = 'AKTNO'
      Size = 10
    end
    object ODSMKTInfoBOOROWER: TStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080
      FieldName = 'BOOROWER'
      Size = 127
    end
    object ODSMKTInfoCREDAMOUNTGIVEN: TFloatField
      DisplayLabel = #1042#1077#1088#1080#1083#1084#1080#1096' '#1084#1103#1073#1083#1103#1100
      FieldName = 'CREDAMOUNTGIVEN'
    end
    object ODSMKTInfoCREDAMOUNTYM: TFloatField
      DisplayLabel = #1049'/'#1052'-'#1084#1080#1096' '#1084#1103#1073#1083#1103#1100
      FieldName = 'CREDAMOUNTYM'
    end
    object ODSMKTInfoCREDAMOUNTPAYED: TFloatField
      DisplayLabel = #1070#1076#1103#1085#1080#1083#1084#1080#1096' '#1084#1103#1073#1083#1103#1100
      FieldName = 'CREDAMOUNTPAYED'
    end
    object ODSMKTInfoCREDAMOUNTREST: TFloatField
      DisplayLabel = #1043#1072#1083#1099#1075' '#1084#1103#1073#1083#1103#1100
      FieldName = 'CREDAMOUNTREST'
    end
    object ODSMKTInfoPERCENTAGEMKT: TFloatField
      DisplayLabel = #1060#1072#1080#1079' '#1076#1103#1088' '#1052#1050#1058
      FieldName = 'PERCENTAGEMKT'
    end
    object ODSMKTInfoPERCENTAGEAIF: TFloatField
      DisplayLabel = #1060#1072#1080#1079' '#1076#1103#1088' '#1040#1048#1060
      FieldName = 'PERCENTAGEAIF'
    end
    object ODSMKTInfoPERIODCREDIT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090' '#1084#1094#1076#1076#1103#1090#1080
      FieldName = 'PERIODCREDIT'
    end
    object ODSMKTInfoPERIODYM: TFloatField
      DisplayLabel = #1049'/'#1052' '#1084#1094#1076#1076#1103#1090#1080
      FieldName = 'PERIODYM'
    end
    object ODSMKTInfoANUITET: TFloatField
      DisplayLabel = #1040#1085#1085#1091#1080#1090#1077#1090
      FieldName = 'ANUITET'
    end
    object ODSMKTInfoCONTRACTDATE: TDateTimeField
      DisplayLabel = #1050#1088#1077#1076' '#1084#1094#1075' '#1090#1103#1088#1080#1093#1080
      FieldName = 'CONTRACTDATE'
    end
    object ODSMKTInfoCONTRACTNO: TStringField
      DisplayLabel = #1050#1088#1077#1076' '#1084#1094#1075' '#8470
      FieldName = 'CONTRACTNO'
    end
    object ODSMKTInfoIPCONTRACTDATE: TDateTimeField
      DisplayLabel = #1048#1087'. '#1087#1088#1077#1076'. '#1090#1072#1088#1080#1093#1080
      FieldName = 'IPCONTRACTDATE'
    end
    object ODSMKTInfoIPCONTRACTNO: TStringField
      DisplayLabel = #1048#1087'. '#1087#1088#1077#1076'. '#8470
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
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000110000000C00000052004F0057004E0055004D000100000000001000
      0000430052004500440049005400490044000100000000000E0000004D004B00
      54004E0041004D0045000100000000001000000042004F004F0052004F005700
      450052000100000000001200000043005200440041004D004F0055004E005400
      0100000000001200000043005200440050004500520049004F00440001000000
      00000C0000004300520044004E0055004D000100000000000E00000043005200
      4400440041005400450001000000000014000000500045005200530041004D00
      4F0055004E005400010000000000140000005000450052005300500045005200
      49004F0044000100000000001600000050004500520053004C00410053005400
      44004100540001000000000014000000500052004F00500041004D004F005500
      4E00540001000000000014000000500052004F00500050004500520049004F00
      440001000000000016000000500052004F0050004C0041005300540044004100
      54000100000000002000000049004E0053005500520041004E00430045004300
      4F004D00500041004E0059000100000000001600000049004E00530055005200
      41004E00430045004E004F000100000000001A00000049004E00530055005200
      41004E00430045004400410054004500010000000000}
    Session = sboapiDataModule.SBSession
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
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080
      FieldName = 'BOOROWER'
      Size = 127
    end
    object ODSInsurInfoCRDAMOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076' '#1084#1103#1073#1083#1103#1100#1080
      FieldName = 'CRDAMOUNT'
    end
    object ODSInsurInfoCRDPERIOD: TFloatField
      DisplayLabel = #1050#1088#1077#1076'. '#1087#1077#1088#1080#1086#1076#1091
      FieldName = 'CRDPERIOD'
    end
    object ODSInsurInfoCRDNUM: TStringField
      DisplayLabel = #1050#1088#1077#1076'. '#8470
      FieldName = 'CRDNUM'
      Size = 31
    end
    object ODSInsurInfoCRDDATE: TDateTimeField
      DisplayLabel = #1050#1088#1077#1076'. '#1090#1072#1088#1080#1093#1080
      FieldName = 'CRDDATE'
    end
    object ODSInsurInfoPERSAMOUNT: TFloatField
      DisplayLabel = #1060#1103#1088'. '#1075#1103#1079'. '#1084#1103#1073'.'
      FieldName = 'PERSAMOUNT'
    end
    object ODSInsurInfoPERSPERIOD: TFloatField
      DisplayLabel = #1060#1103#1088'. '#1075#1103#1079'. '#1084#1094#1076'.'
      FieldName = 'PERSPERIOD'
    end
    object ODSInsurInfoPERSLASTDAT: TDateTimeField
      DisplayLabel = #1060#1103#1088'. '#1075#1103#1079'. '#1073#1080#1090#1084#1103' '#1090#1072#1088#1080#1093#1080
      FieldName = 'PERSLASTDAT'
    end
    object ODSInsurInfoPROPAMOUNT: TFloatField
      DisplayLabel = #1071#1084'. '#1075#1103#1079'. '#1084#1103#1073'.'
      FieldName = 'PROPAMOUNT'
    end
    object ODSInsurInfoPROPPERIOD: TFloatField
      DisplayLabel = #1071#1084'. '#1075#1103#1079'. '#1084#1094#1076'.'
      FieldName = 'PROPPERIOD'
    end
    object ODSInsurInfoPROPLASTDAT: TDateTimeField
      DisplayLabel = #1071#1084'. '#1075#1103#1079'. '#1073#1080#1090#1084#1103' '#1090#1072#1088#1080#1093#1080
      FieldName = 'PROPLASTDAT'
    end
    object ODSInsurInfoINSURANCECOMPANY: TStringField
      DisplayLabel = #1057#1099#1100#1086#1088#1090#1072' '#1096#1080#1088#1082#1103#1090#1080#1085#1080' '#1072#1076#1099
      FieldName = 'INSURANCECOMPANY'
      Size = 180
    end
    object ODSInsurInfoINSURANCENO: TStringField
      DisplayLabel = #1057#1099#1100#1086#1088#1090#1072' '#1087#1086#1083#1080#1089#1080#1085#1080#1085' '#8470'-'#1089#1080
      FieldName = 'INSURANCENO'
      Size = 50
    end
    object ODSInsurInfoINSURANCEDATE: TDateTimeField
      DisplayLabel = #1089#1099#1100#1086#1088#1090#1072' '#1087#1086#1083#1080#1089#1080#1085#1080#1085' '#1090#1072#1088#1080#1093#1080
      FieldName = 'INSURANCEDATE'
    end
  end
  object ODSDateInfo: TOracleDataSet
    SQL.Strings = (
      ''
      'SELECT rownum, p.* from (select *'
      '  FROM cm_ip_dateinfo order by mktname)p'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000140000000C00000052004F0057004E0055004D000100000000001000
      000043005200450044004900540049004400010000000000080000004E004100
      4D0045000100000000001400000041004E004400450052004600490052005300
      54000100000000001400000041004E0044004500520049005000520045004400
      0100000000001400000041004E0044004500520041004E004B00450054000100
      000000001400000041004E004400450052005200450050005200540001000000
      0000120000004300520044004E0055004D004200450052000100000000001000
      0000430052004400460049005200530054000100000000001000000043005200
      4400500041005900450044000100000000001200000042005500590053004500
      4C004E0055004D0001000000000012000000420055005900530045004C005000
      4100590001000000000014000000490050004F00540045004B0041004E005500
      4D0001000000000018000000490050004F00540045004B004100500041005000
      450052000100000000001E000000490050004F00540045004B00410052004500
      5400500041005000450052000100000000000A00000059004D00410049004600
      0100000000000C00000059004D00420049004C00440001000000000010000000
      59004D00540045004800560049004C000100000000000800000059004D005400
      49000100000000000E0000004D004B0054004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
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
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080
      FieldName = 'NAME'
      Size = 127
    end
    object ODSDateInfoANDERFIRST: TDateTimeField
      DisplayLabel = #1040#1085#1076'. '#1080#1083#1082'. '#1075#1080#1081#1084
      FieldName = 'ANDERFIRST'
    end
    object ODSDateInfoANDERIPRED: TDateTimeField
      DisplayLabel = #1040#1085#1076'. '#1080#1087'. '#1087#1088#1077#1076
      FieldName = 'ANDERIPRED'
    end
    object ODSDateInfoANDERANKET: TDateTimeField
      DisplayLabel = #1040#1085#1076'. '#1072#1085#1082#1077#1090
      FieldName = 'ANDERANKET'
    end
    object ODSDateInfoANDERREPRT: TDateTimeField
      DisplayLabel = #1040#1085#1076'. '#1097#1077#1089#1072#1073#1072#1090
      FieldName = 'ANDERREPRT'
    end
    object ODSDateInfoCRDNUMBER: TDateTimeField
      DisplayLabel = #1082#1088#1077#1076'. '#1084#1094#1075'.'
      FieldName = 'CRDNUMBER'
    end
    object ODSDateInfoCRDFIRST: TDateTimeField
      DisplayLabel = #1048#1083#1082#1080#1085' '#1102#1076#1103#1085'.'
      FieldName = 'CRDFIRST'
    end
    object ODSDateInfoCRDPAYED: TDateTimeField
      DisplayLabel = #1082#1088#1077#1076' '#1082#1102#1095'-'#1089#1080
      FieldName = 'CRDPAYED'
    end
    object ODSDateInfoBUYSELNUM: TDateTimeField
      DisplayLabel = #1072#1083#1075#1099'-'#1089#1072#1090#1075#1099' '#1084#1094#1075'.'
      FieldName = 'BUYSELNUM'
    end
    object ODSDateInfoBUYSELPAY: TDateTimeField
      DisplayLabel = #1089#1072#1090#1099#1078#1099' '#1080#1083#1103' '#1097#1077#1089
      FieldName = 'BUYSELPAY'
    end
    object ODSDateInfoIPOTEKANUM: TDateTimeField
      DisplayLabel = #1080#1087#1086#1090'. '#1084#1094#1075'.'
      FieldName = 'IPOTEKANUM'
    end
    object ODSDateInfoIPOTEKAPAPER: TDateTimeField
      DisplayLabel = #1080#1087'. '#1082#1072#1100'. '#1080#1083#1082'. '#1075#1077#1081#1076
      FieldName = 'IPOTEKAPAPER'
    end
    object ODSDateInfoIPOTEKARETPAPER: TDateTimeField
      DisplayLabel = #1080#1087'. '#1082#1072#1100'. '#1090#1103#1082'. '#1075#1077#1081#1076
      FieldName = 'IPOTEKARETPAPER'
    end
    object ODSDateInfoYMAIF: TDateTimeField
      DisplayLabel = 'AIF-'#1103' '#1084#1094#1088#1072#1078#1080#1103#1090
      FieldName = 'YMAIF'
    end
    object ODSDateInfoYMBILD: TDateTimeField
      DisplayLabel = #1041#1080#1083#1076#1080#1088#1080#1096
      FieldName = 'YMBILD'
    end
    object ODSDateInfoYMTEHVIL: TDateTimeField
      DisplayLabel = #1058#1103#1096#1074'. '#1090#1103#1089#1083'.'
      FieldName = 'YMTEHVIL'
    end
    object ODSDateInfoYMTI: TDateTimeField
      DisplayLabel = #1058#1080#1082#1077#1090
      FieldName = 'YMTI'
    end
  end
  object ODSPredInfo: TOracleDataSet
    SQL.Strings = (
      'SELECT rownum, p.* from (select *'
      '  FROM cm_ip_predmetinfo order by mktname)p')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000110000000C00000052004F0057004E0055004D000100000000001000
      0000430052004500440049005400490044000100000000000E0000004D004B00
      54004E0041004D0045000100000000001000000042004F004F0052004F005700
      450052000100000000000E000000490050005000410053005400450001000000
      00000A000000500041004400440052000100000000000C000000500050005200
      4900430045000100000000000A00000050004100520045004100010000000000
      120000004900500043004F004E0054004E0055004D0001000000000012000000
      4900500043004F004E0054004400410054000100000000001200000049005000
      41005000450052004E0055004D00010000000000120000004900500041005000
      4500520044004100540001000000000012000000490050004500580054005200
      4E0055004D000100000000001200000049005000450058005400520044004100
      54000100000000000C00000050004600490052004D0041000100000000000A00
      0000500044004100540045000100000000000C00000050004100520041005A00
      4900010000000000}
    Session = sboapiDataModule.SBSession
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
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080
      FieldName = 'BOOROWER'
      Size = 127
    end
    object ODSPredInfoIPPASTE: TStringField
      DisplayLabel = #1048#1087#1086#1090#1077#1082#1072' '#1075#1086#1081#1072#1085
      FieldName = 'IPPASTE'
      Size = 127
    end
    object ODSPredInfoPADDR: TStringField
      DisplayLabel = #1094#1085#1074#1072#1085#1099
      FieldName = 'PADDR'
      Size = 50
    end
    object ODSPredInfoPPRICE: TFloatField
      DisplayLabel = #1084#1103#1073#1083#1103#1100#1080
      FieldName = 'PPRICE'
    end
    object ODSPredInfoPAREA: TFloatField
      DisplayLabel = #1089#1072#1097#1103#1089#1080
      FieldName = 'PAREA'
    end
    object ODSPredInfoIPCONTNUM: TStringField
      DisplayLabel = #1084#1094#1075'. '#8470
      FieldName = 'IPCONTNUM'
      Size = 50
    end
    object ODSPredInfoIPCONTDAT: TDateTimeField
      DisplayLabel = #1084#1094#1075'. '#1090#1072#1088#1080#1093#1080
      FieldName = 'IPCONTDAT'
    end
    object ODSPredInfoIPAPERNUM: TStringField
      DisplayLabel = #1048#1087'. '#1082#1072#1100#1099#1079#1099' '#8470
      FieldName = 'IPAPERNUM'
      Size = 50
    end
    object ODSPredInfoIPAPERDAT: TDateTimeField
      DisplayLabel = #1048#1087'. '#1082#1072#1100#1099#1079#1099' '#1090#1072#1088#1080#1093#1080
      FieldName = 'IPAPERDAT'
    end
    object ODSPredInfoIPEXTRNUM: TStringField
      DisplayLabel = #1049#1094#1082'. '#8470
      FieldName = 'IPEXTRNUM'
      Size = 50
    end
    object ODSPredInfoIPEXTRDAT: TDateTimeField
      DisplayLabel = #1049#1094#1082'. '#1090#1103#1088#1080#1093#1080
      FieldName = 'IPEXTRDAT'
    end
    object ODSPredInfoPFIRMA: TStringField
      DisplayLabel = #1043#1080#1081#1084'. '#1096#1080#1088#1082#1103#1090
      FieldName = 'PFIRMA'
      Size = 100
    end
    object ODSPredInfoPDATE: TDateTimeField
      DisplayLabel = #1043#1080#1081#1084'. '#1090#1072#1088#1080#1093#1080
      FieldName = 'PDATE'
    end
    object ODSPredInfoPARAZI: TStringField
      DisplayLabel = #1103#1088#1072#1079#1080
      FieldName = 'PARAZI'
      Size = 100
    end
  end
  object ODSALEVInfo: TOracleDataSet
    SQL.Strings = (
      'SELECT rownum, p.* from (select *'
      '  FROM cm_ip_alevinfo order by mktname)p')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000090000000C00000052004F0057004E0055004D000100000000001000
      0000430052004500440049005400490044000100000000000E0000004D004B00
      54004E0041004D0045000100000000001000000042004F004F0052004F005700
      450052000100000000000C00000050004100520041005A004900010000000000
      0A000000500041004400440052000100000000000C0000005000500052004900
      430045000100000000000A000000500041005200450041000100000000000A00
      000050004400410054004500010000000000}
    Session = sboapiDataModule.SBSession
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
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080
      FieldName = 'BOOROWER'
      Size = 127
    end
    object ODSALEVInfoPARAZI: TStringField
      DisplayLabel = #1071#1088#1072#1079#1080
      FieldName = 'PARAZI'
      Size = 100
    end
    object ODSALEVInfoPADDR: TStringField
      DisplayLabel = #1062#1085#1074#1072#1085
      FieldName = 'PADDR'
      Size = 50
    end
    object ODSALEVInfoPPRICE: TFloatField
      DisplayLabel = #1043#1080#1081#1084#1103#1090
      FieldName = 'PPRICE'
    end
    object ODSALEVInfoPAREA: TFloatField
      DisplayLabel = #1057#1072#1097#1103
      FieldName = 'PAREA'
    end
    object ODSALEVInfoPDATE: TDateTimeField
      DisplayLabel = #1058#1072#1088#1080#1093
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
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000009000000100000004300520045004400490054004900440001000000
      0000160000005000410059004D0045004E005400440041005400450001000000
      0000120000005000520049004E0043004900500041004C000100000000001400
      000052004500530054004200450046004F005200450001000000000012000000
      5200450053005400410046005400450052000100000000000E0000004D004B00
      54004E0041004D0045000100000000001800000042004F004F0052004F005700
      450052004E0041004D0045000100000000000C0000004300520044004E005500
      4D000100000000001000000049004E0054004500520045005300540001000000
      0000}
    Session = sboapiDataModule.SBSession
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
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000C0000000C00000052004F0057004E0055004D000100000000000E00
      00004D004B0054004E0041004D0045000100000000000E00000042004F004F00
      520043004E0054000100000000001400000047004900560045004E0043004F00
      55004E0054000100000000001600000047004900560045004E0041004D004F00
      55004E0054000100000000001000000059004D0041004D004F0055004E005400
      0100000000000800000052004500530054000100000000001A00000043004C00
      4F005300450043005200440043004F0055004E00540001000000000020000000
      43004C004F005300450043005200440059004D0041004D004F0055004E005400
      01000000000018000000460041004B00430052004500440043004F0055004E00
      540001000000000018000000460041004B0059004D004B00520043004F005500
      4E00540001000000000016000000460041004B0059004D004B00520052004500
      53005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 529
    Top = 213
    object MKTROWNUM: TFloatField
      DisplayLabel = #8470
      FieldName = 'ROWNUM'
    end
    object MKTMKTNAME: TStringField
      DisplayLabel = #1052#1050#1058
      FieldName = 'MKTNAME'
      Size = 100
    end
    object MKTBOORCNT: TFloatField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080' '#1089#1072#1081#1099
      FieldName = 'BOORCNT'
    end
    object MKTFAKYMKRCOUNT: TFloatField
      DisplayLabel = #1060#1072#1082#1090#1080#1082#1080' '#1089#1072#1081
      FieldName = 'FAKYMKRCOUNT'
    end
    object MKTGIVENAMOUNT: TFloatField
      DisplayLabel = #1041#1072#1085#1082' '#1090#1103#1088#1103#1092#1080#1085#1076#1103#1085' '#1074#1077#1088#1080#1083#1084#1080#1096' '#1084#1103#1073'.'
      FieldName = 'GIVENAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object MKTYMAMOUNT: TFloatField
      DisplayLabel = #1049'/'#1052' '#1084#1103#1073#1083#1103#1100
      FieldName = 'YMAMOUNT'
    end
    object MKTREST: TFloatField
      DisplayLabel = #1043#1072#1083#1099#1075
      FieldName = 'REST'
      DisplayFormat = '#,##0.00'
    end
    object MKTCLOSECRDCOUNT: TFloatField
      DisplayLabel = #1041#1072#1100#1083#1072#1085#1084#1099#1096'.'#1089#1072#1081#1099
      FieldName = 'CLOSECRDCOUNT'
    end
    object MKTCLOSECRDYMAMOUNT: TFloatField
      DisplayLabel = #1041#1072#1100#1083#1072#1085#1084#1099#1096'.'#1049'/'#1052' '#1084#1103#1073#1083#1103#1100
      FieldName = 'CLOSECRDYMAMOUNT'
    end
    object MKTFAKYMKRREST: TFloatField
      DisplayLabel = #1069#1094#1079#1103#1096#1090#1083#1080' '#1075#1072#1083#1099#1075
      FieldName = 'FAKYMKRREST'
    end
    object MKTFAKCREDCOUNT: TFloatField
      DisplayLabel = #1069#1094#1079#1103#1096#1090#1083#1080' '#1089#1072#1081
      FieldName = 'FAKCREDCOUNT'
    end
  end
end
