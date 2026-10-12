object mnt: Tmnt
  Left = 0
  Top = 0
  Caption = 'MANDAT'
  ClientHeight = 105
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DateTimePicker1: TDateTimePicker
    Left = 0
    Top = 8
    Width = 273
    Height = 21
    Date = 42614.594383854160000000
    Time = 42614.594383854160000000
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 0
    Top = 48
    Width = 273
    Height = 21
    TabOrder = 1
  end
  object btnsave: TButton
    Left = 88
    Top = 75
    Width = 75
    Height = 25
    Caption = 'Yadda saxla'
    TabOrder = 2
    OnClick = btnsaveClick
  end
  object Edit2: TEdit
    Left = 168
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 3
    Visible = False
  end
end
