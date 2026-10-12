object WesternUnionForm: TWesternUnionForm
  Left = 281
  Top = 135
  Width = 781
  Height = 492
  Caption = 'WesternUnionForm'
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 773
    Height = 465
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object ControlBar1: TControlBar
      Left = 0
      Top = 0
      Width = 773
      Height = 54
      Align = alTop
      AutoSize = True
      BevelInner = bvNone
      TabOrder = 0
      object ToolBar1: TToolBar
        Left = 11
        Top = 2
        Width = 518
        Height = 22
        AutoSize = True
        ButtonWidth = 24
        Caption = 'ToolBar1'
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        Images = ImageList
        TabOrder = 0
        object ButtonLoad: TToolButton
          Left = 0
          Top = 0
          Action = LoadFile
        end
        object ToolButton2: TToolButton
          Left = 24
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object ButtonConvert: TToolButton
          Left = 32
          Top = 0
          Action = ConvertFileA
        end
        object ToolButton11: TToolButton
          Left = 56
          Top = 0
          Width = 8
          Caption = 'ToolButton11'
          ImageIndex = 7
          Style = tbsSeparator
        end
        object ToolButton1: TToolButton
          Left = 64
          Top = 0
          Action = Accept
        end
        object ToolButton8: TToolButton
          Left = 88
          Top = 0
          Width = 8
          Caption = 'ToolButton8'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object ButtonRefresh: TToolButton
          Left = 96
          Top = 0
          Action = RefreshIncoming
        end
        object ToolButton10: TToolButton
          Left = 120
          Top = 0
          Width = 8
          Caption = 'ToolButton10'
          ImageIndex = 6
          Style = tbsSeparator
        end
        object ButtonDelete: TToolButton
          Left = 128
          Top = 0
          Action = DeleteIncoming
        end
        object ToolButton7: TToolButton
          Left = 152
          Top = 0
          Width = 8
          Caption = 'ToolButton7'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object ButtonSearch: TToolButton
          Left = 160
          Top = 0
          Caption = 'ButtonSearch'
          ImageIndex = 3
        end
        object ToolButton14: TToolButton
          Left = 184
          Top = 0
          Width = 8
          Caption = 'ToolButton14'
          ImageIndex = 7
          Style = tbsSeparator
        end
        object ButtonPrint: TToolButton
          Left = 192
          Top = 0
          Caption = 'ButtonPrint'
          DropdownMenu = PopupMenu2
          ImageIndex = 6
          Style = tbsDropDown
        end
        object ToolButton12: TToolButton
          Left = 229
          Top = 0
          Width = 8
          Caption = 'ToolButton12'
          ImageIndex = 7
          Style = tbsSeparator
        end
        object ButtonFilter: TToolButton
          Left = 237
          Top = 0
          Action = IncomingFilter
          AllowAllUp = True
          Style = tbsCheck
        end
        object ToolButton4: TToolButton
          Left = 261
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object ButtonConfig: TToolButton
          Left = 269
          Top = 0
          Action = GetConfig
        end
        object ToolButton3: TToolButton
          Left = 293
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 8
          Style = tbsSeparator
        end
        object StartDate: TDateTimePicker
          Left = 301
          Top = 0
          Width = 100
          Height = 22
          CalAlignment = dtaLeft
          Date = 38078.5028915741
          Time = 38078.5028915741
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 1
        end
        object ToolButton16: TToolButton
          Left = 401
          Top = 0
          Width = 8
          Caption = 'ToolButton16'
          ImageIndex = 7
          Style = tbsSeparator
        end
        object EndDate: TDateTimePicker
          Left = 409
          Top = 0
          Width = 100
          Height = 22
          CalAlignment = dtaLeft
          Date = 38078.5028915741
          Time = 38078.5028915741
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
        end
      end
      object Panel4: TPanel
        Left = 11
        Top = 28
        Width = 518
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object EditFileName: TEdit
          Left = 1
          Top = 0
          Width = 304
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clBtnFace
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = 64
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object Panel7: TPanel
          Left = 307
          Top = 0
          Width = 211
          Height = 22
          Align = alRight
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = '  Файлын ады :'
          TabOrder = 1
          object PanelFileName: TPanel
            Left = 59
            Top = 1
            Width = 147
            Height = 20
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 54
      Width = 773
      Height = 411
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PanelFilter: TPanel
        Left = 0
        Top = 0
        Width = 153
        Height = 411
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        Visible = False
        object Panel10: TPanel
          Left = 0
          Top = 17
          Width = 153
          Height = 394
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Label1: TLabel
            Left = 3
            Top = 165
            Width = 65
            Height = 13
            Caption = 'Ямялиййат № :'
          end
          object Label3: TLabel
            Left = 4
            Top = 205
            Width = 66
            Height = 13
            Caption = 'Гейдиййат № :'
          end
          object Label4: TLabel
            Left = 5
            Top = 126
            Width = 71
            Height = 13
            Caption = 'Эялян/Эедян :'
          end
          object Label2: TLabel
            Left = 2
            Top = 2
            Width = 149
            Height = 17
            Align = alTop
            AutoSize = False
            Caption = 'Filiallar :'
          end
          object SearchEditID: TSearchEdit
            Left = 3
            Top = 181
            Width = 143
            Height = 21
            TabOrder = 0
            OnExit = SearchEditReferenceExit
            DataSource = DataModWU.DSWesternUnion
            SearchField = 'ID'
          end
          object SearchEditReference: TSearchEdit
            Left = 3
            Top = 221
            Width = 143
            Height = 21
            TabOrder = 1
            OnExit = SearchEditReferenceExit
            DataSource = DataModWU.DSWesternUnion
            SearchField = 'REFERENCE'
          end
          object ComboBoxKind: TComboBox
            Left = 3
            Top = 141
            Width = 146
            Height = 22
            Style = csOwnerDrawFixed
            ItemHeight = 16
            TabOrder = 2
            OnChange = ComboBoxKindChange
            OnDrawItem = ComboBoxKindDrawItem
            Items.Strings = (
              'Бцтун Ямялийатлар'
              'Дахил Оланлар'
              'Хариж Оланлар')
          end
          object BranchFilter: TCheckListBox
            Left = 2
            Top = 19
            Width = 149
            Height = 103
            OnClickCheck = BranchFilterClickCheck
            Align = alTop
            BorderStyle = bsNone
            Color = clSilver
            ItemHeight = 13
            Style = lbOwnerDrawFixed
            TabOrder = 3
          end
          object ComboFilter: TDBViewComboBox
            Left = 6
            Top = 279
            Width = 145
            Height = 20
            Style = csOwnerDrawVariable
            ItemHeight = 14
            TabOrder = 4
            Visible = False
            OnChange = ComboFilterChange
            OnDrawItem = ComboFilterDrawItem
            ListSource = DataModWU.DSBranch
            ListFields = 'BRANCHNAME'
            FieldInterval = 5
            DropDownOnEnter = False
          end
        end
        object Panel11: TPanel
          Left = 0
          Top = 0
          Width = 153
          Height = 17
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object SpeedButton1: TSpeedButton
            Left = 135
            Top = 1
            Width = 17
            Height = 16
            Caption = 'X'
            Flat = True
            OnClick = SpeedButton1Click
          end
        end
      end
      object Panel3: TPanel
        Left = 153
        Top = 0
        Width = 620
        Height = 411
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Splitter2: TSplitter
          Left = 0
          Top = 57
          Width = 620
          Height = 3
          Cursor = crVSplit
          Align = alTop
          Color = clBtnFace
          ParentColor = False
        end
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 620
          Height = 57
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object FileRich: TRichEdit
            Left = 2
            Top = 2
            Width = 616
            Height = 53
            Align = alClient
            BorderStyle = bsNone
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = 8404992
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
            WordWrap = False
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 60
          Width = 620
          Height = 351
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvNone
          TabOrder = 1
          object Splitter1: TSplitter
            Left = 1
            Top = 262
            Width = 618
            Height = 3
            Cursor = crVSplit
            Align = alBottom
            Beveled = True
            Color = clGray
            ParentColor = False
          end
          object GroupBox2: TGroupBox
            Left = 1
            Top = 265
            Width = 618
            Height = 85
            Align = alBottom
            Caption = 'Ялавя Информасийа'
            TabOrder = 0
            object Panel8: TPanel
              Left = 2
              Top = 42
              Width = 614
              Height = 41
              Align = alClient
              BevelInner = bvLowered
              BevelOuter = bvNone
              TabOrder = 0
              object ListBoxErrors: TListBox
                Left = 1
                Top = 1
                Width = 612
                Height = 39
                Align = alClient
                BorderStyle = bsNone
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ItemHeight = 16
                ParentFont = False
                PopupMenu = PopupErrors
                Style = lbOwnerDrawFixed
                TabOrder = 0
                OnDrawItem = ListBoxErrorsDrawItem
              end
            end
            object Panel9: TPanel
              Left = 2
              Top = 15
              Width = 614
              Height = 27
              Align = alTop
              BevelInner = bvRaised
              BevelOuter = bvLowered
              TabOrder = 1
            end
          end
          object GridWUIncoming: TDBGrid
            Left = 1
            Top = 1
            Width = 618
            Height = 261
            Align = alClient
            BorderStyle = bsNone
            Color = clWhite
            DataSource = DataModWU.DSWesternUnion
            Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            PopupMenu = PopupMenu1
            TabOrder = 1
            TitleFont.Charset = RUSSIAN_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Azl Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = GridWUIncomingDrawColumnCell
            OnTitleClick = GridWUIncomingTitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'KIND'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Azl Sans Serif'
                Font.Style = []
                Title.Caption = ' '
                Width = 20
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'ID'
                Title.Alignment = taCenter
                Title.Caption = '№'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Azl Sans Serif'
                Title.Font.Style = [fsUnderline]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STATUS'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Azl Sans Serif'
                Font.Style = []
                Title.Caption = ' '
                Width = 20
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'INCOMDATE'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = 64
                Font.Height = -11
                Font.Name = 'Azl Sans Serif'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'Тарих'
                Width = 108
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'REFERENCE'
                Title.Alignment = taCenter
                Title.Caption = 'Гейдиййат №'
                Width = 111
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'BRANCH'
                Title.Alignment = taCenter
                Title.Caption = 'Филилал'
                Visible = False
              end
              item
                Alignment = taCenter
                Color = 14737632
                Expanded = False
                FieldName = 'VALUTE'
                Title.Alignment = taCenter
                Title.Caption = '$'
                Width = 29
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'PRINCIPIAL'
                Title.Alignment = taCenter
                Title.Caption = 'Мябляь'
                Width = 117
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'CHARGES'
                Title.Alignment = taCenter
                Title.Caption = 'Комиссийа'
                Width = 62
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'REVENUE'
                Title.Alignment = taCenter
                Title.Caption = 'Эялир'
                Width = 83
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'BRANCHNAME'
                Title.Alignment = taCenter
                Title.Caption = 'Филиалын Ады'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Azl Sans Serif'
                Title.Font.Style = []
                Width = 130
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'CONVERTDATE'
                Title.Alignment = taCenter
                Title.Caption = 'Конверт Тарихи'
                Width = 156
                Visible = True
              end>
          end
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList
    Left = 352
    Top = 56
    object LoadFile1: TMenuItem
      Action = LoadFile
      OnDrawItem = N5DrawItem
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Action = ConvertFileA
      OnDrawItem = N5DrawItem
    end
    object N2: TMenuItem
      Action = Accept
      OnDrawItem = N5DrawItem
    end
    object N4: TMenuItem
      Action = DeleteIncoming
      OnDrawItem = N5DrawItem
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object N13: TMenuItem
      Caption = 'Жап ет'
      ImageIndex = 6
      OnDrawItem = N5DrawItem
      object N14: TMenuItem
        Action = PrintWithInterval
        OnDrawItem = N5DrawItem
      end
      object N15: TMenuItem
        Action = PrintTotal
        OnDrawItem = N5DrawItem
      end
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Action = RefreshIncoming
      OnDrawItem = N5DrawItem
    end
    object N10: TMenuItem
      Action = SelectAll
      OnDrawItem = N5DrawItem
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Action = GetConfig
      OnDrawItem = N5DrawItem
    end
  end
  object ActionList1: TActionList
    Images = ImageList
    Left = 320
    Top = 56
    object LoadFile: TAction
      Caption = 'Файлы Йцкля'
      ImageIndex = 0
      ShortCut = 16463
      OnExecute = LoadFileExecute
    end
    object ClearErrorLogs: TAction
      Caption = 'Clear Error messages'
      ShortCut = 49219
      OnExecute = ClearErrorLogsExecute
    end
    object RefreshIncoming: TAction
      Caption = 'Йениля'
      ImageIndex = 1
      ShortCut = 116
      OnExecute = RefreshIncomingExecute
    end
    object SelectAll: TAction
      Caption = 'Щамысыны сеч'
      ShortCut = 16449
      OnExecute = SelectAllExecute
    end
    object ConvertFileA: TAction
      Caption = 'Конверт'
      ImageIndex = 5
      ShortCut = 16459
      OnExecute = ConvertFileAExecute
    end
    object DeleteIncoming: TAction
      Caption = 'Ляьв ет'
      ImageIndex = 4
      OnExecute = DeleteIncomingExecute
    end
    object GetConfig: TAction
      Caption = 'Сазлама'
      ImageIndex = 7
      OnExecute = GetConfigExecute
    end
    object Accept: TAction
      Caption = 'Тястиг ет'
      ImageIndex = 9
      OnExecute = AcceptExecute
    end
    object IncomingFilter: TAction
      Caption = 'Сыралама'
      ImageIndex = 2
      ShortCut = 49222
      OnExecute = IncomingFilterExecute
    end
    object PrintWithInterval: TAction
      Caption = 'Цмумиляшдирилмиш формада'
      OnExecute = PrintWithIntervalExecute
    end
    object PrintTotal: TAction
      Caption = 'Бцтцн Ямялийатлар'
      OnExecute = PrintTotalExecute
    end
  end
  object OpenFileDialog: TOpenDialog
    Filter = 'Text File|*.txt'
    Left = 384
    Top = 56
  end
  object ImageList: TImageList
    Left = 416
    Top = 56
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001001000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7F10001000
      1000100010001000FF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000007C007C
      007C007C007C00000000000000000000000000000000FF7F1000100010001000
      100010001000100010001000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000007C007C007C007C
      007C007C007C007C007C00000000000000000000FF7F10001000100010001000
      1000100010001000100010001000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007C007C007C007C007C
      007C007C007C007C007C007C0000000000000000FF7F10001000100010001863
      1863FF7FFF7F1000100010001000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007C007C007C007C007C
      007C007C007C007C007C007C000000000000FF7F100010001000100010001000
      1863FF7F100010001000100010001000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000007C007C007C007C00000000
      007C00000000007C007C007C007C00000000FF7F100010001000100010001000
      1863FF7F100010001000100010001000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000007C007C007C007C00000000
      000000000000007C007C007C007C00000000FF7F100010001000100010001000
      1863FF7F100010001000100010001000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000007C007C007C007C007C0000
      00000000007C007C007C007C007C00000000FF7F100010001000100010001000
      1863FF7F100010001000100010001000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000007C007C007C007C00000000
      000000000000007C007C007C007C00000000FF7F100010001000100010001863
      18631863100010001000100010001000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000007C007C007C007C00000000
      007C00000000007C007C007C007C00000000FF7F100010001000100010001000
      10001000100010001000100010001000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007C007C007C007C007C
      007C007C007C007C007C007C0000000000000000FF7F10001000100010001000
      1863FF7F10001000100010001000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007C007C007C007C007C
      007C007C007C007C007C007C0000000000000000FF7F10001000100010001000
      1863186310001000100010001000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000007C007C007C007C
      007C007C007C007C007C000000000000000000000000FF7F1000100010001000
      100010001000100010001000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000007C007C
      007C007C007C000000000000000000000000000000000000FF7FFF7F10001000
      1000100010001000FF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018631863186300001863
      1863186318631863186318631863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF7F0000000018631863186310420000
      1863186318631863186318631863000000000000F75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75E00000000000010420000000000000000
      00000000000000000000104200000000000000000000000000000000FF7F0000
      0000000000000000000000000000000000000000000018631863186318630000
      0000186318631863186318631863000000000000F75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75E00000000000000000040000000000000
      0000000000000000FF7F0000000000000000000000000000000000000000FF7F
      0000000000000000000000000000FF7F00000000000018631863186318630000
      E07F000018631863186318631863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004000000000
      000000000000FF7F00000000000000000000000000000000000000000000FF7F
      000000000000000000000000FF7F000000000000000018631863000000000000
      0000E07F00001863186318631863000000000000FF7FF75EFF7FF75EFF7FF75E
      FF7FF75EFF7FF75EFF7FF75EFF7FF75E00000000000000000000000000400000
      00000000FF7F0000000000000000000000000000000000000000000000000000
      FF7F00000000000000000000FF7F0000000000000000186318630000E07FE07F
      E07FE07FE07F0000186318631863000000000000F75EFF7FF75EFF7FF75EFF7F
      F75EFF7FF75EFF7FF75EFF7F007CFF7F00000000000000000000000000000040
      0000FF7F00000000000000000000000000000000000000000000000000000000
      0000FF7F000000000000FF7F0000000000000000000018631863186300000000
      E07F000000000000000018631863000000000000FF7FF75EFF7FF75EFF7FF75E
      FF7FF75EFF7FF75EFF7FF75EFF7FF75E00000000000000000000000000000000
      0040000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F0000000000000000000000001863186318630000E07F
      E07FE07F00001863186318631863000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      0000004000000000000000001042000000000000000000000000000000000000
      000000000000FF7F000000000000000000000000000000000000000000000000
      E07F0000E07F0000186318631863000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000FF7F0000
      0000000000400000000000001042104200000000000000000000000000000000
      0000000000000000FF7F00000000000000000000000000000000E07FE07FE07F
      0000E07FE07FE07F000018631863000000000000000000000000FF7F00000000
      00000000FF7F0000FF7F00000000000000000000000000000000FF7F00000000
      0000000000000000104210420000000000000000000000000000000000000000
      0000FF7F00000000FF7F000000000000000000000000186300000000E07F0000
      E07F000000000000000000001863000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000001042104210420000000000000000000000000000000000000000
      FF7F00000000000000000000FF7F000000000000000018630000E07F0000E07F
      0000E07F00001863186318631863000000000000000000000000FF7F00000000
      FF7F000000000000000000000000000000000000104210420000000000000000
      000000000000104210421042000000000000000000000000000000000000FF7F
      0000000000000000000000000000FF7F000000000000186318630000E07F0000
      E07F0000E07F0000186318631863000000000000000000000000FF7FFF7FFF7F
      FF7F0000FF7FFF7F000000000000000000000000000010420000000000000000
      0000104210420000000000000000000000000000000000000000FF7F00000000
      00000000000000000000000000000000FF7F0000000018631863000000000000
      0000000000000000000018631863000000000000000000000000FF7F0000F75E
      FF7F0000FF7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018631863186300000000
      E07F00000000E07F000000001863000000000000000000000000FF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018631863186300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000004000400040004000400000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000420042004200420042
      0042004200420042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000004000400000000000400000
      0000000000001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000E07F00000042004200420042
      0042004200420042004200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000040000000000000
      0000000010420000000010420000000000000000000000001863186318631863
      0000000000000000000000000000000000000000FF7FE07F0000004200420042
      0042004200420042004200420000000000000000000000001000104200000000
      0000000000000000000000000000000000000000000000000000004000000000
      0000000000000000000000000000000000000000000000001863186310420000
      0000000010420000000000000000000000000000E07FFF7FE07F000000420042
      0042004200420042004200420042000000000000000010421000000000000000
      0000000010001000100010001000000000000000004000000000004000400000
      0000000000000000000000000000000000000000000000001863000000000000
      0000000000000000000000000000000000000000FF7FE07FFF7FE07F00000000
      0000000000000000000000000000000000000000000010000000000000000000
      0000000000001000100010001000000000000000004000400040004000400000
      0000000000000000000000000000000000000000000000001863104200000000
      0000000000001042000000000000000000000000E07FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07F0000000000000000000000000000000010000000000000000000
      0000000000000000100010001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF0300000000
      0000000000000000000000000000000000000000FF7FE07FFF7FE07FFF7FE07F
      FF7FE07FFF7F0000000000000000000000000000000010000000000000000000
      0000000000001000000010001000000000000000100010001000100010001000
      00000000000000000000000000000000000000000000000000000000FF030000
      FF03000000000000000000000000000000000000E07FFF7FE07F000000000000
      0000000000000000000000000000000000000000000010421000000000000000
      0000100010000000000000001000000000000000104210000000000010001042
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042100010001000
      1000000000000000000000000000000000000000000010001000100010000000
      00000000000000000000000000000000000000000000000000000000FF030000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001000100000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042104200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      0000000010420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF81F00000000FFFFE00700000000
      F83FC00300000000E00F800100000000C007800100000000C007000000000000
      86C300000000000087C3000000000000838300000000000087C3000000000000
      86C3000000000000C007800100000000C007800100000000E00FC00300000000
      F83FE00700000000FFFFF81F00000000FFFFC0038001FFFFFFFCC0030000CFE7
      F3FFC0030000C7C7E1F9C0030000E38FE1F3C0030000F11FF0E3C0030000F83F
      F847C2030000FC7BFC0FC0030000F831FE1FC083E007F100FC0FD103E0070381
      F84FCA03E0070783E0E3C503E0070703C1F1C283E00FC407C7F8C7E3E01FC61F
      FFFFC2D3E03FFFFFFFFFC003E07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      001FFFFF83EF807F000FFFFF9BCFBF790007FFFFEF87A1730003E7FFF787A027
      0001CF83B3EFA38F0000DFC383EFA78F001FDFE3FFEFA0AF001FDFD381EFAABF
      001FCF3B99EFA0BF8FF1E0FFC3EF8BBFFFF9FFFFE7EFF7CFFF75FFFFE7EFF39F
      FF8FFFFFFFEFF83FFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PopupErrors: TPopupMenu
    Left = 107
    Top = 417
    object Clear1: TMenuItem
      Action = ClearErrorLogs
    end
  end
  object GridImage: TImageList
    Left = 264
    Top = 57
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001000000000000018
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010011001
      1001100110011001000000000000000000000000000000000000000000020002
      0002000200020002000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000100110011001
      1001100110011001100100000000000000000000000000000000000200020002
      0002000200020002000200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001001100110011001
      1001100110011001100110010000000000000000000000000002000200020002
      0000000000020002000200020000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010011001100110011001
      1001100110011001100110011001000000000000000000020002000200020000
      0002000200000002000200020002000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000100110011001100110011001
      0000100100001001100110011001100100000000000200020002000200020002
      0002000200000002000200020002000200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000100110011001100110011001
      0000000010011001100110011001100100000000000200020002000200020002
      0002000000020002000200020002000200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000100110011001100110011001
      0000100100001001100110011001100100000000000200020002000200020002
      0000000200020002000200020002000200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000100110011001100110011001
      0000100100001001100110011001100100000000000200020002000200020000
      0002000200020002000200020002000200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000100110011001100110011001
      0000100100001001100110011001100100000000000200020002000200020000
      0002000200000002000200020002000200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010011001100110011001
      0000000000001001100110011001000000000000000000020002000200020002
      0000000000020002000200020002000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001001100110011001
      1001100110011001100110010000000000000000000000000002000200020002
      0002000200020002000200020000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000100110011001
      1001100110011001100100000000000000000000000000000000000200020002
      0002000200020002000200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010011001
      1001100110011001000000000000000000000000000000000000000000020002
      0002000200020002000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7F10001000
      1000100010001000FF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1000100010001000
      100010001000100010001000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018631863
      1863186318631863000000000000000000000000000000000000000018631863
      1863186318631863000000000000000000000000FF7F10001000100010001000
      1000100010001000100010001000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186300020002
      0002000200020002186300000000000000000000000000000000186310011001
      1001100110011001186300000000000000000000FF7F10001000100010001863
      1863FF7FFF7F1000100010001000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000001863000200020002
      1863186300020002000218630000000000000000000000001863100110011001
      100110011001100110011863000000000000FF7F100010001000100010001000
      1863FF7F100010001000100010001000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000018630002000200021863
      0002000218630002000200021863000000000000000018631001100110011001
      100110011001100110011001186300000000FF7F100010001000100010001000
      1863FF7F100010001000100010001000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000186300020002000200020002
      0002000218630002000200020002186300000000186310011001100110011001
      186310011863100110011001100118630000FF7F100010001000100010001000
      1863FF7F100010001000100010001000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000186300020002000200020002
      0002186300020002000200020002186300000000186310011001100110011001
      186318631001100110011001100118630000FF7F100010001000100010001000
      1863FF7F100010001000100010001000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000186300020002000200020002
      1863000200020002000200020002186300000000186310011001100110011001
      186310011863100110011001100118630000FF7F100010001000100010001863
      18631863100010001000100010001000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000186300020002000200021863
      0002000200020002000200020002186300000000186310011001100110011001
      186310011863100110011001100118630000FF7F100010001000100010001000
      10001000100010001000100010001000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000186300020002000200021863
      0002000218630002000200020002186300000000186310011001100110011001
      1863100118631001100110011001186300000000FF7F10001000100010001000
      1863FF7F10001000100010001000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000018630002000200020002
      1863186300020002000200021863000000000000000018631001100110011001
      1863186318631001100110011863000000000000FF7F10001000100010001000
      1863186310001000100010001000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000001863000200020002
      0002000200020002000218630000000000000000000000001863100110011001
      10011001100110011001186300000000000000000000FF7F1000100010001000
      100010001000100010001000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186300020002
      0002000200020002186300000000000000000000000000000000186310011001
      100110011001100118630000000000000000000000000000FF7FFF7F10001000
      1000100010001000FF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018631863
      1863186318631863000000000000000000000000000000000000000018631863
      18631863186318630000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF00000000FFFFFFFF00000000
      F81FF81F00000000F00FF00F00000000E007E18700000000C003C24300000000
      8141804100000000818180810000000081418101000000008141820100000000
      8141824100000000C1C3C18300000000E007E00700000000F00FF00F00000000
      F81FF81F00000000FFFFFFFF00000000F81FFFFFFFFFFFFFE007FFFFFFFFFFFF
      C003FFFFF81FF81F8001FEFFF00FF00F8001FC7FE007E0070000FD7FC003C003
      0000F93F800180010000F3BF800180010000FF9F800180010000FFDF80018001
      0000FFCF800180018001FFEFC003C0038001FFEFE007E007C003FFFFF00FF00F
      E007FFFFF81FF81FF81FFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ExcelExporter1: TExcelExporter
    ExportSource = DataModWU.DSReport
    ExportList.Strings = (
      'Эял-Эед'
      'Тарих'
      'Гейдиййат №'
      'Мябляь'
      'Эялир'
      'Валута'
      'Филиал')
    SheetName = 'Western Union(Total)'
    ShowTitles = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 496
    Top = 55
  end
  object PopupMenu2: TPopupMenu
    Images = GridImage
    Left = 377
    Top = 170
    object N6: TMenuItem
      Action = PrintWithInterval
      OnDrawItem = N5DrawItem
    end
    object N7: TMenuItem
      Action = PrintTotal
      Caption = 'Бцтцн Ямялиййатлар'
      OnDrawItem = N5DrawItem
    end
  end
  object ExcelExporterComplex: TExcelExporter
    ExportSource = DataModWU.DSReportComplex
    ShowTitles = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 536
    Top = 55
  end
end
