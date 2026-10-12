object Form_info: TForm_info
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 358
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 317
    Width = 324
    Height = 41
    Align = alBottom
    BevelInner = bvSpace
    BevelKind = bkFlat
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitTop = 257
    object Button1: TButton
      Left = 232
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 324
    Height = 317
    Align = alClient
    Caption = 'ABB hesablar'#305'na se'#231'il'#601'c'#601'k olan simvollar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    ExplicitHeight = 257
    object GroupBox2: TGroupBox
      Left = 2
      Top = 20
      Width = 320
      Height = 82
      Align = alTop
      Caption = #399'sas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 47
        Top = 19
        Width = 197
        Height = 16
        Caption = 'K -  borc hesab'#305' simvolu(2501)'
      end
      object Label2: TLabel
        Left = 47
        Top = 46
        Width = 197
        Height = 16
        Caption = 'F -  fazi   hesab'#305' simvolu(2501)'
      end
    end
    object GroupBox3: TGroupBox
      Left = 2
      Top = 102
      Width = 320
      Height = 82
      Align = alTop
      Caption = 'Akkreditiv'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label3: TLabel
        Left = 47
        Top = 24
        Width = 203
        Height = 16
        Caption = 'A  -  borc hesab'#305' simvolu(2501)'
      end
      object Label4: TLabel
        Left = 47
        Top = 51
        Width = 205
        Height = 16
        Caption = 'J  -   fazi   hesab'#305' simvolu(2501)'
      end
    end
    object GroupBox4: TGroupBox
      Left = 2
      Top = 184
      Width = 320
      Height = 82
      Align = alTop
      Caption = 'Z'#601'man'#601't'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object Label5: TLabel
        Left = 40
        Top = 24
        Width = 200
        Height = 16
        Caption = 'Z  -  borc hesab'#305' simvolu(2501)'
      end
      object Label6: TLabel
        Left = 40
        Top = 48
        Width = 199
        Height = 16
        Caption = 'N  - fazi   hesab'#305' simvolu(2501)'
      end
    end
    object GroupBox5: TGroupBox
      Left = 2
      Top = 266
      Width = 320
      Height = 50
      Align = alTop
      Caption = 'Cari'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      ExplicitWidth = 322
      object Label7: TLabel
        Left = 40
        Top = 24
        Width = 150
        Height = 16
        Caption = 'X  - Cari hesab'#305' simvolu'
      end
    end
  end
end
