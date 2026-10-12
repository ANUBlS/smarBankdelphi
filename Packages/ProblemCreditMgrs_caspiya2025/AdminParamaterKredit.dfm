object FormSettings: TFormSettings
  Left = 0
  Top = 0
  Caption = 'FormSettings'
  ClientHeight = 508
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 0
    Width = 621
    Height = 508
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object XFPanel2: TXFPanel
      Left = 2
      Top = 2
      Width = 255
      Height = 504
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object XFGroupBox1: TXFGroupBox
        Left = 2
        Top = 2
        Width = 251
        Height = 500
        Align = alClient
        Caption = #304'stifad'#601#231'il'#601'r'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object XDBGrid3: TXDBGrid
          Left = 2
          Top = 16
          Width = 247
          Height = 482
          Align = alClient
          DataSource = PrCmDM.DSCourtAdmin
          GridStyle.VisualStyle = vsXPStyle
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          ParentFont = False
          ScrollBars = ssNone
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          Totals.Color = clNavy
          Totals.Font.Charset = DEFAULT_CHARSET
          Totals.Font.Color = clWindowText
          Totals.Font.Height = -11
          Totals.Font.Name = 'Tahoma'
          Totals.Font.Style = []
          OnKeyPress = XDBGrid3KeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Alignment = taCenter
              Title.Caption = #304'stifad'#601#231'il'#601'r'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
              Width = 214
            end>
        end
      end
    end
    object XFPanel3: TXFPanel
      Left = 259
      Top = 2
      Width = 360
      Height = 504
      Align = alRight
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object XFPanel4: TXFPanel
        Left = 2
        Top = 2
        Width = 356
        Height = 248
        Align = alTop
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvLowered
        TabOrder = 0
        object XFGroupBox2: TXFGroupBox
          Left = 2
          Top = 2
          Width = 348
          Height = 240
          Align = alClient
          Caption = 'Gecikm'#601'd'#601' olan b'#246'lm'#601'l'#601'r'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object XDBGrid1: TXDBGrid
            Left = 2
            Top = 16
            Width = 344
            Height = 222
            Align = alClient
            DataSource = PrCmDM.DSAdminGroups
            GridStyle.VisualStyle = vsXPStyle
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgExtendedSelect, dgInternalSelect, dgRowResize, dgRowScroll, dgHotButtons, dgTitleButtons, dgTitleHeaders, dgTitleWidthOff, dgMarkerAutoAlign, dgMarkerAutoToggle]
            ParentFont = False
            ScrollBars = ssNone
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = [fsBold]
            OnDblClick = XDBGrid1DblClick
            OnKeyPress = XDBGrid1KeyPress
            Columns = <
              item
                Expanded = False
                FieldName = 'NAME'
                Title.Alignment = taCenter
                Title.Caption = 'Gecikm'#601' g'#252'nl'#601'ri'
                Title.Color = clNavy
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Visible = True
                Width = 310
              end>
          end
        end
      end
      object XFPanel5: TXFPanel
        Left = 2
        Top = 250
        Width = 356
        Height = 513
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object XDBGrid2: TXDBGrid
          Left = 2
          Top = 2
          Width = 352
          Height = 509
          Align = alClient
          DataSource = PrCmDM.DSAdminIn
          GridStyle.VisualStyle = vsXPStyle
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgExtendedSelect, dgInternalSelect, dgRowResize, dgRowScroll, dgHotButtons, dgTitleButtons, dgTitleHeaders, dgTitleWidthOff, dgMarkerAutoAlign, dgMarkerAutoToggle]
          ParentFont = False
          ScrollBars = ssNone
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          OnDblClick = XDBGrid2DblClick
          OnKeyDown = XDBGrid2KeyDown
          OnKeyPress = XDBGrid2KeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'QRUPNAME'
              Title.Alignment = taCenter
              Title.Caption = 'Se'#231'il'#601'n b'#246'lm'#601'l'#601'r'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
              Width = 187
            end
            item
              Expanded = False
              FieldName = 'BONS_NAME'
              Title.Alignment = taCenter
              Title.Caption = 'Bonus'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -12
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
              Width = 127
            end>
        end
      end
    end
  end
end
