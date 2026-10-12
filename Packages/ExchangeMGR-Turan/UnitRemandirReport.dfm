object FormRemandirReport: TFormRemandirReport
  Left = 0
  Top = 0
  ClientHeight = 281
  ClientWidth = 391
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object frxPreview1: TfrxPreview
    Left = 0
    Top = 0
    Width = 391
    Height = 281
    Align = alClient
    OutlineVisible = True
    OutlineWidth = 121
    ThumbnailVisible = False
    UseReportHints = True
  end
  object frxReportRem: TfrxReport
    Version = '5.1.10'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41920.507489270800000000
    ReportOptions.LastChange = 41920.507489270800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 48
    Top = 80
    Datasets = <
      item
        DataSet = DataModExch.frxDBDataset5
        DataSetName = 'frxDBDataset5'
      end
      item
        DataSet = DataModExch.frxDBDataset6
        DataSetName = 'frxDBDataset6'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 279.400000000000000000
      PaperHeight = 215.900000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 40.000000000000000000
        Top = 18.897650000000000000
        Width = 980.410081999999900000
        object Memo2: TfrxMemoView
          Left = 784.000000000000000000
          Top = 21.000000000000000000
          Width = 36.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'VDM:')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Align = baCenter
          Left = 328.205040999999900000
          Top = 4.000000000000000000
          Width = 324.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '                         VDM-in Qal'#305'qlar'#305)
          ParentFont = False
        end
        object SysMemo9: TfrxSysMemoView
          Left = 825.000000000000000000
          Top = 20.000000000000000000
          Width = 152.000000000000000000
          Height = 16.000000000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[(<frxDBDataset6."EX_NAME">)]')
          ParentFont = False
        end
        object SysMemo10: TfrxSysMemoView
          Left = 48.322820000000000000
          Top = 21.000000000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset5."DAT"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 5.897650000000000000
          Top = 21.456710000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tarix:')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 32.000000000000000000
        Top = 83.149660000000000000
        Width = 980.410081999999900000
        object Shape1: TfrxShapeView
          Left = 4.000000000000000000
          Width = 974.110390000000000000
          Height = 32.000000000000000000
          Frame.Width = 2.000000000000000000
        end
        object Line1: TfrxLineView
          Left = 78.000000000000000000
          Height = 32.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line2: TfrxLineView
          Left = 195.000000000000000000
          Height = 32.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line3: TfrxLineView
          Left = 110.000000000000000000
          Height = 32.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line4: TfrxLineView
          Left = 354.000000000000000000
          Height = 32.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line5: TfrxLineView
          Left = 707.000000000000000000
          Height = 32.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line6: TfrxLineView
          Left = 559.000000000000000000
          Height = 32.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line7: TfrxLineView
          Left = 850.000000000000000000
          Height = 32.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Memo3: TfrxMemoView
          Left = 22.000000000000000000
          Top = 7.000000000000000000
          Width = 32.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tarix')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 82.000000000000000000
          Top = 10.000000000000000000
          Width = 16.000000000000000000
          Height = 12.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ' $')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 118.000000000000000000
          Top = 7.000000000000000000
          Width = 72.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '  '#304'lkin qal'#305'q')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 210.000000000000000000
          Top = 7.000000000000000000
          Width = 128.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ' VDM-'#601' daxil olan v'#601'sait')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 375.000000000000000000
          Top = 7.000000000000000000
          Width = 160.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'VDM-d'#601'n geri qaytar'#305'lan v'#601'sait')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 584.000000000000000000
          Top = 7.000000000000000000
          Width = 76.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'D'#246'vr'#252'yy'#601'(al'#305#351')')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 734.000000000000000000
          Top = 7.000000000000000000
          Width = 84.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'D'#246'vr'#252'yy'#601'(sat'#305#351')')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 882.000000000000000000
          Top = 7.000000000000000000
          Width = 64.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '  Car'#305'  qal'#305'q')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 32.000000000000000000
        Top = 177.637910000000000000
        Width = 980.410081999999900000
        DataSet = DataModExch.frxDBDataset5
        DataSetName = 'frxDBDataset5'
        RowCount = 0
        object Line8: TfrxLineView
          Left = 5.000000000000000000
          Top = 32.000000000000000000
          Width = 974.110390000001000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object SysMemo1: TfrxSysMemoView
          Left = 8.000000000000000000
          Top = 7.000000000000000000
          Width = 56.000000000000000000
          Height = 16.000000000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[(<frxDBDataset5."DAT">)]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 117.826871000000000000
          Top = 8.661409999999989000
          Width = 72.220470000000010000
          Height = 16.000000000000000000
          AutoWidth = True
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[(<frxDBDataset5."FIRST_OSTAT">)]')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          Left = 856.692950000000000000
          Top = 7.220470000000006000
          Width = 116.031540000000000000
          Height = 16.000000000000000000
          AutoWidth = True
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[(<frxDBDataset5."CURRENT_OSTAT">)]')
          ParentFont = False
        end
        object Line9: TfrxLineView
          Left = 4.000000000000000000
          Height = 32.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line11: TfrxLineView
          Left = 78.000000000000000000
          Height = 32.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line14: TfrxLineView
          Left = 354.000000000000000000
          Height = 32.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line10: TfrxLineView
          Left = 978.000000000000000000
          Height = 32.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line12: TfrxLineView
          Left = 110.000000000000000000
          Height = 32.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line13: TfrxLineView
          Left = 195.000000000000000000
          Height = 32.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line15: TfrxLineView
          Left = 559.000000000000000000
          Height = 32.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line16: TfrxLineView
          Left = 707.000000000000000000
          Height = 32.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object Line17: TfrxLineView
          Left = 850.000000000000000000
          Height = 32.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
          Frame.Width = 2.000000000000000000
        end
        object SysMemo2: TfrxSysMemoView
          Left = 81.149660000000000000
          Top = 7.779529999999994000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[(<frxDBDataset5."VAL_NAME">)]')
          ParentFont = False
        end
        object SysMemo6: TfrxSysMemoView
          Left = 562.645640000000000000
          Top = 6.779529999999994000
          Width = 136.063080000000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[(<frxDBDataset5."PURCHASE_TURN">)]')
          ParentFont = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 711.070810000000100000
          Top = 5.000000000000000000
          Width = 132.283550000000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[(<frxDBDataset5."SELLING_TURN">)]')
          ParentFont = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 362.834880000000000000
          Top = 7.779529999999994000
          Width = 166.299320000000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset5."PEFR_OSTAT"]')
          ParentFont = False
        end
        object SysMemo4: TfrxSysMemoView
          Left = 204.212740000000000000
          Top = 8.440940000000012000
          Width = 136.063080000000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset5."FTPE_OSTAT"]')
          ParentFont = False
        end
      end
    end
  end
end
