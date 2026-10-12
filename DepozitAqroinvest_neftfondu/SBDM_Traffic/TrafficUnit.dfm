object FrmTraffic: TFrmTraffic
  Left = 267
  Top = 176
  BorderStyle = bsDialog
  Caption = 'Traffic of Contract є  '
  ClientHeight = 282
  ClientWidth = 251
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TrafficViewer: TDBGrid
    Left = 0
    Top = 0
    Width = 251
    Height = 229
    Align = alClient
    DataSource = TrafficDataModule.DataSrcTraffic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'HDATE'
        Title.Caption = '…атырылма тарихи '
        Title.Color = clNavy
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Title.Caption = '…атырылмыш м€бл€ь'
        Title.Color = clNavy
        Width = 147
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 229
    Width = 251
    Height = 53
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object ButtonCancel: TButton
      Left = 160
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Ѕаьла'
      ModalResult = 2
      TabOrder = 0
    end
  end
end
