object FormSuggestion: TFormSuggestion
  Left = 338
  Top = 124
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Teklifname'
  ClientHeight = 487
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 393
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
      Left = 112
      Top = 0
      Width = 280
      Height = 21
      Color = clScrollBar
      Enabled = False
      TabOrder = 0
      Text = 'Автоняглиййат васитясинин там сыьортасы'
    end
    object DBEdit1: TDBEdit
      Left = 112
      Top = 24
      Width = 280
      Height = 21
      Color = clInactiveBorder
      DataField = 'BANK'
      DataSource = DataModuleFullMotor.BankInfoData
      Enabled = False
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 45
    Width = 393
    Height = 72
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
      Left = 112
      Top = 16
      Width = 280
      Height = 21
      DataField = 'KLI_ID'
      DataSource = DataModuleFullMotor.Ins_MotorFullData
      Enabled = False
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DataModuleFullMotor.CustomersData
      TabOrder = 0
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 112
      Top = 40
      Width = 280
      Height = 21
      DataField = 'KLI_ID'
      DataSource = DataModuleFullMotor.Ins_MotorFullData
      Enabled = False
      KeyField = 'ID'
      ListField = 'ADDRESS'
      ListSource = DataModuleFullMotor.CustomersData
      TabOrder = 1
    end
    object lbBookmarks: TListBox
      Left = 248
      Top = -25
      Width = 145
      Height = 129
      ItemHeight = 13
      Items.Strings = (
        'Insured'
        'IAddress'
        'RAddress'
        'IPeriod'
        'IValue'
        'ISum'
        'ETime')
      TabOrder = 2
      Visible = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 109
    Width = 415
    Height = 380
    Caption = 'Тяклифнамя'
    TabOrder = 2
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 96
      Height = 13
      Caption = 'Риск йерляшян цнван'
    end
    object Label7: TLabel
      Left = 8
      Top = 64
      Width = 82
      Height = 13
      Caption = 'Сыьорта рискляри'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 8
      Top = 305
      Width = 72
      Height = 13
      Caption = 'Сыьорта мябляьи'
    end
    object Label9: TLabel
      Left = 8
      Top = 145
      Width = 48
      Height = 13
      Caption = 'Франшиза'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 8
      Top = 214
      Width = 62
      Height = 13
      Caption = 'Сыьорта щаггы'
    end
    object Label11: TLabel
      Left = 8
      Top = 238
      Width = 38
      Height = 13
      Caption = 'Шяртляр'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 8
      Top = 328
      Width = 81
      Height = 13
      Caption = 'Мцгавилянин тарихи'
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
    object DBEdit4: TDBEdit
      Left = 112
      Top = 16
      Width = 280
      Height = 21
      DataField = 'RISKADDRESS'
      DataSource = DataModuleFullMotor.SuggestionData
      TabOrder = 0
      OnChange = DBEdit4Change
      OnKeyPress = DBEdit4KeyPress
    end
    object DBEdit6: TDBEdit
      Left = 112
      Top = 300
      Width = 193
      Height = 21
      DataField = 'INSURANCESUM'
      DataSource = DataModuleFullMotor.SuggestionData
      TabOrder = 9
      OnChange = DBEdit4Change
      OnKeyPress = DBEdit4KeyPress
    end
    object DBEdit7: TDBEdit
      Left = 112
      Top = 212
      Width = 193
      Height = 21
      DataField = 'AMMOUNT'
      DataSource = DataModuleFullMotor.DSContracts
      TabOrder = 6
      OnChange = DBEdit4Change
      OnKeyPress = DBEdit4KeyPress
    end
    object Panel1: TPanel
      Left = 2
      Top = 349
      Width = 411
      Height = 29
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 11
      object BitBtn1: TBitBtn
        Left = 199
        Top = 4
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
        OnKeyPress = DBEdit4KeyPress
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
        Left = 275
        Top = 4
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
        OnKeyPress = DBEdit4KeyPress
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
      object btPrint: TBitBtn
        Left = 48
        Top = 4
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
        TabOrder = 2
        OnClick = btPrintClick
        OnKeyPress = DBEdit4KeyPress
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
        Left = 124
        Top = 4
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
        TabOrder = 3
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
    end
    object DBLookupComboBoxRisk: TDBLookupComboBox
      Left = 112
      Top = 64
      Width = 280
      Height = 21
      DataField = 'RSK_ID'
      DataSource = DataModuleFullMotor.SuggestionData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DataModuleFullMotor.RisksData
      ParentFont = False
      TabOrder = 2
      OnClick = DBLookupComboBoxRiskClick
      OnKeyPress = DBEdit4KeyPress
    end
    object memRisk: TMemo
      Left = 112
      Top = 88
      Width = 280
      Height = 49
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
      TabOrder = 12
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
      TabOrder = 13
    end
    object DBLookupComboBoxFranshiz: TDBLookupComboBox
      Left = 112
      Top = 141
      Width = 280
      Height = 21
      DataField = 'FRZ_ID'
      DataSource = DataModuleFullMotor.SuggestionData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DataModuleFullMotor.FranshizData
      ParentFont = False
      TabOrder = 4
      OnClick = DBLookupComboBoxFranshizClick
      OnKeyPress = DBEdit4KeyPress
    end
    object memFrashize: TMemo
      Left = 112
      Top = 162
      Width = 280
      Height = 49
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
      TabOrder = 14
    end
    object DBLookupComboBoxCondition: TDBLookupComboBox
      Left = 112
      Top = 233
      Width = 280
      Height = 21
      DataField = 'CNDT_ID'
      DataSource = DataModuleFullMotor.SuggestionData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DataModuleFullMotor.ConditionsData
      ParentFont = False
      TabOrder = 7
      OnClick = DBLookupComboBoxConditionClick
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
      TabOrder = 15
    end
    object memConditions: TMemo
      Left = 112
      Top = 254
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
    object DTPContractDate: TDateTimePicker
      Left = 112
      Top = 324
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
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 112
      Top = 38
      Width = 209
      Height = 21
      DataField = 'VALUTE_ID'
      DataSource = DataModuleFullMotor.DSContracts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      KeyField = 'VALUTE'
      ListField = 'VALU_NAME'
      ListSource = DataModuleFullMotor.AValuteData
      ParentFont = False
      TabOrder = 1
      OnKeyPress = DBEdit4KeyPress
    end
  end
  object INSWordExporter1: TINSWordExporter
    Left = 312
    Top = 421
  end
end
