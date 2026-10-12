object FormRekvezit: TFormRekvezit
  Left = 0
  Top = 0
  ClientHeight = 470
  ClientWidth = 1035
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object XDBGrid1: TXDBGrid
    Left = 0
    Top = 0
    Width = 1035
    Height = 429
    Align = alClient
    DataSource = DataAcc.Dsrc_Bankm
    GridStyle.VisualStyle = vsXPStyle
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgExtendedSelect, dgInternalSelect, dgRowResize, dgRowScroll, dgHotButtons, dgTitleButtons, dgTitleHeaders, dgTitleWidthOff, dgMarkerAutoAlign, dgMarkerAutoToggle]
    StretchMode = True
    TabOrder = 0
    OnDblClick = XDBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'BANKCODE'
        Title.Alignment = taCenter
        Title.Caption = 'Bank'#305'n Kodu'
        Visible = True
        Width = 100
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = 'Bank'#305'n Ad'#305
        Visible = True
        Width = 300
      end
      item
        Expanded = False
        FieldName = 'INN'
        Title.Alignment = taCenter
        Title.Caption = 'V'#214'EN'
        Visible = True
        Width = 100
      end
      item
        Expanded = False
        FieldName = 'SWIFT'
        Title.Alignment = taCenter
        Visible = True
        Width = 100
      end
      item
        Expanded = False
        FieldName = 'KRNO'
        Title.Alignment = taCenter
        Title.Caption = 'M'#252'xbir Hesab'
        Visible = True
        Width = 200
      end
      item
        Expanded = False
        FieldName = 'SUBKRNO'
        Title.Alignment = taCenter
        Title.Caption = 'Sub Muxbir Hesab'
        Visible = True
        Width = 200
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 429
    Width = 1035
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 676
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      TabOrder = 0
      OnClick = Button1Click
    end
    object EditBankName: TEdit
      Left = 109
      Top = 11
      Width = 312
      Height = 21
      TabOrder = 1
      OnChange = EditBankNameChange
    end
    object EditBankCODE: TEdit
      Left = 5
      Top = 11
      Width = 101
      Height = 21
      TabOrder = 2
      OnChange = EditBankCODEChange
    end
    object Edit_inn: TEdit
      Left = 425
      Top = 11
      Width = 113
      Height = 21
      TabOrder = 3
      OnChange = Edit_innChange
    end
  end
end
