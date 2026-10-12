object StartEndDateInputForm: TStartEndDateInputForm
  Left = 340
  Top = 229
  Width = 239
  Height = 142
  Caption = 'StartEndDateInputForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 231
    Height = 81
    Align = alTop
    Caption = 'Dates'
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 25
      Height = 13
      Caption = 'Start:'
    end
    object Label2: TLabel
      Left = 24
      Top = 48
      Width = 22
      Height = 13
      Caption = 'End:'
    end
    object StartDateEdit: TDateTimePicker
      Left = 72
      Top = 22
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
      TabOrder = 1
    end
  end
  object OkButton: TButton
    Left = 72
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Ok'
    Default = True
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TButton
    Left = 152
    Top = 88
    Width = 75
    Height = 25
    Caption = '&Cancel'
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
