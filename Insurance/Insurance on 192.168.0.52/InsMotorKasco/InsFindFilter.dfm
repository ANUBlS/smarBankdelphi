object fmFind: TfmFind
  Left = 394
  Top = 172
  BorderStyle = bsToolWindow
  Caption = 'fmFind'
  ClientHeight = 409
  ClientWidth = 609
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 362
    Width = 609
    Height = 47
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label25: TLabel
      Left = 2
      Top = 2
      Width = 270
      Height = 13
      Caption = #39'*'#39' ишаряси иля формат вермек олар (мяс: Азярбай*)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object BitBtn1: TBitBtn
      Left = 448
      Top = 17
      Width = 73
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 526
      Top = 17
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
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
    object BitBtn3: TBitBtn
      Left = 368
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Ахтар'
      TabOrder = 2
      OnClick = BitBtn3Click
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFF000000F000000000FFFFFFFF000000F0FF
        FFFFF0FFFFF00F000000F0F77777F0FFFF000F000000F0F77777F0FFF000FF00
        0000F0F77780008F000FFF000000F0F7700FFF0000FFFF000000F0F708FFFF08
        0FFFFF000000F0F80E000F0F08FFFF000000F0F0EFEFEF0FF0FFFF000000F0F0
        F0000F0FF0FFFF000000F000EFEFFF0FF0FFFF000000FFF80000000F08FFFF00
        0000FFFF00FFFFF80FFFFF000000FFFFF00FFF00FFFFFF000000FFFFFF80008F
        FFFFFF000000FFFFFFFFFFFFFFFFFF000000}
    end
    object BitBtn4: TBitBtn
      Left = 288
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Филтер'
      TabOrder = 3
      OnClick = BitBtn4Click
      Glyph.Data = {
        46040000424D4604000000000000360000002800000011000000140000000100
        18000000000010040000C40E0000C40E00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C06363639C9C9CC0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0525252FF8400636363C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0525252E7A55A313100
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C09C9C9CFFE7CEE7A55ADE944AFF8400C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C09C9C9CFFE7CEFF
        D6A5FFD6A5E7A55ADE944A9C9C9CC0C0C0C0C0C0C0C0C0C0C0C0C0C0C000C0C0
        C0C0C0C0C0C0C0C0C0C09C9C9C9C9C9CFFE7CEFFE7CEFFD6A5E7A55AEFBD84FF
        84009C9C9CC0C0C0C0C0C0C0C0C0C0C0C000C0C0C0C0C0C0C0C0C09C9C9CDE94
        4AFFF7EFFFE7CEFFD6A5E7A55AEFBD84EFBD84DE944A5252529C9C9CC0C0C0C0
        C0C0C0C0C000C0C0C0C0C0C09C9C9CDE944AFFF7EFE7A55AFF8400636363FF84
        00FF8400525252FF8400FF8400FF84009C9C9CC0C0C0C0C0C000C0C0C09C9C9C
        FF8400FF8400636363EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFC6A5A5FF8400FF84
        00FF8400FF84009C9C9CC0C0C0009C9C9C525252FF8400525252EFEFEFEFEFEF
        EFEFEF9C9C9C9C9C9CEFEFEFC6A5A5636363525252FF8400FF84005252529C9C
        9C009C9C9C525252FF8400FF84009C9C9C9C9C9CEFEFEFEFEFEFEFEFEFEFEFEF
        C6A5A59C9C9C525252FF8400FF84005252529C9C9C009C9C9C5252525252529C
        9C9CEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFC6A5A5CECECE9C9C9C525252
        FF84005252529C9C9C00C0C0C09C9C9CB58484EFEFEFEFEFEFEFEFEF9C9C9C9C
        9C9CEFEFEFC6A5A5E7E7E7DEDEDECECECE5252525252529C9C9CC0C0C000C0C0
        C0C0C0C09C9C9CEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFC6A5A59C9C9CE7E7E7E7
        E7E7E7E7E7C6A5A5636363C0C0C0C0C0C000C0C0C0C6A5A5EFEFEFEFEFEF9C9C
        9C9C9C9CC6A5A5C6A5A5636363CECECEE7E7E7E7E7E79C9C9C9C9C9C525252C0
        C0C0C0C0C000C0C0C0C6A5A5C6A5A5C6A5A5C6A5A5C6A5A5C6A5A5CECECEFFFF
        FFFFFFFFC6A5A5C6A5A59C9C9C9C9C9CC6A5A5C0C0C0C0C0C0009C9C9CC6A5A5
        9C9C9C9C9C9C9C9C9CC6C6C6636363C6A5A5C6A5A5C6A5A5EFEFEFFFFFFFFFFF
        FFFFFFFFFFFFFFC0C0C0C0C0C0009C9C9C5252529C9C9C9C9C9CC6C6C6CECECE
        CECECECECECECECECED6D6D6FFFFFFFFFFFFFFFFFFFFFFFFCECECEC0C0C0C0C0
        C000C0C0C0C0C0C0C0C0C0C6A5A5C6A5A56363639C9C9C6363639C9C9C9C9C9C
        636363C6A5A59C9C9CC0C0C0C0C0C0C0C0C0C0C0C000C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C6A5A5C6A5A5C6A5A5C6A5A5C6A5A5C6A5A5C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C000}
    end
    object ckbFilter: TCheckBox
      Left = 11
      Top = 22
      Width = 198
      Height = 17
      Caption = 'Филтери ишлят'
      TabOrder = 4
    end
    object BitBtn5: TBitBtn
      Left = 207
      Top = 17
      Width = 74
      Height = 25
      Cancel = True
      Caption = 'Йени'
      TabOrder = 5
      OnClick = BitBtn5Click
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770777
        7777770000007077777707777777070000007707777777777770770000007777
        7777777777777700000077777000000000777700000077778FFFFFFFF0777700
        000077778FFFFFFFF0777700000077778FFFFFFFF0777700000077778FFFFFFF
        F0777700000000778FFFFFFFF0770000000077778FFFFFFFF077770000007777
        8FFFFF8880777700000077778FFFFF8F07777700000077778FFFFF8077777700
        0000777788888887777777000000777777777777777777000000770777770777
        777077000000707777770777777707000000}
    end
  end
  object plMain: TPanel
    Left = 0
    Top = 0
    Width = 609
    Height = 362
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object lbDBCBCustName: TLabel
      Left = 8
      Top = 8
      Width = 79
      Height = 13
      Caption = 'Сыьорта етдирянин:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 32
      Width = 68
      Height = 13
      Caption = 'Файдаэютцрян '
    end
    object lbBank: TLabel
      Left = 8
      Top = 56
      Width = 25
      Height = 13
      Caption = 'Bank'
    end
    object gbObject: TGroupBox
      Left = 1
      Top = 80
      Width = 608
      Height = 97
      Caption = 'Сыьорталанан обйект (автомобил) барядя мялумат'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object lbInsType: TLabel
        Left = 208
        Top = 16
        Width = 27
        Height = 13
        Caption = '* Нюв'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbInsModel: TLabel
        Left = 8
        Top = 40
        Width = 37
        Height = 13
        Caption = '* Марка'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbInsBanNum: TLabel
        Left = 208
        Top = 40
        Width = 47
        Height = 13
        Caption = '* Бан Н-си'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbInsColor: TLabel
        Left = 208
        Top = 64
        Width = 33
        Height = 13
        Caption = '* Рянэ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbInsStateNum: TLabel
        Left = 424
        Top = 16
        Width = 70
        Height = 13
        Caption = 'Дювлят нюмряси'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbInsEngineNum: TLabel
        Left = 416
        Top = 40
        Width = 69
        Height = 13
        Caption = '* Мцщяррик Н-си'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbInsOutputYear: TLabel
        Left = 8
        Top = 16
        Width = 54
        Height = 13
        Caption = '* Бурахылыш или'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbUnderframeNum: TLabel
        Left = 416
        Top = 64
        Width = 53
        Height = 13
        Caption = '* Шасси Н-си'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 9
        Top = 64
        Width = 36
        Height = 13
        Caption = '* Модел'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edInsuredType: TEdit
        Left = 288
        Top = 16
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnKeyPress = edInsuredOutputYearKeyPress
      end
      object edInsuredBanNum: TEdit
        Left = 288
        Top = 40
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnKeyPress = edInsuredOutputYearKeyPress
      end
      object edInsuredColor: TEdit
        Left = 288
        Top = 64
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnKeyPress = edInsuredOutputYearKeyPress
      end
      object edInsuredStateNum: TEdit
        Left = 496
        Top = 16
        Width = 105
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnKeyPress = edInsuredOutputYearKeyPress
      end
      object edInsuredEngineNum: TEdit
        Left = 496
        Top = 40
        Width = 105
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnKeyPress = edInsuredOutputYearKeyPress
      end
      object edUnderframeNum: TEdit
        Left = 479
        Top = 64
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnKeyPress = edInsuredOutputYearKeyPress
      end
      object cbInsuredMark: TDBLookupComboBox
        Left = 80
        Top = 40
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = DSMarks
        ParentFont = False
        TabOrder = 0
        OnClick = cbKLI_IDClick
        OnKeyPress = edInsuredOutputYearKeyPress
      end
      object cbInsuredModel: TDBLookupComboBox
        Left = 80
        Top = 64
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = DSModels
        ParentFont = False
        TabOrder = 1
        OnClick = cbKLI_IDClick
        OnKeyPress = edInsuredOutputYearKeyPress
      end
      object edInsuredOutputYear: TEdit
        Left = 80
        Top = 16
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
    end
    object plDrAccessPeople: TGroupBox
      Left = 1
      Top = 179
      Width = 608
      Height = 101
      Caption = 'Сыьорталанмыш автомобили идаря етмяк щцгугуна малик олан шяхсляр'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object Label20: TLabel
        Left = 8
        Top = 24
        Width = 10
        Height = 16
        Caption = '1.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 8
        Top = 48
        Width = 10
        Height = 16
        Caption = '2.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbDriverBirthday1: TLabel
        Left = 322
        Top = 11
        Width = 58
        Height = 13
        Caption = 'Доьум тарихи'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object lbDrExper1: TLabel
        Left = 440
        Top = 9
        Width = 94
        Height = 13
        Caption = 'Сцрцжцлцк тяжрцбяси'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbDrIntend: TLabel
        Left = 8
        Top = 72
        Width = 176
        Height = 13
        Caption = 'Автомобилдян истифадя мягсяди '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edDriveAccessPiople1: TEdit
        Left = 32
        Top = 24
        Width = 281
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = edInsuredOutputYearKeyPress
      end
      object edDriveAccessPiople2: TEdit
        Left = 32
        Top = 48
        Width = 281
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnKeyPress = edInsuredOutputYearKeyPress
      end
      object edDriverBirthday1: TDateTimePicker
        Left = 320
        Top = 24
        Width = 113
        Height = 21
        CalAlignment = dtaLeft
        Date = 0.674506828698213
        Time = 0.674506828698213
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
        TabOrder = 1
        OnClick = cbKLI_IDClick
        OnKeyPress = edInsuredOutputYearKeyPress
      end
      object edDriverBirthday2: TDateTimePicker
        Left = 320
        Top = 48
        Width = 113
        Height = 21
        CalAlignment = dtaLeft
        Date = 0.674542638898856
        Time = 0.674542638898856
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
        TabOrder = 3
        OnClick = cbKLI_IDClick
        OnKeyPress = edInsuredOutputYearKeyPress
      end
      object edDriveIntended: TComboBox
        Left = 184
        Top = 72
        Width = 225
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 4
        OnClick = cbKLI_IDClick
        OnKeyPress = edInsuredOutputYearKeyPress
        Items.Strings = (
          'Такси'
          'Ижтимаи няглиййат'
          'Шяхси')
      end
      object edDriverExperience1: TEdit
        Left = 440
        Top = 24
        Width = 161
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object edDriverExperience2: TEdit
        Left = 440
        Top = 48
        Width = 161
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
    end
    object plInsPeriod: TGroupBox
      Left = 1
      Top = 280
      Width = 608
      Height = 81
      Caption = 'Сыьорта мцддяти:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object lbDriveCost: TLabel
        Left = 8
        Top = 56
        Width = 85
        Height = 13
        Caption = 'Автомобилин дяйяри'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbInsFranshiz: TLabel
        Left = 232
        Top = 56
        Width = 39
        Height = 13
        Caption = 'Франшиза'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbBeginDate: TLabel
        Left = 8
        Top = 16
        Width = 73
        Height = 13
        Caption = 'Башланма тарихи:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbEndDate: TLabel
        Left = 382
        Top = 16
        Width = 53
        Height = 13
        Caption = 'Битмя тарихи:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 232
        Top = 16
        Width = 12
        Height = 13
        Caption = 'Ай'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 40
        Width = 155
        Height = 13
        Caption = 'Мябляьляр Барядя Мялумат:'
      end
      object SpeedButton1: TSpeedButton
        Left = 256
        Top = 16
        Width = 23
        Height = 22
        Flat = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF804F8FFFFFFFFFFFFFFFFFFFFFFF804
          04F8FFFFFFFFFFFFFFFFFFFFFFFF0404F8FFFFFFFFFFFFFFFFFFFFFFFFF804F8
          FFFFFFFFFFFFFFFFFFFFFFFFFF0404FFFFFFFFFFFFFFFFFFFFFFFFFFFF0404FF
          FFFF0404040404FFFFFFFFFFFF0404F8FFFFFFF8040404FFFFFFFFFFFFF80404
          F8FFF804040404FFFFFFFFFFFFFF04040404040404F804FFFFFFFFFFFFFFFFF8
          040404F8FFFF04FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = SpeedButton1Click
      end
      object edBegin_Date: TDateTimePicker
        Left = 104
        Top = 16
        Width = 122
        Height = 21
        CalAlignment = dtaLeft
        Date = 0.671935219899751
        Time = 0.671935219899751
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
        TabOrder = 0
        OnClick = cbKLI_IDClick
        OnKeyPress = edInsuredOutputYearKeyPress
      end
      object edEnd_Date: TDateTimePicker
        Left = 445
        Top = 16
        Width = 122
        Height = 21
        CalAlignment = dtaLeft
        Date = 0.672476666703005
        Time = 0.672476666703005
        Color = clMenu
        DateFormat = dfShort
        DateMode = dmComboBox
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Kind = dtkDate
        ParseInput = False
        ParentFont = False
        TabOrder = 2
        OnClick = cbKLI_IDClick
        OnKeyPress = edInsuredOutputYearKeyPress
      end
      object cbFranshiz_ID: TDBLookupComboBox
        Left = 280
        Top = 56
        Width = 97
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'AMMOUNT'
        ListSource = DSFranshiz
        ParentFont = False
        TabOrder = 3
        OnClick = cbKLI_IDClick
        OnKeyPress = edInsuredOutputYearKeyPress
      end
      object cbMonth_ID: TDBLookupComboBox
        Left = 280
        Top = 16
        Width = 97
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'COUNT'
        ListSource = DSMonths
        ParentFont = False
        TabOrder = 1
        OnClick = cbKLI_IDClick
        OnKeyPress = edInsuredOutputYearKeyPress
      end
      object edDriveCost: TEdit
        Left = 104
        Top = 56
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnKeyPress = edInsuredOutputYearKeyPress
      end
    end
    object cbBEN_ID: TDBLookupComboBox
      Left = 91
      Top = 32
      Width = 462
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DSBeneficiary
      TabOrder = 1
      OnClick = cbKLI_IDClick
      OnKeyPress = edInsuredOutputYearKeyPress
    end
    object cbKLI_ID: TDBLookupComboBox
      Left = 91
      Top = 8
      Width = 462
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DSCusts
      TabOrder = 0
      OnClick = cbKLI_IDClick
      OnKeyPress = edInsuredOutputYearKeyPress
    end
    object cbBANK_ID: TDBLookupComboBox
      Left = 91
      Top = 56
      Width = 462
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DSBanks
      TabOrder = 2
      OnClick = cbKLI_IDClick
      OnKeyPress = edInsuredOutputYearKeyPress
    end
  end
  object ODSCusts: TOracleDataSet
    SQL.Strings = (
      'select * from ('
      'SELECT a.id, a.surname || '#39'  '#39' ||a.name name, a.ADDRESS'
      '  FROM ins_customers a'
      '  order by a.surname'
      ''
      ')')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000040000004E414D4501000000
      00000700000041444452455353010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 528
    Top = 80
    object ODSCustsID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ODSCustsNAME: TStringField
      FieldName = 'NAME'
      Size = 258
    end
    object ODSCustsADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 1024
    end
  end
  object DSCusts: TDataSource
    DataSet = ODSCusts
    Left = 528
    Top = 128
  end
  object pkgMotorKasco: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_PKG_MOTORKASCO'
    Left = 483
    Top = 154
  end
  object pmcSuggestion: TPlgModalContainer
    Left = 563
    Top = 226
  end
  object OPCOMMON: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'INS_COMMON'
    Left = 482
    Top = 186
  end
  object DSBeneficiary: TDataSource
    DataSet = ODSBeneficiary
    Left = 387
    Top = 122
  end
  object ODSBeneficiary: TOracleDataSet
    SQL.Strings = (
      'select ib.* from INS_BENEFICIARY ib')
    QBEDefinition.QBEFieldDefs = {
      0400000005000000020000004944010000000000040000004E414D4501000000
      000007000000414444524553530100000000000500000050484F4E4501000000
      00000F00000042414E4B494E475F44455441494C53010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 387
    Top = 82
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
  object ODSModels: TOracleDataSet
    SQL.Strings = (
      'select * from ins_dict_models'
      ''
      'where mark_id = :mark_id')
    Variables.Data = {
      0300000001000000080000003A4D41524B5F4944040000000800000000000000
      0000354000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000040000004E414D4501000000
      0000070000004D41524B5F49440100000000000B00000043414C434F5054494F
      4E53010000000000}
    Master = ODSMarks
    MasterFields = 'ID'
    DetailFields = 'MARK_ID'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 163
    Top = 122
    object ODSModelsID: TFloatField
      FieldName = 'ID'
    end
    object ODSModelsNAME: TStringField
      FieldName = 'NAME'
      Size = 256
    end
    object ODSModelsMARK_ID: TFloatField
      FieldName = 'MARK_ID'
    end
    object ODSModelsCALCOPTIONS: TIntegerField
      FieldName = 'CALCOPTIONS'
    end
  end
  object ODSMarks: TOracleDataSet
    SQL.Strings = (
      'Select * from ins_dict_marks')
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000040000004E414D4501000000
      00000800000053544154455F49440100000000000B00000043414C434F505449
      4F4E53010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 163
    Top = 82
    object ODSMarksID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSMarksNAME: TStringField
      FieldName = 'NAME'
      Size = 256
    end
    object ODSMarksSTATE_ID: TFloatField
      FieldName = 'STATE_ID'
    end
    object ODSMarksCALCOPTIONS: TIntegerField
      FieldName = 'CALCOPTIONS'
    end
  end
  object DSModels: TDataSource
    DataSet = ODSModels
    Left = 131
    Top = 122
  end
  object DSMarks: TDataSource
    DataSet = ODSMarks
    Left = 131
    Top = 82
  end
  object ODSBanks: TOracleDataSet
    SQL.Strings = (
      'select * from bankm'
      'order by name')
    QBEDefinition.QBEFieldDefs = {
      0400000007000000020000004944010000000000040000004E414D4501000000
      0000040000004B524E4F01000000000003000000494E4E010000000000050000
      0053574946540100000000000800000042414E4B434F44450100000000000700
      00005355424B524E4F010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 419
    Top = 82
    object ODSBanksID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSBanksNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
  end
  object DSBanks: TDataSource
    DataSet = ODSBanks
    Left = 419
    Top = 122
  end
  object ODSFranshiz: TOracleDataSet
    SQL.Strings = (
      'select * from ins_tarif_franshiz'
      ''
      'where month_id = :month_id')
    Variables.Data = {
      0300000001000000090000003A4D4F4E54485F49440400000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000080000004D4F4E54485F4944
      01000000000007000000414D4D4F554E54010000000000}
    Master = ODSMonths
    MasterFields = 'ID'
    DetailFields = 'MONTH_ID'
    Session = sboapiDataModule.SBSession
    Left = 227
    Top = 253
    object ODSFranshizID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSFranshizMONTH_ID: TFloatField
      FieldName = 'MONTH_ID'
    end
    object ODSFranshizAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
  end
  object ODSMonths: TOracleDataSet
    SQL.Strings = (
      'select * from ins_tarif_months'
      ''
      'where release_id = :release_id')
    Variables.Data = {
      03000000010000000B0000003A52454C454153455F4944040000000000000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000200000049440100000000000A00000052454C454153455F
      494401000000000005000000434F554E54010000000000}
    Master = ODSReliaseDates
    MasterFields = 'ID'
    DetailFields = 'RELEASE_ID'
    Session = sboapiDataModule.SBSession
    Left = 227
    Top = 221
    object ODSMonthsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSMonthsRELEASE_ID: TFloatField
      FieldName = 'RELEASE_ID'
    end
    object ODSMonthsCOUNT: TFloatField
      FieldName = 'COUNT'
    end
  end
  object DSFranshiz: TDataSource
    DataSet = ODSFranshiz
    Left = 195
    Top = 253
  end
  object DSMonths: TDataSource
    DataSet = ODSMonths
    Left = 195
    Top = 221
  end
  object ODSReliaseDates: TOracleDataSet
    SQL.Strings = (
      'select * from ins_release_date'
      'where to_number(to_char(begindate, '#39'YYYY'#39')) <= :releaseyear'
      'and to_number(to_char(enddate, '#39'YYYY'#39')) >= :releaseyear'
      'and state_id in (select its.id from ins_tarif_states its'
      '                  where its.state_id = :state )')
    Variables.Data = {
      03000000020000000C0000003A52454C45415345594541520300000000000000
      00000000060000003A5354415445030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000002000000494401000000000009000000424547494E444154
      4501000000000007000000454E44444154450100000000000800000053544154
      455F4944010000000000}
    Session = sboapiDataModule.SBSession
    Left = 155
    Top = 221
    object ODSReliaseDatesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSReliaseDatesBEGINDATE: TDateTimeField
      FieldName = 'BEGINDATE'
    end
    object ODSReliaseDatesENDDATE: TDateTimeField
      FieldName = 'ENDDATE'
    end
    object ODSReliaseDatesSTATE_ID: TFloatField
      FieldName = 'STATE_ID'
    end
  end
end
