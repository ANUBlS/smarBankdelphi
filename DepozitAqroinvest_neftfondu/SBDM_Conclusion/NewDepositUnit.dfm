object FrmNewDeposit: TFrmNewDeposit
  Left = 180
  Top = 180
  BorderStyle = bsDialog
  Caption = 'New Deposit '
  ClientHeight = 290
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LeftPanel: TPanel
    Left = 0
    Top = 0
    Width = 313
    Height = 290
    Align = alLeft
    TabOrder = 0
    object GBAcounts: TGroupBox
      Left = 1
      Top = 40
      Width = 311
      Height = 153
      Align = alTop
      Caption = 'ўесаблар'
      TabOrder = 1
      object Panel2: TPanel
        Left = 2
        Top = 15
        Width = 307
        Height = 45
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvSpace
        TabOrder = 0
        object DepositAccs: TSearchEdit
          Left = 3
          Top = 20
          Width = 138
          Height = 21
          TabOrder = 1
          Partnership = DepositAccNames
          DataSource = DataModuleNewDeposit.DataSrcDepositAccs
          SearchField = 'AccNo'
        end
        object DepositAccNames: TDBViewComboBox
          Left = 143
          Top = 20
          Width = 161
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 2
          OnChange = DepositAccNamesChange
          ListSource = DataModuleNewDeposit.DataSrcDepositAccs
          ListFields = 'ClientName'
          FieldInterval = 5
          DropDownOnEnter = False
        end
        object StaticText1: TStaticText
          Left = 2
          Top = 2
          Width = 303
          Height = 17
          Align = alTop
          Caption = '  ƒепозит ўесабы'
          Color = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
      end
      object Panel3: TPanel
        Left = 2
        Top = 60
        Width = 307
        Height = 45
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvSpace
        TabOrder = 1
        object ClientAccs: TSearchEdit
          Left = 3
          Top = 20
          Width = 138
          Height = 21
          TabOrder = 1
          Partnership = ClientAccNames
          DataSource = DataModuleNewDeposit.DataSrcClientAccs
          SearchField = 'AccNo'
        end
        object ClientAccNames: TDBViewComboBox
          Left = 143
          Top = 20
          Width = 161
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 2
          OnChange = ClientAccNamesChange
          ListSource = DataModuleNewDeposit.DataSrcClientAccs
          ListFields = 'ClientName'
          FieldInterval = 5
          DropDownOnEnter = False
        end
        object StaticText2: TStaticText
          Left = 2
          Top = 2
          Width = 303
          Height = 17
          Align = alTop
          Caption = '  ћцшт€ри ўесабы'
          Color = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
      end
      object Panel4: TPanel
        Left = 2
        Top = 105
        Width = 307
        Height = 45
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvSpace
        TabOrder = 2
        object InterestAccs: TSearchEdit
          Left = 3
          Top = 20
          Width = 138
          Height = 21
          TabOrder = 1
          Partnership = InterestAccNames
          DataSource = DataModuleNewDeposit.DataSrcInterestAccs
          SearchField = 'AccNo'
        end
        object InterestAccNames: TDBViewComboBox
          Left = 143
          Top = 20
          Width = 161
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 2
          OnChange = InterestAccNamesChange
          ListSource = DataModuleNewDeposit.DataSrcInterestAccs
          ListFields = 'ClientName'
          FieldInterval = 5
          DropDownOnEnter = False
        end
        object StaticText3: TStaticText
          Left = 2
          Top = 2
          Width = 303
          Height = 17
          Align = alTop
          Caption = '  ‘аизл€р ўесабы'
          Color = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object GBCurrency: TGroupBox
      Left = 1
      Top = 1
      Width = 311
      Height = 39
      Align = alTop
      Caption = '¬алйута'
      TabOrder = 0
      object CmbBoxCurrencys: TDBViewComboBox
        Left = 4
        Top = 14
        Width = 204
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = CmbBoxCurrencysChange
        ListSource = DataModuleNewDeposit.DataSrcCurrencys
        ListFields = 'Valu_Name'
        FieldInterval = 5
        DropDownOnEnter = False
        FirstAfterOpen = True
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 198
      Width = 311
      Height = 43
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvSpace
      TabOrder = 2
      object StaticText4: TStaticText
        Left = 2
        Top = 2
        Width = 307
        Height = 17
        Align = alTop
        Caption = 
          '             јчылма  тарихи                               Ѕаьлан' +
          'ма  тарихи'
        Color = clBtnFace
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object DTPOpenDate: TDateTimePicker
        Left = 3
        Top = 19
        Width = 140
        Height = 21
        CalAlignment = dtaLeft
        Date = 37630.6331168866
        Time = 37630.6331168866
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
      object DTPCloseDate: TDateTimePicker
        Left = 146
        Top = 19
        Width = 160
        Height = 21
        CalAlignment = dtaLeft
        Date = 37630.6331168866
        Time = 37630.6331168866
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 2
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 193
      Width = 311
      Height = 5
      Align = alTop
      TabOrder = 3
    end
    object Panel12: TPanel
      Left = 1
      Top = 241
      Width = 311
      Height = 45
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvSpace
      TabOrder = 4
      object StaticText10: TStaticText
        Left = 2
        Top = 2
        Width = 307
        Height = 17
        Align = alTop
        Caption = 'ћцгавил€нин нюм€си'
        Color = clSilver
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object ContractNoEdit: TEdit
        Left = 3
        Top = 20
        Width = 198
        Height = 21
        TabOrder = 1
      end
    end
  end
  object Panel8: TPanel
    Left = 313
    Top = 0
    Width = 302
    Height = 290
    Align = alClient
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 1
      Top = 46
      Width = 300
      Height = 107
      Align = alTop
      Caption = '‘аизл€р'
      TabOrder = 1
      object Panel6: TPanel
        Left = 2
        Top = 60
        Width = 296
        Height = 45
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvSpace
        TabOrder = 1
        object StaticText5: TStaticText
          Left = 2
          Top = 2
          Width = 292
          Height = 17
          Align = alTop
          Caption = 'ћцдд€тинд€н €вв€л эотцрцлмцш €ман€тл€р цчцн фаиз д€р€ж€си'
          Color = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object OverduePercentEdit: TEdit
          Left = 3
          Top = 20
          Width = 121
          Height = 21
          TabOrder = 1
          Text = '0'
        end
      end
      object Panel7: TPanel
        Left = 2
        Top = 15
        Width = 296
        Height = 45
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvSpace
        TabOrder = 0
        object StaticText6: TStaticText
          Left = 2
          Top = 2
          Width = 292
          Height = 17
          Align = alTop
          Caption = 'яман€тл€рин  иллик фаиз д€р€ж€си'
          Color = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object PercentEdit: TEdit
          Left = 3
          Top = 20
          Width = 121
          Height = 21
          TabOrder = 1
          Text = '0'
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 153
      Width = 300
      Height = 109
      Align = alTop
      TabOrder = 2
      object Panel10: TPanel
        Left = 2
        Top = 15
        Width = 296
        Height = 45
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvSpace
        TabOrder = 0
        object StaticText8: TStaticText
          Left = 2
          Top = 2
          Width = 292
          Height = 17
          Align = alTop
          Caption = 'ћцшт€ринин  типи'
          Color = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object ClientTypes: TDBViewComboBox
          Left = 3
          Top = 21
          Width = 204
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          ListSource = DataModuleNewDeposit.DataSrcClientCategories
          ListFields = 'Category'
          FieldInterval = 5
          DropDownOnEnter = False
          FirstAfterOpen = True
        end
      end
      object Panel11: TPanel
        Left = 2
        Top = 60
        Width = 296
        Height = 45
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvSpace
        TabOrder = 1
        object StaticText9: TStaticText
          Left = 2
          Top = 2
          Width = 292
          Height = 17
          Align = alTop
          Caption = 'ћцгавил€нин типи'
          Color = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object ContractTypes: TDBViewComboBox
          Left = 3
          Top = 21
          Width = 204
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          ListSource = DataModuleNewDeposit.DataSrcdepositTypes
          ListFields = 'Type'
          FieldInterval = 5
          DropDownOnEnter = False
          FirstAfterOpen = True
        end
      end
    end
    object ApplyButton: TButton
      Left = 143
      Top = 263
      Width = 75
      Height = 25
      Caption = '&√€бул'
      TabOrder = 3
      OnClick = ApplyButtonClick
    end
    object CancelButton: TButton
      Left = 223
      Top = 263
      Width = 75
      Height = 25
      Caption = '&»мтина'
      ModalResult = 2
      TabOrder = 4
    end
    object Panel9: TPanel
      Left = 1
      Top = 1
      Width = 300
      Height = 45
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvSpace
      TabOrder = 0
      object StaticText7: TStaticText
        Left = 2
        Top = 2
        Width = 296
        Height = 17
        Align = alTop
        Caption = ' ћяЅЋя№'
        Color = clSilver
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object AmountEdit: TEdit
        Left = 3
        Top = 20
        Width = 150
        Height = 21
        TabOrder = 1
        Text = '0'
      end
    end
  end
end
