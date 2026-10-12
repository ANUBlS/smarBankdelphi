object FormSedule: TFormSedule
  Left = 0
  Top = 0
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = #214'd'#601'm'#601' plan'#305
  ClientHeight = 390
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 0
    Width = 720
    Height = 349
    Align = alClient
    BevelInner = bvLowered
    BevelKind = bkFlat
    BevelOuter = bvSpace
    TabOrder = 0
    object XDBGrid1: TXDBGrid
      Left = 2
      Top = 2
      Width = 712
      Height = 341
      Align = alClient
      Ctl3D = False
      Ctl3DAuto = False
      DataColLineColor = clAqua
      DataRowLineColor = clNavy
      DataSource = DataModCustAnalyz.dsrc_sedule
      FixedStyle = fsNice
      FixedTheme = ftNone
      Gradient.Direction = gdHorizontal
      Gradient.EndColor = clAqua
      Gradient.HotColor = clInactiveCaptionText
      Gradient.Options = [goGradient, goHotButton, goHotTrack, goHotColor]
      GridStyle.VisualStyle = vsXPStyle
      HotButtons = hbNone
      KeyFields = 'CustNo'
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgExtendedSelect, dgInternalSelect, dgRowResize, dgRowScroll, dgHotButtons, dgTitleButtons, dgTitleHeaders, dgTitleWidthOff, dgMarkerAutoAlign, dgMarkerAutoToggle, dgForceSequence, dgThumbTracking]
      OptionsEx = [dgBlankRow, dgTotalFooter, dgTotalColLines, dgTotalHeaderBox, dgTotalValuesBox, dgTotalFieldsBox, dgTotalFooterBox, dgAutoUpdateOrder, dgAutoAscendOrder, dgAutoUpdateSequence, dgDelayUpdateSequence, dgAutoUpdateTotals, dgDelayUpdateTotals, dgCalcWholeDataSet, dgDelaySelectedRows, dgTotalHeaderSelected, dgSelectedAutoHidden, dgClickSelectOff]
      ParentCtl3D = False
      TabOrder = 0
      Totals.BoxStyle = cbAutoLowered
      Columns = <
        item
          AutoNumber = True
          Expanded = False
          FieldName = 'NO'
          Title.Alignment = taRightJustify
          Title.Caption = 'No.'
          TotalFooter.CalcValue = cvCount
          TotalFooter.Format = '%d.'
          TotalFooter.TotalResult = trCalcValue
          TotalHeader.CalcValue = cvCount
          TotalHeader.TotalResult = trCalcValue
          Visible = True
          Width = 54
        end
        item
          Expanded = False
          FieldName = 'PAYMENTDATE'
          Title.Caption = 'Tarix'
          Title.Marker = tmAscend
          Title.MarkerIndex = 2
          Visible = True
          Width = 101
        end
        item
          Expanded = False
          FieldName = 'REST'
          Title.Caption = 'Qal'#305'q'
          TotalFooter.TotalResult = trCalcValue
          TotalHeader.TotalResult = trCalcValue
          Visible = True
          Width = 107
        end
        item
          Expanded = False
          FieldName = 'PRINCIPAL'
          Title.Caption = #399'sas borucdan'
          TotalFooter.TotalResult = trCalcValue
          TotalHeader.TotalResult = trCalcValue
          Visible = True
          Width = 108
        end
        item
          Expanded = False
          FieldName = 'INTEREST'
          Title.Caption = 'Hesablanm'#305#351' faizd'#601'n'
          TotalFooter.TotalResult = trCalcValue
          TotalHeader.TotalResult = trCalcValue
          Visible = True
          Width = 132
        end
        item
          Expanded = False
          FieldName = 'TOTALPAY'
          Title.Caption = 'C'#601'mi'
          TotalFooter.TotalResult = trCalcValue
          TotalHeader.TotalResult = trCalcValue
          Visible = True
          Width = 128
        end>
      OrderFields = 'PAYMENTDATE'
    end
  end
  object XFPanel2: TXFPanel
    Left = 0
    Top = 349
    Width = 720
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelKind = bkFlat
    BevelOuter = bvSpace
    TabOrder = 1
    object XFBitBtn1: TXFBitBtn
      Left = 624
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Close'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = XFBitBtn1Click
    end
  end
end
