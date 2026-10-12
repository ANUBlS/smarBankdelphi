object DecodingForm: TDecodingForm
  Left = 313
  Top = 160
  BorderStyle = bsDialog
  Caption = 'Decoding Settings '
  ClientHeight = 360
  ClientWidth = 219
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object btnClose: TButton
    Left = 134
    Top = 328
    Width = 75
    Height = 25
    Caption = '&Close'
    ModalResult = 1
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 219
    Height = 86
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 118
      Top = 9
      Width = 50
      Height = 13
      Caption = 'Equivalent'
    end
    object Label2: TLabel
      Left = 18
      Top = 8
      Width = 80
      Height = 26
      Caption = 'Invalid Character          code'
      WordWrap = True
    end
    object SBAdd: TSpeedButton
      Left = 96
      Top = 61
      Width = 23
      Height = 22
      Hint = 'Add '
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF7770777777
        77FFFF777807777777FFFF777700777777FFFF77770B077777FFFF770000B077
        77FFFF770BBBBB0777FFFF7770FB000077FFFF7770BBB07777FFFF00000BFB07
        77FFFF0FBBBFBBB077FFFF70FBFB000007FFFF70BFBFB07777FFFF770BFBFB07
        77FFFF770FFFFFF077FFFF7770FBFFBF07FFFF777000000000FF}
      ParentShowHint = False
      ShowHint = True
      OnClick = SBAddClick
    end
    object TntEditInvalidChar: TEdit
      Left = 16
      Top = 36
      Width = 81
      Height = 21
      TabOrder = 0
    end
    object TntEditEquivalent: TTntEdit
      Left = 116
      Top = 36
      Width = 82
      Height = 21
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object DecodingGrid: TTntDBGrid
    Left = 0
    Top = 86
    Width = 219
    Height = 187
    Align = alTop
    DataSource = DataModuleMain.DataSrcDecoding
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'InvalidCharCode'
        Title.Caption = 'Invalid Char Code'
        Title.Color = clNavy
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValidCharCode'
        Title.Caption = 'Valid Char Code'
        Title.Color = clNavy
        Width = 92
        Visible = True
      end>
  end
  object TntEdit11: TTntEdit
    Left = 2
    Top = 277
    Width = 102
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object TntEdit2: TTntEdit
    Left = 117
    Top = 276
    Width = 100
    Height = 21
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object TntEdit1: TEdit
    Left = 8
    Top = 312
    Width = 121
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = 'TntEdit1'
  end
end
