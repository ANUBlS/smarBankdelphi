object FrmContractState: TFrmContractState
  Left = 232
  Top = 112
  BorderStyle = bsDialog
  Caption = 'Traffic of Contract. є '
  ClientHeight = 475
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 99
    Width = 467
    Height = 357
    ActivePage = TSheetTranches
    Align = alBottom
    TabOrder = 0
    TabPosition = tpBottom
    object TSheetTranches: TTabSheet
      Caption = '     Tranches       '
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 459
        Height = 329
        Align = alClient
        DataSource = TrafficDataModule.DataSrcTranches
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        TabOrder = 0
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
            ReadOnly = True
            Title.Caption = '¬ерилм€ тарихи'
            Title.Color = clNavy
            Width = 79
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'TOTAL'
            ReadOnly = True
            Title.Caption = 'ћ€бл€ь'
            Title.Color = clNavy
            Width = 180
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'RESERVE'
            ReadOnly = True
            Title.Caption = '≈щтиййата айрылмышдыр'
            Title.Color = clNavy
            Width = 180
            Visible = True
          end>
      end
    end
    object TSheetPayments: TTabSheet
      Caption = '     Payments       '
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 459
        Height = 329
        Align = alClient
        DataSource = TrafficDataModule.DataSrcPayments
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        PopupMenu = PaymentPopupMenu
        TabOrder = 0
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
            Title.Caption = 'ёд€м€ тарихи'
            Title.Color = clNavy
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FACTICALDEBT'
            Title.Caption = 'ясас борждан'
            Title.Color = clNavy
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INTERESTDEBT'
            Title.Caption = '‘аиз боржундан'
            Title.Color = clNavy
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OVERDUEDEBT'
            Title.Caption = 'Ёежик . борждан'
            Title.Color = clNavy
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OVERDUEINTERESTDEBT'
            Title.Caption = '‘аиз боржундан'
            Title.Color = clNavy
            Width = 90
            Visible = True
          end>
      end
    end
    object TSheetProlongations: TTabSheet
      Caption = '    Prolongations    '
      ImageIndex = 2
      object DBGrid3: TDBGrid
        Left = 0
        Top = 0
        Width = 459
        Height = 329
        Align = alClient
        DataSource = TrafficDataModule.DataSrcProlongations
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        TabOrder = 0
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
            Title.Caption = 'ѕролонгасийа тарихи'
            Title.Color = clNavy
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OLDDATE'
            Title.Caption = ' ющн€ тарих'
            Title.Color = clNavy
            Width = 162
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NEWDATE'
            Title.Caption = '…ени тарих'
            Title.Color = clNavy
            Width = 177
            Visible = True
          end>
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 456
    Width = 467
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 467
    Height = 97
    Align = alTop
    TabOrder = 2
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
        Caption = 'ясас борж щесабынын   є'
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
        DataSource = MainDataModule.DataSrcContracts
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
        DataSource = MainDataModule.DataSrcContracts
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
      Width = 289
      Height = 43
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 2
      object StaticText3: TStaticText
        Left = 2
        Top = 2
        Width = 285
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
        Width = 284
        Height = 21
        Color = clSilver
        DataField = 'CONTRACTACCNAME'
        DataSource = MainDataModule.DataSrcContracts
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 4
      Top = 50
      Width = 118
      Height = 43
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 3
      object StaticText4: TStaticText
        Left = 2
        Top = 2
        Width = 114
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'јчылма тарихи'
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
      object DBEdit4: TDBEdit
        Left = 2
        Top = 20
        Width = 114
        Height = 21
        Color = clSilver
        DataField = 'OPENDATE'
        DataSource = MainDataModule.DataSrcContracts
        TabOrder = 1
      end
    end
    object Panel5: TPanel
      Left = 121
      Top = 50
      Width = 118
      Height = 43
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 4
      object StaticText5: TStaticText
        Left = 2
        Top = 2
        Width = 114
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'Ѕаьланма тарихи'
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
      object DBEdit5: TDBEdit
        Left = 2
        Top = 20
        Width = 114
        Height = 21
        Color = clSilver
        DataField = 'CLOSEDATE'
        DataSource = MainDataModule.DataSrcContracts
        TabOrder = 1
      end
    end
    object Panel6: TPanel
      Left = 238
      Top = 50
      Width = 144
      Height = 43
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 5
      object StaticText6: TStaticText
        Left = 2
        Top = 2
        Width = 140
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = '»лкин ћ€бл€ь'
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
      object DBEdit6: TDBEdit
        Left = 2
        Top = 20
        Width = 140
        Height = 21
        Color = clSilver
        DataField = 'AMOUNT'
        DataSource = MainDataModule.DataSrcContracts
        TabOrder = 1
      end
    end
    object Panel7: TPanel
      Left = 381
      Top = 50
      Width = 82
      Height = 43
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 6
      object StaticText7: TStaticText
        Left = 2
        Top = 2
        Width = 78
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = '»ллик %'
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
      object DBEdit7: TDBEdit
        Left = 2
        Top = 20
        Width = 77
        Height = 21
        Color = clSilver
        DataField = 'INTEREST'
        DataSource = MainDataModule.DataSrcInterests
        TabOrder = 1
      end
    end
  end
  object PaymentPopupMenu: TPopupMenu
    Left = 188
    Top = 209
    object miPrintPaymentOrder: TMenuItem
      Caption = '&Print Payment Order'
      ShortCut = 16464
      OnClick = miPrintPaymentOrderClick
    end
  end
end
