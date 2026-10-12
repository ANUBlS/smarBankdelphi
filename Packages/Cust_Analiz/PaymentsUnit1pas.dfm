object FormPayments: TFormPayments
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #214'd'#601'm'#601' c'#601'dv'#601'li'
  ClientHeight = 399
  ClientWidth = 795
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
    Width = 795
    Height = 359
    Align = alClient
    TabOrder = 0
    object XDBGrid2: TXDBGrid
      Left = 1
      Top = 1
      Width = 793
      Height = 357
      Align = alClient
      Ctl3D = False
      Ctl3DAuto = False
      DataColLineColor = clAqua
      DataRowLineColor = clNavy
      DataSource = DataModCustAnalyz.Dsrc_payments
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
          Alignment = taRightJustify
          AutoNumber = True
          Expanded = False
          Title.Alignment = taRightJustify
          Title.Caption = 'No.'
          TotalFooter.CalcValue = cvCount
          TotalFooter.Format = '%d.'
          TotalFooter.TotalResult = trCalcValue
          TotalHeader.CalcValue = cvCount
          TotalHeader.TotalResult = trCalcValue
          Visible = True
          Width = 52
        end
        item
          Expanded = False
          FieldName = 'PAYDATE'
          Title.Caption = 'Tarix'
          Title.Marker = tmAscend
          Title.MarkerIndex = 2
          Visible = True
          Width = 104
        end
        item
          Expanded = False
          FieldName = 'PAYEDAMT'
          Title.Caption = #399'sas borcdan'
          TotalFooter.TotalResult = trCalcValue
          TotalHeader.TotalResult = trCalcValue
          Visible = True
          Width = 111
        end
        item
          Expanded = False
          FieldName = 'PAYEDINTAMT'
          Title.Caption = 'Faiz borucdan'
          TotalFooter.TotalResult = trCalcValue
          TotalHeader.TotalResult = trCalcValue
          Visible = True
          Width = 117
        end
        item
          Expanded = False
          FieldName = 'PAYEDDUEAMT'
          Title.Caption = 'Gecikmi'#351' borcdan'
          TotalFooter.TotalResult = trCalcValue
          TotalHeader.TotalResult = trCalcValue
          Visible = True
          Width = 126
        end
        item
          Expanded = False
          FieldName = 'PAYEDDUEINTAMT'
          Title.Caption = 'Gecikmi'#351' faiz borcdan'
          TotalFooter.TotalResult = trCalcValue
          TotalHeader.TotalResult = trCalcValue
          Visible = True
          Width = 139
        end
        item
          Expanded = False
          FieldName = 'PAYEDPENALTYAMT'
          Title.Caption = 'Penya'
          TotalFooter.TotalResult = trCalcValue
          TotalHeader.TotalResult = trCalcValue
          Visible = True
          Width = 78
        end>
      OrderFields = 'PAYDATE'
    end
  end
  object XFPanel2: TXFPanel
    Left = 0
    Top = 359
    Width = 795
    Height = 40
    Align = alBottom
    TabOrder = 1
    object XFBitBtn1: TXFBitBtn
      Left = 702
      Top = 9
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
