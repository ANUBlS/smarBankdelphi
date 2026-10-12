object DateintervalForm: TDateintervalForm
  Left = 344
  Top = 202
  BorderIcons = [biSystemMenu]
  Caption = 'Tarix  '#1072#1088#1072#1083#1099#1100#1099
  ClientHeight = 108
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 308
    Height = 108
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object StaticText1: TStaticText
      Left = 10
      Top = 17
      Width = 107
      Height = 18
      Caption = #1041#1072#1096#1083#1072#1085#1100#1099#1078'  '#1090#1072#1088#1080#1093#1080
      Color = clSilver
      ParentColor = False
      TabOrder = 0
    end
    object StaticText2: TStaticText
      Left = 158
      Top = 17
      Width = 65
      Height = 18
      Caption = #1057#1086#1085'  '#1090#1072#1088#1080#1093#1080
      Color = clSilver
      ParentColor = False
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 43
      Top = 78
      Width = 96
      Height = 26
      Caption = #1043#1103#1073#1091#1083
      DoubleBuffered = True
      Kind = bkOK
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object DateTimePickerStart: TDateTimePicker
      Left = 9
      Top = 43
      Width = 140
      Height = 21
      Date = 38422.441419363400000000
      Time = 38422.441419363400000000
      TabOrder = 4
    end
    object DateTimePickerEnd: TDateTimePicker
      Left = 155
      Top = 43
      Width = 148
      Height = 21
      Date = 38422.441949166700000000
      Time = 38422.441949166700000000
      ParseInput = True
      TabOrder = 5
    end
    object BitBtn2: TBitBtn
      Left = 172
      Top = 78
      Width = 98
      Height = 26
      Caption = #1041#1072#1100#1083#1072
      DoubleBuffered = True
      Kind = bkCancel
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = BitBtn2Click
    end
  end
end
