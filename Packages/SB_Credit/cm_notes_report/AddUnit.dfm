object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 285
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 244
    Width = 459
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 104
    ExplicitTop = 250
    object Button1: TButton
      Left = 200
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 459
    Height = 244
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 48
    ExplicitTop = 8
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 457
      Height = 242
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 43
      ExplicitHeight = 201
    end
  end
  object OraclePackage1: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'cm_credit'
    ParameterMode = pmNamed
    Left = 328
    Top = 64
  end
end
