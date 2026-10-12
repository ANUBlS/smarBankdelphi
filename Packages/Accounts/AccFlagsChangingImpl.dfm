object AccFlagsForm: TAccFlagsForm
  Left = 227
  Top = 115
  BorderStyle = bsDialog
  Caption = 'Account Flags'
  ClientHeight = 275
  ClientWidth = 216
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object CLBAccFlags: TCheckListBox
    Left = 0
    Top = 0
    Width = 216
    Height = 233
    OnClickCheck = CLBAccFlagsClickCheck
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
  object ApplyButton: TButton
    Left = 73
    Top = 242
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 1
    OnClick = ApplyButtonClick
  end
end
