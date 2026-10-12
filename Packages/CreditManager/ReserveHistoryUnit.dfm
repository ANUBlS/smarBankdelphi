object FrmHistory: TFrmHistory
  Left = 400
  Top = 231
  BorderStyle = bsDialog
  Caption = 'Export History '
  ClientHeight = 91
  ClientWidth = 181
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 181
    Height = 53
    Align = alTop
    Caption = 'TARIX'
    TabOrder = 0
    object DTPTargetDate: TDateTimePicker
      Left = 22
      Top = 21
      Width = 136
      Height = 21
      CalAlignment = dtaLeft
      Date = 37894.5187805093
      Time = 37894.5187805093
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
  end
  object BtnExport: TButton
    Left = 54
    Top = 59
    Width = 75
    Height = 25
    Caption = 'O&K'
    TabOrder = 1
    OnClick = BtnExportClick
  end
  object HistoryExporter: TExcelExporter
    ExportSource = ContDataModule.DataSrcReserve
    SheetName = 'Credits History'
    ShowTitles = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial AzLat'
    Font.Style = []
    Left = 16
    Top = 40
  end
end
