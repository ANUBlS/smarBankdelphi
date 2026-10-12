object ResultForm: TResultForm
  Left = 240
  Top = 226
  AutoScroll = False
  BorderIcons = []
  Caption = 'Íÿòècÿëÿð'
  ClientHeight = 289
  ClientWidth = 227
  Color = clBtnFace
  UseDockManager = True
  ParentFont = True
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 227
    Height = 289
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 67
      Top = 249
      Width = 92
      Height = 30
      Caption = 'Áàüëà'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        000098FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF0000FEFFFFFFFFFFFFFFFFFF3232CB0000FE000098FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3232CB
        3298FE0000FE000098FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3232CB0065FE0000CBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF0000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF0000CB0000FE000098FFFFFFFFFFFFFFFFFFFFFFFF0000FE000098FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CB0000FE000098FF
        FFFFFFFFFF0000FE000098FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF0000CB0000FE0000980000FE000098FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CB00
        00FE000098FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF0000CB0000FE0000980000CB000098FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000CB0000FE000098FF
        FFFFFFFFFF0000CB000098FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000CB0000FE0000FE000098FFFFFFFFFFFFFFFFFFFFFFFF0000CB000098FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF0000CB3298FE0000FE000098FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF0000CB000098FFFFFFFFFFFFFFFFFFFFFFFF656598
        0000CB656598FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF0000CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = SpeedButton1Click
    end
    object Panel2: TPanel
      Left = 2
      Top = 190
      Width = 222
      Height = 47
      BevelInner = bvLowered
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 2
        Top = 2
        Width = 218
        Height = 43
        Align = alClient
        Caption = 'Þhtÿëèê'
        TabOrder = 0
        object EditObligation: TEdit
          Left = 0
          Top = 14
          Width = 215
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = 'Edit1'
        end
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 143
      Width = 223
      Height = 47
      BevelInner = bvLowered
      TabOrder = 1
      object GroupBox2: TGroupBox
        Left = 2
        Top = 2
        Width = 219
        Height = 43
        Align = alClient
        Caption = 'Gecikmiø  faiz qalûq'
        TabOrder = 0
        object EditDueInRest: TEdit
          Left = 0
          Top = 14
          Width = 216
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = 'Edit1'
        end
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 96
      Width = 223
      Height = 47
      BevelInner = bvLowered
      TabOrder = 2
      object GroupBox3: TGroupBox
        Left = 2
        Top = 2
        Width = 219
        Height = 43
        Align = alClient
        Caption = 'Gecikmiø qalûq'
        TabOrder = 0
        object EditDueRests: TEdit
          Left = 0
          Top = 14
          Width = 217
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = 'Edit1'
        end
      end
    end
    object Panel5: TPanel
      Left = 2
      Top = 49
      Width = 223
      Height = 47
      BevelInner = bvLowered
      TabOrder = 3
      object GroupBox4: TGroupBox
        Left = 2
        Top = 2
        Width = 219
        Height = 43
        Align = alClient
        Caption = 'Faiz qalûq'
        TabOrder = 0
        object EditInterest: TEdit
          Left = 0
          Top = 14
          Width = 215
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = 'Edit1'
        end
      end
    end
    object Panel6: TPanel
      Left = 2
      Top = 2
      Width = 222
      Height = 47
      BevelInner = bvLowered
      TabOrder = 4
      object GroupBox5: TGroupBox
        Left = 2
        Top = 2
        Width = 218
        Height = 43
        Align = alClient
        Caption = 'Qalûq'
        TabOrder = 0
        object Editrests: TEdit
          Left = 0
          Top = 14
          Width = 215
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = 'Editrests'
        end
      end
    end
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = 'Íÿòècÿëÿð'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    Left = 8
    Top = 248
  end
end
