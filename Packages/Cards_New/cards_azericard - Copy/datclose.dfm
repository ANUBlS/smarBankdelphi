object dateclose: Tdateclose
  Left = 973
  Top = 810
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tarix sazlamas'#305
  ClientHeight = 146
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 34
    Top = 24
    Width = 206
    Height = 14
    Caption = #1041#1080#1090#1084#1103' '#1090#1072#1088#1080#1093#1080#1085#1080#1085' '#1093#1103#1073#1103#1088#1076#1072#1088#1083#1099#1075' '#1084#1094#1076#1076#1103#1090#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 35
    Top = 48
    Width = 157
    Height = 21
    DataField = 'dateclose'
    DataSource = DataMod_CARDS.settingssource
    TabOrder = 0
  end
  object Button1: TButton
    Left = 32
    Top = 80
    Width = 75
    Height = 25
    Caption = #1049#1072#1076#1076#1072' '#1089#1072#1093#1083#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
end
