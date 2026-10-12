object FormCompany: TFormCompany
  Left = 492
  Top = 366
  BorderIcons = [biSystemMenu]
  Caption = #350'irk'#601't'
  ClientHeight = 122
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 314
    Height = 122
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 312
      Height = 63
      Align = alTop
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 52
        Height = 13
        Caption = #350'irk'#601'tin ad'#305
      end
      object EditCompany: TEdit
        Tag = 1
        Left = 16
        Top = 32
        Width = 282
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 64
      Width = 312
      Height = 57
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Button1: TButton
        Tag = 1
        Left = 120
        Top = 18
        Width = 75
        Height = 25
        Caption = 'Yadda saxla'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ModalResult = 1
        ParentFont = False
        TabOrder = 0
        OnClick = Button1Click
      end
      object AddUpd: TEdit
        Left = 248
        Top = 24
        Width = 33
        Height = 21
        TabOrder = 1
        Visible = False
      end
    end
  end
end
