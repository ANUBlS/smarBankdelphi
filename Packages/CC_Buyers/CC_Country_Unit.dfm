object CC_Country: TCC_Country
  Left = 903
  Top = 259
  Caption = #1070#1083#1082#1103
  ClientHeight = 98
  ClientWidth = 150
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
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
    Width = 150
    Height = 98
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 148
      Height = 49
      Align = alTop
      Caption = #1040#1076#1099
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object EditCountry: TEdit
        Left = 16
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 0
      end
    end
    object BitBtn1: TBitBtn
      Left = 40
      Top = 56
      Width = 75
      Height = 25
      DoubleBuffered = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Kind = bkOK
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
end
