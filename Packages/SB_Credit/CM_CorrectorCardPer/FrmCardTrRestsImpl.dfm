object FrmCardTrRests: TFrmCardTrRests
  Left = 232
  Top = 210
  BorderIcons = [biSystemMenu]
  ClientHeight = 249
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 208
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 25
      Width = 416
      Height = 181
      Align = alClient
      DataSource = DMCorrectorCardPer.RestsDatSrc
      FooterColor = clWindow
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'HDATE'
          Footers = <>
          Title.Caption = 'Tarix'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 72
        end
        item
          EditButtons = <>
          FieldName = 'REST'
          Footers = <>
          Title.Caption = 'Qal'#305'q'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 72
        end
        item
          EditButtons = <>
          FieldName = 'INTREST'
          Footers = <>
          Title.Caption = ' % qal'#305'q'#305
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 71
        end
        item
          EditButtons = <>
          FieldName = 'PARTKEY'
          Footers = <>
          Title.Caption = 'Part'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 39
        end
        item
          EditButtons = <>
          FieldName = 'cardsort'
          Footers = <>
          Title.Caption = 'Kart'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 126
        end>
    end
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 2
      Width = 416
      Height = 23
      DataSource = DMCorrectorCardPer.RestsDatSrc
      Align = alTop
      Flat = True
      TabOrder = 1
    end
  end
  object BitBtn1: TBitBtn
    Left = 333
    Top = 215
    Width = 81
    Height = 27
    Caption = 'Ba'#287'la'
    DoubleBuffered = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = bkClose
    NumGlyphs = 2
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
