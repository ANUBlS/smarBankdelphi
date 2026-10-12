object FrmFilial: TFrmFilial
  Left = 318
  Top = 190
  ClientHeight = 350
  ClientWidth = 718
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 718
    Height = 350
    Align = alClient
    Caption = 'GroupBox1'
    TabOrder = 0
    ExplicitWidth = 773
    ExplicitHeight = 369
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 16
      Width = 769
      Height = 320
      Align = alClient
      DataSource = WRSetupDataMod.FilialSrc
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Color = clSilver
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          ReadOnly = True
          Title.Caption = #212#232#235#232#224#235#251#237' '#224#228#251
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 74
        end
        item
          EditButtons = <>
          FieldName = 'C_NAME'
          Footers = <>
          Title.Caption = #212#232#235#232#224#235#251#237' '#247#224#239' '#224#228#251
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 114
        end
        item
          EditButtons = <>
          FieldName = 'DRNAME'
          Footers = <>
          Title.Caption = #196#232#287#229#234#242#238#287#243#237' '#224#228#251
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 110
        end
        item
          EditButtons = <>
          FieldName = 'DRFULLNAME'
          Footers = <>
          Title.Caption = #196#232#287#229#234#242#238#287#243#237'  '#227#241#224' '#224#228#251
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 111
        end
        item
          EditButtons = <>
          FieldName = 'NNAME'
          Footers = <>
          Title.Caption = #205#255#231#224#287#255#242#247#232#237#232#237' '#224#228#251
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 104
        end
        item
          EditButtons = <>
          FieldName = 'NFULLNAME'
          Footers = <>
          Title.Caption = #205#255#231#224#287#255#242#247#232#237#232#237' '#227#251#241#224' '#224#228#251
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 118
        end
        item
          EditButtons = <>
          FieldName = 'COUNTRY'
          Footers = <>
          Title.Caption = #216#255#249#255#287
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 125
        end>
    end
    object Panel1: TPanel
      Left = 2
      Top = 336
      Width = 769
      Height = 31
      Align = alBottom
      TabOrder = 1
      object BitBtn1: TBitBtn
        Left = 543
        Top = 4
        Width = 81
        Height = 27
        Caption = #195#255#225#243#235
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 626
        Top = 4
        Width = 80
        Height = 27
        Caption = #193#224#252#235#224
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = BitBtn2Click
      end
    end
  end
end
