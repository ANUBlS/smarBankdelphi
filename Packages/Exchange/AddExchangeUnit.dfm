object FrmAddExchange: TFrmAddExchange
  Left = 539
  Top = 368
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'VDM'
  ClientHeight = 89
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 412
    Height = 89
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 92
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 410
      Height = 59
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 43
        Top = 11
        Width = 58
        Height = 14
        Caption = #1042#1044#1052'-'#1080#1085' '#8470' '
      end
      object Label2: TLabel
        Left = 198
        Top = 11
        Width = 65
        Height = 14
        Caption = #1042#1044#1052'-'#1080#1085'  '#1072#1076#1099
      end
      object Edit1: TEdit
        Left = 8
        Top = 28
        Width = 146
        Height = 22
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 160
        Top = 28
        Width = 243
        Height = 22
        TabOrder = 1
      end
    end
    object Button1: TButton
      Left = 254
      Top = 62
      Width = 80
      Height = 24
      Caption = '&'#1048#1084#1090#1080#1085#1072
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 165
      Top = 62
      Width = 81
      Height = 24
      Caption = #1043#1103#1073#1091#1083
      TabOrder = 2
      OnClick = Button2Click
    end
  end
end
