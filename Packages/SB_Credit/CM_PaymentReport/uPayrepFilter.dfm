object frmPayRepFilter: TfrmPayRepFilter
  Left = 243
  Top = 177
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmIpRepFilter'
  ClientHeight = 119
  ClientWidth = 685
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel5: TXFPanel
    Left = 1
    Top = 67
    Width = 684
    Height = 51
    BevelKind = bkFlat
    TabOrder = 0
    object XFGroupBox12: TXFGroupBox
      Left = 1
      Top = 1
      Width = 211
      Height = 45
      Align = alLeft
      Caption = 'Hesabat tarixi'
      TabOrder = 0
      object XFLabel1: TXFLabel
        Left = 99
        Top = 15
        Width = 6
        Height = 13
        Caption = '_'
      end
      object pick1: TDateTimePicker
        Left = 6
        Top = 17
        Width = 88
        Height = 21
        Date = 39128.487653171300000000
        Time = 39128.487653171300000000
        TabOrder = 0
      end
      object pick2: TDateTimePicker
        Left = 112
        Top = 17
        Width = 90
        Height = 21
        Date = 39128.487653171300000000
        Time = 39128.487653171300000000
        TabOrder = 1
      end
    end
    object XFGroupBox13: TXFGroupBox
      Left = 212
      Top = 1
      Width = 107
      Height = 45
      Align = alLeft
      Caption = 'Borc tarixi'
      TabOrder = 1
      Visible = False
      object dtpfi: TDateTimePicker
        Left = 8
        Top = 16
        Width = 89
        Height = 21
        Date = 39128.487653171300000000
        Time = 39128.487653171300000000
        TabOrder = 0
      end
    end
    object XFRadioGroup1: TXFRadioGroup
      Left = 324
      Top = 1
      Width = 172
      Height = 45
      Caption = 'Hesabat tipi'
      Items.Strings = (
        'Excel'
        'QReport')
      TabOrder = 2
      Visible = False
    end
    object XFButton1: TXFButton
      Left = 519
      Top = 20
      Width = 70
      Height = 26
      Caption = 'Q'#601'bul'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = XFButton1Click
    end
    object XFButton2: TXFButton
      Left = 594
      Top = 20
      Width = 70
      Height = 26
      Caption = 'Ba'#287'la'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 4
      OnClick = XFButton2Click
    end
  end
  object XFPanel2: TXFPanel
    Left = 1
    Top = 0
    Width = 684
    Height = 66
    BevelKind = bkFlat
    TabOrder = 1
    object XFGroupBox5: TXFGroupBox
      Left = 428
      Top = 1
      Width = 251
      Height = 60
      Align = alLeft
      Caption = #304'stifad'#601#231'i   '
      TabOrder = 0
      object DBLookupComboboxEh6: TDBLookupComboboxEh
        Left = 6
        Top = 11
        Width = 240
        Height = 21
        EditButtons = <>
        KeyField = 'SYSUSERID'
        ListField = 'OBJ'
        ListSource = Users
        TabOrder = 0
        Visible = True
      end
      object XFCheckBox5: TXFCheckBox
        Left = 5
        Top = 37
        Width = 90
        Height = 16
        Caption = 'T'#601'tbiq et'
        TabOrder = 1
      end
    end
    object XFGroupBox9: TXFGroupBox
      Left = 1
      Top = 1
      Width = 211
      Height = 60
      Align = alLeft
      Caption = 'Valyuta'
      TabOrder = 1
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 3
        Top = 14
        Width = 204
        Height = 21
        EditButtons = <>
        KeyField = 'VALUTE'
        ListField = 'VALU_NAME'
        ListSource = Valute
        TabOrder = 0
        Visible = True
      end
      object XFCheckBox9: TXFCheckBox
        Left = 5
        Top = 39
        Width = 90
        Height = 16
        Caption = 'T'#601'tbiq et'
        TabOrder = 1
      end
    end
    object XFGroupBox10: TXFGroupBox
      Left = 212
      Top = 1
      Width = 216
      Height = 60
      Align = alLeft
      Caption = 'Filial'
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
      object XFCheckBox10: TXFCheckBox
        Left = 6
        Top = 39
        Width = 90
        Height = 16
        Caption = 'T'#601'tbiq et'
        TabOrder = 1
      end
    end
  end
  object ODSCredits: TOracleDataSet
    SQL.Strings = (
      'select id from cm_portfolio p'
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
    QBEDefinition.QBEFieldDefs = {05000000010000000400000049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 416
    Top = 16
    object ODSCreditsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
  end
  object CM_REPORTS: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CM_PREPORTS'
    ParameterMode = pmNamed
    Left = 488
    Top = 80
  end
  object ODFValute: TOracleDataSet
    SQL.Strings = (
      'select * from avalute')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 280
    Top = 8
  end
  object Valute: TDataSource
    DataSet = ODFValute
    Left = 328
    Top = 8
  end
  object ODFBranch: TOracleDataSet
    SQL.Strings = (
      'select * from filial--sb_filial')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 88
    Top = 16
  end
  object Branch: TDataSource
    DataSet = ODFBranch
    Left = 136
    Top = 16
  end
  object ODFUsers: TOracleDataSet
    SQL.Strings = (
      'select * from sba_objinf where type='#39'U'#39'--select * from sb_user$')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000016000000040000004900440001000000000008000000540059005000
      4500010000000000060000004F0042004A000100000000001400000043005200
      4500410054004500440041005400450001000000000016000000440045005300
      4300520049005000540049004F004E0001000000000010000000460055004C00
      4C004E0041004D0045000100000000000A000000500048004F004E0045000100
      000000000E00000043004C004100530053004900440001000000000010000000
      460049004C00490041004C00490044000100000000000E000000410044005600
      5400590050004500010000000000120000005300590053005500530045005200
      490044000100000000001E00000055005300450052005F004600490052005300
      54005F004E0041004D0045000100000000001C00000055005300450052005F00
      4C004100530054005F004E0041004D0045000100000000002000000055005300
      450052005F004D004900440044004C0045005F004E0041004D00450001000000
      00001600000055005300450052005F0041004400520045005300530001000000
      00001400000055005300450052005F00500048004F004E004500010000000000
      0C000000460049004E004700450052000000000000000E000000460049004E00
      47004500520032000000000000000E000000460049004E004700450052003300
      010000000000080000004C0041004E0047000100000000000C00000053004B00
      49004E00490044000100000000000C000000490053005F00410044004D000100
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 528
    Top = 6
  end
  object Users: TDataSource
    DataSet = ODFUsers
    Left = 592
    Top = 6
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
      #1074#1099#1072#1082#1074#1074#1087#1089#1087#1074#1072#1087)
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 432
    Top = 80
  end
  object ODSPayInfo: TOracleDataSet
    SQL.Strings = (
      
        '/*SELECT rownum, creditid, groupname, boorower, crdnum, mainsche' +
        'dule, mainpayed, (-mainschedule+mainpayed) as maindiff   intrsch' +
        'edule, intrpayed,  (-intrschedule+intrpayed) as intrdiff,irest'
      
        ' ,CREDITLINEAMMOUNT,SUMPAY,SUMSHEDULE,rest qaliq,(rest-(CREDITLI' +
        'NEAMMOUNT-SUMSHEDULE)) maindiff ,'
      
        'mainschedule-mainpayed "'#399'.B '#252'zr'#601' az '#246'd'#601'ni'#351'" ,irest-intrpayed "Fa' +
        'iz az '#246'd'#601'ni'#351'",ESASHES,FAIZHES  FROM cm_report_payments p'
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
      '*/'
      'select * FROM cm_report_payments'
      ' order by groupname')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000019000000100000004300520045004400490054004900440001000000
      00001000000042004F004F0052004F005700450052000100000000000C000000
      4300520044004E0055004D0001000000000012000000470052004F0055005000
      4E0041004D004500010000000000180000004D00410049004E00530043004800
      4500440055004C004500010000000000140000004D00410049004E005F005000
      41005900450044000100000000001A0000004D00410049004E005F0044005500
      4500500041005900450044000100000000001800000049004E00540052005300
      430048004500440055004C0045000100000000001200000049004E0054005200
      500041005900450044000100000000001A00000049004E00540052005F004400
      5500450050004100590045004400010000000000080000005200450053005400
      0100000000000E00000049004E00540052004500530054000100000000000E00
      0000440055004500520045005300540001000000000016000000440055004500
      49004E005400450052004500530054000100000000000C000000460049004C00
      490041004C00010000000000060000004400410054000100000000000E000000
      5000410059005F00440041005400010000000000240000005000410059005F00
      500045004E0041004C005400590041004D004D004F0055004E00540001000000
      00001C000000500045004E0041004C005400590041004D004D004F0055004E00
      54000100000000001000000045004B0056005F00520045005300540001000000
      00001600000045004B0056005F0049004E005400520045005300540001000000
      00001A00000045004B0056005F004D00410049004E0050004100590045004400
      0100000000001A00000045004B0056005F0049004E0054005200500041005900
      450044000100000000002200000045004B0056005F004D00410049004E005F00
      440055004500500041005900450044000100000000002200000045004B005600
      5F0049004E00540052005F004400550045005000410059004500440001000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 480
    Top = 40
    object ODSPayInfoCREDITID: TFloatField
      DisplayLabel = 'Kredit '#304'D'
      FieldName = 'CREDITID'
    end
    object ODSPayInfoBOOROWER: TWideStringField
      DisplayLabel = 'M'#252#351't'#601'ri ad'#305
      FieldName = 'BOOROWER'
      Size = 508
    end
    object ODSPayInfoCRDNUM: TWideStringField
      DisplayLabel = 'M'#252'qavil'#601' '#8470
      FieldName = 'CRDNUM'
      Size = 120
    end
    object ODSPayInfoDAT: TDateTimeField
      DisplayLabel = #214'd'#601'nilmi'#351'  tarix'
      FieldName = 'DAT'
    end
    object ODSPayInfoPAY_DAT: TDateTimeField
      DisplayLabel = #214'd'#601'ni'#351' tarixi'
      FieldName = 'PAY_DAT'
    end
    object ODSPayInfoMAIN_PAYED: TFloatField
      DisplayLabel = #399'sasdan '#246'd'#601'nilmi'#351
      FieldName = 'MAIN_PAYED'
    end
    object ODSPayInfoMAIN_DUEPAYED: TFloatField
      DisplayLabel = 'Gecikmi'#351' '#601'sasdan '#246'd'#601'nilmi'#351
      FieldName = 'MAIN_DUEPAYED'
    end
    object ODSPayInfoINTRPAYED: TFloatField
      DisplayLabel = 'Faizd'#601'n '#246'd'#601'nilmi'#351
      FieldName = 'INTRPAYED'
    end
    object ODSPayInfoINTR_DUEPAYED: TFloatField
      DisplayLabel = 'Gecikmi'#351' faizd'#601'n '#246'd'#601'nilmi'#351
      FieldName = 'INTR_DUEPAYED'
    end
    object ODSPayInfoREST: TFloatField
      DisplayLabel = #399'sas qal'#305'q '
      FieldName = 'REST'
    end
    object ODSPayInfoINTREST: TFloatField
      DisplayLabel = 'Faiz qal'#305'q'
      FieldName = 'INTREST'
    end
    object ODSPayInfoDUEREST: TFloatField
      DisplayLabel = 'Geckmi'#351' '#601'sas qal'#305'q'
      FieldName = 'DUEREST'
    end
    object ODSPayInfoDUEINTEREST: TFloatField
      DisplayLabel = 'Gecikmi'#231' faiz qal'#305'q'
      FieldName = 'DUEINTEREST'
    end
    object ODSPayInfoPAY_PENALTYAMMOUNT: TFloatField
      DisplayLabel = #214'd'#601'nilmi'#351' d'#601'bb'#601
      FieldName = 'PAY_PENALTYAMMOUNT'
    end
    object ODSPayInfoPENALTYAMMOUNT: TFloatField
      DisplayLabel = 'D'#601'bb'#601
      FieldName = 'PENALTYAMMOUNT'
    end
    object ODSPayInfoFILIAL: TWideStringField
      DisplayLabel = 'filial'
      FieldName = 'FILIAL'
      Size = 50
    end
  end
end
