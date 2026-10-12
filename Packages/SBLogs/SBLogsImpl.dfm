object SBLogs: TSBLogs
  Left = 313
  Top = 221
  Width = 870
  Height = 640
  Caption = 'SBLogs'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 613
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 2
      Top = 158
      Width = 858
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 161
      Width = 858
      Height = 423
      Align = alClient
      DataSource = DataModuleLogs.LogTable
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
    end
    object DBGrid2: TDBGrid
      Left = 2
      Top = 2
      Width = 858
      Height = 156
      Align = alTop
      DataSource = DataModuleLogs.Tables
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid2CellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRT'
          Title.Caption = 'Úóðíàë'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 822
          Visible = True
        end>
    end
    object CoolBar1: TCoolBar
      Left = 2
      Top = 584
      Width = 858
      Height = 27
      Align = alBottom
      AutoSize = True
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          MinHeight = 23
          Width = 854
        end>
      object ToolBar1: TToolBar
        Left = 9
        Top = 0
        Width = 841
        Height = 23
        AutoSize = True
        ButtonHeight = 21
        ButtonWidth = 42
        Caption = 'ToolBar1'
        Flat = True
        ShowCaptions = True
        TabOrder = 0
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Caption = 'Yenilÿ'
          ImageIndex = 0
          OnClick = ToolButton1Click
        end
        object ToolButton3: TToolButton
          Left = 42
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object dt1: TDateTimePicker
          Left = 50
          Top = 0
          Width = 88
          Height = 21
          CalAlignment = dtaLeft
          Date = 39320.5340313889
          Time = 39320.5340313889
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
        end
        object dt2: TDateTimePicker
          Left = 138
          Top = 0
          Width = 86
          Height = 21
          CalAlignment = dtaLeft
          Date = 39320.5341172917
          Time = 39320.5341172917
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 1
        end
        object ToolButton2: TToolButton
          Left = 224
          Top = 0
          Caption = 'Filter'
          ImageIndex = 1
          OnClick = ToolButton2Click
        end
        object ToolButton4: TToolButton
          Left = 266
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object ToolButton5: TToolButton
          Left = 274
          Top = 0
          Caption = 'Ñèë'
          ImageIndex = 2
          OnClick = ToolButton5Click
        end
        object ToolButton6: TToolButton
          Left = 316
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object ToolButton7: TToolButton
          Left = 324
          Top = 0
          Caption = 'Èõðàæ åò'
          ImageIndex = 3
          OnClick = ToolButton7Click
        end
      end
    end
  end
  object ExcelExport: TCMExcelExport
    StyleColumnWidth = cwAutoFit
    ColumnWidth = 0
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'Arial AzLat'
    FontTitles.Style = [fsBold]
    OrientationTitles = 0
    FontData.Charset = DEFAULT_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Arial AzLat'
    FontData.Style = []
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Arial AzLat'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 328
    Top = 280
  end
end
