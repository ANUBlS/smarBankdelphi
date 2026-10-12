object RefEditForm: TRefEditForm
  Left = 296
  Top = 396
  Width = 464
  Height = 234
  Caption = 'RefEditForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 456
    Height = 29
    Caption = 'ToolBar1'
    EdgeBorders = [ebBottom]
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 2
      Width = 240
      Height = 22
      Flat = True
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 29
    Width = 456
    Height = 178
    Align = alClient
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
end
