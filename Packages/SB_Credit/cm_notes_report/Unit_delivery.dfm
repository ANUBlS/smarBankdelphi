object Form_delivery: TForm_delivery
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 309
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 268
    Width = 522
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 208
      Top = 5
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
    Width = 522
    Height = 268
    Align = alClient
    TabOrder = 1
    object Memo1: TMemo
      Left = 1
      Top = 42
      Width = 520
      Height = 225
      Align = alClient
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 520
      Height = 41
      Align = alTop
      TabOrder = 1
      object RadioGroup1: TRadioGroup
        Left = 1
        Top = 1
        Width = 518
        Height = 38
        Align = alTop
        Caption = 'Status'
        Columns = 3
        ItemIndex = 2
        Items.Strings = (
          'D'#252'z '#231'atd'#305'r'#305'lma'
          'S'#601'hv '#231'atd'#305'r'#305'lma'
          'He'#231' biri')
        TabOrder = 0
        OnClick = RadioGroup1Click
      end
    end
  end
  object OraclePackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'cm_credit'
    ParameterMode = pmNamed
    Left = 328
    Top = 64
  end
end
