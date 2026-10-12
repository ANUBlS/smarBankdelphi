object IcraFrm: TIcraFrm
  Left = 0
  Top = 0
  ClientHeight = 492
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 442
    Height = 57
    Align = alTop
    Caption = 'Tarix aral'#305#287#305
    TabOrder = 0
    ExplicitWidth = 464
    object Label1: TLabel
      Left = 121
      Top = 27
      Width = 6
      Height = 16
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DateTimePicker1: TDateTimePicker
      Left = 9
      Top = 24
      Width = 104
      Height = 21
      Date = 43024.492603078700000000
      Time = 43024.492603078700000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 138
      Top = 24
      Width = 104
      Height = 21
      Date = 43024.492603078700000000
      Time = 43024.492603078700000000
      TabOrder = 1
    end
    object Button1: TButton
      Left = 257
      Top = 21
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Hesabla'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 352
      Top = 21
      Width = 75
      Height = 25
      Caption = 'Excel'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object XDBGrid1: TXDBGrid
    Left = 0
    Top = 57
    Width = 442
    Height = 435
    Align = alClient
    DataSource = PRDataModule.DataSource12
    GridStyle.VisualStyle = vsXPStyle
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgExtendedSelect, dgInternalSelect, dgRowResize, dgRowScroll, dgHotButtons, dgTitleButtons, dgTitleHeaders, dgTitleWidthOff, dgMarkerAutoAlign, dgMarkerAutoToggle]
    TabOrder = 1
    OnDblClick = XDBGrid1DblClick
    Columns = <
      item
        AutoNumber = True
        Expanded = False
        Visible = True
        Width = 25
      end
      item
        Expanded = False
        FieldName = 'USERS'
        Visible = True
        Width = 191
      end
      item
        Expanded = False
        FieldName = 'PLANS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'YGIM_ESAS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BONS_ESAS'
        Visible = True
        Width = 67
      end
      item
        Expanded = False
        FieldName = 'YGIM_FAIZ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BONS_FAIZ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEMB'
        Visible = True
      end>
  end
  object ExcelExport: TCMExcelExport
    ConnectTo = ctNewInstance
    StyleColumnWidth = cwAutoFit
    ColumnWidth = 0
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'Azl Sans Serif'
    FontTitles.Style = []
    OrientationTitles = 0
    FontData.Charset = DEFAULT_CHARSET
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
    Left = 304
    Top = 128
  end
end
