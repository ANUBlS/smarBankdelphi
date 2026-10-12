object MISForm: TMISForm
  Left = 247
  Top = 115
  Width = 562
  Height = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 554
    Height = 489
    Align = alClient
    BevelInner = bvLowered
    BorderStyle = bsSingle
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 546
      Height = 374
      Align = alClient
      Caption = 'Ôèëòåð'
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 52
        Width = 35
        Height = 13
        Caption = 'Valyuta'
      end
      object Label3: TLabel
        Left = 8
        Top = 212
        Width = 72
        Height = 13
        Caption = 'Istifadÿ÷i qrupu'
      end
      object Label4: TLabel
        Left = 280
        Top = 212
        Width = 50
        Height = 13
        Caption = 'Möøtÿri tipi'
      end
      object Label5: TLabel
        Left = 279
        Top = 52
        Width = 20
        Height = 13
        Caption = 'Filial'
      end
      object LookValute: TEvanescence
        Tag = 3112
        Left = 8
        Top = 68
        Width = 260
        Height = 132
        ItemHeight = 13
        TabOrder = 1
        DataSource = srcValute
        ListField = 'VALU_NAME'
        KeyField = 'VALUTE'
      end
      object LookUsrGrp: TEvanescence
        Tag = 3112
        Left = 8
        Top = 228
        Width = 260
        Height = 132
        ItemHeight = 13
        TabOrder = 3
        DataSource = srcUsrGrp
        ListField = 'DESCRIPTION'
        KeyField = 'ID'
      end
      object LookPersonelType: TEvanescence
        Tag = 3112
        Left = 280
        Top = 228
        Width = 260
        Height = 132
        ItemHeight = 13
        TabOrder = 4
        DataSource = srcPersonelType
        ListField = 'DESCRIPTION'
        KeyField = 'ID'
      end
      object LookBranch: TEvanescence
        Tag = 3112
        Left = 279
        Top = 68
        Width = 260
        Height = 134
        ItemHeight = 13
        TabOrder = 2
        DataSource = srcBranch
        ListField = 'NAME'
        KeyField = 'ID'
      end
      object Panel2: TPanel
        Left = 2
        Top = 15
        Width = 542
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 5
          Top = 9
          Width = 32
          Height = 13
          Caption = 'Tarix : '
        end
        object Tarix: TDateTimePicker
          Left = 38
          Top = 5
          Width = 131
          Height = 21
          CalAlignment = dtaLeft
          Date = 38258.6053962268
          Time = 38258.6053962268
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
        end
      end
      object challValute: TButton
        Left = 128
        Top = 49
        Width = 67
        Height = 17
        Caption = 'Hamûsûnû se÷'
        TabOrder = 5
        OnClick = CheckAllValuteClick
      end
      object unchallValute: TButton
        Left = 200
        Top = 49
        Width = 67
        Height = 17
        Caption = 'Tÿmizlÿ'
        TabOrder = 6
        OnClick = UnCheckAllValuteClick
      end
      object challUsrGrp: TButton
        Left = 128
        Top = 210
        Width = 67
        Height = 17
        Caption = 'Hamûsûnû se÷'
        TabOrder = 7
        OnClick = challUsrGrpClick
      end
      object unchallUsrGrp: TButton
        Left = 200
        Top = 210
        Width = 67
        Height = 17
        Caption = 'Tÿmizlÿ'
        TabOrder = 8
        OnClick = unchallUsrGrpClick
      end
    end
    object challBranch: TButton
      Left = 400
      Top = 51
      Width = 67
      Height = 17
      Caption = 'Hamûsûnû se÷'
      TabOrder = 1
      OnClick = challBranchClick
    end
    object unchallBranch: TButton
      Left = 472
      Top = 51
      Width = 67
      Height = 17
      Caption = 'Tÿmizlÿ'
      TabOrder = 2
      OnClick = unchallBranchClick
    end
    object challPersonalType: TButton
      Left = 400
      Top = 210
      Width = 67
      Height = 17
      Caption = 'Hamûsûnû se÷'
      TabOrder = 3
      OnClick = challPersonalTypeClick
    end
    object unchallPersonalType: TButton
      Left = 472
      Top = 210
      Width = 67
      Height = 17
      Caption = 'Tÿmizlÿ'
      TabOrder = 4
      OnClick = unchallPersonalTypeClick
    end
    object Panel3: TGroupBox
      Left = 2
      Top = 376
      Width = 546
      Height = 107
      Align = alBottom
      Caption = 'Ñûðàëàìà:'
      TabOrder = 5
      object ButtonExport: TBitBtn
        Left = 356
        Top = 30
        Width = 80
        Height = 25
        Anchors = []
        Caption = 'Èõðàæ åò'
        Default = True
        TabOrder = 0
        OnClick = ButtonExportClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object CloseBtn: TBitBtn
        Left = 356
        Top = 67
        Width = 80
        Height = 25
        Anchors = []
        Cancel = True
        Caption = 'Baüla'
        ModalResult = 2
        TabOrder = 1
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object SBListBox: TKeyListBox
        Left = 2
        Top = 15
        Width = 207
        Height = 90
        Align = alLeft
        ItemHeight = 13
        Items.Strings = (
          'Âàëéóòàéà ýþðÿ'
          'Ìöøòÿðè òèïèíÿ ýþðÿ'
          'Ìöøòÿðèíèí àäûíà ýþðÿ'
          'Ôèëèàëà ýþðÿ')
        TabOrder = 2
        Keys.Strings = (
          'J.VAL_NAME'
          'B.PERSONALTYPE'
          'L.NAME'
          'B.BRANCHID')
      end
      object Panel4: TPanel
        Left = 209
        Top = 15
        Width = 29
        Height = 90
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 3
        object spUP: TSpeedButton
          Left = 2
          Top = 15
          Width = 23
          Height = 22
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042104200001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042186300001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042186300001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042186300001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C10421042104218631042104200001F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1042FF7F1863104200001F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042186300001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C}
          OnClick = spUPClick
        end
        object spDown: TSpeedButton
          Left = 2
          Top = 52
          Width = 23
          Height = 22
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042186300001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1042FF7F1863104200001F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C10421042104218631042104200001F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042186300001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042186300001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042186300001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042104200001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C}
          OnClick = spDownClick
        end
      end
    end
  end
  object MISData: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   Rownum as ID'
      ' , B.CREDITLINEAMOUNT -- Kreditin meblegi'
      ' , B.ANNUALYINTERESTRATE --%'
      ' , B.DATEOFCONCLUSION --acilma'
      ' , B.DUEDATEFIRSTCONTRACT --baglanma'
      ' , B.DUEDATELASTCONTRACT --uzadilma'
      ' , B.PURPOSEOFCREDIT -- teyinat'
      ' , C.REST -- qaliq'
      ' , C.INTERESTREST --hes %'
      ' , C.DUEREST-- gecikmish borc'
      ' , C.DUEINTERESTREST --gecikmish%'
      ' , C.PLEDGEPRICE -- Girov deyeri'
      ' , E.PERCENT -- ehtiyat %'
      ' , H.Description -- girovun adi'
      
        ' , Creditsmgr.CM_COMMON.AccountNumber_Get(A.CONTRACTACCID) as CO' +
        'NTRACTACCNO -- Hesab'
      ' , J.VAL_NAME -- $'
      ' , L.NAME --Mushteri'
      ' , ((C.REST+C.DUEREST)* E.PERCENT / 100) * T.OSTAT as ReserveSum'
      'FROM'
      '   Creditsmgr.CM_ACCOUNTS A'
      ' , Creditsmgr.CM_CURR_STATE C'
      ' , Creditsmgr.CM_ACTIVE_CREDITS B'
      ' , Creditsmgr.CM_GUARANTEE G'
      ' , Creditsmgr.CM_PLEDGES H'
      ' , Creditsmgr.SB_AVALUTE J'
      ' , Creditsmgr.CM_RESERVES E'
      ' , Creditsmgr.CM_USERGROUPS F'
      ' , Creditsmgr.CM_BOOROWERINFO L'
      ' , Creditsmgr.SB_TEMPRATE T'
      'WHERE'
      '     (B.ID = A.CREDITID)'
      ' AND (C.CREDITID = B.ID)'
      ' AND (E.ID = C.RESERVEID)'
      ' AND (F.ID = B.USRGROUP)'
      ' AND (G.CREDITID = B.ID)'
      ' AND (H.ID = G.PLEDGEID)'
      ' AND (J.VALUTE = B.CURRENCY)'
      ' AND (L.CREDITID = B.ID)'
      ' AND (T.VAL_KOD=B.CURRENCY)'
      '--ORDER BY B.CURRENCY,b.PERSONALTYPE,L.NAME'
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crSQLWait
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 296
    Top = 8
    object MISDataCONTRACTACCNO: TStringField
      DisplayLabel = 'Ùåñàá ¹'
      FieldName = 'CONTRACTACCNO'
      Size = 4000
    end
    object MISDataVAL_NAME: TStringField
      DisplayLabel = '$'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object MISDataNAME: TStringField
      DisplayLabel = 'Áîðæàëàí'
      FieldName = 'NAME'
      Size = 64
    end
    object MISDataDATEOFCONCLUSION: TDateTimeField
      DisplayLabel = 'Âåðèëìÿ òàðèõè'
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object MISDataDUEDATEFIRSTCONTRACT: TDateTimeField
      DisplayLabel = 'Áàüëàíìà òàðèõè'
      FieldName = 'DUEDATEFIRSTCONTRACT'
      Required = True
    end
    object MISDataDUEDATELASTCONTRACT: TDateTimeField
      DisplayLabel = 'Óçàäûëìà òàðèõè'
      FieldName = 'DUEDATELASTCONTRACT'
    end
    object MISDataCREDITLINEAMOUNT: TFloatField
      DisplayLabel = 'Ìÿáëÿü'
      FieldName = 'CREDITLINEAMOUNT'
      Required = True
    end
    object MISDataANNUALYINTERESTRATE: TFloatField
      DisplayLabel = '%'
      FieldName = 'ANNUALYINTERESTRATE'
      Required = True
    end
    object MISDataINTERESTREST: TFloatField
      DisplayLabel = 'Ôàèç áîðæó'
      FieldName = 'INTERESTREST'
      Required = True
    end
    object MISDataDUEREST: TFloatField
      DisplayLabel = 'Ýåæèêìèø ÿñàñ áîðæ'
      FieldName = 'DUEREST'
      Required = True
    end
    object MISDataDUEINTERESTREST: TFloatField
      DisplayLabel = 'Ýåæèêìèø Ôàèç áîðæó'
      FieldName = 'DUEINTERESTREST'
      Required = True
    end
    object MISDataREST: TFloatField
      DisplayLabel = 'Ãàëûã'
      FieldName = 'REST'
      Required = True
    end
    object MISDataPERCENT: TFloatField
      DisplayLabel = 'Åùòéàò %'
      FieldName = 'PERCENT'
      Required = True
    end
    object MISDataDESCRIPTION: TStringField
      DisplayLabel = 'Ýèðîâóí òèïè'
      FieldName = 'DESCRIPTION'
      Size = 64
    end
    object MISDataPLEDGEPRICE: TFloatField
      DisplayLabel = 'Ýèðîâóí äÿéÿðè'
      FieldName = 'PLEDGEPRICE'
      Required = True
    end
    object MISDataRESERVESUM: TFloatField
      DisplayLabel = 'Åùòèééàò ìÿá.(ìàí)'
      FieldName = 'RESERVESUM'
    end
    object MISDataPURPOSEOFCREDIT: TStringField
      DisplayLabel = 'Òÿéèíàò'
      FieldName = 'PURPOSEOFCREDIT'
      Size = 128
    end
  end
  object Localizer: TNLSLocalizer
    Caption = 'Ìèñ ùåñàáàòû'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 336
    Top = 8
  end
  object MISExporter: TCMExcelExport
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
  object ValuteDataSet: TOracleDataSet
    SQL.Strings = (
      '  SELECT VALUTE, VALU_NAME'
      '    FROM SMART.AVALUTE'
      'ORDER BY VALUTE')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 160
    Top = 240
  end
  object srcValute: TDataSource
    DataSet = ValuteDataSet
    Left = 128
    Top = 240
  end
  object srcUsrGrp: TDataSource
    DataSet = UsrGrpDataSet
    Left = 128
    Top = 296
  end
  object UsrGrpDataSet: TOracleDataSet
    SQL.Strings = (
      '  SELECT id, description'
      '    FROM creditsmgr.cm_usergroups')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 160
    Top = 296
  end
  object PersonelTypeDataSet: TOracleDataSet
    SQL.Strings = (
      ''
      'SELECT id, description'
      '  FROM creditsmgr.cm_categories')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 160
    Top = 184
  end
  object srcPersonelType: TDataSource
    DataSet = PersonelTypeDataSet
    Left = 128
    Top = 184
  end
  object srcBranch: TDataSource
    DataSet = BranchDataSet
    Left = 128
    Top = 136
  end
  object BranchDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT id, name'
      '  FROM smart.filial')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 160
    Top = 136
  end
end
