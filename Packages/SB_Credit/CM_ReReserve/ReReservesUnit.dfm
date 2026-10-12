object ReReservesForm: TReReservesForm
  Left = 277
  Top = 263
  Width = 464
  Height = 89
  BorderIcons = [biSystemMenu]
  Caption = 'Сечилмиш ещтийатларын гиймятляндирилмяси'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 113
    Top = 16
    Width = 198
    Height = 29
    Caption = 'Йенидян гиймятляндирилмя'
    TabOrder = 0
    OnClick = Button1Click
  end
  object NLSLocalizer1: TNLSLocalizer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 40
    Top = 16
  end
end
