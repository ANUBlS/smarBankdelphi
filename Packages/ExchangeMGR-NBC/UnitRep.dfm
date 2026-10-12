object FormRep: TFormRep
  Left = 233
  Top = 93
  Caption = 'FormRep'
  ClientHeight = 609
  ClientWidth = 842
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep: TQuickRep
    Left = 8
    Top = 1
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = DataModExch.ODSReport
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object BandDetail: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 547
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        1447.270833333333000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape12: TQRShape
        Left = 279
        Top = 275
        Width = 78
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666700000
          738.187500000000000000
          727.604166666667000000
          206.375000000000000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape11: TQRShape
        Left = 219
        Top = 275
        Width = 58
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666700000
          579.437500000000000000
          727.604166666667000000
          153.458333333333000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 151
        Top = 275
        Width = 66
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          399.520833333333000000
          727.604166666667000000
          174.625000000000000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 66
        Top = 275
        Width = 83
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          174.625000000000000000
          727.604166666667000000
          219.604166666667000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 6
        Top = 275
        Width = 58
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          15.875000000000000000
          727.604166666667000000
          153.458333333333000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText1: TQRDBText
        Left = 281
        Top = 282
        Width = 72
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          743.479166666667000000
          746.125000000000000000
          190.500000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'LAMOUNT'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 68
        Top = 281
        Width = 77
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          179.916666666667000000
          743.479166666667000000
          203.729166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'DEBITAMOUNT'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 5
        Top = 126
        Width = 353
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          13.229166666666700000
          333.375000000000000000
          933.979166666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText8: TQRDBText
        Left = 8
        Top = 281
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          743.479166666667000000
          140.229166666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'VAL_NAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 110
        Top = 465
        Width = 244
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666700000
          291.041666666667000000
          1230.312500000000000000
          645.583333333333000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'EX_ADDRESS'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRLabel4: TQRLabel
        Left = 5
        Top = 463
        Width = 114
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          1225.020833333333000000
          301.625000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'V.D.M-nin '#252'nvan'#305'  '
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 5
        Top = 105
        Width = 233
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          13.229166666666670000
          277.812500000000000000
          616.479166666666800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'EX_NAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRLabel3: TQRLabel
        Left = 7
        Top = 80
        Width = 115
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          18.520833333333300000
          211.666666666667000000
          304.270833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'V.D.M-nin ad'#305'  '
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 6
        Top = 330
        Width = 352
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          15.875000000000000000
          873.125000000000000000
          931.333333333334000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel9: TQRLabel
        Left = 4
        Top = 307
        Width = 51
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          812.270833333333400000
          134.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'T'#601'yinat  :'
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText9: TQRDBText
        Left = 61
        Top = 304
        Width = 296
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          161.395833333333300000
          804.333333333333200000
          783.166666666666800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'OPER_NAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRLabel10: TQRLabel
        Left = 6
        Top = 345
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          15.875000000000000000
          912.812500000000000000
          132.291666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'M'#252#351't'#601'ri '
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object LabelBankName: TQRLabel
        Left = 5
        Top = 10
        Width = 259
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333300000
          13.229166666666700000
          26.458333333333300000
          685.270833333333000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LabelBankName'
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRShape3: TQRShape
        Left = 6
        Top = 239
        Width = 58
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.958333333333300000
          15.875000000000000000
          632.354166666667000000
          153.458333333333000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel13: TQRLabel
        Left = 10
        Top = 241
        Width = 52
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          26.458333333333300000
          637.645833333333000000
          137.583333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Valyutan'#305'n'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 26
        Top = 257
        Width = 15
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          68.791666666666670000
          679.979166666666700000
          39.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ad'#305
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape4: TQRShape
        Left = 66
        Top = 239
        Width = 83
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.958333333333300000
          174.625000000000000000
          632.354166666667000000
          219.604166666667000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel15: TQRLabel
        Left = 84
        Top = 241
        Width = 35
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          222.250000000000000000
          637.645833333333400000
          92.604166666666680000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'M'#601'bl'#601#287
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape5: TQRShape
        Left = 151
        Top = 239
        Width = 66
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.958333333333300000
          399.520833333333000000
          632.354166666667000000
          174.625000000000000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel16: TQRLabel
        Left = 157
        Top = 241
        Width = 44
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          415.395833333333400000
          637.645833333333400000
          116.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'M'#601'z'#601'nn'#601
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape6: TQRShape
        Left = 219
        Top = 239
        Width = 58
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.958333333333300000
          579.437500000000000000
          632.354166666667000000
          153.458333333333000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 240
        Top = 257
        Width = 15
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          635.000000000000000000
          679.979166666666700000
          39.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ad'#305
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 224
        Top = 241
        Width = 52
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          592.666666666667000000
          637.645833333333000000
          137.583333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Valyutan'#305'n'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape7: TQRShape
        Left = 279
        Top = 239
        Width = 78
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.958333333333300000
          738.187500000000000000
          632.354166666667000000
          206.375000000000000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel17: TQRLabel
        Left = 298
        Top = 241
        Width = 35
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          788.458333333333400000
          637.645833333333400000
          92.604166666666680000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'M'#601'bl'#601#287
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 222
        Top = 282
        Width = 53
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          587.375000000000000000
          746.125000000000000000
          140.229166666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'VAL_CHANGED_NAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape13: TQRShape
        Left = 6
        Top = 71
        Width = 352
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          15.875000000000000000
          187.854166666667000000
          931.333333333334000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Left = 6
        Top = 100
        Width = 232
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          15.875000000000000000
          264.583333333333000000
          613.833333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 241
        Top = 78
        Width = 112
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          637.645833333333000000
          206.375000000000000000
          296.333333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qeydiyyat '#8470
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape15: TQRShape
        Left = 242
        Top = 100
        Width = 117
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          640.291666666667000000
          264.583333333333000000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText7: TQRDBText
        Left = 244
        Top = 104
        Width = 82
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          645.583333333333400000
          275.166666666666700000
          216.958333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'EX_CHECK_NO'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object LabelStatus: TQRLabel
        Left = 7
        Top = 212
        Width = 350
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          18.520833333333300000
          560.916666666667000000
          926.041666666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'XAR'#304'C'#304' VALYUTANIN ALI'#350'I'
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 165
        Top = 129
        Width = 71
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          436.562499999999900000
          341.312500000000000000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #199'IXARI'#350
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLabel18: TQRLabel
        Left = 16
        Top = 156
        Width = 88
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          42.333333333333340000
          412.750000000000100000
          232.833333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #399'm'#601'liyyat'#305'n tarixi:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape16: TQRShape
        Left = 110
        Top = 172
        Width = 109
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          291.041666666667000000
          455.083333333333000000
          288.395833333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape17: TQRShape
        Left = 261
        Top = 172
        Width = 96
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          690.562500000000000000
          455.083333333333000000
          254.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel19: TQRLabel
        Left = 226
        Top = 157
        Width = 29
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          597.958333333333400000
          415.395833333333400000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Vaxt'#305':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object LabelDate: TQRLabel
        Left = 112
        Top = 156
        Width = 49
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          296.333333333333400000
          412.750000000000100000
          129.645833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'LabelDate'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object LabelTime: TQRLabel
        Left = 265
        Top = 156
        Width = 48
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          701.145833333333400000
          412.750000000000100000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'LabelTime'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape18: TQRShape
        Left = 60
        Top = 361
        Width = 296
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          158.750000000000000000
          955.145833333334000000
          783.166666666667000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel5: TQRLabel
        Left = 6
        Top = 372
        Width = 59
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          15.875000000000000000
          984.249999999999900000
          156.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'V'#601't'#601'nda'#351'l'#305'q '
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape19: TQRShape
        Left = 70
        Top = 386
        Width = 285
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          185.208333333333000000
          1021.291666666670000000
          754.062500000000000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape20: TQRShape
        Left = 163
        Top = 408
        Width = 191
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          431.270833333333000000
          1079.500000000000000000
          505.354166666667000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape21: TQRShape
        Left = 111
        Top = 477
        Width = 244
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          293.687500000000000000
          1262.062500000000000000
          645.583333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape22: TQRShape
        Left = 5
        Top = 499
        Width = 345
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          13.229166666666700000
          1320.270833333330000000
          912.812500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText14: TQRDBText
        Left = 72
        Top = 371
        Width = 283
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          190.500000000000000000
          981.604166666666800000
          748.770833333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'CUST_COUNTRY'
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object LabelCustomer: TQRLabel
        Left = 63
        Top = 345
        Width = 292
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          166.687500000000000000
          912.812500000000000000
          772.583333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LabelCustomer'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object LabelPassport: TQRLabel
        Left = 163
        Top = 393
        Width = 191
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          431.270833333333400000
          1039.812500000000000000
          505.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LabelPassport'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object LabelDifference: TQRLabel
        Left = 157
        Top = 256
        Width = 46
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          415.395833333333400000
          677.333333333333400000
          121.708333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'F'#601'rq'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object LabelCourse: TQRLabel
        Left = 155
        Top = 281
        Width = 55
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          410.104166666667000000
          743.479166666667000000
          145.520833333333000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LabelCourse'
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 6
        Top = 394
        Width = 154
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          1042.458333333333000000
          407.458333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'CUST_CONFIRM'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object Label_Cust_Giving_Member: TQRLabel
        Left = 6
        Top = 414
        Width = 99
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          1095.375000000000000000
          261.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'T'#601'qdim  ed'#601'n  orqan'
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape23: TQRShape
        Left = 109
        Top = 428
        Width = 244
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          288.395833333333000000
          1132.416666666670000000
          645.583333333333000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText10: TQRDBText
        Left = 108
        Top = 413
        Width = 245
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          285.750000000000000000
          1092.729166666667000000
          648.229166666666800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'CUST_GIVING_MEMBER'
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 6
        Top = 437
        Width = 115
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          1156.229166666667000000
          304.270833333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'S'#601'n'#601'din verilm'#601' tarixi'
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape24: TQRShape
        Left = 124
        Top = 451
        Width = 228
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          328.083333333333400000
          1193.270833333333000000
          603.250000000000000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText11: TQRDBText
        Left = 125
        Top = 435
        Width = 67
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          330.729166666666700000
          1150.937500000000000000
          177.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'CUST_DATE'
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 9
        Top = 515
        Width = 150
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          23.812500000000000000
          1362.604166666667000000
          396.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'M'#252#351't'#601'rinin imzas'#305' ___________'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 192
        Top = 516
        Width = 124
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          508.000000000000000000
          1365.250000000000000000
          328.083333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #304'cra'#351#305' imzas'#305'___________'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape25: TQRShape
        Left = 360
        Top = 3
        Width = 1
        Height = 544
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          1439.333333333330000000
          952.500000000000000000
          7.937500000000000000
          2.645833333333330000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object LabelBankNameCopy: TQRLabel
        Left = 365
        Top = 10
        Width = 258
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333300000
          965.729166666667000000
          26.458333333333300000
          682.625000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LabelBankName'
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRShape26: TQRShape
        Left = 364
        Top = 71
        Width = 352
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          963.083333333333000000
          187.854166666667000000
          931.333333333334000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel21: TQRLabel
        Left = 372
        Top = 80
        Width = 115
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          984.250000000000000000
          211.666666666666700000
          304.270833333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'V.D.M-nin ad'#305'  '
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel22: TQRLabel
        Left = 593
        Top = 78
        Width = 116
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1568.979166666670000000
          206.375000000000000000
          306.916666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qeydiyyat '#8470
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape27: TQRShape
        Left = 363
        Top = 100
        Width = 232
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          960.437500000000000000
          264.583333333333000000
          613.833333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape28: TQRShape
        Left = 599
        Top = 100
        Width = 117
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          1584.854166666670000000
          264.583333333333000000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText12: TQRDBText
        Left = 364
        Top = 105
        Width = 226
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          963.083333333333400000
          277.812500000000000000
          597.958333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'EX_NAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRDBText13: TQRDBText
        Left = 594
        Top = 104
        Width = 82
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1571.625000000000000000
          275.166666666666700000
          216.958333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'EX_CHECK_NO'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRShape29: TQRShape
        Left = 362
        Top = 126
        Width = 353
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          957.791666666667000000
          333.375000000000000000
          933.979166666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel23: TQRLabel
        Left = 502
        Top = 129
        Width = 71
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1328.208333333333000000
          341.312500000000000000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #199'IXARI'#350
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLabel24: TQRLabel
        Left = 376
        Top = 156
        Width = 88
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          994.833333333333400000
          412.750000000000100000
          232.833333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #399'm'#601'liyyat'#305'n tarixi:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object LabelDateCopy: TQRLabel
        Left = 472
        Top = 156
        Width = 49
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1248.833333333333000000
          412.750000000000100000
          129.645833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'LabelDate'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel26: TQRLabel
        Left = 586
        Top = 157
        Width = 29
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1550.458333333333000000
          415.395833333333400000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Vaxt'#305':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object LabelTimeCopy: TQRLabel
        Left = 625
        Top = 156
        Width = 48
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1653.645833333333000000
          412.750000000000100000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'LabelTime'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape30: TQRShape
        Left = 470
        Top = 172
        Width = 109
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          1243.541666666670000000
          455.083333333333000000
          288.395833333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape31: TQRShape
        Left = 621
        Top = 172
        Width = 93
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          1643.062500000000000000
          455.083333333333000000
          246.062500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object LabelStatusCopy: TQRLabel
        Left = 363
        Top = 212
        Width = 350
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          960.437500000000000000
          560.916666666667000000
          926.041666666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'XAR'#304'C'#304' VALYUTANIN ALI'#350'I'
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel29: TQRLabel
        Left = 383
        Top = 257
        Width = 22
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1013.354166666667000000
          679.979166666666700000
          58.208333333333340000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #1072#1076#1099
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel30: TQRLabel
        Left = 367
        Top = 241
        Width = 52
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          971.020833333333000000
          637.645833333333000000
          137.583333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #1042#1072#1083#1081#1091#1090#1072#1085#1099#1085
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape32: TQRShape
        Left = 363
        Top = 239
        Width = 58
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.958333333333300000
          960.437500000000000000
          632.354166666667000000
          153.458333333333000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel31: TQRLabel
        Left = 367
        Top = 241
        Width = 52
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          971.020833333333400000
          637.645833333333400000
          137.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Valyutan'#305'n'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel32: TQRLabel
        Left = 386
        Top = 257
        Width = 15
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1021.291666666667000000
          679.979166666666700000
          39.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ad'#305
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape33: TQRShape
        Left = 423
        Top = 239
        Width = 83
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.958333333333300000
          1119.187500000000000000
          632.354166666667000000
          219.604166666667000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel33: TQRLabel
        Left = 443
        Top = 241
        Width = 35
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1172.104166666667000000
          637.645833333333400000
          92.604166666666680000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'M'#601'bl'#601#287
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape34: TQRShape
        Left = 508
        Top = 239
        Width = 66
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.958333333333300000
          1344.083333333330000000
          632.354166666667000000
          174.625000000000000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel34: TQRLabel
        Left = 517
        Top = 241
        Width = 44
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1367.895833333333000000
          637.645833333333400000
          116.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'M'#601'z'#601'nn'#601
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object LabelDifferenceCopy: TQRLabel
        Left = 517
        Top = 256
        Width = 46
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1367.895833333333000000
          677.333333333333400000
          121.708333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'F'#601'rq'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape35: TQRShape
        Left = 576
        Top = 239
        Width = 58
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.958333333333300000
          1524.000000000000000000
          632.354166666667000000
          153.458333333333000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel28: TQRLabel
        Left = 579
        Top = 241
        Width = 52
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1531.937500000000000000
          637.645833333333000000
          137.583333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Valyutan'#305'n'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel36: TQRLabel
        Left = 600
        Top = 257
        Width = 15
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1587.500000000000000000
          679.979166666666700000
          39.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ad'#305
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape36: TQRShape
        Left = 636
        Top = 239
        Width = 78
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.958333333333300000
          1682.750000000000000000
          632.354166666667000000
          206.375000000000000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel37: TQRLabel
        Left = 658
        Top = 241
        Width = 35
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1740.958333333333000000
          637.645833333333400000
          92.604166666666680000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'M'#601'bl'#601#287
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape37: TQRShape
        Left = 363
        Top = 275
        Width = 58
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          960.437500000000000000
          727.604166666667000000
          153.458333333333000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText15: TQRDBText
        Left = 365
        Top = 281
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          965.729166666667000000
          743.479166666667000000
          140.229166666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'VAL_NAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape38: TQRShape
        Left = 423
        Top = 275
        Width = 83
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          1119.187500000000000000
          727.604166666667000000
          219.604166666667000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText16: TQRDBText
        Left = 426
        Top = 281
        Width = 77
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1127.125000000000000000
          743.479166666667000000
          203.729166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'DEBITAMOUNT'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape39: TQRShape
        Left = 508
        Top = 275
        Width = 66
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          1344.083333333330000000
          727.604166666667000000
          174.625000000000000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object LabelCourseCopy: TQRLabel
        Left = 513
        Top = 281
        Width = 55
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1357.312500000000000000
          743.479166666667000000
          145.520833333333000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LabelCourse'
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape40: TQRShape
        Left = 576
        Top = 275
        Width = 58
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666700000
          1524.000000000000000000
          727.604166666667000000
          153.458333333333000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText17: TQRDBText
        Left = 578
        Top = 282
        Width = 53
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1529.291666666670000000
          746.125000000000000000
          140.229166666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'VAL_CHANGED_NAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape41: TQRShape
        Left = 636
        Top = 275
        Width = 78
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666700000
          1682.750000000000000000
          727.604166666667000000
          206.375000000000000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText18: TQRDBText
        Left = 639
        Top = 282
        Width = 72
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1690.687500000000000000
          746.125000000000000000
          190.500000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'LAMOUNT'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Mask = '#,##0.00'
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel39: TQRLabel
        Left = 365
        Top = 308
        Width = 51
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          965.729166666667000000
          814.916666666667000000
          134.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'T'#601'yinat  :'
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText19: TQRDBText
        Left = 422
        Top = 309
        Width = 291
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1116.541666666670000000
          817.562500000000000000
          769.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'OPER_NAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRShape42: TQRShape
        Left = 364
        Top = 330
        Width = 352
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          963.083333333333000000
          873.125000000000000000
          931.333333333334000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel40: TQRLabel
        Left = 364
        Top = 345
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          963.083333333333000000
          912.812500000000000000
          132.291666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'M'#252#351't'#601'ri '
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object LabelCustomerCopy: TQRLabel
        Left = 419
        Top = 345
        Width = 292
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1108.604166666670000000
          912.812500000000000000
          772.583333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LabelCustomer'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape43: TQRShape
        Left = 418
        Top = 361
        Width = 296
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          1105.958333333330000000
          955.145833333334000000
          783.166666666667000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel42: TQRLabel
        Left = 363
        Top = 372
        Width = 59
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          960.437499999999900000
          984.249999999999900000
          156.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'V'#601't'#601'nda'#351'l'#305'q '
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText20: TQRDBText
        Left = 427
        Top = 372
        Width = 283
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1129.770833333333000000
          984.250000000000000000
          748.770833333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'CUST_COUNTRY'
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape44: TQRShape
        Left = 427
        Top = 386
        Width = 285
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          1129.770833333330000000
          1021.291666666670000000
          754.062500000000000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText21: TQRDBText
        Left = 364
        Top = 394
        Width = 154
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          963.083333333333400000
          1042.458333333333000000
          407.458333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'CUST_CONFIRM'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object LabelPassportCopy: TQRLabel
        Left = 521
        Top = 393
        Width = 191
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1378.479166666667000000
          1039.812500000000000000
          505.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LabelPassport'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape45: TQRShape
        Left = 521
        Top = 408
        Width = 191
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          1378.479166666670000000
          1079.500000000000000000
          505.354166666667000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel44: TQRLabel
        Left = 363
        Top = 415
        Width = 99
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          960.437499999999900000
          1098.020833333333000000
          261.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'T'#601'qdim  ed'#601'n  orqan'
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText22: TQRDBText
        Left = 464
        Top = 414
        Width = 245
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1227.666666666667000000
          1095.375000000000000000
          648.229166666666800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'CUST_GIVING_MEMBER'
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape46: TQRShape
        Left = 465
        Top = 428
        Width = 244
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          1230.312500000000000000
          1132.416666666670000000
          645.583333333333000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel45: TQRLabel
        Left = 363
        Top = 437
        Width = 115
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          960.437499999999900000
          1156.229166666667000000
          304.270833333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'S'#601'n'#601'din verilm'#601' tarixi'
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText23: TQRDBText
        Left = 481
        Top = 435
        Width = 67
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1272.645833333333000000
          1150.937500000000000000
          177.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'CUST_DATE'
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape47: TQRShape
        Left = 484
        Top = 451
        Width = 228
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          1280.583333333333000000
          1193.270833333333000000
          603.250000000000000000)
        XLColumn = 0
        Pen.Style = psDot
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape48: TQRShape
        Left = 493
        Top = 479
        Width = 220
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          1304.395833333330000000
          1267.354166666670000000
          582.083333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel46: TQRLabel
        Left = 367
        Top = 463
        Width = 124
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          971.020833333333400000
          1225.020833333333000000
          328.083333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'V.D.M-nin '#252'nvan'#305'  '
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText24: TQRDBText
        Left = 492
        Top = 467
        Width = 221
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1301.750000000000000000
          1235.604166666670000000
          584.729166666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = DataModExch.ODSReport
        DataField = 'EX_ADDRESS'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRShape49: TQRShape
        Left = 365
        Top = 499
        Width = 345
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          965.729166666667000000
          1320.270833333330000000
          912.812500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel47: TQRLabel
        Left = 365
        Top = 515
        Width = 150
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          965.729166666666700000
          1362.604166666667000000
          396.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'M'#252#351't'#601'rinin imzas'#305' ___________'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel48: TQRLabel
        Left = 548
        Top = 516
        Width = 124
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1449.916666666667000000
          1365.250000000000000000
          328.083333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #304'cra'#351#305' imzas'#305'___________'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRImage1: TQRImage
        Left = 270
        Top = 3
        Width = 90
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          87.312500000000000000
          714.375000000000000000
          7.937500000000000000
          238.125000000000000000)
        XLColumn = 0
        Picture.Data = {
          0A544A504547496D616765B92A0000FFD8FFE000104A46494600010200006400
          640000FFEC00114475636B7900010004000000500000FFEE000E41646F626500
          64C000000001FFDB008400020202020202020202020302020203040302020304
          0504040404040506050505050505060607070807070609090A0A09090C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C01030303050405090606090D0B090B0D0F0E0E0E0E
          0F0F0C0C0C0C0C0F0F0C0C0C0C0C0C0F0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080060011803011100021101031101FF
          C400C30001000202030101000000000000000000000709060802030504010101
          0001050101000000000000000000000006010204050703081000000504020102
          03050307060F0000000102030405001106071208213113412214516132150981
          23167142627233B47691528236371892B2D263B32444548475B5261727381100
          0103020303060A07050607000000000100020311042112053141065161718113
          0791A1B1C1223242527214F0D16282337334E1B2234335F19253241516C26383
          44253617FFDA000C03010002110311003F00BFCA225112889444A22511288944
          4A225112889444A225112889444A225112889444A225112889444A2251128894
          44A225112889444A225112889444A225112889444A225112889444A225112889
          444A225112889444A225112889444A225112889444A225112889444A22511288
          9444A225112889444A225112889444A225112889444A225112889444A2251128
          89444A225112889444A225112889444A225112889444A225112889444A225112
          889444A22D6CDBDDA4D57A81C8C1BC76B6559A9C4136F8541101CBCF70DF808B
          080F044447D00C3C87E051AD5DF6AF05B1CAE399DEE8C4FEC535E1CE02D4B5A6
          F6AC688E1DF23FD16D37D37BBAB0E5216B7E4FBCFB3530CC25DDA384758F1174
          51518C866AEC8A4B2A97A00A6D14299430FD81F4C5FE5AD54DA85EBC6639216F
          2BCFA5E0FD8A6961C2BC3B03FB3699F50986D10B69183CEF1875F68542AB6C99
          097388BBEE16C0CB5C5C0554F02C3DE11B94C3EA0458A2D8043FD1AC03745FB6
          E5EEF81869E65266E871C3EAE8F6F18FF9F3B4BBAC7A5E55C0738711C3EF7FBC
          F6EEC64C40BFD5645893C72D83EF307D41C003F653E60B7FEE261F13491E5577
          FA5B65C069963273473B5AEF2052461DB87B007549FF00C71BCB5CF60C899B89
          715912160E6D500F81105CAC8E630FF5CDE7E159505F5DFF002A564BCC7D1778
          305A5D4B86F4303FCED8DCD97DB6FF001621D2E19C78829DB0CEE662E79C4B0B
          DD18949E93CC844A5F6E688618E54C3E00C574242090A611F0639787F4C6B630
          6BACCDD9CED31BB9F6787E839D45353EECEE0426EB4C959770FD8F5C7DDA9A9E
          60737D95B9A82E8BA45172D962386EE085510709180E4390E17298A60B808080
          DC042B780822A1735734B496B8508DA176D555A9444A225112889444A2251128
          89444A225112889444A225112889444A225112889444A225112889444A22D0BE
          C4EF7CD2673669D74D067F733F96FDDE5794246B162113140E7211500104CE44
          C79AAA7AA602052FEF0C1C63BA9EA323E5F95B6F5CED3EEFD379DDD2BACF06F0
          9DA416675AD5FF004EDF5187F98760A8DE09C1ADF68D49F4463AF9ACF1275FC4
          725AF7ACA93698CB234C64B6AF68A69107246ABAB7059085229CC0A223CAC60B
          9D4FC5CB887B95ACB484E7315A62E1EBCA71A7C3F4C7C6A5FAE6A2DF976DE6B8
          4B6276305930E5CC06C74C4539B0C1ADD94AFA2B86EC8EC3BAB196E22A3CC2D9
          EF6CD7298F7127339BE7AE9778E3DF4562A7FB96D73A2428F2B85C0C60FF003A
          97ED8F4D91B56895EE152E79AF8B62BB85E5BBE2EB598366367046E0D6C70343
          5B4209C5D8389F00E65E9615FA844DFE7F8D434C6B9C7B1FC51D4836692CEA39
          65CA668D5550A99D64D312813F7603CAC3F00ABA0E267676B5CC686D4569B82F
          1D53B9D8BB09658AE647CA1A4B4380F49C054026B5C762973B15DCBCAB4D6CE7
          D8143E1B0D3F1EDE3193E2BE78E5722A617653184A254C04B60E3E2B3753D75F
          69318DAD04501DBCAA3BC19DDA5B6B9A736EE499EC71739B40011E8D395619A6
          E6305EE5CCE5F13B1749E3F026818F45DB3CB60BDE6EFF00EA565449C7EAC854
          C791403900184DF785ABC2C648B56739B2C4D141B46DF0AD9712DADEF03C50C9
          657B23F3B8831BE859940AFAA49C0ECD83A549A7EBA642C5D9F5FE6F9F40ED4D
          30A96F1D139A2CA23944281FE505236492298D74C0A16E4205307CB62F9BE5FF
          00A63C1ECE4787C5C8EF5DBF0B968871941237E72D6DE4B7BD1B5D08060979A4
          8CF2EFA548DB8AC8345EB2D81A3F227D8FB5DAF8F661A55651418984937472CB
          470183910CDCC529910F9BC1C806021BF194086B80FAE9F692D9BCB448D745B8
          13E90E8DDF4DCB138AB5CB1D7E06CCEB4922BD00667340ECDFF17B5CE0D0B87A
          A4B862B72DBB96CED3059AB84DCA42360552381CB70F85CA2215BC041D8B9ABD
          8E61A381079D769CE44C865143010840131CE61B00007911111F4B55550024D0
          281677B49D7DC71F2B1B29B56141E206122C9343A8F40860F02063B54D528087
          D97AD749ABDA46686415F0F914B2D380F5DBA607C76AFCA7968DFDE20ACF307D
          ABAE36524B2B8266915938B72F272D99AE532E9147C72510371508171F53142B
          22DEF21B8FC3703D0B53AA6817FA5902EE17C75D85C303D0ED87A8A902B256A1
          752EE106A8A8E1CAC9B66E887255754C042143ED318C2000154240C4AB9AC2E3
          468A92BC9FE26C6C7D3208D1FF00C5A3FF002EACED59CA3C2BDFE4A7FF000DDE
          03F52EF6F390AE952A2D66193958E362249384CE611FB80A6111AA891A7610AD
          7DACCC15731C07382BD4ABD7825112889444A22511752CB22DD332CE15220893
          C9D550C05285FC7911B005509A2AB5A5C68054AE86F20C1E1CC9B47CDDD1CA1C
          8C445521C403D2E20511AA0703B0ABDF13D82AE691D217D9572F34A225112889
          444A225112889444A228FB66E609EBED7B9A66CA015436310CEDFA099BD14593
          48C28907FACA712FEDAC6BB9C4113E43EC8256D341D34EA57F05A8FE63DADEA2
          4663D4DC553F632EA6F0CEBD4D674D1751D6DBECEE52B62F1932611FA92C702C
          6FAE3A6A5F9019CB81314C21FE7107F9A150988BA2B4320FC499D941DF4DFE12
          BE90BE8E1BED79968E005A69F1095CDF673D3D0047D86508E83CAADD74FEB082
          D3FAFB1FC1A091201231029A55F14A00678F8E50170E4E36B889CDE97F42814A
          1E002A696368DB589B1B776DE73BCAF9DF88F5D9B5ABE92EE53EB1F447BACF65
          A3A0784D4EF5A73FA8D32663ADB069116880C817262B62BFF6CBEF822666E4E6
          4814B72020980044B7B5C006B47C50D1D8B0EFCDE62BA4F72F23FF00D427654E
          5ECAB4AE15CCD15A6CAF3AA7D30018A25305C0C1610FB86A10BE8F068B6DB756
          7917B1B436869C553686CD619D4963997BE2913078BFE58DD02353AE700F70C5
          3A2629C390DB909AD5BABFB86DC5AC2EC330AB4F2E0053C4B9DF0BE932697ADD
          FC409EC5C1924631CA3B42E2EA0D80875461B805B7FF00A6EFFA8BB2FF00C46D
          FF00B9275BBE16FC293E2F32E73DF5FEB6DBF2CFEF15ACBFA811086DFC9098A0
          2218B4685C43FE79D56AB897F57F7479D4E7BA0246867F35FE46AF8757749F2C
          DAFACE2763C16630AC0B349BB333847AD9603019AB855BF13B820894390A57B8
          146D7AB6D34092E6112B5C056B811C868BD75EEF42D747D45F652C2F7642DAB8
          11ED00EC1A792BCAA32EB66C1CC35E6E2C210C71FB92B49D9D670D3D8FA4A18C
          D9EB776B95BA80648044826272E643805C043D6D7AC4D2AE6482E181A7024023
          71A9A2DE71BE8F69A96933BA668AB2373DAFA7A4D2D19863B687611BEAB74BF5
          06DC5371ABC0E9E8090563D949B0FCDF3251B9C487708A8A1926CD0C60B0FB62
          299CE70BFCDF280F8B80EF7896F9CD22069A022AEF305CCBB9FE1A865126A533
          438B5D923AEE2002E7F4E2034EEC5415D77E98C86EAC3CD9CCD6586C3E01DAEB
          36C7D06CD0AE9C39FA730A6A2C6E674CA44C140129402E26B0FA05AFAFD33423
          771F68E7651BB0AD54AF8CFBCC668577F29145DAC8002F25D9436B886E009269
          89DC2A36AF813EAEF64F57EDB286B5857932FB187293A81CEDA8A6C983948E00
          7022A772A90B610B9164AE60F50F20203568D22F6DAE3F84092363B603E1F185
          EAEE3CE1ED5B4BFF003CF0D6C8087446AF7B4F28CA0F4B1D8752BB6875E45CC4
          C5B8986448D965DA22A4A4726A02A441C18802AA4550BE0E043DC00C1EBEB53E
          6125A0B850D315F2F5C3636CAE6C6ECCC04E534A5457034DD51B9421DA9001EB
          BEDC0100101C7D70101FEB16B5FAC7E8E4F854A7807FAF5A7E60546BA775638D
          C5B0A1B5F47493683773293B553937080AC9A60D1B9D71012104A23C80960F35
          CFAC6CCDD4C220695AE3D02ABEA8E25D79BA2583EF1ED2F0D2D140684E621BB4
          D795675BEFAEF90F5DE571A4653218F9C26469385E2E4238AA365923B43260A0
          1D330898BFDA944A60379F3E821591A8E98FB0736AE06BB2986C5AAE11E32838
          9A294B23733B320383A8E07356943BF61A8215A7F4873FCAF3FD2A45F2E78BCA
          BDC7261CC3319A72613ACE9AA29A2AA62A286F27327EE8A6261F23C42FE6F530
          D02E649EDAAF3520915E50B8277A3A45B69BAC16DB80D6BD81E5A3635C490683
          7034CD4E7E452AEC3EC5E99D592230D99E70D184D9085514856E9ACF1DA65385
          CA2A24D88A0A770F21CED70F359973AA5B5B1CB23C03C9B4F8968346E0CD5B57
          8FB4B580B99EF121ADEA2E22BD5558245774BAE12CE92685D8011C758C0522D2
          0C1EB5440446C1C9551002143EF3080563B35DB371A67A74823CCB6B71DD9710
          42D2EF97CD4F75CD71F00353D4B651C4CC535865F2155F24308D999E4159348D
          EEA5F4A44C55158A64F9722F00E4025BDC3D2B6864686E6AE14AD79942596D23
          E510869CE5D969B0E6AD298EC35C3150DE2FD9BD11993C74C71DD8F1EF5C3160
          BCA3D155272D53459B6028ACB28AB94524CA52720BDCD5850EAB6B29218F0682
          BBC61D6A497FC0FAD58B03E6B67005C1A316B8973B63406924934E458FC57703
          AED313A863ECF63362BB74B0376AEDCB576DD9A8A18789401D2C891200111F02
          26001FB6BC99ADD9BDF943F1E834F0EC59971DDCEBD0406675B1A0152016B9C0
          7C209778AAB8F716C3D6ADA5E8202C997FEA0D6A9AE7E8A4E81E50ABDDB7FEC3
          6BF13BF71CB423F4E429436DE7020001FF00B44DFDFDB547385FF50FF87CE175
          BEFA0FFE2E0FCEFF0081CAC2E57B5DD798492908892DA5168BF8A70A357E9113
          72B148AA46129CA0A2489C86B085AE53085499FAC5A31C5A64151D3F52E3B6FD
          DFEBD711B6465ABCB5C0118B4607660483E153B45C934998E632CC0CA28C6450
          23866A2A92881CC9A81C88614D5290E5B80DEC6280D6C58E0F008D8544E785D0
          48E8DFEB34D0D08388E71507A8AFBEAE5E49444A225112889444A225116BB76A
          E21E4EF5EB6A32605319C27100F78140444C9B05D276A96C1F69113056B35861
          7DA48072790A98F77D72CB7D7AD5EED99F2F5BC160F190AB6DCCD352683E9E66
          9C40F0BADB3D7B1F941C3C95150640AF0A27FB2E8A426F3F6FDF516320F94B69
          3731E41F0D7C8BB632D5C75CD62D7DB9EDDAE6738C9930FBC68AEAC872284228
          99C144D428188728DC0C03E404043D406A78BE63208342ABDBF51AFF0065783F
          F8B09FDC5D54678A3F019F1798AEC3DCBFF539FF0024FEFB5567629A926F30D6
          5B1F66453C485AEB459904B430A6632CB20EAFCD74CE0360044A1C8C021E4004
          6FE2A290D93A581F283EA52A3A7EA5DC750E2286CB51B6B191A6B701D95D5C01
          6EC691F6B60E7513D82F7B79F4BD61290AB74FD377FD45D97FE236FF00DC93A9
          AF0B7E149F17997CEBDF5FEB6DBF2CFEF15ACDDFFF00F6FC5FBB178CFF00A575
          5AAE24FD5FDD1E7538EE87FA1FFD57F91ABCDD65A0BB399F6B28B98C0F2F336C
          0E653744618F8E42ED990C522EA24B105A90BED140EA14C2202361BDC7D6ACB4
          D36F67803A377A06B866237F26C5EDAEF1770E69DA8BA2BB86B3B4B6AFEC9AED
          C083989CD80A7428FB48E791DD7FDBC4799EE04DA5DE63D20A45CA28E0E7FAC8
          4548733770BB5294E281CE9F9BF2288887E0316F7AC6D3EE058DC5646548343C
          ADDC69BBE982DC714E93271269596D272D0F6873694CB2823335AEC3300798ED
          F58152A77F18AE96F2632FE548F9FC5A3978C701F80E44945D33F11FB86C3FB4
          2B33891A45D076E2D14F1AD0F7452B4E8CE8FDA64AE0E1D21A47D399585749E6
          E365BAE7833562B915710067F1D2A89443924E0AF16578983E1C88A14C1F7085
          49741903ACD806EA83E12B8EF79F6B243AFCEE78C1F95CDE71940F2823A971CF
          BB8FA9B5AEC890D759404982B16837348640C5123B6882EB809C5054A99FDD03
          1082531B890DEB6F50A5CEB96F6F3189F5C378C47472A691DDB6A9AAE9EDBD83
          2D1C4D18E395C40C330A8CB426A0548D8B66E0A6E33258589C8615CFD6C3CE34
          45F45BCE074FDD6EB90144CFC14294C1C8A20361001ADB4723646873761150A0
          F756B25ACCF865147B096B8606841A11861B5429DA9FFF003BEDCFFC816FF8C4
          AC0D63F4727C2A4FC03FD7AD3F3079D51C69FC4F39CDF6043E37ADE5860F307A
          93A3C64983C5580A644503A8B07D4200272F24CA21E03CFA573EB18659A60C88
          D1C6B435A6EE55F547126A1656162F9EF599E105B56E50FAD4803D1760715226
          F7D23BBF5A843E4DB6DF0E4CDA51708F673832ABC9F150A532A0DCE65F82A981
          8A53085BC781F37ACAD46C2E6DE8F98E6AE15AD7A969784F8A346D573C1A737B
          32D198B7208F0D99865AB4D0D3C5B959C74AB6CE37B075B2F8BC3624CF097DAF
          8E9357F0D1C639DA2A9BBE6A26E9232A2656EA98A7E607318DC82FC86F52DD06
          F593C391AD0D2CDC3663BD70CEF3B87AE34DD404F2CA656CF521CEA6605B405A
          6986008A50014DC28B4C76D619D47C5B63CB4AE4BB672ECDE6466567F986371C
          820F4175CCA8A8BB655F108D889DC7E41E2A722878F0215A2BD834F8E62E7C8E
          71AD4818F5570F2AE97C3DA9F14DDE9EC8E0B48626640D8DEE259414A35C184B
          89E5C5B43B715AF3BB6735A646BE3F27AB35048EB0C780AE501917AA2A624B18
          BED894C4218544C0C880FCC2450C23C8397A056AF5092190B4C3116371C4FB5F
          D9D2A65C2D6BA8DA8923BFBC6DC4981A36958F6ED381F4B755A3660ACBBAD128
          FA4FA592857CB997FCAA1F2860C8C61B891BA00E7DA25FEC200D83EC0B054AF4
          A79769A6BB838795710E38B7645C5EDC82999F0B8FC472D4F5EDE95573D7ED6E
          9EDCD9D8A6BD7326E22236788B9A65DB510F745A3440CE944CA06B9444E29000
          7201001F9AC36A88E996BF353B622680EDE802ABBCF186B6745D3A5BC6B439CC
          23283B3338E507970A9D94E4AE2B21ECDEA185D2DB45EE130320EE4E1158C692
          4CD47E24338215CFB84324A1D3290A6B1931101E21E06DF0BD7AEAD64DB49CC6
          D248A038F3AC2E05E239B5DD345D4CD0D787B9A72D6872D0D4024D36F2AB22D9
          724F25BA0094948AE672F5DE158F19CB838DCC737BEC839187E2236F23528BB7
          1769353B7237CA1715D0E0643C7058C14689E5A0EA7AA9DC1F6564FAE5BE605C
          55DFE58F73287FC8DECB1044ABB7687588B2BEC1804389CE04E1CBD4A02225F9
          AC210DB7BA7DB8764342E14AF3732FA0B55D12DB54743F30333627E70DDCE750
          819B940AD69BF7E0B693A2184EB3CBF65C89F320FAEC971B6A9C96178FB82945
          9AC64CF659C1807CA8AB711209482160BF3F225F9771C3B6F0CB31ED3170C5A3
          774F48502EF6354D46CB4E68B6C229096C8E1EB0AEC6F335D8D4EDC32EFC6ECA
          A7ABE604A225112889444A225112889445F03A68D1FB672C1E22472CDEA4A20E
          DB9C391144D52894E4307C40C5110AA38661476C2AE89EE8DC1CD3470A107931
          AD7C2A9F56C36374C65DB0FACBB5173B1D41B70E0FB5E66EB05D28D7E998018B
          B131AC50F6C4088B80F1F84A61B26711A84181B6923ED26C229316BB90EE3E63
          F52FA45BA949AE5ADBEBBA78ADE5B7A32C636BD87D76F5E2F8FA481E9368B6AF
          AF3BA64B0D7ADBAEBBCD424067B8CA646986644E4F665904697E56A2838358A6
          381000A51BFCE0001FDA018B5B8D32FDD11F95B8C1E3D53B9C3750FD2BD2A01C
          63C331DF30EB3A57A76F21AC8C1EB42FF6B33770AE27DDF8685413FA90E57289
          4A6B9C285CA248070D5CCDA8DCC428282F1138B621C141F9B8826A9838FA5FCD
          6BB8A66707323DDB7AF62967729A7C663B9BAA1ED010CAEECA4663872D40C544
          1D19CA5FBAD8D29A91455AB9C2362C5489F2B8C3A443A8BFD3B33A6402ABF888
          1C5410100F5AC1E1E98998C386478351D4A47DEAE9EC65833510089E07B721AE
          033381386FD8B55B63E1CEB5AE799660728A003AC5E45666454E3C4564007937
          58007E0AA4621C3F96B4F7501B795D19F64D3EAF129F68BA93755B28AEE31848
          D07A0FB43A9D50AD0BF4DB390F826CB121CA700C8DB808946FFF00624EA5DC2D
          F8527C5E65C27BEC045EDB57FC33FBC542FDE2D79B0327DE3F99E37834FE4118
          18E4723F98C6C6B97487B8451C0989EE24998BC83905C2FF001AC0E20B5964BA
          AB18E2328D809E5526EEAF59B1B4D1BB39E78D8EED5C68E7B5A6946E342546D8
          766FDCCD7F8B31C2F10C7B2E87C7634162B0665C58553A5EFA87554105556673
          DC4E711F23E2B160B8D460608D8D7068FB3FB16EF52D2B84B52B975D5CC90BA4
          752A7B6A56800180781B02F2F5FF0054F79ED3CC50532BC5A631A8A957A2F72B
          CBB2020B754C9AAA7B8E14226B082AAACA5C6C005B5C6E6100AB2DB47BAB993D
          369009A927C7CE4AF7D5FBC0D1748B422DE5648F6B72B238F115028D048F45AD
          1BF1D9B2A55A8762BAE30BBCB0A8D866CE890594628511C42714289D320090A4
          3B67005F98C92A042DC43C94400C17B080CC354D2DB791068C1CDD87CC799703
          E0CE349B87EF1D2B8678A4FC46EC2778737ED36A69B88241E5157C9F5A3B71AE
          1F3E4316839B660EC3DB73218B4CA69A2E481700137B6E113887D9CC80215111
          A56A16E48603F74EDF185DD9DC71C2DAA31A6E1EC34D8258C92DF0B5C3C05677
          A8FA2DB3F2CC91A49EDB6DFC278A91C03999416769BA9591F9B91D22FB275413
          F707C1D439F90008D8A2359365C3D3CAFACFE8B77E3527E9CAB55C45DEB69D67
          6E63D38F692D28D21A5B1B39F102B4DCD029CA55CAB46AD98B56CC99A046CD19
          A4441AB64C389134D32814842807A0000000054E4000506C5F354923A471738D
          49352794950AF65E2A526F436D189858E732F2AFE115498C6B348EBAEB1C4E4B
          1534C802630FDC01581AAB1CFB591AD15246C0A4FC11711DBEB76B24AE0D6364
          04926800C7693B152B61187762F5C64AC72FC375CE5F1190C69164D9BF1C7DC2
          FC0AE13324A07B6B373906E4308790A81DBC1796EF0F631C1C3EC9FA97D39AA6
          A7A06A96EEB6B9B985D1BA951DA81B0D4621C0ED59AE72CFB81BB46398E69886
          6790A114A0AAC189E1063DB24A9C388A82054504C4D61B72308D82F6B5C6BDEE
          1BA85E5048D71A7D9A0F205ACD2A4E14D0733ED668585C284F699DC4726D71A7
          30561BD3EEBDE4FA8707CB1E65EA162B30CFBDA0347A072AA31AD9B26A15B81C
          E4112195132C639B888807CA17B80D49B44D31F6B138BF073BC5C9D6B8E778FC
          636FAD5E44DB619A186B89C33B9C466C0E3968D00571DA68AB2DAEB9DABA2F69
          C4C8647AA1FE5EAE2F2865D26AAB070F23258A5E452AA9AE8A4A94DCB97B8511
          01129ADC8B7010A8A0B59ECE705D197653C84872EE126B7A6710698F64376D8B
          B4652B99AD7C7B302D241E63B88D854C7D8647B23BD63B17CE26B4DC96358A43
          ACB466338AB16CE1CBF299C90AAAAED74013058086044A4030A642F800001BDC
          73B53179781B23A221A3000549C779DFB946F835FC3FC3F24B6B15E36495E039
          EF710D67A2681AD7572D466248CCE3E45B77D6683C8637A93976352B8DCB4464
          0DD0C9D00867CC976CE54339494551F692508531C0E0A00144A1E46E1EA15BAD
          2637B6C1CC734877A58118E2B9DF1CDDC12F14453C7231D19309CCD707346520
          1A9068294C6BBB15A79D31D71B0F1DDFF85CAE4181E450518D984A15C4948463
          A6C82663B05485032AAA6528098C360B8F91AD26856B34776D2E6380A1C48237
          2E8FDE66B76175A1CD1C3711BDC5CCA06BDAE268F1B81AAC97BC98067992EF2F
          CCB1CC227E7E3BF86E391FCC23635CBA43DC228E44C4F7124CC5E4170B85FE35
          EBC416D2C97556B1C4651B013CAB0BBABD62C6D746C93CF1B1DDAB8D1CF6B4D2
          8DC684ADA4CDB1BC8DC74359E32DF1F925F242E1F02DCD8F26D5633E055270D0
          544C5B01454E4502888871B8586B6F3C4F3A586069CD95B8531DA37281E977D6
          EDE3533BA4688BB690E7A8C9421D439B650EEC56A9F4C344AF2BB3A65CED5D69
          289C5C3C128E21493D1CE5BB333C5564D11B9572148A181239C4A037B7E200B8
          00869F42D38BA72668CD00C2A0D2BD6A7FDE6F16362D398DD3EE5999D200EECD
          ED2ECA013EC9A81980AF2EC517E45A8F70681DE0E1EE0188E4336861D2E57F89
          4CB18F74E9BBB60AFCE9A2AAA8A6628F248E28AA17F5E5F7561CB6571657558D
          AE394D41009A8FECC0ADED9F11695C47A3065E4D1B0CACCB235CE6B5CD78DAE0
          09F786769E8578387E464CBB1782C9891AF61FF3A669B9522245151BBB6AA183
          F7882C9285298A64CD728F8F36B878AE8104BDAB03E84546C3B42F96B51B2365
          732405CD76471199A439AE1B8822A28462B24AF55849444A225112889444A225
          11288A32DAFA930BDCD8A38C4F348FFA96C6115636451B11DB17161005DBA820
          3C4C0036101012983C18042B12F2CA3BB8F2483EB1D0B79C3FC4377A1DC8B8B5
          750EC20FAAF1EEB86F1E31B41AAADFCEF5AECCD4F02184EDAC215EC2E8B8C318
          71CCB22B92790E3A9DAC064152F35510285AE99F922360003943E5A8BDC5ACF6
          CCECE6676B08D847ACDF38F273AED3A4EB7A76B13FCD69D38B1BE77AEC7630CC
          79C60D757DE147FD92714C0B624B953688EB1DBD876E483665F6E3F5CEDC4938
          BC8D9A6236FA66F20B7EED6E3600F0A897EC2D2DAE9D87632B641EEC98387303
          BD5357D1A2A937F6735ABCED9AD0992071F79D18C5BFDDAF3AD9389DD39963AB
          24E263A7391C7C8113102CAE2048E9744E06F0614966C098F137F2D6D597F247
          8BAD9C0F2B68EF22855C70C5A5C8222D622737DD973C67AC3AB8AE725BC1ECE3
          83B947A6D9F4E4AAFC4BF512F08C9AF2E21C4A0770B89C40003C79A3B502F351
          6CF279C01E32AD8785590368758B76307B9239DE06B68A33CA76CEDF8C66F1B2
          C6D67D4DC7DD0F378BBC7ADA5F21394438DD18F6053145402FDA9DC3EDAC49AF
          2E1A08FE1C039C873BC016F34FE1ED2A57070F9AD4A41B035AE8E1EB91F8D3A1
          CB18C5B766E2CC18BAC23AF2AE59B4A59E882333BB333491671CCAD701331684
          4CA8A216F21EF09D4FE81BC579437F7128ECEDB33C9DAF7600740D83AEA79967
          DFF0BE9564F175ACF636EC18B6DA125CF77C6E24B9DF772B7ED05BD9A7B04CE3
          0980313626CA92D9194BFE067CF1C0269326DC43FB268911321AD71F273FCC6F
          B0A1F2D486C6DE5859FC5797B8F80742E53C47AAD9DFCF5B3B66C110D8054B9D
          CEF249F00C073ED52F566A8EA51169D6ECED03AD41D86D07A8DE4742A188ED84
          2557C933196782D0630B1E9F24C482612A3639AC51E660F5F1E6A84AA8150B0D
          82EF162E7DC9D89C5B2B71051BA8B47C442C9B5D9316E169333D196336441314
          DA95629C7EA1C024504B9089BC0F9BD5332AE552F6BFEE175EB65B6CBD5C673C
          E0EB0389713D95C2CA47BF8D916B16D082A2CF3E8DE374965132142E22994DF0
          F8885EB50A85A5653AA3B25A3F78BF908BD51B09866921131CDA5655AB34DC10
          CD9ABC318888ADEF249F039848374C7E70F53140042954228A3FC9FBC5D59C33
          2998C2F26DAC844E4B0328A434AC6AB172C6F69F24A7B4744152333266103F8B
          94C21F7D2A13295F4CDF74FAD98D678EF5CCFEC4FC9F22612C302F9777172694
          6A3260704C5A9E48CD41A01C0C3611F77887DB4A84CA5766C1EE975935664590
          E219D6D467099462AE1AB69D82166FD67081DE265592102A2D8E072FB670318C
          41102808721011001542652BD9C43B67D75CFB3496D7F876D489C8728868D565
          DDB4680B1D13B44080A2E76EEBDBF617148A20272A473097E21E0D6542652BCD
          D73DC7EB8ED6CB58E0B856C54DEE512E9A8B40C63D8E918C1914D220A873323B
          F6C8117B10A26B10446C0220160A5421690BC667DEBEA748641098C32DCF12BC
          D641286868F69F4EF88057A55410049750EDCA44392820529951294C3E82214C
          C1329538EC9DB1AF7504445CF6C9C951C521A6655BC2C7C9B949751133E77CBD
          844C645353873E03631EC5F1E46AAA8B12CBBB27A47049ACDB1DCA73D6D1937A
          E6259CE66D1E0D9E383C7B1905916ED14545041401159470994842889C7907CB
          6AA55568B1EC4BB79D74CDE0737C8F1ED96D168ED6D1E32B9CA4E9A3E64EE358
          85FF00EB2AB372DD27029F8FC442087C3D46954CA57EE03DBDEB76D1CBD1C0F0
          1DB11592E56E63CF26D629BA6E4A2AB74D2F795F6D455122663A69FCC74C0DCC
          A0037287135950994AE95FB8BD676B8AE2F9C3BDBB10CF12CCE41F456353EE13
          748B772F232DF569725102F0F6B905C4FC43EC11A55285728CEE175AE5F5DCAE
          D78FDAF18BE03072C841CC4F7B2F0BF4CFDC894104556E640172FB9C804A229F
          110F2034AA50AF372FEED756701C9A770DCBF70C5C1E4D8D391673B14B367C63
          B65C0A06E06326D8C411B1807C08D2A132951DF687BD3AAF4762D9EC662F98C0
          CFEECC6631BBF88D7EF08F144D43AEA226049CAADCA52267141415008654A7F4
          F1E685D4550DAACCDE774B436150D84A7B636030C3B30C931585C9656148CE45
          CA2D13976C554863AA8375C89A627E405150E0360A5553295F54DF66126DD89D
          0DA731D888FC9712DDF8C4AE48C33F6CFC4C09A4C1AACE92F612226622C458A9
          96C6F703C1BE34AE294C16D7555512889444A22511288944509675D72D25B1D4
          55CE57AEA29D482D7F7259AA62C5D98C3FCE32ED45239C7FAC2358171A5DB5C6
          2F60AF2EC3E2527D2B8CF58D2C06DBDC3C347B24E66FF75D503A94247E886AC6
          8613E31996798879B9128C9A12A64FB8A0748C6FF29AB5FF00EDE807A8E7B7A1
          CA503BD7D49FF8F0DBCBF1478F88F9970FF71AC39D8F19EDB3B2A75BFF00DD9C
          4D940BFB7F726A7FB7E33EB4921FBDFB157FFAA5DB3F0AD2D5879447FB567789
          74D7AF188AC47696069640FD3301C1ECF2EAC888887C45254DEC8FFC0AC88743
          B488D7254F3E3FB16AB51EF2B5EBD194CE58DE48C0678C7A5E35B30C98B28D6A
          8318E66847B26C5023666D932A492650F429084002807DC015B66B434500A050
          89657CAE2F792E71DA49A93D657D5555E69444A22AF1ECF75B320DDBDA2EB364
          B238131CD74E622CE6DB6CC4E4566A2DC85749F26C451A2CA154580552947E42
          9AC2017AB48A9570340A0853A89BBF03D8DDC590EBCE371DA9A272EC771C4F43
          C947B86283633D8B70D1DBC6E9A022A8B6154C9AA503A899400E6E570F5A5157
          30C2AB1FC5FAC9D91CFB3ACAF696710F9747BD8AD33936171ACF3C9D82939698
          9E9960E5B95BB33C3A68228B0228B89886726E5CADF0BF1A50A542B05E9D6AB9
          4D47D76D57886578BB3C6B3B87842B5CB50401B28A8B805943882AE5B098AA8D
          8C037E4357014569352B4C33DC3BB4598F6A0768E79D655F676B4D64F966FA3F
          0F6D94C2C74737501602FF00103D4973A8770E1429414210C52FB7F287A93CDB
          8D55D85141BBDFAF1DD2DBA4DB70595E1F95E6F2A19E2729804A259847B2C351
          C741C724116902659203B9290444CA2A0062FADF980F3104AA8214EFB07ACBB8
          27F2CFD42655A60847EDB73E218FC6EA972776C39483C62CC89AE4273580C809
          14207957800880080F80AAD36AA5460B831EB8EFD83D93D64CB713C39A43C8EB
          6EBAC96212534BB86066D1F971E2DD24CD07090286158A0E542F239487279111
          110BD28950A2ED4DA07B4D35B9BAAFB1F686099CAF2FAF26658DB5730CBF2D8E
          966F7550311152263115C419B6B8DAC916E71B5CB6201868015524517CE5EA26
          F60EA5C66026D67FFD88DFB0C199A91DF591BEF96004E6BBBFA8FA8E16E221F2
          73E7FD1A5304CC2AACC7B85ADE176AF5A77062938ED08D4498F3A976130E040A
          9B27B12417CD9C18FF00CD02A88801843F9A26AB8EC5634D0AACBD2386766B2F
          EA0EDAEC36B872AB8EC36FD9B8B5DBC8242DD0903E318F7B71E5247A8EAE9A6B
          9C1254E41110F16128F3E3568AD15E48AD176C3759F7EC8CD76A3235359666CD
          1DA7A38F8EE266CDF278E9F9E7F34A2AD8C2DDD3C238E243981311028F121000
          02E1F84144A8532629D72DAB0FB3BA07908EBE162C353EB49384DA52092CC8A3
          1F22BC49D04915808B72584CB1CC1C930385C44447C88D569B152BB543BAB7AA
          7BDE1F0EE9143E45ACD7455D63B8720C8F62B259CB054AC225E3945441C2A00E
          0C550A7294478A7C8C16F21540154918AE1B37AA9BDA570CEEBC363DAC9C2AA6
          CCDD10592EBD6283960995FC43576BAABB94805C14A994A5380F13F1379F05A5
          0E2808C1487B9718EC2671D966794667D579BD9BA5750B8136ADC322A5E11935
          9795480801372C2E96E6B87CA3ED22628016C5035FE7E635AAA0A51465B0B447
          64E2E33BC1AD20F40BCCEC3B19389E558CECF42523512A0D14749BBFA058AE15
          2A875511112010BC42FC8D7E161150E2AA08C164BB6F5476DB21732DAF9CE1D9
          D4DEB471A76161F0182C3A6E261A2D39C6D0E924F53C98CAA8559D811C95402A
          402603871297C1844A20AA0214DDA33466598DE55D1E91CC35A654CF20D4DADA
          561A772141FC5042C43A7AD5C2476B22DC45474AAA3E0A999B9F8009C395C006
          AA02A13B559E55CAD4A225112889444A225112889444A225112889444A225112
          889444A225112889444A225112889445E7CB4444CF46BD869D8C69350F24919B
          C8C4BF45372D9C247F064D54552988728FC40C0214448A898A818D650D0718D2
          1A223512B78E8A62891BB66E8902C54D245202908500F4028005117A1444A225
          112889444A225112889444A225112889444A225112889444A225112889444A22
          5112889444A225112889444A225112889444A225112889444A225112889444A2
          25112889445FFFD9}
        Stretch = True
      end
      object QRImage2: TQRImage
        Left = 627
        Top = 3
        Width = 90
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          87.312500000000000000
          1658.937500000000000000
          7.937500000000000000
          238.125000000000000000)
        XLColumn = 0
        Picture.Data = {
          0A544A504547496D616765B92A0000FFD8FFE000104A46494600010200006400
          640000FFEC00114475636B7900010004000000500000FFEE000E41646F626500
          64C000000001FFDB008400020202020202020202020302020203040302020304
          0504040404040506050505050505060607070807070609090A0A09090C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C01030303050405090606090D0B090B0D0F0E0E0E0E
          0F0F0C0C0C0C0C0F0F0C0C0C0C0C0C0F0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080060011803011100021101031101FF
          C400C30001000202030101000000000000000000000709060802030504010101
          0001050101000000000000000000000006010204050703081000000504020102
          03050307060F0000000102030405001106071208213113412214516132150981
          23167142627233B47691528236371892B2D263B32444548475B5261727381100
          0103020303060A07050607000000000100020311042112053141065161718113
          0791A1B1C1223242527214F0D16282337334E1B2234335F19253241516C26383
          44253617FFDA000C03010002110311003F00BFCA225112889444A22511288944
          4A225112889444A225112889444A225112889444A225112889444A2251128894
          44A225112889444A225112889444A225112889444A225112889444A225112889
          444A225112889444A225112889444A225112889444A225112889444A22511288
          9444A225112889444A225112889444A225112889444A225112889444A2251128
          89444A225112889444A225112889444A225112889444A225112889444A225112
          889444A22D6CDBDDA4D57A81C8C1BC76B6559A9C4136F8541101CBCF70DF808B
          080F044447D00C3C87E051AD5DF6AF05B1CAE399DEE8C4FEC535E1CE02D4B5A6
          F6AC688E1DF23FD16D37D37BBAB0E5216B7E4FBCFB3530CC25DDA384758F1174
          51518C866AEC8A4B2A97A00A6D14299430FD81F4C5FE5AD54DA85EBC6639216F
          2BCFA5E0FD8A6961C2BC3B03FB3699F50986D10B69183CEF1875F68542AB6C99
          097388BBEE16C0CB5C5C0554F02C3DE11B94C3EA0458A2D8043FD1AC03745FB6
          E5EEF81869E65266E871C3EAE8F6F18FF9F3B4BBAC7A5E55C0738711C3EF7FBC
          F6EEC64C40BFD5645893C72D83EF307D41C003F653E60B7FEE261F13491E5577
          FA5B65C069963273473B5AEF2052461DB87B007549FF00C71BCB5CF60C899B89
          715912160E6D500F81105CAC8E630FF5CDE7E159505F5DFF002A564BCC7D1778
          305A5D4B86F4303FCED8DCD97DB6FF001621D2E19C78829DB0CEE662E79C4B0B
          DD18949E93CC844A5F6E688618E54C3E00C574242090A611F0639787F4C6B630
          6BACCDD9CED31BB9F6787E839D45353EECEE0426EB4C959770FD8F5C7DDA9A9E
          60737D95B9A82E8BA45172D962386EE085510709180E4390E17298A60B808080
          DC042B780822A1735734B496B8508DA176D555A9444A225112889444A2251128
          89444A225112889444A225112889444A225112889444A225112889444A22D0BE
          C4EF7CD2673669D74D067F733F96FDDE5794246B162113140E7211500104CE44
          C79AAA7AA602052FEF0C1C63BA9EA323E5F95B6F5CED3EEFD379DDD2BACF06F0
          9DA416675AD5FF004EDF5187F98760A8DE09C1ADF68D49F4463AF9ACF1275FC4
          725AF7ACA93698CB234C64B6AF68A69107246ABAB7059085229CC0A223CAC60B
          9D4FC5CB887B95ACB484E7315A62E1EBCA71A7C3F4C7C6A5FAE6A2DF976DE6B8
          4B6276305930E5CC06C74C4539B0C1ADD94AFA2B86EC8EC3BAB196E22A3CC2D9
          EF6CD7298F7127339BE7AE9778E3DF4562A7FB96D73A2428F2B85C0C60FF003A
          97ED8F4D91B56895EE152E79AF8B62BB85E5BBE2EB598366367046E0D6C70343
          5B4209C5D8389F00E65E9615FA844DFE7F8D434C6B9C7B1FC51D4836692CEA39
          65CA668D5550A99D64D312813F7603CAC3F00ABA0E267676B5CC686D4569B82F
          1D53B9D8BB09658AE647CA1A4B4380F49C054026B5C762973B15DCBCAB4D6CE7
          D8143E1B0D3F1EDE3193E2BE78E5722A617653184A254C04B60E3E2B3753D75F
          69318DAD04501DBCAA3BC19DDA5B6B9A736EE499EC71739B40011E8D395619A6
          E6305EE5CCE5F13B1749E3F026818F45DB3CB60BDE6EFF00EA565449C7EAC854
          C791403900184DF785ABC2C648B56739B2C4D141B46DF0AD9712DADEF03C50C9
          657B23F3B8831BE859940AFAA49C0ECD83A549A7EBA642C5D9F5FE6F9F40ED4D
          30A96F1D139A2CA23944281FE505236492298D74C0A16E4205307CB62F9BE5FF
          00A63C1ECE4787C5C8EF5DBF0B968871941237E72D6DE4B7BD1B5D08060979A4
          8CF2EFA548DB8AC8345EB2D81A3F227D8FB5DAF8F661A55651418984937472CB
          470183910CDCC529910F9BC1C806021BF194086B80FAE9F692D9BCB448D745B8
          13E90E8DDF4DCB138AB5CB1D7E06CCEB4922BD00667340ECDFF17B5CE0D0B87A
          A4B862B72DBB96CED3059AB84DCA42360552381CB70F85CA2215BC041D8B9ABD
          8E61A381079D769CE44C865143010840131CE61B00007911111F4B55550024D0
          281677B49D7DC71F2B1B29B56141E206122C9343A8F40860F02063B54D528087
          D97AD749ABDA46686415F0F914B2D380F5DBA607C76AFCA7968DFDE20ACF307D
          ABAE36524B2B8266915938B72F272D99AE532E9147C72510371508171F53142B
          22DEF21B8FC3703D0B53AA6817FA5902EE17C75D85C303D0ED87A8A902B256A1
          752EE106A8A8E1CAC9B66E887255754C042143ED318C2000154240C4AB9AC2E3
          468A92BC9FE26C6C7D3208D1FF00C5A3FF002EACED59CA3C2BDFE4A7FF000DDE
          03F52EF6F390AE952A2D66193958E362249384CE611FB80A6111AA891A7610AD
          7DACCC15731C07382BD4ABD7825112889444A22511752CB22DD332CE15220893
          C9D550C05285FC7911B005509A2AB5A5C68054AE86F20C1E1CC9B47CDDD1CA1C
          8C445521C403D2E20511AA0703B0ABDF13D82AE691D217D9572F34A225112889
          444A225112889444A228FB66E609EBED7B9A66CA015436310CEDFA099BD14593
          48C28907FACA712FEDAC6BB9C4113E43EC8256D341D34EA57F05A8FE63DADEA2
          4663D4DC553F632EA6F0CEBD4D674D1751D6DBECEE52B62F1932611FA92C702C
          6FAE3A6A5F9019CB81314C21FE7107F9A150988BA2B4320FC499D941DF4DFE12
          BE90BE8E1BED79968E005A69F1095CDF673D3D0047D86508E83CAADD74FEB082
          D3FAFB1FC1A091201231029A55F14A00678F8E50170E4E36B889CDE97F42814A
          1E002A696368DB589B1B776DE73BCAF9DF88F5D9B5ABE92EE53EB1F447BACF65
          A3A0784D4EF5A73FA8D32663ADB069116880C817262B62BFF6CBEF822666E4E6
          4814B72020980044B7B5C006B47C50D1D8B0EFCDE62BA4F72F23FF00D427654E
          5ECAB4AE15CCD15A6CAF3AA7D30018A25305C0C1610FB86A10BE8F068B6DB756
          7917B1B436869C553686CD619D4963997BE2913078BFE58DD02353AE700F70C5
          3A2629C390DB909AD5BABFB86DC5AC2EC330AB4F2E0053C4B9DF0BE932697ADD
          FC409EC5C1924631CA3B42E2EA0D80875461B805B7FF00A6EFFA8BB2FF00C46D
          FF00B9275BBE16FC293E2F32E73DF5FEB6DBF2CFEF15ACBFA811086DFC9098A0
          2218B4685C43FE79D56AB897F57F7479D4E7BA0246867F35FE46AF8757749F2C
          DAFACE2763C16630AC0B349BB333847AD9603019AB855BF13B820894390A57B8
          146D7AB6D34092E6112B5C056B811C868BD75EEF42D747D45F652C2F7642DAB8
          11ED00EC1A792BCAA32EB66C1CC35E6E2C210C71FB92B49D9D670D3D8FA4A18C
          D9EB776B95BA80648044826272E643805C043D6D7AC4D2AE6482E181A7024023
          71A9A2DE71BE8F69A96933BA668AB2373DAFA7A4D2D19863B687611BEAB74BF5
          06DC5371ABC0E9E8090563D949B0FCDF3251B9C487708A8A1926CD0C60B0FB62
          299CE70BFCDF280F8B80EF7896F9CD22069A022AEF305CCBB9FE1A865126A533
          438B5D923AEE2002E7F4E2034EEC5415D77E98C86EAC3CD9CCD6586C3E01DAEB
          36C7D06CD0AE9C39FA730A6A2C6E674CA44C140129402E26B0FA05AFAFD33423
          771F68E7651BB0AD54AF8CFBCC668577F29145DAC8002F25D9436B886E009269
          89DC2A36AF813EAEF64F57EDB286B5857932FB187293A81CEDA8A6C983948E00
          7022A772A90B610B9164AE60F50F20203568D22F6DAE3F84092363B603E1F185
          EAEE3CE1ED5B4BFF003CF0D6C8087446AF7B4F28CA0F4B1D8752BB6875E45CC4
          C5B8986448D965DA22A4A4726A02A441C18802AA4550BE0E043DC00C1EBEB53E
          6125A0B850D315F2F5C3636CAE6C6ECCC04E534A5457034DD51B9421DA9001EB
          BEDC0100101C7D70101FEB16B5FAC7E8E4F854A7807FAF5A7E60546BA775638D
          C5B0A1B5F47493683773293B553937080AC9A60D1B9D71012104A23C80960F35
          CFAC6CCDD4C220695AE3D02ABEA8E25D79BA2583EF1ED2F0D2D140684E621BB4
          D795675BEFAEF90F5DE571A4653218F9C26469385E2E4238AA365923B43260A0
          1D330898BFDA944A60379F3E821591A8E98FB0736AE06BB2986C5AAE11E32838
          9A294B23733B320383A8E07356943BF61A8215A7F4873FCAF3FD2A45F2E78BCA
          BDC7261CC3319A72613ACE9AA29A2AA62A286F27327EE8A6261F23C42FE6F530
          D02E649EDAAF3520915E50B8277A3A45B69BAC16DB80D6BD81E5A3635C490683
          7034CD4E7E452AEC3EC5E99D592230D99E70D184D9085514856E9ACF1DA65385
          CA2A24D88A0A770F21CED70F359973AA5B5B1CB23C03C9B4F8968346E0CD5B57
          8FB4B580B99EF121ADEA2E22BD5558245774BAE12CE92685D8011C758C0522D2
          0C1EB5440446C1C9551002143EF3080563B35DB371A67A74823CCB6B71DD9710
          42D2EF97CD4F75CD71F00353D4B651C4CC535865F2155F24308D999E4159348D
          EEA5F4A44C55158A64F9722F00E4025BDC3D2B6864686E6AE14AD79942596D23
          E510869CE5D969B0E6AD298EC35C3150DE2FD9BD11993C74C71DD8F1EF5C3160
          BCA3D155272D53459B6028ACB28AB94524CA52720BDCD5850EAB6B29218F0682
          BBC61D6A497FC0FAD58B03E6B67005C1A316B8973B63406924934E458FC57703
          AED313A863ECF63362BB74B0376AEDCB576DD9A8A18789401D2C891200111F02
          26001FB6BC99ADD9BDF943F1E834F0EC59971DDCEBD0406675B1A0152016B9C0
          7C209778AAB8F716C3D6ADA5E8202C997FEA0D6A9AE7E8A4E81E50ABDDB7FEC3
          6BF13BF71CB423F4E429436DE7020001FF00B44DFDFDB547385FF50FF87CE175
          BEFA0FFE2E0FCEFF0081CAC2E57B5DD798492908892DA5168BF8A70A357E9113
          72B148AA46129CA0A2489C86B085AE53085499FAC5A31C5A64151D3F52E3B6FD
          DFEBD711B6465ABCB5C0118B4607660483E153B45C934998E632CC0CA28C6450
          23866A2A92881CC9A81C88614D5290E5B80DEC6280D6C58E0F008D8544E785D0
          48E8DFEB34D0D08388E71507A8AFBEAE5E49444A225112889444A225116BB76A
          E21E4EF5EB6A32605319C27100F78140444C9B05D276A96C1F69113056B35861
          7DA48072790A98F77D72CB7D7AD5EED99F2F5BC160F190AB6DCCD352683E9E66
          9C40F0BADB3D7B1F941C3C95150640AF0A27FB2E8A426F3F6FDF516320F94B69
          3731E41F0D7C8BB632D5C75CD62D7DB9EDDAE6738C9930FBC68AEAC872284228
          99C144D428188728DC0C03E404043D406A78BE63208342ABDBF51AFF0065783F
          F8B09FDC5D54678A3F019F1798AEC3DCBFF539FF0024FEFB5567629A926F30D6
          5B1F66453C485AEB459904B430A6632CB20EAFCD74CE0360044A1C8C021E4004
          6FE2A290D93A581F283EA52A3A7EA5DC750E2286CB51B6B191A6B701D95D5C01
          6EC691F6B60E7513D82F7B79F4BD61290AB74FD377FD45D97FE236FF00DC93A9
          AF0B7E149F17997CEBDF5FEB6DBF2CFEF15ACDDFFF00F6FC5FBB178CFF00A575
          5AAE24FD5FDD1E7538EE87FA1FFD57F91ABCDD65A0BB399F6B28B98C0F2F336C
          0E653744618F8E42ED990C522EA24B105A90BED140EA14C2202361BDC7D6ACB4
          D36F67803A377A06B866237F26C5EDAEF1770E69DA8BA2BB86B3B4B6AFEC9AED
          C083989CD80A7428FB48E791DD7FDBC4799EE04DA5DE63D20A45CA28E0E7FAC8
          4548733770BB5294E281CE9F9BF2288887E0316F7AC6D3EE058DC5646548343C
          ADDC69BBE982DC714E93271269596D272D0F6873694CB2823335AEC3300798ED
          F58152A77F18AE96F2632FE548F9FC5A3978C701F80E44945D33F11FB86C3FB4
          2B33891A45D076E2D14F1AD0F7452B4E8CE8FDA64AE0E1D21A47D399585749E6
          E365BAE7833562B915710067F1D2A89443924E0AF16578983E1C88A14C1F7085
          49741903ACD806EA83E12B8EF79F6B243AFCEE78C1F95CDE71940F2823A971CF
          BB8FA9B5AEC890D759404982B16837348640C5123B6882EB809C5054A99FDD03
          1082531B890DEB6F50A5CEB96F6F3189F5C378C47472A691DDB6A9AAE9EDBD83
          2D1C4D18E395C40C330A8CB426A0548D8B66E0A6E33258589C8615CFD6C3CE34
          45F45BCE074FDD6EB90144CFC14294C1C8A20361001ADB4723646873761150A0
          F756B25ACCF865147B096B8606841A11861B5429DA9FFF003BEDCFFC816FF8C4
          AC0D63F4727C2A4FC03FD7AD3F3079D51C69FC4F39CDF6043E37ADE5860F307A
          93A3C64983C5580A644503A8B07D4200272F24CA21E03CFA573EB18659A60C88
          D1C6B435A6EE55F547126A1656162F9EF599E105B56E50FAD4803D1760715226
          F7D23BBF5A843E4DB6DF0E4CDA51708F673832ABC9F150A532A0DCE65F82A981
          8A53085BC781F37ACAD46C2E6DE8F98E6AE15AD7A969784F8A346D573C1A737B
          32D198B7208F0D99865AB4D0D3C5B959C74AB6CE37B075B2F8BC3624CF097DAF
          8E9357F0D1C639DA2A9BBE6A26E9232A2656EA98A7E607318DC82FC86F52DD06
          F593C391AD0D2CDC3663BD70CEF3B87AE34DD404F2CA656CF521CEA6605B405A
          6986008A50014DC28B4C76D619D47C5B63CB4AE4BB672ECDE6466567F986371C
          820F4175CCA8A8BB655F108D889DC7E41E2A722878F0215A2BD834F8E62E7C8E
          71AD4818F5570F2AE97C3DA9F14DDE9EC8E0B48626640D8DEE259414A35C184B
          89E5C5B43B715AF3BB6735A646BE3F27AB35048EB0C780AE501917AA2A624B18
          BED894C4218544C0C880FCC2450C23C8397A056AF5092190B4C3116371C4FB5F
          D9D2A65C2D6BA8DA8923BFBC6DC4981A36958F6ED381F4B755A3660ACBBAD128
          FA4FA592857CB997FCAA1F2860C8C61B891BA00E7DA25FEC200D83EC0B054AF4
          A79769A6BB838795710E38B7645C5EDC82999F0B8FC472D4F5EDE95573D7ED6E
          9EDCD9D8A6BD7326E22236788B9A65DB510F745A3440CE944CA06B9444E29000
          7201001F9AC36A88E996BF353B622680EDE802ABBCF186B6745D3A5BC6B439CC
          23283B3338E507970A9D94E4AE2B21ECDEA185D2DB45EE130320EE4E1158C692
          4CD47E24338215CFB84324A1D3290A6B1931101E21E06DF0BD7AEAD64DB49CC6
          D248A038F3AC2E05E239B5DD345D4CD0D787B9A72D6872D0D4024D36F2AB22D9
          724F25BA0094948AE672F5DE158F19CB838DCC737BEC839187E2236F23528BB7
          1769353B7237CA1715D0E0643C7058C14689E5A0EA7AA9DC1F6564FAE5BE605C
          55DFE58F73287FC8DECB1044ABB7687588B2BEC1804389CE04E1CBD4A02225F9
          AC210DB7BA7DB8764342E14AF3732FA0B55D12DB54743F30333627E70DDCE750
          819B940AD69BF7E0B693A2184EB3CBF65C89F320FAEC971B6A9C96178FB82945
          9AC64CF659C1807CA8AB711209482160BF3F225F9771C3B6F0CB31ED3170C5A3
          774F48502EF6354D46CB4E68B6C229096C8E1EB0AEC6F335D8D4EDC32EFC6ECA
          A7ABE604A225112889444A225112889445F03A68D1FB672C1E22472CDEA4A20E
          DB9C391144D52894E4307C40C5110AA38661476C2AE89EE8DC1CD3470A107931
          AD7C2A9F56C36374C65DB0FACBB5173B1D41B70E0FB5E66EB05D28D7E998018B
          B131AC50F6C4088B80F1F84A61B26711A84181B6923ED26C229316BB90EE3E63
          F52FA45BA949AE5ADBEBBA78ADE5B7A32C636BD87D76F5E2F8FA481E9368B6AF
          AF3BA64B0D7ADBAEBBCD424067B8CA646986644E4F665904697E56A2838358A6
          381000A51BFCE0001FDA018B5B8D32FDD11F95B8C1E3D53B9C3750FD2BD2A01C
          63C331DF30EB3A57A76F21AC8C1EB42FF6B33770AE27DDF8685413FA90E57289
          4A6B9C285CA248070D5CCDA8DCC428282F1138B621C141F9B8826A9838FA5FCD
          6BB8A66707323DDB7AF62967729A7C663B9BAA1ED010CAEECA4663872D40C544
          1D19CA5FBAD8D29A91455AB9C2362C5489F2B8C3A443A8BFD3B33A6402ABF888
          1C5410100F5AC1E1E98998C386478351D4A47DEAE9EC65833510089E07B721AE
          033381386FD8B55B63E1CEB5AE799660728A003AC5E45666454E3C4564007937
          58007E0AA4621C3F96B4F7501B795D19F64D3EAF129F68BA93755B28AEE31848
          D07A0FB43A9D50AD0BF4DB390F826CB121CA700C8DB808946FFF00624EA5DC2D
          F8527C5E65C27BEC045EDB57FC33FBC542FDE2D79B0327DE3F99E37834FE4118
          18E4723F98C6C6B97487B8451C0989EE24998BC83905C2FF001AC0E20B5964BA
          AB18E2328D809E5526EEAF59B1B4D1BB39E78D8EED5C68E7B5A6946E342546D8
          766FDCCD7F8B31C2F10C7B2E87C7634162B0665C58553A5EFA87554105556673
          DC4E711F23E2B160B8D460608D8D7068FB3FB16EF52D2B84B52B975D5CC90BA4
          752A7B6A56800180781B02F2F5FF0054F79ED3CC50532BC5A631A8A957A2F72B
          CBB2020B754C9AAA7B8E14226B082AAACA5C6C005B5C6E6100AB2DB47BAB993D
          369009A927C7CE4AF7D5FBC0D1748B422DE5648F6B72B238F115028D048F45AD
          1BF1D9B2A55A8762BAE30BBCB0A8D866CE890594628511C42714289D320090A4
          3B67005F98C92A042DC43C94400C17B080CC354D2DB791068C1CDD87CC799703
          E0CE349B87EF1D2B8678A4FC46EC2778737ED36A69B88241E5157C9F5A3B71AE
          1F3E4316839B660EC3DB73218B4CA69A2E481700137B6E113887D9CC80215111
          A56A16E48603F74EDF185DD9DC71C2DAA31A6E1EC34D8258C92DF0B5C3C05677
          A8FA2DB3F2CC91A49EDB6DFC278A91C03999416769BA9591F9B91D22FB275413
          F707C1D439F90008D8A2359365C3D3CAFACFE8B77E3527E9CAB55C45DEB69D67
          6E63D38F692D28D21A5B1B39F102B4DCD029CA55CAB46AD98B56CC99A046CD19
          A4441AB64C389134D32814842807A0000000054E4000506C5F354923A471738D
          49352794950AF65E2A526F436D189858E732F2AFE115498C6B348EBAEB1C4E4B
          1534C802630FDC01581AAB1CFB591AD15246C0A4FC11711DBEB76B24AE0D6364
          04926800C7693B152B61187762F5C64AC72FC375CE5F1190C69164D9BF1C7DC2
          FC0AE13324A07B6B373906E4308790A81DBC1796EF0F631C1C3EC9FA97D39AA6
          A7A06A96EEB6B9B985D1BA951DA81B0D4621C0ED59AE72CFB81BB46398E69886
          6790A114A0AAC189E1063DB24A9C388A82054504C4D61B72308D82F6B5C6BDEE
          1BA85E5048D71A7D9A0F205ACD2A4E14D0733ED668585C284F699DC4726D71A7
          30561BD3EEBDE4FA8707CB1E65EA162B30CFBDA0347A072AA31AD9B26A15B81C
          E4112195132C639B888807CA17B80D49B44D31F6B138BF073BC5C9D6B8E778FC
          636FAD5E44DB619A186B89C33B9C466C0E3968D00571DA68AB2DAEB9DABA2F69
          C4C8647AA1FE5EAE2F2865D26AAB070F23258A5E452AA9AE8A4A94DCB97B8511
          01129ADC8B7010A8A0B59ECE705D197653C84872EE126B7A6710698F64376D8B
          B4652B99AD7C7B302D241E63B88D854C7D8647B23BD63B17CE26B4DC96358A43
          ACB466338AB16CE1CBF299C90AAAAED74013058086044A4030A642F800001BDC
          73B53179781B23A221A3000549C779DFB946F835FC3FC3F24B6B15E36495E039
          EF710D67A2681AD7572D466248CCE3E45B77D6683C8637A93976352B8DCB4464
          0DD0C9D00867CC976CE54339494551F692508531C0E0A00144A1E46E1EA15BAD
          2637B6C1CC734877A58118E2B9DF1CDDC12F14453C7231D19309CCD707346520
          1A9068294C6BBB15A79D31D71B0F1DDFF85CAE4181E450518D984A15C4948463
          A6C82663B05485032AAA6528098C360B8F91AD26856B34776D2E6380A1C48237
          2E8FDE66B76175A1CD1C3711BDC5CCA06BDAE268F1B81AAC97BC98067992EF2F
          CCB1CC227E7E3BF86E391FCC23635CBA43DC228E44C4F7124CC5E4170B85FE35
          EBC416D2C97556B1C4651B013CAB0BBABD62C6D746C93CF1B1DDAB8D1CF6B4D2
          8DC684ADA4CDB1BC8DC74359E32DF1F925F242E1F02DCD8F26D5633E055270D0
          544C5B01454E4502888871B8586B6F3C4F3A586069CD95B8531DA37281E977D6
          EDE3533BA4688BB690E7A8C9421D439B650EEC56A9F4C344AF2BB3A65CED5D69
          289C5C3C128E21493D1CE5BB333C5564D11B9572148A181239C4A037B7E200B8
          00869F42D38BA72668CD00C2A0D2BD6A7FDE6F16362D398DD3EE5999D200EECD
          ED2ECA013EC9A81980AF2EC517E45A8F70681DE0E1EE0188E4336861D2E57F89
          4CB18F74E9BBB60AFCE9A2AAA8A6628F248E28AA17F5E5F7561CB6571657558D
          AE394D41009A8FECC0ADED9F11695C47A3065E4D1B0CACCB235CE6B5CD78DAE0
          09F786769E8578387E464CBB1782C9891AF61FF3A669B9522245151BBB6AA183
          F7882C9285298A64CD728F8F36B878AE8104BDAB03E84546C3B42F96B51B2365
          732405CD76471199A439AE1B8822A28462B24AF55849444A225112889444A225
          11288A32DAFA930BDCD8A38C4F348FFA96C6115636451B11DB17161005DBA820
          3C4C0036101012983C18042B12F2CA3BB8F2483EB1D0B79C3FC4377A1DC8B8B5
          750EC20FAAF1EEB86F1E31B41AAADFCEF5AECCD4F02184EDAC215EC2E8B8C318
          71CCB22B92790E3A9DAC064152F35510285AE99F922360003943E5A8BDC5ACF6
          CCECE6676B08D847ACDF38F273AED3A4EB7A76B13FCD69D38B1BE77AEC7630CC
          79C60D757DE147FD92714C0B624B953688EB1DBD876E483665F6E3F5CEDC4938
          BC8D9A6236FA66F20B7EED6E3600F0A897EC2D2DAE9D87632B641EEC98387303
          BD5357D1A2A937F6735ABCED9AD0992071F79D18C5BFDDAF3AD9389DD39963AB
          24E263A7391C7C8113102CAE2048E9744E06F0614966C098F137F2D6D597F247
          8BAD9C0F2B68EF22855C70C5A5C8222D622737DD973C67AC3AB8AE725BC1ECE3
          83B947A6D9F4E4AAFC4BF512F08C9AF2E21C4A0770B89C40003C79A3B502F351
          6CF279C01E32AD8785590368758B76307B9239DE06B68A33CA76CEDF8C66F1B2
          C6D67D4DC7DD0F378BBC7ADA5F21394438DD18F6053145402FDA9DC3EDAC49AF
          2E1A08FE1C039C873BC016F34FE1ED2A57070F9AD4A41B035AE8E1EB91F8D3A1
          CB18C5B766E2CC18BAC23AF2AE59B4A59E882333BB333491671CCAD701331684
          4CA8A216F21EF09D4FE81BC579437F7128ECEDB33C9DAF7600740D83AEA79967
          DFF0BE9564F175ACF636EC18B6DA125CF77C6E24B9DF772B7ED05BD9A7B04CE3
          0980313626CA92D9194BFE067CF1C0269326DC43FB268911321AD71F273FCC6F
          B0A1F2D486C6DE5859FC5797B8F80742E53C47AAD9DFCF5B3B66C110D8054B9D
          CEF249F00C073ED52F566A8EA51169D6ECED03AD41D86D07A8DE4742A188ED84
          2557C933196782D0630B1E9F24C482612A3639AC51E660F5F1E6A84AA8150B0D
          82EF162E7DC9D89C5B2B71051BA8B47C442C9B5D9316E169333D196336441314
          DA95629C7EA1C024504B9089BC0F9BD5332AE552F6BFEE175EB65B6CBD5C673C
          E0EB0389713D95C2CA47BF8D916B16D082A2CF3E8DE374965132142E22994DF0
          F8885EB50A85A5653AA3B25A3F78BF908BD51B09866921131CDA5655AB34DC10
          CD9ABC318888ADEF249F039848374C7E70F53140042954228A3FC9FBC5D59C33
          2998C2F26DAC844E4B0328A434AC6AB172C6F69F24A7B4744152333266103F8B
          94C21F7D2A13295F4CDF74FAD98D678EF5CCFEC4FC9F22612C302F9777172694
          6A3260704C5A9E48CD41A01C0C3611F77887DB4A84CA5766C1EE975935664590
          E219D6D467099462AE1AB69D82166FD67081DE265592102A2D8E072FB670318C
          41102808721011001542652BD9C43B67D75CFB3496D7F876D489C8728868D565
          DDB4680B1D13B44080A2E76EEBDBF617148A20272A473097E21E0D6542652BCD
          D73DC7EB8ED6CB58E0B856C54DEE512E9A8B40C63D8E918C1914D220A873323B
          F6C8117B10A26B10446C0220160A5421690BC667DEBEA748641098C32DCF12BC
          D641286868F69F4EF88057A55410049750EDCA44392820529951294C3E82214C
          C1329538EC9DB1AF7504445CF6C9C951C521A6655BC2C7C9B949751133E77CBD
          844C645353873E03631EC5F1E46AAA8B12CBBB27A47049ACDB1DCA73D6D1937A
          E6259CE66D1E0D9E383C7B1905916ED14545041401159470994842889C7907CB
          6AA55568B1EC4BB79D74CDE0737C8F1ED96D168ED6D1E32B9CA4E9A3E64EE358
          85FF00EB2AB372DD27029F8FC442087C3D46954CA57EE03DBDEB76D1CBD1C0F0
          1DB11592E56E63CF26D629BA6E4A2AB74D2F795F6D455122663A69FCC74C0DCC
          A0037287135950994AE95FB8BD676B8AE2F9C3BDBB10CF12CCE41F456353EE13
          748B772F232DF569725102F0F6B905C4FC43EC11A55285728CEE175AE5F5DCAE
          D78FDAF18BE03072C841CC4F7B2F0BF4CFDC894104556E640172FB9C804A229F
          110F2034AA50AF372FEED756701C9A770DCBF70C5C1E4D8D391673B14B367C63
          B65C0A06E06326D8C411B1807C08D2A132951DF687BD3AAF4762D9EC662F98C0
          CFEECC6631BBF88D7EF08F144D43AEA226049CAADCA52267141415008654A7F4
          F1E685D4550DAACCDE774B436150D84A7B636030C3B30C931585C9656148CE45
          CA2D13976C554863AA8375C89A627E405150E0360A5553295F54DF66126DD89D
          0DA731D888FC9712DDF8C4AE48C33F6CFC4C09A4C1AACE92F612226622C458A9
          96C6F703C1BE34AE294C16D7555512889444A22511288944509675D72D25B1D4
          55CE57AEA29D482D7F7259AA62C5D98C3FCE32ED45239C7FAC2358171A5DB5C6
          2F60AF2EC3E2527D2B8CF58D2C06DBDC3C347B24E66FF75D503A94247E886AC6
          8613E31996798879B9128C9A12A64FB8A0748C6FF29AB5FF00EDE807A8E7B7A1
          CA503BD7D49FF8F0DBCBF1478F88F9970FF71AC39D8F19EDB3B2A75BFF00DD9C
          4D940BFB7F726A7FB7E33EB4921FBDFB157FFAA5DB3F0AD2D5879447FB567789
          74D7AF188AC47696069640FD3301C1ECF2EAC888887C45254DEC8FFC0AC88743
          B488D7254F3E3FB16AB51EF2B5EBD194CE58DE48C0678C7A5E35B30C98B28D6A
          8318E66847B26C5023666D932A492650F429084002807DC015B66B434500A050
          89657CAE2F792E71DA49A93D657D5555E69444A22AF1ECF75B320DDBDA2EB364
          B238131CD74E622CE6DB6CC4E4566A2DC85749F26C451A2CA154580552947E42
          9AC2017AB48A9570340A0853A89BBF03D8DDC590EBCE371DA9A272EC771C4F43
          C947B86283633D8B70D1DBC6E9A022A8B6154C9AA503A899400E6E570F5A5157
          30C2AB1FC5FAC9D91CFB3ACAF696710F9747BD8AD33936171ACF3C9D82939698
          9E9960E5B95BB33C3A68228B0228B89886726E5CADF0BF1A50A542B05E9D6AB9
          4D47D76D57886578BB3C6B3B87842B5CB50401B28A8B805943882AE5B098AA8D
          8C037E4357014569352B4C33DC3BB4598F6A0768E79D655F676B4D64F966FA3F
          0F6D94C2C74737501602FF00103D4973A8770E1429414210C52FB7F287A93CDB
          8D55D85141BBDFAF1DD2DBA4DB70595E1F95E6F2A19E2729804A259847B2C351
          C741C724116902659203B9290444CA2A0062FADF980F3104AA8214EFB07ACBB8
          27F2CFD42655A60847EDB73E218FC6EA972776C39483C62CC89AE4273580C809
          14207957800880080F80AAD36AA5460B831EB8EFD83D93D64CB713C39A43C8EB
          6EBAC96212534BB86066D1F971E2DD24CD07090286158A0E542F239487279111
          110BD28950A2ED4DA07B4D35B9BAAFB1F686099CAF2FAF26658DB5730CBF2D8E
          966F7550311152263115C419B6B8DAC916E71B5CB6201868015524517CE5EA26
          F60EA5C66026D67FFD88DFB0C199A91DF591BEF96004E6BBBFA8FA8E16E221F2
          73E7FD1A5304CC2AACC7B85ADE176AF5A77062938ED08D4498F3A976130E040A
          9B27B12417CD9C18FF00CD02A88801843F9A26AB8EC5634D0AACBD2386766B2F
          EA0EDAEC36B872AB8EC36FD9B8B5DBC8242DD0903E318F7B71E5247A8EAE9A6B
          9C1254E41110F16128F3E3568AD15E48AD176C3759F7EC8CD76A3235359666CD
          1DA7A38F8EE266CDF278E9F9E7F34A2AD8C2DDD3C238E243981311028F121000
          02E1F84144A8532629D72DAB0FB3BA07908EBE162C353EB49384DA52092CC8A3
          1F22BC49D04915808B72584CB1CC1C930385C44447C88D569B152BB543BAB7AA
          7BDE1F0EE9143E45ACD7455D63B8720C8F62B259CB054AC225E3945441C2A00E
          0C550A7294478A7C8C16F21540154918AE1B37AA9BDA570CEEBC363DAC9C2AA6
          CCDD10592EBD6283960995FC43576BAABB94805C14A994A5380F13F1379F05A5
          0E2808C1487B9718EC2671D966794667D579BD9BA5750B8136ADC322A5E11935
          9795480801372C2E96E6B87CA3ED22628016C5035FE7E635AAA0A51465B0B447
          64E2E33BC1AD20F40BCCEC3B19389E558CECF42523512A0D14749BBFA058AE15
          2A875511112010BC42FC8D7E161150E2AA08C164BB6F5476DB21732DAF9CE1D9
          D4DEB471A76161F0182C3A6E261A2D39C6D0E924F53C98CAA8559D811C95402A
          402603871297C1844A20AA0214DDA33466598DE55D1E91CC35A654CF20D4DADA
          561A772141FC5042C43A7AD5C2476B22DC45474AAA3E0A999B9F8009C395C006
          AA02A13B559E55CAD4A225112889444A225112889444A225112889444A225112
          889444A225112889444A225112889445E7CB4444CF46BD869D8C69350F24919B
          C8C4BF45372D9C247F064D54552988728FC40C0214448A898A818D650D0718D2
          1A223512B78E8A62891BB66E8902C54D245202908500F4028005117A1444A225
          112889444A225112889444A225112889444A225112889444A225112889444A22
          5112889444A225112889444A225112889444A225112889444A225112889444A2
          25112889445FFFD9}
        Stretch = True
      end
      object QRLabel20: TQRLabel
        Left = 7
        Top = 51
        Width = 53
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          18.520833333333340000
          134.937500000000000000
          140.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel20'
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 367
        Top = 51
        Width = 53
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          971.020833333333400000
          134.937500000000000000
          140.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel25'
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
end
