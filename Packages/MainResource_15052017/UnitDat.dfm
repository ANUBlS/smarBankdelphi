object FormDat: TFormDat
  Left = 1173
  Top = 417
  BorderStyle = bsDialog
  Caption = 'FormDat'
  ClientHeight = 218
  ClientWidth = 156
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 156
    Height = 218
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 114
      Height = 14
      Caption = #1040#1084#1086#1088#1090#1080#1079#1072#1089#1080#1081#1072' '#1090#1072#1088#1080#1093#1080
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DTPBegin: TDateTimePicker
      Left = 8
      Top = 24
      Width = 137
      Height = 21
      Date = 38917.811213078700000000
      Time = 38917.811213078700000000
      TabOrder = 0
    end
    object DTPEnd: TDateTimePicker
      Left = 8
      Top = 48
      Width = 137
      Height = 21
      Date = 38917.811323657400000000
      Time = 38917.811323657400000000
      TabOrder = 1
    end
    object ButtonOk: TButton
      Left = 8
      Top = 189
      Width = 137
      Height = 25
      Caption = 'Icra et....'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = ButtonOkClick
    end
    object RadioGExcel: TRadioGroup
      Left = 8
      Top = 72
      Width = 137
      Height = 113
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Maliyy'#1103
        'Vergi'
        #1065#1103#1088' '#1080#1082#1080#1089#1080)
      ParentFont = False
      TabOrder = 3
    end
  end
end
