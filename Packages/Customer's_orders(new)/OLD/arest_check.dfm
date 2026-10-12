object check_arest: Tcheck_arest
  Left = 418
  Top = 175
  Width = 226
  Height = 325
  Caption = 'Hesaba arest'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CheckListBox1: TCheckListBox
    Left = 0
    Top = 0
    Width = 217
    Height = 185
    Color = clSilver
    ItemHeight = 13
    TabOrder = 0
  end
  object Button1: TButton
    Left = 16
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Γÿασλ'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object CLBAccFlags: TCheckListBox
    Left = 0
    Top = 0
    Width = 218
    Height = 233
    Align = alTop
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 2
  end
  object CheckBox1: TCheckBox
    Left = 40
    Top = 28
    Width = 97
    Height = 17
    Caption = 'D Debit Arest'
    Color = clSilver
    ParentColor = False
    TabOrder = 3
  end
  object CheckBox2: TCheckBox
    Left = 41
    Top = 58
    Width = 97
    Height = 17
    Caption = 'C Kredit Arest'
    Color = clSilver
    ParentColor = False
    TabOrder = 4
  end
  object CheckBox3: TCheckBox
    Left = 41
    Top = 88
    Width = 97
    Height = 17
    Caption = 'O OverDraft'
    Color = clSilver
    ParentColor = False
    TabOrder = 5
  end
  object CheckBox4: TCheckBox
    Left = 40
    Top = 117
    Width = 97
    Height = 17
    Caption = 'K Kart hesablari'
    Color = clSilver
    ParentColor = False
    TabOrder = 6
  end
  object Button2: TButton
    Left = 120
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Λÿόβ ες'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = Button2Click
  end
end
