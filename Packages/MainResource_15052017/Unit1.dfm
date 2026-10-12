object FormMeans: TFormMeans
  Left = 1118
  Top = 499
  BorderIcons = [biSystemMenu]
  Caption = 'FormMeans'
  ClientHeight = 205
  ClientWidth = 144
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 176
    Width = 75
    Height = 25
    Caption = 'ok'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Closed: TRadioButton
    Left = 24
    Top = 96
    Width = 113
    Height = 17
    Caption = #1041#1072#1101#1083#1072#1085#1084#1099#1096
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Stopped: TRadioButton
    Left = 24
    Top = 56
    Width = 113
    Height = 17
    Caption = #1044#1072#1081#1072#1085#1076#1099#1088#1099#1083#1084#1099#1096
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Aktive: TRadioButton
    Left = 24
    Top = 16
    Width = 113
    Height = 17
    Caption = #1040#1082#1090#1080#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object All: TRadioButton
    Left = 24
    Top = 136
    Width = 113
    Height = 17
    Caption = #1065#1072#1084#1099#1089#1099#1085#1099' '#1101#1102#1089#1090#1103#1088
    Checked = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    TabStop = True
  end
end
