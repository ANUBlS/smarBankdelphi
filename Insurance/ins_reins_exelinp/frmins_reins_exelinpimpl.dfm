object frmins_reins_exelinp: Tfrmins_reins_exelinp
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'T'#601'krarsi'#287'orta m'#252'qavil'#601'l'#601'rin inportu'
  ClientHeight = 457
  ClientWidth = 943
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 416
    Width = 943
    Height = 41
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = 48
    ExplicitTop = 8
    ExplicitWidth = 185
    object XFButton1: TXFButton
      Left = 856
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Ba'#287'la'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = XFButton1Click
    end
  end
  object XFPanel2: TXFPanel
    Left = 0
    Top = 0
    Width = 943
    Height = 41
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = -1
    ExplicitTop = -5
    ExplicitWidth = 537
    object XFButton2: TXFButton
      Left = 92
      Top = 1
      Width = 91
      Height = 39
      Align = alLeft
      Caption = 'Fayli t'#601'sdiql'#305
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = XFButton2Click
    end
    object XFButton3: TXFButton
      Left = 1
      Top = 1
      Width = 91
      Height = 39
      Align = alLeft
      Caption = 'Fayli y'#252'kl'#601
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
    end
    object XFButton4: TXFButton
      Left = 258
      Top = 1
      Width = 91
      Height = 39
      Align = alLeft
      Caption = 'Excel-'#601' at'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = XFButton4Click
      ExplicitLeft = 375
      ExplicitTop = -3
    end
    object XFButton5: TXFButton
      Left = 183
      Top = 1
      Width = 75
      Height = 39
      Align = alLeft
      Caption = 'Redakt'#601
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
      Visible = False
      ExplicitLeft = 288
      ExplicitTop = 10
      ExplicitHeight = 25
    end
  end
  object XFPanel3: TXFPanel
    Left = 0
    Top = 41
    Width = 943
    Height = 375
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitLeft = 136
    ExplicitTop = 128
    ExplicitWidth = 185
    ExplicitHeight = 41
    object XFGroupBox1: TXFGroupBox
      Left = 1
      Top = 1
      Width = 941
      Height = 192
      Align = alTop
      Caption = 'Planla'#351'd'#305'r'#305'lm'#305#351' m'#601'lumatlar'
      TabOrder = 0
      object XDBGrid1: TXDBGrid
        Left = 2
        Top = 16
        Width = 937
        Height = 174
        Align = alClient
        GridStyle.VisualStyle = vsXPStyle
        TabOrder = 0
      end
    end
    object XFGroupBox2: TXFGroupBox
      Left = 1
      Top = 193
      Width = 941
      Height = 181
      Align = alClient
      Caption = 'T'#601'sdiql'#601'nmi'#351' m'#601'lumatlar'
      TabOrder = 1
      ExplicitTop = 224
      ExplicitHeight = 150
      object XDBGrid2: TXDBGrid
        Left = 2
        Top = 16
        Width = 937
        Height = 163
        Align = alClient
        GridStyle.VisualStyle = vsXPStyle
        TabOrder = 0
      end
    end
  end
end
