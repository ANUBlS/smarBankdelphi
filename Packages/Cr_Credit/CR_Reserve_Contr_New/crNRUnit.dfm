object NRForm: TNRForm
  Left = 361
  Top = 225
  BorderIcons = [biSystemMenu]
  Caption = 'NRForm'
  ClientHeight = 52
  ClientWidth = 374
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
    Left = 52
    Top = 14
    Width = 297
    Height = 30
    Caption = 'Yenid'#601'n qiym'#601'tl'#601'ndirm'#601'(Se'#231'ilmi'#351' ehtiyyatlar '#252'zr'#601')'
    OnClick = SpeedButton1Click
  end
end
