object FormTransactions: TFormTransactions
  Left = 0
  Top = 0
  ClientHeight = 383
  ClientWidth = 1007
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1007
    Height = 383
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 80
    ExplicitTop = 72
    ExplicitWidth = 185
    ExplicitHeight = 41
    object XDBGrid1: TXDBGrid
      Left = 1
      Top = 1
      Width = 1005
      Height = 381
      Align = alClient
      GridStyle.VisualStyle = vsXPStyle
      TabOrder = 0
    end
  end
end
