object RAForm: TRAForm
  Left = 398
  Top = 263
  BorderIcons = [biSystemMenu]
  Caption = 
    'B'#252't'#252'n kreditl'#601'r '#252'zr'#601' '#601'sas v'#601' faiz borcu '#252'zre ehtiyatlar'#305'n qiym'#601't' +
    'l'#601'nidilm'#601'si'
  ClientHeight = 36
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 24
    Top = 0
    Width = 216
    Height = 36
    Caption = #399'sas borc '#252'zr'#601' yenid'#601'n qiym'#601'tl'#601'ndirm'#601'k'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 246
    Top = 0
    Width = 208
    Height = 36
    Caption = 'Faiz borc '#252'zr'#601' yenid'#601'n qiym'#601'tl'#601'ndirm'#601'k'
    OnClick = SpeedButton2Click
  end
end
