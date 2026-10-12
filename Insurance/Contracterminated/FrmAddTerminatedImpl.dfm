object FrmAddTerminated: TFrmAddTerminated
  Left = 0
  Top = 0
  Caption = 'FrmAddTerminated'
  ClientHeight = 254
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel2: TXFPanel
    Left = 0
    Top = 0
    Width = 422
    Height = 213
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = -197
    ExplicitTop = -5
    ExplicitWidth = 619
    ExplicitHeight = 212
    object XFLabel1: TXFLabel
      Left = 40
      Top = 24
      Width = 136
      Height = 14
      Caption = 'C'#601'mi al'#305'nm'#305#351' s'#305#287'orta haqq'#305
    end
    object XFLabel2: TXFLabel
      Left = 40
      Top = 72
      Width = 117
      Height = 14
      Caption = 'S'#305#287'ortan'#305'n bitm'#601' tarixi'
    end
    object XFLabel3: TXFLabel
      Left = 39
      Top = 100
      Width = 129
      Height = 14
      Caption = 'S'#305#287'ortan'#305'n ba'#351'lama tarixi'
    end
    object XFLabel4: TXFLabel
      Left = 40
      Top = 120
      Width = 109
      Height = 14
      Caption = 'Xitam '#601'riz'#601'sinin tarixi'
    end
    object XFLabel5: TXFLabel
      Left = 40
      Top = 156
      Width = 198
      Height = 14
      Caption = 'Qaytar'#305'lacaq m'#601'bl'#601#287'd'#601'n tutulacaq %'
    end
    object XFLabel6: TXFLabel
      Left = 40
      Top = 192
      Width = 78
      Height = 14
      Caption = 'Xitam m'#601'bl'#601#287'i '
    end
  end
  object XFPanel1: TXFPanel
    Left = 0
    Top = 213
    Width = 422
    Height = 41
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 32
    ExplicitTop = 216
    ExplicitWidth = 185
    object XFButton1: TXFButton
      Left = 248
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object XFButton2: TXFButton
      Left = 329
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ba'#287'la'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = XFButton2Click
    end
  end
end
