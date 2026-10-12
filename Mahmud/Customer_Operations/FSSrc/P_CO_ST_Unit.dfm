object P_CO_ST: TP_CO_ST
  Left = 488
  Top = 307
  BorderStyle = bsDialog
  ClientHeight = 85
  ClientWidth = 144
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 144
    Height = 85
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 29
      Top = 6
      Width = 106
      Height = 13
      Caption = 'Щесаб нюмрясиня эюря'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 29
      Top = 29
      Width = 97
      Height = 13
      Caption = 'Мцштяри кодуна эюря'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 32
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Гябул'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Chck2: TRadioButton
      Left = 6
      Top = 29
      Width = 17
      Height = 17
      Caption = 'Chck2'
      TabOrder = 1
    end
    object Chck1: TRadioButton
      Left = 6
      Top = 5
      Width = 19
      Height = 17
      Caption = 'Chck1'
      TabOrder = 2
    end
  end
end
