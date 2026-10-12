object FormBal_CN12: TFormBal_CN12
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Balans hesablar'#305
  ClientHeight = 206
  ClientWidth = 700
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object XDBGridBal_spr1: TXDBGrid
    Left = 0
    Top = 0
    Width = 700
    Height = 168
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    GridStyle.VisualStyle = vsXPStyle
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgExtendedSelect, dgInternalSelect, dgRowResize, dgRowScroll, dgHotButtons, dgTitleButtons, dgTitleHeaders, dgTitleWidthOff, dgMarkerAutoAlign, dgMarkerAutoToggle]
    ParentFont = False
    TabOrder = 0
    OnDblClick = XDBGridBal_spr1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'BAL_CN'
        Title.Caption = 'Balans hesab'#305
        Visible = True
        Width = 75
      end
      item
        Expanded = False
        FieldName = 'BALNAME'
        Title.Caption = 'Ad'#305
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 168
    Width = 700
    Height = 38
    Align = alBottom
    TabOrder = 1
    object ButtonOK: TButton
      Left = 299
      Top = 9
      Width = 122
      Height = 24
      Caption = 'Q'#601'bul'
      TabOrder = 0
      OnClick = ButtonOKClick
    end
    object EditBal_CN: TEdit
      Left = 5
      Top = 9
      Width = 124
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 1
      OnKeyPress = EditBal_CNKeyPress
    end
  end
end
