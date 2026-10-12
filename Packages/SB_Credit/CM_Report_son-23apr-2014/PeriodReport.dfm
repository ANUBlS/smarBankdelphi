object PeriodReportForm: TPeriodReportForm
  Left = 284
  Top = 213
  BorderIcons = [biSystemMenu]
  ClientHeight = 197
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 694
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
        Height = 21
        EditButtons = <>
        KeyField = 'VALUTE'
        ListField = 'VALU_NAME'
        ListSource = DSCurrencys
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox2: TGroupBox
      Left = 466
      Top = 1
      Width = 227
      Height = 63
      Align = alClient
      Caption = #1048#1089#1090#1080#1092#1072#1076#1103#1095#1080' '#1075#1088#1091#1087#1091
      TabOrder = 1
      object DBLookupComboboxEh3: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 220
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = DSUserGroups
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
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = DSBranches
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
  object Panel5: TPanel
    Left = 0
    Top = 65
    Width = 694
    Height = 64
    Align = alTop
    TabOrder = 1
    object GroupBox7: TGroupBox
      Left = 1
      Top = 1
      Width = 233
      Height = 62
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
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPION'
        ListSource = DSPersons
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox9: TGroupBox
      Left = 234
      Top = 1
      Width = 232
      Height = 62
      Align = alLeft
      Caption = #1041#1086#1088#1078#1072#1083#1072#1085#1099#1085' '#1082#1072#1090#1077#1075#1086#1088#1081#1072#1089#1099
      TabOrder = 1
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
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = DSCategories
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox4: TGroupBox
      Left = 466
      Top = 1
      Width = 233
      Height = 62
      Align = alLeft
      Caption = #1065#1077#1089#1072#1073#1072#1090' '#1072#1088#1072#1083#1099#1100#1099
      TabOrder = 2
      object Label1: TLabel
        Left = 9
        Top = 17
        Width = 80
        Height = 13
        Caption = #1044#1102#1074#1088#1094#1085' '#1103#1074#1074#1103#1083#1080
      end
      object Label2: TLabel
        Left = 9
        Top = 41
        Width = 67
        Height = 13
        Caption = #1044#1102#1074#1088#1094#1085' '#1089#1086#1085#1091
      end
      object BDateP: TDateTimePicker
        Left = 89
        Top = 13
        Width = 136
        Height = 21
        Date = 38477.593060798600000000
        Time = 38477.593060798600000000
        TabOrder = 0
      end
      object EDateP: TDateTimePicker
        Left = 89
        Top = 37
        Width = 136
        Height = 21
        Date = 38477.593068935200000000
        Time = 38477.593068935200000000
        TabOrder = 1
      end
    end
  end
  object Button1: TButton
    Left = 518
    Top = 166
    Width = 81
    Height = 27
    Caption = #1043#1103#1073#1091#1083
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 598
    Top = 166
    Width = 80
    Height = 27
    Caption = #1041#1072#1100#1083#1072
    ModalResult = 2
    TabOrder = 3
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 129
    Width = 233
    Height = 68
    Align = alLeft
    Caption = ' '#1041#1072#1100#1083#1099' '#1082#1088#1077#1076#1080#1090#1083#1103#1088' h'#1077#1089#1072#1073#1072#1090' '#1072#1088#1072#1083#1099#1100#1099
    TabOrder = 4
    ExplicitHeight = 63
    object Label3: TLabel
      Left = 9
      Top = 20
      Width = 80
      Height = 13
      Caption = #1044#1102#1074#1088#1094#1085' '#1103#1074#1074#1103#1083#1080
    end
    object Label4: TLabel
      Left = 9
      Top = 47
      Width = 67
      Height = 13
      Caption = #1044#1102#1074#1088#1094#1085' '#1089#1086#1085#1091
    end
    object DateTimePicker1: TDateTimePicker
      Left = 89
      Top = 16
      Width = 136
      Height = 21
      Date = 38477.593060798600000000
      Time = 38477.593060798600000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 89
      Top = 43
      Width = 136
      Height = 21
      Date = 38477.593068935200000000
      Time = 38477.593068935200000000
      TabOrder = 1
    end
  end
  object CreditsDS: TOracleDataSet
    SQL.Strings = (
      
        'select b.ID   from CM_PORTFOLIO b where  ((B.CLOSEDATE IS NULL) ' +
        'or (B.CLOSEDATE between :HDATE and :EDATE) /*(B.CLOSEDATE >=:HDA' +
        'TE)*/)'
      ''
      ''
      ' ')
    Optimize = False
    Variables.Data = {
      04000000020000000C0000003A00450044004100540045000C00000000000000
      000000000C0000003A00480044004100540045000C0000000000000000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 216
    Top = 96
  end
  object CM_AK_REPORTS: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CM_AK_REPORTS'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Left = 344
    Top = 128
  end
  object DSCurrencys: TDataSource
    DataSet = Currencys
    Left = 8
    Top = 82
  end
  object Currencys: TOracleDataSet
    SQL.Strings = (
      'SELECT valute,  valu_name'
      '  FROM AVALUTE'
      'ORDER BY VALUTE')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 8
    Top = 50
  end
  object DSBranches: TDataSource
    DataSet = Branches
    Left = 48
    Top = 82
  end
  object Branches: TOracleDataSet
    SQL.Strings = (
      'SELECT id, name'
      '  FROM filial')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 50
  end
  object DSUserGroups: TDataSource
    DataSet = UserGroups
    Left = 168
    Top = 82
  end
  object UserGroups: TOracleDataSet
    SQL.Strings = (
      'SELECT id, description'
      '  FROM cm_usergroups')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 168
    Top = 50
  end
  object DSPersons: TDataSource
    DataSet = Persons
    Left = 88
    Top = 82
  end
  object Persons: TOracleDataSet
    SQL.Strings = (
      'SELECT id,  descripion'
      '  FROM cm_persons')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 88
    Top = 50
  end
  object DSCategories: TDataSource
    DataSet = Categories
    Left = 128
    Top = 82
  end
  object Categories: TOracleDataSet
    SQL.Strings = (
      'SELECT id, description'
      '  FROM cm_categories')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 128
    Top = 50
  end
  object ResultDS: TOracleDataSet
    SQL.Strings = (
      'SELECT p.numberofcredit, '
      '      r.*, '
      '      CM_AK_REPORTS.get_balcn(r.contractno) as balcn,'
      '       b.name,'
      '       h.descripion person,'
      '       g.description project,p.ANNUALYINTERESTRATE,'
      '       --f.name filial ,'
      '       get_filialname(p.branchid) filial,'
      '       V.Val_name,'
      '       p.DATEOFCONCLUSION,'
      '       p.DUEDATEFIRSTCONTRACT'
      ' FROM CM_REPORT_SD1 r,'
      '      cm_boorowerinfo b,'
      '      cm_portfolio p,'
      '      cm_persons h,'
      '      cm_usergroups g,'
      '  --    sb_filial f,'
      '      AVALUTE V'
      ' where '
      '      r.creditid = b.creditid'
      '   and r.creditid = p.id'
      '   and  v.Valute = p.Currency'
      '   and h.id = p.personaltype'
      '   and g.id = p.usrgroup'
      ' --  and f.id = p.branchid  '
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000002C0000001C0000004E0055004D004200450052004F00460043005200
      4500440049005400010000000000100000004300520045004400490054004900
      44000100000000001400000043004F004E00540052004100430054004E004F00
      0100000000001A00000049004E00540045005200450053005400410043004300
      4E004F00010000000000180000004400550045004C004F0041004E0041004300
      43004E004F000100000000002000000044005500450049004E00540045005200
      4500530054004100430043004E004F0001000000000012000000500052004500
      53004100430043004E004F000100000000001800000053004500430052004500
      530054004100430043004E004F000100000000000C000000500042004D004100
      49004E000100000000000E0000005000450042004D00410049004E0001000000
      00000A0000005000420049004E0054000100000000000C000000500045004200
      49004E00540001000000000012000000500042004400550045004D0041004900
      4E00010000000000140000005000450042004400550045004D00410049004E00
      010000000000100000005000420044005500450049004E005400010000000000
      1200000050004500420044005500450049004E0054000100000000000E000000
      5000410059004D00410049004E00010000000000100000004500500041005900
      4D00410049004E000100000000000C00000050004100590049004E0054000100
      000000000E000000450050004100590049004E0054000100000000000C000000
      5000410059004400550045000100000000000E00000045005000410059004400
      550045000100000000001200000050004100590044005500450049004E005400
      01000000000014000000450050004100590044005500450049004E0054000100
      00000000160000005400520041004E004300480045004D00410049004E000100
      000000001800000045005400520041004E004300480045004D00410049004E00
      0100000000000C000000500045004D00410049004E000100000000000E000000
      4500500045004D00410049004E000100000000000A0000005000450049004E00
      54000100000000000C00000045005000450049004E0054000100000000001200
      0000500045004400550045004D00410049004E00010000000000140000004500
      500045004400550045004D00410049004E000100000000001000000050004500
      44005500450049004E0054000100000000001200000045005000450044005500
      450049004E005400010000000000120000004300520044005000450052004900
      4F0044000100000000000A000000420041004C0043004E000100000000000800
      00004E0041004D0045000100000000000C00000050004500520053004F004E00
      0100000000000E000000500052004F004A004500430054000100000000000C00
      0000460049004C00490041004C0001000000000010000000560041004C005F00
      4E0041004D0045000100000000002000000044004100540045004F0046004300
      4F004E0043004C005500530049004F004E000100000000002800000044005500
      450044004100540045004600490052005300540043004F004E00540052004100
      430054000100000000002600000041004E004E00550041004C00590049004E00
      5400450052004500530054005200410054004500010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 288
    Top = 120
    object ResultDSCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object ResultDSNUMBEROFCREDIT: TWideStringField
      DisplayLabel = #1052#1094#1075'. '#8470
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object ResultDSNAME: TWideStringField
      DisplayLabel = #1041#1086#1088#1078#1072#1083#1072#1085
      FieldName = 'NAME'
      Size = 64
    end
    object ResultDSDATEOFCONCLUSION: TDateTimeField
      DisplayLabel = #1040#1095#1099#1083#1084#1072' '#1090#1072#1088#1080#1093#1080
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object ResultDSDUEDATEFIRSTCONTRACT: TDateTimeField
      DisplayLabel = #1041#1072#1100#1083#1072#1085#1084#1072' '#1090#1072#1088#1080#1093#1080
      FieldName = 'DUEDATEFIRSTCONTRACT'
      Required = True
    end
    object ResultDSCONTRACTNO: TWideStringField
      DisplayLabel = #1057#1089#1091#1076#1072' '#1065#1077#1089#1072#1073#1099#1085' '#8470'-'#1089#1080
      FieldName = 'CONTRACTNO'
    end
    object ResultDSVAL_NAME: TWideStringField
      DisplayLabel = #1042#1072#1083#1081#1091#1090#1072
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object ResultDSANNUALYINTERESTRATE: TFloatField
      DisplayLabel = '% '#1076#1103#1088#1103#1078#1103#1089#1080
      FieldName = 'ANNUALYINTERESTRATE'
      Required = True
    end
    object ResultDSBALCN: TFloatField
      DisplayLabel = #1041#1072#1083#1072#1085#1089' '#1065#1077#1089#1072#1073#1099
      FieldName = 'BALCN'
    end
    object ResultDSINTERESTACCNO: TWideStringField
      DisplayLabel = #1060#1072#1080#1079' '#1065#1077#1089#1072#1073#1099#1085' '#8470'-'#1089#1080
      FieldName = 'INTERESTACCNO'
    end
    object ResultDSDUELOANACCNO: TWideStringField
      DisplayLabel = #1068#1077#1078' '#1057#1089#1091#1076#1072' '#1065#1077#1089#1072#1073#1099#1085' '#8470'-'#1089#1080
      FieldName = 'DUELOANACCNO'
    end
    object ResultDSDUEINTERESTACCNO: TWideStringField
      DisplayLabel = #1068#1077#1078' '#1060#1072#1080#1079' '#1065#1077#1089#1072#1073#1099#1085' '#8470'-'#1089#1080
      FieldName = 'DUEINTERESTACCNO'
    end
    object ResultDSPRESACCNO: TWideStringField
      DisplayLabel = #1045#1097#1090#1080#1081#1081#1072#1090' '#1065#1077#1089#1072#1073#1099#1085' '#8470'-'#1089#1080
      FieldName = 'PRESACCNO'
    end
    object ResultDSSECRESTACCNO: TWideStringField
      DisplayLabel = #1052#1103#1075' '#1045#1097#1090#1080#1081#1081#1072#1090' '#1065#1077#1089#1072#1073#1099#1085' '#8470'-'#1089#1080
      FieldName = 'SECRESTACCNO'
    end
    object ResultDSPBMAIN: TFloatField
      DisplayLabel = #1044'.'#1071'.'#1071#1089#1072#1089' '#1073'.'
      FieldName = 'PBMAIN'
      Required = True
    end
    object ResultDSPEBMAIN: TFloatField
      DisplayLabel = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
      FieldName = 'PEBMAIN'
      Required = True
    end
    object ResultDSPBINT: TFloatField
      DisplayLabel = #1044'.'#1071'. '#1060#1072#1080#1079' '#1073
      FieldName = 'PBINT'
      Required = True
    end
    object ResultDSPEBINT: TFloatField
      DisplayLabel = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
      FieldName = 'PEBINT'
      Required = True
    end
    object ResultDSPBDUEMAIN: TFloatField
      DisplayLabel = #1044'.'#1071'. '#1069#1077#1078'. '#1103#1089#1072#1089' '#1073
      FieldName = 'PBDUEMAIN'
      Required = True
    end
    object ResultDSPEBDUEMAIN: TFloatField
      DisplayLabel = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
      FieldName = 'PEBDUEMAIN'
      Required = True
    end
    object ResultDSPBDUEINT: TFloatField
      DisplayLabel = #1044'.'#1071'. '#1069#1077#1078' '#1092#1072#1080#1079' '#1073
      FieldName = 'PBDUEINT'
      Required = True
    end
    object ResultDSPEBDUEINT: TFloatField
      DisplayLabel = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
      FieldName = 'PEBDUEINT'
      Required = True
    end
    object ResultDSPAYMAIN: TFloatField
      DisplayLabel = #1070#1076#1103#1085'. '#1071#1089#1072#1089' '#1073
      FieldName = 'PAYMAIN'
      Required = True
    end
    object ResultDSEPAYMAIN: TFloatField
      DisplayLabel = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
      FieldName = 'EPAYMAIN'
      Required = True
    end
    object ResultDSPAYINT: TFloatField
      DisplayLabel = #1070#1076#1103#1085'. '#1060#1072#1080#1079' '#1073
      FieldName = 'PAYINT'
      Required = True
    end
    object ResultDSEPAYINT: TFloatField
      DisplayLabel = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
      FieldName = 'EPAYINT'
      Required = True
    end
    object ResultDSPAYDUE: TFloatField
      DisplayLabel = #1070#1076#1103#1085'. '#1069#1077#1078'. '#1071#1089#1072#1089' '#1073
      FieldName = 'PAYDUE'
      Required = True
    end
    object ResultDSEPAYDUE: TFloatField
      DisplayLabel = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
      FieldName = 'EPAYDUE'
      Required = True
    end
    object ResultDSPAYDUEINT: TFloatField
      DisplayLabel = #1070#1076#1103#1085'. '#1069#1077#1078' '#1092#1072#1080#1079' '#1073
      FieldName = 'PAYDUEINT'
      Required = True
    end
    object ResultDSEPAYDUEINT: TFloatField
      DisplayLabel = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
      FieldName = 'EPAYDUEINT'
      Required = True
    end
    object ResultDSTRANCHEMAIN: TFloatField
      DisplayLabel = #1042#1077#1088#1080#1083#1084#1080#1096' '#1084#1103#1073'.'
      FieldName = 'TRANCHEMAIN'
      Required = True
    end
    object ResultDSETRANCHEMAIN: TFloatField
      DisplayLabel = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
      FieldName = 'ETRANCHEMAIN'
      Required = True
    end
    object ResultDSPEMAIN: TFloatField
      DisplayLabel = #1044'.'#1057'.'#1071#1089#1072#1089' '#1073'.'
      FieldName = 'PEMAIN'
      Required = True
    end
    object ResultDSEPEMAIN: TFloatField
      DisplayLabel = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
      FieldName = 'EPEMAIN'
      Required = True
    end
    object ResultDSPEINT: TFloatField
      DisplayLabel = #1044'.'#1057'.'#1060#1072#1080#1079' '#1073'.'
      FieldName = 'PEINT'
      Required = True
    end
    object ResultDSPEDUEMAIN: TFloatField
      DisplayLabel = #1044'.'#1057'. '#1069#1077#1078' '#1071#1089#1072#1089' '#1073'.'
      FieldName = 'PEDUEMAIN'
      Required = True
    end
    object ResultDSEPEINT: TFloatField
      DisplayLabel = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
      FieldName = 'EPEINT'
      Required = True
    end
    object ResultDSEPEDUEMAIN: TFloatField
      DisplayLabel = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
      FieldName = 'EPEDUEMAIN'
      Required = True
    end
    object ResultDSPEDUEINT: TFloatField
      DisplayLabel = #1044'.'#1057'. '#1069#1077#1078' '#1060#1072#1080#1079' '#1073'.'
      FieldName = 'PEDUEINT'
      Required = True
    end
    object ResultDSEPEDUEINT: TFloatField
      DisplayLabel = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
      FieldName = 'EPEDUEINT'
      Required = True
    end
    object ResultDSCRDPERIOD: TFloatField
      DisplayLabel = #1052#1094#1076#1076#1103#1090
      FieldName = 'CRDPERIOD'
      Required = True
    end
    object ResultDSPERSON: TWideStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1082#1072#1090#1077#1100#1086#1088#1080#1081#1072#1089#1099
      FieldName = 'PERSON'
      Size = 64
    end
    object ResultDSPROJECT: TWideStringField
      DisplayLabel = #1051#1072#1081#1080#1097#1103
      FieldName = 'PROJECT'
      Size = 255
    end
    object ResultDSFILIAL: TWideStringField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      FieldName = 'FILIAL'
      Size = 4000
    end
  end
  object Kera: TCMExcelExport
    ConnectTo = ctNewInstance
    StyleColumnWidth = cwAutoFit
    ColumnWidth = 0
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clGreen
    FontTitles.Height = -11
    FontTitles.Name = 'Azl Sans Serif'
    FontTitles.Style = [fsBold]
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
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 376
    Top = 8
  end
end
