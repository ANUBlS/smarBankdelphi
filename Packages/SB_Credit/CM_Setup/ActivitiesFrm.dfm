object Form2: TForm2
  Left = 351
  Top = 353
  AutoScroll = False
  ClientHeight = 68
  ClientWidth = 267
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 3
    Top = 13
    Width = 37
    Height = 13
    Caption = '“€йинаты'
  end
  object DBEditEh1: TDBEditEh
    Left = 44
    Top = 10
    Width = 219
    Height = 21
    DataField = 'NAME'
    DataSource = UsrGrDataMod.DataSrcActivities
    EditButtons = <>
    TabOrder = 0
    Visible = True
  end
  object Button1: TButton
    Left = 56
    Top = 38
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 135
    Top = 39
    Width = 75
    Height = 24
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Localizer: TNLSLocalizer
    Caption = 'Kreditin verilme meqsedi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 16
    Top = 40
  end
end
