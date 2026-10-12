object ExcelCheck: TExcelCheck
  Left = 0
  Top = 0
  Caption = 'Sheet-i se'#231'in...'
  ClientHeight = 260
  ClientWidth = 215
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
    Width = 215
    Height = 219
    Align = alClient
    TabOrder = 0
    object CheckListBox1: TCheckListBox
      Left = 1
      Top = 1
      Width = 213
      Height = 217
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object XFPanel2: TXFPanel
    Left = 0
    Top = 219
    Width = 215
    Height = 41
    Align = alBottom
    TabOrder = 1
    object XFButton1: TXFButton
      Left = 64
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = XFButton1Click
    end
  end
end
