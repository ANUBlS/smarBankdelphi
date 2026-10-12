object FrmContract: TFrmContract
  Left = 382
  Top = 163
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Contract Conclusion'
  ClientHeight = 525
  ClientWidth = 531
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
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 531
    Height = 525
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 304
      Height = 523
      Align = alLeft
      BevelOuter = bvLowered
      TabOrder = 0
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 302
        Height = 55
        Align = alTop
        BevelOuter = bvSpace
        Color = clScrollBar
        TabOrder = 0
        object Label1: TLabel
          Left = 1
          Top = 38
          Width = 230
          Height = 13
          Caption = '               ћцгавил€нин  щесаб нюмр€л€ри.'
          Color = clScrollBar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object CurrencyGroupBox: TGroupBox
          Left = 1
          Top = 1
          Width = 300
          Height = 34
          Align = alTop
          Caption = '¬алйута'
          TabOrder = 0
          object Bevel1: TBevel
            Left = 129
            Top = 6
            Width = 2
            Height = 26
            Shape = bsLeftLine
            Style = bsRaised
          end
          object CurrencyViewer: TDBViewComboBox
            Left = 133
            Top = 9
            Width = 160
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnChange = CurrencyViewerChange
            ListSource = DataModContract.DataSrcCurrency
            ListFields = 'CurrencyName'
            FieldInterval = 5
            DropDownOnEnter = False
            FirstAfterOpen = True
          end
          object CurrencyEdit: TEdit
            Left = 76
            Top = 9
            Width = 49
            Height = 21
            TabOrder = 1
            Text = '0'
            OnKeyDown = CurrencyEditKeyDown
          end
        end
      end
      object GBGrandAccs: TGroupBox
        Left = 1
        Top = 56
        Width = 302
        Height = 40
        Align = alTop
        Caption = '—суда щесабы'
        TabOrder = 1
        object GrandAccs: TSearchEdit
          Tag = 33
          Left = 8
          Top = 14
          Width = 123
          Height = 21
          TabOrder = 0
          OnChange = GrandAccsChange
          Partnership = GrandNames
          DataSource = DataModContract.DataSrcGrant
          SearchField = 'AccNo'
        end
        object GrandNames: TDBViewComboBox
          Left = 132
          Top = 14
          Width = 163
          Height = 21
          Style = csDropDownList
          Color = clHighlightText
          ItemHeight = 13
          TabOrder = 1
          OnChange = GrandNamesChange
          ListSource = DataModContract.DataSrcGrant
          ListFields = 'ClientName'
          FieldInterval = 5
          DropDownOnEnter = False
        end
      end
      object GroupBox3: TGroupBox
        Left = 1
        Top = 96
        Width = 302
        Height = 40
        Align = alTop
        Caption = 'ћцшт€ри щесабы'
        TabOrder = 2
        object ClientAccs: TSearchEdit
          Tag = 33
          Left = 8
          Top = 14
          Width = 123
          Height = 21
          TabOrder = 0
          OnChange = GrandAccsChange
          Partnership = ClientNames
          DataSource = DataModContract.DataSrcClientAcc
          SearchField = 'AccNo'
        end
        object ClientNames: TDBViewComboBox
          Left = 132
          Top = 14
          Width = 163
          Height = 21
          Style = csDropDownList
          Color = clHighlightText
          ItemHeight = 13
          TabOrder = 1
          OnChange = ClientNamesChange
          ListSource = DataModContract.DataSrcClientAcc
          ListFields = 'ClientName'
          FieldInterval = 5
          DropDownOnEnter = False
        end
      end
      object GBReserveAccs: TGroupBox
        Left = 1
        Top = 136
        Width = 302
        Height = 40
        Align = alTop
        Caption = '≈щтиййат щесабы'
        TabOrder = 3
        object ReserveAccs: TSearchEdit
          Tag = 33
          Left = 9
          Top = 15
          Width = 122
          Height = 21
          TabOrder = 0
          OnChange = GrandAccsChange
          Partnership = ReliabilityNames
          DataSource = DataModContract.DataSrcReserveAcc
          SearchField = 'AccNo'
        end
        object ReliabilityNames: TDBViewComboBox
          Left = 132
          Top = 15
          Width = 163
          Height = 21
          Style = csDropDownList
          Color = clHighlightText
          ItemHeight = 13
          TabOrder = 1
          OnChange = ReliabilityNamesChange
          ListSource = DataModContract.DataSrcReserveAcc
          ListFields = 'ClientName'
          FieldInterval = 5
          DropDownOnEnter = False
        end
      end
      object GroupBox5: TGroupBox
        Left = 1
        Top = 176
        Width = 302
        Height = 40
        Align = alTop
        Caption = '‘аизл€р щесабы'
        TabOrder = 4
        object InterestAccs: TSearchEdit
          Tag = 33
          Left = 8
          Top = 15
          Width = 123
          Height = 21
          TabOrder = 0
          OnChange = GrandAccsChange
          Partnership = InterestNames
          DataSource = DataModContract.DataSrcInterestAcc
          SearchField = 'AccNo'
        end
        object InterestNames: TDBViewComboBox
          Left = 132
          Top = 15
          Width = 163
          Height = 21
          Style = csDropDownList
          Color = clHighlightText
          ItemHeight = 13
          TabOrder = 1
          OnChange = InterestNamesChange
          ListSource = DataModContract.DataSrcInterestAcc
          ListFields = 'ClientName'
          FieldInterval = 5
          DropDownOnEnter = False
        end
      end
      object GBOverdueAccs: TGroupBox
        Left = 1
        Top = 216
        Width = 302
        Height = 40
        Align = alTop
        Caption = 'Ёежикдрилмиш борж щесабы'
        TabOrder = 5
        object OverdueAccs: TSearchEdit
          Tag = 33
          Left = 9
          Top = 15
          Width = 122
          Height = 21
          TabOrder = 0
          OnChange = GrandAccsChange
          Partnership = OverdueNames
          DataSource = DataModContract.DataSrcOverdueAcc
          SearchField = 'AccNo'
        end
        object OverdueNames: TDBViewComboBox
          Left = 132
          Top = 15
          Width = 163
          Height = 21
          Style = csDropDownList
          Color = clHighlightText
          ItemHeight = 13
          TabOrder = 1
          OnChange = OverdueNamesChange
          ListSource = DataModContract.DataSrcOverdueAcc
          ListFields = 'ClientName'
          FieldInterval = 5
          DropDownOnEnter = False
        end
      end
      object GBOverdueInterestAccs: TGroupBox
        Left = 1
        Top = 296
        Width = 302
        Height = 40
        Align = alTop
        Caption = '∆ежиктирилмиш борж цзр€ фаизл€р щесабы'
        TabOrder = 7
        object OverdueInterestAccs: TSearchEdit
          Tag = 33
          Left = 10
          Top = 15
          Width = 121
          Height = 21
          TabOrder = 0
          OnChange = GrandAccsChange
          Partnership = OverdueInterestNames
          DataSource = DataModContract.DataSrcOverdueInterestAcc
          SearchField = 'AccNo'
        end
        object OverdueInterestNames: TDBViewComboBox
          Left = 132
          Top = 15
          Width = 163
          Height = 21
          Style = csDropDownList
          Color = clHighlightText
          ItemHeight = 13
          TabOrder = 1
          OnChange = OverdueInterestNamesChange
          ListSource = DataModContract.DataSrcOverdueInterestAcc
          ListFields = 'ClientName'
          FieldInterval = 5
          DropDownOnEnter = False
        end
      end
      object Panel5: TPanel
        Left = 1
        Top = 336
        Width = 302
        Height = 19
        Align = alTop
        BevelOuter = bvSpace
        Color = clScrollBar
        TabOrder = 8
        object Label2: TLabel
          Left = 86
          Top = 3
          Width = 112
          Height = 13
          Caption = ' ћцгавил€ щаггында'
          Color = clScrollBar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
      end
      object GroupBox8: TGroupBox
        Left = 1
        Top = 383
        Width = 302
        Height = 32
        Align = alTop
        Caption = 'јчылма тархи'
        TabOrder = 10
        object DTPOpenDate: TDateTimePicker
          Left = 150
          Top = 8
          Width = 115
          Height = 21
          CalAlignment = dtaLeft
          Date = 37532.4763933449
          Time = 37532.4763933449
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
        end
      end
      object GroupBox9: TGroupBox
        Left = 1
        Top = 415
        Width = 302
        Height = 32
        Align = alTop
        Caption = 'Ѕаьланма тарихи'
        TabOrder = 11
        object DTPCloseDate: TDateTimePicker
          Left = 150
          Top = 8
          Width = 115
          Height = 21
          CalAlignment = dtaLeft
          Date = 37532.4763933449
          Time = 37532.4763933449
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
        end
      end
      object GBStopCalcDate: TGroupBox
        Left = 1
        Top = 447
        Width = 302
        Height = 37
        Align = alTop
        Caption = '‘аизин щесабланмасынын дайандырылма тарихи'
        TabOrder = 12
        object DTPStopCalcDate: TDateTimePicker
          Left = 150
          Top = 13
          Width = 115
          Height = 21
          CalAlignment = dtaLeft
          Date = 37532.4763933449
          Time = 37532.4763933449
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
        end
      end
      object Panel6: TPanel
        Left = 1
        Top = 355
        Width = 302
        Height = 28
        Align = alTop
        BevelInner = bvSpace
        BevelOuter = bvLowered
        TabOrder = 9
        object Label3: TLabel
          Left = 10
          Top = 6
          Width = 116
          Height = 13
          Caption = 'ћцгавил€нин нюмр€си'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ContractNumEdit: TEdit
          Left = 150
          Top = 2
          Width = 113
          Height = 21
          TabOrder = 0
        end
      end
      object GBReliability: TGroupBox
        Left = 1
        Top = 484
        Width = 302
        Height = 38
        Align = alClient
        Caption = '≈щтиййат'
        TabOrder = 13
        object ReliabilityPercentEdit: TEdit
          Left = 160
          Top = 13
          Width = 41
          Height = 21
          TabStop = False
          AutoSelect = False
          Color = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object ReliabilityViewer: TDBViewComboBox
          Left = 8
          Top = 13
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          OnChange = ReliabilityViewerChange
          ListSource = DataModContract.DataSrcReliability
          ListFields = 'Reliability'
          FieldInterval = 5
          DropDownOnEnter = False
        end
      end
      object GroupBox1: TGroupBox
        Left = 1
        Top = 256
        Width = 302
        Height = 40
        Align = alTop
        Caption = 'Ёежикдирилмиш ≈щтиййат щесабы'
        TabOrder = 6
        object OverdueReserveAccs: TSearchEdit
          Tag = 33
          Left = 9
          Top = 15
          Width = 122
          Height = 21
          TabOrder = 0
          OnChange = GrandAccsChange
          Partnership = OverdueReserveNames
          DataSource = DataModContract.DataSrcOverdueReserve
          SearchField = 'AccNo'
        end
        object OverdueReserveNames: TDBViewComboBox
          Left = 132
          Top = 15
          Width = 163
          Height = 21
          Style = csDropDownList
          Color = clHighlightText
          ItemHeight = 13
          TabOrder = 1
          OnChange = OverdueReserveNamesChange
          ListSource = DataModContract.DataSrcOverdueReserve
          ListFields = 'ClientName'
          FieldInterval = 5
          DropDownOnEnter = False
        end
      end
    end
    object Panel3: TPanel
      Left = 305
      Top = 1
      Width = 225
      Height = 523
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 223
        Height = 24
        Align = alTop
        BevelOuter = bvSpace
        Color = clScrollBar
        TabOrder = 0
        object Label4: TLabel
          Left = 62
          Top = 5
          Width = 107
          Height = 13
          Caption = 'ћцгавил€нин д€й€ри'
          Color = clScrollBar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
      end
      object GroupBox12: TGroupBox
        Left = 1
        Top = 25
        Width = 223
        Height = 37
        Align = alTop
        Caption = 'ћ€бл€ь'
        TabOrder = 1
        object DBTextCurrency: TDBText
          Left = 13
          Top = 14
          Width = 33
          Height = 17
          DataField = 'CURRENCYSHORTNAME'
          DataSource = DataModContract.DataSrcCurrency
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object AmountEdit: TCurrencyEdit
          Left = 53
          Top = 10
          Width = 165
          Height = 21
          TabOrder = 0
          Text = '0'
        end
      end
      object GBMountlyPayment: TGroupBox
        Left = 1
        Top = 62
        Width = 223
        Height = 85
        Align = alTop
        Caption = 'јйлыг юд€м€л€р'
        TabOrder = 2
        object StaticText1: TStaticText
          Left = 3
          Top = 18
          Width = 79
          Height = 17
          BorderStyle = sbsSunken
          Caption = '÷муи борждан   '
          TabOrder = 1
        end
        object StaticText2: TStaticText
          Left = 4
          Top = 42
          Width = 77
          Height = 17
          BorderStyle = sbsSunken
          Caption = '‘аиз боржундан'
          TabOrder = 2
        end
        object CBMountlyRent: TCheckBox
          Left = 5
          Top = 64
          Width = 194
          Height = 17
          Caption = 'јйлыг  юд€м€л€р  мювжуддур.'
          TabOrder = 0
          OnClick = CBMountlyRentClick
        end
        object MounthlyAmount: TEdit
          Left = 84
          Top = 16
          Width = 121
          Height = 21
          Enabled = False
          TabOrder = 3
          Text = '0.00'
          OnKeyPress = AmountEditKeyPress
        end
        object MounthlyPercent: TEdit
          Left = 84
          Top = 40
          Width = 121
          Height = 21
          Enabled = False
          TabOrder = 4
          Text = '0.00'
          OnKeyPress = AmountEditKeyPress
        end
      end
      object Panel8: TPanel
        Left = 1
        Top = 147
        Width = 223
        Height = 24
        Align = alTop
        BevelOuter = bvSpace
        Color = clScrollBar
        TabOrder = 3
        object Label5: TLabel
          Left = 98
          Top = 5
          Width = 38
          Height = 13
          Caption = '‘аизл€р'
          Color = clScrollBar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
      end
      object GroupBox14: TGroupBox
        Left = 1
        Top = 171
        Width = 223
        Height = 63
        Align = alTop
        Caption = 'ясас борж цзр€ иллик фаиз'
        TabOrder = 5
        object SBBrowse: TSpeedButton
          Left = 192
          Top = 36
          Width = 23
          Height = 22
          Enabled = False
          Glyph.Data = {
            DE000000424DDE0000000000000076000000280000000D0000000D0000000100
            0400000000006800000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7000777707707777700077770070077770007777060060777000000006606607
            7000066666660660700006666666606600000666666606607000000006606607
            7000777706006077700077770070077770007777077077777000777777777777
            7000}
          Visible = False
          OnClick = SBBrowseClick
        end
        object PercentEdit: TEdit
          Left = 8
          Top = 16
          Width = 73
          Height = 21
          MaxLength = 5
          TabOrder = 0
          OnKeyPress = AmountEditKeyPress
        end
        object CBConstant: TCheckBox
          Left = 10
          Top = 40
          Width = 87
          Height = 17
          Caption = '  &‘аиз сабитдир'
          Checked = True
          State = cbChecked
          TabOrder = 1
          Visible = False
          OnClick = CBConstantClick
        end
      end
      object Panel9: TPanel
        Left = 1
        Top = 234
        Width = 223
        Height = 4
        Align = alTop
        TabOrder = 4
      end
      object GBOverduePercent: TGroupBox
        Left = 1
        Top = 238
        Width = 223
        Height = 62
        Align = alTop
        Caption = 'Ёежикдирилмиш борж цзр€ иллик  фаиз'
        TabOrder = 6
        object SBOverdueBrowse: TSpeedButton
          Tag = 1
          Left = 192
          Top = 36
          Width = 23
          Height = 22
          Enabled = False
          Glyph.Data = {
            DE000000424DDE0000000000000076000000280000000D0000000D0000000100
            0400000000006800000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7000777707707777700077770070077770007777060060777000000006606607
            7000066666660660700006666666606600000666666606607000000006606607
            7000777706006077700077770070077770007777077077777000777777777777
            7000}
          Visible = False
          OnClick = SBBrowseClick
        end
        object OverduePercentEdit: TEdit
          Left = 8
          Top = 16
          Width = 73
          Height = 21
          MaxLength = 5
          TabOrder = 0
          OnKeyPress = AmountEditKeyPress
        end
        object CBOverdueConstant: TCheckBox
          Left = 10
          Top = 40
          Width = 87
          Height = 17
          Caption = '  &‘аиз сабитдир'
          Checked = True
          State = cbChecked
          TabOrder = 1
          Visible = False
          OnClick = CBOverdueConstantClick
        end
      end
      object Panel10: TPanel
        Left = 1
        Top = 300
        Width = 223
        Height = 24
        Align = alTop
        BevelOuter = bvSpace
        Color = clScrollBar
        TabOrder = 7
        object Label6: TLabel
          Left = 98
          Top = 5
          Width = 35
          Height = 13
          Caption = 'ƒиэ€р '
          Color = clScrollBar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
      end
      object GroupBox16: TGroupBox
        Left = 1
        Top = 324
        Width = 223
        Height = 38
        Align = alTop
        Caption = 'ћцшт€ринин типи'
        TabOrder = 8
        object CBClientType: TDBViewComboBox
          Left = 68
          Top = 13
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          ListSource = DataModContract.DataSrcClientCategories
          ListFields = 'Category'
          FieldInterval = 5
          DropDownOnEnter = False
        end
      end
      object GBPledge: TGroupBox
        Left = 1
        Top = 362
        Width = 223
        Height = 38
        Align = alTop
        Caption = 'Ёировун типи'
        TabOrder = 9
        object CBPledgeType: TDBViewComboBox
          Left = 8
          Top = 13
          Width = 105
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          ListSource = DataModContract.DataSrcPledgeTypes
          ListFields = 'Type'
          FieldInterval = 2
          DropDownOnEnter = False
        end
        object PledgePriceEdit: TEdit
          Left = 115
          Top = 12
          Width = 104
          Height = 21
          TabOrder = 1
          Text = '0'
          OnKeyPress = AmountEditKeyPress
        end
      end
      object GroupBox18: TGroupBox
        Left = 1
        Top = 400
        Width = 223
        Height = 38
        Align = alTop
        Caption = 'ћцгавил€нин типи'
        TabOrder = 10
        object CBContractType: TDBViewComboBox
          Left = 68
          Top = 15
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          ListSource = DataModContract.DataSrcCreditType
          ListFields = 'Type'
          FieldInterval = 5
          DropDownOnEnter = False
        end
      end
      object Panel11: TPanel
        Left = 1
        Top = 438
        Width = 223
        Height = 4
        Align = alTop
        TabOrder = 11
      end
      object Panel12: TPanel
        Left = 1
        Top = 481
        Width = 223
        Height = 41
        Align = alBottom
        TabOrder = 13
        object BtnApply: TButton
          Left = 34
          Top = 12
          Width = 71
          Height = 25
          Caption = '√€бул'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = BtnApplyClick
        end
        object BtnClose: TButton
          Left = 126
          Top = 12
          Width = 71
          Height = 25
          Caption = '»мтина'
          ModalResult = 2
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 1
        Top = 442
        Width = 223
        Height = 39
        Align = alClient
        Caption = 'Ёежикдирилмиш ≈щтиййат фаизи'
        TabOrder = 12
        TabStop = True
        object Edit1: TEdit
          Left = 157
          Top = 13
          Width = 59
          Height = 21
          TabStop = False
          AutoSelect = False
          Color = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object OverdueReliabilityViewer: TDBViewComboBox
          Left = 8
          Top = 14
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          OnChange = OverdueReliabilityViewerChange
          ListSource = DataModContract.DataSrcOverdueReliability
          ListFields = 'Reliability'
          FieldInterval = 5
          DropDownOnEnter = False
        end
      end
    end
  end
end
