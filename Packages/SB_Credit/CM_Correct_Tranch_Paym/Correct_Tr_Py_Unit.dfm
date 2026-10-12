object CTPMainForm: TCTPMainForm
  Left = 317
  Top = 48
  Width = 375
  Height = 551
  Caption = 'CTPMainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCanResize = FormCanResize
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 367
    Height = 524
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 2
      Top = 2
      Width = 363
      Height = 29
      ButtonHeight = 21
      ButtonWidth = 65
      Caption = 'ToolBar1'
      ShowCaptions = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 2
        Caption = 'ToolButton1'
        ImageIndex = 0
      end
      object ToolButton2: TToolButton
        Left = 65
        Top = 2
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 73
        Top = 2
        Caption = 'ToolButton3'
        ImageIndex = 1
      end
      object ToolButton4: TToolButton
        Left = 138
        Top = 2
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 146
        Top = 2
        Caption = 'ToolButton5'
        ImageIndex = 2
      end
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 31
      Width = 363
      Height = 226
      Align = alTop
      Caption = '“раншлар'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object DBGridEh1: TDBGridEh
        Left = 2
        Top = 15
        Width = 359
        Height = 209
        Align = alClient
        DataSource = Correct_Tr_Py_DatMod.TranchesDatSrc
        FooterColor = clWindow
        FooterFont.Charset = RUSSIAN_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Azl Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ID'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Footers = <>
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 43
          end
          item
            EditButtons = <>
            FieldName = 'TRANCHEDATE'
            Footers = <>
            Title.Caption = '“арих'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
          end
          item
            EditButtons = <>
            FieldName = 'TRANCHEAMOUNT'
            Footers = <>
            Title.Caption = 'ћ€бл€ь'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
          end>
      end
    end
    object ToolBar2: TToolBar
      Left = 2
      Top = 257
      Width = 363
      Height = 30
      ButtonHeight = 21
      ButtonWidth = 71
      Caption = 'ToolBar2'
      ShowCaptions = True
      TabOrder = 2
      object ToolButton6: TToolButton
        Left = 0
        Top = 2
        Caption = 'ToolButton6'
        ImageIndex = 0
      end
      object ToolButton7: TToolButton
        Left = 71
        Top = 2
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton8: TToolButton
        Left = 79
        Top = 2
        Caption = 'ToolButton8'
        ImageIndex = 1
      end
      object ToolButton9: TToolButton
        Left = 150
        Top = 2
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton10: TToolButton
        Left = 158
        Top = 2
        Caption = 'ToolButton10'
        ImageIndex = 2
      end
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 287
      Width = 363
      Height = 235
      Align = alClient
      Caption = 'ёд€нишл€р'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object DBGridEh2: TDBGridEh
        Left = 2
        Top = 15
        Width = 359
        Height = 218
        Align = alClient
        FooterColor = clWindow
        FooterFont.Charset = RUSSIAN_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Azl Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object ImageList1: TImageList
    Left = 48
    Top = 444
  end
  object NLSLocalizer1: TNLSLocalizer
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 8
    Top = 444
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 88
    Top = 444
    object ActnTrAdd: TAction
      Caption = 'ActnTrAdd'
    end
    object Action2: TAction
      Caption = 'Action2'
    end
    object Action3: TAction
      Caption = 'Action3'
    end
    object Action4: TAction
      Caption = 'Action4'
    end
  end
end
