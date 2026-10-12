object Form_ExcelSheets: TForm_ExcelSheets
  Left = 0
  Top = 0
  ClientHeight = 295
  ClientWidth = 220
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
    Top = 248
    Width = 220
    Height = 47
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 0
    object Button1: TButton
      Left = 48
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 160
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 1
    end
  end
  object CheckListBox1: TCheckListBox
    Left = 0
    Top = 0
    Width = 220
    Height = 248
    Align = alClient
    ItemHeight = 13
    TabOrder = 1
  end
end
