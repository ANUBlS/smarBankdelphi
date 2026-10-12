object Accselect: TAccselect
  Left = 0
  Top = 0
  Caption = 'accountseletion'
  ClientHeight = 328
  ClientWidth = 543
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 291
    Width = 543
    Height = 37
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = -79
    ExplicitTop = 187
    ExplicitWidth = 722
    object Button1: TButton
      Left = 443
      Top = 9
      Width = 94
      Height = 25
      Caption = 'Q'#601'bul ( insert )'
      TabOrder = 0
      OnClick = Button1Click
    end
    object EditACC_NO: TEdit
      Left = 3
      Top = 9
      Width = 200
      Height = 21
      TabOrder = 1
      OnKeyPress = EditACC_NOKeyPress
    end
    object EditName: TEdit
      Left = 206
      Top = 9
      Width = 231
      Height = 21
      TabOrder = 2
      OnKeyPress = EditNameKeyPress
    end
  end
  object XDBGrid: TXDBGrid
    Left = 0
    Top = 0
    Width = 543
    Height = 291
    Align = alClient
    DataSource = DataMod.DataSourc_cashorsub
    GridStyle.VisualStyle = vsXPStyle
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgExtendedSelect, dgInternalSelect, dgRowResize, dgRowScroll, dgHotButtons, dgTitleButtons, dgTitleHeaders, dgTitleWidthOff, dgMarkerAutoAlign, dgMarkerAutoToggle]
    TabOrder = 1
    OnDblClick = XDBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ACC_NO'
        Title.Caption = 'Hesab '#8470
        Visible = True
        Width = 200
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = 'Hesab'#305'n ad'#305
        Visible = True
        Width = 300
      end>
  end
end
