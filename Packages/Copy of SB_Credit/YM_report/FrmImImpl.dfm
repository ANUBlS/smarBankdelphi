object FrmIm: TFrmIm
  Left = 332
  Top = 143
  Width = 463
  Height = 373
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 455
    Height = 339
    Align = alTop
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    BorderStyle = bsSingle
    Color = clWhite
    Ctl3D = False
    ParentBiDiMode = False
    ParentCtl3D = False
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 297
      Top = 304
      Width = 74
      Height = 31
      Caption = 'Гябул'
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
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
    object SpeedButton2: TSpeedButton
      Left = 377
      Top = 303
      Width = 70
      Height = 32
      Caption = 'Имтина'
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
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
    object GroupBox6: TGroupBox
      Left = 2
      Top = 1
      Width = 223
      Height = 65
      Caption = 'Тарих '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object CBaValute: TCheckBox
        Left = 8
        Top = 40
        Width = 97
        Height = 17
        Caption = 'Tяtbiq et'
        Checked = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 0
      end
      object DateTimePicker1: TDateTimePicker
        Left = 5
        Top = 17
        Width = 213
        Height = 21
        CalAlignment = dtaLeft
        Date = 40113.5973054051
        Time = 40113.5973054051
        DateFormat = dfShort
        DateMode = dmComboBox
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Kind = dtkDate
        ParseInput = False
        ParentFont = False
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 67
      Width = 221
      Height = 233
      Caption = 'Истифадячи гурупу'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object LookUsrGrp: TEvanescence
        Tag = 3112
        Left = 3
        Top = 31
        Width = 215
        Height = 200
        Color = clWhite
        Flat = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        DataSource = srcUsrGrp
        ListField = 'DESCRIPTION'
        KeyField = 'ID'
      end
      object CheckBox2: TCheckBox
        Left = 6
        Top = 14
        Width = 97
        Height = 17
        Caption = 'Щамсыны сеч'
        Checked = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 1
        OnClick = CheckBox2Click
      end
    end
    object GroupBox2: TGroupBox
      Left = 230
      Top = 1
      Width = 223
      Height = 65
      Caption = 'Боржаланын tipi'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object CBPersons: TCheckBox
        Left = 8
        Top = 40
        Width = 97
        Height = 17
        Caption = 'Tяtbiq et'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object LCBPersons: TDBLookupComboBox
        Left = 5
        Top = 18
        Width = 211
        Height = 19
        Ctl3D = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'DESCRIPION'
        ListSource = DataSrcPersonTypes
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 231
      Top = 67
      Width = 221
      Height = 233
      Caption = 'Mцшtяri tipi'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object LookPersonelType: TEvanescence
        Tag = 3112
        Left = 3
        Top = 31
        Width = 215
        Height = 200
        Color = clWhite
        Flat = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        DataSource = srcPersonelType
        ListField = 'DESCRIPTION'
        KeyField = 'ID'
      end
      object CheckBox1: TCheckBox
        Left = 6
        Top = 14
        Width = 97
        Height = 17
        Caption = 'Щамсыны сеч'
        Checked = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 1
        OnClick = CheckBox1Click
      end
    end
  end
  object ExcelExport: TCMExcelExport
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
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 376
    Top = 152
  end
  object UsrGrpDataSet: TOracleDataSet
    SQL.Strings = (
      '  SELECT id, description'
      '    FROM creditsmgr.cm_usergroups')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000200000049440100000000000B0000004445534352495054
      494F4E010000000000}
    Session = CMDataModule.CMSession
    Left = 184
    Top = 119
  end
  object srcUsrGrp: TDataSource
    DataSet = UsrGrpDataSet
    Left = 184
    Top = 167
  end
  object srcPersonelType: TDataSource
    DataSet = PersonelTypeDataSet
    Left = 275
    Top = 177
  end
  object PersonelTypeDataSet: TOracleDataSet
    SQL.Strings = (
      ''
      'SELECT id, description'
      '  FROM creditsmgr.cm_categories')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000200000049440100000000000B0000004445534352495054
      494F4E010000000000}
    Session = CMDataModule.CMSession
    Left = 280
    Top = 119
  end
  object PersonTypes: TOracleDataSet
    SQL.Strings = (
      'select '
      '  ID,'
      '  DESCRIPION'
      'from'
      '  CM_PERSONS'
      ''
      'order by id')
    Cursor = crHourGlass
    Session = CMDataModule.CMSession
    Left = 320
    Top = 40
  end
  object DataSrcPersonTypes: TDataSource
    DataSet = PersonTypes
    Left = 368
    Top = 40
  end
  object Main: TOracleDataSet
    SQL.Strings = (
      
        'select p.newfinanceamount,p.creditlineamount, p.numberofcredit,p' +
        '.annualyinterestrate,P.dateofconclusion,P.duedatefirstcontract,h' +
        '.rest,h.interestrest,h.duerest,h.dueinterestrest,'
      ' CM_COMMON.accountnumber_get(a.LOANACCID)    as Ssuda,'
      ' CM_COMMON.accountnumber_get(a.INTERESTACCID)as faizhes,'
      
        ' CM_COMMON.accountnumber_get(a.DUELOANACCID)  as GecSsuda, u.DES' +
        'CRIPTION,'
      
        ' CM_COMMON.accountnumber_get(a.DUEINTERESTACCID)as Gecfaizhes, c' +
        'a.description as "Мцштяринин типи",'
      
        ' cm_common.get_accname(a.CONTRACTACCID)  as name,h.pledgeprice /' +
        '*ip.PREDCOST*/ as "Ipoteka pridmentinin dяйяri"'
      ' from'
      
        ' creditsmgr.cm_active_credits p/*,cm_ip_info ip*/,creditsmgr.cm_' +
        'categories ca,'
      
        ' creditsmgr.cm_history h,creditsmgr.cm_accounts a,creditsmgr.CM_' +
        'USERGROUPS u'
      ' where'
      
        ' p.id=h.creditid and /*ip.creditid=p.id and*/ ca.id=p.customerty' +
        'pe and'
      ' h.hdate=:dat /*and h.rest+h.INTERESTREST>0*/ and'
      ' p.id=a.creditid and u.id=p.usrgroup'
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
      ''
      ''
      ' '
      ''
      ''
      ' '
      ''
      ' ')
    Variables.Data = {0300000001000000040000003A4441540C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000120000000E0000004E554D4245524F46435245444954010000000000
      13000000414E4E55414C59494E54455245535452415445010000000000040000
      00524553540100000000000C000000494E544552455354524553540100000000
      0007000000445545524553540100000000000F000000445545494E5445524553
      5452455354010000000000050000005353554441010000000000070000004641
      495A4845530100000000000800000047454353535544410100000000000A0000
      004745434641495A484553010000000000040000004E414D4501000000000010
      000000444154454F46434F4E434C5553494F4E01000000000014000000445545
      444154454649525354434F4E5452414354010000000000100000004E45574649
      4E414E4345414D4F554E54010000000000100000004352454449544C494E4541
      4D4F554E540100000000001B00000049706F74656B6120707269646D656E7469
      6E696E2064FFE9FF72690100000000000F000000CCF6F8F2FFF0E8EDE8ED20F2
      E8EFE80100000000000B0000004445534352495054494F4E010000000000}
    Session = CMDataModule.CMSession
    Left = 272
    Top = 236
    object MainNUMBEROFCREDIT: TStringField
      DisplayLabel = 'Мцгавилянин № '
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object MainNAME: TStringField
      DisplayLabel = 'Боржаланын ады'
      FieldName = 'NAME'
      Size = 4000
    end
    object MainNEWFINANCEAMOUNT: TFloatField
      DisplayLabel = 'Кредитин мябляъи '
      FieldName = 'NEWFINANCEAMOUNT'
    end
    object MainCREDITLINEAMOUNT: TFloatField
      DisplayLabel = 'Й/М ммябляь'
      FieldName = 'CREDITLINEAMOUNT'
    end
    object MainANNUALYINTERESTRATE: TFloatField
      DisplayLabel = 'Катирофка дяряжяси'
      FieldName = 'ANNUALYINTERESTRATE'
      Required = True
    end
    object MainDATEOFCONCLUSION: TDateTimeField
      DisplayLabel = 'Ачылма тарихи '
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object MainDUEDATEFIRSTCONTRACT: TDateTimeField
      DisplayLabel = 'Битмя тарихи '
      FieldName = 'DUEDATEFIRSTCONTRACT'
      Required = True
    end
    object MainREST: TFloatField
      DisplayLabel = 'Я.Б Галыг'
      FieldName = 'REST'
      Required = True
    end
    object MainSSUDA: TStringField
      DisplayLabel = 'Я.Б Щесабы'
      FieldName = 'SSUDA'
      Size = 4000
    end
    object MainINTERESTREST: TFloatField
      DisplayLabel = 'Ф.Б Галыг '
      FieldName = 'INTERESTREST'
      Required = True
    end
    object MainFAIZHES: TStringField
      DisplayLabel = 'Ф.Б Щесабы'
      FieldName = 'FAIZHES'
      Size = 4000
    end
    object MainDUEREST: TFloatField
      DisplayLabel = 'Э.Я.Б Галыг'
      FieldName = 'DUEREST'
      Required = True
    end
    object MainGECSSUDA: TStringField
      DisplayLabel = 'Э.Я.Б Щесабы'
      FieldName = 'GECSSUDA'
      Size = 4000
    end
    object MainDUEINTERESTREST: TFloatField
      DisplayLabel = 'Э.Ф.Б Галыг'
      FieldName = 'DUEINTERESTREST'
      Required = True
    end
    object MainGECFAIZHES: TStringField
      DisplayLabel = 'Э.Ф.Б Щесабы'
      FieldName = 'GECFAIZHES'
      Size = 4000
    end
    object MainDSDesigner: TStringField
      FieldName = 'Мцштяринин типи'
      Size = 128
    end
    object MainIpotekapridmentinindri: TFloatField
      FieldName = 'Ipoteka pridmentinin dяйяri'
    end
    object MainDESCRIPTION: TStringField
      DisplayLabel = 'Bankin adi'
      FieldName = 'DESCRIPTION'
      Size = 255
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select * from smart.sysdat')
    QBEDefinition.QBEFieldDefs = {
      04000000040000000700000054454B5F44415401000000000008000000505245
      445F444154010000000000070000004152435F44415901000000000005000000
      434C4F5345010000000000}
    Session = CMDataModule.CMSession
    Left = 336
    Top = 236
    object OracleDataSet1TEK_DAT: TDateTimeField
      FieldName = 'TEK_DAT'
      Required = True
    end
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = 'Им Щесабаты'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 125
    Top = 164
  end
end
