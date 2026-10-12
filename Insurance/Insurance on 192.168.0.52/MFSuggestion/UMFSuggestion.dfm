object MFSuggestion: TMFSuggestion
  Left = 268
  Top = 112
  Width = 410
  Height = 523
  Caption = 'Teklifname'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 402
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 1
      Width = 60
      Height = 13
      Caption = 'Сыьорта нювц'
    end
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 41
      Height = 13
      Caption = 'Сыьортачы'
    end
    object Edit1: TEdit
      Left = 120
      Top = 0
      Width = 280
      Height = 21
      Color = clScrollBar
      ReadOnly = True
      TabOrder = 0
      Text = 'Автоняглиййат васитясинин там сыьортасы'
    end
    object DBEdit1: TDBEdit
      Left = 120
      Top = 24
      Width = 280
      Height = 21
      Color = clInactiveBorder
      DataField = 'BANK'
      DataSource = BankInfoData
      ReadOnly = True
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 45
    Width = 402
    Height = 68
    Align = alTop
    Caption = 'Мцштяри щаггында мялумат'
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 68
      Height = 13
      Caption = 'Сыьорта етдирян'
    end
    object Label4: TLabel
      Left = 8
      Top = 40
      Width = 32
      Height = 13
      Caption = 'Цнван'
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 120
      Top = 16
      Width = 280
      Height = 21
      DataField = 'KLI_ID'
      DataSource = Ins_MotorFullData
      Enabled = False
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = CustomersData
      ReadOnly = True
      TabOrder = 0
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 120
      Top = 40
      Width = 280
      Height = 21
      DataField = 'KLI_ID'
      DataSource = Ins_MotorFullData
      Enabled = False
      KeyField = 'ID'
      ListField = 'ADDRESS'
      ListSource = CustomersData
      ReadOnly = True
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 113
    Width = 402
    Height = 383
    Align = alClient
    Caption = 'Тяклифнамя'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 96
      Height = 13
      Caption = 'Риск йерляшян цнван'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 68
      Width = 82
      Height = 13
      Caption = 'Сыьорта рискляри'
    end
    object Label8: TLabel
      Left = 8
      Top = 310
      Width = 72
      Height = 13
      Caption = 'Сыьорта мябляьи'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 8
      Top = 148
      Width = 48
      Height = 13
      Caption = 'Франшиза'
    end
    object Label10: TLabel
      Left = 8
      Top = 216
      Width = 62
      Height = 13
      Caption = 'Сыьорта щаггы'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 8
      Top = 240
      Width = 38
      Height = 13
      Caption = 'Шяртляр'
    end
    object Label12: TLabel
      Left = 8
      Top = 334
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
    object Label6: TLabel
      Left = 8
      Top = 40
      Width = 101
      Height = 13
      Caption = 'Мцгавилянин валйутасы'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit6: TDBEdit
      Left = 120
      Top = 307
      Width = 113
      Height = 21
      DataField = 'INSURANCESUM'
      DataSource = SuggestionData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnChange = DBEdit4Change
      OnKeyPress = DBEdit4KeyPress
    end
    object DBEdit7: TDBEdit
      Left = 120
      Top = 216
      Width = 193
      Height = 21
      DataField = 'AMMOUNT'
      DataSource = DSContracts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnChange = DBEdit4Change
      OnKeyPress = DBEdit4KeyPress
    end
    object Panel1: TPanel
      Left = 2
      Top = 353
      Width = 398
      Height = 28
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 12
      object BitBtn1: TBitBtn
        Left = 232
        Top = 3
        Width = 75
        Height = 24
        Anchors = [akTop, akRight]
        Caption = 'OK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = BitBtn1Click
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
        Left = 307
        Top = 3
        Width = 75
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
        TabOrder = 1
        OnClick = BitBtn2Click
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
      object btApply: TBitBtn
        Left = 158
        Top = 3
        Width = 75
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
      object btPrint: TBitBtn
        Left = 83
        Top = 3
        Width = 75
        Height = 24
        Caption = 'Чап'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = btPrintClick
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
      object btPolicy: TBitBtn
        Left = 8
        Top = 3
        Width = 75
        Height = 24
        Caption = 'Полис'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = btPolicyClick
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
    end
    object lbBookmarks: TListBox
      Left = 240
      Top = 320
      Width = 145
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemHeight = 13
      Items.Strings = (
        'Insured'
        'IAddress'
        'RAddress'
        'IPeriod'
        'IObject'
        'IValue'
        'IFrans'
        'ISum')
      ParentFont = False
      TabOrder = 13
      Visible = False
    end
    object DBLookupComboBoxCondition: TDBLookupComboBox
      Left = 120
      Top = 237
      Width = 280
      Height = 21
      DataField = 'CNDT_ID'
      DataSource = SuggestionData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = ConditionsData
      ParentFont = False
      TabOrder = 7
      OnClick = DBLookupComboBoxConditionClick
      OnKeyPress = DBEdit4KeyPress
    end
    object cbRisks: TCheckBox
      Left = 8
      Top = 120
      Width = 79
      Height = 17
      Caption = 'Йадда сахла'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
    end
    object btRisksAdd: TBitBtn
      Left = 8
      Top = 96
      Width = 65
      Height = 20
      Caption = 'Диэяр'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = btRisksAddClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FF3333333333333447333333333333377FFF33333333333744473333333
        333337773FF3333333333444447333333333373F773FF3333333334444447333
        33333373F3773FF3333333744444447333333337F333773FF333333444444444
        733333373F3333773FF333334444444444733FFF7FFFFFFF77FF999999999999
        999977777777777733773333CCCCCCCCCC3333337333333F7733333CCCCCCCCC
        33333337F3333F773333333CCCCCCC3333333337333F7733333333CCCCCC3333
        333333733F77333333333CCCCC333333333337FF7733333333333CCC33333333
        33333777333333333333CC333333333333337733333333333333}
      Layout = blGlyphRight
      NumGlyphs = 2
    end
    object cbFranshiz: TCheckBox
      Left = 8
      Top = 173
      Width = 79
      Height = 17
      Caption = 'Йадда сахла'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
    end
    object cbConditions: TCheckBox
      Left = 7
      Top = 265
      Width = 79
      Height = 17
      Caption = 'Йадда сахла'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
    end
    object DBLookupComboBoxFranshiz: TDBLookupComboBox
      Left = 120
      Top = 146
      Width = 280
      Height = 21
      DataField = 'FRZ_ID'
      DataSource = SuggestionData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = FranshizData
      ParentFont = False
      TabOrder = 4
      OnClick = DBLookupComboBoxFranshizClick
      OnKeyPress = DBEdit4KeyPress
    end
    object DBLookupComboBoxRisk: TDBLookupComboBox
      Left = 120
      Top = 64
      Width = 280
      Height = 21
      DataField = 'RSK_ID'
      DataSource = SuggestionData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = RisksData
      ParentFont = False
      TabOrder = 2
      OnClick = DBLookupComboBoxRiskClick
      OnKeyPress = DBEdit4KeyPress
    end
    object DTPContractDate: TDateTimePicker
      Left = 120
      Top = 328
      Width = 113
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
      TabOrder = 10
      OnClick = DBEdit4Change
      OnChange = DTPContractDateChange
      OnKeyPress = DBEdit4KeyPress
    end
    object memRisk: TMemo
      Left = 120
      Top = 88
      Width = 280
      Height = 57
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 3
      OnChange = memConditionsChange
      OnKeyPress = DBEdit4KeyPress
    end
    object memFrashize: TMemo
      Left = 120
      Top = 170
      Width = 280
      Height = 45
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 5
      OnChange = memConditionsChange
      OnKeyPress = DBEdit4KeyPress
    end
    object memConditions: TMemo
      Left = 120
      Top = 260
      Width = 280
      Height = 45
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 8
      OnChange = memConditionsChange
      OnKeyPress = DBEdit4KeyPress
    end
    object DBEdit4: TDBEdit
      Left = 120
      Top = 14
      Width = 280
      Height = 21
      DataField = 'RISKADDRESS'
      DataSource = SuggestionData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = DBEdit4Change
      OnKeyPress = DBEdit4KeyPress
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 120
      Top = 38
      Width = 209
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
      TabOrder = 1
      OnClick = DBEdit4Change
      OnKeyPress = DBEdit4KeyPress
    end
  end
  object Suggestion: TOracleDataSet
    SQL.Strings = (
      'select s.rowid,s.* from ins_mf_suggestion s'
      'where mk_id = :mk_id')
    Variables.Data = {
      0300000001000000060000003A4D4B5F49440400000008000000000000000064
      A34000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A000000020000004944010000000000050000004D4B5F4944010000
      0000000B0000005249534B4144445245535301000000000010000000494E5355
      52414E4345414D4D4F554E5401000000000007000000454E4444415445010000
      0000000600000052534B5F49440100000000000600000046525A5F4944010000
      00000007000000434E44545F49440100000000000600000056414C5F49440100
      000000000C000000494E535552414E434553554D010000000000}
    Master = Ins_MotorFull
    MasterFields = 'ID'
    DetailFields = 'MK_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    OnNewRecord = SuggestionNewRecord
    Left = 160
    Top = 248
    object SuggestionID: TFloatField
      FieldName = 'ID'
    end
    object SuggestionMK_ID: TFloatField
      FieldName = 'MK_ID'
      Required = True
    end
    object SuggestionRISKADDRESS: TStringField
      FieldName = 'RISKADDRESS'
      Size = 1024
    end
    object SuggestionINSURANCEAMMOUNT: TFloatField
      FieldName = 'INSURANCEAMMOUNT'
    end
    object SuggestionENDDATE: TDateTimeField
      FieldName = 'ENDDATE'
    end
    object SuggestionRSK_ID: TFloatField
      FieldName = 'RSK_ID'
      Required = True
    end
    object SuggestionFRZ_ID: TFloatField
      FieldName = 'FRZ_ID'
      Required = True
    end
    object SuggestionCNDT_ID: TFloatField
      FieldName = 'CNDT_ID'
      Required = True
    end
    object SuggestionVAL_ID: TFloatField
      FieldName = 'VAL_ID'
    end
    object SuggestionINSURANCESUM: TFloatField
      FieldName = 'INSURANCESUM'
    end
  end
  object SuggestionData: TDataSource
    DataSet = Suggestion
    Left = 128
    Top = 248
  end
  object BankInfo: TOracleDataSet
    SQL.Strings = (
      'select *from BankInfo')
    QBEDefinition.QBEFieldDefs = {
      040000002A000000050000004B4F445F420100000000000400000042414E4B01
      000000000007000000415A5F4E414D45010000000000040000004B524E4F0100
      0000000003000000494E4E010000000000050000005345484552010000000000
      0600000041445245535301000000000004000000534544520100000000000700
      0000425548414C54520100000000000300000054454C01000000000003000000
      4641580100000000000500000053574946540100000000000500000054454C45
      5801000000000005000000454D41494C01000000000007000000504F53545F49
      4E010000000000070000004B4F445F46494C0100000000000600000046494C49
      414C0100000000000900000041445245535F46494C0100000000000700000054
      454C5F46494C010000000000070000004641585F46494C010000000000090000
      0053574946545F46494C0100000000000900000054454C45585F46494C010000
      0000000A000000504F5354494E5F46494C010000000000090000005345484552
      5F46494C01000000000007000000494E4E5F46494C010000000000080000004B
      524E4F5F46494C010000000000070000005345445246494C0100000000000900
      0000425548414C5F46494C010000000000080000004B4F445F4246494C010000
      000000020000004E420100000000000700000056414C5F4D4F56010000000000
      040000004C4F474F000000000000040000004C494E4B01000000000003000000
      5344560100000000000300000053564D01000000000002000000424601000000
      00000C0000004D414E414745525449544C450100000000000F0000004143434F
      554E54414E545449544C450100000000000E00000053564D5F43555252454E43
      594944010000000000070000004341504954414C010000000000090000004153
      53495354414E540100000000000E000000415353495354414E545449544C4501
      0000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 232
    Top = 248
  end
  object BankInfoData: TDataSource
    DataSet = BankInfo
    Left = 200
    Top = 248
  end
  object Suggest_Rep: TOracleDataSet
    SQL.Strings = (
      'select s.rowid,s.* from ins_mf_suggestion s'
      'where mk_id = :mk_id')
    Variables.Data = {
      0300000001000000060000003A4D4B5F49440400000008000000000000000040
      9B4000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A000000020000004944010000000000050000004D4B5F4944010000
      0000000B0000005249534B4144445245535301000000000010000000494E5355
      52414E4345414D4D4F554E5401000000000007000000454E4444415445010000
      0000000600000052534B5F49440100000000000600000046525A5F4944010000
      00000007000000434E44545F49440100000000000600000056414C5F49440100
      000000000C000000494E535552414E434553554D010000000000}
    MasterFields = 'ID'
    DetailFields = 'MK_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 240
    Top = 208
    object Suggest_RepID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object Suggest_RepMK_ID: TFloatField
      FieldName = 'MK_ID'
      Required = True
    end
    object Suggest_RepRISKADDRESS: TStringField
      FieldName = 'RISKADDRESS'
      Size = 1024
    end
    object Suggest_RepINSURANCEAMMOUNT: TFloatField
      FieldName = 'INSURANCEAMMOUNT'
    end
    object Suggest_RepENDDATE: TDateTimeField
      FieldName = 'ENDDATE'
    end
    object Suggest_RepINSURANCESUM: TFloatField
      FieldName = 'INSURANCESUM'
    end
  end
  object Suggest_RepData: TDataSource
    DataSet = Suggest_Rep
    Left = 208
    Top = 208
  end
  object Ins_MotorFull: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select im.rowid,im.* from ins_motorfull im ORDER BY  :title'
      '')
    Variables.Data = {
      0300000001000000060000003A5449544C4501000000070000006B6C695F6964
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000018000000020000004944010000000000060000004B4C495F49440100
      000000000E000000434F4E544143545F504552534F4E0100000000000F000000
      42414E4B494E475F44455441494C530100000000000C000000494E5355524544
      4D4F44454C0100000000000B000000494E535552454454595045010000000000
      0F000000494E535552454453544154454E554D0100000000000C000000494E53
      55524544434F4C4F5201000000000011000000494E53555245444F5554505554
      594541520100000000000F000000494E53555245444E554D5345415453010000
      00000010000000494E5355524544454E47494E454E554D010000000000110000
      00494E5355524544434841535349534E554D01000000000012000000494E5355
      52454441435455414C56414C5545010000000000110000005452414E534D4953
      53494F4E5F545950450100000000000E00000050524553454E43455F414C4152
      4D0100000000000B0000004D4F544F525F555341474501000000000011000000
      4D4F544F5253544F52414745504C4143450100000000000E0000004558495354
      494E4744414D4147450100000000001A000000494E535552414E434547454F47
      524150484943414C4C494D49540100000000000600000042524F4B4552010000
      0000000B000000494E5355524544424F44590100000000000600000054595045
      49440100000000000800000050524F46495449440100000000000C000000434C
      4F53455F505245464958010000000000}
    CountAllRecords = True
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 160
    Top = 208
    object Ins_MotorFullID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object Ins_MotorFullKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
    object Ins_MotorFullBANKING_DETAILS: TStringField
      FieldName = 'BANKING_DETAILS'
      Size = 32
    end
    object Ins_MotorFullINSUREDMODEL: TStringField
      FieldName = 'INSUREDMODEL'
      Required = True
      Size = 32
    end
    object Ins_MotorFullINSUREDTYPE: TStringField
      FieldName = 'INSUREDTYPE'
      Size = 128
    end
    object Ins_MotorFullINSUREDSTATENUM: TStringField
      FieldName = 'INSUREDSTATENUM'
      Size = 32
    end
    object Ins_MotorFullINSUREDCOLOR: TStringField
      FieldName = 'INSUREDCOLOR'
      Size = 32
    end
    object Ins_MotorFullINSUREDOUTPUTYEAR: TIntegerField
      FieldName = 'INSUREDOUTPUTYEAR'
    end
    object Ins_MotorFullINSUREDNUMSEATS: TIntegerField
      FieldName = 'INSUREDNUMSEATS'
    end
    object Ins_MotorFullINSUREDENGINENUM: TStringField
      FieldName = 'INSUREDENGINENUM'
      Size = 32
    end
    object Ins_MotorFullINSUREDCHASSISNUM: TStringField
      FieldName = 'INSUREDCHASSISNUM'
      Size = 32
    end
    object Ins_MotorFullINSUREDACTUALVALUE: TFloatField
      FieldName = 'INSUREDACTUALVALUE'
    end
    object Ins_MotorFullTRANSMISSION_TYPE: TStringField
      FieldName = 'TRANSMISSION_TYPE'
      Size = 128
    end
    object Ins_MotorFullPRESENCE_ALARM: TStringField
      FieldName = 'PRESENCE_ALARM'
      Size = 32
    end
    object Ins_MotorFullMOTOR_USAGE: TStringField
      FieldName = 'MOTOR_USAGE'
      Size = 128
    end
    object Ins_MotorFullMOTORSTORAGEPLACE: TStringField
      FieldName = 'MOTORSTORAGEPLACE'
      Size = 128
    end
    object Ins_MotorFullEXISTINGDAMAGE: TStringField
      FieldName = 'EXISTINGDAMAGE'
      Size = 128
    end
    object Ins_MotorFullBROKER: TFloatField
      FieldName = 'BROKER'
    end
    object Ins_MotorFullINSURANCEGEOGRAPHICALLIMIT: TStringField
      FieldName = 'INSURANCEGEOGRAPHICALLIMIT'
      Size = 128
    end
    object Ins_MotorFullINSUREDBODY: TStringField
      FieldName = 'INSUREDBODY'
      Size = 32
    end
  end
  object Ins_MotorFullData: TDataSource
    DataSet = Ins_MotorFull
    Left = 128
    Top = 208
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
    Left = 240
    Top = 288
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
    Left = 200
    Top = 288
  end
  object RisksData: TDataSource
    DataSet = Risks
    Left = 128
    Top = 285
  end
  object Risks: TOracleDataSet
    SQL.Strings = (
      'select idr.rowid, idr.* from ins_dict_risks idr')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 160
    Top = 285
    object RisksID: TFloatField
      FieldName = 'ID'
    end
    object RisksNAME: TStringField
      FieldName = 'NAME'
      Size = 1024
    end
  end
  object Conditions: TOracleDataSet
    SQL.Strings = (
      'select idr.rowid, idr.* from ins_dict_conditions idr')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 176
    Top = 317
    object ConditionsID: TFloatField
      FieldName = 'ID'
    end
    object ConditionsNAME: TStringField
      FieldName = 'NAME'
      Size = 1024
    end
  end
  object ConditionsData: TDataSource
    DataSet = Conditions
    Left = 176
    Top = 349
  end
  object Franshiz: TOracleDataSet
    SQL.Strings = (
      'select idr.rowid, idr.* from ins_dict_franshiz idr')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 317
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
    Left = 208
    Top = 349
  end
  object Risktypes: TOracleDataSet
    SQL.Strings = (
      'select * from ins_dict_risk_types')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 240
    Top = 317
    object RisktypesID: TFloatField
      FieldName = 'ID'
    end
    object RisktypesNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object RisktypesData: TDataSource
    DataSet = Risktypes
    Left = 240
    Top = 349
  end
  object PINS_FULLMOTOR: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'PINS_FULLMOTOR'
    ParameterMode = pmNamed
    Left = 136
    Top = 320
  end
  object SugWordExporter: TINSWordExporter
    Left = 336
    Top = 389
  end
  object Ins_RepData: TDataSource
    DataSet = Ins_Rep
    Left = 280
    Top = 304
  end
  object Ins_Rep: TOracleDataSet
    SQL.Strings = (
      
        'select id, PINS_FullMotor.returnName(kli_id) as name,Pins_FullMo' +
        'tor.returnAddress(kli_id) as Address,Pins_FullMotor.returnPhone(' +
        'kli_id) as phone,pins_fullmotor.returnFax(kli_id) as fax,contact' +
        '_person, banking_details,'
      '       profitid,insuredmodel,insuredtype,'
      '       insuredstatenum, insuredcolor,insuredoutputyear,'
      '      insurednumseats,insuredenginenum,insuredchassisnum,'
      '      insuredactualvalue,transmission_type,presence_alarm,'
      
        '      motor_usage,motorstorageplace,existingdamage,insurancegeog' +
        'raphicallimit'
      ' from ins_motorfull'
      '')
    QBEDefinition.QBEFieldDefs = {
      0400000017000000020000004944010000000000040000004E414D4501000000
      00000E000000434F4E544143545F504552534F4E0100000000000F0000004241
      4E4B494E475F44455441494C530100000000000C000000494E53555245444D4F
      44454C0100000000000B000000494E5355524544545950450100000000000F00
      0000494E535552454453544154454E554D0100000000000C000000494E535552
      4544434F4C4F5201000000000011000000494E53555245444F55545055545945
      41520100000000000F000000494E53555245444E554D53454154530100000000
      0010000000494E5355524544454E47494E454E554D0100000000001100000049
      4E5355524544434841535349534E554D01000000000012000000494E53555245
      4441435455414C56414C5545010000000000110000005452414E534D49535349
      4F4E5F545950450100000000000E00000050524553454E43455F414C41524D01
      00000000000B0000004D4F544F525F5553414745010000000000110000004D4F
      544F5253544F52414745504C4143450100000000000E0000004558495354494E
      4744414D4147450100000000001A000000494E535552414E434547454F475241
      50484943414C4C494D49540100000000000500000050484F4E45010000000000
      0300000046415801000000000007000000414444524553530100000000000800
      000050524F4649544944010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 312
    Top = 304
    object Ins_RepNAME: TStringField
      FieldName = 'NAME'
      Size = 4000
    end
    object Ins_RepADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 4000
    end
    object Ins_RepID: TFloatField
      FieldName = 'ID'
      Required = True
    end
  end
  object PlgPolicy: TPlgModalContainer
    Left = 298
    Top = 401
  end
  object Policy: TOracleDataSet
    SQL.Strings = (
      'select  imp.rowid, imp.* from ins_mf_policy imp'
      'where imp.ms_id= :ms_id')
    Variables.Data = {
      0300000001000000060000003A4D535F494404000000080000000000000000D8
      9B4000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000050000004D535F4944010000
      00000009000000504F4C4943594E554D0100000000000C0000005355424A4543
      5456414C5545010000000000}
    MasterFields = 'ID'
    DetailFields = 'MS_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 288
    Top = 208
    object PolicyID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object PolicyMS_ID: TFloatField
      FieldName = 'MS_ID'
      Required = True
    end
    object PolicyPOLICYNUM: TStringField
      FieldName = 'POLICYNUM'
    end
    object PolicySUBJECTVALUE: TFloatField
      FieldName = 'SUBJECTVALUE'
    end
  end
  object PolicyData: TDataSource
    DataSet = Policy
    Left = 320
    Top = 208
  end
  object ODSContracts: TOracleDataSet
    SQL.Strings = (
      'select ic.rowid, ic.* from ins_contracts ic'
      'where blank_id = :blankid'
      'and type_id = 4')
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
    Left = 128
    Top = 352
    object ODSContractsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
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
      Required = True
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
  end
  object DSContracts: TDataSource
    DataSet = ODSContracts
    Left = 128
    Top = 381
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
    Left = 360
    Top = 152
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
    Left = 328
    Top = 152
  end
end
