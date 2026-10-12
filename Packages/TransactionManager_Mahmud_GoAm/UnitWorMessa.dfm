object FormWorMessag: TFormWorMessag
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 59
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 66
    Width = 694
    Height = 18
    Caption = 
      #399'm'#601'liyyat W'#246'rldChek Moduluna g'#246'nd'#601'rildi   Z'#601'hm'#601't olmasa departem' +
      'nete  m'#252'raci'#601't edin     !  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 528
    Height = 59
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    Lines.Strings = (
      #399'm'#601'liyyat WorldCheck Moduluna g'#246'nd'#601'rildi   '
      'Z'#601'hm'#601't olmasa departement'#601'  m'#252'raci'#601't edin     !  ')
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 681
    ExplicitHeight = 242
  end
  object Timer1: TTimer
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 200
  end
end
