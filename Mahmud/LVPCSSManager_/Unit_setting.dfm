object Form_Setting: TForm_Setting
  Left = 229
  Top = 115
  Width = 315
  Height = 417
  AutoSize = True
  Caption = 'Setting'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 307
    Height = 390
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 52
      Width = 305
      Height = 45
      Align = alTop
      Caption = 'Ѕаланс щесабынын €лав€ едилм€си'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 19
        Width = 72
        Height = 13
        Caption = 'Ѕаланс щесабы :'
      end
      object SB_OK: TSpeedButton
        Left = 232
        Top = 16
        Width = 25
        Height = 22
        Hint = 'ялав€ ≈т'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2020DF202020FF
          FFFF008080008000008000800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF0000FF2020DF80808000800000FF0000FF000080008000
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6060DF00007F00007F0000FF0000FF00
          00FF00FF0000800000800000FF00008000800000FFFFFFFFFFFFFFFFFFFFFFFF
          5050500000FF0000FF0000FF0000FF00FFFF00800000808000FF0000800000FF
          00008000800000FFFFFFFFFFFF3030304040400000FF0000FF0000FF0000FF00
          FFFF00FFFF0000FF0000FF00FF0000800000FF00008000FFFFFF4040400000FF
          0000FF0000FF0000FF0000FF0000FF007FFF007FFF007FFF0000FF0000FF00FF
          0000800000FF00008080FFFFFF00003F2020DF0000FF0000FF0000FF0000FF00
          FFFF00FFFF00007F0000FF0000FF0000FF00FF00008000008080FFFFFF20205F
          2020DF0000FF0000FF0000FF0000FF00FFFF00FFFF00007F0000FF0000FF0000
          FF0000FF0000FF50508F20205F0000FF0000FF0000FF0000FF0000FF0000FF00
          FFFF00FFFF00007F0000FF0000FF0000FF20209F303030FFFFFFFFFFFFFFFFFF
          50508F0000FF0000FF0000FF0000FF00FFFF00FFFF00007F0000FF0000FF0000
          FF3030EFFFFFFFFFFFFFFFFFFFFFFFFF20209F0000FF0000FF0000FF0000FF00
          FFFF00FFFF0000BF0000FF0000FF0000FF0000FF20209FFFFFFFFFFFFF303030
          2020DF3030AF0000BF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          7F00007F20205FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007F0000FF0000DF00
          00BF0000FF3030EF3030EF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF20205F3030EF0000205050500000FF505050FFFFFF20205F3030
          30FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF303030FFFFFFFFFFFFFF
          FFFF8080BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentShowHint = False
        ShowHint = True
        OnClick = SB_OKClick
      end
      object SB_DEL: TSpeedButton
        Left = 264
        Top = 16
        Width = 25
        Height = 22
        Hint = '—ил'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF404040606060808080808080808080606060404040FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF20202020206020209F0000BF00
          00BF0000BF20209F404080808080606060202020FFFFFFFFFFFFFFFFFFFFFFFF
          00002020209F0000FF0000FF0000FF0000FF0000FF0000FF0000FF20209F6060
          80808080202020FFFFFFFFFFFF0000200000DF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000DF606080606060FFFFFFFFFFFF00007F
          0000FF0000FF3F3FFF0000FF0000FF0000FF0000FF0000FF3F3FFF0000FF0000
          FF20209F8080804040400000400000FF0000FF3F3FFFFFFFFFBFBFFF0000FF00
          00FF0000FFBFBFFFFFFFFF3F3FFF0000FF0000FF40408060606000007F0000FF
          0000FF0000FFBFBFFFFFFFFFBFBFFF0000FFBFBFFFFFFFFFBFBFFF0000FF0000
          FF0000FF20209F8080800000BF0000FF0000FF0000FF0000FFBFBFFFFFFFFFFF
          FFFFFFFFFFBFBFFF0000FF0000FF0000FF0000FF0000BF8080800000BF0000FF
          0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000
          FF0000FF0000BF8080800000BF0000FF0000FF0000FF0000FFBFBFFFFFFFFFFF
          FFFFFFFFFFBFBFFF0000FF0000FF0000FF0000FF0000BF60606000007F0000FF
          0000FF0000FFBFBFFFFFFFFFBFBFFF0000FFBFBFFFFFFFFFBFBFFF0000FF0000
          FF0000FF20209F4040400000400000FF0000FF3F3FFFFFFFFFBFBFFF0000FF00
          00FF0000FFBFBFFFFFFFFF3F3FFF0000FF0000FF202060FFFFFFFFFFFF00007F
          0000FF0000FF3F3FFF0000FF0000FF0000FF0000FF0000FF3F3FFF0000FF0000
          FF20209F202020FFFFFFFFFFFF0000200000DF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000DF000020FFFFFFFFFFFFFFFFFFFFFFFF
          00002000007F0000FF0000FF0000FF0000FF0000FF0000FF0000FF00007F0000
          20FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00004000007F0000BF00
          00BF0000BF00007F000040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentShowHint = False
        ShowHint = True
        OnClick = SB_DELClick
      end
      object Edit_Balans_hesabi: TEdit
        Left = 88
        Top = 16
        Width = 105
        Height = 21
        Hint = 'Ѕаланс щесабы'
        MaxLength = 4
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = Edit_Balans_hesabiEnter
        OnKeyPress = Edit_Balans_hesabiKeyPress
        OnKeyUp = Edit_Balans_hesabiKeyUp
      end
    end
    object DBG_Balans_Hesablari: TDBGrid
      Left = 1
      Top = 97
      Width = 305
      Height = 255
      Align = alClient
      DataSource = DataMod.DS_XS_Filter
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBG_Balans_HesablariCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ACC_ID'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Title.Caption = 'Ѕаланс щесабы'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 87
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 1
      Top = 352
      Width = 305
      Height = 37
      Align = alBottom
      TabOrder = 2
      object Button_Exit: TButton
        Left = 224
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Ѕаьла'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Button_ExitClick
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 305
      Height = 51
      Align = alTop
      TabOrder = 3
      object Memo1: TMemo
        Left = 1
        Top = 1
        Width = 303
        Height = 49
        Align = alClient
        Color = clBtnFace
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '        Ѕу Ѕюлм€д€ сечилмиш баланс щесабларына'
          '     аид олан щесаблардан '#39'Ёцнцн —€н€дл€ри'#39'-н€'
          '                    €м€лиййат дцшм€й€ж€к.'
          '')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object NLSLocalizer1: TNLSLocalizer
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 217
    Top = 256
  end
end
