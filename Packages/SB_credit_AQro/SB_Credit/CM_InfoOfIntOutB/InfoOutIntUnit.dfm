object InfoOutIntMainForm: TInfoOutIntMainForm
  Left = 377
  Top = 165
  Width = 425
  Height = 452
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 417
    Height = 374
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object DBGridEh: TDBGridEh
      Left = 2
      Top = 2
      Width = 413
      Height = 370
      Align = alClient
      DataSource = InfOutIntDatMod.IntPlaceOutBDatSrc
      FooterColor = clWindow
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Azl Sans Serif'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGridEhDblClick
      OnKeyPress = DBGridEhKeyPress
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NUM'
          Footers = <>
          Title.Caption = '№'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = 'Ады'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'HDATE'
          Footers = <>
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'REST'
          Footers = <>
          Title.Caption = 'Я.Б. Галыг'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
        end
        item
          EditButtons = <>
          FieldName = 'INTERESTREST'
          Footers = <>
          Title.Caption = 'Ф Галыг'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
        end
        item
          EditButtons = <>
          FieldName = 'DUEREST'
          Footers = <>
          Title.Caption = 'Э.Я .Галыг'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
        end
        item
          EditButtons = <>
          FieldName = 'DUEINTERESTREST'
          Footers = <>
          Title.Caption = 'Э.Ф. Галыг'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
        end>
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 374
    Width = 417
    Height = 44
    Align = alBottom
    Caption = 'Ахтарыш'
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 237
      Top = 13
      Width = 72
      Height = 26
      Caption = 'Гябул'
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
    object SpeedButton2: TSpeedButton
      Left = 330
      Top = 13
      Width = 72
      Height = 26
      Caption = 'Имтина'
      OnClick = SpeedButton2Click
    end
    object Editsearch: TEdit
      Left = 6
      Top = 18
      Width = 112
      Height = 21
      TabOrder = 0
      OnChange = EditsearchChange
    end
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = 'Балансдан кянар щесабланмыш фаизлярин юдянилмяси'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 8
    Top = 320
  end
end
