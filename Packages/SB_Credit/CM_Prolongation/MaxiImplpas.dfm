object MaxiFrm: TMaxiFrm
  Left = 373
  Top = 220
  Caption = 'MaxiCard uzad'#305'lma'
  ClientHeight = 64
  ClientWidth = 283
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 2
    Top = 12
    Width = 112
    Height = 14
    Caption = 'Uzad'#305'lma m'#252'dd'#601'ti:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 121
    Top = 8
    Width = 163
    Height = 21
    Alignment = taCenter
    EditButtons = <>
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = ProlongDataMod.DataSource1
    TabOrder = 0
    Visible = True
  end
  object BitBtn1: TBitBtn
    Left = 121
    Top = 35
    Width = 75
    Height = 25
    Caption = 'Q'#601'bul'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 202
    Top = 35
    Width = 75
    Height = 25
    Caption = #304'mtina'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = BitBtn2Click
  end
end
