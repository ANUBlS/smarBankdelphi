object CO_St_Form: TCO_St_Form
  Left = 578
  Top = 422
  BorderStyle = bsDialog
  Caption = 'Hesabdan '#231#305'xar'#305#351
  ClientHeight = 105
  ClientWidth = 182
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 182
    Height = 105
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 120
    object Button1: TButton
      Left = 56
      Top = 72
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
      Left = 13
      Top = 39
      Width = 156
      Height = 17
      Caption = 'M'#252#351't'#601'ri koduna g'#246'r'#601
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Chck1: TRadioButton
      Left = 13
      Top = 16
      Width = 156
      Height = 17
      Caption = 'Hesab n'#246'mr'#601'sin'#601' g'#246'r'#601
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
end
