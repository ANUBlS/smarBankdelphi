object NRForm: TNRForm
  Left = 600
  Top = 268
  BorderIcons = [biSystemMenu]
  ClientHeight = 42
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 51
    Top = 6
    Width = 301
    Height = 31
    Caption = 'Yenid'#601'n qiym'#601'tl'#601'ndirm'#601'(Se'#231'ilmi'#351' kreditl'#601'r '#252'zr'#601')'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton1Click
  end
end
