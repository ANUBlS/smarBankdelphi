object FrmProgress: TFrmProgress
  Left = 282
  Top = 355
  BorderStyle = bsNone
  Caption = 'Please wait..........'
  ClientHeight = 81
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PrBarChild: TProgressBar
    Left = 0
    Top = 56
    Width = 409
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 0
  end
  object PrBarMain: TProgressBar
    Left = 0
    Top = 24
    Width = 401
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 1
  end
end
