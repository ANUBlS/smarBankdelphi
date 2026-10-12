object FrmTransaction: TFrmTransaction
  Left = 0
  Top = 0
  ClientHeight = 192
  ClientWidth = 384
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
  object GridAccount1: TDBGrid
    Left = 0
    Top = 0
    Width = 384
    Height = 161
    Align = alClient
    Color = clBtnFace
    DataSource = DMBusProcSet.DS_Transaction
    DrawingStyle = gdsGradient
    FixedColor = clActiveCaption
    GradientEndColor = clNavy
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = GridAccount1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #399'm'#601'liyyat'#305'n tipi'
        Width = 600
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 161
    Width = 384
    Height = 31
    Align = alBottom
    TabOrder = 1
    object Edit1: TEdit
      Left = 0
      Top = 6
      Width = 49
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object Edit2: TEdit
      Left = 55
      Top = 6
      Width = 290
      Height = 21
      TabOrder = 1
      OnChange = Edit2Change
    end
  end
end
