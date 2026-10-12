object AccFlags: TAccFlags
  Left = 192
  Top = 107
  Width = 228
  Height = 304
  Caption = 'AccFlags'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CLBAccFlags: TCheckListBox
    Left = 0
    Top = 0
    Width = 220
    Height = 233
    Align = alTop
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 0
  end
  object ButtonApply: TButton
    Left = 73
    Top = 242
    Width = 75
    Height = 25
    Caption = '&OK'
    ModalResult = 1
    TabOrder = 1
    OnClick = ButtonApplyClick
  end
end
