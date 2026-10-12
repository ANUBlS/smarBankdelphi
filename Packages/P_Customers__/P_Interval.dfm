object FormInterval: TFormInterval
  Left = 890
  Top = 520
  BorderStyle = bsDialog
  Caption = 'FormInterval'
  ClientHeight = 125
  ClientWidth = 238
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object OkButton: TButton
    Left = 43
    Top = 95
    Width = 81
    Height = 27
    Caption = #1043#1103#1073#1091#1083
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelButton: TButton
    Left = 138
    Top = 95
    Width = 81
    Height = 27
    Caption = '&'#1048#1084#1090#1080#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 238
    Height = 87
    Align = alTop
    Caption = #1058#1072#1088#1080#1093
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 26
      Top = 26
      Width = 38
      Height = 15
      Caption = #1071#1074#1074#1103#1083':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 26
      Top = 52
      Width = 26
      Height = 15
      Caption = #1057#1086#1085':'
    end
    object StartDateEdit: TDateTimePicker
      Left = 78
      Top = 24
      Width = 147
      Height = 23
      Date = 37359.759652256900000000
      Time = 37359.759652256900000000
      TabOrder = 0
    end
    object EndDateEdit: TDateTimePicker
      Left = 78
      Top = 50
      Width = 147
      Height = 23
      Date = 37359.759652256900000000
      Time = 37359.759652256900000000
      TabOrder = 1
    end
  end
end
