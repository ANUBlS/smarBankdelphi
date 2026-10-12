object FrmExport: TFrmExport
  Left = 264
  Top = 207
  BorderStyle = bsDialog
  Caption = 'Export Properties'
  ClientHeight = 285
  ClientWidth = 318
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object BtnExport: TButton
    Left = 84
    Top = 245
    Width = 75
    Height = 25
    Caption = 'Ихраж &ет'
    TabOrder = 0
    OnClick = BtnExportClick
  end
  object BtnCancel: TButton
    Left = 173
    Top = 245
    Width = 75
    Height = 25
    Caption = '&Имтина'
    ModalResult = 2
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 318
    Height = 229
    Align = alTop
    Caption = 'Ихраж олунажаг  сцтунларын сийащысы'
    TabOrder = 2
    object CLBExportList: TCheckListBox
      Left = 2
      Top = 15
      Width = 314
      Height = 212
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object CreditsExporter: TExcelExporter
    SheetName = 'Credits'
    ShowTitles = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial AzLat'
    Font.Style = []
    Left = 224
    Top = 80
  end
end
