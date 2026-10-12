object FrmTransactionsViewer: TFrmTransactionsViewer
  Left = 30
  Top = 9
  Width = 998
  Height = 688
  Caption = 'Transactions Viewer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rrr: TPanel
    Left = 0
    Top = 0
    Width = 990
    Height = 105
    Align = alTop
    TabOrder = 0
    object gb: TGroupBox
      Left = 1
      Top = 1
      Width = 148
      Height = 103
      Align = alLeft
      Caption = 'Тарих аралыьы'
      TabOrder = 0
      object DateTimePicker1: TDateTimePicker
        Left = 5
        Top = 16
        Width = 139
        Height = 21
        CalAlignment = dtaLeft
        Date = 37756.4559150694
        Time = 37756.4559150694
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
      object DateTimePicker2: TDateTimePicker
        Left = 5
        Top = 43
        Width = 139
        Height = 21
        CalAlignment = dtaLeft
        Date = 37756.4561563194
        Time = 37756.4561563194
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
      object Button4: TButton
        Left = 4
        Top = 72
        Width = 69
        Height = 25
        Caption = 'Гябул'
        Default = True
        TabOrder = 2
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 75
        Top = 72
        Width = 69
        Height = 25
        Caption = 'Филтр'
        TabOrder = 3
        OnClick = Button5Click
      end
    end
    object GroupBox1: TGroupBox
      Left = 242
      Top = 1
      Width = 747
      Height = 103
      Align = alClient
      Caption = 'Баланс Щесаблары'
      TabOrder = 1
      object Label1: TLabel
        Left = 6
        Top = 30
        Width = 29
        Height = 13
        Caption = 'Дебет'
      end
      object Label2: TLabel
        Left = 6
        Top = 79
        Width = 27
        Height = 13
        Caption = 'Кредит'
      end
      object EditDebt: TEdit
        Left = 38
        Top = 23
        Width = 291
        Height = 21
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object EditCredit: TEdit
        Left = 38
        Top = 72
        Width = 291
        Height = 21
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object RG1: TRadioGroup
        Left = 331
        Top = 16
        Width = 246
        Height = 29
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Б.Щ.'
          'С.Щ.'
          'Класс. Груп')
        TabOrder = 2
      end
      object RG2: TRadioGroup
        Left = 331
        Top = 63
        Width = 246
        Height = 31
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Б.Щ.'
          'С.Щ.'
          'Класс. Груп')
        TabOrder = 3
      end
    end
    object GroupBox3: TGroupBox
      Left = 149
      Top = 1
      Width = 93
      Height = 103
      Align = alLeft
      Caption = 'Ялавя'
      TabOrder = 2
      object Button2: TButton
        Left = 10
        Top = 72
        Width = 75
        Height = 25
        Caption = 'Excel'
        TabOrder = 0
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 10
        Top = 32
        Width = 75
        Height = 25
        Caption = 'Щесабат'
        TabOrder = 1
        OnClick = Button3Click
      end
    end
  end
  object PanelFilter: TPanel
    Left = 0
    Top = 105
    Width = 185
    Height = 556
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 185
      Height = 556
      ActivePage = TabSheetFilter
      Align = alClient
      TabOrder = 0
      object TabSheetFilter: TTabSheet
        Caption = 'Филтер'
        OnShow = TabSheetFilterShow
        object PanelF: TPanel
          Left = 0
          Top = 0
          Width = 177
          Height = 508
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Splitter1: TSplitter
            Left = 0
            Top = 299
            Width = 177
            Height = 1
            Cursor = crVSplit
            Align = alTop
            Color = clBtnFace
            ParentColor = False
          end
          object GroupBox2: TGroupBox
            Left = 0
            Top = 0
            Width = 177
            Height = 99
            Align = alTop
            Caption = 'Филтр'
            TabOrder = 0
            OnClick = ActionFilterExecute
            object Panel3: TPanel
              Left = 4
              Top = 12
              Width = 58
              Height = 21
              Alignment = taLeftJustify
              BevelOuter = bvLowered
              Caption = 'Д. Филиал'
              TabOrder = 0
              object CBDebetFilial: TCheckBox
                Tag = 2
                Left = 43
                Top = 2
                Width = 14
                Height = 17
                Caption = 'CheckBox1'
                TabOrder = 0
                OnClick = CBDebetFilialClick
              end
            end
            object Panel4: TPanel
              Left = 4
              Top = 74
              Width = 58
              Height = 21
              Alignment = taLeftJustify
              BevelOuter = bvLowered
              Caption = 'Оператор'
              TabOrder = 1
              object CBOperator: TCheckBox
                Tag = 3
                Left = 43
                Top = 2
                Width = 14
                Height = 17
                Caption = 'CBOperator'
                TabOrder = 0
                OnClick = CBDebetFilialClick
              end
            end
            object DBLookup2: TDBLookupComboBox
              Left = 63
              Top = 12
              Width = 111
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              KeyField = 'ID'
              ListField = 'NAME'
              ListSource = TransDataModule.DataDFilials
              TabOrder = 2
              OnClick = DBLookup1Click
            end
            object DBLookup3: TDBLookupComboBox
              Left = 63
              Top = 74
              Width = 111
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              KeyField = 'ID'
              ListField = 'NAME'
              ListSource = TransDataModule.DataUsers
              TabOrder = 3
              OnClick = DBLookup1Click
            end
            object Panel5: TPanel
              Left = 4
              Top = 43
              Width = 58
              Height = 21
              Alignment = taLeftJustify
              BevelOuter = bvLowered
              Caption = 'К. Филиал'
              TabOrder = 4
              object CBCreditFilial: TCheckBox
                Tag = 1
                Left = 43
                Top = 2
                Width = 14
                Height = 17
                Caption = 'CBCreditFilial'
                TabOrder = 0
                OnClick = CBDebetFilialClick
              end
            end
            object DBLookup1: TDBLookupComboBox
              Left = 63
              Top = 43
              Width = 111
              Height = 21
              KeyField = 'ID'
              ListField = 'NAME'
              ListSource = TransDataModule.DataCFilial
              TabOrder = 5
              OnClick = DBLookup1Click
            end
          end
          object CBOperationTypes: TCheckListBox
            Left = 0
            Top = 116
            Width = 177
            Height = 183
            OnClickCheck = DBLookup1Click
            Align = alTop
            Color = clBtnFace
            ItemHeight = 13
            TabOrder = 1
            OnKeyDown = CBOperationTypesKeyDown
          end
          object StaticText1: TStaticText
            Left = 0
            Top = 300
            Width = 177
            Height = 17
            Align = alTop
            Alignment = taCenter
            BorderStyle = sbsSingle
            Caption = 'Валйута филтери'
            Color = clSilver
            ParentColor = False
            TabOrder = 2
          end
          object CLBCurrency: TCheckListBox
            Left = 0
            Top = 317
            Width = 177
            Height = 191
            OnClickCheck = DBLookup1Click
            Align = alClient
            Color = clBtnFace
            ItemHeight = 13
            TabOrder = 3
            OnKeyDown = CBOperationTypesKeyDown
          end
          object StaticText2: TStaticText
            Left = 0
            Top = 99
            Width = 177
            Height = 17
            Align = alTop
            Alignment = taCenter
            BorderStyle = sbsSingle
            Caption = 'Ямялиййат типи'
            Color = clSilver
            ParentColor = False
            TabOrder = 4
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 508
          Width = 177
          Height = 20
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          object CheckBox1: TCheckBox
            Left = 4
            Top = 1
            Width = 149
            Height = 17
            Caption = 'Истифадячи сечмяк'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = CheckBox1Click
          end
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 185
    Top = 105
    Width = 805
    Height = 556
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object TransactionsViewer: TDBGrid
      Left = 0
      Top = 0
      Width = 805
      Height = 510
      Align = alClient
      DataSource = TransDataModule.DataSrcTransactions
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      OnTitleClick = TransactionsViewerTitleClick
      Columns = <
        item
          Color = clSilver
          Expanded = False
          FieldName = 'DAT'
          Title.Caption = 'Тарих'
          Title.Color = clNavy
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DBAL_CN'
          Title.Color = clNavy
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEBITOR'
          Title.Color = clNavy
          Width = 120
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clSilver
          Expanded = False
          FieldName = 'VAL_ACC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = '$'
          Title.Color = clNavy
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KBAL_CN'
          Title.Color = clNavy
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KREDITOR'
          Title.Color = clNavy
          Width = 120
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clSilver
          Expanded = False
          FieldName = 'CURRENCYID_C'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = '$'
          Title.Color = clNavy
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AMMOUNT'
          Title.Color = clNavy
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AMMOUNT_C'
          Title.Color = clNavy
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LAMMOUNT'
          Title.Color = clNavy
          Width = 100
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'USERNAME'
          Title.Alignment = taRightJustify
          Title.Caption = 'Оператор'
          Title.Color = clNavy
          Visible = False
        end>
    end
    object Panel2: TPanel
      Left = 0
      Top = 510
      Width = 805
      Height = 25
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 1
      object DBEdit1: TDBEdit
        Left = 1
        Top = 2
        Width = 802
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'NAME'
        DataSource = TransDataModule.DataSrcTransactions
        TabOrder = 0
      end
    end
    object Panel7: TPanel
      Left = 0
      Top = 535
      Width = 805
      Height = 21
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 2
      object Panel8: TPanel
        Left = 1
        Top = 1
        Width = 219
        Height = 19
        Align = alLeft
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'Дебет мябляь'
        TabOrder = 0
        object EditSumAmount: TEdit
          Left = 76
          Top = -1
          Width = 141
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel9: TPanel
        Left = 220
        Top = 1
        Width = 218
        Height = 19
        Align = alLeft
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'Кредит мябляь'
        TabOrder = 1
        object EditSumAmountC: TEdit
          Left = 75
          Top = -1
          Width = 141
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel10: TPanel
        Left = 438
        Top = 1
        Width = 204
        Height = 19
        Align = alLeft
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'Еквивалент'
        TabOrder = 2
        object EditSumLAmount: TEdit
          Left = 61
          Top = -1
          Width = 141
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  object TransactionsExporter: TExcelExporter
    ExportSource = TransDataModule.DataSrcTransactions
    SheetName = 'Transactions'
    ShowTitles = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 496
    Top = 200
  end
  object ActionList1: TActionList
    Left = 616
    Top = 184
    object ActionFilter: TAction
      Caption = 'ActionFilter'
      OnExecute = ActionFilterExecute
    end
    object ActionLoadFilters: TAction
      Caption = 'ActionLoadFilters'
      OnExecute = ActionLoadFiltersExecute
    end
  end
end
