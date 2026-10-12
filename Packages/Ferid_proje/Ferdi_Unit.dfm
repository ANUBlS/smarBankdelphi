object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'MainForm'
  ClientHeight = 449
  ClientWidth = 887
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 0
    Width = 887
    Height = 449
    Align = alClient
    TabOrder = 0
    object XFPanel2: TXFPanel
      Left = 1
      Top = 407
      Width = 885
      Height = 41
      Align = alBottom
      TabOrder = 0
      object XFButton1: TXFButton
        Left = 736
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Fayl'#305' '#601'lav'#601' et'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = XFButton1Click
      end
      object Button1: TButton
        Left = 608
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 1
        OnClick = Button1Click
      end
    end
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 885
      Height = 208
      Align = alTop
      Lines.Strings = (
        'Memo1')
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object Memo2: TMemo
      Left = 1
      Top = 215
      Width = 885
      Height = 192
      Align = alBottom
      Lines.Strings = (
        'Memo2')
      TabOrder = 2
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 552
    Top = 24
  end
end
