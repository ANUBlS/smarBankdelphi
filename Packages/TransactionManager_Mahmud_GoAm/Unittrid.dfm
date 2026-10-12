object Formtrid: TFormtrid
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 127
  ClientWidth = 573
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 93
    Width = 573
    Height = 34
    Align = alBottom
    BevelInner = bvLowered
    BevelKind = bkFlat
    TabOrder = 0
    ExplicitTop = 76
    object Button1: TButton
      Left = 481
      Top = 3
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
    Width = 573
    Height = 92
    Align = alTop
    BevelInner = bvLowered
    BevelKind = bkFlat
    TabOrder = 1
    object Label1: TLabel
      Left = 14
      Top = 11
      Width = 38
      Height = 13
      Caption = 'Tam Ad'#305
    end
    object edit_name: TEdit
      Left = 65
      Top = 8
      Width = 491
      Height = 21
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 35
      Width = 565
      Height = 51
      Align = alBottom
      Caption = 'Bank haqq'#305'nda'
      TabOrder = 1
      ExplicitTop = 29
      object Label2: TLabel
        Left = 12
        Top = 24
        Width = 46
        Height = 13
        Caption = 'Hesab '#8470
      end
      object Label3: TLabel
        Left = 359
        Top = 24
        Width = 57
        Height = 13
        Caption = ' SWFT kodu'
      end
      object edit_acc: TEdit
        Left = 63
        Top = 21
        Width = 286
        Height = 21
        TabOrder = 0
      end
      object edit_swft: TEdit
        Left = 433
        Top = 21
        Width = 121
        Height = 21
        TabOrder = 1
      end
    end
  end
end
