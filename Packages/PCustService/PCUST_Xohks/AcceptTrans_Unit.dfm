object FormAcceptTransaction: TFormAcceptTransaction
  Left = 746
  Top = 603
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ReAccept'
  ClientHeight = 124
  ClientWidth = 255
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    255
    124)
  PixelsPerInch = 96
  TextHeight = 14
  object SpeedButton1: TSpeedButton
    Left = 47
    Top = 97
    Width = 73
    Height = 24
    Anchors = [akRight, akBottom]
    Caption = 'Q'#601'bul'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 134
    Top = 97
    Width = 72
    Height = 24
    Anchors = [akRight, akBottom]
    Caption = #304'mtina'
    OnClick = SpeedButton2Click
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 255
    Height = 53
    Align = alTop
    TabOrder = 0
    object SpeedButton3: TSpeedButton
      Left = 221
      Top = 23
      Width = 25
      Height = 20
      Caption = '...'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton3Click
    end
    object Edit_Referens: TEdit
      Left = 24
      Top = 22
      Width = 195
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier'
      Font.Style = []
      MaxLength = 16
      ParentFont = False
      TabOrder = 0
      OnKeyPress = Edit_ReferensKeyPress
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 53
    Width = 255
    Height = 39
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object CheckBox1: TCheckBox
      Left = 25
      Top = 9
      Width = 130
      Height = 18
      Caption = #399'm'#601'liyyat apar'#305'ls'#305'n'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object CheckBox2: TCheckBox
    Left = 24
    Top = 0
    Width = 158
    Height = 18
    Caption = 'Qeydiyyat '#8470' : (D'#601'yi'#351'dirilsin)'
    Checked = True
    State = cbChecked
    TabOrder = 2
    OnClick = CheckBox2Click
  end
end
