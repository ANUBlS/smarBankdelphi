object BN_editform: TBN_editform
  Left = 0
  Top = 0
  Caption = 'Redakt'#601
  ClientHeight = 152
  ClientWidth = 332
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 60
    Height = 16
    Caption = 'Hesab '#8470
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 70
    Width = 33
    Height = 16
    Caption = 'V'#246'en'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 8
    Top = 116
    Width = 75
    Height = 25
    Caption = 'Yadda saxla'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 89
    Width = 309
    Height = 21
    MaxLength = 10
    NumbersOnly = True
    TabOrder = 1
    Text = 'Edit2'
  end
  object Edit1: TEdit
    Left = 8
    Top = 32
    Width = 309
    Height = 21
    MaxLength = 28
    TabOrder = 2
    Text = 'Edit1'
  end
  object Edit3: TEdit
    Left = 136
    Top = 5
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Edit3'
    Visible = False
  end
end
