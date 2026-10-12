object frmsubbardero: Tfrmsubbardero
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Subroqasiya  Barderosu'
  ClientHeight = 260
  ClientWidth = 638
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 260
    Align = alClient
    TabOrder = 0
    object XFGroupBox1: TXFGroupBox
      Left = 1
      Top = 1
      Width = 636
      Height = 215
      Align = alTop
      Caption = 'M'#601'lumat'
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
        Width = 632
        Height = 156
        Align = alTop
        DataSource = DMreinsurance.DSrMainSubBardero
        GridStyle.VisualStyle = vsXPStyle
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgExtendedSelect, dgInternalSelect, dgRowResize, dgRowScroll, dgHotButtons, dgTitleButtons, dgTitleHeaders, dgTitleWidthOff, dgMarkerAutoAlign, dgMarkerAutoToggle]
        TabOrder = 0
        Columns = <
          item
            Expanded = False
            FieldName = 'SIGORTANOVU'
            Visible = True
            Width = 130
          end
          item
            Expanded = False
            FieldName = 'BARDERO_NO'
            Visible = True
            Width = 150
          end
          item
            Expanded = False
            FieldName = 'POLICY_NUM'
            Visible = True
            Width = 150
          end
          item
            Expanded = False
            FieldName = 'NAME'
            Visible = True
            Width = 150
          end
          item
            Expanded = False
            FieldName = 'DEP_ID'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CUST_ID'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CLAIM_NUM'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ID'
            Visible = False
          end>
      end
      object XFButton4: TXFButton
        Left = 544
        Top = 183
        Width = 75
        Height = 25
        Caption = 'Silm'#601'k'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 1
        OnClick = XFButton4Click
      end
      object XFButton5: TXFButton
        Left = 463
        Top = 183
        Width = 75
        Height = 25
        Caption = 'Yeni'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 2
        OnClick = XFButton5Click
      end
      object XFButton3: TXFButton
        Left = 382
        Top = 183
        Width = 75
        Height = 25
        Caption = 'Redakt'#601
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
    end
    object XFPanel2: TXFPanel
      Left = 1
      Top = 218
      Width = 636
      Height = 41
      Align = alBottom
      TabOrder = 1
      object XFButton2: TXFButton
        Left = 544
        Top = 4
        Width = 75
        Height = 25
        Caption = 'Ba'#287'la'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = XFButton2Click
      end
    end
  end
end
