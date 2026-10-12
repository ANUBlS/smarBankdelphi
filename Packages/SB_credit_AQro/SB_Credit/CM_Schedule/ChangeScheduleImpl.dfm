object FrmChangeSchedule: TFrmChangeSchedule
  Left = 359
  Top = 200
  BorderIcons = [biSystemMenu]
  ClientHeight = 157
  ClientWidth = 204
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
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 12
    Width = 37
    Height = 13
    Caption = #1058#1072#1088#1080#1093' :'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 13
    Top = 71
    Width = 87
    Height = 13
    Caption = #1055#1077#1088#1080#1086#1076#1083#1072#1088#1099#1085' '#1089#1072#1081#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 42
    Width = 30
    Height = 13
    Caption = #1043#1072#1083#1099#1075
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BitBtnChenge: TBitBtn
    Left = 36
    Top = 122
    Width = 75
    Height = 25
    Caption = #1043#1103#1073#1091#1083
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = BitBtnChengeClick
  end
  object BitBtnAbort: TBitBtn
    Left = 123
    Top = 122
    Width = 75
    Height = 25
    Caption = #1048#1084#1090#1080#1085#1072
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = BitBtnAbortClick
  end
  object DTPChngSchedule: TDateTimePicker
    Left = 55
    Top = 6
    Width = 140
    Height = 21
    Date = 39100.472574687500000000
    Time = 39100.472574687500000000
    TabOrder = 2
    OnChange = DTPChngScheduleChange
  end
  object NPeriodsEdit: TEdit
    Left = 106
    Top = 66
    Width = 87
    Height = 21
    TabOrder = 3
    Text = '0'
  end
  object EdRest: TEdit
    Left = 55
    Top = 38
    Width = 138
    Height = 21
    TabOrder = 4
    Text = '0'
  end
  object cbchangedate: TCheckBox
    Left = 77
    Top = 96
    Width = 114
    Height = 17
    Caption = #1070#1076#1103#1085#1080#1096' '#1090#1072#1088#1080#1093#1080#1085#1080' '#1076#1103#1081#1080#1096
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
end
