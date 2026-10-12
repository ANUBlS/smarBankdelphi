object CustomerInfoForm: TCustomerInfoForm
  Left = 4
  Top = 222
  Caption = 'Customer information'
  ClientHeight = 644
  ClientWidth = 737
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object TabControl: TTabControl
    Left = 0
    Top = 0
    Width = 737
    Height = 542
    Align = alClient
    TabOrder = 0
    OnChange = TabControlChange
    object ScrollBox1: TScrollBox
      Left = 4
      Top = 6
      Width = 729
      Height = 532
      Align = alClient
      TabOrder = 0
      object Label1: TLabel
        Left = 281
        Top = 362
        Width = 91
        Height = 14
        Caption = #399'lav'#601' informasiya'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Panel2: TPanel
        Left = 279
        Top = 1
        Width = 285
        Height = 235
        AutoSize = True
        BevelInner = bvLowered
        TabOrder = 0
        object Panel3: TPanel
          Left = 2
          Top = 117
          Width = 281
          Height = 116
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #1048#1084#1079#1072
          TabOrder = 0
          object Image2: TImage
            Left = 166
            Top = 0
            Width = 114
            Height = 113
            Stretch = True
          end
          object BitBtn5: TBitBtn
            Left = 92
            Top = 40
            Width = 73
            Height = 35
            Caption = #1071#1083#1072#1074#1103
            DoubleBuffered = True
            Glyph.Data = {
              BE060000424DBE06000000000000360400002800000024000000120000000100
              0800000000008802000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              03030303030303030303030303030303030303030303FF030303030303030303
              03030303030303040403030303030303030303030303030303F8F8FF03030303
              03030303030303030303040202040303030303030303030303030303F80303F8
              FF030303030303030303030303040202020204030303030303030303030303F8
              03030303F8FF0303030303030303030304020202020202040303030303030303
              0303F8030303030303F8FF030303030303030304020202FA0202020204030303
              0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
              040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
              03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
              FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
              0303030303030303030303FA0202020403030303030303030303030303F8FF03
              03F8FF03030303030303030303030303FA020202040303030303030303030303
              0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
              03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
              030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
              0202040303030303030303030303030303F8FF03F8FF03030303030303030303
              03030303FA0202030303030303030303030303030303F8FFF803030303030303
              030303030303030303FA0303030303030303030303030303030303F803030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303}
            NumGlyphs = 2
            ParentDoubleBuffered = False
            TabOrder = 0
            OnClick = BitBtn5Click
          end
          object BitBtn2: TBitBtn
            Left = 92
            Top = 3
            Width = 73
            Height = 36
            Caption = 'Zoom'
            DoubleBuffered = True
            Glyph.Data = {
              66010000424D6601000000000000760000002800000014000000140000000100
              040000000000F000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDD707DDDDDDDDDDDDDD0000DD73
              307DDDDDDDDDDDDD0000DD783307DDDDDDDDDDDD0000DDD383307DDDDDDDDDDD
              0000DDDD38330777777DDDDD0000DDDDD38330000077DDDD0000DDDDDD383378
              88707DDD0000DDDDDDD037F8F88707DD0000DDDDDDD07FCCCCC8777D0000DDDD
              DCD0F8C8F8C880CD0000DDDDDCC08FCCCCCF80DD0000DDDDDCD0F8CFFCF880DD
              0000DDDDDDC77FCCCC8F77CD0000DDDDDDDD07F8F8F70DDD0000DDDDDDDDD07F
              8F70DDDD0000DDDDDDDDDD70007DDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
              DDDDDDDDDDDDDDDD0000}
            ParentDoubleBuffered = False
            TabOrder = 1
            OnClick = BitBtn2Click
          end
        end
        object Panel4: TPanel
          Left = 2
          Top = 2
          Width = 281
          Height = 115
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #1064#1103#1082#1080#1083':'
          TabOrder = 1
          object Image1: TImage
            Left = 166
            Top = 0
            Width = 114
            Height = 113
            Stretch = True
          end
          object BitBtn4: TBitBtn
            Left = 92
            Top = 39
            Width = 74
            Height = 35
            Caption = #1071#1083#1072#1074#1103
            DoubleBuffered = True
            Glyph.Data = {
              BE060000424DBE06000000000000360400002800000024000000120000000100
              0800000000008802000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              03030303030303030303030303030303030303030303FF030303030303030303
              03030303030303040403030303030303030303030303030303F8F8FF03030303
              03030303030303030303040202040303030303030303030303030303F80303F8
              FF030303030303030303030303040202020204030303030303030303030303F8
              03030303F8FF0303030303030303030304020202020202040303030303030303
              0303F8030303030303F8FF030303030303030304020202FA0202020204030303
              0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
              040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
              03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
              FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
              0303030303030303030303FA0202020403030303030303030303030303F8FF03
              03F8FF03030303030303030303030303FA020202040303030303030303030303
              0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
              03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
              030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
              0202040303030303030303030303030303F8FF03F8FF03030303030303030303
              03030303FA0202030303030303030303030303030303F8FFF803030303030303
              030303030303030303FA0303030303030303030303030303030303F803030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303}
            NumGlyphs = 2
            ParentDoubleBuffered = False
            TabOrder = 0
            OnClick = BitBtn4Click
          end
          object BitBtn1: TBitBtn
            Left = 92
            Top = 2
            Width = 73
            Height = 36
            Caption = 'Zoom'
            DoubleBuffered = True
            Glyph.Data = {
              66010000424D6601000000000000760000002800000014000000140000000100
              040000000000F000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDD707DDDDDDDDDDDDDD0000DD73
              307DDDDDDDDDDDDD0000DD783307DDDDDDDDDDDD0000DDD383307DDDDDDDDDDD
              0000DDDD38330777777DDDDD0000DDDDD38330000077DDDD0000DDDDDD383378
              88707DDD0000DDDDDDD037F8F88707DD0000DDDDDDD07FCCCCC8777D0000DDDD
              DCD0F8C8F8C880CD0000DDDDDCC08FCCCCCF80DD0000DDDDDCD0F8CFFCF880DD
              0000DDDDDDC77FCCCC8F77CD0000DDDDDDDD07F8F8F70DDD0000DDDDDDDDD07F
              8F70DDDD0000DDDDDDDDDD70007DDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
              DDDDDDDDDDDDDDDD0000}
            ParentDoubleBuffered = False
            TabOrder = 1
            OnClick = BitBtn1Click
          end
        end
      end
      object Panel14: TPanel
        Left = 3
        Top = 1
        Width = 274
        Height = 380
        AutoSize = True
        BevelInner = bvLowered
        TabOrder = 1
        object Panel15: TPanel
          Left = 2
          Top = 299
          Width = 270
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #1045'-'#1052#1072#1080#1083':'
          TabOrder = 0
          object Edit13: TEdit
            Left = 95
            Top = 1
            Width = 166
            Height = 22
            TabOrder = 0
          end
        end
        object Panel16: TPanel
          Left = 2
          Top = 250
          Width = 270
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #1058#1077#1083'. '#1077#1074':'
          TabOrder = 1
          object Edit11: TEdit
            Left = 95
            Top = 1
            Width = 166
            Height = 22
            TabOrder = 0
          end
        end
        object Panel17: TPanel
          Left = 2
          Top = 176
          Width = 270
          Height = 24
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #1048#1096' '#1081#1077#1088#1080':'
          TabOrder = 2
          object Edit8: TEdit
            Left = 95
            Top = 1
            Width = 166
            Height = 22
            TabOrder = 0
          end
        end
        object Panel18: TPanel
          Left = 2
          Top = 151
          Width = 270
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #1064#1103#1097#1103#1088':'
          TabOrder = 3
          object Edit7: TEdit
            Left = 95
            Top = 1
            Width = 166
            Height = 22
            TabOrder = 0
          end
        end
        object Panel19: TPanel
          Left = 2
          Top = 126
          Width = 270
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #1062#1085#1074#1072#1085':'
          TabOrder = 4
          object Edit6: TEdit
            Left = 95
            Top = 1
            Width = 166
            Height = 22
            TabOrder = 0
          end
        end
        object Panel20: TPanel
          Left = 2
          Top = 101
          Width = 270
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #1044#1086#1100#1091#1083#1076#1091#1100#1091' '#1081#1077#1088':'
          TabOrder = 5
          object Edit5: TEdit
            Left = 95
            Top = 1
            Width = 166
            Height = 22
            TabOrder = 0
          end
        end
        object Panel21: TPanel
          Left = 2
          Top = 76
          Width = 270
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #1058#1103#1074#1103#1083#1083#1094#1076
          TabOrder = 6
          object Edit4: TEdit
            Left = 95
            Top = 1
            Width = 166
            Height = 22
            TabOrder = 0
            Visible = False
          end
          object TDEdit4: TDateTimePicker
            Left = 95
            Top = 0
            Width = 166
            Height = 21
            Date = 39049.717589328700000000
            Time = 39049.717589328700000000
            TabOrder = 1
          end
        end
        object Panel22: TPanel
          Left = 2
          Top = 52
          Width = 270
          Height = 24
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #1040#1090#1072#1089#1099#1085#1099#1085' '#1072#1076#1099':'
          TabOrder = 7
          object Edit3: TEdit
            Left = 95
            Top = 1
            Width = 166
            Height = 22
            TabOrder = 0
          end
        end
        object Panel23: TPanel
          Left = 2
          Top = 27
          Width = 270
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #1057#1086#1081#1072#1076#1099':'
          TabOrder = 8
          object Edit2: TEdit
            Left = 95
            Top = 1
            Width = 166
            Height = 22
            TabOrder = 0
          end
        end
        object Panel24: TPanel
          Left = 2
          Top = 2
          Width = 270
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #1040#1076#1099':'
          TabOrder = 9
          object Edit1: TEdit
            Left = 95
            Top = 1
            Width = 166
            Height = 22
            TabOrder = 0
          end
        end
        object Panel25: TPanel
          Left = 2
          Top = 275
          Width = 270
          Height = 24
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #1058#1077#1083'. '#1080#1096':'
          TabOrder = 10
          object Edit12: TEdit
            Left = 95
            Top = 1
            Width = 166
            Height = 22
            TabOrder = 0
          end
        end
        object Panel26: TPanel
          Left = 2
          Top = 225
          Width = 270
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #1058#1077#1083'. '#1084#1086#1073#1080#1083':'
          TabOrder = 11
          object Edit10: TEdit
            Left = 95
            Top = 1
            Width = 166
            Height = 22
            TabOrder = 0
          end
        end
        object Panel11: TPanel
          Left = 2
          Top = 324
          Width = 270
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = 'WWW-'#1072#1076#1088#1077#1089':'
          TabOrder = 12
          object Edit14: TEdit
            Left = 95
            Top = 1
            Width = 166
            Height = 22
            TabOrder = 0
          end
        end
        object Panel1: TPanel
          Left = 2
          Top = 200
          Width = 270
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #1042#1103#1079#1080#1092#1103#1089#1080':'
          TabOrder = 13
          object Edit9: TEdit
            Left = 95
            Top = 1
            Width = 166
            Height = 22
            TabOrder = 0
          end
        end
        object Panel5: TPanel
          Left = 2
          Top = 353
          Width = 270
          Height = 25
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #1047#1103#1084#1072#1085#1103#1090' '#1074#1077#1088#1103#1085':'
          TabOrder = 14
          object Edit15: TEdit
            Left = 96
            Top = 2
            Width = 165
            Height = 22
            TabOrder = 0
          end
        end
      end
      object Panel6: TPanel
        Left = 279
        Top = 236
        Width = 284
        Height = 117
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = #1052#1102#1097#1094#1088
        TabOrder = 2
        object Image3: TImage
          Left = 168
          Top = 0
          Width = 114
          Height = 115
          Stretch = True
        end
        object BitBtn6: TBitBtn
          Left = 96
          Top = 40
          Width = 72
          Height = 35
          Caption = #1071#1083#1072#1074#1103
          DoubleBuffered = True
          Glyph.Data = {
            BE060000424DBE06000000000000360400002800000024000000120000000100
            0800000000008802000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            03030303030303030303030303030303030303030303FF030303030303030303
            03030303030303040403030303030303030303030303030303F8F8FF03030303
            03030303030303030303040202040303030303030303030303030303F80303F8
            FF030303030303030303030303040202020204030303030303030303030303F8
            03030303F8FF0303030303030303030304020202020202040303030303030303
            0303F8030303030303F8FF030303030303030304020202FA0202020204030303
            0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
            040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
            03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
            FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
            0303030303030303030303FA0202020403030303030303030303030303F8FF03
            03F8FF03030303030303030303030303FA020202040303030303030303030303
            0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
            03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
            030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
            0202040303030303030303030303030303F8FF03F8FF03030303030303030303
            03030303FA0202030303030303030303030303030303F8FFF803030303030303
            030303030303030303FA0303030303030303030303030303030303F803030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303}
          NumGlyphs = 2
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = BitBtn6Click
        end
        object BitBtn3: TBitBtn
          Left = 95
          Top = 3
          Width = 72
          Height = 36
          Caption = 'Zoom'
          DoubleBuffered = True
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F000000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDD707DDDDDDDDDDDDDD0000DD73
            307DDDDDDDDDDDDD0000DD783307DDDDDDDDDDDD0000DDD383307DDDDDDDDDDD
            0000DDDD38330777777DDDDD0000DDDDD38330000077DDDD0000DDDDDD383378
            88707DDD0000DDDDDDD037F8F88707DD0000DDDDDDD07FCCCCC8777D0000DDDD
            DCD0F8C8F8C880CD0000DDDDDCC08FCCCCCF80DD0000DDDDDCD0F8CFFCF880DD
            0000DDDDDDC77FCCCC8F77CD0000DDDDDDDD07F8F8F70DDD0000DDDDDDDDD07F
            8F70DDDD0000DDDDDDDDDD70007DDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
            DDDDDDDDDDDDDDDD0000}
          ParentDoubleBuffered = False
          TabOrder = 1
          OnClick = BitBtn3Click
        end
      end
      object GroupBox1: TGroupBox
        Left = 5
        Top = 379
        Width = 271
        Height = 128
        Caption = #1055#1072#1089#1087#1086#1088#1090':'
        TabOrder = 3
        object Panel7: TPanel
          Left = 5
          Top = 15
          Width = 258
          Height = 25
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #1057#1077#1088#1080#1081#1072#1089#1099
          TabOrder = 0
          object Edit16: TEdit
            Left = 92
            Top = 1
            Width = 165
            Height = 22
            TabOrder = 0
          end
        end
        object Panel8: TPanel
          Left = 4
          Top = 96
          Width = 258
          Height = 25
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #1042#1077#1088#1080#1083#1076#1080#1081#1080' '#1081#1077#1088':'
          TabOrder = 1
          object Edit19: TDBLookupComboBox
            Left = 93
            Top = 1
            Width = 167
            Height = 22
            KeyField = 'NAME'
            ListField = 'NAME'
            ListSource = passdeps
            TabOrder = 0
          end
        end
        object Panel9: TPanel
          Left = 5
          Top = 69
          Width = 258
          Height = 25
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #1042#1077#1088#1080#1083#1076#1080#1081#1080' '#1090#1072#1088#1080#1093':'
          TabOrder = 2
          object Edit18: TEdit
            Left = 92
            Top = 1
            Width = 165
            Height = 22
            TabOrder = 0
            Visible = False
          end
          object TDEdit18: TDateTimePicker
            Left = 92
            Top = 1
            Width = 165
            Height = 21
            Date = 39049.717589328700000000
            Time = 39049.717589328700000000
            TabOrder = 1
          end
        end
        object Panel12: TPanel
          Left = 5
          Top = 41
          Width = 258
          Height = 25
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = #8470
          TabOrder = 3
          object Edit17: TEdit
            Left = 92
            Top = 1
            Width = 165
            Height = 22
            TabOrder = 0
          end
        end
      end
      object Memo1: TMemo
        Left = 281
        Top = 377
        Width = 285
        Height = 130
        TabOrder = 4
      end
    end
  end
  object Panel10: TPanel
    Left = 0
    Top = 542
    Width = 737
    Height = 102
    Align = alBottom
    TabOrder = 1
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 313
      Height = 82
      Align = alNone
      AutoSize = True
      ButtonHeight = 37
      ButtonWidth = 80
      Caption = 'ToolBar1'
      Images = ImageList1
      ShowCaptions = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        Style = tbsSeparator
      end
      object ToolButton2: TToolButton
        Left = 8
        Top = 0
        Caption = #1049#1077#1085#1080' '#1082#1072#1088#1090
        ImageIndex = 7
        OnClick = ToolButton2Click
      end
      object ToolButton3: TToolButton
        Left = 88
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 96
        Top = 0
        Caption = #1050#1072#1088#1090#1099' '#1089#1080#1083#1084#1103#1082
        ImageIndex = 4
        OnClick = ToolButton4Click
      end
      object ToolButton5: TToolButton
        Left = 176
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton6: TToolButton
        Left = 184
        Top = 0
        Caption = #1043#1103#1073#1091#1083' '
        ImageIndex = 3
        OnClick = ToolButton6Click
      end
      object ToolButton9: TToolButton
        Left = 0
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 2
        Wrap = True
        Style = tbsSeparator
      end
      object ToolButton8: TToolButton
        Left = 0
        Top = 45
        Caption = #1048#1084#1090#1080#1085#1072
        ImageIndex = 1
        OnClick = ToolButton8Click
      end
      object ToolButton10: TToolButton
        Left = 80
        Top = 45
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object ToolButton7: TToolButton
        Left = 88
        Top = 45
        Caption = #1044#1080#1101#1103#1088' '#1080#1085#1092#1086
        ImageIndex = 5
        Visible = False
      end
      object Fill_Edit: TButton
        Left = 168
        Top = 45
        Width = 145
        Height = 37
        Caption = 'Nu ti Mamed daesh ... (Tars)'
        TabOrder = 0
        Visible = False
        OnClick = Fill_EditClick
      end
    end
  end
  object CustInfoData: TOracleDataSet
    SQL.Strings = (
      'select i.rowid,I.*'
      '  from CUSTINFO i'
      'where IDCust = :CustomerID'
      'order by id ')
    Optimize = False
    Variables.Data = {
      0400000001000000160000003A0043005500530054004F004D00450052004900
      4400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000002300000004000000490044000100000000000C000000490044004300
      5500530054000100000000000C00000053004F004E0041004D00450001000000
      0000080000004E0041004D004500010000000000100000004C00410053005400
      4E0041004D004500010000000000100000004200490052005400480044004100
      5900010000000000140000004200490052005400480050004C00410043004500
      0100000000000C0000005000410053005300450052000100000000000E000000
      50004100530050004E0055004D00010000000000100000005000410053005000
      440041005400450001000000000012000000500041005300500050004C004100
      430045000100000000000800000043004900540059000100000000000E000000
      41004400440052004500530053000100000000001200000057004F0052004B00
      50004C004100430045000100000000000E000000500048004F004E0045005F00
      57000100000000000E000000500048004F004E0045005F004800010000000000
      0E000000500048004F004E0045005F004D000100000000000C00000045005F00
      4D00410049004C0001000000000006000000550052004C000100000000001A00
      00005200450043004F004D0045004E0044004100540049004F004E0001000000
      00001000000047004100520041004E0054004500440001000000000018000000
      4F00540056005F00500041005300530050004F00520054000100000000001400
      00004F00540056005F0049005300530055004500440001000000000014000000
      4F00540056005F00490053004400410054004500010000000000080000004E00
      4F00540045000100000000000800000057004F0052004B000100000000000800
      0000540045005300540001000000000014000000460041004D005F0053005400
      4100540055005300010000000000060000005300450058000100000000001400
      000041004400520053005F005300540041005400450001000000000016000000
      420049005200540048005F005300540041005400450001000000000016000000
      460041004B0054005F0041004400520045005300530001000000000014000000
      4300480049004C0044005F0049004E0046004F00010000000000100000004400
      4F0043005F0054005900500045000100000000000E0000005000410053005300
      500049004E00010000000000}
    Cursor = crSQLWait
    CountAllRecords = True
    CachedUpdates = True
    Session = sboapiDataModule.SBSession
    AfterOpen = CustInfoDataAfterOpen
    Left = 312
    Top = 32
    object CustInfoDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CustInfoDataIDCUST: TFloatField
      FieldName = 'IDCUST'
      Required = True
    end
    object CustInfoDataSONAME: TWideStringField
      FieldName = 'SONAME'
      Size = 30
    end
    object CustInfoDataNAME: TWideStringField
      FieldName = 'NAME'
      Size = 30
    end
    object CustInfoDataLASTNAME: TWideStringField
      FieldName = 'LASTNAME'
      Size = 30
    end
    object CustInfoDataBIRTHDAY: TDateTimeField
      FieldName = 'BIRTHDAY'
    end
    object CustInfoDataBIRTHPLACE: TWideStringField
      FieldName = 'BIRTHPLACE'
      Size = 30
    end
    object CustInfoDataPASSER: TWideStringField
      FieldName = 'PASSER'
      Size = 30
    end
    object CustInfoDataPASPNUM: TWideStringField
      FieldName = 'PASPNUM'
      Size = 30
    end
    object CustInfoDataPASPDATE: TDateTimeField
      FieldName = 'PASPDATE'
    end
    object CustInfoDataPASPPLACE: TWideStringField
      FieldName = 'PASPPLACE'
      Size = 100
    end
    object CustInfoDataCITY: TWideStringField
      FieldName = 'CITY'
      Size = 60
    end
    object CustInfoDataADDRESS: TWideStringField
      FieldName = 'ADDRESS'
      Size = 100
    end
    object CustInfoDataWORKPLACE: TWideStringField
      FieldName = 'WORKPLACE'
      Size = 30
    end
    object CustInfoDataPHONE_W: TWideStringField
      FieldName = 'PHONE_W'
      Size = 30
    end
    object CustInfoDataPHONE_H: TWideStringField
      FieldName = 'PHONE_H'
      Size = 30
    end
    object CustInfoDataPHONE_M: TWideStringField
      FieldName = 'PHONE_M'
      Size = 30
    end
    object CustInfoDataE_MAIL: TWideStringField
      FieldName = 'E_MAIL'
      Size = 30
    end
    object CustInfoDataURL: TWideStringField
      FieldName = 'URL'
      Size = 30
    end
    object CustInfoDataRECOMENDATION: TWideStringField
      FieldName = 'RECOMENDATION'
      Size = 30
    end
    object CustInfoDataGARANTED: TWideStringField
      FieldName = 'GARANTED'
      Size = 30
    end
    object CustInfoDataOTV_PASSPORT: TWideStringField
      FieldName = 'OTV_PASSPORT'
      Size = 100
    end
    object CustInfoDataOTV_ISSUED: TWideStringField
      FieldName = 'OTV_ISSUED'
      Size = 100
    end
    object CustInfoDataOTV_ISDATE: TWideStringField
      FieldName = 'OTV_ISDATE'
      Size = 100
    end
    object CustInfoDataNOTE: TWideStringField
      FieldName = 'NOTE'
      Size = 500
    end
    object CustInfoDataWORK: TWideStringField
      FieldName = 'WORK'
      Size = 100
    end
  end
  object CustInfo: TDataSource
    DataSet = CustInfoData
    Left = 280
    Top = 32
  end
  object OpenPictureDlg: TOpenPictureDialog
    Left = 294
    Top = 148
  end
  object ImageList1: TImageList
    Left = 272
    Top = 125
    Bitmap = {
      494C010108000A00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848684008486
      8400848684008486840000000000000000000000000000000000848684000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C7C600C6C7C600C6C7C600C6C7C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008486
      8400848684008486840000000000000000000000000000000000848684008486
      840000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000000000C6C7C600C6C7C600C6C7C6000000000000000000000000000000
      00000000000000000000000000000000000000000000BD000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000BD000000
      0000000000008486840084868400000000000000FF000000BD00000000008486
      840084868400848684000000000000000000000000000086000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000000000C6C7C600C6C7C6000000000000000000000000000000
      000000000000000000000000000000000000BD000000BD000000BD000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000BD000000
      BD000000000000000000848684000000FF000000BD000000BD00000000000000
      000084868400000000000000000000000000000000000086000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000000000C6C7C600C6C7C6000000000000000000000000000000
      0000000000000000000000000000BD000000BD000000BD000000BD000000FFFF
      FF00000000000000000000000000000000000000000000000000848684008486
      8400848684008486840084868400848684008486840084868400848684008486
      840084868400848684000000000000000000000000000000FF000000BD000000
      BD000000BD00000000000000FF000000BD000000BD000000BD000000BD000000
      00000000000000000000000000000000000000000000008600000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF0000C6C7C600C6C7C6000000000000000000000000000000
      00000000000000000000BD000000BD000000BD000000FFFFFF00BD000000BD00
      0000FFFFFF00000000000000000000000000000000000000000084868400C6C7
      C60000FFFF00C6C7C60000FFFF00C6C7C60000FFFF00C6C7C60000FFFF00C6C7
      C60000FFFF0084868400848684000000000000000000000000000000BD000000
      BD000000BD000000BD000000BD000000BD000000BD000000BD000000BD000000
      00000000000000000000000000000000000000000000008600000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF0000C6C7C600C6C7C6000000000000000000FFFFFF00FFFF
      FF00FFFFFF00BD000000BD000000BD000000FFFFFF000000000000000000BD00
      0000BD000000FFFFFF0000000000000000000000000084868400C6C7C60000FF
      FF00C6C7C60000FFFF00C6C7C60000FFFF00C6C7C60000FFFF00C6C7C60000FF
      FF00C6C7C60084868400848684000000000000000000000000000000FF000000
      FF000000BD000000BD000000BD000000BD000000BD000000BD00000000000000
      0000000000000000000000000000000000000000000000860000008600000000
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000000000C6C7C6000000000000000000FFFFFF008486
      84008486840084868400BD000000FFFFFF00FFFFFF0000000000000000000000
      0000BD000000FFFFFF0000000000000000000000000084868400FFFFFF00C6C7
      C60000FFFF00C6C7C60000FFFF00C6C7C60000FFFF00C6C7C60000FFFF00C6C7
      C600848684008486840084868400000000000000000000000000000000000000
      FF000000FF000000BD000000BD000000BD000000BD0000000000848684000000
      0000000000000000000000000000000000000000000000860000008600000086
      00000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000BD000000FFFFFF000000000084868400C6C7C600C6C7C60000FF
      FF00C6C7C60000FFFF00C6C7C60000FFFF00C6C7C60000FFFF00C6C7C60000FF
      FF0084868400C6C7C60084868400000000000000000000000000000000000000
      00000000FF000000BD000000BD000000BD000000BD0000000000848684008486
      8400000000000000000000000000000000000000000000860000008600000086
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008486
      840084868400848684008486840084868400FFFFFF0000000000000000000000
      00000000000000000000BD000000FFFFFF0084868400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C7C6008486
      8400C6C7C600C6C7C60084868400000000000000000000000000000000000000
      00000000FF000000BD000000BD000000BD000000BD0000000000848684008486
      8400000000000000000000000000000000000000000000860000008600000086
      0000008600000086000000860000008600000086000000860000008600000000
      0000C6C7C600C6C7C600C6C7C600C6C7C6000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000BD0000008486840084868400848684008486
      8400848684008486840084868400848684008486840084868400848684008486
      8400C6C7C60000FFFF0084868400000000000000000000000000000000000000
      FF000000BD000000BD000000FF000000FF000000BD000000BD00000000008486
      8400848684008486840000000000000000000000000000860000008600000086
      0000008600000086000000860000008600000086000000860000008600000000
      0000C6C7C600C6C7C600C6C7C600C6C7C6000000000000000000FFFFFF008486
      840084868400000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000084868400C6C7C600C6C7
      C60000FFFF00C6C7C60000FFFF00C6C7C60000FFFF00C6C7C60000FFFF00C6C7
      C60000FFFF00C6C7C600848684000000000000000000000000000000FF000000
      BD000000BD000000BD00848684000000FF000000FF000000BD00000000000000
      0000848684008486840000000000000000000000000000860000008600000086
      0000008600000086000000000000000000000000000000000000000000000000
      0000C6C7C6000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084868400C6C7C60000FF
      FF00C6C7C60000FFFF00C6C7C60000FFFF00C6C7C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00848684000000000000000000000000000000FF000000
      BD000000BD000000BD0000000000000000000000FF000000FF000000BD000000
      0000000000008486840084868400000000000000000000000000008600000086
      00000086000000000000C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7
      C600C6C7C600C6C7C60000000000000000000000000000000000FFFFFF008486
      8400848684000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084868400C6C7C600C6C7
      C60000FFFF00C6C7C60000FFFF00C6C7C600C6C7C60084868400848684008486
      84008486840084868400000000000000000000000000000000000000BD000000
      BD000000BD000000BD000000000000000000000000000000FF000000BD000000
      BD0000000000848684008486840000000000C6C7C60000000000000000000000
      000000000000C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7
      C600C6C7C600C6C7C600C6C7C600000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084868400C6C7
      C600C6C7C600FFFFFF00C6C7C600FFFFFF008486840000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF0000000000000000000000000000000000000000000000FF000000
      FF000000BD00000000000000000000000000C6C7C600C6C7C600C6C7C600C6C7
      C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C6000000
      00000000000000000000C6C7C600C6C7C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008486
      8400848684008486840084868400848684000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF00000000000000000000000000C6C7C600C6C7C600C6C7C600C6C7
      C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7C600C6C7
      C600C6C7C600C6C7C600C6C7C600C6C7C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002120210021202100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004241420063616300848684008486840084868400636163004241
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000004241420063616300848684008486840084868400636163004241
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002120DE00212021000000000021209C003130AD00000000000000
      0000000000000000000000000000000000000000000000000000000000002120
      21002120630021209C000000BD000000BD000000BD0021209C00424184008486
      8400636163002120210000000000000000000000000000000000000000002120
      21002120630021209C000000BD000000BD000000BD0021209C00424184008486
      8400636163002120210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF002120DE00848684000000FF004241BD00313031002120
      9C003130AD000000000000000000000000000000000000000000000021002120
      9C000000FF000000FF000000FF000000FF000000FF000000FF000000FF002120
      9C00636184008486840021202100000000000000000000000000000021002120
      9C000000FF000000FF000000FF000000FF000000FF000000FF000000FF002120
      9C00636184008486840021202100000000000000000000000000000000000000
      0000000000000000000000000000840000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006361DE000000
      7B0000007B000000FF000000FF000000FF000000FF000000BD002120DE000000
      FF0000007B0000000000000000000000000000000000000021000000DE000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000DE0063618400636163000000000000000000000021000000DE000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000DE006361840063616300000000000000000000000000000000000000
      0000000000000000000084000000008600008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000525152000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007B000000FF000000
      FF0000007B005251520042414200000000000000000000007B000000FF000000
      FF003938FF000000FF000000FF000000FF000000FF000000FF003938FF000000
      FF000000FF0021209C0084868400424142000000000000007B000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF0021209C0084868400424142000000000000000000000000000000
      0000000000008400000000860000008600000086000000000000000000000000
      0000000000000000000000000000000000000000000031303100424142000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007B000000FF000000
      FF000000FF000000FF0042417B0000000000000042000000FF000000FF003938
      FF0000000000BDBEFF000000FF000000FF000000FF00BDBEFF00000000003938
      FF000000FF000000FF004241840063616300000042000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0042418400636163000000000000000000000000000000
      0000840000000086000000860000008600000086000084000000000000000000
      000000000000000000000000000000000000424142000000FF000000FF000000
      FF000000FF000000FF000000FF000079FF000079FF000000BD000000FF000000
      FF000000FF000000BD00000000000000000000007B000000FF000000FF000000
      FF00BDBEFF0000000000BDBEFF000000FF00BDBEFF0000000000BDBEFF000000
      FF000000FF000000FF0021209C008486840000007B000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0021209C00848684000000000000000000000000000000
      0000008600000086000000FF000000FF00000086000000860000840000000000
      00000000000000000000000000000000000000000000000039002120DE000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007B000000FF000000
      FF000000FF000000BD0000003900000000000000BD000000FF000000FF000000
      FF000000FF00BDBEFF00000000000000000000000000BDBEFF000000FF000000
      FF000000FF000000FF000000BD00848684000000BD000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000BD00848684000000000000000000000000000000
      00000086000000FF0000000000000000000000FF000000860000008600008400
      0000000000000000000000000000000000000000000021205A002120DE000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007B000000FF000000
      FF000000FF000000FF000000FF0052518C000000BD000000FF000000FF000000
      FF000000FF000000FF000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000BD00848684000000BD000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000BD00848684000000000000000000000000000000
      000000FF00000000000000000000000000000000000000860000008600000086
      00000000000000000000000000000000000021205A000000FF000000FF000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007B000000FF000000
      FF000000FF0021209C0031303100000000000000BD000000FF000000FF000000
      FF000000FF00BDBEFF00000000000000000000000000BDBEFF000000FF000000
      FF000000FF000000FF000000BD00636163000000BD000000FF007B79FF007B79
      FF007B79FF007B79FF007B79FF007B79FF007B79FF007B79FF007B79FF007B79
      FF007B79FF000000FF000000BD00636163000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF0000008600000086
      000084000000000000000000000000000000000000000000000052518C000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007B000000FF000000
      FF000000FF003130EF00000000000000000000007B000000FF000000FF000000
      FF00BDBEFF0000000000BDBEFF000000FF00BDBEFF0000000000BDBEFF000000
      FF000000FF000000FF0021209C004241420000007B000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0021209C00424142000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000860000008600008400000000000000000000000000000021209C000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF000000BD000000FF000000
      FF000000FF000000FF0021209C0000000000000042000000FF000000FF003938
      FF0000000000BDBEFF000000FF000000FF000000FF00BDBEFF00000000003938
      FF000000FF000000FF002120630000000000000042000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0021206300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000086000000860000008600000000000000000000313031002120DE003130
      AD000000BD000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000007B0000007B0021205A00000000000000000000007B000000FF000000
      FF003938FF000000FF000000FF000000FF000000FF000000FF003938FF000000
      FF000000FF0021209C0021202100000000000000000000007B000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF0021209C0021202100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF00000086000000860000000000000000000000000000000000000000
      000000007B000000FF000000DE000000BD000000FF003130EF003130EF000000
      FF000000000000000000000000000000000000000000000021000000DE000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000DE0000002100000000000000000000000000000021000000DE000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000DE000000210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000860000000000000000000000000000000000000000
      000021205A003130EF0000002100525152000000FF0052515200000000002120
      5A00313031000000000000000000000000000000000000000000000021000000
      7B000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      7B00000021000000000000000000000000000000000000000000000021000000
      7B000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      7B00000021000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000313031000000000000000000000000008486BD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000420000007B000000BD000000BD000000BD0000007B00000042000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000420000007B000000BD000000BD000000BD0000007B00000042000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C3DFFFF0FFFFFFFFC3CFC008FF9FFFFF
      81038004FF0FFFFF80078004FE0FC0038007A0008007C001C00FA00080238001
      C03F900280338001E01F880180390001F00F8FFF803C0001F00F8010803E0001
      E0038010873F8001C00383F7803F8001C301C403857F8003C381780180FFC07F
      C7C7001C81FFE0FFFFE70000FFFFFFFFFF3FF80FF80FFFFFF93FE003E003FFFF
      F807C001C001FEFFC00780018001FC7FC00180008000F87F800108200000F03F
      000304400000F01F800103803FF8F30F800003803FF8F78F000103800000FF87
      C00304400000FFE1C00108210001FFF1800180018001FFF1F00F80038003FFF9
      F027C007C007FFFFF77FF01FF01FFFFF00000000000000000000000000000000
      000000000000}
  end
  object ODSCustImages: TOracleDataSet
    SQL.Strings = (
      'Select '
      '   C.RowID,'
      '   C.* '
      'From'
      '   CustImage C'
      ''
      'Where ID =:ID'
      ' ')
    Optimize = False
    Variables.Data = {0400000001000000060000003A0049004400030000000000000000000000}
    Cursor = crSQLWait
    Master = CustInfoData
    MasterFields = 'ID'
    DetailFields = 'ID'
    Session = sboapiDataModule.SBSession
    Left = 314
    Top = 190
    object ODSCustImagesID: TFloatField
      FieldName = 'ID'
    end
    object ODSCustImagesPHOTO: TBlobField
      FieldName = 'PHOTO'
    end
    object ODSCustImagesCUSTSIGN: TBlobField
      FieldName = 'CUSTSIGN'
    end
    object ODSCustImagesSTAMP: TBlobField
      FieldName = 'STAMP'
    end
  end
  object DSCustImages: TDataSource
    DataSet = ODSCustImages
    Left = 282
    Top = 190
  end
  object sb_custInfo: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'sb_custInfo'
    ParameterMode = pmNamed
    Left = 306
    Top = 67
  end
  object passdeps: TDataSource
    DataSet = odsPassDeps
    Left = 281
    Top = 283
  end
  object odsPassDeps: TOracleDataSet
    SQL.Strings = (
      'select * from passdeps'
      'order by 2')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 313
    Top = 283
  end
end
