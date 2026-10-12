object ReserveContMainForm: TReserveContMainForm
  Left = 313
  Top = 312
  Width = 426
  Height = 97
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StartButton: TButton
    Left = 96
    Top = 24
    Width = 241
    Height = 33
    Caption = 'Йенидян гиймятляндирмяк'
    TabOrder = 0
    OnClick = StartButtonClick
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = 'Ещтиййатын Йенидян гиймятляндирилмяси'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 32
    Top = 16
  end
end
