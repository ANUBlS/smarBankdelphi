object FrmCompBalSettings: TFrmCompBalSettings
  Left = 222
  Top = 145
  Caption = 'FrmCompBalSettings'
  ClientHeight = 519
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 14
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 520
    Height = 519
    Align = alClient
    DataSource = DataModuleMain.DS_BALANCE_SETTINGS
    DrawingStyle = gdsGradient
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
  end
end
