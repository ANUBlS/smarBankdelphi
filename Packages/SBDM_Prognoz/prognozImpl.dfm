object Prognoz: TPrognoz
  Left = 328
  Top = 171
  ClientHeight = 167
  ClientWidth = 379
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton2: TSpeedButton
    Left = 303
    Top = 121
    Width = 73
    Height = 31
    Cursor = crHandPoint
    Caption = #1041#1072#1100#1083#1072
    Flat = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333C44833333C83333333388F333333F33330000333C4448333C44833333
      38F38F333F88F3330000333C444483C44448333338F338F3F8338F3300003333
      C44448444448333338F3338F833338F3000033333C44444444833333338F3338
      3333F8330000333333C44444483333333338F333333F83330000333333344444
      8333333333338F333338333300003333333C444483333333333338F333833333
      0000333333C444448333333333333833338F3333000033333C44484448333333
      33338333338F333300003333C44483C44483333333383338F338F33300003333
      C448333C44483333338F33838F338F33000033333C433333C4443333338FF833
      38F338F300003333333333333C4C333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentFont = False
    OnClick = SpeedButton2Click
  end
  object SpeedButton1: TSpeedButton
    Left = 227
    Top = 121
    Width = 73
    Height = 31
    Caption = #1043#1103#1073#1091#1083' '#1077#1090
    Flat = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333300333333333333333388F3333333333000033330440333333333333
      338338F3333333330000333044440333333333333833338F3333333300003304
      444440333333333383333338F3333333000030444C44440333333338F338F333
      8F33333300003444C3C4440333333338F3838F338F33333300003C4C333C4440
      33333338F83338F338F33333000033C33333C444033333338333338F338F3333
      0000333333333C444033333333333338F338F33300003333333333C444033333
      333333338F338F33000033333333333C444033333333333338F338F300003333
      33333333C444033333333333338F338F00003333333333333C44033333333333
      3338F38F000033333333333333C443333333333333338F830000333333333333
      333C333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 185
    Height = 59
    Caption = #1057#1080#1089#1090#1077#1084' '#1090#1072#1088#1080#1093#1080
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object DateTimePicker1: TDateTimePicker
      Left = 3
      Top = 14
      Width = 177
      Height = 21
      Date = 40056.420768588000000000
      Time = 40056.420768588000000000
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 5
      Top = 38
      Width = 97
      Height = 17
      Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 60
    Width = 185
    Height = 59
    Caption = #1055#1088#1086#1075#1085#1086#1079' '#1077#1076#1080#1083#1103#1078#1103#1082' '#1090#1072#1088#1093
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object DateTimePicker2: TDateTimePicker
      Left = 2
      Top = 15
      Width = 178
      Height = 21
      Date = 40056.420792280100000000
      Time = 40056.420792280100000000
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 5
      Top = 38
      Width = 97
      Height = 17
      Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 184
    Top = 60
    Width = 194
    Height = 59
    Caption = #1060#1080#1083#1080#1072#1083
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object LCBFilials: TDBLookupComboboxEh
      Left = 5
      Top = 14
      Width = 185
      Height = 22
      DropDownBox.Sizable = True
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = FilialsDatSrc
      ParentFont = False
      TabOrder = 0
      Visible = True
    end
    object CBFilial: TCheckBox
      Left = 6
      Top = 38
      Width = 97
      Height = 17
      Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object GroupBox4: TGroupBox
    Left = 184
    Top = 0
    Width = 194
    Height = 59
    Caption = #1042#1072#1083#1081#1091#1090#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object CBAvalute: TCheckBox
      Left = 5
      Top = 38
      Width = 97
      Height = 17
      Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
      TabOrder = 0
    end
    object LCBValutes: TDBLookupComboboxEh
      Left = 5
      Top = 14
      Width = 185
      Height = 22
      DropDownBox.Sizable = True
      EditButtons = <>
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      KeyField = 'VALUTE'
      ListField = 'VALU_NAME'
      ListSource = valutesDatSrc
      ParentFont = False
      TabOrder = 1
      Visible = True
    end
  end
  object Animate1: TAnimate
    Left = 89
    Top = 106
    Width = 80
    Height = 50
    CommonAVI = aviFindFolder
    StopFrame = 29
    Visible = False
  end
  object valutes: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name from avalute')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C000000560041004C005500540045000100000000001200
      0000560041004C0055005F004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 16
    object valutesVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object valutesVALU_NAME: TWideStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
  end
  object Filials: TOracleDataSet
    SQL.Strings = (
      'select id,name from filial')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 16
    Top = 32
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
    Left = 50
    Top = 33
  end
  object valutesDatSrc: TDataSource
    DataSet = valutes
    Left = 48
  end
  object Sysdat: TOracleDataSet
    SQL.Strings = (
      'select * from sysdat')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 8
    Top = 64
  end
  object prognoz: TOracleDataSet
    SQL.Strings = (
      
        'SELECT cont.contractno, av.val_name,fil.name as filname ,cont.op' +
        'endate,cont.closedate,intr.interest||'#39'%'#39' as intres,'
      
        '       sbcm_stored_programs.get_customernamebyid (cont.customeri' +
        'd)AS custname,stat.facticaldebt,'
      
        '       sbcm_stored_programs.Get_ContractAccount(ac.contractaccid' +
        ')  as InterestAccNO,'
      
        '       ar.pok_ostat ,round(sbcm_report.get_prognoz(cont.id ,:dat' +
        '),2 ) as prognoz ,'
      
        '         ar.pok_ostat+round(sbcm_report.get_prognoz(cont.id ,:da' +
        't),2 ) as sumprognoz                                            ' +
        '           '
      'FROM sbcm_contracts cont,'
      '       filial fil,'
      
        '       avalute av,sbcm_contract_state stat,sbcm_contract_account' +
        's ac,archost ar,sbcm_interests intr'
      'WHERE  cont.currency = av.valute'
      'AND cont.branchid = fil.ID and  intr.id# = cont.id'
      
        'and cont.type# = 3 and ac.id#=cont.id and ac.interestaccid=ar.ac' +
        'c_id and ar.datdate=(select tek_dat from sysdat) and '
      'stat.id#=cont.id'
      ' /*13*/'
      '--select * from sysdat'
      ''
      ''
      '  '
      '')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A004400410054000C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000C0000001400000043004F004E00540052004100430054004E004F00
      01000000000010000000560041004C005F004E0041004D004500010000000000
      0E000000460049004C004E0041004D0045000100000000001000000043005500
      530054004E0041004D0045000100000000001800000046004100430054004900
      430041004C0044004500420054000100000000000E000000500052004F004700
      4E004F005A0001000000000014000000530055004D00500052004F0047004E00
      4F005A00010000000000100000004F00500045004E0044004100540045000100
      000000001200000043004C004F00530045004400410054004500010000000000
      0C00000049004E0054005200450053000100000000001A00000049004E005400
      450052004500530054004100430043004E004F00010000000000120000005000
      4F004B005F004F005300540041005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 68
    object prognozCONTRACTNO: TWideStringField
      FieldName = 'CONTRACTNO'
      Size = 64
    end
    object prognozVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object prognozFILNAME: TWideStringField
      FieldName = 'FILNAME'
      Size = 90
    end
    object prognozOPENDATE: TDateTimeField
      FieldName = 'OPENDATE'
    end
    object prognozCLOSEDATE: TDateTimeField
      FieldName = 'CLOSEDATE'
    end
    object prognozINTRES: TWideStringField
      FieldName = 'INTRES'
      Size = 41
    end
    object prognozCUSTNAME: TWideStringField
      FieldName = 'CUSTNAME'
      Size = 4000
    end
    object prognozFACTICALDEBT: TFloatField
      FieldName = 'FACTICALDEBT'
    end
    object prognozINTERESTACCNO: TWideStringField
      FieldName = 'INTERESTACCNO'
      Size = 4000
    end
    object prognozPOK_OSTAT: TFloatField
      FieldName = 'POK_OSTAT'
    end
    object prognozPROGNOZ: TFloatField
      FieldName = 'PROGNOZ'
    end
    object prognozSUMPROGNOZ: TFloatField
      FieldName = 'SUMPROGNOZ'
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
    Left = 464
    Top = 16
  end
end
