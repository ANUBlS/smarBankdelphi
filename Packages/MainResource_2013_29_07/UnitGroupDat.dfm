object FormGroupDat: TFormGroupDat
  Left = 1108
  Top = 351
  AutoSize = True
  Caption = 'Group'
  ClientHeight = 164
  ClientWidth = 146
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
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 146
    Height = 164
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object BtnOk: TBitBtn
      Left = 5
      Top = 142
      Width = 136
      Height = 26
      Caption = 'Icra et'
      DoubleBuffered = True
      Glyph.Data = {
        36010000424D3601000000000000760000002800000015000000100000000100
        040000000000C000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333000333333333333333333333000338FF3FF3333333333333000338C
        F38CFF33333333333000338CF38CCCFF333333333000338CF38CCCCCFF333333
        3000338CF38CCCCCCCFF33333000338CF38CCCCCCCCCFF333000338CF38CCCCC
        CCCC88F33000338CF38CCCCCCC8833333000338CF38CCCCC883333333000338C
        F38CCC88333333333000338CF38C88333333333330003388F388333333333333
        3000333333333333333333333000333333333333333333333000}
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object DTPDat: TDateTimePicker
      Left = 5
      Top = 3
      Width = 137
      Height = 21
      Date = 39009.105513055600000000
      Time = 39009.105513055600000000
      TabOrder = 1
    end
    object RGroupCh: TRadioGroup
      Left = 4
      Top = 42
      Width = 139
      Height = 97
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        #1052#1072#1083#1080#1081#1081#1103
        #1042#1077#1088#1101#1080)
      ParentFont = False
      TabOrder = 2
    end
    object DTPEndDat: TDateTimePicker
      Left = 4
      Top = 24
      Width = 136
      Height = 21
      Date = 39016.995426250000000000
      Time = 39016.995426250000000000
      TabOrder = 3
    end
  end
end
