object MainFacilities: TMainFacilities
  Left = 16
  Top = 56
  Width = 977
  Height = 565
  Caption = 'Assets'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  OnDestroy = ActiveFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 969
    Height = 538
    Align = alClient
    TabOrder = 0
    object Splitter: TSplitter
      Left = 1
      Top = 193
      Width = 967
      Height = 2
      Cursor = crVSplit
      Align = alTop
      Color = clBtnText
      ParentColor = False
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 967
      Height = 43
      Align = alTop
      TabOrder = 0
      object ToolBar1: TToolBar
        Left = 1
        Top = 1
        Width = 965
        Height = 40
        ButtonHeight = 36
        ButtonWidth = 68
        Caption = 'ToolBar1'
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Flat = True
        Images = ImageList
        ShowCaptions = True
        TabOrder = 0
        object ToolButtonAdd: TToolButton
          Left = 0
          Top = 0
          Action = ActionAdd
        end
        object ToolButton9: TToolButton
          Left = 68
          Top = 0
          Width = 8
          Caption = 'ToolButton9'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object ToolButtonEdit: TToolButton
          Left = 76
          Top = 0
          Action = ActionUpdate
        end
        object ToolButton4: TToolButton
          Left = 144
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object ToolButtonTakeOff: TToolButton
          Left = 152
          Top = 0
          Action = ActionTakeOff
        end
        object ToolButton2: TToolButton
          Left = 220
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 6
          Style = tbsSeparator
        end
        object ToolButton17: TToolButton
          Left = 228
          Top = 0
          Action = ActionPrint
        end
        object ToolButton15: TToolButton
          Left = 296
          Top = 0
          Width = 8
          Caption = 'ToolButton15'
          ImageIndex = 6
          Style = tbsSeparator
        end
        object ToolButton16: TToolButton
          Left = 304
          Top = 0
          Caption = '¬ерэи ?!'
          ImageIndex = 8
          OnClick = ToolButton16Click
        end
        object ToolButton18: TToolButton
          Left = 372
          Top = 0
          Width = 8
          Caption = 'ToolButton18'
          ImageIndex = 16
          Style = tbsSeparator
        end
        object ToolButton19: TToolButton
          Left = 380
          Top = 0
          Action = ActionCalculatePercents
          Caption = 'ўесабла'
        end
        object ToolButton20: TToolButton
          Left = 448
          Top = 0
          Width = 8
          Caption = 'ToolButton20'
          ImageIndex = 17
          Style = tbsSeparator
        end
        object ToolButtonTraffic: TToolButton
          Left = 456
          Top = 0
          Action = ActionTraffic
          Caption = 'ƒюврийй€'
        end
        object ToolButton22: TToolButton
          Left = 524
          Top = 0
          Width = 8
          Caption = 'ToolButton22'
          ImageIndex = 16
          Style = tbsSeparator
        end
        object ToolButton23: TToolButton
          Left = 532
          Top = 0
          Action = ActionSearch
          Caption = 'јхтарыш'
          ImageIndex = 16
        end
        object ToolButton24: TToolButton
          Left = 600
          Top = 0
          Width = 8
          Caption = 'ToolButton24'
          ImageIndex = 17
          Style = tbsSeparator
        end
        object ToolButton25: TToolButton
          Left = 608
          Top = 0
          Caption = '—азлама'
          ImageIndex = 31
          OnClick = ToolButton25Click
        end
        object ToolButton6: TToolButton
          Left = 676
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object ToolButton7: TToolButton
          Left = 684
          Top = 0
          Caption = 'ям€лиййатлар'
          ImageIndex = 21
          OnClick = ToolButton7Click
        end
        object ToolButton8: TToolButton
          Left = 752
          Top = 0
          Width = 8
          Caption = 'ToolButton8'
          ImageIndex = 22
          Style = tbsSeparator
        end
      end
    end
    object PanelWares: TPanel
      Left = 1
      Top = 195
      Width = 967
      Height = 298
      Align = alClient
      TabOrder = 2
      object WaresViewer: TDBGrid
        Left = 1
        Top = 1
        Width = 965
        Height = 252
        Align = alClient
        DataSource = MainFDataModule.DViewWares
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        PopupMenu = PopupMenuWares
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = WaresViewerDrawColumnCell
        OnDblClick = ActionUpdateExecute
        OnEnter = WaresViewerEnter
        OnExit = WaresViewerExit
        OnKeyDown = WaresViewerKeyDown
        OnTitleClick = WaresViewerTitleClick
        Columns = <
          item
            Alignment = taRightJustify
            Color = clSilver
            Expanded = False
            FieldName = 'RecordNo'
            Title.Alignment = taRightJustify
            Title.Caption = 'є'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'NAME'
            Title.Caption = 'ясас в€саит'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 208
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Color = clBtnFace
            Expanded = False
            FieldName = 'CLOSE_FORMAT'
            Title.Caption = '  '
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 19
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'INVENTAR_DATE'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Caption = '»нв. тарихи'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 70
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'FIRST_PRICE'
            Title.Alignment = taRightJustify
            Title.Caption = '»лкин д€й€р'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 110
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'BALANCE_PRICE'
            Title.Alignment = taRightJustify
            Title.Caption = 'Ѕаланс д€й€ри'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 110
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'ALLAMORT'
            Title.Alignment = taRightJustify
            Title.Caption = '…ыэылмыш амортизасийа'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 110
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'REMAINDER'
            Title.Alignment = taRightJustify
            Title.Caption = ' ющн€лм€ м€бл€ьи'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 110
            Visible = True
          end
          item
            Alignment = taCenter
            Color = clSilver
            Expanded = False
            FieldName = 'AMORT'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = '%'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'AMORT_DATE'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Caption = 'јмортизасийа тарихи'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 89
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'FXM'
            Title.Caption = '‘айдалы хид.мцд'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 78
            Visible = True
          end>
      end
      object PanelSearch: TPanel
        Left = 1
        Top = 253
        Width = 965
        Height = 44
        Align = alBottom
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        TabOrder = 1
        Visible = False
        object Panel6: TPanel
          Left = 1
          Top = 1
          Width = 170
          Height = 42
          Align = alLeft
          TabOrder = 0
          object EFirst_Price: TEdit
            Left = 2
            Top = 19
            Width = 167
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnChange = EFirst_PriceChange
            OnExit = EFirst_PriceExit
            OnKeyPress = EFirst_PriceKeyPress
          end
          object StaticText1: TStaticText
            Left = 1
            Top = 1
            Width = 168
            Height = 17
            Align = alTop
            Caption = ' »лкин д€й€ри'
            Color = clSilver
            ParentColor = False
            TabOrder = 1
          end
        end
        object Panel7: TPanel
          Left = 171
          Top = 1
          Width = 170
          Height = 42
          Align = alLeft
          TabOrder = 1
          object StaticText2: TStaticText
            Left = 1
            Top = 1
            Width = 168
            Height = 17
            Align = alTop
            Caption = ' Ѕаланс д€й€ри'
            Color = clSilver
            ParentColor = False
            TabOrder = 0
          end
          object EBalance_Price: TEdit
            Left = 2
            Top = 19
            Width = 167
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            OnChange = EFirst_PriceChange
            OnExit = EFirst_PriceExit
            OnKeyPress = EFirst_PriceKeyPress
          end
        end
        object Panel8: TPanel
          Left = 341
          Top = 1
          Width = 170
          Height = 42
          Align = alLeft
          TabOrder = 2
          object StaticText3: TStaticText
            Left = 1
            Top = 1
            Width = 168
            Height = 17
            Align = alTop
            Caption = ' …ыэылмыш амортизасийа'
            Color = clSilver
            ParentColor = False
            TabOrder = 0
          end
          object EAllAmort: TEdit
            Left = 2
            Top = 19
            Width = 167
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            OnChange = EFirst_PriceChange
            OnExit = EFirst_PriceExit
            OnKeyPress = EFirst_PriceKeyPress
          end
        end
        object Panel5: TPanel
          Left = 511
          Top = 1
          Width = 170
          Height = 42
          Align = alLeft
          TabOrder = 3
          object Edit1: TEdit
            Left = 2
            Top = 19
            Width = 167
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnChange = EFirst_PriceChange
            OnExit = EFirst_PriceExit
            OnKeyPress = EFirst_PriceKeyPress
          end
          object StaticText11: TStaticText
            Left = 1
            Top = 1
            Width = 168
            Height = 17
            Align = alTop
            Caption = '  ющн€лм€ м€бл€ьи'
            Color = clSilver
            ParentColor = False
            TabOrder = 1
          end
        end
      end
    end
    object PanelGoups: TPanel
      Left = 1
      Top = 44
      Width = 967
      Height = 149
      Align = alTop
      TabOrder = 1
      object GroupsViewer: TDBGrid
        Left = 1
        Top = 1
        Width = 965
        Height = 147
        Align = alClient
        DataSource = MainFDataModule.DViewGroup
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = PopupMenuGroups
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        OnDblClick = GroupsViewerDblClick
        OnEnter = GroupsViewerEnter
        Columns = <
          item
            Alignment = taRightJustify
            Color = clSilver
            Expanded = False
            FieldName = 'RecordNo'
            Title.Alignment = taRightJustify
            Title.Caption = 'є'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'NAME'
            Title.Caption = 'ясас в€саит групу'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 280
            Visible = True
          end
          item
            Alignment = taCenter
            Color = clSilver
            Expanded = False
            FieldName = 'AMORT'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = '%'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MAINACCNO'
            Title.Caption = 'ясас в€саит щесабы'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBTACCNO'
            Title.Caption = 'ƒебет щесаб'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITACCNO'
            Title.Caption = ' редит щесаб'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALEACCNO'
            Title.Caption = 'јлгы-—атгы / «€р€р'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Visible = True
          end>
      end
    end
    object TotalResultPanel: TPanel
      Left = 1
      Top = 493
      Width = 967
      Height = 44
      Align = alBottom
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 3
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 170
        Height = 42
        Align = alLeft
        TabOrder = 0
        object StaticText5: TStaticText
          Left = 1
          Top = 1
          Width = 168
          Height = 17
          Align = alTop
          Alignment = taRightJustify
          Caption = '»лкин д€й€рл€р'
          Color = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 2
          Top = 19
          Width = 167
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FPRICE'
          DataSource = MainFDataModule.DSSumWares
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object Panel12: TPanel
        Left = 171
        Top = 1
        Width = 170
        Height = 42
        Align = alLeft
        TabOrder = 1
        object StaticText6: TStaticText
          Left = 1
          Top = 1
          Width = 168
          Height = 17
          Align = alTop
          Alignment = taRightJustify
          Caption = 'Ѕаланс д€й€рл€р'
          Color = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit4: TDBEdit
          Left = 2
          Top = 19
          Width = 167
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'BPRICE'
          DataSource = MainFDataModule.DSSumWares
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object Panel13: TPanel
        Left = 341
        Top = 1
        Width = 170
        Height = 42
        Align = alLeft
        TabOrder = 2
        object StaticText7: TStaticText
          Left = 1
          Top = 1
          Width = 168
          Height = 17
          Align = alTop
          Alignment = taRightJustify
          Caption = '…ыьылмыш амортизасийа'
          Color = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 2
          Top = 19
          Width = 167
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'ALLAMORT'
          DataSource = MainFDataModule.DSSumWares
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object Panel14: TPanel
        Left = 851
        Top = 1
        Width = 170
        Height = 42
        Align = alLeft
        TabOrder = 3
        object StaticText8: TStaticText
          Left = 1
          Top = 1
          Width = 168
          Height = 17
          Align = alTop
          Alignment = taRightJustify
          Caption = 'ясаслы т€мир х€ржл€ри  '
          Color = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit6: TDBEdit
          Left = 2
          Top = 19
          Width = 167
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'REPAIR_SUMMA'
          DataSource = MainFDataModule.DSSumRepair
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object Panel3: TPanel
        Left = 511
        Top = 1
        Width = 170
        Height = 42
        Align = alLeft
        TabOrder = 4
        object StaticText9: TStaticText
          Left = 1
          Top = 1
          Width = 168
          Height = 17
          Align = alTop
          Alignment = taRightJustify
          Caption = ' ющн€лм€ мигдары'
          Color = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit7: TDBEdit
          Left = 2
          Top = 19
          Width = 167
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'REMAINDER'
          DataSource = MainFDataModule.DSSumWares
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object Panel10: TPanel
        Left = 681
        Top = 1
        Width = 170
        Height = 42
        Align = alLeft
        TabOrder = 5
        object StaticText10: TStaticText
          Left = 1
          Top = 1
          Width = 168
          Height = 17
          Align = alTop
          Alignment = taRightJustify
          Caption = 'ћодернл€шдирм€ х€ржл€ри'
          Color = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit8: TDBEdit
          Left = 2
          Top = 19
          Width = 167
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'MODERN_SUMMA'
          DataSource = MainFDataModule.DSSumModWares
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
  object ImageList: TImageList
    Left = 496
    Top = 109
    Bitmap = {
      494C010120002200040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000009000000001002000000000000090
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080808000808080000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000808080008080
      8000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD000000BD000000BD000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00C0C0C000C0C0C0008080
      8000808080000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD000000BD000000BD000000BD000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0C000C0C0
      C000808080008080800000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD000000BD000000BD000000FFFFFF00BD000000BD00
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C0C0
      C000C0C0C0008080800080808000000000008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00BD000000BD000000BD000000FFFFFF000000000000000000BD00
      0000BD000000FFFFFF0000000000000000000000000000000000000000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C0C0C000C0C0C00080808000808080000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000FFFFFF008484
      84008484840084848400BD000000FFFFFF00FFFFFF0000000000000000000000
      0000BD000000FFFFFF0000000000000000000000000000000000000000008080
      8000FFFFFF00C0C0C00080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00C0C0C000C0C0C000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000BD000000FFFFFF00000000000000000000000000808080008080
      800080808000C0C0C00080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0008080800080808000808080000000000000000000FFFFFF008484
      840084848400848484008484840084848400FFFFFF0000000000000000000000
      00000000000000000000BD000000FFFFFF000000000000000000000000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      800080808000C0C0C00080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00808080008080800000000000000000000000
      0000FFFFFF00C0C0C00080808000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000BD0000000000000000000000000000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000FFFFFF00C0C0C00080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C0C0C000808080000000000080808000000000000000
      000000000000C0C0C00080808000000000000000000000000000FFFFFF008484
      840084848400000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C0C0C000808080000000000080808000000000000000
      000000000000C0C0C00080808000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C0C0C000808080000000000080808000000000000000
      000000000000C0C0C00080808000000000000000000000000000FFFFFF008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C0C0C000808080008080800080808000808080008080
      80000000000000000000C0C0C000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00808080008080800080808000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF008080800080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080808000000000000000
      0000008080000080800000808000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000000000000000000080808000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080808000000000000000
      0000FFFFFF00FFFFFF0000808000C0C0C000C0C0C000FFFFFF00FFFFFF000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080808000000000000000
      0000008080000080800000808000C0C0C000C0C0C00000808000008080000000
      0000000000000000000080808000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080808000808080008080
      800080808000FFFFFF0080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080808000808080008080
      800080808000FFFFFF0080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000FF000000FFFFFF00FFFFFF00808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000000000FFFF0000FF
      FF00008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00080808000FFFFFF00FFFFFF00FFFFFF00C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000000000FFFF0000FF
      FF00008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C0008080800080808000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000C0C0C0008080800080808000C0C0C000C0C0C000C0C0C000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00808080000000000000000000C0C0C0008080
      800000000000000000000000000000000000FFFFFF000000000000FFFF0000FF
      FF00008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C0008080800080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C00080808000FFFFFF000000000000FFFF0000FF
      FF000080800000000000FFFFFF0000000000FFFFFF000000000000FFFF0000FF
      FF00008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C0008080800080808000C0C0C000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF0000000000C0C0C00080808000FFFFFF000000000000FFFF0000FF
      FF000080800000000000FFFFFF0000000000FFFFFF000000000000FFFF0000FF
      FF00008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000000000000000
      0000808080008080800080808000000080008080800080808000808080008080
      80008080800000000000C0C0C0008080800080808000C0C0C00000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000800080808000FFFFFF00FFFFFF00FFFF
      FF008080800080808000C0C0C00080808000FFFFFF000000000000FFFF0000FF
      FF000080800000000000FFFFFF0000000000FFFFFF000000000000FFFF0000FF
      FF00008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000000000000000
      00008080800080808000808080000000FF000000800080808000808080008080
      80008080800000000000C0C0C0008080800080808000C0C0C000000000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      80008080800080808000C0C0C00080808000FFFFFF000000000000FFFF0000FF
      FF000080800000000000FFFFFF000000000080808000008080000080800000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800000000000C0C0C0008080800080808000C0C0C000808080008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080008080
      80008080800080808000C0C0C0008080800080808000008080000080800000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000000000008080
      80008080800080808000808080000000FF000000800080808000808080008080
      80008080800000000000C0C0C0008080800080808000C0C0C000808080008080
      80008080800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080008080
      80008080800080808000C0C0C000808080000000000000000000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000000000008080
      80008080800080808000808080000000FF000000800080808000808080008080
      80008080800000000000C0C0C0008080800080808000C0C0C000808080008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      80008080800080808000C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000000000008080
      80008080800080808000808080000000FF000000800080808000808080008080
      80008080800000000000C0C0C0008080800080808000C0C0C000808080008080
      8000FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008080800080808000C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000000000008080
      80008080800080808000808080000000FF000000800080808000808080008080
      80008080800000000000C0C0C0008080800080808000C0C0C00080808000FFFF
      FF00FFFFFF00FFFFFF00808080000000FF0000008000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080808000C0C0C000808080000000000000000000000000000000
      0000000000000000000080808000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000000000008080
      8000808080008080800080808000000080000000800080808000808080008080
      80008080800000000000C0C0C0008080800080808000C0C0C000FFFFFF00FFFF
      FF00FFFFFF008080800080808000000080000000800080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000808080000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C00080808000C0C0C000FFFFFF00FFFFFF00FFFF
      FF0080808000808080008080800080808000000000008080800080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00080808000FFFFFF00FFFFFF00FFFFFF00C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C0008080800080808000FFFFFF00FFFFFF00C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800080008000
      800000000000000000000000000000000000000000000000000080808000C0C0
      C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF00C0C0
      C00000FFFF00C0C0C00000FFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000800085858500FFFFFF00C5C5
      C500800080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C00000FF
      FF00FFFFFF0000FFFF00C0C0C000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008000800085858500FFFFFF00FFFFFF0085858500C5C5
      C500C5C5C50080008000000000000000000080808000C0C0C00000FFFF00C0C0
      C00000FFFF00C0C0C00000FFFF00C0C0C00000FFFF008080800000000000C0C0
      C00000FFFF00FFFFFF0000FFFF00000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080008000C5C5C500FFFFFF00FFFFFF008585850000000000800080000000
      0000C5C5C500C5C5C50080008000000000008080800000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0080808000C0C0C0000000
      0000C0C0C00000FFFF00C0C0C000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000808080000000
      0000FFFFFF0080808000FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00B4FF
      FF0080008000C5C5C500858585006CCEFF008000800080008000800080008000
      800000000000C5C5C500C5C5C5008000800080808000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF008080800000FFFF00C0C0
      C00000000000C0C0C00000FFFF00000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000808080000000
      0000FFFFFF0080808000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000B4FFFF00C0C0C0009F9F9F006C6C
      6C00800080005252520080008000800080008000800000FFFF00800080008000
      80008000800000000000C5C5C500000000008080800000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0080808000808080008080
      80008080800000000000C0C0C000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000808080000000
      0000FFFFFF0080808000FFFFFF00FFFFFF00000000008080800000000000FFFF
      FF000000000000000000000000000000000092929200FFFFFF00FFFFFF00B4FF
      FF0090DAFF00800080008000800080008000800080008000800000FFFF000080
      80008000800080008000000000000000000080808000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000FFFF00000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000808080000000
      0000FFFFFF0080808000FFFFFF00FFFFFF008080800000000000FFFFFF00FFFF
      FF0000000000000000000000000000000000B4FFFF00C0C0C0009F9F9F006C6C
      6C006C6C6C005252520080008000800080008000800080008000800080008000
      800000FFFF000080800080008000000000008080800000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00C0C0C00000000000C0C0C000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000808080000000
      0000FFFFFF0080808000FFFFFF00FFFFFF000000000080808000FFFFFF00FFFF
      FF000000000000000000000000000000000092929200FFFFFF00FFFFFF00B4FF
      FF0090DAFF0090DAFF0090DAFF0080008000800080008000800000FFFF0000FF
      FF0000FFFF0080008000800080000000000080808000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000FFFF00000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000808080000000
      0000FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF0080808000FFFFFF00FFFF
      FF0000000000000000000000000000000000B4FFFF00B4E6FF00B4FFFF00B4FF
      FF00B4FFFF006CCEFF00B8B8B800ABABAB008000800080008000800080008000
      8000800080000000000000000000000000008080800000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00C0C0C00000000000C0C0C000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000080808000FFFF
      FF0080808000000000008080800000000000FFFFFF0080808000FFFFFF00FFFF
      FF000000000000000000000000000000000090DAFF00B8B8B800B8B8B8006CCE
      FF00C5C5C5008080800090DAFF0090DAFF0090DAFF00800080008000800090DA
      FF000000000000000000000000000000000080808000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000FFFF00000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000808080000000
      000000000000000000008080800000000000FFFFFF0080808000FFFFFF00FFFF
      FF0000000000000000000000000000000000B4E6FF006CCEFF006CCEFF006CCE
      FF006CCEFF00B8B8B80090DAFF00B4FFFF00B4E6FF0090DAFF0090DAFF000000
      0000000000000000000000000000000000008080800000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00C0C0C00000000000C0C0C000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C00000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      000000000000000000008080800000000000FFFFFF0080808000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000090DAFF0090DAFF006CCE
      FF006CCEFF0090DAFF0090DAFF00B4E6FF00F0FBFF00FFFFFF00000000000000
      00000000000000000000000000000000000080808000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000080808000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008080800000000000FFFFFF00FFFFFF00808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00C0C0C0000000000000000000000000000000000080808000FFFFFF008080
      8000808080008080800000000000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000FFFFFF008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000080808000808080008080
      8000000000008080800080808000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00000FFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      8000000000000000000000000000000000000080800000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000BF000000BF000000BF0000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000808000000000000080
      80000080800000FFFF00008080000000000000000000C0C0C00000FFFF000080
      80000000000000000000000000000000000000000000FFFFFF00BF000000BF00
      0000BF00000000000000BF000000BF000000BF000000BF000000BF0000000000
      000000000000FFFFFF00000000000000000000000000FFFFFF0000BF000000BF
      000000BF000000BF000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF00BF000000BF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000008080000080
      80000080800000FFFF0000FFFF0000FFFF00000000000080800000FFFF000080
      8000C0C0C00000000000000000000000000000000000BF000000BF000000BF00
      0000BF000000BF000000C0C0C000FFFFFF00FFFFFF00C0C0C000BF000000BF00
      0000000000000000000000000000000000000000000000BF000000BF000000BF
      000000BF000000BF000000BF000000BF000000BF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000FFFFFF00FFFFFF00FFFFFF00BF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000008080000080
      80000080800000FFFF0000808000000000000000000000000000C0C0C00000FF
      FF0000FFFF00C0C0C0000000000000000000FFFFFF00BF000000BF000000BF00
      0000BF000000FF000000BF000000FFFFFF00FFFFFF00BF000000BF0000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000BF000000BF000000BF
      000000BF000000BF000000BF0000FFFFFF000000000000BF0000000000000000
      00000000000000000000FFFFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF008080800000000000C0C0C000C0C0
      C000C0C0C00000000000C0C0C000C0C0C0000000000000000000008080000080
      80000080800000FFFF000000000000008000000000000080800000FFFF000080
      800000808000000000000000000000000000BF000000BF000000BF000000BF00
      0000FF000000BF000000BF000000FFFFFF00FFFFFF00FF000000BF000000BF00
      00000000000000000000000000000000000000BF000000BF000000BF000000BF
      000000BF000000BF000000BF0000FFFFFF000000000000BF000000BF00000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF0000FFFF00BF000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000008080000080
      80000080800000FFFF00000000000000000000FFFF0000000000C0C0C0000080
      800000FFFF00C0C0C0000000000000000000BF000000BF000000BF000000BF00
      0000FF000000BF000000BF000000FFFFFF00FFFFFF00BF000000FF000000BF00
      00000000000000000000000000000000000000BF000000BF000000BF000000BF
      000000BF000000BF000000BF0000FFFFFF00FFFFFF000000000000BF000000BF
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0080808000FFFFFF00FFFFFF00BF000000FFFFFF00FFFFFF00FF00
      0000808080000000000000000000000000000000000000000000008080000000
      000000FFFF0000FFFF0000FFFF000080800000FFFF0000000000C0C0C0000080
      8000C0C0C000000000000000000000000000BF000000BF000000BF000000BF00
      0000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00BF000000BF000000BF00
      0000BF00000000000000000000000000000000BF000000BF000000BF000000BF
      000000FF000000BF000000BF000000BF0000FFFFFF00FFFFFF000000000000BF
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF0080808000FFFFFF00FFFFFF00BF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FF000000000000000000000000000000000000000080800000000000C0C0
      C00000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000808000000000000000
      000000000000000000000000000000000000BF000000BF000000BF000000FF00
      0000FF000000FF000000FF000000FF000000BF000000BF000000BF000000BF00
      00000000000000000000000000000000000000BF000000BF000000BF000000FF
      000000FF000000BF000000BF000000BF0000FFFFFF00FFFFFF000000000000BF
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0080808000FFFFFF00FFFFFF00BF000000FFFFFF00BF000000FFFFFF00FFFF
      FF00BF000000FF0000000000000000000000000000000000000000000000C0C0
      C0000080800000808000008080000000000000FFFF0000000000000000000000
      000000000000000000000000000000000000FFFFFF00BF000000BF000000BF00
      0000BF000000FF000000FF000000FFFFFF00FF000000BF000000FF000000BF00
      00000000000000000000FFFFFF0000000000FFFFFF0000BF000000BF000000FF
      0000FFFFFF00FFFFFF000000000000BF000000BF0000FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF000000000080808000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00BF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF00FF00000000000000000000000000000000000000C0C0
      C000000000000080800000000000C0C0C0000000000000000000000000000000
      00000000000000000000000000000000000000000000BF000000BF000000BF00
      0000BF000000BF000000C0C0C000FFFFFF00FFFFFF00BF000000BF000000BF00
      0000BF0000000000000000000000000000000000000000BF000000BF000000FF
      FF0000BF0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000000000BF
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00BF000000FFFFFF00000000000000
      00000000000000000000FFFFFF00BF0000000000000000000000000000000000
      0000000000000000000000000000C0C0C0000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00BF000000BF00
      0000BF000000FF000000FF000000C0C0C000BF000000BF000000BF0000000000
      000000000000FFFFFF00000000000000000000000000FFFFFF0000BF000000FF
      000000FF0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000BF000000BF
      000000000000FFFFFF0000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000080808000C0C0
      C000808080000000000000000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00BF00
      0000BF000000BF000000BF000000BF000000BF000000BF000000BF0000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF0000BF
      000000BF000000FF000000BF000000BF000000BF000000BF000000BF000000BF
      0000FFFFFF000000000000000000000000000000000000000000000000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080000000000080808000808080000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00BF000000BF000000BF000000BF000000BF0000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF0000BF000000BF000000BF000000BF000000BF000000BF000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000080808000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000080800000808000008080000080
      800000000000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C0008080
      8000808080000000000000000000000000000000000000000000000000008080
      800080808000C0C0C00000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080808000000000000000000000000000000000000000
      0000C0C0C0000000000000000000C0C0C0000000000000000000008080000080
      8000008080000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C00000000000000000000000000000000000FFFFFF00FFFFFF008080
      8000FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF0080808000FFFFFF00FFFF
      FF000000000080808000C0C0C000000000000000000000000000000000000080
      8000008080000080800000808000C0C0C0000080800000808000008080000080
      8000000000000080800000808000C0C0C0000000000080808000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      000000FFFF0000FFFF00000000000000000000000000C0C0C000C0C0C0008080
      8000808080000000000000000000000000000000000000000000000000008080
      800080808000C0C0C000000000000000000000000000FFFFFF00FFFFFF008080
      8000FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF0080808000FFFFFF00FFFF
      FF0000000000C0C0C00080808000000000000000000000808000008080000080
      8000008080000000000000000000C0C0C0000000000000000000008080000080
      8000008080000080800000000000000000000000000080808000C0C0C0000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF00000000000000000000000000000000008080800000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C00000000000000000000000000000000000FFFFFF00FFFFFF008080
      8000FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF0080808000FFFFFF00FFFF
      FF000000000080808000C0C0C00000000000008080000080800000FFFF000080
      8000008080000080800000808000000000000080800000808000008080000080
      800000000000008080000080800000000000000000000000000000000000C0C0
      C00000000000000000000000000080808000808080000000000000FFFF0000FF
      FF000000000000000000000000000000000000000000C0C0C000C0C0C0008080
      8000808080000000000000000000000000000000000000000000000000008080
      800080808000C0C0C000000000000000000000000000FFFFFF00FFFFFF008080
      8000FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF0080808000FFFFFF00FFFF
      FF0000000000C0C0C000808080000000000000FFFF0000808000008080000080
      80000080800000000000000000000080800000FFFF0000FFFF00008080000080
      8000008080000080800000000000000000000000000000000000000000008080
      8000FFFFFF00000000008080800000FFFF0000FFFF0000FFFF0000FFFF000000
      000000000000000000000000000000000000000000008080800000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C00000000000000000000000000000000000FFFFFF00FFFFFF008080
      8000FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF0080808000FFFFFF00FFFF
      FF000000000080808000C0C0C00000000000008080000080800000FFFF000080
      800000808000008080000080800000000000C0C0C000C0C0C000FFFFFF0000FF
      FF0000FFFF000080800000808000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C0008080
      8000808080000000000000000000000000000000000000000000000000008080
      800080808000C0C0C000000000000000000000000000FFFFFF00FFFFFF008080
      8000FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF0080808000FFFFFF00FFFF
      FF0000000000C0C0C000808080000000000000FFFF0000808000008080000080
      80000080800000FFFF0000FFFF0000808000C0C0C00000808000C0C0C000C0C0
      C000C0C0C000FFFFFF0000808000000000000000000000000000000000000000
      000000000000FFFFFF0080808000808080000000000000FFFF00000000000000
      000000000000000000000000000000000000000000008080800000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C00000000000000000000000000000000000FFFFFF00FFFFFF008080
      8000FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF0080808000FFFFFF00FFFF
      FF000000000080808000C0C0C00000000000008080000080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000FFFF00000000000000000000000000000000000000
      00000000000080808000FFFFFF008080800000FFFF0000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000000000000000000000000000FFFFFF00FFFFFF008080
      8000FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF0080808000FFFFFF00FFFF
      FF0000000000C0C0C00080808000000000000080800000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00008080000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00C0C0
      C000C0C0C000C0C0C000000000000000000000000000FFFFFF00FFFFFF008080
      8000FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF0080808000FFFFFF00FFFF
      FF000000000080808000C0C0C0000000000000FFFF0000FFFF0000FFFF0000FF
      FF000080800000FFFF0000FFFF00008080000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      800080808000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF008080
      80008080800000000000000000000000000000000000FFFFFF00FFFFFF008080
      8000FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF0080808000FFFFFF00FFFF
      FF0000000000C0C0C0000000000000000000008080000080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBF0000FF000000FFFFFF00FFFF
      FF00FFFFFF00BFBF0000BFBF0000BFBF0000C0C0C000BFBF0000C0C0C000C0C0
      C000BFBF0000000000000000000000000000000000000080800000FFFF0000FF
      FF000080800000FFFF0000FFFF0000FFFF0000FFFF000080800000FFFF0000FF
      FF00008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBF0000BFBF0000BFBF0000BFBF
      0000BFBF0000BFBF0000BFBF0000BFBF0000BFBF0000BFBF0000BFBF0000BFBF
      0000BFBF00000000000000000000000000000000000000000000000000000080
      80000080800000FFFF0000FFFF0000FFFF000080800000808000000000000000
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
      00000000000000000000000000000000000000000000BF000000FFFFFF000000
      00000000000000000000000000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BF000000BF000000BF000000FFFF
      FF000000000000000000000000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080800000FFFF00FFFFFF000000
      000000000000000000000080800000808000000000000000000080808000C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BF000000BF000000BF000000BF000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF0000808000000000000000000080808000C0C0C000C0C0C0008080
      8000000000008080800080808000000000000000000000000000000000000000
      00000000000000000000BF000000BF000000BF000000FFFFFF00BF000000BF00
      0000FFFFFF0000000000000000000000000000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080800000FFFF00FFFFFF000000
      000000000000000000000080800000808000000000008080800080808000C0C0
      C000808080000000000000000000808080000000000000000000FFFFFF00FFFF
      FF00FFFFFF00BF000000BF000000BF000000FFFFFF000000000000000000BF00
      0000BF000000FFFFFF00000000000000000000000000BFBFBF00FFFFFF00BFBF
      BF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBF
      BF00FFFFFF000000FF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF0000FFFF00000000000000000080808000C0C0C000C0C0C0008080
      8000000000008080800080808000000000000000000000000000FFFFFF008080
      80008080800080808000BF000000FFFFFF00FFFFFF0000000000000000000000
      0000BF000000FFFFFF00000000000000000000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000080000000
      0000000000000000000000000000000000000080800000FFFF00FFFFFF00FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF00000000008080800080808000C0C0
      C000808080000000000000000000808080000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000BF000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      80000000000000000000000000000000000000000000008080000080800000FF
      FF0000FFFF00FFFFFF00008080000080800080808000C0C0C000C0C0C0008080
      8000000000008080800080808000000000000000000000000000FFFFFF008080
      800080808000808080008080800080808000FFFFFF0000000000000000000000
      00000000000000000000BF000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000008080000000000000000000000000000000000000000000000000000080
      8000008080000080800080808000C0C0C000C0C0C0008080800080808000C0C0
      C000808080000000000000000000808080000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000BF0000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000000000FF
      FF00000000000080800000000000000000000000000000000000000000000000
      000080808000C0C0C000C0C0C0008080800080808000C0C0C000C0C0C0008080
      8000000000008080800080808000000000000000000000000000FFFFFF008080
      800080808000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000FFFF000000000000808000000000000000000000000000000000000000
      0000C0C0C0008080800080808000C0C0C000C0C0C0008080800080808000FFFF
      FF00FFFFFF000000000000000000808080000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF0000808000008080000000000000000000000000000000
      000080808000C0C0C000C0C0C0008080800080808000FFFFFF00FFFFFF00C0C0
      C000C0C0C000C0C0C000FFFFFF00000000000000000000000000FFFFFF008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00008080000000000000000000000000000000
      0000C0C0C0008080800080808000FFFFFF00C0C0C000FFFFFF0080800000C0C0
      C000FFFFFF008080800080808000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF000000000000000000000000000000
      000080808000FFFFFF00C0C0C000C0C0C000C0C0C00080800000FFFFFF008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000008080800080808000FFFFFF00FFFFFF0080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002020200020202000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002020DF00202020000000000020209F003030AF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF002020DF00808080000000FF004040BF00303030002020
      9F003030AF0000000000000000000000000080808000C0C0C000000000000000
      00000000000000000000000000000000000080808000C0C0C000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006060DF000000
      7F0000007F000000FF000000FF000000FF000000FF000000BF002020DF000000
      FF0000007F000000000000000000000000008080800000FFFF0000000000C0C0
      C0000000000000000000000000000000000080808000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000505050000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007F000000FF000000
      FF0000007F0050505000404040000000000000000000FF000000BF000000C0C0
      C0000000000000000000000000000000000080808000FFFFFF00000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000030303000404040000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007F000000FF000000
      FF000000FF000000FF0040407F00000000000000000080808000BF0000000000
      0000000000000000000000000000000000000000000000FFFF0000BFBF000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000404040000000FF000000FF000000
      FF000000FF000000FF000000FF00007FFF00007FFF000000BF000000FF000000
      FF000000FF000000BF0000000000000000000000000000000000FF000000BF00
      000000000000000000000000000000000000000000008080800000FFFF000000
      0000000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000003F002020DF000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007F000000FF000000
      FF000000FF000000BF0000003F0000000000000000000000000080808000BF00
      000000000000000000000000000000000000000000000000000000FFFF0000BF
      BF00000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000020205F002020DF000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007F000000FF000000
      FF000000FF000000FF000000FF0050508F00000000000000000000000000FF00
      0000BF00000000000000000000000000000000000000000000008080800000FF
      FF00000000000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000020205F000000FF000000FF000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007F000000FF000000
      FF000000FF0020209F0030303000000000000000000000000000000000008080
      8000BF00000000000000000000000000000000000000000000000000000000FF
      FF0000BFBF000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000050508F000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007F000000FF000000
      FF000000FF003030EF0000000000000000000000000000000000000000000000
      000000000000BF00000000000000000000000000000000000000000000008080
      800000FFFF000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000020209F000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF000000BF000000FF000000
      FF000000FF000000FF0020209F00000000000000000000000000000000008080
      800080808000BF00000000000000000000000000000000000000000000000000
      000000FFFF0000BFBF0000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303030002020DF003030
      AF000000BF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000007F0000007F0020205F00000000000000000000000000000000000000
      000000000000FF000000BF000000000000000000000000000000000000000000
      000080808000C0C0C00000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C00000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000007F000000FF000000DF000000BF000000FF003030EF003030EF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00008080800080808000BF000000000000000000000000000000000000000000
      000000000000FF00FF00BF00BF00000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000020205F003030EF0000002000505050000000FF0050505000000000002020
      5F00303030000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000008080800080808000000000000000000080808000FFFFFF008080
      8000808080008080800000000000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000303030000000000000000000000000008080BF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000000000008080800080808000808080008080800000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000900000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFF07FFFF9FFFFFFFFF03FF
      FF0FFFFFFFFF01FFFE0FFFFFFFFF00FF8007FBFFF1FF80078023F1FFF1FFC003
      8033E0FFF1FFE0018039C07FF1FFF000803CF1FFC07FF800803EF1FFE0FFF830
      873FF1FFF1FFF838803FF1FFFBFFF838857FFFFFFFFFF80880FFFFFFFFFFF804
      81FFFFFFFFFFFC03FFFFFFFFFFFFFE030000FFFFFFFFFFFF0000FFFCFFFFFFFF
      0000F3FFFFFFFFFF0000E1F9FFFFFFFF0000E1F3FC7FFC7F0000F0E3FC7FFD7F
      0000F847FC7FFD7F0000FC0FE00FE10F0000FE1FE00FEFEF0000FC0FE00FE10F
      0000F84FFC7FFD7F0000E0E3FC7FFD7F0000C1F1FC7FFC7F0000C7F8FFFFFFFF
      0000FFFFFFFFFFFF0000FFFFFFFFFFFFFF83FFFF00000000FF03FFFF00000000
      FF03FDFF00000000C703F8FF000000000103F0FF000000000103E67F00000000
      0103CE7F000000000101FF3F0000000001C7FFBF00000000C7FFFFDF00000000
      FFEFFFDF00000000FE8FFFEF00000000ED7FFFF700000000F2FFFFFB00000000
      ED7FFFFD00000000FD7FFFFF00000000FFFFC000E003FFFFFFCFC0008003FCFF
      FF0700008003F0FFFC0300008003C0FFF05100008003C0FF800800008003C0CF
      000500008003C00F000300008003C00F000100008003C00F000100008003C00F
      000700008003C40F000F00008003DC0F001F00008007FC0F803F0000800FFC1F
      FFFF0003801FFC7FFFFF0003807FFDFFFFFFFC7FFC7FFBFFFF3FE00FE00FF8FF
      E71FC007C007F03F818F80038003F00F800780038003E003804300010001E000
      800300010001C007804300010001C0078007000100018007803F000100018003
      C07F000100010019C8FF80038003001CDCFF80038003803FC4FFC007C007E03F
      E0FFE00FE00FF87FF7FFFC7FFC7FFE7FFFFFFFFFFFFFFFFFF81FE001FF0FFEFF
      C003C001FF01FC7F8001C001F001DE7380030001C0008C638001000100018647
      800300010001E00F800100010001E01F800300010001F81F800100010001F83F
      800300010001F83F800100010007FBFF800300010007FBFFE00700030007FDBF
      FFFF00078007FFFFFFFF0007E03FFFFFFFFF8001847FE3FFFF9F000000EF80E7
      FF0F000031BF0001FE0F000039FF800080070000993F000080230000CA1F8000
      80330000F40F0000803900009C078000803CE0079603E000803EE007CB01F000
      873FE007FF80F000803FE007F7C0F000857FE00FFFE0F00180FFE01FEFF0F007
      81FFE03FFFF8F81FFFFFE07FFFFCFE7FFFFFFF3FFFFFE003FFFFF93FFFFF8003
      FFFFF8073F3F8003FFFFC0070F0F8003FC7FC0018F1F8003FC7F80018F9F8003
      FC7F0003CF8F8003E00F8001C7CF8003E00F8000E7C78003E00F0001E3E78003
      FC7FC003F3E38003FC7FC001E1F38003FC7F8001F9F18007FFFFF00FF0F9800F
      FFFFF027F9F9801FFFFFF77FFFFF807F00000000000000000000000000000000
      000000000000}
  end
  object PopupMenuWares: TPopupMenu
    Images = ImageList
    OwnerDraw = True
    Left = 905
    Top = 261
    object Add2: TMenuItem
      Action = ActionAdd
      Caption = ' …ени в€саит'
      OnDrawItem = Traffic1DrawItem
    end
    object Update1: TMenuItem
      Action = ActionUpdate
      Caption = ' ¬€саитин редакт€ олунмасы'
      Default = True
      OnDrawItem = Traffic1DrawItem
    end
    object TakOff1: TMenuItem
      Action = ActionTakeOff
      Caption = ' ¬€саитин щесабдан силинм€си'
      OnDrawItem = Traffic1DrawItem
    end
    object Line1: TMenuItem
      Caption = '-'
      OnDrawItem = Traffic1DrawItem
    end
    object Print1: TMenuItem
      Action = ActionPrint
      Caption = ' „ап'
      OnDrawItem = Traffic1DrawItem
    end
    object Traffic1: TMenuItem
      Action = ActionTraffic
      Caption = ' ¬€саитин дюврийй€си'
      OnDrawItem = Traffic1DrawItem
    end
    object Inventarcard1: TMenuItem
      Action = ActionInventarCard
      Caption = ' »нвентар карты'
      OnDrawItem = Traffic1DrawItem
    end
    object Line2: TMenuItem
      Caption = '-'
      OnDrawItem = Traffic1DrawItem
    end
    object NFirst: TMenuItem
      Tag = 1
      Caption = ' явв€лин€'
      ImageIndex = 30
      OnClick = NFirstClick
      OnDrawItem = Traffic1DrawItem
    end
    object NLast: TMenuItem
      Tag = 2
      Caption = ' —онуна'
      ImageIndex = 29
      OnClick = NFirstClick
      OnDrawItem = Traffic1DrawItem
    end
    object N1: TMenuItem
      Caption = '-'
      OnDrawItem = Traffic1DrawItem
    end
    object Zoom1: TMenuItem
      Action = ActionZoom
      Caption = ' Ѕцтцн екран'
      OnDrawItem = Traffic1DrawItem
    end
    object Yekun1: TMenuItem
      Caption = ' Yekun'
      Checked = True
      OnClick = Yekun1Click
    end
    object Search1: TMenuItem
      Action = ActionSearch
      Caption = ' јхтарыш панели'
      OnDrawItem = Traffic1DrawItem
    end
    object N5: TMenuItem
      Action = ActionSelectAll
      Caption = ' ўамысыны сечм€к'
      OnDrawItem = Traffic1DrawItem
    end
  end
  object ActionListWares: TActionList
    Images = ImageList
    Left = 873
    Top = 261
    object ActionTraffic: TAction
      Caption = 'Traffic'
      ImageIndex = 15
      ShortCut = 113
      OnExecute = ActionTrafficExecute
    end
    object ActionInventarCard: TAction
      Caption = 'InventarCard'
      ImageIndex = 3
      ShortCut = 114
      OnExecute = ActionInventarCardExecute
    end
    object ActionUpdate: TAction
      Caption = '–едакт€'
      ImageIndex = 28
      ShortCut = 16453
      OnExecute = ActionUpdateExecute
    end
    object ActionZoom: TAction
      Caption = 'Zoom'
      ImageIndex = 22
      ShortCut = 16454
      OnExecute = ActionZoomExecute
    end
    object ActionPrint: TAction
      Caption = 'ўесабат'
      ImageIndex = 5
      ShortCut = 16464
      OnExecute = ActionPrintExecute
    end
    object ActionTakeOff: TAction
      Caption = 'ўесабдан сил'
      ImageIndex = 25
      ShortCut = 8238
      OnExecute = ActionTakeOffExecute
    end
    object ActionSearch: TAction
      Category = 'Search'
      Caption = 'Search'
      ShortCut = 32851
      OnExecute = ActionSearchExecute
    end
    object ActionSpeedSeacrh: TAction
      Category = 'Search'
      Caption = 'Search'
      OnExecute = ActionSpeedSeacrhExecute
    end
    object ActionCalculatePercents: TAction
      Caption = 'Calculate'
      ImageIndex = 20
      OnExecute = ActionCalculatePercentsExecute
    end
    object ActionAdd: TAction
      Caption = '…ени'
      ImageIndex = 27
      ShortCut = 45
      OnExecute = ActionAddExecute
    end
    object ActionSelectAll: TAction
      Caption = 'ўамысыны сечм€к'
      ShortCut = 16449
      OnExecute = ActionSelectAllExecute
    end
  end
  object ActionListGroups: TActionList
    Left = 889
    Top = 124
    object ActAdd: TAction
      Caption = ' …ени в€саит групу'
      ShortCut = 45
      OnExecute = ActionAddExecute
    end
    object ActUpdate: TAction
      Caption = ' √рупун редакт€ олунмасы'
      ShortCut = 16453
      OnExecute = ActionUpdateExecute
    end
    object ActZoom: TAction
      Caption = ' Ѕцтцн екран'
      Enabled = False
      ShortCut = 16454
      OnExecute = ActionZoomExecute
    end
    object ActDelete: TAction
      Caption = ' ¬€саит групунун силинм€си'
      ShortCut = 8238
      OnExecute = ActDeleteExecute
    end
  end
  object PopupMenuGroups: TPopupMenu
    OwnerDraw = True
    Left = 929
    Top = 124
    object Add1: TMenuItem
      Action = ActAdd
      OnDrawItem = Traffic1DrawItem
    end
    object N2: TMenuItem
      Caption = '-'
      OnDrawItem = Traffic1DrawItem
    end
    object Update2: TMenuItem
      Action = ActUpdate
      Caption = ' √рупун редакт€ олунмасы    '
      Default = True
      OnDrawItem = Traffic1DrawItem
    end
    object N4: TMenuItem
      Action = ActDelete
      OnDrawItem = Traffic1DrawItem
    end
    object N3: TMenuItem
      Caption = '-'
      OnDrawItem = Traffic1DrawItem
    end
    object Zoom2: TMenuItem
      Action = ActZoom
      OnDrawItem = Traffic1DrawItem
    end
  end
  object ImageState: TImageList
    Left = 593
    Top = 108
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002020200020202000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000002020DF00202020000000000020209F003030AF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000BF000000BF000000BF0000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000FF002020DF00808080000000FF004040BF00303030002020
      9F003030AF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000BF000000BF
      000000BF000000BF000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF00000000000000000000000000FFFFFF00BF000000BF00
      0000BF00000000000000BF000000BF000000BF000000BF000000BF0000000000
      000000000000FFFFFF00000000000000000000000000000000006060DF000000
      7F0000007F000000FF000000FF000000FF000000FF000000BF002020DF000000
      FF0000007F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000BF000000BF000000BF
      000000BF000000BF000000BF000000BF000000BF000000000000000000000000
      00000000000000000000000000000000000000000000BF000000BF000000BF00
      0000BF000000BF000000C0C0C000FFFFFF00FFFFFF00C0C0C000BF000000BF00
      0000000000000000000000000000000000000000000000000000505050000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007F000000FF000000
      FF0000007F005050500040404000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000BF000000BF000000BF
      000000BF000000BF000000BF0000FFFFFF000000000000BF0000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00BF000000BF000000BF00
      0000BF000000FF000000BF000000FFFFFF00FFFFFF00BF000000BF0000000000
      00000000000000000000FFFFFF00000000000000000030303000404040000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007F000000FF000000
      FF000000FF000000FF0040407F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000BF000000BF000000BF000000BF
      000000BF000000BF000000BF0000FFFFFF000000000000BF000000BF00000000
      000000000000000000000000000000000000BF000000BF000000BF000000BF00
      0000FF000000BF000000BF000000FFFFFF00FFFFFF00FF000000BF000000BF00
      000000000000000000000000000000000000404040000000FF000000FF000000
      FF000000FF000000FF000000FF00007FFF00007FFF000000BF000000FF000000
      FF000000FF000000BF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000BF000000BF000000BF000000BF
      000000BF000000BF000000BF0000FFFFFF00FFFFFF000000000000BF000000BF
      000000000000000000000000000000000000BF000000BF000000BF000000BF00
      0000FF000000BF000000BF000000FFFFFF00FFFFFF00BF000000FF000000BF00
      0000000000000000000000000000000000000000000000003F002020DF000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007F000000FF000000
      FF000000FF000000BF0000003F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000BF000000BF000000BF000000BF
      000000FF000000BF000000BF000000BF0000FFFFFF00FFFFFF000000000000BF
      000000000000000000000000000000000000BF000000BF000000BF000000BF00
      0000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00BF000000BF000000BF00
      0000BF0000000000000000000000000000000000000020205F002020DF000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007F000000FF000000
      FF000000FF000000FF000000FF0050508F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000BF000000BF000000BF000000FF
      000000FF000000BF000000BF000000BF0000FFFFFF00FFFFFF000000000000BF
      000000000000000000000000000000000000BF000000BF000000BF000000FF00
      0000FF000000FF000000FF000000FF000000BF000000BF000000BF000000BF00
      00000000000000000000000000000000000020205F000000FF000000FF000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007F000000FF000000
      FF000000FF0020209F0030303000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000BF000000BF000000FF
      0000FFFFFF00FFFFFF000000000000BF000000BF0000FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF0000000000FFFFFF00BF000000BF000000BF00
      0000BF000000FF000000FF000000FFFFFF00FF000000BF000000FF000000BF00
      00000000000000000000FFFFFF0000000000000000000000000050508F000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007F000000FF000000
      FF000000FF003030EF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000BF000000BF000000FF
      FF0000BF0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000000000BF
      00000000000000000000000000000000000000000000BF000000BF000000BF00
      0000BF000000BF000000C0C0C000FFFFFF00FFFFFF00BF000000BF000000BF00
      0000BF000000000000000000000000000000000000000000000020209F000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF000000BF000000FF000000
      FF000000FF000000FF0020209F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000BF000000FF
      000000FF0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000BF000000BF
      000000000000FFFFFF00000000000000000000000000FFFFFF00BF000000BF00
      0000BF000000FF000000FF000000C0C0C000BF000000BF000000BF0000000000
      000000000000FFFFFF00000000000000000000000000303030002020DF003030
      AF000000BF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000007F0000007F0020205F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000BF
      000000BF000000FF000000BF000000BF000000BF000000BF000000BF000000BF
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF00BF00
      0000BF000000BF000000BF000000BF000000BF000000BF000000BF0000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000007F000000FF000000DF000000BF000000FF003030EF003030EF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000BF000000BF000000BF000000BF000000BF000000BF000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00BF000000BF000000BF000000BF000000BF0000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000020205F003030EF0000002000505050000000FF0050505000000000002020
      5F00303030000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000303030000000000000000000000000008080BF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FC7FFC7FFF3F0000E00FE00FF93F0000
      C007C007F807000080038003C007000080038003C00100000001000180010000
      0001000100030000000100018001000000010001800000000001000100010000
      00010001C003000080038003C00100008003800380010000C007C007F00F0000
      E00FE00FF0270000FC7FFC7FF77F000000000000000000000000000000000000
      000000000000}
  end
end
