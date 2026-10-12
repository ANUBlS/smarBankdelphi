object SelDirFrm: TSelDirFrm
  Left = 451
  Top = 192
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 307
  ClientWidth = 158
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DirectoryListBox1: TDirectoryListBox
    Left = 1
    Top = 24
    Width = 154
    Height = 257
    Color = clWhite
    ItemHeight = 16
    TabOrder = 0
  end
  object DriveComboBox1: TDriveComboBox
    Left = 2
    Top = 2
    Width = 156
    Height = 19
    DirList = DirectoryListBox1
    TabOrder = 1
    OnChange = DriveComboBox1Change
  end
  object But_Ok: TBitBtn
    Left = 16
    Top = 284
    Width = 58
    Height = 20
    Caption = '√€бул ет'
    TabOrder = 2
    OnClick = But_OkClick
  end
  object But_cancel: TBitBtn
    Left = 85
    Top = 284
    Width = 58
    Height = 20
    Caption = '»мтина'
    TabOrder = 3
    OnClick = But_cancelClick
  end
  object ApplicationEvents1: TApplicationEvents
    Left = 48
    Top = 88
  end
end
