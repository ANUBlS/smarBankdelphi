object fmUserPassw: TfmUserPassw
  Left = 502
  Top = 263
  BorderStyle = bsToolWindow
  Caption = 'Password'
  ClientHeight = 141
  ClientWidth = 236
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 236
    Height = 106
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 234
      Height = 104
      Align = alClient
      Caption = #350'ifr'#601'ni daxil edin'
      TabOrder = 0
      object Label1: TLabel
        Left = 9
        Top = 16
        Width = 44
        Height = 13
        Caption = 'Yeni '#351'ifr'#601
      end
      object Label2: TLabel
        Left = 9
        Top = 56
        Width = 110
        Height = 13
        Caption = #350'ifr'#601'ni t'#601'krar daxil edin'
      end
      object edPassw: TEdit
        Left = 9
        Top = 32
        Width = 217
        Height = 21
        PasswordChar = '*'
        TabOrder = 0
        OnKeyPress = edPasswKeyPress
      end
      object edretpassw: TEdit
        Left = 9
        Top = 72
        Width = 217
        Height = 21
        PasswordChar = '*'
        TabOrder = 1
        OnKeyPress = edPasswKeyPress
      end
      object ErBox: THintBox
        Left = 0
        Top = 14
        Width = 217
        Height = 18
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 2
        Visible = False
        HintStyle = hsAlert
        Timeout = 4000
        BeepOnMessage = True
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 106
    Width = 236
    Height = 35
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 83
      Top = 6
      Width = 71
      Height = 24
      Caption = 'Q'#601'bul'
      DoubleBuffered = True
      Kind = bkOK
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 159
      Top = 6
      Width = 71
      Height = 24
      Caption = #304'mtina'
      DoubleBuffered = True
      Kind = bkCancel
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 1
    end
  end
end
