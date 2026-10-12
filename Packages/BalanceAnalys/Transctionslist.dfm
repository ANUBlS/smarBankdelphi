object TransactionLists: TTransactionLists
  Left = 0
  Top = 0
  Caption = 'TransactionList'
  ClientHeight = 360
  ClientWidth = 984
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
  object gridtransactions: TDBGrid
    Left = 0
    Top = 0
    Width = 984
    Height = 360
    Align = alClient
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ExcelExporter: TExcelExporter
    ShowTitles = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 850
    Top = 201
  end
  object PopupMenu1: TPopupMenu
    Left = 416
    Top = 136
    object ExcelExport1: TMenuItem
      Caption = 'Excel Export'
      OnClick = ExcelExport1Click
    end
  end
end
