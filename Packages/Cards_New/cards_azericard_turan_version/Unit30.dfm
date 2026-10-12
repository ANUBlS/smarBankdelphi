object exclfiles: Texclfiles
  Left = 0
  Top = 0
  Caption = 'Excel Files'
  ClientHeight = 254
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Excels: TRadioGroup
    Left = 48
    Top = 32
    Width = 449
    Height = 185
    Caption = 'Excels'
    Items.Strings = (
      'Account Close'
      'New Card'
      'Prolongation'
      'Salary')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 72
    Top = 229
    Width = 89
    Height = 25
    Caption = 'Open'
    TabOrder = 1
    OnClick = Button1Click
  end
end
