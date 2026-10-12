object SBUpdaterMainForm: TSBUpdaterMainForm
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'SmartBank2.0 Updater'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LogoMemo: TMemo
    Left = 0
    Top = 296
    Width = 688
    Height = 157
    Align = alBottom
    Color = clSilver
    TabOrder = 0
  end
  object Button1: TButton
    Left = 72
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Load'
    TabOrder = 1
    OnClick = Button1Click
  end
  object OpenDlg: TOpenDialog
    Left = 200
    Top = 56
  end
end
