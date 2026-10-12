object TransactionsDocumentX: TTransactionsDocumentX
  Left = 57
  Top = 107
  Width = 685
  Height = 502
  Caption = 'TransactionsDocumentX'
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
  object ControlBar1: TControlBar
    Left = 0
    Top = 0
    Width = 677
    Height = 44
    Align = alTop
    AutoSize = True
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 11
      Top = 2
      Width = 525
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 72
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      Images = ImageList1
      ShowCaptions = True
      TabOrder = 0
      Wrapable = False
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = TopAction
      end
      object ToolButton2: TToolButton
        Left = 72
        Top = 0
        Action = PriorAction
      end
      object ToolButton3: TToolButton
        Left = 144
        Top = 0
        Action = NextAction
      end
      object ToolButton5: TToolButton
        Left = 216
        Top = 0
        Action = LastAction
      end
      object ToolButton6: TToolButton
        Left = 288
        Top = 0
        Action = Update
      end
      object ToolButton10: TToolButton
        Left = 360
        Top = 0
        Action = PreviewAction
        DropdownMenu = PopupMenu1
        Style = tbsDropDown
      end
      object ToolButton4: TToolButton
        Left = 445
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object ToolButton7: TToolButton
        Left = 453
        Top = 0
        Action = ToggleFilterAction
      end
    end
  end
  object Panel4: TPanel
    Left = 191
    Top = 44
    Width = 486
    Height = 431
    Align = alClient
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 1
      Top = 387
      Width = 486
      Height = 43
      Caption = 'Ахтарыш'
      TabOrder = 0
      object Edit1: TEdit
        Left = 3
        Top = 14
        Width = 39
        Height = 21
        Color = 14408667
        TabOrder = 0
      end
      object Edit3: TEdit
        Left = 144
        Top = 14
        Width = 123
        Height = 21
        Color = 14408667
        TabOrder = 1
      end
      object Edit4: TEdit
        Left = 267
        Top = 14
        Width = 123
        Height = 21
        Color = 14408667
        TabOrder = 2
      end
      object Edit5: TEdit
        Left = 391
        Top = 14
        Width = 90
        Height = 21
        Color = 14408667
        TabOrder = 3
      end
      object Edit6: TEdit
        Left = 483
        Top = 14
        Width = 118
        Height = 21
        Color = 14408667
        TabOrder = 4
      end
      object Edit9: TEdit
        Left = 114
        Top = 14
        Width = 29
        Height = 21
        Color = 14408667
        TabOrder = 5
      end
      object MaskEdit1: TMaskEdit
        Left = 44
        Top = 14
        Width = 69
        Height = 21
        Color = 14408667
        EditMask = '!90/90/0000;1;_'
        MaxLength = 10
        TabOrder = 6
        Text = '  /  /    '
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 484
      Height = 429
      Align = alClient
      DataSource = TransactionsDocDataMod.ProvarchSource
      TabOrder = 1
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Color = clSilver
          Expanded = False
          FieldName = 'ID'
          Title.Alignment = taCenter
          Title.Caption = '№'
          Title.Color = clHighlight
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 50
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DAT'
          Title.Alignment = taCenter
          Title.Caption = 'Тарих'
          Title.Color = clActiveCaption
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 82
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clWhite
          Expanded = False
          FieldName = 'DEBIT'
          Title.Alignment = taCenter
          Title.Caption = 'Дебет'
          Title.Color = clActiveCaption
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 84
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clSilver
          Expanded = False
          FieldName = 'VAL_ACC'
          Title.Alignment = taCenter
          Title.Caption = '$'
          Title.Color = clActiveCaption
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 27
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CREDIT'
          Title.Alignment = taCenter
          Title.Caption = 'Кредит'
          Title.Color = clActiveCaption
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 81
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clSilver
          Expanded = False
          FieldName = 'CURRENCYID_C'
          Title.Alignment = taCenter
          Title.Caption = '$'
          Title.Color = clActiveCaption
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 27
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AMMOUNT'
          Title.Alignment = taCenter
          Title.Caption = 'Дебет мябляь'
          Title.Color = clActiveCaption
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 116
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AMMOUNT_C'
          Title.Alignment = taCenter
          Title.Caption = 'Кредит мябляь'
          Title.Color = clActiveCaption
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LAMMOUNT'
          Title.Alignment = taCenter
          Title.Caption = 'Еквивалент'
          Title.Color = clActiveCaption
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindow
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 109
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 44
    Width = 191
    Height = 431
    Align = alLeft
    TabOrder = 2
    Visible = False
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 189
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BevelWidth = 2
      Caption = '   Filter вя сыралашма'
      TabOrder = 0
      object Bevel1: TBevel
        Left = -1
        Top = 22
        Width = 189
        Height = 2
      end
      object Bevel2: TBevel
        Left = -1
        Top = 0
        Width = 189
        Height = 2
      end
      object SpeedButton5: TSpeedButton
        Left = 169
        Top = 1
        Width = 20
        Height = 21
        Flat = True
        Glyph.Data = {
          C6000000424DC60000000000000076000000280000000A0000000A0000000100
          04000000000050000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFF00
          000000FFFFF00F000000F00FFF00FF000000FF00F00FFF000000FFF000FFFF00
          0000FFF000FFFF000000FF00F00FFF000000F00FFF00FF00000000FFFFF00F00
          0000FFFFFFFFFF000000}
        OnClick = SpeedButton5Click
      end
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 24
      Width = 189
      Height = 384
      ActivePage = TabSheet1
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'Сечимляр'
        object GroupBox5: TGroupBox
          Left = 0
          Top = 0
          Width = 181
          Height = 40
          Align = alTop
          Caption = 'Ямалиййаты дахил едян ямалиййатчы:'
          TabOrder = 0
          object DBViewComboBox7: TDBViewComboBox
            Left = 4
            Top = 16
            Width = 170
            Height = 21
            Enabled = False
            ItemHeight = 13
            TabOrder = 0
            FieldInterval = 5
            DropDownOnEnter = False
          end
        end
        object GroupBox6: TGroupBox
          Left = 0
          Top = 108
          Width = 181
          Height = 117
          Align = alTop
          Caption = 'Хцсусиййятляри'
          TabOrder = 1
          object Bevel3: TBevel
            Left = 70
            Top = 36
            Width = 3
            Height = 76
          end
          object CheckBox3: TCheckBox
            Left = 78
            Top = 34
            Width = 97
            Height = 17
            Caption = 'Милли валцтада'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object CheckBox4: TCheckBox
            Left = 78
            Top = 50
            Width = 97
            Height = 17
            Caption = 'Харижи валцтада'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object CheckBox5: TCheckBox
            Left = 78
            Top = 66
            Width = 97
            Height = 17
            Caption = 'Мултивалцта'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
          object CheckBox6: TCheckBox
            Left = 78
            Top = 82
            Width = 97
            Height = 17
            Caption = 'Курс фярги'
            Checked = True
            State = cbChecked
            TabOrder = 3
          end
          object RadioButton2: TRadioButton
            Left = 8
            Top = 32
            Width = 57
            Height = 17
            Caption = 'Сечилмиш'
            TabOrder = 4
          end
          object CheckBox7: TCheckBox
            Left = 78
            Top = 98
            Width = 89
            Height = 17
            Caption = 'Гялир-зяряр'
            Checked = True
            State = cbChecked
            TabOrder = 5
          end
          object RadioButton1: TRadioButton
            Left = 8
            Top = 16
            Width = 113
            Height = 17
            Caption = 'Бцтцн ямалиййатлар'
            TabOrder = 6
            TabStop = True
          end
        end
        object GroupBox1: TGroupBox
          Left = 0
          Top = 40
          Width = 181
          Height = 68
          Align = alTop
          Caption = 'Тарих'
          TabOrder = 2
          object Label1: TLabel
            Left = 3
            Top = 18
            Width = 71
            Height = 13
            Caption = 'Башланьыч тарих '
          end
          object Label2: TLabel
            Left = 30
            Top = 40
            Width = 47
            Height = 13
            Caption = 'Сон тарих :'
          end
          object DateTimePicker1: TDateTimePicker
            Left = 76
            Top = 16
            Width = 97
            Height = 21
            CalAlignment = dtaLeft
            Date = 37480.6530318634
            Time = 37480.6530318634
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 0
          end
          object DateTimePicker2: TDateTimePicker
            Left = 75
            Top = 40
            Width = 98
            Height = 21
            CalAlignment = dtaLeft
            Date = 37480.6532195718
            Time = 37480.6532195718
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 1
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Щесаблар'
        ImageIndex = 2
        object GroupBox3: TGroupBox
          Left = 1
          Top = 3
          Width = 178
          Height = 114
          TabOrder = 0
          object Label3: TLabel
            Left = 7
            Top = 91
            Width = 33
            Height = 13
            Caption = 'Валцта:'
          end
          object DebitCurrencyCB: TDBViewComboBox
            Left = 48
            Top = 89
            Width = 126
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 0
            ListFields = 'Name'
            FieldInterval = 5
            DropDownOnEnter = False
          end
          object CheckBox2: TCheckBox
            Left = 44
            Top = 4
            Width = 129
            Height = 17
            Caption = 'Дебит щесабына эюря филтр'
            TabOrder = 1
          end
          object PageControl2: TPageControl
            Left = 5
            Top = 22
            Width = 169
            Height = 65
            ActivePage = TabSheet3
            MultiLine = True
            TabOrder = 2
            object TabSheet3: TTabSheet
              Caption = 'Баланс щесабы'
              object DBText1: TDBText
                Left = -1
                Top = 22
                Width = 164
                Height = 12
                DataField = 'NAME'
                WordWrap = True
              end
              object Label4: TLabel
                Left = 0
                Top = 3
                Width = 69
                Height = 13
                Caption = 'Баланс щесабы:'
              end
              object DebitBalanceCB: TDBViewComboBox
                Left = 76
                Top = 0
                Width = 86
                Height = 21
                ItemHeight = 0
                TabOrder = 0
                ListFields = 'No'
                FieldInterval = 5
                DropDownOnEnter = False
              end
            end
            object TabSheet4: TTabSheet
              Caption = 'Шяхси щесабы'
              ImageIndex = 1
              object DBText2: TDBText
                Left = 1
                Top = 22
                Width = 152
                Height = 17
                DataField = 'NAME'
              end
              object DebitAccountCB: TDBViewComboBox
                Left = 1
                Top = 0
                Width = 161
                Height = 21
                ItemHeight = 0
                TabOrder = 0
                ListFields = 'AccountNo'
                FieldInterval = 5
                DropDownOnEnter = False
              end
            end
          end
        end
        object GroupBox4: TGroupBox
          Left = 1
          Top = 116
          Width = 180
          Height = 116
          TabOrder = 1
          object Label5: TLabel
            Left = 6
            Top = 94
            Width = 33
            Height = 13
            Caption = 'Валцта:'
          end
          object CreditCurrencyCB: TDBViewComboBox
            Left = 50
            Top = 91
            Width = 125
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 0
            ListFields = 'Name'
            FieldInterval = 5
            DropDownOnEnter = False
          end
          object CheckBox1: TCheckBox
            Left = 45
            Top = 4
            Width = 129
            Height = 17
            Caption = 'Кредит щесабына эюря филтр'
            TabOrder = 1
          end
          object PageControl3: TPageControl
            Left = 3
            Top = 23
            Width = 173
            Height = 66
            ActivePage = TabSheet5
            TabOrder = 2
            object TabSheet5: TTabSheet
              Caption = 'Баланс щесабы'
              object DBText3: TDBText
                Left = 0
                Top = 22
                Width = 160
                Height = 12
                DataField = 'NAME'
                WordWrap = True
              end
              object Label6: TLabel
                Left = 0
                Top = 3
                Width = 69
                Height = 13
                Caption = 'Баланс щесабы:'
              end
              object CreditBalanceCB: TDBViewComboBox
                Left = 77
                Top = 0
                Width = 84
                Height = 21
                ItemHeight = 0
                TabOrder = 0
                ListFields = 'No'
                FieldInterval = 5
                DropDownOnEnter = False
              end
            end
            object TabSheet6: TTabSheet
              Caption = 'Шяхси щесабы'
              ImageIndex = 1
              object DBText4: TDBText
                Left = 1
                Top = 22
                Width = 65
                Height = 17
              end
              object CreditAccountCB: TDBViewComboBox
                Left = 1
                Top = 0
                Width = 161
                Height = 21
                ItemHeight = 0
                TabOrder = 0
                ListFields = 'AccountNo'
                FieldInterval = 5
                DropDownOnEnter = False
              end
            end
          end
        end
      end
      object TabSheet7: TTabSheet
        Caption = 'Мябляг'
        ImageIndex = 2
        object GroupBox8: TGroupBox
          Left = 0
          Top = 0
          Width = 181
          Height = 356
          Align = alClient
          TabOrder = 0
          object GroupBox7: TGroupBox
            Left = 2
            Top = 15
            Width = 177
            Height = 69
            Align = alTop
            TabOrder = 0
            object RadioButton3: TRadioButton
              Left = 16
              Top = 16
              Width = 113
              Height = 17
              Caption = 'Дебет мябляг'
              TabOrder = 0
            end
            object RadioButton4: TRadioButton
              Left = 16
              Top = 32
              Width = 113
              Height = 17
              Caption = 'Кредит мябляг'
              TabOrder = 1
            end
            object RadioButton5: TRadioButton
              Left = 16
              Top = 48
              Width = 113
              Height = 17
              Caption = 'Еквивалент'
              TabOrder = 2
              TabStop = True
            end
          end
          object Panel6: TPanel
            Left = 2
            Top = 105
            Width = 177
            Height = 47
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvNone
            TabOrder = 1
            object Label7: TLabel
              Left = 5
              Top = 5
              Width = 47
              Height = 13
              Caption = 'Мябляг 1:'
            end
            object Label8: TLabel
              Left = 6
              Top = 26
              Width = 47
              Height = 13
              Caption = 'Мябляг 2:'
            end
            object AmountEdit: TCurrencyEdit
              Left = 55
              Top = 2
              Width = 121
              Height = 21
              TabOrder = 0
              Text = '0'
            end
            object CurrencyEdit1: TCurrencyEdit
              Left = 55
              Top = 24
              Width = 121
              Height = 21
              TabOrder = 1
              Text = '0'
            end
          end
          object Panel7: TPanel
            Left = 2
            Top = 84
            Width = 177
            Height = 21
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object LessButton: TSpeedButton
              Left = 0
              Top = 0
              Width = 23
              Height = 22
              GroupIndex = 1
              Caption = '<='
            end
            object EqualButton: TSpeedButton
              Left = 24
              Top = 0
              Width = 23
              Height = 22
              GroupIndex = 1
              Down = True
              Caption = '='
            end
            object MoreButton: TSpeedButton
              Left = 72
              Top = 0
              Width = 23
              Height = 22
              GroupIndex = 1
              Caption = '>='
            end
            object NotEqualButton: TSpeedButton
              Left = 48
              Top = 0
              Width = 23
              Height = 22
              GroupIndex = 1
              Caption = '<>'
            end
            object SpeedButton6: TSpeedButton
              Left = 95
              Top = 0
              Width = 51
              Height = 22
              Caption = 'Арасында'
            end
          end
          object CheckBox8: TCheckBox
            Left = 79
            Top = 1
            Width = 97
            Height = 17
            Caption = 'Мяблягя гюря филтр'
            TabOrder = 3
          end
        end
      end
      object TabSheet8: TTabSheet
        Caption = 'Сыралашма'
        ImageIndex = 3
        object GroupBox9: TGroupBox
          Left = 0
          Top = 0
          Width = 181
          Height = 139
          Align = alTop
          Caption = 'Бцтцн'
          TabOrder = 0
          object ListBox1: TListBox
            Left = 2
            Top = 15
            Width = 177
            Height = 122
            Align = alClient
            ItemHeight = 13
            Items.Strings = (
              '№ - си'
              'Дебет'
              'Дебет валцтасы'
              'Кредит'
              'Кредит валцтасы'
              'Дебет мябляг'
              'Еквивалент')
            TabOrder = 0
          end
        end
        object Panel5: TPanel
          Left = 0
          Top = 139
          Width = 181
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object SpeedButton1: TSpeedButton
            Left = 57
            Top = 4
            Width = 23
            Height = 23
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800888
              88888888880B30888888888880B3B308888888880B3B3B3088888880B3B3B3B3
              0888880B3B300B3B308880B3B30000B3B3080B3B3B300B3B3B3003B3B3B003B3
              B3B0803B3B300B3B3B088803B3B003B3B08888803B300B3B0888888803B3B3B0
              88888888803B3B08888888888803B08888888888888008888888}
          end
          object SpeedButton2: TSpeedButton
            Left = 81
            Top = 4
            Width = 23
            Height = 23
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800888
              88888888880BB0888888888880BB3B08888888880BB3B3B088888880BB300B3B
              0888880BB3B003B3B08880BB3B300B3B3B080BB3B3B003B3B3B00B3B3B300B3B
              3B3080B3B30000B3B308880B3B300B3B30888880B3B3B3B3088888880B3B3B30
              8888888880B3B30888888888880B308888888888888008888888}
          end
        end
        object GroupBox10: TGroupBox
          Left = 0
          Top = 166
          Width = 181
          Height = 190
          Align = alClient
          Caption = 'Сечилмиш'
          TabOrder = 2
          object Panel10: TPanel
            Left = 152
            Top = 15
            Width = 27
            Height = 173
            Align = alRight
            BevelInner = bvLowered
            TabOrder = 0
            object SpeedButton3: TSpeedButton
              Left = 2
              Top = 2
              Width = 23
              Height = 22
              Flat = True
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800888
                88888888880BB0888888888880BB3B08888888880BB3B3B088888880BB300B3B
                0888880BB3B003B3B08880BB3B300B3B3B080BB3B3B003B3B3B00B3B3B300B3B
                3B3080B3B30000B3B308880B3B300B3B30888880B3B3B3B3088888880B3B3B30
                8888888880B3B30888888888880B308888888888888008888888}
            end
            object SpeedButton4: TSpeedButton
              Left = 2
              Top = 25
              Width = 23
              Height = 22
              Flat = True
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800888
                88888888880B30888888888880B3B308888888880B3B3B3088888880B3B3B3B3
                0888880B3B300B3B308880B3B30000B3B3080B3B3B300B3B3B3003B3B3B003B3
                B3B0803B3B300B3B3B088803B3B003B3B08888803B300B3B0888888803B3B3B0
                88888888803B3B08888888888803B08888888888888008888888}
            end
          end
          object ListBox2: TListBox
            Left = 2
            Top = 15
            Width = 150
            Height = 173
            Align = alClient
            ItemHeight = 13
            TabOrder = 1
          end
        end
      end
    end
    object ToolBar2: TToolBar
      Left = 1
      Top = 408
      Width = 189
      Height = 22
      Align = alBottom
      Caption = 'ToolBar3'
      Flat = True
      Images = ImageList1
      ShowCaptions = True
      TabOrder = 2
      object BitBtn1: TBitBtn
        Left = 0
        Top = 0
        Width = 189
        Height = 22
        Action = Action6
        Caption = 'Яввялки геймятляр'
        TabOrder = 0
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000000000001F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C0000000000000000000000000000000000001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000001F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042000000000000000010421F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
      end
    end
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 440
    Top = 304
    object TopAction: TAction
      Caption = 'Йухары'
      ImageIndex = 0
      OnExecute = TopActionExecute
    end
    object PriorAction: TAction
      Caption = 'Ютяндяки'
      ImageIndex = 1
      OnExecute = PriorActionExecute
    end
    object NextAction: TAction
      Caption = 'Сонрадаки'
      ImageIndex = 2
      OnExecute = NextActionExecute
    end
    object LastAction: TAction
      Caption = 'Ашагы'
      ImageIndex = 3
      OnExecute = LastActionExecute
    end
    object Update: TAction
      Caption = 'Йениляшдирмяк'
      ImageIndex = 4
      OnExecute = UpdateExecute
    end
    object ToggleFilterAction: TAction
      Caption = 'Filtr paneli'
      ImageIndex = 5
      OnExecute = ToggleFilterActionExecute
    end
    object PreviewAction: TAction
      Caption = 'Бахмаг'
      ImageIndex = 11
      OnExecute = PreviewActionExecute
    end
    object PrintAction: TAction
      Caption = 'Чап'
      ImageIndex = 10
      OnExecute = PrintActionExecute
    end
    object Action6: TAction
      Caption = 'Яввялки геймятляр'
      ImageIndex = 12
    end
  end
  object ImageList1: TImageList
    Left = 496
    Top = 288
    Bitmap = {
      494C01010D000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000001042
      0000000000000000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000008210000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000821000021040000
      524A000008210000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000008210000524A524A830C830C
      524AC51400000821000000000000000000000000000000001863186318631863
      1863186318631863000000000000000000000000000000001700000000000000
      0000000000000000000000000000000000000000000010421042104210421042
      1042104200001042104210420000000000000000524A524A0000F75EF75E0000
      524AC514830C0000082100000000000000000000000000000000000000000000
      0000000000000000000018630000000000000000000000001700170000000000
      0000E05EE05EE05EE05EE05E0000000000000000000000000000000000000000
      000010420000000010421042104200000000524A0000F75EF75E830C524A524A
      524A21040000C514000008210000000000000000000018631863186318631863
      007C007C007C1863186318630000000000001700170017001700170017000000
      0000000000000000000000000000E05E000000000000FF7FFF7FFF7FFF7FFF7F
      000010420000000000000000104200000000524AF75E830C524A524A524A0000
      F75EF75E00000000C51400000821000000000000000000000000000000000000
      0000000000000000000018631863000000000000000000001700170000000000
      0000FF7F0000FF7F0000FF7F0000000000000000000010001000FF7F1000FF7F
      000010420000000000000000000010420000524A524A524A524A0000744E3267
      F75E524A0000830C000021040000082100000000000018631863186318631863
      1863186318631863000000001863000000000000000000001700000000000000
      000000000000000000000000000010420000000000001000100010001000FF7F
      000010420000000000001042000010421042524A524A0000F75E3267F75E524A
      0000F75EF75EF75EC5140000830C000008210000000000000000000000000000
      0000000000000000186318630000000000000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7F00000000000000000000FF7FFF7FFF7FFF7FFF7F
      000010420000000000000000104200001042000059663267F75E524A0000F75E
      F75EFD7F0000F75EF75EC5140000210408210000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000001863000000000000000000000000000000000000
      00000000FF7F10421042FF7F000000000000000000001000100010001000FF7F
      0000104200000000104200000000000010420000F75E524A0000F75EF75E0000
      4C4A3267F27FF97FF75EF75EC514000000000000000000000000FF7F1F001F00
      1F001F001F00FF7F00000000000000000000000000000000FF7FFF7FFF7F0000
      000000000000FF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      00001042000000001042000000000000104200000000F75EF75E000021043267
      327FF97FF97F00000000F75EF75E830C00000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000FF7F0000
      00000000000000000000000000000000000000000000FF7FFF7FFF7F00000000
      000000000000000000000000000000000000000000000000F75E830C830CF97F
      F97F00002104524A0000F75E39670000000000000000000000000000FF7F1F00
      1F001F001F001F00FF7F00000000000000000000FF7FFF7FFF7F0000FF7F0000
      0000000000000000000000000000000000000000000010001000FF7F00000000
      0000000000000000000010420000000000000000000000000000F75E830C830C
      830C524A0000744E396700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F1042FF7F000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7F00000000
      00000000000000001042000000000000000000000000000000000000F75E830C
      0000744E39670000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F1042FF7F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F75E
      3967000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7F0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CE390000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000F97F0000
      000000000821993100000000CE39CE3900000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF03
      FF03FF03FF030000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000F97FF97FF97F0000
      08215F4A3F673F6700000000CE39CE39CE390000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF03
      10021002FF030000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F97FF97FF97FF97FF97FF97F
      3F673F673F673F6700000000CE39000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF03
      10021002FF030000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F97FF97FF97FF97FF97FF97F
      3F673F673F673F67000000000000000000000000000000001000104200000000
      000000000000000000000000000000000000000000000000000000000000FF03
      FF7F1863FF030000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F97FF97FF97FF97FF97FF97F
      00003F673F673F67000000000000000000000000000010421000000000000000
      000000001000100010001000100000000000000000000000000000000000FF03
      FF7F1863FF030000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F97FF97FF97FF97FF97FF97F
      F97F00003F673F67000000000000000000000000000010000000000000000000
      00000000000010001000100010000000000000000000000000000000FF031863
      186318631002FF03000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F97FF97FF97FF97FF97FF97F
      F97F8C153F673F67000000000000000000000000000010000000000000000000
      0000000000000000100010001000000000000000000000000000FF0310021863
      1863186310021002FF0300000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F97FF97FF97FF97F8C15
      8C1500003F673F67000000000000000000000000000010000000000000000000
      000000000000100000001000100000000000000000000000FF0310021863FF7F
      18631863186310021002FF030000000000000000000000000000000000000000
      00000000000000000000000000000000000000003F670000F97F8C158C150000
      5F4A3F673F673F67000000000000000000000000000010421000000000000000
      00001000100000000000000010000000000000000000FF0310021863FF7F1863
      186318631863186310021002FF03000000000000000000000000000000000000
      00000000000000000000000000000000000000003F673F678C1500005F4A3F67
      000008215F4A08215F4A0000C030000000000000000000001042100010001000
      1000000000000000000000000000000000000000FF0310021863FF7FFF7FFF7F
      1863186318631863100210021002FF0300000000000000000000000000000000
      00000000000000000000000000000000000000003F673F675F4A3F673F670821
      5F4A5F4A5F4A5F4A00007B6FC030000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF03FF03FF03FF03FF03FF03
      FF03FF03FF03FF03FF03FF03FF03FF0300000000000000000000000000000000
      00000000000000000000000000000000000000003F673F673F673F675F4A0821
      5F4A5F4A5F4A3F67C0307B6F7B6F396700000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000003F673F675F4A08215F4A5F4A
      00003F6708217B6F7B6FC0303967000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000005F4A08215F4A5F4A00000000
      000000007B6FC030396700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005F4A0000000000000000
      0000000039670000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010421042000000000000000000000000000000000000
      0000000000001042104210420000000000000000000000000000000010420000
      0000000000000000000000000000000000000000000000001042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010421042104200001042000000000000000000000000000000000000
      0000104210420000000010420000000000000000000000000000000000001042
      1042000000000000000000000000000000000000000000000000104210420000
      0000000000000000104200000000000000000000000000000000000000000000
      0000104210420000000000001042000000000000000000000000000000000000
      1042104200000000000010420000000000000000000000000000000000000000
      1042104200000000000000000000000000000000000000000000000010421042
      0000000000000000104200000000000000000000000000000000000000001042
      1042000000000000000000001042000000000000000000000000000010421042
      0000000000000000000010420000000000000000000000000000000000000000
      0000000010421042000000000000000000000000000000000000000000000000
      1042104200000000104200000000000000000000000000000000000000000000
      0000000000000000000000001042000000000000000000000000000000000000
      0000000000000000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
      0000000000000000000000001042000000000000000000000000000000000000
      0000000000000000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
      0000000000000000000000001042000000000000000000000000000000000000
      0000000000000000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
      0000000000000000000000001042000000000000000000000000000000000000
      0000000000000000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF000000000000FDFF000000000000
      F8FF000000000000F07F000000000000E03F000000000000C01F000000000000
      F07F000000000000F07F000000000000F83F000000000000FC0F000000000000
      FFFF000000000000FFFF000000000000FBFFFFFFFFFFFFFFE03FE00FFF03FFFF
      801FC007EE01C007100F8003E6008003400780030200800302038001E6548001
      08418001EE0480702100C001FF0180788440E001C103806C1201F003C181804C
      8831F00F01C18083C091F00F01FF8187E047F80701FF83CFF11FFFFF03FF83DF
      F87FFFFF07FFFFFFFDFFFFFF0FFFFFFFFFFFFFFFFFFFFFE7FFFFFFFFFFFFF181
      FFFFFC3FFFFFC000FFFFFC3FFFFF0003FFFFFC3FE7CF0007E7FFFC3FF39F0007
      CF83FC3FF93F0007DFC3F81FFC7F0007DFE3F00FFC7F0007DFD3E007F93F0007
      CF3BC003F39F0101E0FF8001E7CF0001FFFF8001FFFF0001FFFFFFFFFFFF0001
      FFFFFFFFFFFF0307FFFFFFFFFFFF8F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFF3FFC7FBFFEFFFF383FF07F8FFE3CFF303FE07F87FE1CF
      F003F807F81FE04FF003F007F80FE00FF003F007F80FE00FF303FE07F87FE1CF
      F3C3FF87F9FFE7CFF3F7FFCFFBFFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList1
    Left = 383
    Top = 260
    object N1: TMenuItem
      Action = PreviewAction
    end
    object N2: TMenuItem
      Action = PrintAction
    end
  end
end
