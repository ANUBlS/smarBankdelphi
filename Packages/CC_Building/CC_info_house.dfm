object CC_Add_House: TCC_Add_House
  Left = 547
  Top = 304
  BorderStyle = bsDialog
  Caption = 'Ѕина'
  ClientHeight = 271
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 344
    Height = 271
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 337
      Height = 182
      Caption = 'ћ€лумат'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 40
        Top = 32
        Width = 18
        Height = 13
        Caption = 'јды:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 32
        Top = 58
        Width = 35
        Height = 13
        Caption = '÷нван:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 24
        Top = 88
        Width = 41
        Height = 13
        Caption = 'Ёириш сайы'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 26
        Top = 154
        Width = 30
        Height = 13
        Caption = 'ћ€нзил'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 24
        Top = 123
        Width = 39
        Height = 13
        Caption = 'ћ€рт€б€'
      end
      object Editname: TEdit
        Tag = 1
        Left = 72
        Top = 27
        Width = 249
        Height = 21
        TabOrder = 0
        OnKeyPress = EditnameKeyPress
      end
      object Editadress: TEdit
        Tag = 1
        Left = 72
        Top = 56
        Width = 249
        Height = 21
        TabOrder = 1
        OnKeyPress = EditadressKeyPress
      end
      object Editentrance: TEdit
        Tag = 1
        Left = 72
        Top = 88
        Width = 249
        Height = 21
        TabOrder = 2
        OnKeyPress = EditentranceKeyPress
      end
      object Editflat: TEdit
        Tag = 1
        Left = 72
        Top = 151
        Width = 249
        Height = 21
        TabOrder = 3
        OnKeyPress = EditflatKeyPress
      end
      object EditFloor: TEdit
        Left = 72
        Top = 120
        Width = 249
        Height = 21
        TabOrder = 4
      end
    end
    object ac_groupbox: TGroupBox
      Left = 0
      Top = 192
      Width = 337
      Height = 57
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Editid: TEdit
        Left = 64
        Top = 24
        Width = 49
        Height = 21
        TabOrder = 0
        Visible = False
      end
      object Button1: TButton
        Left = 144
        Top = 16
        Width = 75
        Height = 25
        Caption = '√€бул'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 240
        Top = 16
        Width = 75
        Height = 25
        Caption = '»мтина'
        TabOrder = 2
        OnClick = Button2Click
      end
    end
  end
  object NLSLocalizer1: TNLSLocalizer
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    Left = 8
    Top = 24
  end
end
