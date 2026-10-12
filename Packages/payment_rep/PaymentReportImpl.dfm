object Payment_Report: TPayment_Report
  Left = 212
  Top = 122
  Width = 872
  Height = 480
  Caption = 'Payment_Report'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  OnDestroy = ActiveFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 872
    Height = 72
    Align = alTop
    BevelOuter = bvLowered
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitTop = -6
    object Label1: TLabel
      Left = 11
      Top = 1
      Width = 119
      Height = 13
      Caption = #1065#1077#1089#1072#1073#1072#1090' '#1076#1102#1074#1088#1094#1085#1094#1085' '#1103#1074#1074#1103#1083#1080
    end
    object Label2: TLabel
      Left = 11
      Top = 36
      Width = 114
      Height = 13
      Caption = #1065#1077#1089#1072#1073#1072#1090' '#1076#1102#1074#1088#1094#1085#1094#1085' '#1089#1086#1085#1091
    end
    object SpeedButton1: TSpeedButton
      Left = 197
      Top = 16
      Width = 83
      Height = 52
      Caption = #1043#1103#1073#1091#1083' '#1077#1090'   '
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        66010000424D6601000000000000760000002800000016000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555005555555555555555555555005555555555555555555555005555
        5555544555555555550055555555422455555555550055555554222245555555
        5500555555422222245555555500555554222A2222455555550055555222A5A2
        22455555550055555A2A555A222455555500555555A55555A222455555005555
        555555555A222455550055555555555555A222455500555555555555555A2224
        55005555555555555555A222450055555555555555555A224500555555555555
        555555A225005555555555555555555A55005555555555555555555555005555
        55555555555555555500}
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 283
      Top = 16
      Width = 83
      Height = 52
      Caption = 'Excel'
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        36010000424D3601000000000000760000002800000015000000100000000100
        040000000000C000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333000333333333333333333333000338FF3FF3333333333333000338C
        F38CFF33333333333000338CF38CCCFF333333333000338CF38CCCCCFF333333
        3000338CF38CCCCCCCFF33333000338CF38CCCCCCCCCFF333000338CF38CCCCC
        CCCC88F33000338CF38CCCCCCC8833333000338CF38CCCCC883333333000338C
        F38CCC88333333333000338CF38C88333333333330003388F388333333333333
        3000333333333333333333333000333333333333333333333000}
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object DateTimePicker1: TDateTimePicker
      Left = 4
      Top = 15
      Width = 186
      Height = 21
      Date = 39916.439570636600000000
      Time = 39916.439570636600000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 4
      Top = 50
      Width = 186
      Height = 21
      Date = 39916.439588900510000000
      Time = 39916.439588900510000000
      TabOrder = 1
    end
    object Animate1: TAnimate
      Left = 368
      Top = 17
      Width = 80
      Height = 50
      CommonAVI = aviFindFolder
      StopFrame = 29
      Visible = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 72
    Width = 872
    Height = 408
    Align = alClient
    DataSource = PaymentDataSrc
    FixedColor = clInactiveCaption
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'KREDIT'
        Title.Caption = #1050#1088#1077#1076#1080#1090
        Title.Color = clBlue
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBIT'
        Title.Caption = #1044#1077#1073#1080#1090
        Title.Color = clBlue
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KREDIT_HES'
        Title.Color = clBlue
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALUTE'
        Title.Color = clBlue
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBIT_HES'
        Title.Color = clBlue
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REPNAME'
        Title.Caption = #1065#1077#1089#1072#1073#1072#1090#1099#1085' '#1090#1103#1081#1080#1085#1072#1090#1099
        Title.Color = clBlue
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 229
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OLKE'
        Title.Color = clBlue
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 132
        Visible = True
      end>
  end
  object PaymentDataSet: TOracleDataSet
    SQL.Strings = (
      
        'SELECT a.ammount as debit , a.ammount_c as kredit, s.cntr_name a' +
        's olke ,v.valu_name as valute,'
      
        'r.name as repname ,ac1.acc_no as debit_hes, ac2.acc_no as kredit' +
        '_hes'
      
        '  FROM provarch a,countries s,avalute_t v,reportdescs r,account ' +
        'ac1,account ac2'
      '  where a.COUNTRID=s.id    and '
      '        v.valute=a.val_acc and'
      '        r.id=a.reportid    and'
      '        ac1.id=a.debt      and'
      '        ac2.id=a.kredit    and '
      '        s.id>0 and '
      '        s.id<>4 and '
      '        a.dat between :dat and :dat1')
    Optimize = False
    Variables.Data = {
      0400000002000000080000003A004400410054000C0000000000000000000000
      0A0000003A0044004100540031000C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000070000000A000000440045004200490054000100000000000C000000
      4B0052004500440049005400010000000000080000004F004C004B0045000100
      000000000C000000560041004C005500540045000100000000000E0000005200
      450050004E0041004D0045000100000000001200000044004500420049005400
      5F00480045005300010000000000140000004B00520045004400490054005F00
      480045005300010000000000}
    Session = sboapiDataModule.SBSession
    Left = 528
    Top = 32
    object PaymentDataSetDEBIT: TFloatField
      DisplayLabel = #1044#1077#1073#1080#1090' '#1084#1103#1073#1083#1103#1100
      FieldName = 'DEBIT'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object PaymentDataSetKREDIT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090' '#1084#1103#1073#1083#1103#1100
      FieldName = 'KREDIT'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object PaymentDataSetOLKE: TStringField
      DisplayLabel = #1070#1083#1082#1103
      FieldName = 'OLKE'
      Size = 30
    end
    object PaymentDataSetVALUTE: TStringField
      DisplayLabel = #1042#1072#1083#1081#1091#1090#1072
      FieldName = 'VALUTE'
      Size = 25
    end
    object PaymentDataSetREPNAME: TStringField
      DisplayLabel = #1065#1077#1089#1072#1073#1072#1090#1099#1085' '#1090#1103#1081#1080#1085#1072#1090#1099' '
      FieldName = 'REPNAME'
      Size = 150
    end
    object PaymentDataSetDEBIT_HES: TStringField
      DisplayLabel = #1044#1077#1073#1080#1090' '#1097#1077#1089#1072#1073
      FieldName = 'DEBIT_HES'
      Required = True
    end
    object PaymentDataSetKREDIT_HES: TStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090' '#1097#1077#1089#1072#1073
      FieldName = 'KREDIT_HES'
      Required = True
    end
  end
  object PaymentDataSrc: TDataSource
    DataSet = PaymentDataSet
    Left = 496
    Top = 32
  end
  object SysDataSet: TOracleDataSet
    SQL.Strings = (
      'select * from sysdat')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000040000000E000000540045004B005F00440041005400010000000000
      1000000050005200450044005F004400410054000100000000000E0000004100
      520043005F004400410059000100000000000A00000043004C004F0053004500
      010000000000}
    Session = sboapiDataModule.SBSession
    Left = 624
    Top = 32
    object SysDataSetTEK_DAT: TDateTimeField
      FieldName = 'TEK_DAT'
      Required = True
    end
    object SysDataSetPRED_DAT: TDateTimeField
      FieldName = 'PRED_DAT'
    end
    object SysDataSetARC_DAY: TDateTimeField
      FieldName = 'ARC_DAY'
    end
    object SysDataSetCLOSE: TIntegerField
      FieldName = 'CLOSE'
    end
  end
  object ExcelExport: TCMExcelExport
    StyleColumnWidth = cwAutoFit
    ColumnWidth = 0
    FontTitles.Charset = RUSSIAN_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -13
    FontTitles.Name = 'Arial Az Lat'
    FontTitles.Style = []
    BorderTitles.Weight = bwThick
    BorderTitles.LineStyle = blLine
    OrientationTitles = 0
    FontData.Charset = RUSSIAN_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Azl Sans Serif'
    FontData.Style = []
    BorderData.Weight = bwThin
    BorderData.LineStyle = blLine
    FontSummary.Charset = RUSSIAN_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Azl Sans Serif'
    FontSummary.Style = []
    SummaryFields.Strings = (
      #1074#1099#1072#1082#1074#1074#1087#1089#1087#1074#1072#1087)
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 576
    Top = 32
  end
end
