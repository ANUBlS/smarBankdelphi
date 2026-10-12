object Form10: TForm10
  Left = 416
  Top = 281
  Caption = 'Form10'
  ClientHeight = 41
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 424
    Height = 41
    Align = alClient
    TabOrder = 2
  end
  object RadioButton1: TRadioButton
    Left = 24
    Top = 16
    Width = 145
    Height = 17
    Caption = 'Maliyy'#601
    TabOrder = 0
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 272
    Top = 16
    Width = 144
    Height = 17
    Caption = 'Vergi'
    TabOrder = 1
    OnClick = RadioButton2Click
  end
end
