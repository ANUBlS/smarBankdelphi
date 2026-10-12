object FrmPrint: TFrmPrint
  Left = 369
  Top = 240
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Report'
  ClientHeight = 110
  ClientWidth = 201
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 110
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 199
      Height = 108
      Align = alClient
      Caption = #1063#1072#1087' '#1092#1086#1088#1084#1072#1089#1099
      TabOrder = 0
      object RBTotal: TRadioButton
        Tag = 1
        Left = 9
        Top = 24
        Width = 109
        Height = 18
        Caption = ' '#1049#1077#1082#1091#1085' '#1097#1077#1089#1072#1073#1072#1090
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = RBTotalClick
      end
      object RBExpand: TRadioButton
        Tag = 2
        Left = 9
        Top = 52
        Width = 107
        Height = 18
        Caption = ' '#1040#1088#1076#1099#1078#1099#1083' '#1097#1077#1089#1072#1073#1072#1090
        TabOrder = 1
        OnClick = RBTotalClick
      end
      object BPrint: TBitBtn
        Tag = 1
        Left = 9
        Top = 74
        Width = 58
        Height = 27
        Caption = #1063#1072#1087
        Default = True
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 2
        OnClick = BPrintClick
      end
      object BCancel: TBitBtn
        Left = 134
        Top = 74
        Width = 58
        Height = 27
        Caption = '&'#1048#1084#1090#1080#1085#1072
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 3
        OnClick = BCancelClick
      end
      object BitBtn1: TBitBtn
        Tag = 2
        Left = 71
        Top = 74
        Width = 58
        Height = 27
        Caption = '&Excel'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 4
        OnClick = BPrintClick
      end
    end
  end
  object ExcelExporter: TExcelExporter
    ExportSource = ExchangeDataMod.DataExcel
    ShowTitles = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 129
    Top = 17
  end
end
