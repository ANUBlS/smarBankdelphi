object Excels: TExcels
  Left = 266
  Top = 249
  Caption = 'Excels'
  ClientHeight = 287
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
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
    Top = 240
    Width = 89
    Height = 25
    Caption = 'Open'
    TabOrder = 1
    OnClick = Button1Click
  end
end
