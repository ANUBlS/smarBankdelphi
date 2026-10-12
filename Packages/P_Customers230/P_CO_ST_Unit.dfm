object P_CO_ST: TP_CO_ST
  Left = 580
  Top = 406
  Caption = 'Hesabdan '#231#305'xar'#305#351
  ClientHeight = 99
  ClientWidth = 202
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 202
    Height = 99
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 164
    ExplicitHeight = 126
    object Button1: TButton
      Left = 66
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Chck2: TRadioButton
      Left = 26
      Top = 39
      Width = 144
      Height = 17
      Caption = 'M'#252#351't'#601'ri koduna g'#246'r'#601
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Chck1: TRadioButton
      Left = 26
      Top = 16
      Width = 152
      Height = 17
      Caption = 'Hesab n'#246'mr'#601'sin'#601' g'#246'r'#601
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
end
