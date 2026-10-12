object Tranzit_Acc: TTranzit_Acc
  Left = 0
  Top = 0
  Caption = 'Tranzit accounts'
  ClientHeight = 263
  ClientWidth = 1030
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 1030
    Height = 222
    Align = alClient
    DataSource = SWDataModule.dataTranzit
    DrawingStyle = gdsGradient
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1030
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 1
    ExplicitWidth = 185
    object Button1: TButton
      Left = 8
      Top = 10
      Width = 75
      Height = 25
      Caption = #399'lav'#601' et'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 112
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Sil'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
