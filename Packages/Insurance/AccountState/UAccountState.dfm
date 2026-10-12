object AccountState: TAccountState
  Left = 194
  Top = 109
  Width = 472
  Height = 321
  Caption = 'AccountState'
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
    Top = 264
    Width = 464
    Height = 30
    Align = alBottom
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 8
      Top = 4
      Width = 65
      Height = 22
      Caption = 'To ->'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000080
        0000008000000080000000800000008000000080000000800000008000000080
        00000080000000800000008000000080000000800000FF00FF00FF00FF000080
        0000008000000080000000800000008000000080000000800000008000000080
        00000080000000800000008000000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF000080000000800000008000000080000000800000008000000080
        00000080000000800000008000000080000000800000FF00FF00FF00FF000080
        0000FFFFFF000080000000800000008000000080000000800000FFFFFF000080
        00000080000000800000FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00008000000080000000800000FFFFFF00008000000080
        00000080000000800000FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF0000800000FFFFFF0000800000008000000080
        0000FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000080000000800000008000000080
        0000FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF00008000000080000000800000008000000080
        000000800000FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00008000000080000000800000FFFFFF00008000000080
        00000080000000800000FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000008000000080000000800000008000000080000000800000008000000080
        00000080000000800000008000000080000000800000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Layout = blGlyphRight
      OnClick = SpeedButton1Click
    end
    object CloseButton: TButton
      Left = 386
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&׳ûץûר'
      TabOrder = 0
      OnClick = CloseButtonClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 464
    Height = 264
    ActivePage = AccAmountSheet
    Align = alClient
    TabOrder = 1
    TabPosition = tpBottom
    TabStop = False
    object AccAmountSheet: TTabSheet
      Caption = 'Ùוסאבהאךט דאכûדכאנû'
      object DBGridAccState: TDBGrid
        Left = 0
        Top = 0
        Width = 456
        Height = 236
        Align = alClient
        DataSource = AccountStateDModule.AccState
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Color = clSilver
            Expanded = False
            FieldName = 'ARCHIVEDATE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Caption = 'ׂאנטץ'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AMOUNT'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 114
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LAMOUNT'
            Title.Caption = 'ֵךגטגאכוםע'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 110
            Visible = True
          end>
      end
    end
    object AccTurnoverSheet: TTabSheet
      Caption = 'Ùוסאבהאךט ה‏גנטייÿכÿנט'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 456
        Height = 236
        Align = alClient
        DataSource = AccountStateDModule.AccState
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Color = clSilver
            Expanded = False
            FieldName = 'ARCHIVEDATE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Caption = 'ׂאנטץ'
            Title.Color = clNavy
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITTURNOVER'
            Title.Caption = 'ִ.ִ‏גנטייÿ'
            Title.Color = clNavy
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITLTURNOVER'
            Title.Caption = 'ִ.ִ‏גנטייÿ(לאם)'
            Title.Color = clNavy
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITTURNOVER'
            Title.Caption = 'Ê.ִ‏גנטייÿ'
            Title.Color = clNavy
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITLTURNOVER'
            Title.Caption = 'Ê.ִ‏גנטייÿ(לאם)'
            Title.Color = clNavy
            Visible = True
          end>
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Ùוסאבהאךט דאכûדכאנû גÿ ה‏גנטייÿכÿנ'
      ImageIndex = 2
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 456
        Height = 236
        Align = alClient
        DataSource = AccountStateDModule.AccState
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Color = clSilver
            Expanded = False
            FieldName = 'ARCHIVEDATE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Caption = 'ׂאנטץ'
            Title.Color = clNavy
            Width = 92
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'AMOUNT'
            Title.Color = clNavy
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LAMOUNT'
            Title.Color = clNavy
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITTURNOVER'
            Title.Caption = 'ִ.ִ‏גנטייÿ'
            Title.Color = clNavy
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITLTURNOVER'
            Title.Caption = 'ִ.ִ‏גנטייÿ(לאם)'
            Title.Color = clNavy
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITTURNOVER'
            Title.Caption = 'Ê.ִ‏גנטייÿ'
            Title.Color = clNavy
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITLTURNOVER'
            Title.Caption = 'Ê.ִ‏גנטייÿ(לאם)'
            Title.Color = clNavy
            Visible = True
          end>
      end
    end
  end
  object AccStateExporter: TExcelExporter
    ExportSource = AccountStateDModule.AccState
    SheetName = 'AccountState'
    ShowTitles = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Az Lat'
    Font.Style = []
    Left = 340
    Top = 150
  end
end
