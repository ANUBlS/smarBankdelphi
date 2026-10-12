object PFForm: TPFForm
  Left = 347
  Top = 231
  BorderIcons = [biSystemMenu]
  Caption = 'PFForm'
  ClientHeight = 264
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 426
    Height = 264
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 207
      Top = 4
      Width = 219
      Height = 215
      Caption = 'Filial se'#231'imi'
      TabOrder = 0
      object Evanescence1: TEvanescence
        Left = 2
        Top = 15
        Width = 215
        Height = 198
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 14
        ParentFont = False
        TabOrder = 0
        DataSource = PFDataMod.BranchesDatScr
        ListField = 'NAME'
        KeyField = 'ID'
        ExplicitTop = 16
        ExplicitHeight = 197
      end
    end
    object GroupBox2: TGroupBox
      Left = 4
      Top = 4
      Width = 196
      Height = 138
      Caption = 'Tarix aral'#305#287#305
      TabOrder = 1
      object Label1: TLabel
        Left = 5
        Top = 29
        Width = 66
        Height = 13
        Caption = 'D'#246'vr'#252'n '#601'vv'#601'li'
      end
      object Label2: TLabel
        Left = 5
        Top = 84
        Width = 61
        Height = 13
        Caption = 'D'#246'vr'#252'n sonu'
      end
      object DTPBegin: TDateTimePicker
        Left = 3
        Top = 47
        Width = 189
        Height = 21
        Date = 38823.045589004600000000
        Time = 38823.045589004600000000
        TabOrder = 0
      end
      object DTPEnd: TDateTimePicker
        Left = 2
        Top = 103
        Width = 190
        Height = 21
        Date = 38823.045758275500000000
        Time = 38823.045758275500000000
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 3
      Top = 143
      Width = 198
      Height = 72
      Caption = 'Borcalan'#305'n kateqorias'#305
      TabOrder = 2
      object Evanescence2: TEvanescence
        Left = 2
        Top = 15
        Width = 194
        Height = 55
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 14
        ParentFont = False
        TabOrder = 0
        DataSource = PFDataMod.PersonsDatSrc
        ListField = 'DESCRIPION'
        KeyField = 'ID'
        ExplicitTop = 16
        ExplicitHeight = 54
      end
    end
    object Panel2: TPanel
      Left = 3
      Top = 219
      Width = 428
      Height = 44
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      object Bevel1: TBevel
        Left = 183
        Top = 3
        Width = 240
        Height = 38
      end
      object BitBtn1: TBitBtn
        Left = 8
        Top = 9
        Width = 80
        Height = 27
        Caption = 'Q'#601'bul'
        Default = True
        DoubleBuffered = True
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
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 94
        Top = 9
        Width = 80
        Height = 27
        Caption = #304'mtina'
        DoubleBuffered = True
        Kind = bkCancel
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 1
      end
      object PrBarPart: TProgressBar
        Left = 186
        Top = 5
        Width = 236
        Height = 18
        TabOrder = 2
      end
      object PrBarMain: TProgressBar
        Left = 186
        Top = 24
        Width = 236
        Height = 15
        TabOrder = 3
      end
    end
  end
  object CMExcelExport: TCMExcelExport
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontTitles.Charset = RUSSIAN_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'Azl Sans Serif'
    FontTitles.Style = []
    OrientationTitles = 0
    FontData.Charset = RUSSIAN_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Azl Sans Serif'
    FontData.Style = []
    FontSummary.Charset = RUSSIAN_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Azl Sans Serif'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 131
    Top = 12
  end
end
