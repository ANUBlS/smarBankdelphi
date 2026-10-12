object customers_orders_arest: Tcustomers_orders_arest
  Left = 172
  Top = 2
  Width = 857
  Height = 717
  Caption = 'Serencam'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 7
    Width = 393
    Height = 201
    Caption = 'ћцшт€ри'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object GroupBox3: TGroupBox
      Left = 189
      Top = 13
      Width = 196
      Height = 49
      Caption = ' є'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object DBEdit1: TDBEdit
        Left = 10
        Top = 18
        Width = 175
        Height = 21
        DataField = 'ID'
        DataSource = DataModule1.serach_cust_
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 189
      Top = 62
      Width = 197
      Height = 49
      Caption = 'јды'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object DBEdit2: TDBEdit
        Left = 13
        Top = 13
        Width = 172
        Height = 21
        DataField = 'NAME'
        DataSource = DataModule1.serach_cust_
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBox5: TGroupBox
      Left = 190
      Top = 110
      Width = 195
      Height = 41
      Caption = 'јчылма “арихи'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object DBEdit3: TDBEdit
        Left = 9
        Top = 13
        Width = 176
        Height = 21
        DataField = 'OPEN_DAT'
        DataSource = DataModule1.serach_cust_
        TabOrder = 0
      end
    end
    object GroupBox6: TGroupBox
      Left = 3
      Top = 13
      Width = 185
      Height = 50
      Caption = ' ¬ё≈Ќ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Edit1: TEdit
        Left = 9
        Top = 20
        Width = 168
        Height = 21
        Color = clWhite
        TabOrder = 0
        OnKeyPress = Edit1KeyPress
        OnKeyUp = Edit1KeyUp
      end
    end
    object GroupBox8: TGroupBox
      Left = 188
      Top = 151
      Width = 197
      Height = 42
      Caption = 'Ѕаьланма тарихи'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object DBEdit4: TDBEdit
        Left = 9
        Top = 14
        Width = 181
        Height = 21
        DataField = 'CLOSE_DAT'
        DataSource = DataModule1.serach_cust_
        TabOrder = 0
      end
    end
    object GroupBox38: TGroupBox
      Left = 1
      Top = 110
      Width = 185
      Height = 49
      TabOrder = 5
      object SpeedButton10: TSpeedButton
        Left = 9
        Top = 16
        Width = 75
        Height = 24
        Caption = 'јрест'
        Flat = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00636363008484840084848400848484008484840084848400848484008484
          840084848400848484008484840084848400848484002121210000212100009C
          9C00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B
          7B00007B7B00007B7B00007B7B0052525200848484008484840000BDBD0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
          FF0000FFFF0000FFFF0000FFFF0031EFEF00424242008484840000BDBD0000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0031ADAD000000000031ADAD0000FF
          FF0000FFFF0000FFFF0000FFFF0031EFEF0042424200424242000042420000FF
          FF0000FFFF0000FFFF0000FFFF0000FFFF0031ADAD000000000031ADAD0000FF
          FF0000FFFF0000FFFF0000FFFF00316B6B0084848400FF00FF00FF00FF0000BD
          BD0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000BDBD0000FFFF0000FF
          FF0000FFFF0000FFFF0031EFEF004242420042424200FF00FF00FF00FF000042
          420000FFFF0000FFFF0000FFFF0000FFFF0031CECE003152520000FFFF0000FF
          FF0000FFFF0000FFFF00316B6B0084848400FF00FF00FF00FF00FF00FF00FF00
          FF0000BDBD0000FFFF0000FFFF0000FFFF00316B6B000000000031EFEF0000FF
          FF0000FFFF0031EFEF004242420042424200FF00FF00FF00FF00FF00FF00FF00
          FF000042420000FFFF0000FFFF0000FFFF000021210000000000009C9C0000FF
          FF0000FFFF00316B6B0084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000BDBD0000FFFF0000FFFF000000000000000000007B7B0000FF
          FF0031EFEF004242420042424200FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000042420000FFFF0000FFFF000000000000000000007B7B0000FF
          FF00316B6B0084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000BDBD0000FFFF0031ADAD00007B7B0031EFEF0031EF
          EF004242420042424200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000042420000FFFF0000FFFF0000FFFF0000FFFF00316B
          6B0084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000BDBD0000FFFF0000FFFF0031EFEF004242
          420042424200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000042420000FFFF0000FFFF00316B6B006363
          6300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00007B7B0031ADAD0000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        ParentFont = False
        OnClick = SpeedButton10Click
      end
    end
    object GroupBox7: TGroupBox
      Left = 0
      Top = 63
      Width = 185
      Height = 49
      TabOrder = 6
      object SpeedButton9: TSpeedButton
        Left = 104
        Top = 14
        Width = 73
        Height = 24
        Caption = '√€бул'
        Flat = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000000000000000000000000000000000000000000000000000
          00000000000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF000000000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
          FF000000000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FFFFFF00FFFFFF000000000000000000000000000000
          00000000000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FFFFFF00848484000000000000000000000000000000
          00000000000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          00000000000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
          00000000000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
          00000000000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
          0000000000000000000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00000000000000000000000000000000000000000000000000FF00
          FF00848484000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00000000000000000084848400FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        ParentFont = False
        OnClick = SpeedButton9Click
      end
      object SpeedButton8: TSpeedButton
        Left = 8
        Top = 14
        Width = 77
        Height = 23
        Caption = '…ени'
        Flat = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C00001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C00001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C00000000000000001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C00000000000000001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C00001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C00001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        ParentFont = False
        OnClick = SpeedButton8Click
      end
    end
  end
  object GroupBox37: TGroupBox
    Left = -2
    Top = 445
    Width = 395
    Height = 40
    TabOrder = 1
    object SpeedButton2: TSpeedButton
      Left = 6
      Top = 9
      Width = 82
      Height = 27
      Caption = '–едакт€'
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C000000000000000000000000000000000000000000000000
        000000001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7F1042104210421042FF7F1042FF7FFF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7F104210421042104210421042FF7F104210421042
        FF7F00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7F104210421042FF7F1042104210421042FF7F1042
        FF7F00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7F10421042104210421042FF7F1042104210421042
        FF7F00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7FFF7F0000FF7F000000020002FF7FFF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7F0000000200000002000000021042FF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7F000000020000E0030002E0031042FF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7FFF7F0000FF7F0000E0030002FF7FFF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7F00001F7C1F7C000000000000000000000000000000000000000000000000
        000000001F7C}
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object SpeedButton4: TSpeedButton
      Left = 88
      Top = 9
      Width = 84
      Height = 27
      Caption = 'Ћ€ьв '
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C0000FF7F1F7C1F7C1F7C1F7C0000FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C
        0000FF7F1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C1F7C1F7C0000
        FF7F1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C00000000
        FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C00000000FF7F
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C0000FF7F1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C0000000000000000FF7F1F7C1F7C1F7C00000000
        FF7F1F7C1F7C1F7C1F7C0000000000000000FF7F1F7C1F7C1F7C1F7C1F7C0000
        0000FF7F1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
      ParentFont = False
      OnClick = SpeedButton4Click
    end
    object SpeedButton6: TSpeedButton
      Left = 172
      Top = 9
      Width = 127
      Height = 27
      Caption = 'јрхив€ эюнд€рм€'
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000E07F000000000000
        E05EE05E00001F7C1F7C1F7C1F7C1F7C1F7C0000E07FE05E0000E05EE05E0000
        0000000000001F7C1F7C1F7C1F7C0000E07FE05E0000FF7FFF7F18630000E05E
        E05E000000001F7C1F7C0000E07FE05E0000FF7F1042FF7FFF7F186318631863
        0000E05E00000000E07FE05E000010421042FF7F1042FF7FFF7F186318631863
        186318631F7CE05E0000FF7FFF7F10421042FF7F1042FF7FFF7F186318631863
        186318631F7C1F7C1042FF7FFF7F10421042FF7F1042FF7FFF7F186318631863
        186318631F7C1F7C1042FF7FFF7F10421042FF7F10420000FF7F186300001863
        186318631F7C1F7C10420000104210421042000010420000FF7F186300001863
        000018631F7C1F7C10420000104210421042000010420000FF7F186318631863
        000018631F7C1F7C10420000FF7F10421042000010421042FF7F104218631863
        186318631F7C1F7C10421042FF7F104210421042FF7F10421863FF7FFF7F1042
        186318631F7C1F7C1F7C1042FF7F1042186310421863FF7FFF7F10421863FF7F
        FF7F10421F7C1F7C1F7C1F7C1F7C1042FF7F1042186310421863FF7FFF7F1042
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042186310421F7C1F7C
        1F7C1F7C1F7C}
      ParentFont = False
      OnClick = SpeedButton6Click
    end
  end
  object GroupBox33: TGroupBox
    Left = 392
    Top = 1
    Width = 441
    Height = 80
    TabOrder = 2
    object Label29: TLabel
      Left = 35
      Top = 14
      Width = 73
      Height = 13
      Caption = '—€р€нжамын є:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label30: TLabel
      Left = 182
      Top = 13
      Width = 65
      Height = 13
      Caption = '¬алйута нювц:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label33: TLabel
      Left = 323
      Top = 11
      Width = 58
      Height = 13
      Caption = 'јчылма  тарихи'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object editnumber: TEdit
      Left = 24
      Top = 34
      Width = 121
      Height = 21
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyDown = editnumberKeyDown
    end
    object editdate: TDateTimePicker
      Left = 296
      Top = 32
      Width = 134
      Height = 21
      CalAlignment = dtaLeft
      Date = 38716.9766529745
      Time = 38716.9766529745
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object editval: TComboBox
      Left = 152
      Top = 32
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      OnKeyPress = editvalKeyPress
    end
  end
  object GroupBox9: TGroupBox
    Left = 395
    Top = 85
    Width = 238
    Height = 196
    Caption = '≈митент  (юд€й€н банк)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object GroupBox11: TGroupBox
      Left = 11
      Top = 13
      Width = 222
      Height = 33
      TabOrder = 0
      object Label2: TLabel
        Left = 10
        Top = 12
        Width = 18
        Height = 13
        Caption = 'јды:'
      end
      object DBname: TDBEdit
        Left = 71
        Top = 8
        Width = 146
        Height = 21
        Color = clMenu
        DataField = 'BANK'
        DataSource = DataModule1.bank_info_
        TabOrder = 0
      end
    end
    object GroupBox12: TGroupBox
      Left = 11
      Top = 46
      Width = 224
      Height = 33
      TabOrder = 1
      object Label1: TLabel
        Left = 5
        Top = 11
        Width = 28
        Height = 13
        Caption = ' оду:'
      end
      object DBcode: TDBEdit
        Left = 62
        Top = 8
        Width = 153
        Height = 21
        Color = clMenu
        DataField = 'KOD_B'
        DataSource = DataModule1.bank_info_
        TabOrder = 0
      end
    end
    object GroupBox13: TGroupBox
      Left = 10
      Top = 78
      Width = 225
      Height = 33
      TabOrder = 2
      object Label3: TLabel
        Left = 8
        Top = 12
        Width = 33
        Height = 13
        Caption = '¬ё≈Ќ:'
      end
      object DBinn: TDBEdit
        Left = 64
        Top = 8
        Width = 153
        Height = 21
        Color = clMenu
        DataField = 'inn'
        DataSource = DataModule1.bank_info_
        TabOrder = 0
      end
    end
    object GroupBox14: TGroupBox
      Left = 10
      Top = 110
      Width = 225
      Height = 33
      TabOrder = 3
      object Label4: TLabel
        Left = 5
        Top = 11
        Width = 68
        Height = 13
        Caption = 'ћцхбир ўесаб:'
      end
      object DBCorAcc: TDBEdit
        Left = 80
        Top = 8
        Width = 138
        Height = 21
        Color = clMenu
        DataField = 'KRNO'
        DataSource = DataModule1.bank_info_
        TabOrder = 0
      end
    end
    object GroupBox15: TGroupBox
      Left = 10
      Top = 146
      Width = 225
      Height = 33
      TabOrder = 4
      object Label5: TLabel
        Left = 3
        Top = 12
        Width = 37
        Height = 13
        Caption = 'SWIFT:'
      end
      object DBswift: TDBEdit
        Left = 41
        Top = 8
        Width = 177
        Height = 21
        Color = clMenu
        DataField = 'Swift'
        DataSource = DataModule1.bank_info_
        TabOrder = 0
      end
    end
  end
  object GroupBox10: TGroupBox
    Left = 630
    Top = 86
    Width = 204
    Height = 196
    Caption = 'Ѕенефисиар  (алан банк)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object GroupBox16: TGroupBox
      Left = 11
      Top = 13
      Width = 190
      Height = 33
      TabOrder = 0
      object Label6: TLabel
        Left = 10
        Top = 12
        Width = 18
        Height = 13
        Caption = 'јды:'
      end
      object comboname: TComboBox
        Left = 31
        Top = 8
        Width = 154
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnChange = combonameChange
      end
    end
    object GroupBox17: TGroupBox
      Left = 9
      Top = 46
      Width = 192
      Height = 33
      TabOrder = 1
      object Label7: TLabel
        Left = 8
        Top = 11
        Width = 28
        Height = 13
        Caption = ' оду:'
      end
      object Editcode: TEdit
        Left = 43
        Top = 8
        Width = 142
        Height = 21
        TabOrder = 0
        OnChange = EditcodeChange
        OnKeyPress = EditcodeKeyPress
      end
    end
    object GroupBox18: TGroupBox
      Left = 8
      Top = 78
      Width = 193
      Height = 33
      TabOrder = 2
      object Label8: TLabel
        Left = 9
        Top = 12
        Width = 33
        Height = 13
        Caption = '¬ё≈Ќ:'
      end
      object Editvoin: TEdit
        Left = 43
        Top = 8
        Width = 144
        Height = 21
        TabOrder = 0
        OnKeyPress = EditvoinKeyPress
      end
    end
    object GroupBox19: TGroupBox
      Left = 8
      Top = 110
      Width = 193
      Height = 33
      TabOrder = 3
      object Label9: TLabel
        Left = 3
        Top = 11
        Width = 68
        Height = 13
        Caption = 'ћцхбир ўесаб:'
      end
      object Editacc: TEdit
        Left = 76
        Top = 8
        Width = 111
        Height = 21
        TabOrder = 0
        OnKeyPress = EditaccKeyPress
      end
    end
    object GroupBox20: TGroupBox
      Left = 8
      Top = 146
      Width = 193
      Height = 33
      TabOrder = 4
      object Label10: TLabel
        Left = 1
        Top = 12
        Width = 37
        Height = 13
        Caption = 'SWIFT:'
      end
      object Editswift: TEdit
        Left = 37
        Top = 8
        Width = 151
        Height = 21
        TabOrder = 0
        OnKeyPress = EditswiftKeyPress
      end
    end
  end
  object GroupBox21: TGroupBox
    Left = 395
    Top = 285
    Width = 236
    Height = 124
    Caption = 'ёд€й€н мцшт€ри'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object GroupBox22: TGroupBox
      Left = 11
      Top = 13
      Width = 222
      Height = 33
      TabOrder = 0
      object Label11: TLabel
        Left = 8
        Top = 12
        Width = 18
        Height = 13
        Caption = 'јды:'
      end
      object Editc_name: TEdit
        Left = 45
        Top = 8
        Width = 171
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox23: TGroupBox
      Left = 12
      Top = 46
      Width = 221
      Height = 33
      TabOrder = 1
      object Label12: TLabel
        Left = 5
        Top = 11
        Width = 34
        Height = 13
        Caption = 'ўесаб:'
      end
      object editc_acc: TEdit
        Left = 52
        Top = 8
        Width = 161
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox24: TGroupBox
      Left = 13
      Top = 79
      Width = 220
      Height = 33
      TabOrder = 2
      object Label13: TLabel
        Left = 8
        Top = 12
        Width = 33
        Height = 13
        Caption = '¬ё≈Ќ:'
      end
      object Editc_voin: TEdit
        Left = 59
        Top = 8
        Width = 154
        Height = 21
        TabOrder = 0
        OnChange = Editc_voinChange
      end
    end
  end
  object GroupBox25: TGroupBox
    Left = 630
    Top = 285
    Width = 210
    Height = 124
    Caption = 'јлан мцшт€ри'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object GroupBox26: TGroupBox
      Left = 3
      Top = 13
      Width = 198
      Height = 33
      TabOrder = 0
      object Label14: TLabel
        Left = 7
        Top = 12
        Width = 18
        Height = 13
        Caption = 'јды:'
      end
      object Editm_name: TEdit
        Left = 29
        Top = 8
        Width = 163
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox27: TGroupBox
      Left = 4
      Top = 46
      Width = 197
      Height = 33
      TabOrder = 1
      object Label15: TLabel
        Left = 4
        Top = 11
        Width = 37
        Height = 13
        Caption = 'ўесаб :'
      end
      object Editm_acc: TEdit
        Left = 43
        Top = 8
        Width = 147
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox28: TGroupBox
      Left = 5
      Top = 79
      Width = 196
      Height = 33
      TabOrder = 2
      object Label16: TLabel
        Left = 2
        Top = 12
        Width = 33
        Height = 13
        Caption = '¬ё≈Ќ:'
      end
      object Editm_voin: TEdit
        Left = 54
        Top = 8
        Width = 137
        Height = 21
        TabOrder = 0
        OnChange = Editm_voinChange
      end
    end
  end
  object GroupBox29: TGroupBox
    Left = 398
    Top = 409
    Width = 443
    Height = 91
    Caption = ' ючцрцл€н м€бл€ь'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    object Label17: TLabel
      Left = 6
      Top = 17
      Width = 42
      Height = 13
      Caption = '–€г€мл€'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 169
      Top = 16
      Width = 39
      Height = 13
      Caption = '…азы ил€: '
    end
    object Label32: TLabel
      Left = 123
      Top = 39
      Width = 123
      Height = 13
      Caption = 'ёд€нишин т€йинаты в€ €сас :'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Editn_mon: TEdit
      Left = 53
      Top = 13
      Width = 109
      Height = 21
      TabOrder = 0
      OnChange = Editn_monChange
      OnExit = Editn_monExit
      OnKeyPress = Editn_monKeyPress
    end
    object Editw_mon: TEdit
      Left = 207
      Top = 12
      Width = 227
      Height = 21
      TabOrder = 1
      OnKeyPress = Editw_monKeyPress
    end
    object Editcon: TEdit
      Left = 7
      Top = 57
      Width = 427
      Height = 21
      TabOrder = 2
    end
  end
  object GroupBox32: TGroupBox
    Left = 396
    Top = 508
    Width = 445
    Height = 96
    Caption = 'ёд€нишл€ €лаг€дар €лав€ информасийа'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    object Label23: TLabel
      Left = 17
      Top = 20
      Width = 57
      Height = 13
      Caption = '“€дийй€ ады:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 17
      Top = 43
      Width = 26
      Height = 13
      Caption = 'яƒ¬:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 15
      Top = 67
      Width = 66
      Height = 13
      Caption = 'ямлак верэиси:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 123
      Top = 19
      Width = 64
      Height = 13
      Caption = 'ясас м€бл€ь:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
      Left = 259
      Top = 19
      Width = 22
      Height = 13
      Caption = '‘аиз:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 364
      Top = 18
      Width = 26
      Height = 13
      Caption = '∆€ми:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Editedv: TEdit
      Left = 100
      Top = 39
      Width = 105
      Height = 21
      TabOrder = 0
      OnKeyPress = EditedvKeyPress
    end
    object Editedv_f: TEdit
      Left = 217
      Top = 39
      Width = 105
      Height = 21
      TabOrder = 1
      OnKeyPress = Editedv_fKeyPress
    end
    object Editedv_t: TEdit
      Left = 327
      Top = 39
      Width = 105
      Height = 21
      TabOrder = 2
      OnKeyDown = Editedv_tKeyDown
      OnKeyPress = Editedv_tKeyPress
    end
    object editpro: TEdit
      Left = 99
      Top = 64
      Width = 105
      Height = 21
      TabOrder = 3
    end
    object Editpro_p: TEdit
      Left = 217
      Top = 64
      Width = 104
      Height = 21
      TabOrder = 4
    end
    object Editpro_t: TEdit
      Left = 326
      Top = 64
      Width = 105
      Height = 21
      TabOrder = 5
    end
  end
  object GroupBox30: TGroupBox
    Left = 397
    Top = 609
    Width = 444
    Height = 66
    TabOrder = 9
    object Label19: TLabel
      Left = 11
      Top = 14
      Width = 196
      Height = 16
      Caption = '—€р€нжам вермиш верэи органынын'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label26: TLabel
      Left = 10
      Top = 27
      Width = 96
      Height = 16
      Caption = ' в€зиф€ли ш€хсл€ри:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label27: TLabel
      Left = 242
      Top = 17
      Width = 24
      Height = 13
      Caption = '–€ис:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label28: TLabel
      Left = 228
      Top = 41
      Width = 49
      Height = 13
      Caption = 'Ўюб€ р€иси:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Editchief: TEdit
      Left = 282
      Top = 16
      Width = 153
      Height = 21
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Edithead: TEdit
      Left = 282
      Top = 40
      Width = 153
      Height = 21
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 208
    Width = 393
    Height = 241
    Caption = 'ўесаблар'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    object DBGrid1: TDBGrid
      Left = 2
      Top = 31
      Width = 384
      Height = 202
      DataSource = DataModule1.search_acc_
      FixedColor = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnKeyDown = DBGrid1KeyDown
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Color = clSilver
          Expanded = False
          FieldName = 'ACC_NO'
          Title.Caption = 'ўесаб є'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPACC'
          Title.Caption = 'јрест'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VAL_ACC'
          Title.Caption = '$'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 21
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Caption = 'ўесабын ады'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 114
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OPEN_DAT'
          Title.Caption = 'јчылма тарихи'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 66
          Visible = True
        end>
    end
  end
  object GroupBox31: TGroupBox
    Left = 0
    Top = 488
    Width = 393
    Height = 201
    Caption = '—€р€нжамлар'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    object DBGrid2: TDBGrid
      Left = 4
      Top = 13
      Width = 381
      Height = 180
      DataSource = DataModule1.order_
      FixedColor = clNavy
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid2CellClick
      OnKeyDown = DBGrid2KeyDown
      OnTitleClick = DBGrid2TitleClick
      Columns = <
        item
          Color = clSilver
          Expanded = False
          FieldName = 'PNUM'
          Title.Caption = 'є'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 37
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DDATE'
          Title.Caption = '“арих'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VAL'
          Title.Caption = '¬алйута'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_INN'
          Title.Caption = '¬юин'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 113
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'N_MON'
          Title.Caption = 'ћ€бл€ь'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 81
          Visible = True
        end>
    end
  end
end
