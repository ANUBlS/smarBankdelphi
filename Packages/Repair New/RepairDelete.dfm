object RepDelete: TRepDelete
  Left = 396
  Top = 222
  BorderStyle = bsDialog
  Caption = 'Delete'
  ClientHeight = 125
  ClientWidth = 275
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 275
    Height = 89
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 273
      Height = 87
      Align = alClient
      Caption = #399'm'#601'liyyatlar'#305'n silinm'#601'si '
      TabOrder = 0
      object Bevel1: TBevel
        Left = 2
        Top = 38
        Width = 269
        Height = 47
        Align = alBottom
        Shape = bsFrame
        ExplicitWidth = 268
      end
      object chRate: TCheckBox
        Left = 18
        Top = 43
        Width = 165
        Height = 18
        Caption = 'M'#601'z'#601'nn'#601' f'#601'rqi hesablans'#305'n'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chProfit: TCheckBox
        Left = 18
        Top = 61
        Width = 131
        Height = 19
        Caption = 'G'#601'lir-Z'#601'r'#601'r ba'#287'lans'#305'n'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object StaticText1: TStaticText
        Left = 80
        Top = 17
        Width = 110
        Height = 19
        Caption = #399'm'#601'liyyat silinsin?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 275
    Height = 36
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      275
      36)
    object Button1: TButton
      Left = 109
      Top = 5
      Width = 77
      Height = 26
      Anchors = [akTop, akRight]
      Caption = 'Q'#601'bul'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 192
      Top = 4
      Width = 77
      Height = 26
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #304'mtina'
      ModalResult = 2
      TabOrder = 1
    end
    object DelAnim: TAnimate
      Left = 9
      Top = 9
      Width = 16
      Height = 16
      CommonAVI = aviFindComputer
      StopFrame = 8
    end
  end
end
