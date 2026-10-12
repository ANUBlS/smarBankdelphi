object Tranches_AddEditForm: TTranches_AddEditForm
  Left = 343
  Top = 211
  Width = 273
  Height = 147
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 101
    Top = 88
    Width = 77
    Height = 24
    Caption = 'Гябул'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 184
    Top = 89
    Width = 76
    Height = 24
    OnClick = SpeedButton2Click
  end
  object EditAmount: TEdit
    Left = 16
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'EditAmount'
  end
  object DateTimePicker: TDateTimePicker
    Left = 16
    Top = 40
    Width = 121
    Height = 21
    CalAlignment = dtaLeft
    Date = 38588.7860170718
    Time = 38588.7860170718
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
end
