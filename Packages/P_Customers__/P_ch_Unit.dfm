object P_Ch_Form: TP_Ch_Form
  Left = 746
  Top = 530
  BorderStyle = bsDialog
  ClientHeight = 113
  ClientWidth = 140
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
    Top = 0
    Width = 140
    Height = 113
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 56
      Top = 18
      Width = 53
      Height = 13
      Caption = 'Debet '#252'zr'#601
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 56
      Top = 39
      Width = 52
      Height = 13
      Caption = 'Kredit '#252'zr'#601
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 32
      Top = 72
      Width = 75
      Height = 25
      Caption = '&Q'#601'bul'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object ch_1: TCheckBox
      Left = 32
      Top = 16
      Width = 17
      Height = 17
      TabOrder = 1
    end
    object ch_2: TCheckBox
      Left = 33
      Top = 39
      Width = 17
      Height = 17
      Caption = 'ch_2'
      TabOrder = 2
    end
  end
end
