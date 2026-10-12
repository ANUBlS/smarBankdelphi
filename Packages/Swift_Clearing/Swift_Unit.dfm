object Swift_Form: TSwift_Form
  Left = 112
  Top = 110
  Width = 814
  Height = 572
  Caption = 'Western Union'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 806
    Height = 545
    ActivePage = TabSheet1
    Align = alClient
    MultiLine = True
    TabOrder = 0
    TabPosition = tpBottom
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Эедянляр'
      object Panel1: TPanel
        Left = 0
        Top = 207
        Width = 798
        Height = 257
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        object BrowseGrid: TDBGrid
          Left = 2
          Top = 46
          Width = 794
          Height = 209
          TabStop = False
          Align = alClient
          Color = clBtnFace
          DataSource = DataMod.Mess_out_DataSource
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          TabOrder = 0
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = GridMT102DrawColumnCell
          OnDblClick = BrowseGridDblClick
          OnKeyUp = BrowseGridKeyUp
          Columns = <
            item
              Color = clSilver
              Expanded = False
              FieldName = 'ID'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial AzLat'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = '№'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Arial AzLat'
              Title.Font.Style = []
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 19
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VAL_DATE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              Title.Caption = 'Тарих'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
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
              FieldName = 'CLIENT_ACC_NO'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial AzLat'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'КРЕДИТ'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Arial AzLat'
              Title.Font.Style = []
              Width = 103
              Visible = True
            end
            item
              Color = clSilver
              Expanded = False
              FieldName = 'VAL_NAME'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial AzLat'
              Font.Style = []
              Title.Caption = '$'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 28
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'AMOUNT'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial AzLat'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Кредит мябляь'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Arial AzLat'
              Title.Font.Style = []
              Width = 114
              Visible = True
            end
            item
              Color = clSilver
              Expanded = False
              FieldName = 'MESS_REFERENCE'
              Title.Alignment = taCenter
              Title.Caption = 'ГЕЙДИЙЙАТ№'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'LAMOUNT'
              Title.Alignment = taCenter
              Title.Caption = 'Еквивалент'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 112
              Visible = True
            end
            item
              Color = clSilver
              Expanded = False
              FieldName = 'CurrencyRate'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial AzLat'
              Font.Style = []
              Title.Caption = 'Курс'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Arial AzLat'
              Title.Font.Style = []
              Visible = False
            end>
        end
        object ControlBar2: TControlBar
          Left = 2
          Top = 2
          Width = 794
          Height = 44
          Align = alTop
          AutoSize = True
          TabOrder = 1
          object ToolBar2: TToolBar
            Left = 11
            Top = 2
            Width = 278
            Height = 36
            AutoSize = True
            ButtonHeight = 36
            ButtonWidth = 67
            Caption = 'ToolBar1'
            EdgeBorders = []
            Flat = True
            Images = ImageList
            ShowCaptions = True
            TabOrder = 0
            object ToolButton2: TToolButton
              Left = 0
              Top = 0
              Caption = 'Ялавя ет'
              ImageIndex = 0
              OnClick = ToolButton2Click
            end
            object ToolButton4: TToolButton
              Left = 67
              Top = 0
              Caption = 'Лявь ет'
              ImageIndex = 1
              OnClick = ToolButton4Click
            end
            object MessAcceptButton: TToolButton
              Left = 134
              Top = 0
              Caption = 'Дцзэундцр'
              ImageIndex = 3
              OnClick = MessAcceptButtonClick
            end
            object ToolButton10: TToolButton
              Left = 201
              Top = 0
              Caption = '    Инкар ет    '
              ImageIndex = 4
              Visible = False
              OnClick = ToolButton10Click
            end
          end
        end
      end
      object ControlBar1: TControlBar
        Left = 0
        Top = 0
        Width = 798
        Height = 44
        Align = alTop
        AutoSize = True
        TabOrder = 1
        object ToolBar1: TToolBar
          Left = 11
          Top = 2
          Width = 774
          Height = 36
          AutoSize = True
          ButtonHeight = 36
          ButtonWidth = 72
          Caption = 'ToolBar1'
          EdgeBorders = []
          Flat = True
          Images = ImageList
          ShowCaptions = True
          TabOrder = 0
          object ToolButton1: TToolButton
            Left = 0
            Top = 0
            Caption = 'Йени'
            ImageIndex = 0
            OnClick = ToolButton1Click
          end
          object ToolButton9: TToolButton
            Left = 72
            Top = 0
            Caption = 'Лявь ет'
            ImageIndex = 1
            OnClick = ToolButton9Click
          end
          object ToolButton3: TToolButton
            Left = 144
            Top = 0
            Caption = 'Йениля'
            ImageIndex = 2
            OnClick = ToolButton3Click
          end
          object AcceptButton: TToolButton
            Left = 216
            Top = 0
            Caption = ' Тястиг ет'
            ImageIndex = 3
            OnClick = AcceptButtonClick
          end
          object ToolButton18: TToolButton
            Left = 288
            Top = 0
            Width = 8
            Caption = 'ToolButton18'
            ImageIndex = 5
            Style = tbsSeparator
          end
          object ToolButton11: TToolButton
            Left = 296
            Top = 0
            Caption = 'Файлы Щазырла'
            ImageIndex = 5
            OnClick = ToolButton11Click
          end
          object ToolButton5: TToolButton
            Left = 368
            Top = 0
            Caption = 'Эедян Файллар'
            ImageIndex = 11
            OnClick = ToolButton5Click
          end
          object ToolButton6: TToolButton
            Left = 440
            Top = 0
            Width = 8
            Caption = 'ToolButton6'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object ToolButton8: TToolButton
            Left = 448
            Top = 0
            Caption = 'Параметрляр'
            ImageIndex = 7
            OnClick = ToolButton8Click
          end
          object ToolButton21: TToolButton
            Left = 520
            Top = 0
            Caption = 'Инкар ет'
            ImageIndex = 4
            Visible = False
            OnClick = ToolButton21Click
          end
          object ToolButton20: TToolButton
            Left = 592
            Top = 0
            Width = 8
            Caption = 'ToolButton20'
            ImageIndex = 8
            Style = tbsSeparator
          end
          object Panel22: TPanel
            Left = 600
            Top = 0
            Width = 174
            Height = 36
            BevelInner = bvLowered
            TabOrder = 0
            object StDate: TDateTimePicker
              Left = 2
              Top = 2
              Width = 85
              Height = 20
              CalAlignment = dtaLeft
              Date = 37832.6195718519
              Time = 37832.6195718519
              DateFormat = dfShort
              DateMode = dmComboBox
              Kind = dtkDate
              ParseInput = False
              TabOrder = 0
            end
            object EndDate: TDateTimePicker
              Left = 88
              Top = 2
              Width = 84
              Height = 20
              CalAlignment = dtaLeft
              Date = 37832.6195718519
              Time = 37832.6195718519
              DateFormat = dfShort
              DateMode = dmComboBox
              Kind = dtkDate
              ParseInput = False
              TabOrder = 1
            end
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 44
        Width = 798
        Height = 135
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 2
        object GridMT102: TDBGrid
          Left = 2
          Top = 2
          Width = 794
          Height = 131
          TabStop = False
          Align = alClient
          Color = clBtnFace
          DataSource = DataMod.Hox102_DataSource
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = GridMT102DrawColumnCell
          OnKeyUp = GridMT102KeyUp
          Columns = <
            item
              Color = clSilver
              Expanded = False
              FieldName = 'ID'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial AzLat'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = '№'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Arial AzLat'
              Title.Font.Style = []
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 19
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSDATE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              Title.Caption = 'Тарих'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
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
              FieldName = 'ACC_NO'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial AzLat'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'ДЕБЕТ'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Arial AzLat'
              Title.Font.Style = []
              Width = 103
              Visible = True
            end
            item
              Color = clSilver
              Expanded = False
              FieldName = 'VAL_NAME'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial AzLat'
              Font.Style = []
              Title.Caption = '$'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 28
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'LAMOUNT'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial AzLat'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Дебет Мябляь'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Arial AzLat'
              Title.Font.Style = []
              Width = 114
              Visible = True
            end
            item
              Color = clSilver
              Expanded = False
              FieldName = 'CurrencyRate'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Arial AzLat'
              Font.Style = []
              Title.Caption = 'Курс'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Arial AzLat'
              Title.Font.Style = []
              Visible = False
            end
            item
              Color = clSilver
              Expanded = False
              FieldName = 'TRANS_REF'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial AzLat'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'ГЕЙДИЙЙАТ №'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Arial AzLat'
              Title.Font.Style = []
              Width = 101
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'AMOUNT'
              Title.Alignment = taCenter
              Title.Caption = 'Еквивалент'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 112
              Visible = True
            end>
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 179
        Width = 798
        Height = 28
        Align = alTop
        TabOrder = 3
        object Panel4: TPanel
          Left = 1
          Top = 1
          Width = 796
          Height = 23
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object DBEdit1: TDBEdit
            Left = 13
            Top = 2
            Width = 51
            Height = 21
            Color = clSilver
            DataField = 'ID'
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 85
            Top = 2
            Width = 73
            Height = 21
            Color = clSilver
            DataField = 'TRANSDATE'
            TabOrder = 1
          end
          object DBEdit3: TDBEdit
            Left = 405
            Top = 2
            Width = 106
            Height = 21
            Color = clSilver
            DataField = 'TRANS_REF'
            TabOrder = 2
          end
          object DBEdit4: TDBEdit
            Left = 157
            Top = 2
            Width = 103
            Height = 21
            Color = clSilver
            DataField = 'ACC_NO'
            TabOrder = 3
          end
          object DBEdit5: TDBEdit
            Left = 260
            Top = 2
            Width = 31
            Height = 21
            Color = clSilver
            DataField = 'VAL_NAME'
            TabOrder = 4
          end
          object DBEdit6: TDBEdit
            Left = 290
            Top = 2
            Width = 116
            Height = 21
            Color = clSilver
            DataField = 'AMOUNT'
            TabOrder = 5
          end
          object DBEdit7: TDBEdit
            Left = 512
            Top = 2
            Width = 114
            Height = 21
            Color = clSilver
            TabOrder = 6
          end
          object DBEdit19: TDBEdit
            Left = 626
            Top = 2
            Width = 168
            Height = 21
            Anchors = [akLeft, akTop, akRight, akBottom]
            Color = clSilver
            DataField = 'NAME'
            TabOrder = 7
          end
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 464
        Width = 798
        Height = 53
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 4
        object Label1: TLabel
          Left = 5
          Top = 3
          Width = 80
          Height = 26
          Caption = 'Юдянишин тяйинаты вя ясасы'
          WordWrap = True
        end
        object Label2: TLabel
          Left = 5
          Top = 33
          Width = 73
          Height = 13
          Caption = 'Ялавя мялумат:'
        end
        object DBEdit8: TDBEdit
          Left = 89
          Top = 4
          Width = 624
          Height = 21
          Color = clSilver
          DataField = 'REMIT_INF'
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit9: TDBEdit
          Left = 89
          Top = 27
          Width = 624
          Height = 21
          Color = clSilver
          DataField = 'ADD_INF'
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Эялянляр'
      ImageIndex = 1
      object Panel7: TPanel
        Left = 0
        Top = 30
        Width = 798
        Height = 487
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Panel6: TPanel
          Left = 1
          Top = 1
          Width = 796
          Height = 444
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 0
          object RichEdit1: TRichEdit
            Left = 332
            Top = -22
            Width = 573
            Height = 447
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 1
            Visible = False
            WordWrap = False
          end
          object Grid_in: TDBGrid
            Left = 113
            Top = 2
            Width = 681
            Height = 336
            TabStop = False
            Align = alClient
            Color = clBtnFace
            DataSource = DataMod.Message_in_DataSource
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            TabOrder = 0
            TitleFont.Charset = RUSSIAN_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Azl Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = GridMT102DrawColumnCell
            OnDblClick = Grid_inDblClick
            OnKeyUp = Grid_inKeyUp
            Columns = <
              item
                Color = clSilver
                Expanded = False
                FieldName = 'ID'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Arial AzLat'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = '№'
                Title.Color = clNavy
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Arial AzLat'
                Title.Font.Style = []
                Width = 51
                Visible = True
              end
              item
                Expanded = False
                Title.Color = clNavy
                Title.Font.Charset = DEFAULT_CHARSET
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
                FieldName = 'REFERENCE'
                Title.Alignment = taCenter
                Title.Caption = 'Гейдиййат №'
                Title.Color = clNavy
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWindow
                Title.Font.Height = -11
                Title.Font.Name = 'Azl Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRANS_DATE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Azl Sans Serif'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'Тарих'
                Title.Color = clNavy
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWindow
                Title.Font.Height = -11
                Title.Font.Name = 'Azl Sans Serif'
                Title.Font.Style = []
                Width = 70
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'SEN_ACC'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial AzLat'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'ДЕБЕТ'
                Title.Color = clNavy
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Arial AzLat'
                Title.Font.Style = []
                Width = 101
                Visible = True
              end
              item
                Color = clSilver
                Expanded = False
                FieldName = 'VAL_NAME'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Arial AzLat'
                Font.Style = []
                Title.Caption = '$'
                Title.Color = clNavy
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 28
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'REC_CLIENT_ACC'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial AzLat'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'КРЕДИТ'
                Title.Color = clNavy
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Arial AzLat'
                Title.Font.Style = []
                Width = 103
                Visible = True
              end
              item
                Color = clSilver
                Expanded = False
                FieldName = 'VAL_NAME'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Arial AzLat'
                Font.Style = []
                Title.Caption = '$'
                Title.Color = clNavy
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 28
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'AMOUNT'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial AzLat'
                Font.Style = []
                Title.Caption = 'Кредит мябляь'
                Title.Color = clNavy
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Arial AzLat'
                Title.Font.Style = []
                Width = 111
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'AMOUNT'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial AzLat'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'Фактики мябляь'
                Title.Color = clNavy
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Arial AzLat'
                Title.Font.Style = []
                Width = 114
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'LAMOUNT'
                Title.Alignment = taCenter
                Title.Caption = 'Еквивалент'
                Title.Color = clNavy
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Azl Sans Serif'
                Title.Font.Style = []
                Visible = False
              end
              item
                Color = clSilver
                Expanded = False
                FieldName = 'CurrencyRate'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Arial AzLat'
                Font.Style = []
                Title.Caption = 'Курс'
                Title.Color = clNavy
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Arial AzLat'
                Title.Font.Style = []
                Visible = False
              end>
          end
          object FileList_IN: TFileListBox
            Left = 2
            Top = 2
            Width = 111
            Height = 336
            Align = alLeft
            Color = clSilver
            ItemHeight = 16
            Mask = '*.xml'
            PopupMenu = Popup_SingleConcert
            ShowGlyphs = True
            TabOrder = 2
          end
          object Panel8: TPanel
            Left = 2
            Top = 338
            Width = 792
            Height = 104
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 3
            object Panel9: TPanel
              Left = 0
              Top = 78
              Width = 792
              Height = 26
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Panel13: TPanel
                Left = 95
                Top = 0
                Width = 697
                Height = 26
                Align = alClient
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 'Юдяйижидян вясаити алана мялумат'
                TabOrder = 0
                object DBEdit13: TDBEdit
                  Left = 168
                  Top = 2
                  Width = 527
                  Height = 21
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  Color = clSilver
                  DataField = 'REMIT_INF'
                  ReadOnly = True
                  TabOrder = 0
                end
              end
              object Panel14: TPanel
                Left = 0
                Top = 0
                Width = 95
                Height = 26
                Align = alLeft
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 'Юдяниш коду'
                TabOrder = 1
                object DBEdit10: TDBEdit
                  Left = 64
                  Top = 2
                  Width = 28
                  Height = 21
                  Anchors = [akRight, akBottom]
                  Color = clSilver
                  DataField = 'TYPECODE'
                  ReadOnly = True
                  TabOrder = 0
                end
              end
            end
            object Panel10: TPanel
              Left = 0
              Top = 0
              Width = 792
              Height = 26
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object Panel12: TPanel
                Left = 344
                Top = 0
                Width = 448
                Height = 26
                Align = alClient
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 'Аланын ады'
                TabOrder = 0
                object DBEdit12: TDBEdit
                  Left = 52
                  Top = 2
                  Width = 395
                  Height = 21
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  Color = clSilver
                  DataField = 'REC_CLIENT_NAME'
                  ReadOnly = True
                  TabOrder = 0
                end
              end
              object Panel11: TPanel
                Left = 0
                Top = 0
                Width = 344
                Height = 26
                Align = alLeft
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 'Эюндярянин ады'
                TabOrder = 1
                object DBEdit11: TDBEdit
                  Left = 79
                  Top = 2
                  Width = 262
                  Height = 21
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  Color = clSilver
                  DataField = 'SEN_NAME'
                  ReadOnly = True
                  TabOrder = 0
                end
              end
            end
            object Panel16: TPanel
              Left = 0
              Top = 26
              Width = 792
              Height = 26
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 2
              object Panel17: TPanel
                Left = 253
                Top = 0
                Width = 209
                Height = 26
                Align = alLeft
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 'Алан мцштяринин вюен-и'
                TabOrder = 0
                object DBEdit15: TDBEdit
                  Left = 106
                  Top = 2
                  Width = 101
                  Height = 21
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  Color = clSilver
                  DataField = 'REC_CLIENT_INN'
                  ReadOnly = True
                  TabOrder = 0
                end
              end
              object Panel20: TPanel
                Left = 0
                Top = 0
                Width = 253
                Height = 26
                Align = alLeft
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 'Эюндярян мцштяринин вюен-и'
                TabOrder = 1
                object DBEdit16: TDBEdit
                  Left = 133
                  Top = 2
                  Width = 118
                  Height = 21
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  Color = clSilver
                  DataField = 'SEN_INN'
                  ReadOnly = True
                  TabOrder = 0
                end
              end
              object Panel21: TPanel
                Left = 462
                Top = 0
                Width = 330
                Height = 26
                Align = alClient
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 'Эюндярян иштирикчынын Мцхбир субщесабы'
                TabOrder = 2
                object DBEdit18: TDBEdit
                  Left = 185
                  Top = 2
                  Width = 142
                  Height = 21
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  Color = clSilver
                  DataField = 'SEN_BANK_SUBACC'
                  ReadOnly = True
                  TabOrder = 0
                end
              end
            end
            object Panel18: TPanel
              Left = 0
              Top = 52
              Width = 792
              Height = 26
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 3
              object Panel19: TPanel
                Left = 0
                Top = 0
                Width = 313
                Height = 26
                Align = alLeft
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 'Эюндярян иштиракчынын ады'
                TabOrder = 0
                object DBEdit17: TDBEdit
                  Left = 120
                  Top = 2
                  Width = 190
                  Height = 21
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  Color = clSilver
                  DataField = 'NAME'
                  ReadOnly = True
                  TabOrder = 0
                end
              end
              object Panel15: TPanel
                Left = 313
                Top = 0
                Width = 479
                Height = 26
                Align = alClient
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 'Ялавя мялумат'
                TabOrder = 1
                object DBEdit14: TDBEdit
                  Left = 72
                  Top = 2
                  Width = 404
                  Height = 21
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  Color = clSilver
                  DataField = 'ADD_INF'
                  ReadOnly = True
                  TabOrder = 0
                end
              end
            end
          end
        end
        object Panel_info: TPanel
          Left = 1
          Top = 445
          Width = 796
          Height = 41
          Align = alBottom
          TabOrder = 1
          Visible = False
          object Info_ListBox: TListBox
            Left = 1
            Top = 1
            Width = 794
            Height = 39
            Align = alClient
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            PopupMenu = InfoPopup
            TabOrder = 0
          end
        end
      end
      object ControlBar3: TControlBar
        Left = 0
        Top = 0
        Width = 798
        Height = 30
        Align = alTop
        AutoSize = True
        TabOrder = 1
        object ToolBar3: TToolBar
          Left = 11
          Top = 2
          Width = 430
          Height = 22
          AutoSize = True
          ButtonHeight = 21
          ButtonWidth = 54
          Caption = 'ToolBar1'
          EdgeBorders = []
          Flat = True
          Images = ImageList
          ShowCaptions = True
          TabOrder = 0
          object ToolButton12: TToolButton
            Left = 0
            Top = 0
            Caption = 'Конверт'
            ImageIndex = 6
            OnClick = ToolButton12Click
          end
          object ToolButton15: TToolButton
            Left = 54
            Top = 0
            Caption = 'Йениля'
            ImageIndex = 2
            OnClick = ToolButton15Click
          end
          object ToolButton14: TToolButton
            Left = 108
            Top = 0
            Caption = 'Лявь ет'
            ImageIndex = 1
            OnClick = ToolButton14Click
          end
          object ToolButton16: TToolButton
            Left = 162
            Top = 0
            Caption = ' Йохланылыб'
            ImageIndex = 3
            OnClick = ToolButton16Click
          end
          object ToolButton17: TToolButton
            Left = 216
            Top = 0
            Width = 8
            Caption = 'ToolButton17'
            ImageIndex = 7
            Style = tbsSeparator
          end
          object Panel23: TPanel
            Left = 224
            Top = 0
            Width = 174
            Height = 36
            BevelInner = bvLowered
            TabOrder = 0
            object StDate_in: TDateTimePicker
              Left = 2
              Top = 2
              Width = 85
              Height = 20
              CalAlignment = dtaLeft
              Date = 37832.6195718519
              Time = 37832.6195718519
              DateFormat = dfShort
              DateMode = dmComboBox
              Kind = dtkDate
              ParseInput = False
              TabOrder = 0
            end
            object EndDate_in: TDateTimePicker
              Left = 88
              Top = 2
              Width = 84
              Height = 20
              CalAlignment = dtaLeft
              Date = 37832.6195718519
              Time = 37832.6195718519
              DateFormat = dfShort
              DateMode = dmComboBox
              Kind = dtkDate
              ParseInput = False
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  object ImageList: TImageList
    Left = 736
    Top = 89
    Bitmap = {
      494C01010C000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000FFFF000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FF000000FF000000FF00
      0000FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000FFFF000084840000FFFF0000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000084840000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00C0C0C000FF0000008080
      80008080800080808000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000FFFF000084840000FFFF000084840000FFFF00008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF000084840000FFFF000084840000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000008400008400000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000FFFF000084840000FFFF000084840000FFFF000084840000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000848400000000000000000000FFFF000084840000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000008400000000840000008400000084000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FF000000FF000000FF00
      0000FF000000FF000000FF000000FFFFFF00FFFFFF00FF000000FF000000FF00
      0000FF000000FF000000FF000000FFFFFF0000000000000000000000000000FF
      FF000084840000FFFF0000848400000000000000000000FFFF000084840000FF
      FF000084840000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000084840000FFFF0000000000000000000084840000FFFF000084
      840000FFFF000000000000000000000000000000000000000000000000000000
      0000840000000084000000840000008400000084000084000000000000000000
      000000000000000000000000000000000000FFFFFF00C0C0C000FF0000008080
      80008080800080808000FF000000FFFFFF00FFFFFF000000FF00FF0000008080
      80008080800080808000FF000000FFFFFF00000000000000000000FFFF000084
      840000FFFF00008484000000000000000000000000000000000000FFFF000084
      840000FFFF00008484000000000000000000000000000000000000FFFF0000FF
      FF000084840000FFFF0000848400000000000000000000FFFF000084840000FF
      FF000084840000FFFF0000000000000000000000000000000000000000000000
      0000008400000084000000FF000000FF00000084000000840000840000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF000084840000FF
      FF000084840000FFFF0000848400000000000000000000FFFF000084840000FF
      FF000084840000FFFF0000848400000000000000000000FFFF0000FFFF000084
      840000FFFF000084840000FFFF0000000000000000000084840000FFFF000084
      840000FFFF000084840000FFFF00000000000000000000000000000000000000
      00000084000000FF0000000000000000000000FF000000840000008400008400
      000000000000000000000000000000000000FFFFFF00FF000000FF000000FF00
      0000FF000000FF000000FF000000FFFFFF00FFFFFF00FF000000FF000000FF00
      0000FF000000FF000000FF000000FFFFFF00000000000084840000FFFF000084
      840000FFFF000084840000FFFF0000000000000000000084840000FFFF000084
      840000FFFF000084840000FFFF00000000000000000000FFFF000084840000FF
      FF000084840000FFFF0000848400000000000000000000FFFF000084840000FF
      FF000084840000FFFF0000848400000000000000000000000000000000000000
      000000FF00000000000000000000000000000000000000840000008400000084
      000000000000000000000000000000000000FFFFFF00C0C0C000FF0000008080
      80008080800080808000FF000000FFFFFF00FFFFFF00C0C0C000FF0000008080
      80008080800080808000FF000000FFFFFF0000000000000000000084840000FF
      FF000084840000FFFF0000848400000000000000000000FFFF000084840000FF
      FF000084840000FFFF000000000000000000000000000000000000FFFF000084
      840000FFFF00008484000000000000000000000000000000000000FFFF000084
      840000FFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF0000008400000084
      000084000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000084
      840000FFFF000084840000FFFF0000000000000000000084840000FFFF000084
      840000FFFF0000000000000000000000000000000000000000000000000000FF
      FF000084840000FFFF0000848400000000000000000000FFFF000084840000FF
      FF00008484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000840000008400008400000000000000FFFFFF00FF000000FF000000FF00
      0000FF000000FF000000FF000000FFFFFF00FFFFFF00FF000000FF000000FF00
      0000FF000000FF000000FF000000FFFFFF000000000000000000000000000000
      00000084840000FFFF0000848400000000000000000000FFFF000084840000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF000084840000FFFF000084840000FFFF000084840000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000840000008400000084000000000000FFFFFF00C0C0C000FF0000008080
      80008080800080808000FF000000FFFFFF00FFFFFF00C0C0C000FF0000008080
      80008080800080808000FF000000FFFFFF000000000000000000000000000000
      0000000000000084840000FFFF000084840000FFFF000084840000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF000084840000FFFF000084840000FFFF00008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF0000008400000084000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000084840000FFFF000084840000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000084840000FFFF0000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF00000084000000000000FFFFFF00FF000000FF000000FF00
      0000FF000000FF000000FF000000FFFFFF00FFFFFF00FF000000FF000000FF00
      0000FF000000FF000000FF000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000084840000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000FF00FF0000008080
      80008080800080808000FF000000FFFFFF00FFFFFF00C0C0C000FF0000008080
      80008080800080808000FF000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000636363008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400212121000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000212100009C9C00007B7B00007B
      7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B
      7B00007B7B005252520084848400848484000000000000000000000000000000
      0000000000000080800000808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000BDBD0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0031EFEF0042424200848484000000000000000000000000000000
      0000000000000080800000808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000BDBD0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0031ADAD000000000031ADAD0000FFFF0000FFFF0000FF
      FF0000FFFF0031EFEF0042424200424242000000000000000000000000000000
      0000000000000080800000808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000084848400FFFFFF0000000000C6C6C600000000000000
      0000000000000000000000000000000000000042420000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0031ADAD000000000031ADAD0000FFFF0000FFFF0000FF
      FF0000FFFF00316B6B0084848400000000000000000000000000000000000000
      00000000000000808000008080000000000000000000C0C0C000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C0C0
      C000C0C0C000C0C0C00080808000808080000000840000008400000000000000
      0000FFFFFF0084848400FFFFFF0084848400FFFFFF0000000000C6C6C6000000
      0000000000000000000000000000000000000000000000BDBD0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000BDBD0000FFFF0000FFFF0000FFFF0000FF
      FF0031EFEF004242420042424200000000000000000000000000000000000000
      0000000000000080800000000000C0C0C000C0C0C000C0C0C000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000FFFFFF00C0C0
      C000C0C0C000C0C0C0008080800080808000000084000000840000000000FFFF
      FF0084848400FFFFFF0084848400C6C6C600C6C6C600FFFFFF0000000000C6C6
      C60000000000000000000000000000000000000000000042420000FFFF0000FF
      FF0000FFFF0000FFFF0031CECE003152520000FFFF0000FFFF0000FFFF0000FF
      FF00316B6B008484840000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000FFFFFF00C0C0
      C000C0C0C000C0C0C0008080800080808000000084000000840000000000FFFF
      FF00FFFFFF0084848400FFFFFF00C6C6C60084840000C6C6C600FFFFFF000000
      0000C6C6C600000000000000000000000000000000000000000000BDBD0000FF
      FF0000FFFF0000FFFF00316B6B000000000031EFEF0000FFFF0000FFFF0031EF
      EF0042424200424242000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C00080808000C0C0C000808080008080
      8000808080008080800000000000000000000000000000000000808080000000
      0000808080000000000000000000C0C0C0000000000000000000FFFFFF00C0C0
      C000C0C0C000C0C0C0008080800080808000000084000000840000000000FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000C6C6C600FFFF
      FF0000000000C6C6C600000000000000000000000000000000000042420000FF
      FF0000FFFF0000FFFF000021210000000000009C9C0000FFFF0000FFFF00316B
      6B00848484000000000000000000000000000000000000000000C0C0C0000000
      000000000000C0C0C000808080000000000000000000C0C0C000808080008080
      80000000000080808000000000000000000000000000C0C0C00080808000C0C0
      C000808080000000000000000000C0C0C0000000000000000000000000000000
      000000000000000000000000000000000000000084000000840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484
      8400FFFFFF0000000000C6C6C6000000000000000000000000000000000000BD
      BD0000FFFF0000FFFF000000000000000000007B7B0000FFFF0031EFEF004242
      4200424242000000000000000000000000000000000000000000C0C0C0000000
      FF00000000000000000000000000C0C0C000FFFFFF00FFFFFF00808080008080
      8000C0C0C000808080000000000000000000C0C0C00080808000808080008080
      8000808080008080800000000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000840000008400000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00848484008484840084848400FFFF
      FF0084848400C6C6C60084848400000000000000000000000000000000000042
      420000FFFF0000FFFF000000000000000000007B7B0000FFFF00316B6B008484
      8400000000000000000000000000000000000000000000000000C0C0C0000000
      FF0000000000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008080
      800000000000808080000000000000000000FFFFFF00C0C0C000C0C0C000C0C0
      C000808080008080800000000000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000840000008400000000000000
      0000000000008484840084848400848484000000000084848400FFFFFF008484
      8400C6C6C6008484840000000000000000000000000000000000000000000000
      000000BDBD0000FFFF0031ADAD00007B7B0031EFEF0031EFEF00424242004242
      4200000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C0008080
      800080808000808080000000000000000000FFFFFF00C0C0C000C0C0C000C0C0
      C000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000848484000000000000000000000000000000000000000000000000000000
      00000042420000FFFF0000FFFF0000FFFF0000FFFF00316B6B00848484000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C0008080
      800000000000000000000000000000000000FFFFFF00C0C0C000C0C0C000C0C0
      C000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000BDBD0000FFFF0000FFFF0031EFEF0042424200424242000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C00080808000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000042420000FFFF0000FFFF00316B6B0063636300000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C0008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000007B7B0031ADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C0008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000084000000000000008400000000000000840000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000008400
      0000840000008400000000000000840000000000000084000000000000008400
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00840000008400
      00008400000084000000C6C6C600C6C6C600FFFFFF00FFFFFF00840000000000
      00008400000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000008400
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0084000000840000008400
      0000840000008400000084000000C6C6C600FFFFFF0084000000840000008400
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000848484008400
      0000000000000000000000000000000000000000000084000000840000008400
      000084000000840000000000000000000000FFFFFF0084000000840000008400
      00008400000084000000FF000000C6C6C600FFFFFF0084000000840000008400
      0000000000008400000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000008400
      000084000000840000000000000000000000FFFFFF008400000084000000FF00
      000084000000FF00000084000000C6C6C600FFFFFF0084000000840000008400
      0000840000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000008400
      000084000000840000000000000000000000FFFFFF0084000000840000008400
      0000FF00000084000000FF000000C6C6C600FFFFFF0084000000840000008400
      0000000000008400000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000000000
      000084000000840000000000000000000000FFFFFF008400000084000000FF00
      000084000000FF000000C6C6C600C6C6C600C6C6C600FF000000840000008400
      0000840000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000848484008400
      0000000000000000000000000000000000008400000084000000000000000000
      000000000000840000000000000000000000FFFFFF0084000000FF0000008400
      0000FF000000FF000000FF000000FF0000008400000084000000840000008400
      0000000000008400000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000008484
      8400840000008400000084000000840000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0084000000FF00
      000084000000FF000000FF000000C6C6C600FFFFFF00FF000000840000008400
      00008400000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00840000008400
      0000FF0000008400000084000000C6C6C600C6C6C60084000000840000008400
      00008400000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008400
      00008400000084000000FF000000840000008400000084000000840000008400
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00840000008400000084000000840000008400000084000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FE7FFE7FFFFF0000FC3FFC3FFFFF0000
      F81FF81FFEFF0000F00FF00FFC7F0000E007E007F87F0000C003C003F03F0000
      80018001F01F000000000000F30F000000000000F78F000080018001FF870000
      C003C003FFE10000E007E007FFF10000F00FF00FFFF10000F81FF81FFFF90000
      FC3FFC3FFFFF0000FE7FFE7FFFFF0000C000FEFFBFF7FFFF0000F87FBFF7FFFF
      0000F87FBFF3FD7F0000F87FB0C0101F0001F80FAEC0000F8001F803AE400007
      8003F001AC400003C003C00184400001C007800184410000E0078001006B0001
      E00F8001006B1883F00F800302EBFFD7F01F800702EBFFFFF81FC01F070BFFFF
      F83FC07FCFFBFFFFFC7FE1FFDFFBFFFFFFFFFFFFFFFFF81FFFFFFFFCFFFFE007
      FFFFF3FFFFFFC003FFFFE1F9FFFF8001FC7FE1F3FFFF8001FD7FF0E3E7FF0000
      FD7FF847CF830000E10FFC0FDFC30000EFEFFE1FDFE30000E10FFC0FDFD30000
      FD7FF84FCF3B0000FD7FE0E3E0FF8001FC7FC1F1FFFF8001FFFFC7F8FFFFC003
      FFFFFFFFFFFFE007FFFFFFFFFFFFF81F00000000000000000000000000000000
      000000000000}
  end
  object InfoPopup: TPopupMenu
    Left = 669
    Top = 91
    object Clear1: TMenuItem
      Caption = 'Clear'
      OnClick = Clear1Click
    end
  end
  object Popup_SingleConcert: TPopupMenu
    OnPopup = Popup_SingleConcertPopup
    Left = 701
    Top = 91
    object Convert1: TMenuItem
      Caption = 'Convert'
      OnClick = Convert1Click
    end
  end
  object MainAction: TActionList
    Left = 637
    Top = 91
    object Delete_mess_in: TAction
      OnExecute = Delete_mess_inExecute
    end
    object Delete_mt102: TAction
      Caption = 'Delete_mt102'
      OnExecute = Delete_mt102Execute
    end
    object delete_mess_out: TAction
      Caption = 'delete_mess_out'
      OnExecute = delete_mess_outExecute
    end
    object Gridin_SelAll: TAction
      Caption = 'Gridin_SelAll'
      ShortCut = 16449
      OnExecute = Gridin_SelAllExecute
    end
  end
end
