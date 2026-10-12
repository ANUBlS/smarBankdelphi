object Transfer: TTransfer
  Left = 423
  Top = 185
  Width = 262
  Height = 262
  Caption = 'Transfer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object TPanel
    Left = 0
    Top = 0
    Width = 254
    Height = 235
    Align = alClient
    TabOrder = 0
    object Button1: TButton
      Left = 88
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Account'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 88
      Top = 96
      Width = 75
      Height = 25
      Caption = 'Provarch'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 88
      Top = 144
      Width = 75
      Height = 25
      Caption = 'Archost'
      TabOrder = 2
    end
  end
end
