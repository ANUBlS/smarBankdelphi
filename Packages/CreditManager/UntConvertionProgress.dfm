object FrmProgress: TFrmProgress
  Left = 365
  Top = 264
  AutoSize = True
  BorderStyle = bsDialog
  Caption = 'Percent Convertion in Progress...'
  ClientHeight = 249
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 389
    Height = 138
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 2
      Top = 12
      Width = 74
      Height = 13
      Caption = 'Ã÷√¿¬»Àﬂ ...  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LblResult: TLabel
      Left = 6
      Top = 116
      Width = 72
      Height = 13
      Caption = '   Errors Found.'
    end
    object BtnDetails: TButton
      Left = 309
      Top = 105
      Width = 75
      Height = 25
      Caption = 'Details...'
      Enabled = False
      TabOrder = 0
      OnClick = BtnDetailsClick
    end
    object ProgressBar: TProgressBar
      Left = 3
      Top = 51
      Width = 382
      Height = 20
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 1
    end
    object CurrentContractLabel: TStaticText
      Left = 80
      Top = 12
      Width = 104
      Height = 17
      Caption = 'CurrentContractLabel'
      TabOrder = 2
    end
  end
  object NoteMemo: TMemo
    Left = 0
    Top = 138
    Width = 389
    Height = 111
    Align = alTop
    Color = clMenu
    Lines.Strings = (
      '')
    TabOrder = 1
  end
end
