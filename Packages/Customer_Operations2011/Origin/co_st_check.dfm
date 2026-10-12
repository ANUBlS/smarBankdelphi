object CO_St_Form: TCO_St_Form
  Left = 417
  Top = 295
  BorderStyle = bsDialog
  Caption = 'CO_St_Form'
  ClientHeight = 120
  ClientWidth = 182
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 182
    Height = 120
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 45
      Top = 14
      Width = 106
      Height = 13
      Caption = 'Щесаб нюмрясиня эюря'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Label1Click
    end
    object Label2: TLabel
      Left = 45
      Top = 37
      Width = 97
      Height = 13
      Caption = 'Мцштяри кодуна эюря'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Label2Click
    end
    object Button1: TButton
      Left = 56
      Top = 72
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
      Left = 22
      Top = 37
      Width = 17
      Height = 17
      Caption = 'Chck2'
      TabOrder = 1
    end
    object Chck1: TRadioButton
      Left = 22
      Top = 13
      Width = 17
      Height = 17
      Caption = 'Chck1'
      TabOrder = 2
    end
  end
end
