object Form1: TForm1
  Left = 419
  Top = 215
  Width = 236
  Height = 124
  Caption = 'Password set dialog'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 228
    Height = 69
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 25
      Height = 13
      Caption = 'Retry'
    end
    object MaskEdit1: TMaskEdit
      Left = 96
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'MaskEdit1'
    end
    object MaskEdit2: TMaskEdit
      Left = 96
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'MaskEdit2'
    end
  end
  object Button1: TButton
    Left = 72
    Top = 71
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Set'
    Default = True
    TabOrder = 1
  end
  object Button2: TButton
    Left = 152
    Top = 71
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Cancel'
    TabOrder = 2
  end
end
