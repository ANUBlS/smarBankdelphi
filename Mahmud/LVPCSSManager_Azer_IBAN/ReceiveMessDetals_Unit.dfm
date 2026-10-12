object RecMessDet_Form: TRecMessDet_Form
  Left = 220
  Top = 293
  Caption = 'Receive Message Detals'
  ClientHeight = 282
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnConstrainedResize = FormConstrainedResize
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  DesignSize = (
    622
    282)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 471
    Top = 257
    Width = 72
    Height = 22
    Anchors = [akRight, akBottom]
    Caption = #1049#1072#1076#1076#1072#1096#1072' '#1081#1072#1079
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 548
    Top = 257
    Width = 72
    Height = 22
    Anchors = [akRight, akBottom]
    Caption = #1063#1099#1093#1099#1096
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
      BevelOuter = bvNone
      TabOrder = 2
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 301
        Height = 49
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #1040#1083#1072#1085' '#1084#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object DBRichEdit2: TDBRichEdit
          Left = 92
          Top = 2
          Width = 207
          Height = 45
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clSilver
          DataField = 'REC_CLIENT_NAME'
          DataSource = DataMod.DS_XS_IncomingView
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object Panel16: TPanel
        Left = 0
        Top = 49
        Width = 301
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #1040#1083#1072#1085' '#1084#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1074#1102#1077#1085'-'#1080
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          301
          25)
        object DBEdit2: TDBEdit
          Left = 109
          Top = 2
          Width = 190
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clSilver
          DataField = 'REC_CLIENT_INN'
          DataSource = DataMod.DS_XS_IncomingView
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel23: TPanel
        Left = 0
        Top = 74
        Width = 301
        Height = 26
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #1040#1083#1072#1085#1099#1085' '#1084#1094#1093#1073#1080#1088' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        DesignSize = (
          301
          26)
        object DBEdit6: TDBEdit
          Left = 109
          Top = 1
          Width = 190
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clSilver
          DataField = 'REC_CLIENT_ACC'
          DataSource = DataMod.DS_XS_IncomingView
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
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
      BevelOuter = bvNone
      TabOrder = 1
      object Panel19: TPanel
        Left = 0
        Top = 0
        Width = 321
        Height = 49
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #1069#1102#1085#1076#1103#1088#1103#1085' '#1080#1096#1090#1080#1088#1072#1082#1095#1099#1085#1099#1085' '#1072#1076#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          321
          49)
        object DBEdit17: TDBEdit
          Left = 120
          Top = 2
          Width = 198
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clSilver
          DataField = 'NAME'
          ReadOnly = True
          TabOrder = 0
        end
        object DBRichEdit1: TDBRichEdit
          Left = 120
          Top = 2
          Width = 199
          Height = 45
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clSilver
          DataField = 'NAME'
          DataSource = DataMod.DS_XS_IncomingView
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object Panel21: TPanel
        Left = 0
        Top = 99
        Width = 321
        Height = 26
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #1069#1102#1085#1076#1103#1088#1103#1085' '#1080#1096#1090#1080#1088#1080#1082#1095#1099#1085#1099#1085' '#1052#1094#1093#1073#1080#1088' '#1089#1091#1073#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          321
          26)
        object DBEdit18: TDBEdit
          Left = 185
          Top = 2
          Width = 134
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clSilver
          DataField = 'SEN_BANK_SUBACC'
          DataSource = DataMod.DS_XS_IncomingView
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel20: TPanel
        Left = 0
        Top = 74
        Width = 321
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #1069#1102#1085#1076#1103#1088#1103#1085' '#1084#1094#1096'-'#1085#1080#1085' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        DesignSize = (
          321
          25)
        object DBEdit16: TDBEdit
          Left = 134
          Top = 2
          Width = 185
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clSilver
          DataField = 'SEN_ACC'
          DataSource = DataMod.DS_XS_IncomingView
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel10: TPanel
        Left = 0
        Top = 49
        Width = 321
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #1069#1102#1085#1076#1103#1088#1103#1085' '#1084#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1074#1102#1077#1085'-'#1080
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        DesignSize = (
          321
          25)
        object DBEdit7: TDBEdit
          Left = 133
          Top = 2
          Width = 186
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clSilver
          DataField = 'SEN_INN'
          DataSource = DataMod.DS_XS_IncomingView
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
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
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = ' '#1043#1077#1081#1076#1080#1081#1081#1072#1090' '#8470
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          209
          26)
        object DBEdit10: TDBEdit
          Left = 100
          Top = 2
          Width = 107
          Height = 21
          Anchors = [akRight, akBottom]
          Color = clBtnFace
          DataField = 'REFERENCE'
          DataSource = DataMod.DS_XS_IncomingView
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
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
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #1058#1072#1088#1080#1093':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          184
          26)
        object DBEdit1: TDBEdit
          Left = 32
          Top = 2
          Width = 149
          Height = 21
          Anchors = [akRight, akBottom]
          Color = clSilver
          DataField = 'TRANS_DATE'
          DataSource = DataMod.DS_XS_IncomingView
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
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
      BevelOuter = bvNone
      TabOrder = 3
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 622
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
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = #1070#1076#1103#1085#1080#1096' '#1082#1086#1076#1091
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          DesignSize = (
            104
            26)
          object DBEdit5: TDBEdit
            Left = 73
            Top = 2
            Width = 28
            Height = 21
            Anchors = [akRight, akBottom]
            Color = clSilver
            DataField = 'TYPECODE'
            DataSource = DataMod.DS_XS_IncomingView
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel15: TPanel
          Left = 104
          Top = 0
          Width = 518
          Height = 26
          Align = alClient
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = #1071#1083#1072#1074#1103' '#1084#1103#1083#1091#1084#1072#1090
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          DesignSize = (
            518
            26)
          object DBEdit14: TDBEdit
            Left = 80
            Top = 2
            Width = 436
            Height = 21
            Anchors = [akLeft, akTop, akRight, akBottom]
            Color = clSilver
            DataField = 'ADD_INF'
            DataSource = DataMod.DS_XS_IncomingView
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      object Panel18: TPanel
        Left = 0
        Top = 26
        Width = 622
        Height = 26
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 622
          Height = 26
          Align = alClient
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = #1070#1076#1103#1081#1080#1078#1080#1076#1103#1085' '#1074#1103#1089#1072#1080#1090#1080' '#1072#1083#1072#1085#1072' '#1084#1103#1083#1091#1084#1072#1090
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          DesignSize = (
            622
            26)
          object DBEdit4: TDBEdit
            Left = 160
            Top = 2
            Width = 460
            Height = 21
            Anchors = [akLeft, akTop, akRight, akBottom]
            Color = clSilver
            DataField = 'REMIT_INF'
            DataSource = DataMod.DS_XS_IncomingView
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
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
    Height = 52
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Panel26: TPanel
      Left = 0
      Top = 0
      Width = 281
      Height = 52
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
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #1040#1083#1072#1085#1099#1085' '#1092#1072#1082#1090#1080#1082#1080' '#1097#1077#1089#1072#1073#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          281
          24)
        object SearchEdit1: TSearchEdit
          Left = 100
          Top = 2
          Width = 179
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          CharCase = ecUpperCase
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          MaxLength = 35
          ParentFont = False
          TabOrder = 0
          DataSource = DataMod.Account_Source
          SearchField = 'acc_no'
        end
      end
      object Panel28: TPanel
        Left = 0
        Top = 24
        Width = 281
        Height = 28
        Align = alClient
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #1040#1083#1072#1085#1099#1085' '#1074#1102#1077#1085'-'#1080
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          281
          28)
        object SearchEdit2: TSearchEdit
          Left = 100
          Top = 2
          Width = 179
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          CharCase = ecUpperCase
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          MaxLength = 16
          ParentFont = False
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
      Height = 52
      Align = alClient
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        341
        52)
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 341
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          341
          25)
        object Panel13: TPanel
          Left = 1
          Top = 1
          Width = 43
          Height = 23
          Align = alLeft
          Alignment = taLeftJustify
          Caption = #1052#1094#1096#1090#1103#1088#1080':'
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
          Width = 296
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          Color = clSilver
          DataField = 'ACC_NO'
          DataSource = DataMod.Account_Source
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object DBEdit8: TDBEdit
        Left = 1
        Top = 26
        Width = 339
        Height = 21
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clSilver
        DataField = 'NAME'
        DataSource = DataMod.Account_Source
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
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
