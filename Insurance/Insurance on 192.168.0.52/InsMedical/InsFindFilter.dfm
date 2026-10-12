object fmFind: TfmFind
  Left = 298
  Top = 194
  BorderStyle = bsToolWindow
  Caption = 'fmFind'
  ClientHeight = 252
  ClientWidth = 617
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
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
  object Panel1: TPanel
    Left = 0
    Top = 205
    Width = 617
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 25
    Width = 617
    Height = 176
    Caption = 'Анкет мялуматлары'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 106
      Height = 26
      Caption = 'Сыяорталанажаг ишчинин тяхмини сайы'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 40
      Height = 13
      Caption = 'Груп А'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 192
      Top = 48
      Width = 109
      Height = 13
      Caption = 'Тяминатын ящатя даиряси'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 72
      Width = 40
      Height = 13
      Caption = 'Груп Б'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 192
      Top = 72
      Width = 109
      Height = 13
      Caption = 'Тяминатын ящатя даиряси'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 96
      Width = 40
      Height = 13
      Caption = 'Груп Ж'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 192
      Top = 96
      Width = 109
      Height = 13
      Caption = 'Тяминатын ящатя даиряси'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 8
      Top = 128
      Width = 76
      Height = 13
      Caption = 'Сыьорта програмы'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 194
      Top = 128
      Width = 78
      Height = 13
      Caption = 'Хидмятлярин нювц'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 8
      Top = 152
      Width = 70
      Height = 13
      Caption = 'Башланма тарихи'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 280
      Top = 152
      Width = 67
      Height = 13
      Caption = 'Гуртарма тарихи'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 120
      Top = 16
      Width = 65
      Height = 21
      DataField = 'EMPNUM'
      DataSource = MedBDataMod.DSMedical
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 120
      Top = 48
      Width = 65
      Height = 21
      DataField = 'GROUPA'
      DataSource = MedBDataMod.DSMedical
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 312
      Top = 48
      Width = 297
      Height = 21
      DataField = 'GROUPACOVERAGE'
      DataSource = MedBDataMod.DSMedical
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 120
      Top = 72
      Width = 65
      Height = 21
      DataField = 'GROUPB'
      DataSource = MedBDataMod.DSMedical
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 312
      Top = 72
      Width = 297
      Height = 21
      DataField = 'GROUPBCOVERAGE'
      DataSource = MedBDataMod.DSMedical
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 120
      Top = 96
      Width = 65
      Height = 21
      DataField = 'GROUPC'
      DataSource = MedBDataMod.DSMedical
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 312
      Top = 96
      Width = 297
      Height = 21
      DataField = 'GROUPCCOVERAGE'
      DataSource = MedBDataMod.DSMedical
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 120
      Top = 128
      Width = 65
      Height = 21
      DataField = 'INSPROGRAM'
      DataSource = MedBDataMod.DSMedical
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object edBeginDate: TDateTimePicker
      Left = 120
      Top = 152
      Width = 137
      Height = 21
      CalAlignment = dtaLeft
      Date = 39043.5919124306
      Time = 39043.5919124306
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
      TabOrder = 8
    end
    object edEndDate: TDateTimePicker
      Left = 360
      Top = 152
      Width = 137
      Height = 21
      CalAlignment = dtaLeft
      Date = 39043.5919652315
      Time = 39043.5919652315
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
      TabOrder = 9
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 312
      Top = 128
      Width = 297
      Height = 21
      DataField = 'SERV_ID'
      DataSource = MedBDataMod.DSMedical
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = MedBDataMod.DSMedServices
      ParentFont = False
      TabOrder = 10
    end
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 94
    Top = 5
    Width = 489
    Height = 21
    DataField = 'KLI_ID'
    DataSource = MedBDataMod.DSMedical
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = MedBDataMod.DSCusts
    TabOrder = 2
  end
end
