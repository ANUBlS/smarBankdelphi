object NRForm: TNRForm
  Left = 361
  Top = 225
  BorderIcons = [biSystemMenu]
  Caption = 'Se'#231'ilmi'#351' kreditl'#601'r '#252'zr'#601' ehtiyatlar'#305'n yenid'#601'n qiym'#601'tl'#601'ndirilm'#601'si'
  ClientHeight = 42
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object SpeedButton1: TSpeedButton
    Left = 6
    Top = 5
    Width = 218
    Height = 31
    Caption = #399'sas borc '#252'zr'#601' yeniden qiym'#601'tl'#601'ndirm'#601
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 237
    Top = 5
    Width = 218
    Height = 31
    Caption = 'Faiz borc '#252'zr'#601' yeniden qiym'#601'tl'#601'ndirm'#601
    OnClick = SpeedButton2Click
  end
end
