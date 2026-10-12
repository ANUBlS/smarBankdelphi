object frmpbfPayRepNum: TfrmpbfPayRepNum
  Left = 460
  Top = 324
  BorderIcons = [biSystemMenu]
  Caption = 'frmpbfPayRepNum'
  ClientHeight = 72
  ClientWidth = 234
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label2: TLabel
    Left = 6
    Top = 12
    Width = 56
    Height = 14
    Caption = #1071#1083#1072#1074#1103' '#1080#1085#1092
  end
  object BitBtn1: TBitBtn
    Left = 83
    Top = 37
    Width = 81
    Height = 27
    Caption = 'Ok'
    DoubleBuffered = True
    ModalResult = 1
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object Edit2: TEdit
    Left = 59
    Top = 6
    Width = 169
    Height = 22
    TabOrder = 1
  end
end
