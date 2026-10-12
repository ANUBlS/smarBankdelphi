object FormBussProc_type: TFormBussProc_type
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 86
  ClientWidth = 209
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 0
    Width = 209
    Height = 86
    Align = alClient
    BevelInner = bvLowered
    BevelKind = bkFlat
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitWidth = 258
    ExplicitHeight = 133
    object XFRadioGroup1: TXFRadioGroup
      Left = 13
      Top = 8
      Width = 179
      Height = 65
      Caption = 'Fiziki '#351#601'xs v'#601' Sahibkar '#252#231#252'n Se'#231'im'
      Items.Strings = (
        '   Fiziki '#351#601'xs'
        '   Fiziki sahibkar')
      TabOrder = 0
      Visible = False
      OnClick = XFRadioGroup1Click
    end
  end
end
