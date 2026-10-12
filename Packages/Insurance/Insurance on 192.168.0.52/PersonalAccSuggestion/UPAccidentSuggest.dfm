object PAccidentSuggest: TPAccidentSuggest
  Left = 192
  Top = 107
  Width = 324
  Height = 492
  Caption = 'Teklifname'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 316
    Height = 430
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 38
      Width = 96
      Height = 13
      Caption = 'Сыьорта мябляьи/лимити'
    end
    object Label2: TLabel
      Left = 8
      Top = 62
      Width = 135
      Height = 13
      Caption = 'Сыьорта мябляьи цзря суб-лимит'
    end
    object Label3: TLabel
      Left = 8
      Top = 86
      Width = 57
      Height = 13
      Caption = 'Тибби хяржляр'
    end
    object Label4: TLabel
      Left = 8
      Top = 112
      Width = 62
      Height = 13
      Caption = 'Сыьорта щаггы'
    end
    object Label5: TLabel
      Left = 8
      Top = 134
      Width = 95
      Height = 13
      Caption = 'Цмуми сыьорта щаггы'
    end
    object Label11: TLabel
      Left = 8
      Top = 152
      Width = 30
      Height = 13
      Caption = 'Шяртляр'
    end
    object Label6: TLabel
      Left = 8
      Top = 384
      Width = 62
      Height = 13
      Caption = 'Ящатя даиряси'
    end
    object Label12: TLabel
      Left = 8
      Top = 408
      Width = 81
      Height = 13
      Caption = 'Мцгавилянин тарихи'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 16
      Width = 101
      Height = 13
      Caption = 'Мцгавилянин валйутасы'
    end
    object Label9: TLabel
      Left = 8
      Top = 272
      Width = 39
      Height = 13
      Caption = 'Франшиза'
    end
    object DBLookupComboBoxCondition: TDBLookupComboBox
      Left = 6
      Top = 173
      Width = 307
      Height = 21
      DataField = 'CNDT_ID'
      DataSource = PAccSugestSource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = ConditionSource
      ParentFont = False
      TabOrder = 5
      OnClick = DBEdit1Change
      OnKeyPress = DBEdit1KeyPress
    end
    object memConditions: TMemo
      Left = 6
      Top = 220
      Width = 307
      Height = 45
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 7
      OnChange = DBEdit1Change
      OnKeyPress = DBEdit1KeyPress
    end
    object cbConditions: TCheckBox
      Left = 7
      Top = 201
      Width = 79
      Height = 17
      Caption = 'Йадда сахла'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = DBEdit1Change
      OnKeyPress = DBEdit1KeyPress
    end
    object DBEdit1: TDBEdit
      Left = 168
      Top = 36
      Width = 145
      Height = 21
      DataField = 'INSURANCESUM'
      DataSource = PAccSugestSource
      TabOrder = 1
      OnChange = DBEdit1Change
      OnKeyPress = DBEdit1KeyPress
    end
    object DBEdit3: TDBEdit
      Left = 168
      Top = 80
      Width = 145
      Height = 21
      DataField = 'MEDICALCOST'
      DataSource = PAccSugestSource
      TabOrder = 2
      OnChange = DBEdit1Change
      OnKeyPress = DBEdit1KeyPress
    end
    object DBEdit4: TDBEdit
      Left = 168
      Top = 104
      Width = 145
      Height = 21
      DataField = 'AMMOUNT'
      DataSource = DSContracts
      TabOrder = 3
      OnChange = DBEdit1Change
      OnKeyPress = DBEdit1KeyPress
    end
    object DBEdit5: TDBEdit
      Left = 168
      Top = 128
      Width = 145
      Height = 21
      DataField = 'ALL_INSAMMOUNT'
      DataSource = PAccSugestSource
      TabOrder = 4
      OnChange = DBEdit1Change
      OnKeyPress = DBEdit1KeyPress
    end
    object DBEdit6: TDBEdit
      Left = 168
      Top = 380
      Width = 145
      Height = 21
      DataField = 'GEO'
      DataSource = PAccSugestSource
      TabOrder = 11
      OnChange = DBEdit1Change
      OnKeyPress = DBEdit1KeyPress
    end
    object DTPContractDate: TDateTimePicker
      Left = 168
      Top = 402
      Width = 145
      Height = 21
      CalAlignment = dtaLeft
      Date = 39029.4869041088
      Time = 39029.4869041088
      DateFormat = dfShort
      DateMode = dmComboBox
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Kind = dtkDate
      ParseInput = False
      ParentFont = False
      TabOrder = 12
      OnChange = DBEdit1Change
      OnKeyPress = DBEdit1KeyPress
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 168
      Top = 10
      Width = 145
      Height = 21
      DataField = 'VALUTE_ID'
      DataSource = DSContracts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      KeyField = 'VALUTE'
      ListField = 'VALU_NAME'
      ListSource = AValuteData
      ParentFont = False
      TabOrder = 0
      OnClick = DBLookupComboBox3Click
      OnKeyPress = DBEdit1KeyPress
    end
    object memFrashize: TMemo
      Left = 6
      Top = 332
      Width = 307
      Height = 45
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 10
      OnChange = DBEdit1Change
      OnKeyPress = DBEdit1KeyPress
    end
    object cbFranshiz: TCheckBox
      Left = 6
      Top = 312
      Width = 79
      Height = 17
      Caption = 'Йадда сахла'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = DBEdit1Change
      OnKeyPress = DBEdit1KeyPress
    end
    object DBLookupComboBoxFranshiz: TDBLookupComboBox
      Left = 6
      Top = 290
      Width = 307
      Height = 21
      DataField = 'FRZ_ID'
      DataSource = PAccSugestSource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = FranshizData
      ParentFont = False
      TabOrder = 8
      OnClick = DBEdit1Change
      OnKeyPress = DBEdit1KeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 430
    Width = 316
    Height = 35
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object btPolicy: TBitBtn
      Left = 4
      Top = 5
      Width = 60
      Height = 24
      Caption = 'Полис'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btPolicyClick
      OnKeyPress = DBEdit1KeyPress
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF7770777777
        77FFFF777807777777FFFF777700777777FFFF77770B077777FFFF770000B077
        77FFFF770BBBBB0777FFFF7770FB000077FFFF7770BBB07777FFFF00000BFB07
        77FFFF0FBBBFBBB077FFFF70FBFB000007FFFF70BFBFB07777FFFF770BFBFB07
        77FFFF770FFFFFF077FFFF7770FBFFBF07FFFF777000000000FF}
    end
    object btPrint: TBitBtn
      Left = 65
      Top = 5
      Width = 60
      Height = 24
      Caption = 'Чап'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btPrintClick
      OnKeyPress = DBEdit1KeyPress
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object btApply: TBitBtn
      Left = 126
      Top = 5
      Width = 60
      Height = 24
      Caption = 'Apply'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btApplyClick
      OnKeyPress = DBEdit1KeyPress
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 188
      Top = 5
      Width = 60
      Height = 24
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn1Click
      OnKeyPress = DBEdit1KeyPress
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
    object BitBtn2: TBitBtn
      Left = 249
      Top = 5
      Width = 63
      Height = 24
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn2Click
      OnKeyPress = DBEdit1KeyPress
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
  end
  object AccidentSource: TDataSource
    DataSet = ODSPAccident
    Left = 128
    Top = 184
  end
  object PAccSugestSource: TDataSource
    DataSet = ODSPAccSuggest
    Left = 168
    Top = 184
  end
  object ConditionSource: TDataSource
    DataSet = ODSCondition
    Left = 208
    Top = 184
  end
  object ODSPAccident: TOracleDataSet
    SQL.Strings = (
      
        'select pacc.rowid,pacc.* from ins_grouppersonalaccident pacc whe' +
        're pacc.id=:id')
    Variables.Data = {0300000001000000030000003A4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000020000000020000004944010000000000060000004B4C495F49440100
      000000000E000000434F4E544143545F504552534F4E0100000000000F000000
      42414E4B494E475F44455441494C530100000000000F000000544F54414C454D
      505F4E554D42455201000000000003000000414F470100000000000300000041
      4F5001000000000003000000534D4701000000000003000000534D5001000000
      000003000000424347010000000000030000004243500100000000000E000000
      444543495245445F414D4F554E54010000000000020000004144010000000000
      02000000504401000000000003000000504C5501000000000003000000454D45
      0100000000000200000048430100000000000200000048530100000000000300
      0000425242010000000000040000004255524E01000000000003000000545444
      010000000000110000004E4F545F434F5645524544504552494F440100000000
      000C0000004F5554534944454F46415A450100000000000700000052454E4557
      414C0100000000000700000054524156454C5301000000000006000000545950
      454944010000000000060000005249534B4944010000000000110000004E4F54
      5F434F56455245504552494F4431010000000000080000004D41585745454B53
      0100000000000800000050524F4649544944010000000000070000004147454E
      5449440100000000000C000000434C4F53455F505245464958010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 128
    Top = 216
    object ODSPAccidentID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSPAccidentKLI_ID: TFloatField
      FieldName = 'KLI_ID'
      Required = True
    end
    object ODSPAccidentCONTACT_PERSON: TStringField
      FieldName = 'CONTACT_PERSON'
      Size = 128
    end
    object ODSPAccidentBANKING_DETAILS: TStringField
      FieldName = 'BANKING_DETAILS'
      Size = 128
    end
    object ODSPAccidentTOTALEMP_NUMBER: TFloatField
      FieldName = 'TOTALEMP_NUMBER'
    end
    object ODSPAccidentAOG: TFloatField
      FieldName = 'AOG'
    end
    object ODSPAccidentAOP: TFloatField
      FieldName = 'AOP'
    end
    object ODSPAccidentSMG: TFloatField
      FieldName = 'SMG'
    end
    object ODSPAccidentSMP: TFloatField
      FieldName = 'SMP'
    end
    object ODSPAccidentBCG: TFloatField
      FieldName = 'BCG'
    end
    object ODSPAccidentBCP: TFloatField
      FieldName = 'BCP'
    end
    object ODSPAccidentDECIRED_AMOUNT: TFloatField
      FieldName = 'DECIRED_AMOUNT'
    end
    object ODSPAccidentAD: TFloatField
      FieldName = 'AD'
    end
    object ODSPAccidentPD: TFloatField
      FieldName = 'PD'
    end
    object ODSPAccidentPLU: TFloatField
      FieldName = 'PLU'
    end
    object ODSPAccidentEME: TFloatField
      FieldName = 'EME'
    end
    object ODSPAccidentHC: TFloatField
      FieldName = 'HC'
    end
    object ODSPAccidentHS: TFloatField
      FieldName = 'HS'
    end
    object ODSPAccidentBRB: TFloatField
      FieldName = 'BRB'
    end
    object ODSPAccidentBURN: TFloatField
      FieldName = 'BURN'
    end
    object ODSPAccidentTTD: TFloatField
      FieldName = 'TTD'
    end
    object ODSPAccidentNOT_COVEREDPERIOD: TStringField
      FieldName = 'NOT_COVEREDPERIOD'
      Size = 32
    end
    object ODSPAccidentOUTSIDEOFAZE: TStringField
      FieldName = 'OUTSIDEOFAZE'
      Size = 1024
    end
    object ODSPAccidentRENEWAL: TStringField
      FieldName = 'RENEWAL'
      Size = 1024
    end
    object ODSPAccidentTRAVELS: TStringField
      FieldName = 'TRAVELS'
      Size = 1024
    end
    object ODSPAccidentTYPEID: TIntegerField
      FieldName = 'TYPEID'
      Required = True
    end
    object ODSPAccidentRISKID: TFloatField
      FieldName = 'RISKID'
    end
    object ODSPAccidentNOT_COVEREPERIOD1: TStringField
      FieldName = 'NOT_COVEREPERIOD1'
      Size = 32
    end
    object ODSPAccidentMAXWEEKS: TIntegerField
      FieldName = 'MAXWEEKS'
    end
    object ODSPAccidentPROFITID: TFloatField
      FieldName = 'PROFITID'
    end
    object ODSPAccidentAGENTID: TFloatField
      FieldName = 'AGENTID'
    end
  end
  object ODSPAccSuggest: TOracleDataSet
    SQL.Strings = (
      'select  s.rowid,s.* from ins_pacc_suggestion s'
      'where paid = :paid')
    Variables.Data = {0300000001000000050000003A50414944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000009000000020000004944010000000000040000005041494401000000
      000007000000434E44545F49440100000000000C000000494E535552414E4345
      53554D0100000000000D000000494E535552414E434554494D45010000000000
      0B0000004D45444943414C434F53540100000000000E000000414C4C5F494E53
      414D4D4F554E540100000000000300000047454F010000000000060000004652
      5A5F4944010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 168
    Top = 216
    object ODSPAccSuggestID: TFloatField
      FieldName = 'ID'
    end
    object ODSPAccSuggestPAID: TFloatField
      FieldName = 'PAID'
    end
    object ODSPAccSuggestCNDT_ID: TFloatField
      FieldName = 'CNDT_ID'
    end
    object ODSPAccSuggestINSURANCESUM: TFloatField
      FieldName = 'INSURANCESUM'
    end
    object ODSPAccSuggestINSURANCETIME: TDateTimeField
      FieldName = 'INSURANCETIME'
    end
    object ODSPAccSuggestMEDICALCOST: TFloatField
      FieldName = 'MEDICALCOST'
    end
    object ODSPAccSuggestALL_INSAMMOUNT: TFloatField
      FieldName = 'ALL_INSAMMOUNT'
    end
    object ODSPAccSuggestGEO: TStringField
      FieldName = 'GEO'
      Size = 128
    end
    object ODSPAccSuggestFRZ_ID: TFloatField
      FieldName = 'FRZ_ID'
    end
  end
  object ODSCondition: TOracleDataSet
    SQL.Strings = (
      'select idr.rowid, idr.* from ins_dict_conditions idr')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 216
    object ODSConditionID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSConditionNAME: TStringField
      FieldName = 'NAME'
      Size = 1024
    end
  end
  object ODSContracts: TOracleDataSet
    SQL.Strings = (
      'select ic.rowid, ic.* from ins_contracts ic'
      'where blank_id = :blankid'
      'and type_id = 3')
    Variables.Data = {
      0300000001000000080000003A424C414E4B4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000F00000002000000494401000000000007000000545950455F494401
      000000000008000000424C414E4B5F494401000000000007000000535547475F
      494401000000000009000000504F4C4943595F49440100000000000800000049
      4E535F444154450100000000000A000000424547494E5F444154450100000000
      0008000000454E445F444154450100000000000900000056414C5554455F4944
      01000000000007000000414D4D4F554E540100000000000C000000434C4F5345
      5F505245464958010000000000060000004B4C495F49440100000000000A0000
      004C4F414E4143435F49440100000000000A000000435552524143435F494401
      00000000000A000000504F4C4943595F4E554D010000000000}
    Session = sboapiDataModule.SBSession
    Left = 240
    Top = 216
    object ODSContractsTYPE_ID: TFloatField
      FieldName = 'TYPE_ID'
    end
    object ODSContractsBLANK_ID: TFloatField
      FieldName = 'BLANK_ID'
    end
    object ODSContractsSUGG_ID: TFloatField
      FieldName = 'SUGG_ID'
    end
    object ODSContractsPOLICY_ID: TFloatField
      FieldName = 'POLICY_ID'
    end
    object ODSContractsINS_DATE: TDateTimeField
      FieldName = 'INS_DATE'
    end
    object ODSContractsBEGIN_DATE: TDateTimeField
      FieldName = 'BEGIN_DATE'
    end
    object ODSContractsEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
    object ODSContractsVALUTE_ID: TFloatField
      FieldName = 'VALUTE_ID'
    end
    object ODSContractsAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object ODSContractsCLOSE_PREFIX: TIntegerField
      FieldName = 'CLOSE_PREFIX'
    end
    object ODSContractsKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object ODSContractsLOANACC_ID: TFloatField
      FieldName = 'LOANACC_ID'
    end
    object ODSContractsCURRACC_ID: TFloatField
      FieldName = 'CURRACC_ID'
    end
    object ODSContractsPOLICY_NUM: TStringField
      FieldName = 'POLICY_NUM'
      Size = 128
    end
    object ODSContractsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
  end
  object DSContracts: TDataSource
    DataSet = ODSContracts
    Left = 240
    Top = 181
  end
  object AValute: TOracleDataSet
    SQL.Strings = (
      'select valute, val_name, valu_name, valu_short from avalute')
    QBEDefinition.QBEFieldDefs = {
      04000000040000000600000056414C5554450100000000000800000056414C5F
      4E414D450100000000000900000056414C555F4E414D450100000000000A0000
      0056414C555F53484F5254010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 240
    Top = 144
    object AValuteVALU_NAME: TStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
    object AValuteVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object AValuteVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object AValuteVALU_SHORT: TStringField
      FieldName = 'VALU_SHORT'
      Size = 10
    end
  end
  object AValuteData: TDataSource
    DataSet = AValute
    Left = 208
    Top = 144
  end
  object PolicyContainer: TPlgModalContainer
    Left = 64
    Top = 224
  end
  object SuggestExporter: TINSWordExporter
    Left = 96
    Top = 224
  end
  object Customers: TOracleDataSet
    SQL.Strings = (
      
        'select c.rowid,c.id,c.name||'#39' '#39'||c.surname||'#39' '#39'||c.fathername as' +
        ' name,c.address,c.mobilephone,c.fax from ins_customers c')
    QBEDefinition.QBEFieldDefs = {
      0400000005000000020000004944010000000000040000004E414D4501000000
      00000B0000004D4F42494C4550484F4E45010000000000070000004144445245
      535301000000000003000000464158010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 208
    Top = 56
    object CustomersID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object CustomersNAME: TStringField
      FieldName = 'NAME'
      Size = 386
    end
    object CustomersADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 1024
    end
    object CustomersMOBILEPHONE: TStringField
      FieldName = 'MOBILEPHONE'
      Size = 32
    end
    object CustomersFAX: TStringField
      FieldName = 'FAX'
      Size = 32
    end
  end
  object CustomersData: TDataSource
    DataSet = Customers
    Left = 176
    Top = 56
  end
  object RisksData: TDataSource
    DataSet = Risks
    Left = 136
    Top = 141
  end
  object Risks: TOracleDataSet
    SQL.Strings = (
      'select idr.rowid, idr.* from ins_dict_risks idr')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 136
    Top = 109
    object RisksID: TFloatField
      FieldName = 'ID'
    end
    object RisksNAME: TStringField
      FieldName = 'NAME'
      Size = 1024
    end
  end
  object ODSBeneficiary: TOracleDataSet
    SQL.Strings = (
      'select ib.rowid,ib.* from ins_beneficiary ib')
    QBEDefinition.QBEFieldDefs = {
      0400000005000000020000004944010000000000040000004E414D4501000000
      000007000000414444524553530100000000000500000050484F4E4501000000
      00000F00000042414E4B494E475F44455441494C53010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 244
    Top = 56
    object ODSBeneficiaryID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSBeneficiaryNAME: TStringField
      FieldName = 'NAME'
      Size = 128
    end
    object ODSBeneficiaryADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 128
    end
    object ODSBeneficiaryPHONE: TStringField
      FieldName = 'PHONE'
      Size = 64
    end
    object ODSBeneficiaryBANKING_DETAILS: TStringField
      FieldName = 'BANKING_DETAILS'
      Size = 128
    end
  end
  object BeneficiarySource: TDataSource
    DataSet = ODSBeneficiary
    Left = 276
    Top = 56
  end
  object Franshiz: TOracleDataSet
    SQL.Strings = (
      'select idr.rowid, idr.* from ins_dict_franshiz idr')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 96
    Top = 149
    object FranshizID: TFloatField
      FieldName = 'ID'
    end
    object FranshizNAME: TStringField
      FieldName = 'NAME'
      Size = 1024
    end
  end
  object FranshizData: TDataSource
    DataSet = Franshiz
    Left = 96
    Top = 181
  end
end
