object FrmChangeSchedule: TFrmChangeSchedule
  Left = 359
  Top = 200
  BorderIcons = [biSystemMenu]
  Caption = 'ti'
  ClientHeight = 213
  ClientWidth = 213
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 13
    Top = 13
    Width = 35
    Height = 15
    Caption = 'Tarix :'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 216
    Top = 8
    Width = 118
    Height = 15
    Caption = #1055#1077#1088#1080#1086#1076#1083#1072#1088#1099#1085' '#1089#1072#1081#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label3: TLabel
    Left = 15
    Top = 45
    Width = 29
    Height = 15
    Caption = 'Qal'#305'q'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 14
    Top = 71
    Width = 60
    Height = 15
    Caption = 'G. m'#252'dd'#601'ti'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BitBtnChenge: TBitBtn
    Left = 44
    Top = 187
    Width = 81
    Height = 27
    Caption = 'Q'#601'bul'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = BitBtnChengeClick
  end
  object BitBtnAbort: TBitBtn
    Left = 127
    Top = 187
    Width = 81
    Height = 27
    Caption = #304'mtina'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = BitBtnAbortClick
  end
  object DTPChngSchedule: TDateTimePicker
    Left = 59
    Top = 6
    Width = 151
    Height = 21
    Date = 39100.472574687500000000
    Time = 39100.472574687500000000
    TabOrder = 2
    OnChange = DTPChngScheduleChange
  end
  object NPeriodsEdit: TEdit
    Left = 234
    Top = 29
    Width = 94
    Height = 22
    ReadOnly = True
    TabOrder = 3
    Text = '0'
    Visible = False
  end
  object EdRest: TEdit
    Left = 59
    Top = 41
    Width = 149
    Height = 22
    TabOrder = 4
    Text = '0'
  end
  object cbchangedate: TCheckBox
    Left = 82
    Top = 165
    Width = 123
    Height = 19
    Caption = #214'd'#601'ni'#351' tarixini d'#601'yi'#351
    TabOrder = 5
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 99
    Width = 202
    Height = 61
    Caption = 'D'#601'yi'#351'm'#601'nin n'#246'v'#252
    Items.Strings = (
      'Anuitet m'#601'bl'#601#287'in d'#601'yi'#351'dirilm'#601'si'
      'M'#252'dd'#601'tin d'#601'yi'#351'dirilm'#601'si')
    TabOrder = 6
  end
  object Edit1: TEdit
    Left = 90
    Top = 68
    Width = 119
    Height = 22
    TabOrder = 7
    Text = '0'
  end
end
