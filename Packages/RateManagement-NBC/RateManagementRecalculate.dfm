object FmRecalculate: TFmRecalculate
  Left = 360
  Top = 198
  BorderStyle = bsDialog
  Caption = 'Hesablama'
  ClientHeight = 333
  ClientWidth = 290
  Color = clBtnFace
  Constraints.MaxWidth = 298
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnMain: TPanel
    Left = 0
    Top = 0
    Width = 290
    Height = 291
    Align = alClient
    AutoSize = True
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 288
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label13: TLabel
        Left = 40
        Top = 8
        Width = 212
        Height = 13
        Caption = #399'm'#601'liyyatlar'#305'n yenid'#601'n hesablanmas'#305
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 31
      Width = 288
      Height = 258
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 1
      object lbOper1: TLabel
        Tag = 101
        Left = 32
        Top = 11
        Width = 40
        Height = 13
        Caption = 'Yoxlama'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 16
        Top = 11
        Width = 10
        Height = 13
        Caption = '1.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbOper2: TLabel
        Tag = 103
        Left = 32
        Top = 59
        Width = 122
        Height = 13
        Caption = #399'm'#601'liyyatlar arxivl'#601#351'dirilir'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 16
        Top = 35
        Width = 10
        Height = 13
        Caption = '2.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbOper3: TLabel
        Tag = 104
        Left = 32
        Top = 83
        Width = 130
        Height = 13
        Caption = 'Yeni m'#601'z'#601'nn'#601'l'#601'r t'#601'sdiql'#601'nir'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 16
        Top = 59
        Width = 10
        Height = 13
        Caption = '3.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbOper4: TLabel
        Tag = 105
        Left = 32
        Top = 107
        Width = 120
        Height = 13
        Caption = 'M'#601'z'#601'nn'#601' f'#601'rqi hesablan'#305'r'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 16
        Top = 83
        Width = 10
        Height = 13
        Caption = '4.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbOper5: TLabel
        Tag = 106
        Left = 32
        Top = 131
        Width = 153
        Height = 13
        Caption = #399'm'#601'liyyatlar yenid'#601'n hesablan'#305'r'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 16
        Top = 107
        Width = 10
        Height = 13
        Caption = '5.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbOper6: TLabel
        Tag = 107
        Left = 32
        Top = 155
        Width = 122
        Height = 13
        Caption = #399'm'#601'liyyatlar '#601'lav'#601' olunur'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 16
        Top = 131
        Width = 10
        Height = 13
        Caption = '6.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape1: TShape
        Left = 9
        Top = 175
        Width = 270
        Height = 1
        Brush.Color = clBlack
      end
      object Label1: TLabel
        Left = 16
        Top = 155
        Width = 10
        Height = 13
        Caption = '7.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Tag = 102
        Left = 32
        Top = 35
        Width = 218
        Height = 13
        Caption = 'Planla'#351'd'#305'r'#305'lm'#305#351' '#601'm'#601'liyyatlar yenid'#601'n hesablan'#305'r'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object stCommit: TStaticText
        Left = 26
        Top = 223
        Width = 142
        Height = 14
        AutoSize = False
        Caption = 'T'#601'sdiql'#601'nmi'#351' '#601'm'#601'liyyat say'#305':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = False
      end
      object stLazy: TStaticText
        Left = 27
        Top = 239
        Width = 142
        Height = 13
        AutoSize = False
        Caption = 'Planla'#351'd'#305'r'#305'lm'#305#351' '#601'm'#601'liyyat say'#305':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = False
      end
      object stRateDifferen: TStaticText
        Left = 16
        Top = 194
        Width = 163
        Height = 13
        AutoSize = False
        Caption = 'M'#601'z'#601'nn'#601' f'#601'rqi '#601'm'#601'liyyat say'#305':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
      object stRateDifferenResult: TStaticText
        Left = 174
        Top = 195
        Width = 106
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object stCommitResult: TStaticText
        Left = 174
        Top = 222
        Width = 106
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object stLazyResult: TStaticText
        Left = 174
        Top = 239
        Width = 105
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object stLazyCount: TStaticText
        Left = 16
        Top = 178
        Width = 163
        Height = 13
        AutoSize = False
        Caption = 'Planla'#351'd'#305'r'#305'lm'#305#351' '#601'm'#601'liyyat say'#305':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        Visible = False
      end
      object stLazyCountResult: TStaticText
        Left = 174
        Top = 179
        Width = 106
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'N'#601'tic'#601'l'#601'r'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
      end
      object stHead: TStaticText
        Left = 16
        Top = 208
        Width = 161
        Height = 14
        AutoSize = False
        Caption = #399'm'#601'liyyatlar'#305'n say'#305':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        TabOrder = 8
        Visible = False
      end
    end
  end
  object pnBottom: TPanel
    Left = 0
    Top = 291
    Width = 290
    Height = 42
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      290
      42)
    object btCose: TButton
      Left = 207
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&'#199#305'x'#305#351
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      OnClick = btCoseClick
    end
  end
end
