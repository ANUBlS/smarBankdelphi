object FrmLogReport: TFrmLogReport
  Left = 0
  Top = 0
  Caption = 'FrmLogReport'
  ClientHeight = 169
  ClientWidth = 213
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 48
    Top = 143
    Width = 75
    Height = 25
    Caption = 'Q'#601'bul'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 129
    Top = 143
    Width = 75
    Height = 25
    Caption = 'ba'#287'la'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 213
    Height = 73
    Align = alTop
    Caption = 'Tarix aral'#305#287#305
    TabOrder = 2
    ExplicitWidth = 259
    object DateTimePicker2: TDateTimePicker
      Left = 7
      Top = 45
      Width = 186
      Height = 21
      Date = 41410.427078807870000000
      Time = 41410.427078807870000000
      TabOrder = 0
    end
    object DateTimePicker1: TDateTimePicker
      Left = 6
      Top = 19
      Width = 186
      Height = 21
      Date = 41410.426987118060000000
      Time = 41410.426987118060000000
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 2
    Top = 79
    Width = 210
    Height = 58
    Caption = 'Filial se'#231'imi'
    TabOrder = 3
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 4
      Top = 24
      Width = 181
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = admDM.DataSource1
      TabOrder = 0
    end
  end
  object MisExcelExport: TCMExcelExport
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
    FontSummary.Charset = RUSSIAN_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Azl Sans Serif'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 116
    Top = 67
  end
end
