object FormCustGrid: TFormCustGrid
  Left = 0
  Top = 0
  ClientHeight = 345
  ClientWidth = 899
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object MainGrid: TXDBGrid
    Left = 0
    Top = 0
    Width = 899
    Height = 304
    Align = alClient
    GridStyle.VisualStyle = vsXPStyle
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgExtendedSelect, dgInternalSelect, dgRowResize, dgRowScroll, dgHotButtons, dgTitleButtons, dgTitleHeaders, dgTitleWidthOff, dgMarkerAutoAlign, dgMarkerAutoToggle]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = MainGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = 'M'#252#351't'#601'ri kodu'
        Title.Color = clNavy
        Visible = True
        Width = 85
      end
      item
        Expanded = False
        FieldName = 'CUST_NAME'
        Title.Alignment = taCenter
        Title.Caption = 'Tam ad'#305
        Title.Color = clNavy
        Visible = True
        Width = 180
      end
      item
        Expanded = False
        FieldName = 'FIRSTNAME'
        Title.Alignment = taCenter
        Title.Caption = 'Ad'#305
        Title.Color = clNavy
        Visible = True
        Width = 140
      end
      item
        Expanded = False
        FieldName = 'PATRONYMIC'
        Title.Alignment = taCenter
        Title.Caption = 'Atas'#305'n'#305'n ad'#305
        Title.Color = clNavy
        Visible = True
        Width = 140
      end
      item
        Expanded = False
        FieldName = 'LASTNAME'
        Title.Alignment = taCenter
        Title.Caption = 'Soyad'#305
        Title.Color = clNavy
        Visible = True
        Width = 140
      end
      item
        Expanded = False
        FieldName = 'PASSP_NUMBER'
        Title.Alignment = taCenter
        Title.Caption = 'S'#601'n'#601'din Seriya / N:'
        Title.Color = clNavy
        Visible = True
        Width = 140
      end
      item
        Expanded = False
        FieldName = 'PASSPIN'
        Title.Alignment = taCenter
        Title.Caption = 'Pin kod'
        Title.Color = clNavy
        Visible = True
        Width = 140
      end
      item
        Expanded = False
        FieldName = 'PHONE_MOB'
        Title.Alignment = taCenter
        Title.Caption = 'Telefon (mobil)'
        Title.Color = clNavy
        Visible = True
        Width = 140
      end
      item
        Expanded = False
        FieldName = 'PHONE'
        Title.Alignment = taCenter
        Title.Caption = 'Telefon ('#351#601'h'#601'r)'
        Title.Color = clNavy
        Visible = True
        Width = 140
      end
      item
        Expanded = False
        FieldName = 'PASSPORT'
        Title.Alignment = taCenter
        Title.Caption = 'S'#601'n'#601'din Seriyas'#305
        Title.Color = clNavy
        Visible = True
        Width = 140
      end
      item
        Expanded = False
        FieldName = 'OPENDATE'
        Title.Alignment = taCenter
        Title.Caption = 'A'#231#305'lma tarixi'
        Title.Color = clNavy
        Visible = True
        Width = 140
      end
      item
        Expanded = False
        FieldName = 'INN'
        Title.Alignment = taCenter
        Title.Caption = 'V'#214'EN'
        Title.Color = clNavy
        Visible = True
        Width = 140
      end>
  end
  object XFPanel1: TXFPanel
    Left = 0
    Top = 304
    Width = 899
    Height = 41
    Align = alBottom
    TabOrder = 1
    object XFButton1: TXFButton
      Left = 817
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = XFButton1Click
    end
  end
end
