object Printform: TPrintform
  Left = 0
  Top = 0
  Caption = 'Printform'
  ClientHeight = 577
  ClientWidth = 898
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object prt: TRichEdit
    Left = 0
    Top = 0
    Width = 898
    Height = 536
    Align = alClient
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 536
    Width = 898
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 822
      Top = 1
      Width = 75
      Height = 39
      Align = alRight
      Caption = 'Bagla'
      TabOrder = 0
      OnClick = Button1Click
    end
    object ButtonPrint: TButton
      Left = 747
      Top = 1
      Width = 75
      Height = 39
      Align = alRight
      Caption = 'Print'
      TabOrder = 1
      OnClick = ButtonPrintClick
    end
  end
end
