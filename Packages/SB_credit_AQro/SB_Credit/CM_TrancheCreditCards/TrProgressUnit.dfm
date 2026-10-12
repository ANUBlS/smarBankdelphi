object TrProgressForm: TTrProgressForm
  Left = 340
  Top = 369
  Width = 440
  Height = 42
  BorderIcons = []
  Caption = 'TrProgressForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object TrPrB: TProgressBar
    Left = 0
    Top = 0
    Width = 432
    Height = 15
    Align = alClient
    Min = 0
    Max = 100
    TabOrder = 0
  end
end
