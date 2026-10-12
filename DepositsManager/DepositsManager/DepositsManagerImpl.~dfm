object frmDepositsManager: TfrmDepositsManager
  Left = 297
  Top = 124
  Width = 1007
  Height = 584
  Caption = 'frmDepositsManager'
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
    Width = 999
    Height = 46
    Align = alTop
    AutoSize = True
    BevelInner = bvLowered
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object ToolBar: TToolBar
      Left = 2
      Top = 2
      Width = 995
      Height = 42
      ButtonHeight = 36
      ButtonWidth = 92
      Caption = 'ToolBar'
      Color = clScrollBar
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Images = ImageList
      ParentColor = False
      ParentFont = False
      ShowCaptions = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Caption = '   Йени Контракт    '
        ImageIndex = 0
        OnClick = N16Click
      end
      object ToolButton2: TToolButton
        Left = 92
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 100
        Top = 0
        Caption = 'Редактя'
        ImageIndex = 1
        OnClick = N17Click
      end
      object ToolButton4: TToolButton
        Left = 192
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton7: TToolButton
        Left = 200
        Top = 0
        Action = ActnRefresh
        ImageIndex = 3
      end
      object ToolButton8: TToolButton
        Left = 292
        Top = 0
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton14: TToolButton
        Left = 300
        Top = 0
        Caption = 'Ямялиййат'
        DropdownMenu = ActionsMenu
        ImageIndex = 7
        Style = tbsDropDown
      end
      object ToolButton6: TToolButton
        Left = 405
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object ToolButton9: TToolButton
        Left = 413
        Top = 0
        Caption = 'Сечмяляр'
        DropdownMenu = PopupMenuSettings
        ImageIndex = 5
        Style = tbsDropDown
      end
      object ToolButton10: TToolButton
        Left = 518
        Top = 0
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object TBFilteration: TToolButton
        Left = 526
        Top = 0
        Caption = 'Филтер'
        ImageIndex = 6
        Style = tbsCheck
        OnClick = TBFilterationClick
      end
    end
  end
  object FilterPanel: TPanel
    Left = 0
    Top = 46
    Width = 187
    Height = 504
    Align = alLeft
    TabOrder = 1
    Visible = False
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 185
      Height = 18
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = clNavy
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 169
        Top = 2
        Width = 13
        Height = 14
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = TBFilterationClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 19
      Width = 185
      Height = 63
      Align = alTop
      Caption = 'Валйуталар'
      TabOrder = 1
      object CBCurrency: TCheckBox
        Left = 5
        Top = 42
        Width = 170
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
        OnClick = CBCurrencyClick
      end
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 5
        Top = 16
        Width = 174
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'VALUTE'
        ListField = 'VALU_NAME'
        ListSource = DMDepositsManager.ValutesDatSrc
        TabOrder = 1
        Visible = True
        OnChange = DBLookupComboboxEh1Change
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 208
      Width = 185
      Height = 63
      Align = alTop
      Caption = 'Мцштярилярин катеэорийасы'
      TabOrder = 2
      object CBpersons: TCheckBox
        Left = 5
        Top = 41
        Width = 170
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
        OnClick = CBCurrencyClick
      end
      object DBLookupComboboxEh4: TDBLookupComboboxEh
        Left = 5
        Top = 16
        Width = 174
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'CATEGORY'
        ListSource = DMDepositsManager.CategoriesDatSrc
        TabOrder = 1
        Visible = True
        OnChange = DBLookupComboboxEh1Change
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 271
      Width = 185
      Height = 63
      Align = alTop
      Caption = 'Мцштярилярин мянсубиййяти'
      TabOrder = 3
      object CBClientType: TCheckBox
        Left = 5
        Top = 42
        Width = 170
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
        OnClick = CBCurrencyClick
      end
      object DBLookupComboboxEh5: TDBLookupComboboxEh
        Left = 5
        Top = 16
        Width = 174
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = DMDepositsManager.personsDatSrc
        TabOrder = 1
        Visible = True
        OnChange = DBLookupComboboxEh1Change
      end
    end
    object GroupBox4: TGroupBox
      Left = 1
      Top = 82
      Width = 185
      Height = 63
      Align = alTop
      Caption = 'Филиаллар'
      TabOrder = 4
      object CBFilial: TCheckBox
        Left = 5
        Top = 41
        Width = 170
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
        OnClick = CBCurrencyClick
      end
      object DBLookupComboboxEh2: TDBLookupComboboxEh
        Left = 5
        Top = 16
        Width = 174
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = DMDepositsManager.FilialsDatSrc
        TabOrder = 1
        Visible = True
        OnChange = DBLookupComboboxEh1Change
      end
    end
    object GroupBox5: TGroupBox
      Left = 1
      Top = 145
      Width = 185
      Height = 63
      Align = alTop
      Caption = 'Депозит нювляри'
      TabOrder = 5
      object CBContractType: TCheckBox
        Left = 5
        Top = 41
        Width = 170
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
        OnClick = CBCurrencyClick
      end
      object DBLookupComboboxEh3: TDBLookupComboboxEh
        Left = 5
        Top = 16
        Width = 174
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'TYPE'
        ListSource = DMDepositsManager.DepositTypesDatSrc
        TabOrder = 1
        Visible = True
        OnChange = DBLookupComboboxEh1Change
      end
    end
    object GroupBox9: TGroupBox
      Left = 1
      Top = 334
      Width = 185
      Height = 63
      Align = alTop
      Caption = 'Статусу'
      TabOrder = 6
      object LCBStatus: TComboBox
        Left = 5
        Top = 15
        Width = 177
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnChange = DBLookupComboboxEh1Change
        Items.Strings = (
          'Щесабланан'
          'Щесабланмасы дайандырылан')
      end
      object CBStatus: TCheckBox
        Left = 6
        Top = 40
        Width = 123
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 1
        OnClick = CBCurrencyClick
      end
    end
    object GroupBox7: TGroupBox
      Left = 1
      Top = 397
      Width = 185
      Height = 63
      Align = alTop
      Caption = 'Ачылма тарихиня эюря'
      TabOrder = 7
      object Label1: TLabel
        Left = 90
        Top = 16
        Width = 5
        Height = 20
        Caption = '-'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DTPOpenDate: TDateTimePicker
        Left = 5
        Top = 16
        Width = 85
        Height = 21
        CalAlignment = dtaLeft
        Date = 39334.6628898958
        Time = 39334.6628898958
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
        OnChange = DTPCloseDateChange
      end
      object DTPCloseDate: TDateTimePicker
        Left = 97
        Top = 16
        Width = 85
        Height = 21
        CalAlignment = dtaLeft
        Date = 39334.6628898958
        Time = 39334.6628898958
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
        OnChange = DTPCloseDateChange
      end
      object CBOpendat: TCheckBox
        Left = 6
        Top = 40
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 2
        OnClick = CBCurrencyClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 1
      Top = 460
      Width = 185
      Height = 36
      Align = alTop
      TabOrder = 8
      object BitBtnexp: TBitBtn
        Left = 6
        Top = 9
        Width = 75
        Height = 23
        Caption = 'Ихраж ет'
        TabOrder = 0
        OnClick = BitBtnexpClick
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
      end
    end
  end
  object PanelMain: TPanel
    Left = 187
    Top = 46
    Width = 812
    Height = 504
    Align = alClient
    TabOrder = 2
    object SearchPanel: TGroupBox
      Left = 1
      Top = 447
      Width = 810
      Height = 56
      Align = alBottom
      Caption = 'Ахтарыш Панели'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Visible = False
      object Panel4: TPanel
        Left = 2
        Top = 15
        Width = 137
        Height = 39
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object StaticText1: TStaticText
          Left = 1
          Top = 1
          Width = 135
          Height = 17
          Align = alTop
          AutoSize = False
          Caption = 'Мцгавилянин №'
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object EditContractNo: TEdit
          Left = 2
          Top = 16
          Width = 133
          Height = 21
          TabOrder = 1
          OnExit = EditContractNoExit
          OnKeyPress = EditContractNoKeyPress
        end
      end
      object Panel7: TPanel
        Left = 139
        Top = 15
        Width = 137
        Height = 39
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object StaticText2: TStaticText
          Left = 1
          Top = 1
          Width = 135
          Height = 17
          Align = alTop
          AutoSize = False
          Caption = 'Депозит Щесаб №'
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object EditContractAccNo: TEdit
          Left = 2
          Top = 16
          Width = 133
          Height = 21
          TabOrder = 1
          OnKeyPress = EditContractNoKeyPress
        end
      end
      object Panel8: TPanel
        Left = 276
        Top = 15
        Width = 137
        Height = 39
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object StaticText3: TStaticText
          Left = 1
          Top = 1
          Width = 135
          Height = 17
          Align = alTop
          AutoSize = False
          Caption = 'Фаиз Щесаб №'
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object EditInterestAccNo: TEdit
          Left = 2
          Top = 16
          Width = 133
          Height = 21
          TabOrder = 1
          OnKeyPress = EditContractNoKeyPress
        end
      end
      object Panel9: TPanel
        Left = 687
        Top = 15
        Width = 137
        Height = 39
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object StaticText4: TStaticText
          Left = 1
          Top = 1
          Width = 135
          Height = 17
          Align = alTop
          AutoSize = False
          Caption = 'Сон К/ФЭ тар.'
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object EditSTOPCALCULATIONDATE: TEdit
          Left = 2
          Top = 16
          Width = 133
          Height = 21
          TabOrder = 1
          OnKeyPress = EditContractNoKeyPress
        end
      end
      object Panel10: TPanel
        Left = 550
        Top = 15
        Width = 137
        Height = 39
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object StaticText5: TStaticText
          Left = 1
          Top = 1
          Width = 135
          Height = 17
          Align = alTop
          AutoSize = False
          Caption = 'Жари Борж'
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object EditFacticalDebt: TEdit
          Left = 2
          Top = 16
          Width = 133
          Height = 21
          TabOrder = 1
          OnKeyPress = EditContractNoKeyPress
        end
      end
      object Panel11: TPanel
        Left = 413
        Top = 15
        Width = 137
        Height = 39
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object StaticText6: TStaticText
          Left = 1
          Top = 1
          Width = 135
          Height = 17
          Align = alTop
          AutoSize = False
          Caption = 'Щесабын ады'
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object EditCustomerName: TEdit
          Left = 2
          Top = 16
          Width = 133
          Height = 21
          TabOrder = 1
          OnKeyPress = EditContractNoKeyPress
        end
      end
    end
    object MainGrid: TDBGridEh
      Left = 1
      Top = 1
      Width = 810
      Height = 446
      Align = alClient
      DataSource = DMDepositsManager.DepositsDataSrc
      FooterColor = clWindow
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Azl Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDblClickOptimizeColWidth]
      PopupMenu = LastPopupMenu
      TabOrder = 1
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = MainGridDrawColumnCell
      OnTitleBtnClick = MainGridTitleBtnClick
      Columns = <
        item
          Color = clSilver
          EditButtons = <>
          FieldName = 'CONTRACTNO'
          Footers = <>
          Title.Alignment = taCenter
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Title.TitleButton = True
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'CONTRACTACCNO'
          Footers = <>
          Title.Alignment = taCenter
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Title.TitleButton = True
          Width = 130
        end
        item
          Color = clSilver
          EditButtons = <>
          FieldName = 'VAL_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Title.TitleButton = True
          Width = 30
        end
        item
          EditButtons = <>
          FieldName = 'CUSTOMERNAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Title.TitleButton = True
          Width = 160
        end
        item
          EditButtons = <>
          FieldName = 'OPENDATE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Title.TitleButton = True
          Width = 101
        end
        item
          EditButtons = <>
          FieldName = 'CLOSEDATE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Title.TitleButton = True
          Width = 101
        end
        item
          EditButtons = <>
          FieldName = 'AMOUNT'
          Footers = <>
          Title.Alignment = taCenter
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Title.TitleButton = True
          Width = 103
        end
        item
          Color = clSilver
          EditButtons = <>
          FieldName = 'INTEREST'
          Footers = <>
          Title.Alignment = taCenter
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'FACTICALDEBT'
          Footers = <>
          Title.Alignment = taCenter
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Title.TitleButton = True
          Width = 103
        end
        item
          EditButtons = <>
          FieldName = 'FACTICALINTERESTDEBT'
          Footers = <>
          Title.Alignment = taCenter
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Title.TitleButton = True
          Width = 103
        end
        item
          EditButtons = <>
          FieldName = 'STOPCALCULATIONDATE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Title.TitleButton = True
          Width = 137
        end>
    end
  end
  object ImageList: TImageList
    Left = 280
    Top = 304
    Bitmap = {
      494C01011A001D00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000808080000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008080
      800080808000FFFFFF000000000000000000C0C0C000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF0000000000FFFFFF00FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000FFFFFF00FFFF
      FF0000008000FFFFFF0000000000000000000000000080808000808080000000
      00000000000000000000FFFFFF0000000000C0C0C000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000FFFFFF000000
      FF000000FF000000FF0000000000000000000000000080808000000000000000
      00000000000000000000FFFFFF0000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000808080000000000000000000FFFF
      FF00000080000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000C0C0C00080000000FF0000008080
      000080800000FF0000008080000080800000FF0000008080000080800000FF00
      00008080000080800000FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000FFFFFF00FFFFFF000000000000000000C0C0C00080000000FF0000008080
      000080800000FF0000008080000080800000FF0000008080000080800000FF00
      00008080000080800000FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      000000000000FFFFFF000000000000000000C0C0C00080000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000808080008080800000000000808080008080800000000000000000000000
      000000000000FFFFFF000000000000000000C0C0C00080000000FF0000008080
      000080800000FF000000FFFFFF00FFFFFF00FF0000008080000080800000FF00
      00008080000080800000FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      800000000000000000008080800000000000000000000000000000000000C0C0
      C00000000000000000000000000000000000C0C0C00080000000FF0000008080
      0000FFFFFF00FF000000FFFFFF0080800000FF0000008080000080800000FFFF
      FF008080000080800000FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FF000000FF00000000FFFF00FF0000000000
      000000000000FFFFFF000000000000000000C0C0C00080000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000000000FFFFFF000000000000000000C0C0C00080000000FF0000008080
      000080800000FFFFFF008080000080800000FF0000008080000080800000FF00
      00008080000080800000FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FF000000FF000000FF000000FF0000000000
      000000000000FFFFFF000000000000000000C0C0C00080000000FF0000008080
      000080800000FFFFFF008080000080800000FF0000008080000080800000FF00
      00008080000080800000FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000C0C0C00080000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000C0C0C00080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C0C0
      C00000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000080800000FF
      FF00008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C0C0
      C0000000000000000000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF000080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF008080
      800000000000FFFFFF00C0C0C000000000000000000000000000000000000000
      0000000000000000000080808000FFFFFF0000000000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000000000008080800000000000000000000000000000000000FFFF
      FF0000FFFF000080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF008080
      800000000000FFFFFF0000000000000000000000800000008000000000000000
      0000FFFFFF0080808000FFFFFF0080808000FFFFFF0000000000C0C0C0000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00008080000000000000000000808080000000000080808000FF000000FF00
      0000808080008080800080808000000000000000000000000000000000000000
      0000C0C0C000808080008080800000000000808080000000000000000000FFFF
      FF0000FFFF000080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00808080008080
      800000000000FFFFFF000000000000000000000080000000800000000000FFFF
      FF0080808000FFFFFF0080808000C0C0C000C0C0C000FFFFFF0000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000080
      80000080800000000000FFFFFF0000FFFF00FFFFFF00FFFFFF00008080000080
      800000808000FFFFFF0000000000000000000000000000000000C0C0C0008080
      8000C0C0C000808080008080800000000000808080000000000000000000FFFF
      FF0000FFFF0000808000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF00000000000000000000000000FFFFFF00FFFFFF008080
      8000FFFFFF00FFFFFF000000000000000000000080000000800000000000FFFF
      FF00FFFFFF0080808000FFFFFF00C0C0C00080800000C0C0C000FFFFFF000000
      0000C0C0C00000000000000000000000000000000000000000000080800000FF
      FF000080800000000000FFFFFF00FFFFFF00FFFFFF0000808000C0C0C000C0C0
      C00000808000C0C0C00080808000000000000000000080808000C0C0C0008080
      8000C0C0C000808080008080800000000000808080000000000000000000FFFF
      FF0000FFFF0000FFFF00000000000000000000000000FFFFFF0000000000FFFF
      FF00000000008080800000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000080000000800000000000FFFF
      FF00FFFFFF00C0C0C00000000000000000000000000000000000C0C0C000FFFF
      FF0000000000C0C0C0000000000000000000000000000000000000000000FFFF
      FF000080800000000000FFFFFF0000FFFF00FFFFFF000080800000808000C0C0
      C00000808000FFFFFF0080808000000000000000000080808000C0C0C0008080
      8000C0C0C000808080008080800000000000808080000000000000FFFF0000FF
      FF00FFFFFF00FFFFFF0000FFFF000000000000000000FFFFFF0000000000FFFF
      FF00000000008080800000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000080000000800000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008080
      8000FFFFFF0000000000C0C0C000000000000000000000000000FFFFFF0000FF
      FF0000FFFF0000808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00008080000080
      8000FFFFFF00FFFFFF0000000000000000000000000080808000C0C0C0008080
      8000C0C0C0008080800080808000000000008080800000000000000000000080
      80000080800000808000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000008080800000000000008000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000000008080
      800080808000FFFFFF00FFFFFF00FFFFFF00808080008080800080808000FFFF
      FF0080808000C0C0C000808080000000000000000000FFFFFF0000FFFF008080
      80008080800000FFFF0000808000FFFFFF00FF000000FFFFFF0000FFFF00FFFF
      FF00FF00000000FFFF0080808000000000000000000080808000C0C0C0008080
      8000C0C0C0008080800080808000000000008080800000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000008080800000000000008000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000000000000
      0000000000008080800080808000808080000000000080808000FFFFFF008080
      8000C0C0C0008080800000000000000000000080800000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000000000FF000000FFFFFF00FFFFFF00FF00
      0000FF00000000FFFF0000000000000000000000000080808000C0C0C0008080
      8000C0C0C00080808000FFFFFF00000000008080800000000000000000000000
      0000FFFFFF0000808000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000008080800000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000808080000000000000000000000000000080800000FFFF0000FFFF008080
      8000FFFFFF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000000000000000000080808000C0C0C0008080
      800080800000C0C0C000C0C0C000C0C0C000FFFFFF0000000000000000000000
      0000FFFFFF000080800000000000000000000000000080808000FFFFFF008080
      80008080800080808000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF008080
      80008080800000FFFF0000808000808080008080800080808000808080008080
      8000808080000000000080808000000000000000000080808000FFFFFF00C0C0
      C000FFFFFF0080800000FFFFFF00808080000000000000000000000000000000
      0000FFFFFF000080800000000000000000000000000080808000808080008080
      8000FFFFFF0080808000FFFFFF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF00C0C0
      C000FFFFFF008080800000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF0000000000000000000000000080808000FFFFFF008080
      80000000FF00FFFFFF00FFFFFF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000080
      800000FFFF00FFFFFF0000808000000000000000000000000000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00008000000080
      000000800000008000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8D0D400C8D0D400C8D0D400C8D0
      D40080808000C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D40080808000C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D400BFBFBF0000FE000000FE000000FE
      000000FE000000FE000000FE000000FE000000FE000000FE000000FE000000FE
      000000FE000000FE000000FE00000000FF00FFFFFF00FFFFFF00FFFFFF000080
      00000080000000800000008000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8D0D400C8D0D400C8D0D400FFFF
      000080808000C8D0D40000000000C8D0D400C8D0D40000000000C8D0D4000000
      0000C8D0D400C8D0D40000000000C8D0D400C8D0D400C8D0D400C8D0D400FFFF
      000080808000C8D0D40000000000C8D0D400C8D0D40000000000C8D0D4000000
      0000C8D0D400C8D0D40000000000C8D0D400BFBFBF00BFBFBF0000FE000000FE
      000000FE000000FE000000FE000000FE000000FE000000FE000000FE000000FE
      000000FE000000FE00000000FF0000000000FFFFFF00FFFFFF00FFFFFF000080
      0000008000000080000000800000008000000080000000800000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00C8D0D400C8D0D400FFFF00008080
      0000C8D0D400FFFFFF0000000000C8D0D400C8D0D400C8D0D400C8D0D4000000
      0000FFFFFF00C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400FFFF00008080
      0000C8D0D400FFFFFF0000000000C8D0D400C8D0D400C8D0D400C8D0D4000000
      0000FFFFFF00C8D0D400C8D0D400C8D0D400BFBFBF00BFBFBF0000FE00000000
      0000007F000000FE000000FE000000FE000000FE000000FE000000FE000000FE
      000000FE00000000FF0000FE000000000000FFFFFF00FFFFFF00008000000080
      0000008000000080000000800000008000000080000000800000FFFFFF000080
      00000000000000000000FFFFFF00FFFFFF00C8D0D400FFFF00008080000000FF
      000000000000000000008080000080808000C8D0D40000000000C8D0D4000000
      0000C8D0D400FFFFFF00C8D0D400C8D0D400C8D0D400FFFF00008080000000FF
      000000000000000000008080000080808000C8D0D40000000000C8D0D4000000
      0000C8D0D400FFFFFF00C8D0D400C8D0D400BFBFBF00BFBFBF0000FE000000FE
      000000000000007F000000FE000000FE000000FE000000FE000000FE000000FE
      00000000FF0000FE000000FE000000000000FFFFFF0000800000008000000080
      000000800000FFFFFF00FFFFFF00FFFFFF00008000000080000000800000FFFF
      FF000080000000000000FFFFFF00FFFFFF00FFFF00008080000000FF000000FF
      000000FF000000FF000000FF0000FFFF000080808000C8D0D400C8D0D400C8D0
      D4000000000000000000C8D0D400C8D0D400FFFF00008080000000FF000000FF
      000000FF000000FF000000FF0000FFFF000080808000C8D0D400C8D0D400C8D0
      D4000000000000000000C8D0D400C8D0D400BFBFBF00BFBFBF0000FE00000000
      0000007F0000007F0000007F0000007F0000007F0000007F000000FE00000000
      FF0000FE000000FE000000FE000000000000FFFFFF0000800000008000000080
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00008000000080000000800000FFFF
      FF000080000000000000FFFFFF00FFFFFF00C8D0D400FFFF000000FF000000FF
      000000FF000000FF000000FF000000FF0000FFFF000080808000C8D0D400C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400FFFF000000FF000000FF
      000000FF000000FF000000FF000000FF0000FFFF000080808000C8D0D400C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D400BFBFBF00BFBFBF0000FE00000000
      0000007F0000007F0000007F0000007F0000007F0000007F00000000FF0000FE
      000000FE000000FE000000FE000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008000000080000000800000FFFF
      FF000000000000000000FFFFFF00FFFFFF000000000080800000FFFF000000FF
      000000FF00008080000000FF00008080000000FF0000FFFF000080808000C8D0
      D40000000000C8D0D40000000000C8D0D4000000000080800000FFFF000000FF
      000000FF00008080000000FF00008080000000FF0000FFFF000080808000C8D0
      D40000000000C8D0D40000000000C8D0D400BFBFBF00BFBFBF0000FE000000FE
      000000000000000000000000000000000000000000000000FF00007F0000BFBF
      BF0000FE000000FE000000FE000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000080000000800000008000000080000000800000008000000080
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000FF0000C8D0D400FFFF
      000000FF0000808000008080000000FF000000FF000000FF0000FFFF00008080
      800000000000C8D0D40000000000C8D0D4000000000000FF0000C8D0D400FFFF
      000000FF0000808000008080000000FF000000FF000000FF0000FFFF00008080
      800000000000C8D0D40000000000C8D0D400BFBFBF00BFBFBF0000FE000000FE
      000000FE000000FE000000FE000000FE00000000FF0000000000007F0000007F
      000000FE000000FE000000FE000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000800000FFFFFF0000800000008000000080000000800000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8D0D40000000000808000008080
      0000FFFF000000FF0000808000008080000000FF000000FF000000FF0000FFFF
      000080808000C8D0D400C8D0D400C8D0D400C8D0D40000000000808000008080
      0000FFFF000000FF0000808000008080000000FF000000FF000000FF0000FFFF
      000080808000C8D0D400C8D0D400C8D0D400BFBFBF00BFBFBF0000FE000000FE
      000000FE000000FE0000007F00000000FF00007F0000007F0000007F0000007F
      000000FE000000FE000000FE000000000000FFFFFF00FFFFFF00FFFFFF000080
      0000FFFFFF000080000000800000008000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00C8D0D400C8D0D400000000008080
      0000C8D0D400FFFF000000FF000000FF000000FF00008080000000FF00008080
      0000FFFF000080808000C8D0D400C8D0D400C8D0D400C8D0D400000000008080
      0000C8D0D400FFFF000000FF000000FF000000FF00008080000000FF00008080
      0000FFFF000080808000C8D0D400C8D0D400BFBFBF00BFBFBF0000FE000000FE
      000000FE0000000000000000FF00007F0000007F0000007F0000007F000000FE
      000000FE000000FE000000FE000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00008000000000000000000000FFFFFF00FFFFFF00FFFFFF000080
      0000008000000080000000000000FFFFFF00C8D0D400C8D0D400C8D0D4000000
      000080800000C8D0D400FFFF000000FF000000FF000000FF000080800000FFFF
      000080808000C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D4000000
      000080800000C8D0D400FFFF000000FF000000FF000000FF000080800000FFFF
      000080808000C8D0D400C8D0D400C8D0D400BFBFBF00BFBFBF0000FE000000FE
      000000FE00000000FF00007F0000007F000000FE000000FE000000FE000000FE
      000000FE000000FE000000FE000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00008000000000000000000000FFFFFF00FFFFFF00008000000080
      0000008000000080000000000000FFFFFF00C8D0D40000FFFF0000FFFF00C8D0
      D4000000000080800000C8D0D400FFFF00008080000080800000FFFF00008080
      00000000000080808000C8D0D400C8D0D400C8D0D40000FFFF0000FFFF00C8D0
      D4000000000080800000C8D0D400FFFF00008080000080800000FFFF00008080
      00000000000080808000C8D0D400C8D0D400BFBFBF00BFBFBF0000FE000000FE
      00000000FF0000FE000000000000007F0000007F0000007F0000007F0000007F
      0000007F000000FE000000FE000000000000FFFFFF00FFFFFF00FFFFFF000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000000000000000000FFFFFF000000000000FFFF0000FFFF000000
      0000C8D0D400000000008080000080800000FFFF0000FFFF0000808000008080
      000000000000C8D0D400C8D0D400C8D0D4000000000000FFFF0000FFFF000000
      0000C8D0D400000000008080000080800000FFFF0000FFFF0000808000008080
      000000000000C8D0D400C8D0D400C8D0D400BFBFBF00BFBFBF0000FE00000000
      FF0000FE000000FE000000FE00007F7F7F000000000000000000000000000000
      00000000000000FE000000FE000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000080000000800000008000000080000000800000008000000080
      00000000000000000000FFFFFF00FFFFFF00C8D0D40000FFFF0000FFFF00C8D0
      D400C8D0D400C8D0D4000000000080800000C8D0D40080800000808000000000
      0000C8D0D400C8D0D400C8D0D400C8D0D400C8D0D40000FFFF0000FFFF00C8D0
      D400C8D0D400C8D0D4000000000080800000C8D0D40080800000808000000000
      0000C8D0D400C8D0D400C8D0D400C8D0D400BFBFBF00BFBFBF000000FF00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE0000000000007F
      0000FEFEFE00FEFEFE0000FE000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080000000800000008000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00C8D0D400C8D0D400C8D0D4000000
      0000C8D0D40000000000C8D0D4000000000000FF00008080000000000000C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D4000000
      0000C8D0D40000000000C8D0D4000000000000FF00008080000000000000C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D400BFBFBF000000FF00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE000000
      0000007F0000FEFEFE0000FE000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000008000000080
      00000000000000000000FFFFFF00FFFFFF00C8D0D400C8D0D400C8D0D4000000
      0000C8D0D40000000000C8D0D400C8D0D4000000000000000000C8D0D400C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D4000000
      0000C8D0D40000000000C8D0D400C8D0D4000000000000000000C8D0D400C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D4000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFE6E600CBA8A800BD939300BB8B8600BC919100CFB2B100E3D5
      D400F1E8E700F5EFEF0000000000000000000000000000000000000000008080
      8000000000000000000080808000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B0756600FFFBE400FFFFFF00EACDAC00F5EDEE00FFFFFF00FFFF
      FF00D3BBB300F1E1D200E4CDBD00B8888400000000000000000000000000C0C0
      C0008080800000000000FFFFFF0080808000C0C0C00000000000000000008080
      800080808000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      000000000000B0786A00FFEBD500FFFCF600E4BF9F00EADDCF00FFF0E400926A
      89000000EE00795B8E00FFFEFF00D2B5B400808080000000000080808000FFFF
      FF00C0C0C000C0C0C000C0C0C000FFFFFF0080808000C0C0C000FFFFFF00FFFF
      FF00FFFFFF000000000080808000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      000000000000B5786D00FFF2DC00FFFEF600E0C1A100EEC7AE00FCD8BA00C498
      86000300EA005E398300FFF8E600D1B3AB000000000080808000FFFFFF008080
      800000000000C0C0C000C0C0C000C0C0C000FFFFFF0080808000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF0000000000000000000000000000000000D9E2
      D00088AD71009C6C51009E5A55007D363400BD8B7600B97A6900A66B6000C18A
      7100CD936500E0B79600EEC2A400D1A9980000000000C0C0C000C0C0C0000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF0080808000C0C0
      C000C0C0C000C0C0C000FFFFFF00000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF0000000000C0CFB20081A96500B1E3A600CAFC
      C700C7FFCD00A7775B00E5CDBF00D1B6B300E6C9A600FCF1E400FFF4EB00FFEC
      E200FFE3D100FCE0CD00BC888100CE9E92000000000000000000FFFFFF00C0C0
      C000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000080008080
      8000C0C0C000C0C0C00000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000009DD08D00BFF0B800C3F4BF00C6FA
      C500B3E9A8009E735500FEF5EC00EBDFDE00DEBB9900F9E4DC00F7EDE900FBF7
      F500FEFCFC00FFFFFF00FFFFFF00D6BBBB0000000000FFFFFF0000000000FFFF
      FF00C0C0C000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000000080008080
      800080808000C0C0C00000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF000000000072A15400B4E6AC009BCD8A00A0D9
      9800B2E3AE008CD98A00A37E68008A4B40007B241D0093433B00B7715200DA94
      7A00C6907A00E6BAA000ECC8B200C6A2A00000000000FFFFFF00FFFFFF000000
      0000C0C0C000FFFFFF00FFFFFF000000000000008000C0C0C000C0C0C000C0C0
      C000FFFFFF008080800000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000008000800080008000800080008000
      800080008000800080008000800080008000C0C0C00080808000C0C0C000FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000008EAB7300A4D797009BD08D00A0D3
      93009FD79400D0FED6008DCE7E00B4F9B3009FEA9800B1EFB90081A086008F9E
      8900A2979800EFE7E700F8F4F4000000000000000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000000080000000800080808000C0C0C000C0C0C000C0C0
      C000C0C0C000FFFFFF0000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000080008000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800080000080000080000000800000008080
      800000FFFF00FFFFFF0000FFFF0000000000E9EEE50079AF5F0078AA6000ACE3
      A500C8FEC80096C58600C3FFCB00A7E29D0097CF880088BC710083B67000DEDE
      DE00F4F4F400000000000000000000000000FFFFFF00FFFFFF00C0C0C000FFFF
      FF00FFFFFF00000000000000FF0080808000FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000FFFFFF00000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000800080008000800000008000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080008000008000008000000000FF00000080
      000000FFFF00FFFFFF0000FFFF00000000000000000046791A00A8DF9E00B8EF
      B300BBF5BA007AB16200C7FFCD00ACE6A40089BD76008DC2790079A05E000000
      000000000000000000000000000000000000FFFFFF00FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      C000C0C0C000C0C0C000FFFFFF00000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000080008000FFFFFF0080008000FFFF
      FF008000800080008000FFFFFF0080008000FF000000FF000000800000000080
      000000FFFF00FFFFFF0000FFFF000000000000000000FCFDFC0090C27B00B0E5
      A90071A55500BFF7BE00BAF5B700BAF2B600B9F0B50094C98300E7ECE3000000
      000000000000000000000000000000000000FFFFFF00FF000000FF000000FF00
      0000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFF
      FF00C0C0C000C0C0C00000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000080008000FFFFFF00800080008000
      800080008000FFFFFF00FFFFFF008000800000FF000000800000FF0000008000
      000000FFFF00FFFFFF0000FFFF00000000000000000000000000E2E9DD008DBF
      770071A35600B5EFB000A8E19E0071A55500AFE6A80066994500000000000000
      000000000000000000000000000000000000FFFFFF00FF000000FF000000FF00
      0000FFFFFF00C0C0C000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C00000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C00000000000000000000000000080008000FFFFFF00FFFFFF008000
      80008000800080008000FFFFFF00800080008080800000FF000000800000FFFF
      FF0000FFFF00FFFFFF0000FFFF0000000000000000000000000000000000BCCC
      AD007CAF6100A3D89900ACE0A200A7DA990097CA8700AFC39E00000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FF000000FF00
      0000FFFFFF000000000080808000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00C0C0C0000000000000000000000000000000000080808000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF00C0C0
      C0000000000000000000000000000000000080008000FFFFFF00FFFFFF008000
      80008000800080008000FFFFFF008000800000FFFF00FFFFFF0000FFFF00FFFF
      FF0080808000FFFFFF0080808000000000000000000000000000000000000000
      00008CA96F00CCD8C200699B49008DBF77006A9D490000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF008080
      8000808080008080800000000000808080008080800080808000808080000000
      0000000000000000000000000000000000008000800080008000800080008000
      80008000800080008000800080008000800000FFFF00FFFFFF0000FFFF00FFFF
      FF00808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000D7E1CF007397500000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000000000008080800080808000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF00808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A3D5A300A3D5A300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003939390042424200424242000000
      000000000000000000000000000000000000000000000000000000000000A3D5
      A300A3D5A300CCEECC00D0EDD000A3D5A300F7F6EC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000BD000000
      0000000000008484840084848400000000000000FF000000BD00000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000021212100393939000000000042424200424242000000
      0000000000000000000000000000000000000000000000000000A3D5A300BCE7
      BC00E6FFE500BDE4BD00E6FFE500D4F0CF00A3D5A30080828000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF000000
      000000000000000000000000000000000000000000000000FF000000BD000000
      BD000000000000000000848484000000FF000000BD000000BD00000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000424242006363630042424200ADADAD000000000042424200848484008484
      84004242420000000000000000000000000000000000A3D5A300BDECBD00E6FF
      E500B7E2B70095CA9400B8DFB800E6FFE500D4F0CF008082800015B1EC0061E9
      FF00000000000000000000000000000000000000000000000000000000008484
      840000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000FF000000BD000000
      BD000000BD00000000000000FF000000BD000000BD000000BD000000BD000000
      0000000000000000000000000000000000000000000000000000000000002121
      21006B6B6B00ADADAD00000000000000000000000000ADADAD006B6B6B004242
      420084848400636363000000000000000000A3D5A300BAF0BA00E6FFE500B2E0
      B20095CA9400C2E5C20095CA9400B8E1B200E6FFE500808280001C99DA0022A5
      E40036D9FF0000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FF
      FF000000000000000000000000000000000000000000000000000000BD000000
      BD000000BD000000BD000000BD000000BD000000BD000000BD000000BD000000
      000000000000000000000000000000000000000000000000000039393900EFEF
      EF0000000000000000000000000000000000000000000000000000000000EFEF
      EF005A5A5A00848484006363630000000000A3D5A300E6FFE500ABDEAB0095CA
      9400C6EFC600ECFFEC00E8F9E80095CA9400B8E1B2008082800055BEED003D98
      DD006EC7D600A3D5A300000000000000000000000000000000000000000000FF
      FF000000000000FFFF0000FFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FF
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000BD000000BD000000BD000000BD000000BD000000BD00000000000000
      000000000000000000000000000000000000000000005A5A5A00000000000000
      00000000000000000000EFADAD00FF000000EFADAD0000000000000000000000
      0000000000005A5A5A008484840042424200A3D5A300AEE2AE0095CA9400D1F9
      D100F1FFF100F5FFF500EFFFEF00F4FFE70095CA940080828000C8FCFF0055BE
      ED0078DFE700D4F0D2009FCF9D000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000BD000000BD000000BD000000BD0000000000848484000000
      00000000000000000000000000000000000042424200EFEFEF00000000000000
      00000000000000000000EFADAD00FF000000EFADAD0000000000000000000000
      000000000000EFEFEF004242420084848400A3D5A30095CA9400D1FFD100EDFF
      EE0088B4870096C69500FFFFF900FFFFF90080828000B2F0FC00FFFDFF00C8FC
      FF0078DFE700CCEACB00D4F0D2009FD09F000000000000000000000000008484
      84008484840000FFFF0000FFFF0000FF0000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000BD000000BD000000BD000000BD0000000000848484008484
      840000000000000000000000000000000000ADADAD0000000000000000000000
      0000000000000000000000000000FF7B7B000000000000000000000000000000
      000000000000000000006B6B6B008484840095CA9400D2FFD100D4FFD300E6FF
      E500CEF1CA00E6FFE500FFFFF9008082800079EDFF00B6FCFF00E0FFFF000000
      000078DFE700E6FFE500CCEACB00A1D0A1000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000BD000000BD000000BD000000BD0000000000848484008484
      840000000000000000000000000000000000BDBDBD0000000000000000000000
      0000000000000000000000000000FF000000EFADAD0000000000000000000000
      000000000000000000007B7B7B00848484000000000095CA940095CA9400DDFF
      CD00E6FFE500FFFFF9008082800037E7FF0061E4FF008CEAFF00B4F2FF00C8FC
      FF0078DFE700D3EDD200E6FFE500A2D2A2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000BD000000BD000000FF000000FF000000BD000000BD00000000008484
      840084848400848484000000000000000000BDBDBD0000000000000000000000
      000000000000EFADAD00EFADAD00EF6B6B00FF000000FFBDBD00000000000000
      000000000000000000007B7B7B006363630000000000000000000000000095CA
      940095CA94008082800000CDFF0011D3FF0049DDFF005CDFFF0066E3FF0096EB
      FF00F6FDF60095CA9400D3EDD2009CCF9C000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF0000FFFF
      00000000000000000000000000000000000000000000000000000000FF000000
      BD000000BD000000BD00848484000000FF000000FF000000BD00000000000000
      0000848484008484840000000000000000007373730000000000000000000000
      000000000000FF000000FF000000EFEFEF00FF000000FF000000000000000000
      0000000000000000000052525200212121000000000000000000000000000000
      00009EE9FF0034DCFF0025D2FF0000CBFF0005D3FF0050E0FF00DBFAFD00F6FD
      F600DAE9CB00F7FEF40095CA94009DD19D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      BD000000BD000000BD0000000000000000000000FF000000FF000000BD000000
      00000000000084848400848484000000000021212100CECECE00000000000000
      000000000000EF313100EFEFEF00FFBDBD00FF000000EF313100000000000000
      000000000000ADADAD0000000000000000000000000000000000000000000000
      000000000000000000007DE3FF002BD7FF0060DCE900DBFAFD00000000000000
      00000000000095CA940095CA9400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000BD000000
      BD000000BD000000BD000000000000000000000000000000FF000000BD000000
      BD00000000008484840084848400000000000000000021212100DEDEDE000000
      000000000000EFEFEF00FF7B7B00FF7B7B00FF7B7B00EFEFEF00000000000000
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FAFDFB0095CA9400E4F3DB00F6FD
      F60098CB98000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF0000000000000000000000000000000000000000000000FF000000
      FF000000BD00000000000000000000000000000000000000000021212100ADAD
      AD00EFEFEF000000000000000000000000000000000000000000EFEFEF00ADAD
      AD00212121000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000095CA940095CA
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00004242420073737300BDBDBD00BDBDBD00BDBDBD0073737300424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C6008484840084848400C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C60084848400C6C6C600C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C6008484
      8400FFFFFF00FFFFFF008484840084848400C6C6C600C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60084848400C6C6C600C6C6C60084848400C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00BD000000BD000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6008484
      8400FFFFFF0084848400C6C6C600FFFFFF008484840000000000C6C6C600C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C60084848400C6C6C600C6C6C600C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00BD000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000084848400000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000FFFFFF008484
      8400C6C6C600FFFFFF00FFFFFF00FFFFFF0084848400C6C6C600848484000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600C6C6C60084848400C6C6C600C6C6C600848484000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0084848400FFFFFF008484840000000000C6C6C600C6C6
      C600C6C6C60000000000C6C6C600C6C6C6000000000084848400C6C6C6000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000C6C6C600FFFF
      FF00FFFFFF00FFFFFF0084848400C6C6C60000000000C6C6C60084848400C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000C6C6C60084848400C6C6C600C6C6C60084848400C6C6C600848484000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF0000FFFF00BD000000FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000084848400848484000000000000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF0084848400C6C6C600FFFFFF00FFFFFF00C6C6C6008484840000000000C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C60084848400C6C6C600C6C6C600C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00FFFFFF00BD000000FFFFFF00FFFFFF00FF00
      0000848484000000000000000000000000000000000000000000000000008484
      8400FFFFFF00000000008484840000FFFF0000FFFF0000FFFF0000FFFF000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60084848400C6C6C6008484
      8400000000000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600C6C6C60084848400C6C6C600C6C6C600848484000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF0084848400FFFFFF00FFFFFF00BD000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FF0000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF008484840000000000C6C6C6000000000084848400C6C6C6008484
      8400C6C6C6000000000000000000000000000000000000000000000000000000
      0000C6C6C60084848400C6C6C600C6C6C600FFFFFF00C6C6C600848484000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF00FFFFFF00BD000000FFFFFF00BD000000FFFFFF00FFFF
      FF00BD000000FF00000000000000000000000000000000000000000000000000
      000000000000FFFFFF0084848400848484000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      840000000000C6C6C600000000000000FF00C6C6C600C6C6C600000000008484
      8400C6C6C6000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600FFFFFF00FFFF0000FFFF0000C6C6C600848484000000
      00000000000000000000000000000000000084848400FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00BD000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF00FF000000000000000000000000000000000000000000
      00000000000084848400FFFFFF008484840000FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000FF0000FFFF000000FF00C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600FFFF0000FFFF0000FFFF0000FFFF0000C6C6C600848484000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00BD000000FFFFFF00000000000000
      00000000000000000000FFFFFF00BD0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      FF0000FFFF000000FF0084848400C6C6C60084848400C6C6C600C6C6C600C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600FFFF0000FFFF000084848400C6C6C600FFFFFF00848484000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0084848400C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60084848400C6C6C600FFFFFF00C6C6C600C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD000000BD000000BD000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD000000BD000000BD000000BD000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD000000BD000000BD000000FFFFFF00BD000000BD00
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00BD000000BD000000BD000000FFFFFF000000000000000000BD00
      0000BD000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000008400
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      84008484840084848400BD000000FFFFFF00FFFFFF0000000000000000000000
      0000BD000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000848484008400
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000BD000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      840084848400848484008484840084848400FFFFFF0000000000000000000000
      00000000000000000000BD000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000BD0000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      840084848400000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000848484008400
      0000000000000000000000000000000000008400000084000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000008484
      8400840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF0000000000000067000000000000
      0003000000000000001D00000000000000050000000000000003000000000000
      00010000000000008001000000000000C003000000000000E003000000000000
      FC03000000000000FC03000000000000FC03000000000000FC03000000000000
      FC03000000000000FE037FFE00000000FFFFFFFFFFC7FFFFE7FFFFC1FFC3FFFF
      C3FFFFC1FF80FD7FE3F7FFC1DF81101FE397F8C1D783000FE001E04185830007
      E001804181830003C001804101830001E0018041007F0000C0018063007F0001
      8001807F007F188300018061007FFFD700018061007FFFFF800580E1007FFFFF
      C3FF83E1807FFFFFFFFFEFE1C07FFFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F803E07FE003F000F800C0078003F000
      F80000018003F000F80000008003F000E00000018003F000000080018003F000
      000080038003F000000000038003000000010003800300000007000180030000
      801F000180030000801F000380030000C03F000380070000E03F0007800F0001
      F07F800F801F0003FE7FFC1F807FF007FFFFC3DFFF9FF9FFFFFFC3CFFF1FE07F
      C00F8103FC9FC03FC00F8007F087800FC00F8007E3830007C00FC00FCFE10003
      C007C03FBC780001C007E01F3C780000C01FF00F7EFC0010F317F00F7E7C8000
      FF87E003783CE000FFC7C003783CF000FF87C3013839FC39FFFFC3819833FF07
      FFFFC7C7C7C7FFCFFFFFFFE7F01FFFFFFFBFFBFFFFFFFAFFFE0FF8FFFEFFE03F
      F80FF03FFC7F800FF00FF00FDE73C003F00FE0038C63C003F00FE0008647C003
      F00FC007E00FC003F00FC007E01FC003F00F8007F81FC003F00F8003F83FC003
      F00F0019F83FC003F00F001CFBFFC007F00F803FFBFFE01FF01FE03FFDBFFC3F
      F07FF87FFFFFFE1FF1FFFE7FFFFFFE1FFFFFFFFFFFFFFFFFFFFFFF9FFFFCFFFF
      FFFFFF0FF3FFFFFFFFFFFE0FE1F9FFFFFC7F8007E1F3FFFFFC7F8023F0E3E7FF
      FC7F8033F847CF83E00F8039FC0FDFC3E00F803CFE1FDFE3E00F803EFC0FDFD3
      FC7F873FF84FCF3BFC7F803FE0E3E0FFFC7F857FC1F1FFFFFFFF80FFC7F8FFFF
      FFFF81FFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object LastPopupMenu: TPopupMenu
    Images = ImageList
    OwnerDraw = True
    Left = 312
    Top = 304
    object miContract: TMenuItem
      Caption = 'Мцгавиля'
      ImageIndex = 14
      OnDrawItem = miDepositDrawItem
      object N16: TMenuItem
        Caption = 'Йени  ...'
        ImageIndex = 0
        ShortCut = 16462
        OnClick = N16Click
        OnDrawItem = miDepositDrawItem
      end
      object N17: TMenuItem
        Caption = 'Редактя ...'
        ImageIndex = 1
        ShortCut = 16453
        OnClick = N17Click
        OnDrawItem = miDepositDrawItem
      end
      object N18: TMenuItem
        Caption = 'Баьламаг  ...'
        ImageIndex = 2
        ShortCut = 119
        OnClick = N18Click
        OnDrawItem = miDepositDrawItem
      end
      object N19: TMenuItem
        Caption = 'Щесабланманы Дайандырмаг / Давам етдирмяк ...'
        ImageIndex = 7
        OnClick = N19Click
        OnDrawItem = miDepositDrawItem
      end
      object N20: TMenuItem
        Caption = 'Йатырымлар вя йыьымларын чапы  ...'
        OnClick = N20Click
        OnDrawItem = miDepositDrawItem
      end
      object N21: TMenuItem
        Caption = 'Мцгавиля чапы'
        OnClick = N21Click
        OnDrawItem = miDepositDrawItem
      end
    end
    object N22: TMenuItem
      Caption = 'Ямялиййатлар'
      ImageIndex = 23
      OnDrawItem = miDepositDrawItem
      object N23: TMenuItem
        Caption = 'Йатырым ...'
        ImageIndex = 16
        ShortCut = 16452
        OnClick = N23Click
        OnDrawItem = miDepositDrawItem
      end
      object N25: TMenuItem
        Caption = 'Яманятин  юдянилмяси ...'
        ImageIndex = 17
        ShortCut = 16461
        OnClick = N25Click
        OnDrawItem = miDepositDrawItem
      end
      object N24: TMenuItem
        Caption = 'Капиталлашдырма ...'
        ImageIndex = 11
        ShortCut = 16468
        OnClick = N24Click
        OnDrawItem = miDepositDrawItem
      end
      object N26: TMenuItem
        Caption = 'Яманятин вахтсыз  юдянилмяси  ...'
        ImageIndex = 18
        ShortCut = 16469
        OnClick = N26Click
        OnDrawItem = miDepositDrawItem
      end
      object N27: TMenuItem
        Caption = 'Фаизлярин  щесабланмасы  ...'
        ImageIndex = 4
        ShortCut = 16464
        OnClick = N27Click
        OnDrawItem = miDepositDrawItem
      end
      object N8: TMenuItem
        Caption = 'Пролонгасийа'
        ImageIndex = 25
        OnClick = N8Click
        OnDrawItem = miDepositDrawItem
      end
    end
    object N28: TMenuItem
      Action = ActnRefresh
      ImageIndex = 3
      OnDrawItem = miDepositDrawItem
    end
    object N29: TMenuItem
      Caption = 'Експорт ...'
      ImageIndex = 15
      OnDrawItem = miDepositDrawItem
      object N30: TMenuItem
        Caption = 'Период щесабаты'
        OnClick = N30Click
        OnDrawItem = miDepositDrawItem
      end
      object N11: TMenuItem
        Caption = 'МИС  щесабаты'
        OnClick = N11Click
        OnDrawItem = miDepositDrawItem
      end
      object N13: TMenuItem
        Caption = 'Баланс цзря щесабат'
        OnClick = N13Click
        OnDrawItem = miDepositDrawItem
      end
    end
    object N34: TMenuItem
      Caption = 'Контрол'
      ImageIndex = 10
      OnDrawItem = miDepositDrawItem
    end
    object N10: TMenuItem
      Caption = 'Филтер Панели '
      ShortCut = 16454
      OnClick = N10Click
      OnDrawItem = miDepositDrawItem
    end
    object N35: TMenuItem
      Caption = 'Ахтарыш Панели'
      ImageIndex = 8
      ShortCut = 49235
      OnClick = N35Click
      OnDrawItem = miDepositDrawItem
    end
  end
  object ActionsMenu: TPopupMenu
    Images = ImageList
    OwnerDraw = True
    Left = 249
    Top = 304
    object miDeposit: TMenuItem
      Caption = 'Йатрым'
      OnClick = N23Click
      OnDrawItem = miDepositDrawItem
    end
    object miWithdraw: TMenuItem
      Caption = 'Яманятин  юдянилмяси ...'
      OnClick = N25Click
      OnDrawItem = miDepositDrawItem
    end
    object miCapitalization: TMenuItem
      Caption = 'Капиталлашдырма ...'
      OnClick = N24Click
      OnDrawItem = miDepositDrawItem
    end
    object miUntimelyWithdraw: TMenuItem
      Caption = 'Яманятин вахтсыз  юдянилмяси  ...'
      OnClick = N26Click
      OnDrawItem = miDepositDrawItem
    end
    object N12: TMenuItem
      Caption = 'Фаизлярин  щесабланмасы  ...'
      OnClick = N27Click
      OnDrawItem = miDepositDrawItem
    end
    object N9: TMenuItem
      Caption = 'Пролонгасийа'
      OnClick = N8Click
      OnDrawItem = miDepositDrawItem
    end
  end
  object StatusImages: TImageList
    Left = 412
    Top = 306
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002121210021212100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000636363008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400212121000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002121DE00212121000000000021219C003131AD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD000000FFFFFF000000
      00000000000000000000000000000000000000212100009C9C00007B7B00007B
      7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B
      7B00007B7B005252520084848400848484000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000000000FFFF0000FF
      FF00008484000000000000000000000000000000000000000000000000000000
      0000000000000000FF002121DE00848484000000FF004242BD00313131002121
      9C003131AD000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD000000BD000000BD000000FFFF
      FF000000000000000000000000000000000000BDBD0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0031EFEF0042424200848484000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000000000FFFF0000FF
      FF000084840000000000000000000000000000000000000000006363DE000000
      7B0000007B000000FF000000FF000000FF000000FF000000BD002121DE000000
      FF0000007B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD000000BD000000BD000000BD000000FFFF
      FF000000000000000000000000000000000000BDBD0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0031ADAD000000000031ADAD0000FFFF0000FFFF0000FF
      FF0000FFFF0031EFEF0042424200424242000000000000000000C6C6C6008484
      840000000000000000000000000000000000FFFFFF000000000000FFFF0000FF
      FF00008484000000000000000000000000000000000000000000525252000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007B000000FF000000
      FF0000007B005252520042424200000000000000000000000000000000000000
      00000000000000000000BD000000BD000000BD000000FFFFFF00BD000000BD00
      0000FFFFFF000000000000000000000000000042420000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0031ADAD000000000031ADAD0000FFFF0000FFFF0000FF
      FF0000FFFF00316B6B008484840000000000FFFFFF000000000000FFFF0000FF
      FF000084840000000000FFFFFF0000000000FFFFFF000000000000FFFF0000FF
      FF00008484000000000000000000000000000000000031313100424242000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007B000000FF000000
      FF000000FF000000FF0042427B00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00BD000000BD000000BD000000FFFFFF000000000000000000BD00
      0000BD000000FFFFFF0000000000000000000000000000BDBD0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000BDBD0000FFFF0000FFFF0000FFFF0000FF
      FF0031EFEF00424242004242420000000000FFFFFF000000000000FFFF0000FF
      FF000084840000000000FFFFFF0000000000FFFFFF000000000000FFFF0000FF
      FF0000848400000000000000000000000000424242000000FF000000FF000000
      FF000000FF000000FF000000FF00007BFF00007BFF000000BD000000FF000000
      FF000000FF000000BD0000000000000000000000000000000000FFFFFF008484
      84008484840084848400BD000000FFFFFF00FFFFFF0000000000000000000000
      0000BD000000FFFFFF000000000000000000000000000042420000FFFF0000FF
      FF0000FFFF0000FFFF0031CECE003152520000FFFF0000FFFF0000FFFF0000FF
      FF00316B6B00848484000000000000000000FFFFFF000000000000FFFF0000FF
      FF000084840000000000FFFFFF0000000000FFFFFF000000000000FFFF0000FF
      FF000084840000000000000000000000000000000000000039002121DE000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007B000000FF000000
      FF000000FF000000BD0000003900000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000BD000000FFFFFF0000000000000000000000000000BDBD0000FF
      FF0000FFFF0000FFFF00316B6B000000000031EFEF0000FFFF0000FFFF0031EF
      EF0042424200424242000000000000000000FFFFFF000000000000FFFF0000FF
      FF000084840000000000FFFFFF000000000084848400008484000084840000FF
      FF00FFFFFF0000FFFF0000000000000000000000000021215A002121DE000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007B000000FF000000
      FF000000FF000000FF000000FF0052528C000000000000000000FFFFFF008484
      840084848400848484008484840084848400FFFFFF0000000000000000000000
      00000000000000000000BD000000FFFFFF0000000000000000000042420000FF
      FF0000FFFF0000FFFF000021210000000000009C9C0000FFFF0000FFFF00316B
      6B008484840000000000000000000000000084848400008484000084840000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000848484008484
      84008484840000000000000000000000000021215A000000FF000000FF000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007B000000FF000000
      FF000000FF0021219C0031313100000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000BD00000000000000000000000000000000BD
      BD0000FFFF0000FFFF000000000000000000007B7B0000FFFF0031EFEF004242
      4200424242000000000000000000000000000000000000000000848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000052528C000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF0000007B000000FF000000
      FF000000FF003131EF0000000000000000000000000000000000FFFFFF008484
      840084848400000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000042
      420000FFFF0000FFFF000000000000000000007B7B0000FFFF00316B6B008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000021219C000000
      FF000000FF000000FF000000FF0000FFFF0000FFFF000000BD000000FF000000
      FF000000FF000000FF0021219C00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000BDBD0000FFFF0031ADAD00007B7B0031EFEF0031EFEF00424242004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      00000000000000000000000000000000000000000000313131002121DE003131
      AD000000BD000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000007B0000007B0021215A00000000000000000000000000FFFFFF008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000042420000FFFF0000FFFF0000FFFF0000FFFF00316B6B00848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000007B000000FF000000DE000000BD000000FF003131EF003131EF000000
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000BDBD0000FFFF0000FFFF0031EFEF0042424200424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000021215A003131EF0000002100525252000000FF0052525200000000002121
      5A00313131000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000042420000FFFF0000FFFF00316B6B0063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000313131000000000000000000000000008484BD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000007B7B0031ADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF3FFFFFC000FF83F93FFF9F0000FF03
      F807FF0F0000FF03C007FE0F0000C703C0018007000101038001802380010103
      000380338003010380018039C00301018000803CC00701C70001803EE007C7FF
      C003873FE00FFFEFC001803FF00FFE8F8001857FF01FED7FF00F80FFF81FF2FF
      F02781FFF83FED7FF77FFFFFFC7FFD7F00000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Left = 377
    Top = 306
    object ActnSearch: TAction
      Caption = 'ActnSearch'
      OnExecute = ActnSearchExecute
    end
    object ActnFilter: TAction
      Caption = 'ActnFilter'
      OnExecute = ActnFilterExecute
    end
    object ActnRefresh: TAction
      Caption = 'Йенилямяк'
      OnExecute = ActnRefreshExecute
    end
  end
  object PopupMenuSettings: TPopupMenu
    OwnerDraw = True
    Left = 345
    Top = 305
    object N1: TMenuItem
      Caption = 'Банкын сечмяляри             '
      OnClick = N1Click
      OnDrawItem = miDepositDrawItem
    end
    object N2: TMenuItem
      Caption = 'Щесаб груплары'
      OnClick = N2Click
      OnDrawItem = miDepositDrawItem
    end
    object N3: TMenuItem
      Caption = 'Мцштяри типляри'
      OnClick = N3Click
      OnDrawItem = miDepositDrawItem
    end
    object N4: TMenuItem
      Caption = 'Депозитин типляри'
      OnClick = N4Click
      OnDrawItem = miDepositDrawItem
    end
    object N5: TMenuItem
      Caption = 'Эялир зяряр щесабларынын сазланмасы'
      OnClick = N5Click
      OnDrawItem = miDepositDrawItem
    end
    object N6: TMenuItem
      Caption = 'Мцгавиля чапы (Сазланмасы)'
      OnClick = N6Click
      OnDrawItem = miDepositDrawItem
    end
    object N7: TMenuItem
      Caption = 'Фаизлярин сазланмасы'
      OnClick = N7Click
      OnDrawItem = miDepositDrawItem
    end
  end
  object EExport: TCMExcelExport
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontTitles.Charset = RUSSIAN_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'Azl Sans Serif'
    FontTitles.Style = []
    OrientationTitles = 0
    FontData.Charset = RUSSIAN_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Azl Sans Serif'
    FontData.Style = []
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'MS Sans Serif'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 443
    Top = 307
  end
end
