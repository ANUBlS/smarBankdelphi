object FormViewTurn: TFormViewTurn
  Left = 50
  Top = 150
  Width = 922
  Height = 542
  Caption = 'FormViewTurn'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GBoxNB: TGroupBox
    Left = 0
    Top = 0
    Width = 914
    Height = 515
    Align = alClient
    Caption = '“арих аралыьында бахыш'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object DBGridWaresNB: TDBGridEh
      Left = 2
      Top = 192
      Width = 910
      Height = 269
      Align = alClient
      Color = 15855856
      DataSource = DataModWares.DSViewWares
      FixedColor = 9512207
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Color = clBlack
      FooterFont.Height = -11
      FooterFont.Name = 'Azl Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'WARES_NAME'
          Footers = <>
          Title.Caption = '¬€саитин ады'
          Width = 143
        end
        item
          EditButtons = <>
          FieldName = 'INVENTAR_DATE'
          Footers = <>
          Title.Caption = '»нв.тарихи'
          Width = 68
        end
        item
          EditButtons = <>
          FieldName = 'PERCENT'
          Footers = <>
          Title.Caption = 'ЌЅ%'
          Width = 27
        end
        item
          EditButtons = <>
          FieldName = 'GROUPS_ID'
          Footers = <>
          Visible = False
          Width = 63
        end
        item
          EditButtons = <>
          FieldName = 'FIRST_PRICE'
          Footers = <>
          Title.Caption = '»лкин д€й€р'
          Width = 79
        end
        item
          EditButtons = <>
          FieldName = 'REMAINDER'
          Footers = <>
          Title.Caption = '√алыг'
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'ALL_AMORT'
          Footers = <>
          Title.Caption = '…ыьылмыш аморт'
          Width = 74
        end
        item
          EditButtons = <>
          FieldName = 'AMORT'
          Footers = <>
          Title.Caption = 'јйлыг аморт'
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'TAX_PERCENT'
          Footers = <>
          Title.Caption = 'ЌЋ%'
          Width = 32
        end
        item
          EditButtons = <>
          FieldName = 'TAX_FIRST_PRICE'
          Footers = <>
          Title.Caption = '»лин €вв. галыг(ЌЋ)'
          Width = 88
        end
        item
          EditButtons = <>
          FieldName = 'TAX_REMAINDER'
          Footers = <>
          Title.Caption = 'јйлыг галыг(ЌЋ)'
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'TAX_ALL_AMORT'
          Footers = <>
          Title.Caption = '…ыьылмыш аморт(ЌЋ)'
        end
        item
          EditButtons = <>
          FieldName = 'TAX_AMORT'
          Footers = <>
          Title.Caption = 'јморт(ЌЋ)'
        end
        item
          EditButtons = <>
          FieldName = 'AMORT_DATE'
          Footers = <>
          Title.Caption = 'јморт.тарихи'
        end>
    end
    object DBGridEhGroupNB: TDBGridEh
      Left = 2
      Top = 43
      Width = 910
      Height = 149
      Align = alTop
      Color = 15855856
      ColumnDefValues.AutoDropDown = True
      ColumnDefValues.DropDownSizing = True
      ColumnDefValues.EndEllipsis = True
      DataSource = DataModWares.DSViewGroups
      EditActions = [geaCutEh, geaCopyEh, geaSelectAllEh]
      FixedColor = 9512207
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      RowHeight = 4
      RowLines = 1
      RowSizingAllowed = True
      SumList.Active = True
      SumList.ExternalRecalc = True
      SumList.VirtualRecords = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.Tracking = True
      OnCellClick = DBGridEhGroupNBCellClick
      OnKeyDown = DBGridEhGroupNBKeyDown
      OnKeyUp = DBGridEhGroupNBKeyDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ROWNUM'
          Footers = <>
          Title.Caption = 'є'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 22
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = 'ясас в€саит групу'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Title.ImageIndex = 0
          Width = 274
        end
        item
          Color = clMenu
          EditButtons = <>
          FieldName = 'AMORT'
          Footer.Color = clInfoBk
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = '%'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 32
        end
        item
          EditButtons = <>
          FieldName = 'DEBTACCNO'
          Footers = <>
          Title.Caption = 'ƒебет щесаб'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 214
        end
        item
          EditButtons = <>
          FieldName = 'CREDITACCNO'
          Footers = <>
          Title.Caption = ' редит щесаб'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 219
        end>
    end
    object PanelSum: TPanel
      Left = 2
      Top = 461
      Width = 910
      Height = 52
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object LabelFirstPrice: TLabel
        Left = 80
        Top = 8
        Width = 48
        Height = 13
        Caption = '»лкин д€й€р'
      end
      object LabelRemainder: TLabel
        Left = 184
        Top = 9
        Width = 53
        Height = 13
        Caption = '√алыг д€й€р'
      end
      object LabelAllAmort: TLabel
        Left = 286
        Top = 8
        Width = 66
        Height = 13
        Caption = '…ыэылмыш аморт.'
      end
      object LabelAmort: TLabel
        Left = 376
        Top = 8
        Width = 58
        Height = 13
        Caption = 'јмортизасийа'
      end
      object Label1: TLabel
        Left = 459
        Top = 8
        Width = 85
        Height = 13
        Caption = '»лин €вв€лин€ д€й€р'
      end
      object Label2: TLabel
        Left = 553
        Top = 8
        Width = 53
        Height = 13
        Caption = '√алыг д€й€р'
      end
      object Label3: TLabel
        Left = 638
        Top = 8
        Width = 66
        Height = 13
        Caption = '…ыэылмыш аморт.'
      end
      object Label4: TLabel
        Left = 736
        Top = 8
        Width = 58
        Height = 13
        Caption = 'јмортизасийа'
      end
      object PanelSearch: TPanel
        Left = 886
        Top = 2
        Width = 22
        Height = 48
        Align = alRight
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -27
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object LabelS: TLabel
          Left = 4
          Top = 4
          Width = 16
          Height = 38
          Caption = '<'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -27
          Font.Name = 'Comic Sans MS'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = LabelSClick
        end
        object Search: TLabel
          Left = 70
          Top = 26
          Width = 52
          Height = 16
          Caption = 'јхтарыш:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelSrchName: TLabel
          Left = 152
          Top = 7
          Width = 67
          Height = 13
          Caption = '¬€саитин ады'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelSrchFP: TLabel
          Left = 291
          Top = 7
          Width = 63
          Height = 13
          Caption = '»лкин д€й€ри'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelSrchR: TLabel
          Left = 416
          Top = 8
          Width = 65
          Height = 13
          Caption = '√алыг д€й€р'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelSrchAA: TLabel
          Left = 538
          Top = 8
          Width = 82
          Height = 13
          Caption = '…ыьылмыш аморт.'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LabelSrchA: TLabel
          Left = 651
          Top = 7
          Width = 63
          Height = 13
          Caption = 'јйлыг аморт'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EditSrchFP: TEdit
          Left = 292
          Top = 23
          Width = 121
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = EditSrchFPChange
        end
        object EditSrchR: TEdit
          Left = 415
          Top = 23
          Width = 121
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object EditSrchAA: TEdit
          Left = 537
          Top = 23
          Width = 113
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = EditSrchAAChange
        end
        object EditSrchName: TEdit
          Left = 151
          Top = 23
          Width = 121
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object EditSrchA: TEdit
          Left = 651
          Top = 23
          Width = 121
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
      end
      object PanelFF: TPanel
        Left = 80
        Top = 22
        Width = 744
        Height = 27
        TabOrder = 1
        object DBEditFIRST_PRICE: TDBEdit
          Left = 3
          Top = 3
          Width = 103
          Height = 21
          DataField = 'FIRST_PRICE'
          DataSource = DataModWares.DSSumViewWares
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object DBEditREMAINDER: TDBEdit
          Left = 107
          Top = 3
          Width = 100
          Height = 21
          DataField = 'REMAINDER'
          DataSource = DataModWares.DSSumViewWares
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object DBEditALL_AMORT: TDBEdit
          Left = 208
          Top = 3
          Width = 88
          Height = 21
          DataField = 'ALL_AMORT'
          DataSource = DataModWares.DSSumViewWares
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object DBEditAMORT: TDBEdit
          Left = 297
          Top = 3
          Width = 81
          Height = 21
          DataField = 'AMORT'
          DataSource = DataModWares.DSSumViewWares
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object DBEditTAX_FIRST_PRICE: TDBEdit
          Left = 379
          Top = 3
          Width = 95
          Height = 21
          DataField = 'TAX_FIRST_PRICE'
          DataSource = DataModWares.DSSumViewWares
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object DBEditTAX_REMAINDER: TDBEdit
          Left = 475
          Top = 3
          Width = 84
          Height = 21
          DataField = 'TAX_REMAINDER'
          DataSource = DataModWares.DSSumViewWares
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
        object DBEditTAX_ALL_AMORT: TDBEdit
          Left = 560
          Top = 3
          Width = 97
          Height = 21
          DataField = 'TAX_ALL_AMORT'
          DataSource = DataModWares.DSSumViewWares
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
        object DBEditTAX_AMORT: TDBEdit
          Left = 658
          Top = 3
          Width = 81
          Height = 21
          DataField = 'TAX_AMORT'
          DataSource = DataModWares.DSSumViewWares
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
      end
    end
    object PanelCheck: TPanel
      Left = 2
      Top = 15
      Width = 910
      Height = 28
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      object DTP_Dat: TDateTimePicker
        Left = 4
        Top = 4
        Width = 125
        Height = 21
        CalAlignment = dtaLeft
        Date = 38989.2725231481
        Time = 38989.2725231481
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
        OnChange = BitBtnOkClick
      end
      object BitBtnOk: TBitBtn
        Left = 134
        Top = 3
        Width = 95
        Height = 22
        Caption = 'Ok'
        TabOrder = 1
        OnClick = BitBtnOkClick
        Glyph.Data = {
          36010000424D3601000000000000760000002800000015000000100000000100
          040000000000C000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333000333333333333333333333000338FF3FF3333333333333000338C
          F38CFF33333333333000338CF38CCCFF333333333000338CF38CCCCCFF333333
          3000338CF38CCCCCCCFF33333000338CF38CCCCCCCCCFF333000338CF38CCCCC
          CCCC88F33000338CF38CCCCCCC8833333000338CF38CCCCC883333333000338C
          F38CCC88333333333000338CF38C88333333333330003388F388333333333333
          3000333333333333333333333000333333333333333333333000}
      end
      object BtnExportExcel: TBitBtn
        Left = 256
        Top = 3
        Width = 109
        Height = 22
        Caption = 'Excel'
        TabOrder = 2
        OnClick = BtnExportExcelClick
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC000000CE0E0000D80E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777700000007777777777777777700000007700000000000007700000007707
          70FFFF8FFF0770000000770770FFFF8FFF077000000077088088888888077000
          0000770770FFFF8FFF0770000000770770FFFF8FFF0770000000770880888888
          880770000000770770FFFF8FFF0770000000770770FFFF8FFF07700000007700
          0000000000077000000077077077778777077000000077077077778777077000
          0000770000000000000770000000777777777777777770000000777777777777
          777770000000}
      end
    end
  end
  object TimerB: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TimerBTimer
    Left = 304
    Top = 137
  end
  object TimerA: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TimerATimer
    Left = 336
    Top = 137
  end
end
