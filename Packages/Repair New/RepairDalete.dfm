object RepDelete: TRepDelete
  Left = 368
  Top = 274
  Width = 292
  Height = 162
  Caption = 'Delete'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 284
    Height = 102
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 282
      Height = 100
      Align = alClient
      Caption = 'ям€лиййатын силинм€си'
      TabOrder = 0
      object Label1: TLabel
        Left = 80
        Top = 24
        Width = 104
        Height = 13
        Caption = 'ям€лиййат силинсин?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 3
        Top = 48
        Width = 273
        Height = 48
        Shape = bsFrame
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 102
    Width = 284
    Height = 33
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 128
      Top = 4
      Width = 74
      Height = 24
      Caption = '√€бул'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 205
      Top = 4
      Width = 74
      Height = 24
      Caption = '»мтина'
      TabOrder = 1
    end
    object Animate1: TAnimate
      Left = 8
      Top = 8
      Width = 16
      Height = 16
      Active = False
      CommonAVI = aviFindComputer
      StopFrame = 8
      Visible = False
    end
  end
end
