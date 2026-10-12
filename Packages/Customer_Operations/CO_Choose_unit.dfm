object CO_Choose: TCO_Choose
  Left = 830
  Top = 484
  BorderStyle = bsSizeToolWin
  ClientHeight = 113
  ClientWidth = 156
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
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
    Width = 156
    Height = 113
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Button1: TButton
      Left = 34
      Top = 78
      Width = 81
      Height = 26
      Caption = '&'#1043#1103#1073#1091#1083
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object ch_1: TCheckBox
      Left = 34
      Top = 17
      Width = 96
      Height = 19
      Caption = ' Debet '#252'zr'#601
      TabOrder = 1
    end
    object ch_2: TCheckBox
      Left = 36
      Top = 42
      Width = 94
      Height = 18
      Caption = ' Kredit '#252'zr'#601
      TabOrder = 2
    end
  end
end
