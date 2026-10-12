object FormAcc_file: TFormAcc_file
  Left = 0
  Top = 0
  Caption = 'FormAcc_file'
  ClientHeight = 122
  ClientWidth = 458
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
  object XFPanel1: TXFPanel
    Left = 0
    Top = 0
    Width = 458
    Height = 122
    Align = alClient
    BevelInner = bvSpace
    BevelKind = bkSoft
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitWidth = 463
    ExplicitHeight = 121
    object Gauge_acc: TGauge
      Left = 5
      Top = 57
      Width = 403
      Height = 21
      ForeColor = clFuchsia
      Progress = 0
    end
    object XFGroupBox1: TXFGroupBox
      Left = 2
      Top = 2
      Width = 450
      Height = 47
      Align = alTop
      Caption = #199#305'x'#305#351' fayl'#305
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 455
      object SpeedButton1: TSpeedButton
        Left = 415
        Top = 20
        Width = 30
        Height = 21
        OnClick = SpeedButton1Click
      end
      object EditFile_acc: TEdit
        Left = 4
        Top = 17
        Width = 403
        Height = 24
        Color = clWhite
        ReadOnly = True
        TabOrder = 0
      end
    end
    object XFBitBtn2: TXFBitBtn
      Left = 381
      Top = 83
      Width = 67
      Height = 29
      Caption = #199#305'x'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
      OnClick = XFBitBtn2Click
    end
    object XFBitBtn1: TXFBitBtn
      Left = 314
      Top = 83
      Width = 63
      Height = 29
      Caption = 'Yarat'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 2
      OnClick = XFBitBtn1Click
    end
  end
  object SaveDlgAcc: TSaveDialog
    DefaultExt = 'xml'
    Filter = 'XML Files (*.xml)|*.xml'
    Title = 'Save'
    Left = 152
    Top = 10
  end
end
