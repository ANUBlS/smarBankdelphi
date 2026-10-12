object SearchForm: TSearchForm
  Left = 350
  Top = 264
  Width = 309
  Height = 207
  BorderIcons = [biSystemMenu]
  Caption = '    Axtarыш     '
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCanResize = FormCanResize
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 134
    Top = 146
    Width = 78
    Height = 29
  end
  object SpeedButton2: TSpeedButton
    Left = 221
    Top = 144
    Width = 77
    Height = 31
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 301
    Height = 73
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 297
      Height = 69
      Align = alClient
      Caption = 'Мцштеринин  адына  gюря'
      TabOrder = 0
      object NameEdit: TEdit
        Left = 2
        Top = 24
        Width = 289
        Height = 21
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 301
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 2
      Top = 2
      Width = 297
      Height = 61
      Align = alClient
      Caption = 'Мцштеринин  нюмрясиня  gюря'
      TabOrder = 0
      object NumEdit: TEdit
        Left = 2
        Top = 24
        Width = 288
        Height = 21
        TabOrder = 0
      end
    end
  end
  object NLSLocalizer: TNLSLocalizer
    Caption = '    Axtarыш     '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    Left = 248
    Top = 16
  end
  object ActionList1: TActionList
    Left = 64
    Top = 144
    object ActionAccept: TAction
      Caption = '  Гябул   '
      OnExecute = ActionAcceptExecute
    end
    object ActionReject: TAction
      Caption = '  Имтина  '
    end
  end
end
