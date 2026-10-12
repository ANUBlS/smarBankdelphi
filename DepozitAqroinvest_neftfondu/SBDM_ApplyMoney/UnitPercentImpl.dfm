object FormPercent: TFormPercent
  Left = 0
  Top = 0
  ClientHeight = 179
  ClientWidth = 210
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 210
    Height = 179
    Align = alClient
    TabOrder = 0
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 208
      Height = 14
      Align = alTop
      Alignment = taCenter
      Caption = 'Yatr'#305'm m'#601'bl'#601#287'i'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 90
    end
    object Label1: TLabel
      Left = 0
      Top = 49
      Width = 209
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Faiz d'#601'r'#601'c'#601'si '
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 1
      Top = 91
      Width = 209
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Faiz d'#601'r'#601'c'#601'sini d'#601'yi'#351
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Edittranches: TEdit
      Left = 38
      Top = 23
      Width = 147
      Height = 21
      Color = clMedGray
      ReadOnly = True
      TabOrder = 0
    end
    object EditPercent: TEdit
      Left = 38
      Top = 66
      Width = 147
      Height = 21
      Color = clMedGray
      ReadOnly = True
      TabOrder = 1
    end
    object CMCurrencyEdit1: TCMCurrencyEdit
      Left = 38
      Top = 109
      Width = 147
      Height = 21
      TabOrder = 2
      Text = '0.00'
    end
    object Button1: TButton
      Left = 32
      Top = 144
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 109
      Top = 144
      Width = 75
      Height = 25
      Caption = #304'mtina'
      TabOrder = 4
      OnClick = Button2Click
    end
  end
end
