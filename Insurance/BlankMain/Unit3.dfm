object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Bonus Report'
  ClientHeight = 124
  ClientWidth = 193
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
  object Edit1: TEdit
    Left = 8
    Top = 35
    Width = 177
    Height = 21
    TabOrder = 0
    TextHint = 'Debet Balans'
  end
  object Edit2: TEdit
    Left = 8
    Top = 62
    Width = 177
    Height = 21
    TabOrder = 1
    TextHint = 'Kredit Balans '
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 8
    Width = 81
    Height = 21
    Date = 43580.539010671300000000
    Time = 43580.539010671300000000
    TabOrder = 2
  end
  object DateTimePicker2: TDateTimePicker
    Left = 104
    Top = 8
    Width = 81
    Height = 21
    Date = 43580.539010671300000000
    Time = 43580.539010671300000000
    TabOrder = 3
  end
  object Button1: TButton
    Left = 56
    Top = 89
    Width = 75
    Height = 25
    Caption = 'Excel'
    TabOrder = 4
    OnClick = Button1Click
  end
  object ExcelExport: TCMExcelExport
    StyleColumnWidth = cwAutoFit
    ColumnWidth = 0
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'Tahoma'
    FontTitles.Style = []
    OrientationTitles = 0
    FontData.Charset = DEFAULT_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Tahoma'
    FontData.Style = []
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Tahoma'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 16
    Top = 88
  end
end
