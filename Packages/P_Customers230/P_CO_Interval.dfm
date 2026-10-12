object P_CO_IntervalForm: TP_CO_IntervalForm
  Left = 544
  Top = 292
  BorderStyle = bsDialog
  Caption = 'P_CO_IntervalForm'
  ClientHeight = 118
  ClientWidth = 220
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 220
    Height = 81
    Align = alTop
    Caption = #1058#1072#1088#1080#1093
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 209
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 32
      Height = 13
      Caption = #399'vv'#601'l:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 48
      Width = 22
      Height = 13
      Caption = 'Son:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object EndDateEdit: TDateTimePicker
      Left = 72
      Top = 46
      Width = 137
      Height = 21
      Date = 37359.759652256900000000
      Time = 37359.759652256900000000
      TabOrder = 0
    end
    object StartDateEdit: TDateTimePicker
      Left = 72
      Top = 16
      Width = 135
      Height = 21
      Date = 39002.964048449100000000
      Time = 39002.964048449100000000
      TabOrder = 1
    end
  end
  object OkButton: TButton
    Left = 56
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Ok'
    Default = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TButton
    Left = 133
    Top = 88
    Width = 75
    Height = 25
    Caption = '&Cancel'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 2
  end
end
