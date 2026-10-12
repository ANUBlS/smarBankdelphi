object FrmCashDesk: TFrmCashDesk
  Left = 0
  Top = 0
  Width = 1280
  Height = 912
  Caption = 'Cash Reports'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  OnDestroy = ActiveFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1280
    Height = 912
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 1278
      Height = 188
      Align = alTop
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object ToolBar1: TToolBar
        Left = 1
        Top = 1
        Width = 690
        Height = 98
        Align = alNone
        ButtonHeight = 36
        ButtonWidth = 76
        Caption = 'ToolBar1'
        DrawingStyle = dsGradient
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GradientEndColor = clSilver
        Images = ImageList2
        ParentFont = False
        ShowCaptions = True
        TabOrder = 0
        object TBRefresh: TToolButton
          Left = 0
          Top = 0
          Caption = '&Yenil'#601'm'#601'k'
          ImageIndex = 0
          OnClick = TBRefreshClick
        end
        object ToolButton2: TToolButton
          Left = 76
          Top = 0
          Width = 8
          Caption = 'ToolButton2'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object ToolButton13: TToolButton
          Left = 84
          Top = 0
          Caption = 'Kassa kitab'#305
          ImageIndex = 9
          OnClick = ToolButton13Click
        end
        object TBPreview: TToolButton
          Left = 160
          Top = 0
          Action = ActionSymbolReport
        end
        object ToolButton4: TToolButton
          Left = 236
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 2
          Style = tbsSeparator
          Visible = False
        end
        object TBCommon: TToolButton
          Tag = 1
          Left = 244
          Top = 0
          Caption = 'Hes. adlarla...'
          DropdownMenu = PopupMenu2
          ImageIndex = 6
          Style = tbsDropDown
          OnClick = ActionSymbolReportExecute
        end
        object ToolButton5: TToolButton
          Left = 333
          Top = 0
          Width = 8
          Caption = 'ToolButton5'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object TBIncome: TToolButton
          Left = 341
          Top = 0
          Caption = 'M'#601'd. Jurn'
          ImageIndex = 4
          OnClick = TBIncomeClick
        end
        object ToolButton8: TToolButton
          Left = 417
          Top = 0
          Width = 8
          Caption = 'ToolButton8'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object TBOutlay: TToolButton
          Tag = 1
          Left = 425
          Top = 0
          Caption = 'M'#601'x. Jurn'
          ImageIndex = 5
          OnClick = TBIncomeClick
        end
        object ToolButton11: TToolButton
          Left = 0
          Top = 0
          Width = 6
          Caption = 'ToolButton11'
          ImageIndex = 6
          Wrap = True
          Style = tbsSeparator
          Visible = False
        end
        object TBOrders: TToolButton
          Tag = 1
          Left = 0
          Top = 42
          Action = ActionOrder
        end
        object ToolButton6: TToolButton
          Left = 76
          Top = 42
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 3
          Style = tbsSeparator
          Visible = False
        end
        object TBCheck: TToolButton
          Left = 84
          Top = 42
          Action = ActionWithDraw
        end
        object ToolButton1: TToolButton
          Left = 160
          Top = 42
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 4
          Style = tbsSeparator
          Visible = False
        end
        object ToolButton9: TToolButton
          Left = 168
          Top = 42
          Action = ActionTotalReport
          DropdownMenu = PopupMenu1
          Style = tbsDropDown
        end
        object ToolButton10: TToolButton
          Left = 257
          Top = 42
          Width = 8
          Caption = 'ToolButton10'
          ImageIndex = 9
          Style = tbsSeparator
          Visible = False
        end
        object TBExtra: TToolButton
          Left = 265
          Top = 42
          Caption = #399'lav'#601
          ImageIndex = 10
          OnClick = TBExtraClick
        end
        object ToolButton7: TToolButton
          Left = 341
          Top = 42
          Width = 8
          Caption = 'ToolButton7'
          ImageIndex = 8
          Style = tbsSeparator
          Visible = False
        end
        object ToolButton3: TToolButton
          Left = 349
          Top = 42
          Action = ActionSettings
        end
        object ToolButton12: TToolButton
          Left = 425
          Top = 42
          Width = 8
          Caption = 'ToolButton12'
          ImageIndex = 9
          Style = tbsSeparator
          Visible = False
        end
      end
      object Panel7: TPanel
        Left = 1
        Top = 99
        Width = 1276
        Height = 87
        TabOrder = 1
        object GroupBox1: TGroupBox
          Left = 1
          Top = 1
          Width = 90
          Height = 85
          Align = alLeft
          Caption = 'Tarix aral'#305#287#305
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object DTPBegin: TDateTimePicker
            Left = 3
            Top = 15
            Width = 86
            Height = 21
            Date = 37483.733449687490000000
            Time = 37483.733449687490000000
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DTPEnd: TDateTimePicker
            Left = 3
            Top = 41
            Width = 86
            Height = 21
            Date = 37483.733476817100000000
            Time = 37483.733476817100000000
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
        object GroupBox2: TGroupBox
          Left = 91
          Top = 1
          Width = 130
          Height = 85
          Align = alLeft
          Caption = 'Valyuta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Label4: TLabel
            Left = 8
            Top = 44
            Width = 56
            Height = 13
            Caption = 'Balans plan'#305
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object CmbBoxCurrency1: TComboBox
            Left = 4
            Top = 17
            Width = 123
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = CBDebetFilialClick
          end
          object CmbBoxReference: TComboBox
            Left = 4
            Top = 60
            Width = 123
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Items.Strings = (
              '1 - ci hesab plan'#305
              '2 - ci hesab plan'#305
              '3 - c'#252' hesab plan'#305
              '4 - c'#252' hesab plan'#305)
          end
          object DBLCCurrency: TDBLookupComboBox
            Left = 19
            Top = 17
            Width = 106
            Height = 21
            KeyField = 'VALUTE'
            ListField = 'VALU_NAME'
            ListSource = CashDataMod.DS_Valute
            TabOrder = 2
            OnCloseUp = DBLCCurrencyCloseUp
          end
        end
        object GroupBox7: TGroupBox
          Left = 221
          Top = 1
          Width = 184
          Height = 85
          Align = alLeft
          Caption = 'Filial filteri'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object CBDebetFilial: TComboBox
            Left = 40
            Top = 17
            Width = 142
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = CBDebetFilialClick
          end
          object CBCreditFilial: TComboBox
            Left = 40
            Top = 48
            Width = 142
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = CBDebetFilialClick
          end
          object Panel5: TPanel
            Left = 3
            Top = 17
            Width = 37
            Height = 21
            Alignment = taLeftJustify
            BevelOuter = bvLowered
            Caption = 'Debet'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object Panel6: TPanel
            Left = 3
            Top = 48
            Width = 37
            Height = 21
            Alignment = taLeftJustify
            BevelOuter = bvLowered
            Caption = 'Kredit'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
        object GroupBox8: TGroupBox
          Left = 405
          Top = 1
          Width = 122
          Height = 85
          Align = alLeft
          Caption = 'Simvol'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object Label5: TLabel
            Left = 8
            Top = 37
            Width = 78
            Height = 13
            Caption = 'K'#246#231#252'rm'#601'l'#601'rin tipi'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object CBCashSymbol: TComboBox
            Left = 7
            Top = 12
            Width = 76
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = CBDebetFilialClick
          end
          object RadioButton2: TRadioButton
            Left = 6
            Top = 67
            Width = 91
            Height = 17
            Caption = 'Planla'#351'd'#305'r'#305'lm'#305#351
            TabOrder = 1
            OnClick = RadioButton2Click
          end
          object RadioButton1: TRadioButton
            Left = 6
            Top = 50
            Width = 95
            Height = 17
            Caption = 'T'#601'sdiq olunmu'#351
            TabOrder = 2
            OnClick = RadioButton1Click
          end
        end
        object RadioGroup2: TRadioGroup
          Left = 527
          Top = 1
          Width = 44
          Height = 85
          Align = alLeft
          Caption = 'Order:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 2
          Items.Strings = (
            '1'
            '2'
            '3')
          ParentFont = False
          TabOrder = 4
        end
        object GroupBox11: TGroupBox
          Left = 571
          Top = 1
          Width = 119
          Height = 85
          Align = alLeft
          Caption = 'Operator'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          object Label1: TLabel
            Left = 61
            Top = 7
            Width = 50
            Height = 13
            Caption = 'Daxil ed'#601'n'
          end
          object Label2: TLabel
            Left = 57
            Top = 41
            Width = 58
            Height = 13
            Caption = 'T'#601'sdiq ed'#601'n'
          end
          object DBLookupOperator: TDBLookupComboBox
            Left = 3
            Top = 20
            Width = 115
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = CashDataMod.DataOperator
            ParentFont = False
            TabOrder = 0
            OnClick = ActionFilterExecute
          end
          object DBLookupCommitter: TDBLookupComboBox
            Left = 3
            Top = 54
            Width = 115
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = CashDataMod.DS_Committers
            ParentFont = False
            TabOrder = 1
            OnClick = ActionFilterExecute
          end
        end
      end
    end
    object CashViewer: TDBGrid
      Left = 1
      Top = 189
      Width = 1278
      Height = 625
      Align = alClient
      DataSource = CashDataMod.DataSrcViewer
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
      PopupMenu = PopupMenu2
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnTitleClick = CashViewerTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'RecordNo'
          Title.Alignment = taRightJustify
          Title.Caption = #8470
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'DAT'
          Title.Caption = 'Tarix'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEBIT'
          Title.Caption = 'Debet'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 190
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clSilver
          Expanded = False
          FieldName = 'DEBTCURNAME'
          Title.Alignment = taCenter
          Title.Caption = '$'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KREDIT'
          Title.Caption = 'Kredit'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 190
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clSilver
          Expanded = False
          FieldName = 'CREDITCURNAME'
          Title.Alignment = taCenter
          Title.Caption = '$'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DAMMOUNT'
          Title.Alignment = taRightJustify
          Title.Caption = 'D. M'#601'bl'#601#287'i'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KAMMOUNT'
          Title.Alignment = taRightJustify
          Title.Caption = 'K. M'#601'bl'#601#287'i'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LAMMOUNT'
          Title.Alignment = taRightJustify
          Title.Caption = 'M'#601'bl'#601#287' (man.)'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 89
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clSilver
          Expanded = False
          FieldName = 'BSYMBOL'
          Title.Caption = 'Simvol'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 36
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 1
      Top = 814
      Width = 1278
      Height = 97
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object Panel4: TPanel
        Left = 2
        Top = 47
        Width = 1274
        Height = 48
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = clCream
        ParentBackground = False
        TabOrder = 0
        object ProgBar: TProgressBar
          Left = 5
          Top = 28
          Width = 361
          Height = 16
          TabOrder = 0
          Visible = False
        end
        object CBConfirm: TCheckBox
          Left = 369
          Top = 9
          Width = 251
          Height = 17
          Caption = 'Kassa simvolu d'#601'yi'#351'dikd'#601' he'#231' bir sual verm'#601
          TabOrder = 1
        end
        object CPDoRefresh: TCheckBox
          Left = 370
          Top = 29
          Width = 250
          Height = 17
          Caption = 'Kassa simvolunu d'#601'yi'#351'dikd'#601'n sonra yenil'#601
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object ASSIGNMENT: TDBEdit
          Left = 4
          Top = 3
          Width = 362
          Height = 21
          DataField = 'ASSIGNMENT'
          DataSource = CashDataMod.DataSrcViewer
          TabOrder = 3
        end
      end
      object GroupBox3: TGroupBox
        Left = 1086
        Top = 2
        Width = 95
        Height = 45
        Align = alRight
        Caption = 'Kassa simvolu'
        Color = clCream
        ParentBackground = False
        ParentColor = False
        TabOrder = 1
        object SpeedButton1: TSpeedButton
          Left = 66
          Top = 14
          Width = 21
          Height = 21
          Hint = 'Click here for Choose Cash Symbol'
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000000000000000000FF00FF00FF00FF000000000000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF000000000000000000FF00FF00FF00FF00FF00FF000000000000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton1Click
        end
        object BSymbol: TComboBox
          Left = 8
          Top = 14
          Width = 55
          Height = 22
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object GroupBox5: TGroupBox
        Left = 2
        Top = 2
        Width = 1037
        Height = 45
        Align = alClient
        Caption = 'S'#252'r'#601'tli axtar'#305#351
        Color = clCream
        ParentBackground = False
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          1037
          45)
        object DEBIT: TEdit
          Left = 4
          Top = 14
          Width = 126
          Height = 21
          TabOrder = 0
          OnChange = DEBITChange
        end
        object KREDIT: TEdit
          Left = 131
          Top = 14
          Width = 126
          Height = 21
          TabOrder = 1
          OnChange = DEBITChange
        end
        object DAMMOUNT: TEdit
          Left = 258
          Top = 14
          Width = 113
          Height = 21
          TabOrder = 2
          OnChange = DEBITChange
        end
        object KAMMOUNT: TEdit
          Left = 372
          Top = 14
          Width = 99
          Height = 21
          TabOrder = 3
          OnChange = DEBITChange
        end
        object LAMMOUNT: TEdit
          Left = 472
          Top = 14
          Width = 562
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          OnChange = DEBITChange
        end
      end
      object GroupBox9: TGroupBox
        Left = 1181
        Top = 2
        Width = 95
        Height = 45
        Align = alRight
        Caption = 'S'#601'n'#601'd '#8470
        Color = clCream
        ParentBackground = False
        ParentColor = False
        TabOrder = 3
        object SpeedButton2: TSpeedButton
          Left = 67
          Top = 16
          Width = 21
          Height = 21
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000000000000000000FF00FF00FF00FF000000000000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF000000000000000000FF00FF00FF00FF00FF00FF000000000000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          OnClick = SpeedButton2Click
        end
        object EPackNo: TEdit
          Left = 9
          Top = 16
          Width = 55
          Height = 21
          TabOrder = 0
          OnKeyPress = EPackNoKeyPress
        end
      end
      object GroupBox10: TGroupBox
        Left = 1039
        Top = 2
        Width = 47
        Height = 45
        Align = alRight
        Caption = 'Excel'
        Color = clCream
        ParentBackground = False
        ParentColor = False
        TabOrder = 4
        object SpeedButton3: TSpeedButton
          Left = 14
          Top = 16
          Width = 21
          Height = 21
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000080
            0000008000000080000000800000008000000080000000800000008000000080
            00000080000000800000008000000080000000800000FF00FF00FF00FF000080
            0000008000000080000000800000008000000080000000800000008000000080
            00000080000000800000008000000080000000800000FF00FF00FF00FF000080
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
            0000FFFFFF000080000000800000008000000080000000800000008000000080
            00000080000000800000008000000080000000800000FF00FF00FF00FF000080
            0000FFFFFF000080000000800000008000000080000000800000FFFFFF000080
            00000080000000800000FFFFFF000080000000800000FF00FF00FF00FF000080
            0000FFFFFF00FFFFFF00008000000080000000800000FFFFFF00008000000080
            00000080000000800000FFFFFF000080000000800000FF00FF00FF00FF000080
            0000FFFFFF00FFFFFF00FFFFFF0000800000FFFFFF0000800000008000000080
            0000FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000080000000800000008000000080
            0000FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
            0000FFFFFF00FFFFFF00FFFFFF00008000000080000000800000008000000080
            000000800000FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
            0000FFFFFF00FFFFFF00008000000080000000800000FFFFFF00008000000080
            00000080000000800000FFFFFF000080000000800000FF00FF00FF00FF000080
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
            0000008000000080000000800000008000000080000000800000008000000080
            00000080000000800000008000000080000000800000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          OnClick = SpeedButton3Click
        end
      end
    end
    object Memo1: TMemo
      Left = 556
      Top = 280
      Width = 185
      Height = 89
      Lines.Strings = (
        'Memo1')
      TabOrder = 3
      Visible = False
    end
  end
  object ImageList2: TImageList
    Left = 687
    Top = 130
    Bitmap = {
      494C01010B000D00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018631863
      FF7F104210420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001863186318630002
      FF7F104210421042104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000104218631863FF7F104218631863
      FF7F104210421042104210421042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001042FF7F1042FF7F10421863FF7F
      1863FF7F10421042104210421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001042FF7F10421863FF7F18631863
      186318631863FF7F104210421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000010421863FF7F1863186318631863
      18631863186318631863FF7F1042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104218631863186318631863
      1863186318631863186318631863FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042186318631863
      1863186318631863186318631042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010421863
      1863186318631863104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1042186310420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7F0000FF7F18630000000000000000000000000000000000000000
      0000000010421863000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      1863186318631863186318630000000000000000000000000000000000000000
      0000FF7FFF7FFF7F104218630000000000000000000000000000000000000000
      1863186310421863186318630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000186318631042104200000000
      0000000000000000104210421863000000000000000000000000000000001042
      FF7FFF7FE05EFF7F000018630000000000000000000000000000000010420000
      0000000010421863104210421863186300000000000000000000000000000000
      000000000000000000000000000000000000000010420000FF7FFF7FFF7FFF7F
      18631863186318631863186300000000000000000000000000001042FF7FFF7F
      E05EFF7FE05EFF7F186318630000000000000000000000001863186318631863
      18630000FF7F1042186318631042104200000000000000000000000000000000
      0000000000000000000000000000000000000000186318631042104200000000
      000000000000000010421042186300000000000000001042FF7FFF7FE05EFF7F
      E05EFF7FE05EFF7FFF7F104200000000000000001863FF7FFF7FFF7F18631042
      0000000018631042186318631863186300000000000000000000000000000000
      000000000000000000000000000000000000000010420000FF7FFF7FFF7FFF7F
      186318631863186318631863000000000000000000001042E05EFF7FE05EFF7F
      E05EFF7FE05EFF7FFF7F00000000000000001042FF7FFF7F1863104200000000
      FF7F186310421863104218631863186300000000000000000000000000000000
      0000000000000000000000000000000000000000186318631042104200000000
      000000000000000010421042186300000000000000001042E05EFF7FE05EFF7F
      E05EFF7FE05EFF7FFF7F0000000000000000000010421042104210421863FF7F
      1042104200000000000010421042186300000000000000000000000000000000
      000000000000000000000000000000000000000010420000FF7FFF7FFF7FFF7F
      186318631863186318631863000000000000000000001042E05EFF7FE05EFF7F
      E05EFF7FE05EFF7FFF7F000000000000000000000000000000001042FF7F1042
      0000000000001042104218630000104210420000000000000000000000000000
      0000000000000000000000000000000000000000186318631042104200000000
      000000000000000010421042186300000000000000001042E05EFF7FE05EFF7F
      E05EFF7FFF7FFF7FFF7F0000000000000000000000000000000000001042FF7F
      00001042104218631863FF7F0000104200000000000000000000000000000000
      000000000000000000000000000000000000000010420000FF7FFF7FFF7FFF7F
      186318631863186318631863000000000000000000001042FF7FFF7FE05EFF7F
      FF7F17001700FF7F104210420000000000000000000000000000000000001042
      000018631863FF7FFF7FFF7FFF7F000000000000000000000000000000000000
      000000000000000000000000000000000000000018631863186318631863FF7F
      FF7F18631863186318631863186300000000000000001042FF7FFF7FFF7F1700
      1700FF7F10421863000000000000000000000000000000000000000000000000
      1042FF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000104218631863186318631863
      1863FF7FFF7FFF7F18631863186300000000000000001042FF7FFF7F1700FF7F
      1042186300000000000000000000000000000000000000000000000000000000
      00001042FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042104218631863
      18631863FF7FFF7F10421042000000000000000000001042FF7FFF7F10421863
      0000000000000000000000000000000000000000000000000000000000000000
      00001042FF7FFF7FFF7FFF7FFF7F104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010421042186300000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001042FF7FFF7F10421042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010420000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001700FF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75E00000000000000000000000000000000
      00000000E07F000000000000E05EE05E00000000000000000000000000000000
      0000170017001700FF7F00000000000000000000000000420042000010420000
      0000000000000000000000000000000000000000F75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75E00000000000000000000000000000000
      E07FE05E0000E05EE05E00000000000000000000000000000000000000000000
      1700170017001700FF7F00000000000000000000000018630042004200000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000E07FE05E
      0000FF7FFF7F18630000E05EE05E000000000000000000000000000000001700
      17001700FF7F17001700FF7F0000000000000000000000421863004200421042
      0000000000000000000000000000000000000000FF7FF75EFF7FF75EFF7FF75E
      FF7FF75EFF7FF75EFF7FF75EFF7FF75E0000000000000000E07FE05E0000FF7F
      1042FF7FFF7F1863186318630000E05E000000000000FF7FFF7FFF7F17001700
      1700FF7F0000000017001700FF7F000000000000000000000042186300420000
      1042104210421042104200000000000000000000F75EFF7FF75EFF7FF75EFF7F
      F75EFF7FF75EFF7FF75EFF7F007CFF7F00000000E07FE05E000010421042FF7F
      1042FF7FFF7F18631863186318631863000000000000FF7F1042104210421700
      FF7FFF7F0000000000001700FF7F000000000000000000000000000000420042
      0042104218631863104200001042000000000000FF7FF75EFF7FF75EFF7FF75E
      FF7FF75EFF7FF75EFF7FF75EFF7FF75E0000E05E0000FF7FFF7F10421042FF7F
      1042FF7FFF7F18631863186318631863000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000001700FF7F00000000000000000000000000000042
      1042FF7F18631863186310420000000000000000000000000000000000000000
      00000000000000000000000000000000000000001042FF7FFF7F10421042FF7F
      1042FF7FFF7F18631863186318631863000000000000FF7F1042104210421042
      1042FF7F000000000000000000001700FF7F0000000000000000000000001042
      FF7F1F001F001F001F0018631042104200000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F000000000000000000001042FF7FFF7F10421042FF7F
      10420000FF7F18630000186318631863000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F000000000000000000000000170000000000000000001F000000FF7F
      18631F00186318631F00186318631F0000000000000000000000FF7F00000000
      00000000FF7F0000FF7F00000000000000000000104200001042104210420000
      10420000FF7F18630000186300001863000000000000FF7F1042104200000000
      0000FF7F000000000000000000000000000000000000000000001F000000FF7F
      18631F00FF7F1F00FF7F18631863000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000104200001042104210420000
      10420000FF7F18631863186300001863000000000000FF7FFF7FFF7FFF7F0000
      000000000000000000000000000000000000000000000000000000001F001042
      FF7F1F001F001F001863FF7F10421F0000000000000000000000FF7F00000000
      FF7F00000000000000000000000000000000000010420000FF7F104210420000
      10421042FF7F10421863186318631863000000000000FF7F1042104200000000
      0000000000000000000000000000000000000000000000000000000000000000
      1042FF7F18631863FF7F10420000000000000000000000000000FF7FFF7FFF7F
      FF7F0000FF7FFF7F00000000000000000000000010421042FF7F104210421042
      FF7F10421863FF7FFF7F104218631863000000000000FF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      00001042FF7FFF7F104200000000000000000000000000000000FF7F0000F75E
      FF7F0000FF7F000000000000000000000000000000001042FF7F104218631042
      1863FF7FFF7F10421863FF7FFF7F104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7F0000000000000000000000000000000000000000000000001042FF7F1042
      186310421863FF7FFF7F10420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000010421863104200000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFFFFF0000
      FDFFFC7FFFFF0000F8FFF01FFFFF0000F0FFC007FC7F0000E67F0001FD7F0000
      CE7F0001FD7F0000FF3F0001E10F0000FFBF0001EFEF0000FFDF8001E10F0000
      FFDFE003FD7F0000FFEFF80FFD7F0000FFF7FE3FFC7F0000FFFBFFFFFFFF0000
      FFFDFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFB7FF9FFFFFF81FFF83FE07FFFF
      C003FF03F801FFFF8001FC03E000FFFF8003F0038000FC7F8001C0030000FC7F
      8003C0030000FC7F8001C0038000E00F8003C003F000E00F8001C003F801E00F
      8003C003FC01FC7F8001C017FE01FC7F8003C05FFF00FC7FE007C17FFF00FFFF
      FFFFC5FFFF83FFFFFFFFD7FFFFCFFFFFFFFFFFFF8001FFFDFF9FFFFF0000FF00
      FF0FC3FF0000FC00FE0FC3FF0000F0008007C1FF0000C0008023E00F00000001
      8033F803000000018039FC0300008001803CFC01E0078001803EF401E0078001
      873FF403E0078001803FF801E0078001857FFC03E00F800180FFFE07E01FC001
      81FFFFFFE03FF007FFFFFFFFE07FFF1F00000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Images = ImageList2
    Left = 390
    Top = 131
    object ActionOrder: TAction
      Caption = 'Order'
      ImageIndex = 2
      OnExecute = ActionOrderExecute
      OnUpdate = ActionOrderUpdate
    end
    object ActionFilter: TAction
      OnExecute = ActionFilterExecute
    end
    object ActionTotalReport: TAction
      Tag = 1
      Caption = 'Yekun'
      ImageIndex = 8
      OnUpdate = ActionTotalReportUpdate
    end
    object ActionWithDraw: TAction
      Caption = 'Q'#601'bz'
      ImageIndex = 3
      OnExecute = ActionWithDrawExecute
      OnUpdate = ActionWithDrawUpdate
    end
    object ActionSymbolReport: TAction
      Caption = 'Hes. adlarla...'
      ImageIndex = 1
      OnExecute = ActionSymbolReportExecute
      OnUpdate = ActionSymbolReportUpdate
    end
    object ActionSettings: TAction
      Caption = 'Sazlama'
      ImageIndex = 9
      OnExecute = ActionSettingsExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 246
    Top = 130
    object N1: TMenuItem
      Caption = 'Analiz 1'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = 'Analiz 2'
      OnClick = N2Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 168
    Top = 160
    object CashBook: TMenuItem
      Caption = 'Kassa kitab'#305
      OnClick = CashBookClick
    end
  end
end
