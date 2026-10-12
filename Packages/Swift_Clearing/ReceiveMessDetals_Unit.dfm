object RecMessDet_Form: TRecMessDet_Form
  Left = 206
  Top = 172
  Width = 630
  Height = 310
  Caption = 'Receive Message Detals'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 471
    Top = 259
    Width = 72
    Height = 22
    Anchors = [akRight, akBottom]
    Caption = 'Йаддаша йаз'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 548
    Top = 259
    Width = 72
    Height = 22
    Anchors = [akRight, akBottom]
    Caption = 'Чыхыш'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Panel8: TPanel
    Left = 0
    Top = 0
    Width = 622
    Height = 205
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Panel22: TPanel
      Left = 321
      Top = 26
      Width = 301
      Height = 125
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 2
      object Panel12: TPanel
        Left = 1
        Top = 1
        Width = 299
        Height = 49
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = 'Алан мцштяринин ады'
        TabOrder = 0
        object DBRichEdit2: TDBRichEdit
          Left = 92
          Top = 2
          Width = 205
          Height = 45
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clSilver
          DataField = 'REC_CLIENT_NAME'
          DataSource = DataMod.Message_in_DataSource
          TabOrder = 0
        end
      end
      object Panel16: TPanel
        Left = 1
        Top = 50
        Width = 299
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = 'Алан мцштяринин вюен-и'
        TabOrder = 1
        object DBEdit2: TDBEdit
          Left = 108
          Top = 2
          Width = 189
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clSilver
          DataField = 'REC_CLIENT_INN'
          DataSource = DataMod.Message_in_DataSource
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel23: TPanel
        Left = 1
        Top = 75
        Width = 299
        Height = 26
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = 'Аланын мцхбир щесабы'
        TabOrder = 2
        object DBEdit6: TDBEdit
          Left = 109
          Top = 1
          Width = 188
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clSilver
          DataField = 'REC_CLIENT_ACC'
          DataSource = DataMod.Message_in_DataSource
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 26
      Width = 321
      Height = 125
      Align = alLeft
      BevelOuter = bvLowered
      TabOrder = 1
      object Panel19: TPanel
        Left = 1
        Top = 1
        Width = 319
        Height = 49
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = 'Эюндярян иштиракчынын ады'
        TabOrder = 0
        object DBEdit17: TDBEdit
          Left = 120
          Top = 2
          Width = 196
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clSilver
          DataField = 'NAME'
          DataSource = DataMod.Message_in_DataSource
          ReadOnly = True
          TabOrder = 0
        end
        object DBRichEdit1: TDBRichEdit
          Left = 120
          Top = 2
          Width = 197
          Height = 45
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clSilver
          DataField = 'NAME'
          DataSource = DataMod.Message_in_DataSource
          TabOrder = 1
        end
      end
      object Panel21: TPanel
        Left = 1
        Top = 100
        Width = 319
        Height = 26
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = 'Эюндярян иштирикчынын Мцхбир субщесабы'
        TabOrder = 1
        object DBEdit18: TDBEdit
          Left = 185
          Top = 2
          Width = 132
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clSilver
          DataField = 'SEN_BANK_SUBACC'
          DataSource = DataMod.Message_in_DataSource
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel20: TPanel
        Left = 1
        Top = 75
        Width = 319
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = 'Эюндярян мцш-нин щесабы'
        TabOrder = 2
        object DBEdit16: TDBEdit
          Left = 134
          Top = 2
          Width = 183
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clSilver
          DataField = 'SEN_ACC'
          DataSource = DataMod.Message_in_DataSource
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel10: TPanel
        Left = 1
        Top = 50
        Width = 319
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = 'Эюндярян мцштяринин вюен-и'
        TabOrder = 3
        object DBEdit7: TDBEdit
          Left = 133
          Top = 2
          Width = 184
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clSilver
          DataField = 'SEN_INN'
          DataSource = DataMod.Message_in_DataSource
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object Panel9: TPanel
      Left = 0
      Top = 0
      Width = 622
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Panel14: TPanel
        Left = 0
        Top = 0
        Width = 209
        Height = 26
        Align = alLeft
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = 'Гейдиййат №'
        TabOrder = 0
        object DBEdit10: TDBEdit
          Left = 100
          Top = 2
          Width = 107
          Height = 21
          Anchors = [akRight, akBottom]
          Color = clBtnFace
          DataField = 'REFERENCE'
          DataSource = DataMod.Message_in_DataSource
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel2: TPanel
        Left = 209
        Top = 0
        Width = 184
        Height = 26
        Align = alLeft
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = 'Тарих:'
        TabOrder = 1
        object DBEdit1: TDBEdit
          Left = 32
          Top = 2
          Width = 149
          Height = 21
          Anchors = [akRight, akBottom]
          Color = clSilver
          DataField = 'TRANS_DATE'
          DataSource = DataMod.Message_in_DataSource
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object Panel24: TPanel
      Left = 0
      Top = 151
      Width = 622
      Height = 54
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 3
      object Panel5: TPanel
        Left = 2
        Top = 2
        Width = 618
        Height = 26
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 104
          Height = 26
          Align = alLeft
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = 'Юдяниш коду'
          TabOrder = 0
          object DBEdit5: TDBEdit
            Left = 73
            Top = 2
            Width = 28
            Height = 21
            Anchors = [akRight, akBottom]
            Color = clSilver
            DataField = 'TYPECODE'
            DataSource = DataMod.Message_in_DataSource
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel15: TPanel
          Left = 104
          Top = 0
          Width = 514
          Height = 26
          Align = alClient
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = 'Ялавя мялумат'
          TabOrder = 1
          object DBEdit14: TDBEdit
            Left = 80
            Top = 2
            Width = 432
            Height = 21
            Anchors = [akLeft, akTop, akRight, akBottom]
            Color = clSilver
            DataField = 'ADD_INF'
            DataSource = DataMod.Message_in_DataSource
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      object Panel18: TPanel
        Left = 2
        Top = 28
        Width = 618
        Height = 26
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 618
          Height = 26
          Align = alClient
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = 'Юдяйижидян вясаити алана мялумат'
          TabOrder = 0
          object DBEdit4: TDBEdit
            Left = 160
            Top = 2
            Width = 456
            Height = 21
            Anchors = [akLeft, akTop, akRight, akBottom]
            Color = clSilver
            DataField = 'REMIT_INF'
            DataSource = DataMod.Message_in_DataSource
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
  end
  object Panel17: TPanel
    Left = 0
    Top = 205
    Width = 622
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Panel26: TPanel
      Left = 0
      Top = 0
      Width = 281
      Height = 49
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 281
        Height = 24
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = 'Аланын фактики щесабы'
        TabOrder = 0
        object SearchEdit1: TSearchEdit
          Left = 99
          Top = 2
          Width = 180
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          CharCase = ecUpperCase
          MaxLength = 16
          TabOrder = 0
          DataSource = DataMod.Account_Source
          SearchField = 'acc_no'
        end
      end
      object Panel28: TPanel
        Left = 0
        Top = 24
        Width = 281
        Height = 25
        Align = alClient
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = 'Аланын вюен-и'
        TabOrder = 1
        object SearchEdit2: TSearchEdit
          Left = 99
          Top = 2
          Width = 180
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          CharCase = ecUpperCase
          MaxLength = 16
          TabOrder = 0
          DataSource = DataMod.Account_Source
          SearchField = 'inn'
        end
      end
    end
    object Panel11: TPanel
      Left = 281
      Top = 0
      Width = 341
      Height = 49
      Align = alClient
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Panel1: TPanel
        Left = 2
        Top = 2
        Width = 337
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Panel13: TPanel
          Left = 2
          Top = 2
          Width = 43
          Height = 21
          Align = alLeft
          Alignment = taLeftJustify
          Caption = 'Мцштяри:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 44
          Top = 2
          Width = 292
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clSilver
          DataField = 'ACC_NO'
          DataSource = DataMod.Account_Source
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object DBEdit8: TDBEdit
        Left = 2
        Top = 27
        Width = 336
        Height = 21
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clSilver
        DataField = 'NAME'
        DataSource = DataMod.Account_Source
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
end
