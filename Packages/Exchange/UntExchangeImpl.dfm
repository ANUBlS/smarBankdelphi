object FrmExchange: TFrmExchange
  Left = 262
  Top = 173
  Width = 1016
  Height = 508
  Caption = 'Exchange & Convertation Reports'
  Color = clCream
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  OnDestroy = ActiveFormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1016
    Height = 508
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PageControl: TPageControl
      Left = 0
      Top = 0
      Width = 1016
      Height = 508
      ActivePage = TabSheet1
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = PageControlChange
      object TabSheet1: TTabSheet
        Caption = 'M'#601'lumat'
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 1008
          Height = 480
          Align = alClient
          TabOrder = 0
          object Panel4: TPanel
            Left = 1
            Top = 1
            Width = 1006
            Height = 172
            Align = alTop
            Caption = 'Panel4'
            TabOrder = 0
            object DBGrid1: TDBGrid
              Left = 1
              Top = 55
              Width = 1004
              Height = 116
              Align = alClient
              BiDiMode = bdLeftToRight
              Color = clCream
              DataSource = ExchangeDataMod.DViewGrid
              DrawingStyle = gdsGradient
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentBiDiMode = False
              TabOrder = 0
              TitleFont.Charset = RUSSIAN_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'EXNUM'
                  Title.Caption = #1042#1044#1052'-'#1080#1085' '#8470' '
                  Title.Color = clNavy
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clNavy
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NAME'
                  Title.Caption = #1042#1044#1052'-'#1080#1085' '#1072#1076#1099
                  Title.Color = clNavy
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clNavy
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 320
                  Visible = True
                end>
            end
            object Panel3: TPanel
              Left = 1
              Top = 1
              Width = 1004
              Height = 54
              Align = alTop
              TabOrder = 1
              object ToolBar1: TToolBar
                Left = 1
                Top = 1
                Width = 1002
                Height = 52
                Align = alClient
                ButtonHeight = 36
                ButtonWidth = 59
                Caption = 'ToolBar1'
                DrawingStyle = dsGradient
                GradientEndColor = clSilver
                Images = ImageList1
                ShowCaptions = True
                TabOrder = 0
                object ToolButton11: TToolButton
                  Left = 0
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton11'
                  ImageIndex = 3
                  Style = tbsSeparator
                end
                object ToolButton6: TToolButton
                  Left = 8
                  Top = 0
                  Caption = '    '#1049#1077#1085#1080'     '
                  ImageIndex = 7
                  OnClick = ToolButton6Click
                end
                object ToolButton7: TToolButton
                  Left = 67
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton7'
                  ImageIndex = 1
                  Style = tbsSeparator
                end
                object ToolButton10: TToolButton
                  Left = 75
                  Top = 0
                  Caption = #1056#1077#1076#1072#1082#1090#1103
                  ImageIndex = 3
                  OnClick = ToolButton10Click
                end
                object ToolButton8: TToolButton
                  Left = 134
                  Top = 0
                  Caption = #1057#1080#1083
                  ImageIndex = 11
                  OnClick = ToolButton8Click
                end
                object ToolButton9: TToolButton
                  Left = 193
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton9'
                  ImageIndex = 2
                  Style = tbsSeparator
                end
              end
            end
          end
          object Panel5: TPanel
            Left = 1
            Top = 226
            Width = 1006
            Height = 253
            Align = alClient
            Caption = 'Panel2'
            TabOrder = 1
            object DBGrid2: TDBGrid
              Left = 1
              Top = 1
              Width = 1004
              Height = 251
              Align = alClient
              Color = clCream
              DataSource = ExchangeDataMod.DGrid2
              DrawingStyle = gdsGradient
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = RUSSIAN_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'EXNUM'
                  Title.Caption = #1042#1044#1052'-'#1080#1085' '#8470' '
                  Title.Color = clNavy
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clNavy
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VAL_NAME'
                  Title.Caption = #1042#1072#1083#1081#1091#1090#1072
                  Title.Color = clNavy
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clNavy
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 87
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ACC_NO'
                  Title.Caption = #1065#1077#1089#1072#1073#1099#1085' '#8470
                  Title.Color = clNavy
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clNavy
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 190
                  Visible = True
                end>
            end
          end
          object Panel6: TPanel
            Left = 1
            Top = 173
            Width = 1006
            Height = 53
            Align = alTop
            TabOrder = 2
            object ToolBar2: TToolBar
              Left = 1
              Top = 1
              Width = 1004
              Height = 42
              ButtonHeight = 36
              ButtonWidth = 59
              Caption = 'ToolBar2'
              DrawingStyle = dsGradient
              GradientEndColor = clSilver
              Images = ImageList1
              ShowCaptions = True
              TabOrder = 0
              object ToolButton12: TToolButton
                Left = 0
                Top = 0
                Width = 8
                Caption = 'ToolButton12'
                ImageIndex = 3
                Style = tbsSeparator
              end
              object ToolButton1: TToolButton
                Left = 8
                Top = 0
                Caption = '    '#1049#1077#1085#1080'     '
                ImageIndex = 7
                OnClick = ToolButton1Click
              end
              object ToolButton2: TToolButton
                Left = 67
                Top = 0
                Width = 8
                Caption = 'ToolButton2'
                ImageIndex = 1
                Style = tbsSeparator
              end
              object ToolButton5: TToolButton
                Left = 75
                Top = 0
                Caption = #1056#1077#1076#1072#1082#1090#1103
                ImageIndex = 3
                OnClick = ToolButton5Click
              end
              object ToolButton3: TToolButton
                Left = 134
                Top = 0
                Caption = #1057#1080#1083
                ImageIndex = 11
                OnClick = ToolButton3Click
              end
              object ToolButton4: TToolButton
                Left = 193
                Top = 0
                Width = 8
                Caption = 'ToolButton4'
                ImageIndex = 2
                Style = tbsSeparator
              end
            end
          end
        end
      end
      object TabSheetExchange: TTabSheet
        Caption = ' V.D.M'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ImageIndex = 1
        ParentFont = False
        object ExchangeViewer: TDBGrid
          Left = 0
          Top = 81
          Width = 1008
          Height = 399
          Align = alClient
          Color = clCream
          DataSource = ExchangeDataMod.ExchangeData
          DrawingStyle = gdsGradient
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = PopupExchange
          TabOrder = 0
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          OnTitleClick = ExchangeViewerTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'DAT'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 73
              Visible = True
            end
            item
              Alignment = taCenter
              Color = clSilver
              Expanded = False
              FieldName = 'CURRENCYNAME'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = '$'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 30
              Visible = True
            end
            item
              Color = clWindow
              Expanded = False
              FieldName = 'BUYRATE'
              Title.Alignment = taRightJustify
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 66
              Visible = True
            end
            item
              Color = clWindow
              Expanded = False
              FieldName = 'BUYAMMOUNT'
              Title.Alignment = taRightJustify
              Title.Caption = #1061#1072#1088#1080#1078#1080' '#1074#1072#1083#1081#1091#1090#1072
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 85
              Visible = True
            end
            item
              Color = clWindow
              Expanded = False
              FieldName = 'BUYEQUIVALENT'
              Title.Alignment = taRightJustify
              Title.Caption = #1052#1072#1085#1072#1090' '#1077#1082#1074#1080#1074#1072#1083#1077#1085#1090#1080
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 111
              Visible = True
            end
            item
              Color = clWindow
              Expanded = False
              FieldName = 'BUYCOUNT'
              Title.Alignment = taRightJustify
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Visible = True
            end
            item
              Color = clWindow
              Expanded = False
              FieldName = 'SELLRATE'
              Title.Alignment = taRightJustify
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 64
              Visible = True
            end
            item
              Color = clWindow
              Expanded = False
              FieldName = 'SELLAMMOUNT'
              Title.Alignment = taRightJustify
              Title.Caption = #1061#1072#1088#1080#1078#1080' '#1074#1072#1083#1081#1091#1090#1072
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 82
              Visible = True
            end
            item
              Color = clWindow
              Expanded = False
              FieldName = 'SELLEQUIVALENT'
              Title.Alignment = taRightJustify
              Title.Caption = #1052#1072#1085#1072#1090' '#1077#1082#1074#1080#1074#1072#1083#1077#1085#1090#1080
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 109
              Visible = True
            end
            item
              Color = clWindow
              Expanded = False
              FieldName = 'SELLCOUNT'
              Title.Alignment = taRightJustify
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 64
              Visible = True
            end>
        end
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 1008
          Height = 81
          Align = alTop
          TabOrder = 1
          object SpeedButton1: TSpeedButton
            Left = 155
            Top = 54
            Width = 26
            Height = 24
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000CE0E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              77777777777777777777000000000007777700333333333077770B0333333333
              07770FB03333333330770BFB0333333333070FBFB000000000000BFBFBFBFB07
              77770FBFBFBFBF0777770BFB0000000777777000777777770007777777777777
              7007777777770777070777777777700077777777777777777777}
            OnClick = SpeedButton1Click
          end
          object GroupBox1: TGroupBox
            Left = 1
            Top = 1
            Width = 151
            Height = 79
            Align = alLeft
            Caption = #1058#1072#1088#1080#1093
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label1: TLabel
              Left = 3
              Top = 22
              Width = 64
              Height = 13
              Caption = #1041#1072#1096#1083#1072#1085#1100#1099#1078':'
            end
            object Label2: TLabel
              Left = 3
              Top = 58
              Width = 23
              Height = 13
              Caption = #1057#1086#1085':'
            end
            object DateTimePicker1: TDateTimePicker
              Left = 56
              Top = 13
              Width = 92
              Height = 21
              Date = 37504.805515821800000000
              Time = 37504.805515821800000000
              TabOrder = 0
            end
            object DateTimePicker2: TDateTimePicker
              Left = 56
              Top = 48
              Width = 92
              Height = 21
              Date = 37504.805993240700000000
              Time = 37504.805993240700000000
              TabOrder = 1
            end
          end
          object ToolBar3: TToolBar
            Left = 152
            Top = 1
            Width = 855
            Height = 79
            Align = alClient
            ButtonHeight = 38
            ButtonWidth = 90
            Caption = 'ToolBar3'
            DrawingStyle = dsGradient
            EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
            GradientEndColor = clSilver
            Images = ImageList1
            ShowCaptions = True
            TabOrder = 1
            object ToolButton13: TToolButton
              Left = 0
              Top = 0
              Action = ActionRefresh
            end
            object ToolButton14: TToolButton
              Left = 90
              Top = 0
              Width = 8
              Caption = 'ToolButton14'
              ImageIndex = 1
              Style = tbsSeparator
            end
            object ToolButton15: TToolButton
              Left = 98
              Top = 0
              Action = ActionPrint
            end
            object ToolButton16: TToolButton
              Left = 188
              Top = 0
              Width = 8
              Caption = 'ToolButton16'
              ImageIndex = 6
              Style = tbsSeparator
            end
            object ToolButton17: TToolButton
              Left = 196
              Top = 0
              Action = ActionFile
            end
            object ToolButton21: TToolButton
              Left = 286
              Top = 0
              Width = 8
              Caption = 'ToolButton21'
              ImageIndex = 7
              Style = tbsSeparator
            end
            object ToolButton22: TToolButton
              Left = 294
              Top = 0
              Action = ActionSettings
            end
          end
          object ProgressBar: TProgressBar
            Left = 428
            Top = 55
            Width = 280
            Height = 23
            TabOrder = 2
          end
          object Edit1: TEdit
            Left = 185
            Top = 55
            Width = 240
            Height = 23
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 3
            Text = 'C:\EXCH122.dbf'
          end
        end
      end
      object TabSheetConvertation: TTabSheet
        Caption = 'Konvertasiya'
        ImageIndex = 2
        object ConvertationViewer: TDBGrid
          Left = 0
          Top = 81
          Width = 1008
          Height = 375
          Align = alClient
          Color = clCream
          DataSource = ExchangeDataMod.DSConvertation
          DrawingStyle = gdsGradient
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = PopupConvertation
          TabOrder = 0
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnTitleClick = ConvertationViewerTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'DAT'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AMMOUNT'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AMMOUNT_C'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LAMMOUNT'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RATE_D'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MBANKKURS'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RATE_C'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DACC_NO'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 190
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KACC_NO'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 190
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FULLPATH'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 440
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOFFICAL'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KCURRENCY'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MBANKKURS'
              Title.Color = clNavy
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 110
              Visible = True
            end>
        end
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 1008
          Height = 81
          Align = alTop
          TabOrder = 1
          object SpeedButton2: TSpeedButton
            Left = 155
            Top = 54
            Width = 26
            Height = 24
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000CE0E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              77777777777777777777000000000007777700333333333077770B0333333333
              07770FB03333333330770BFB0333333333070FBFB000000000000BFBFBFBFB07
              77770FBFBFBFBF0777770BFB0000000777777000777777770007777777777777
              7007777777770777070777777777700077777777777777777777}
            OnClick = SpeedButton2Click
          end
          object GroupBox2: TGroupBox
            Left = 1
            Top = 1
            Width = 151
            Height = 79
            Align = alLeft
            Caption = #1058#1072#1088#1080#1093
            TabOrder = 0
            object Label3: TLabel
              Left = 3
              Top = 22
              Width = 64
              Height = 13
              Caption = #1041#1072#1096#1083#1072#1085#1100#1099#1078':'
            end
            object Label4: TLabel
              Left = 3
              Top = 58
              Width = 23
              Height = 13
              Caption = #1057#1086#1085':'
            end
            object DTPCBeginDate: TDateTimePicker
              Left = 56
              Top = 13
              Width = 92
              Height = 21
              Date = 37504.805515821800000000
              Time = 37504.805515821800000000
              TabOrder = 0
            end
            object DTPCEndDate: TDateTimePicker
              Left = 56
              Top = 48
              Width = 92
              Height = 21
              Date = 37504.805993240700000000
              Time = 37504.805993240700000000
              TabOrder = 1
              OnChange = DTPCEndDateChange
            end
          end
          object ProgBar: TProgressBar
            Left = 412
            Top = 55
            Width = 171
            Height = 23
            TabOrder = 1
          end
          object ToolBar4: TToolBar
            Left = 152
            Top = 1
            Width = 855
            Height = 79
            Align = alClient
            ButtonHeight = 36
            ButtonWidth = 83
            Caption = 'ToolBar4'
            DrawingStyle = dsGradient
            EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
            GradientEndColor = clSilver
            Images = ImageList1
            ShowCaptions = True
            TabOrder = 2
            object ToolButton18: TToolButton
              Left = 0
              Top = 0
              Caption = '      '#1049#1077#1085#1080#1083#1103'       '
              ImageIndex = 16
              OnClick = ToolButton18Click
            end
            object ToolButton23: TToolButton
              Left = 83
              Top = 0
              Width = 8
              Caption = 'ToolButton23'
              ImageIndex = 7
              Style = tbsSeparator
            end
            object ToolButtonBuy: TToolButton
              Tag = 1
              Left = 91
              Top = 0
              Caption = #1040#1083#1099#1096#1083#1072#1088
              ImageIndex = 3
              OnClick = ToolButtonBuyClick
            end
            object ToolButton27: TToolButton
              Left = 174
              Top = 0
              Width = 8
              Caption = 'ToolButton27'
              ImageIndex = 8
              Style = tbsSeparator
            end
            object ToolButton28: TToolButton
              Tag = 2
              Left = 182
              Top = 0
              Caption = #1057#1072#1090#1099#1096#1083#1072#1088
              ImageIndex = 0
              OnClick = ToolButtonBuyClick
            end
            object ToolButton19: TToolButton
              Left = 265
              Top = 0
              Width = 8
              Caption = 'ToolButton19'
              ImageIndex = 1
              Style = tbsSeparator
            end
            object ToolButton24: TToolButton
              Left = 273
              Top = 0
              Caption = #1060#1072#1081#1083#1072' '#1081#1072#1079
              ImageIndex = 5
              OnClick = ToolButton24Click
            end
            object ToolButton20: TToolButton
              Left = 356
              Top = 0
              Caption = 'Excel'
              ImageIndex = 14
              OnClick = ToolButton20Click
            end
            object ToolButton25: TToolButton
              Left = 439
              Top = 0
              Width = 8
              Caption = 'ToolButton25'
              ImageIndex = 15
              Style = tbsSeparator
            end
            object ToolButton26: TToolButton
              Left = 447
              Top = 0
              Caption = 'Excel alislar'
              ImageIndex = 14
              OnClick = ToolButton26Click
            end
            object ToolButton29: TToolButton
              Left = 530
              Top = 0
              Width = 8
              Caption = 'ToolButton29'
              ImageIndex = 16
              Style = tbsSeparator
            end
            object ToolButton30: TToolButton
              Left = 538
              Top = 0
              Caption = 'Excel satislar'
              ImageIndex = 14
              OnClick = ToolButton30Click
            end
          end
          object EConvert: TEdit
            Left = 185
            Top = 55
            Width = 225
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 3
            Text = 'C:\$MB12212.dbf'
          end
          object GroupBox3: TGroupBox
            Left = 792
            Top = 10
            Width = 120
            Height = 78
            Caption = #1063#1072#1087' '#1092#1086#1088#1084#1072#1089#1099
            TabOrder = 4
            Visible = False
            object RadioButton1: TRadioButton
              Left = 10
              Top = 45
              Width = 101
              Height = 19
              Caption = #1049#1077#1082#1091#1085
              Enabled = False
              TabOrder = 0
              OnClick = RadioButton1Click
            end
            object RadioButton2: TRadioButton
              Left = 44
              Top = 20
              Width = 95
              Height = 19
              Caption = #1040#1088#1076#1099#1078#1099#1083
              Checked = True
              TabOrder = 1
              TabStop = True
              OnClick = RadioButton2Click
            end
          end
        end
        object Panel9: TPanel
          Left = 0
          Top = 456
          Width = 1008
          Height = 24
          Align = alBottom
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          Caption = ' '#1058#1103#1081#1080#1085#1072#1090':'
          TabOrder = 2
          DesignSize = (
            1008
            24)
          object EAssignment: TEdit
            Left = 60
            Top = 1
            Width = 1017
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clSilver
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
  end
  object ImageList1: TImageList
    Left = 240
    Top = 2
    Bitmap = {
      494C010111001300040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001001000000000000028
      000000000000000000000000000000000000BC77BC77F439F439F439F439F439
      F439F439F439F439F439F439F439922DBC770000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC77BC77F4399E6B9E6BBF6B7D5F
      9F637F5F7F5F7F5B5F575F535F539231BC770000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC77BC77153E9E6F9E6F60027553
      0E3BA81AF02E5D535F575F535F539231BC770000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DD77DD77163EBE6FBE6F60026002
      600260026002A8167F5B5F575F57B331DD770000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DD77DD77363EBE73BE7360026002
      620659539F67840E7F5B5F5B5F5BB331DD770000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DD77DD77373EBE77BE7760026002
      600260029F677D5F7F5B5F5B7F5BD435DD770000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DD7BDD7B5842DF77DF77DF77DF77
      DF77DF779D639D639F677F5F7F5FD435DD7B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DD7BDD7B7942DF7BFF7FDF77DF77
      DF77600260026002BF6B9F639F63D535DD7B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DD7BDD7B9A42FF7FFF7F620A7553
      DF77755360026002BF6B9F679F63F535DD7B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DD7BDD7BBB46FF7FFF7F0E3B6002
      6002600260026002BF6BBF6B9F67F539DD7B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DD7BDD7BBB46FF7FFF7FFF7F0E3B
      6002600275536002BF6B3F63DF5AF639DD7B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DE7BDE7BDC46FF7FFF7FFF7FFF7F
      FF7FFF7BFF7BDF777E67163A163A163ADE7B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DE7BDE7BFD4AFF7FFF7FFF7FFF7F
      FF7FFF7FFF7BFF7B9E6B163A9D2ABA4ADE7B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DE7BDE7BFD4AFF7FFF7FFF7FFF7F
      DE7BDE7BDE7BBE777D6B163ADB4EBD77DE7B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DE7BDE7BFE4ABB42BB42BB42BB42
      BB42BB42BB42BB42BB42163ADE77DE7BDE7B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DE7BDE7BDE7BDE7BDE7BDE7BDE7B
      DE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EF3DFF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000007C000000000000000000000000000000000000000000000000
      000000000000EF3DEF3DFF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000007C007C00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FEF3DEF3DEF3DFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000007C
      007C007C007C007C007C007C000000000000EF3DEF3DEF3DEF3DEF3DEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000104210420000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000007C
      007C007C007C007C007C007C007C00000000EF3DFF7F000000000000EF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DFF7F0000000000000000104218630000
      0000000000000000000000000000000000000000000000000000104218630000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000007C
      007C007C007C007C007C007C007C007C0000EF3DFF7F0000FF7FFF7FEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D0000000000001042FF7F18631042
      0000000000000000000000000000000000000000000000000000104218630000
      0000000000000000000000000000000000000000FF7F00000000FF7F0000007C
      007C007C007C007C007C007C007C00000000EF3DFF7FEF3DEF3D0000EF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D00000000000010421042104218631042
      1042000000000000000000000000000000000000000000000000104218630000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000007C
      007C007C007C007C007C007C000000000000EF3DFF7F0000FF7FFF7FEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3D000000000000000000000000104218630000
      0000000000000000000000000000000000000000000010421042104218631042
      1042000000000000000000000000000000000000FF7F00000000FF7FFF7FFF7F
      FF7FFF7F0000007C007C0000000000000000EF3DFF7FEF3DEF3D000000000000
      00000000EF3DEF3DEF3DEF3D0000000000000000000000000000104218630000
      0000000000000000000000000000000000000000000000001042FF7F18631042
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000007C00000000000000000000EF3DFF7F0000FF7FFF7F0000FF7F
      FF7FFF7FEF3DEF3DEF3D00000000000000000000000000000000104218630000
      0000000000000000000000000000000000000000000000000000104218630000
      0000000000000000000000000000000000000000FF7F00000000FF7F00000000
      000000000000000000000000000000000000EF3DFF7FEF3DEF3D0000EF3DEF3D
      EF3DEF3DEF3DEF3D000000000000000000000000000000000000104210420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000FF7F
      FF7F00000000000000000000000000000000EF3DFF7F0000FF7FFF7FEF3DFF7F
      0000EF3D00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F0000F75EFF7F0000FF7F
      000000000000000000000000000000000000EF3DFF7FEF3DEF3D0000EF3DFF7F
      EF3D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7F00000000
      000000000000000000000000000000000000EF3DFF7FFF7FFF7FFF7FEF3DEF3D
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EF3DEF3DEF3DEF3DEF3DEF3D0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001700FF7F000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000170017001700FF7F000000000000000000000000000000000000FF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1700170017001700FF7F0000000000000000000000000000000000000000FF7F
      0000000000000000000000000000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001700
      17001700FF7F17001700FF7F000000000000000000000000000000000000FF7F
      000000000000000000000000FF7F000000000000000000000000000000000000
      1F00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7F17001700
      1700FF7F0000000017001700FF7F000000000000000000000000000000000000
      FF7F00000000000000000000FF7F000000000000000000000000000000000000
      1F00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1042104210421700
      FF7FFF7F0000000000001700FF7F000000000000000000000000000000000000
      0000FF7F000000000000FF7F0000000000000000000000000000000000000000
      1F00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000001700FF7F00000000000000000000000000000000
      0000000000000000FF7F000000000000000000000000000000001F001F001F00
      1F001F001F001F00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1042104210421042
      1042FF7F000000000000000000001700FF7F0000000000000000000000000000
      000000000000FF7F000000000000000000000000000000000000000000000000
      1F00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000000000000017000000000000000000000000000000
      0000000000000000FF7F00000000000000000000000000000000000000000000
      1F00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1042104200000000
      0000FF7F00000000000000000000000000000000000000000000000000000000
      0000FF7F00000000FF7F00000000000000000000000000000000000000000000
      1F00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7F00000000000000000000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1042104200000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      0000000000000000000000000000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000FF7F00000000
      00000000000000000000000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75E00000000000000000000000000000000
      0000000018631042000000000000000000000000FF7F00000000000000001042
      1042104210421042104210421042000000000000000000000000000000000000
      0000000000000000000000000000000000000000F75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75E00000000000000000000000018631863
      1042000010421042186310420000000000000000000000001042104210421042
      1042104210420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001863186310421863
      10421042104200001042000000000000000000000000FF7F0000000000000000
      0000104210421042104210420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FF75EFF7FF75EFF7FF75E
      FF7FF75EFF7FF75EFF7FF75EFF7FF75E00000000000000000000186310421863
      10421042104210421042000000000000000000000000FF7F1042000000000000
      0000104210421042000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F75EFF7FF75EFF7FF75EFF7F
      F75EFF7FF75EFF7FF75EFF7F007CFF7F00000000000000000000186310421863
      10421042104210421042000000000000000000000000FF7F1042000000000000
      0000104200001042000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FF75EFF7FF75EFF7FF75E
      FF7FF75EFF7FF75EFF7FF75EFF7FF75E00000000000000000000186300001863
      10421042104210421042000000000000000000000000FF7F1042000000000000
      0000104200001042000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001863E07F1863
      10421042104210421042000000000000000000000000FF7F1042000000000000
      0000104200001042000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000186318631863
      10421042104210421042000000000000000000000000FF7F1042000000000000
      0000104200001042000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F00000000
      00000000FF7F0000FF7F00000000000000000000000000000000186318631863
      10421042104210421042000000000000000000000000FF7F1042000000000000
      0000104200001042000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000186318631863
      10421042104210421042000000000000000000000000FF7F1042000000000000
      0000104200001042000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F00000000
      FF7F00000000000000000000000000000000000000000000186318631863FF7F
      10421042104210421042000000000000000000000000FF7FFF7F000000000000
      1042104210421042104210420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7F0000FF7FFF7F000000000000000000000000000000001863FF7F18631863
      1863186310421042104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F0000F75E
      FF7F0000FF7F0000000000000000000000000000000000001042FF7F18631863
      1863186318631863104200000000000000000000FF7FFF7FFF7FFF7F00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7F00000000000000000000000000000000000000000000000000001042FF7F
      1863186318631863104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1042FF7F10420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000186318631863186300000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      000000001700FF7F00000000000000000000000000000000FF7F000000000000
      0000186318631863000000000000000000001042186300000000000000000000
      00001042186300000000000000000000000000001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      0000170017001700FF7F0000000000000000000000000000FF7F00000000FF7F
      0000186300000000000000000000000000001042E07F00001863000000000000
      00001042186318631863000000000000000000001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      1700170017001700FF7F000000000000000000000000FF7FFF7F0000FF7FFF7F
      0000FF7F104200000000000000000000000000001F0017001863000000000000
      00001042FF7F00000000000000000000000000001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000001700
      17001700FF7F17001700FF7F00000000000000001042FF7F00000000FF7FFF7F
      0000FF7F10420000FF7FFF7F1863186300000000104217000000000000000000
      00000000E07FE05E0000000000000000000000001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FFF7FFF7F17001700
      1700FF7F0000000017001700FF7F0000000000001042FF7FFF7F0000FF7FFF7F
      0000FF7F104200001042FF7F186300000000000000001F001700000000000000
      000000001042E07F0000000000000000000000001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7F1042104210421700
      FF7FFF7F0000000000001700FF7F0000000000000000000010420000FF7FFF7F
      0000FF7F104200000002FF7F0000000000000000000010421700000000000000
      000000000000E07FE05E000000000000000000001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000001700FF7F000000001042FF7FFF7F0000FF7FFF7F
      0000FF7F104200000002FF7F0000000000000000000000001F00170000000000
      0000000000001042E07F000000000000000000001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7F1042104210421042
      1042FF7F000000000000000000001700FF7F00001042104210000000FF7FFF7F
      0000FF7F10420000FF7FFF7F0000000000000000000000001042170000000000
      0000000000000000E07FE05E00000000000000001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F000000000000000000000000170000000000FF7FFF7F0000FF7FFF7F
      0000FF7F10420000FF7FFF7F0000000000000000000000000000000017000000
      00000000000000001042E07F00000000000000001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7F1042104200000000
      0000FF7F0000000000000000000000000000000010421000FF7FFF7FFF7FFF7F
      1042104210420000007CFF7F0000000000000000000000001042104217000000
      00000000000000000000E07FE05E0000000000001042FF7FFF7FFF7FFF7F0000
      1863FF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FFF7FFF7FFF7F0000
      00000000000000000000000000000000000000001042FF7F1042FF7FFF7F1042
      1042FF7F10421000007CFF7F000000000000000000000000000000001F001700
      00000000000000000000104218630000000000001042FF7FFF7FFF7FFF7F1863
      0000FF7FFF7FFF7FFF7F186300000000000000000000FF7F1042104200000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7F1042FF7F
      10421000007CFF7F007CFF7F0000000000000000000000000000104210421700
      0000000000000000000000001F7C175C000000001042FF7FFF7FFF7F0000FF7F
      1863FF7FFF7FFF7F1863000000000000000000000000FF7FFF7FFF7FFF7F0000
      000000000000000000000000000000000000000010421042FF7FFF7F1042FF7F
      007CFF7FFF7FFF7F007CFF7F0000000000000000000000000000000010420000
      00000000000000000000000010421042000000001042FF7F1042104210420000
      1042104210421042000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001042000010421042FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104210421042000010421042
      1042104200000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFDFFFC7FFFFFFFFFFCFFFC3
      FFFFFFFFFFC78001FFFFFFFF00030000FBFFF1FF00013800F1FFF1FF00002000
      E0FFF1FF00010801C07FF1FF00032003F1FFC07F00070F87F1FFE0FF000F240F
      F1FFF1FF001F081FF1FFFBFF007F217FFFFFFFFF00FF08FFFFFFFFFF01FF01FF
      FFFFFFFF03FF03FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FFFFC
      FFFFFDFFFF0FF3FFFFFFF8FFFE0FE1F9FC7FF0FF8007E1F3FC7FE67F8023F0E3
      FC7FCE7F8033F847E00FFF3F8039FC0FE00FFFBF803CFE1FE00FFFDF803EFC0F
      FC7FFFDF873FF84FFC7FFFEF803FE0E3FC7FFFF7857FC1F1FFFFFFFB80FFC7F8
      FFFFFFFD81FFFFFFFFFFFFFFFFFFFFFF8001FFFF8003FFFF0000F81F3C01FFFF
      0000E0078003FFFF0000E00F9F03FFFF0000E0078D03FC7F0000E0078D43FD7F
      0000E0078D43FD7F0000E0078D43E10FE007E0078D43EFEFE007E0078D43E10F
      E007E0078D43FD7FE007E0078E03FD7FE00FE0078003FC7FE01FE00707FDFFFF
      E03FF80F8003FFFFE07FFE3FFC7FFFFFF7FFFFFFE003FFFFE60FFFFF8003FF9F
      E41F3F3F8003FF0FC01F0F0F8003FE0FC01F8F1F8003800780018F9F80038023
      8003CF8F800380338007C7CF800380398007E7C78003803C8007E3E78003803E
      8007F3E38003873F8007E1F38003803F8007F9F18007857F8007F0F9800F80FF
      8007F9F9801F81FFA007FFFF807FFFFF}
  end
  object TblExchange: TTable
    Left = 276
    Top = 2
  end
  object SaveDlg: TSaveDialog
    FileName = 'EXCH122.dbf'
    Filter = '*.dbf|*.dbf'
    Left = 316
    Top = 2
  end
  object SaveConvert: TSaveDialog
    FileName = '$MB12212.dbf'
    Filter = '*.dbf|*.dbf'
    Left = 360
    Top = 2
  end
  object PopupExchange: TPopupMenu
    Images = ImageList1
    OwnerDraw = True
    Left = 340
    Top = 144
    object N1: TMenuItem
      Action = ActionRefresh
      Caption = #1049#1077#1085#1080#1083#1103'          '
      Default = True
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Action = ActionPrint
    end
    object N3: TMenuItem
      Action = ActionFile
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Action = ActionSettings
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Action = ActionFirst
    end
    object N9: TMenuItem
      Tag = 1
      Action = ActionLast
    end
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 236
    Top = 176
    object ActionRefresh: TAction
      Category = 'Exchange'
      Caption = '      '#1049#1077#1085#1080#1083#1103'       '
      ImageIndex = 16
      ShortCut = 116
      OnExecute = ActionRefreshExecute
    end
    object ActionPrint: TAction
      Category = 'Exchange'
      Caption = #1063#1072#1087
      ImageIndex = 4
      ShortCut = 115
      OnExecute = ActionPrintExecute
      OnUpdate = ActionPrintUpdate
    end
    object ActionFile: TAction
      Category = 'Exchange'
      Caption = #1060#1072#1081#1083#1072' '#1081#1072#1079
      ImageIndex = 5
      ShortCut = 114
      OnExecute = ActionFileExecute
      OnUpdate = ActionPrintUpdate
    end
    object ActionSettings: TAction
      Category = 'Exchange'
      Caption = #1057#1072#1079#1083#1072#1084#1072
      ImageIndex = 7
      ShortCut = 113
      OnExecute = ActionSettingsExecute
    end
    object ActionFirst: TAction
      Category = 'Exchange'
      Caption = #1071#1074#1074#1103#1083#1080#1085#1103
      ImageIndex = 13
      OnExecute = ActionFirstExecute
      OnUpdate = ActionPrintUpdate
    end
    object ActionLast: TAction
      Tag = 1
      Category = 'Exchange'
      Caption = #1057#1086#1085#1091#1085#1072
      ImageIndex = 12
      OnExecute = ActionLastExecute
      OnUpdate = ActionPrintUpdate
    end
  end
  object PopupConvertation: TPopupMenu
    Left = 340
    Top = 192
  end
  object CMExcel: TCMExcelExport
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'Tahoma'
    FontTitles.Style = [fsBold]
    OrientationTitles = 0
    FontData.Charset = DEFAULT_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Tahoma'
    FontData.Style = []
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Tahoma'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 68
    Top = 232
  end
end
