object FormPyhsFs: TFormPyhsFs
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Fiziki '#350#601'xs v'#601' Sahibkar'
  ClientHeight = 71
  ClientWidth = 182
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 0
    Width = 182
    Height = 71
    Align = alClient
    TabOrder = 0
    object XFRadioGroupPhysFs: TXFRadioGroup
      Left = 1
      Top = 1
      Width = 180
      Height = 69
      Align = alClient
      Caption = 'Fiziki '#351#601'xs v'#601' Fiziki sahibkar'
      Items.Strings = (
        '   '
        '  Fiziki '#351#601'x'
        '   Fiziki sahibkar')
      TabOrder = 0
      OnClick = XFRadioGroupPhysFsClick
    end
  end
end
