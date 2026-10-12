object ExportForm: TExportForm
  Left = 339
  Top = 134
  AutoSize = True
  BorderStyle = bsDialog
  ClientHeight = 293
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 297
    Height = 293
    Align = alClient
    Caption = 'Panel'
    TabOrder = 0
    object CLBExportList: TCheckListBox
      Left = 1
      Top = 1
      Width = 295
      Height = 248
      Align = alTop
      ItemHeight = 13
      TabOrder = 0
    end
    object ExpButton: TButton
      Left = 202
      Top = 261
      Width = 75
      Height = 25
      Caption = 'O&K'
      TabOrder = 1
      OnClick = ExpButtonClick
    end
  end
  object BalanceExporter: TExcelExporter
    ExportSource = DataModuleMain.DataSrcMain
    SheetName = 'FullBalance'
    ShowTitles = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 162
    Top = 47
  end
end
