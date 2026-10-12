object FrmCollection: TFrmCollection
  Left = 258
  Top = 115
  BorderStyle = bsDialog
  Caption = 'Collection of Deposit є  '
  ClientHeight = 376
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 408
    Height = 53
    Align = alTop
    TabOrder = 0
    object Panel2: TPanel
      Left = 41
      Top = 7
      Width = 134
      Height = 43
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 0
      object StaticText2: TStaticText
        Left = 2
        Top = 2
        Width = 130
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'ƒепозит борж щесабынын є'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 2
        Top = 20
        Width = 130
        Height = 21
        Color = clSilver
        DataField = 'CONTRACTACCNO'
        DataSource = DepositDataModule.DataSrcDeposit
        TabOrder = 1
      end
    end
    object Panel1: TPanel
      Left = 3
      Top = 7
      Width = 38
      Height = 43
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 1
      object StaticText1: TStaticText
        Left = 2
        Top = 2
        Width = 34
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = '$'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit1: TDBEdit
        Left = 2
        Top = 20
        Width = 33
        Height = 21
        Color = clSilver
        DataField = 'CONTRACTCURRENCY'
        DataSource = DepositDataModule.DataSrcDeposit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 175
      Top = 7
      Width = 231
      Height = 43
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 2
      object StaticText3: TStaticText
        Left = 2
        Top = 2
        Width = 227
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'ясас борж щесабынын ады'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 2
        Top = 20
        Width = 226
        Height = 21
        Color = clSilver
        DataField = 'CONTRACTACCNAME'
        DataSource = DepositDataModule.DataSrcDeposit
        TabOrder = 1
      end
    end
  end
  object DBGridCollection: TDBGrid
    Left = 0
    Top = 53
    Width = 408
    Height = 323
    Align = alClient
    DataSource = CollectionDataMod.DataSrcCollection
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Color = clSilver
        Expanded = False
        FieldName = 'HDATE'
        Title.Caption = '     √ойулма “арихи'
        Title.Color = clNavy
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMOUNT'
        Title.Caption = '                  ћ€бл€ь'
        Title.Color = clNavy
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERCENT'
        Title.Caption = '             »ллик фаиз'
        Title.Color = clNavy
        Width = 113
        Visible = True
      end>
  end
end
