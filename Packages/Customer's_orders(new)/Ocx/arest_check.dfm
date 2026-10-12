object check_arest: Tcheck_arest
  Left = 418
  Top = 175
  BorderStyle = bsDialog
  Caption = 'Hesaba arest'
  ClientHeight = 253
  ClientWidth = 218
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnShow = FormShow
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
    Left = 64
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Гябул'
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
    Height = 153
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
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 3
  end
  object CheckBox2: TCheckBox
    Left = 41
    Top = 58
    Width = 97
    Height = 17
    Caption = 'C Kredit Arest'
    Color = clSilver
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 4
  end
end
