object P_CO_IntervalForm: TP_CO_IntervalForm
  Left = 272
  Top = 146
  BorderStyle = bsDialog
  Caption = 'P_CO_IntervalForm'
  ClientHeight = 118
  ClientWidth = 209
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 209
    Height = 81
    Align = alTop
    Caption = 'Тарих'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 31
      Height = 13
      Caption = 'Яввял:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 48
      Width = 22
      Height = 13
      Caption = 'Сон:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object EndDateEdit: TDateTimePicker
      Left = 72
      Top = 46
      Width = 137
      Height = 21
      CalAlignment = dtaLeft
      Date = 37359.7596522569
      Time = 37359.7596522569
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object StartDateEdit: TDateTimePicker
      Left = 72
      Top = 16
      Width = 135
      Height = 21
      CalAlignment = dtaLeft
      Date = 39002.9640484491
      Time = 39002.9640484491
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
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
