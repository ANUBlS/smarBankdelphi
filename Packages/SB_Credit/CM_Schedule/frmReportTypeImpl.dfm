object frmReportType: TfrmReportType
  Left = 338
  Top = 292
  BorderIcons = [biSystemMenu]
  ClientHeight = 100
  ClientWidth = 172
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object RGReport: TRadioGroup
    Left = 0
    Top = 0
    Width = 172
    Height = 66
    Align = alTop
    Caption = 'Se'#231'im'
    ItemIndex = 0
    Items.Strings = (
      'Hesabat'
      'Exel')
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 91
    Top = 72
    Width = 75
    Height = 25
    Caption = #304'mtina'
    DoubleBuffered = True
    Kind = bkCancel
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 10
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Q'#601'bul'
    DoubleBuffered = True
    Kind = bkOK
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object ExcelExport: TCMExcelExport
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontTitles.Charset = RUSSIAN_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'Azl Sans Serif'
    FontTitles.Style = []
    OrientationTitles = 0
    FontData.Charset = RUSSIAN_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Azl Sans Serif'
    FontData.Style = []
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'MS Sans Serif'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 165
    Top = 330
  end
end
