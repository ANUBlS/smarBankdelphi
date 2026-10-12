object CreditsManagerForConstruction: TCreditsManagerForConstruction
  Left = 0
  Top = 193
  Width = 1024
  Height = 667
  Caption = 'CreditsManagerForConstruction'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  OnDestroy = ActiveFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 1024
    Height = 626
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object FilterPanel: TPanel
      Left = 2
      Top = 2
      Width = 189
      Height = 622
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      Visible = False
      object Panel2: TPanel
        Left = 2
        Top = 2
        Width = 185
        Height = 18
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = clNavy
        TabOrder = 0
        object Panel1: TPanel
          Left = 168
          Top = 2
          Width = 15
          Height = 14
          Align = alRight
          Caption = 'X'
          TabOrder = 0
          OnClick = SpeedButton1Click
        end
      end
      object GroupBox1: TGroupBox
        Left = 2
        Top = 300
        Width = 185
        Height = 70
        Align = alTop
        Caption = 'Binan'#305'n giri'#351'i'
        TabOrder = 1
        object CurrencyViewer: TDBViewComboBox
          Left = 8
          Top = 20
          Width = 173
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnChange = ActnFilterExecute
          ListSource = DatModConstruction.entranceSrc
          ListFields = 'entrance'
          FieldInterval = 5
          DropDownOnEnter = False
          FirstAfterOpen = True
        end
        object Checkboxentrance: TCheckBox
          Left = 3
          Top = 47
          Width = 170
          Height = 17
          Caption = 'T'#601'tbiq et'
          TabOrder = 1
          OnClick = ActnFilterExecute
        end
      end
      object GroupBox2: TGroupBox
        Left = 2
        Top = 160
        Width = 185
        Height = 70
        Align = alTop
        Caption = 'Bina'
        TabOrder = 2
        object DBViewComboBox1: TDBViewComboBox
          Left = 3
          Top = 21
          Width = 173
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnChange = ActnFilterExecute
          ListSource = DatModConstruction.buildingsDatSrc
          ListFields = 'BLD_NAME'
          FieldInterval = 5
          DropDownOnEnter = False
          FirstAfterOpen = True
        end
        object CheckBoxBuilding: TCheckBox
          Left = 5
          Top = 47
          Width = 170
          Height = 17
          Caption = 'T'#601'tbiq et'
          TabOrder = 1
          OnClick = ActnFilterExecute
        end
      end
      object GroupBox3: TGroupBox
        Left = 2
        Top = 90
        Width = 185
        Height = 70
        Align = alTop
        Caption = #350'irk'#601't'
        TabOrder = 3
        object CoBCompany: TDBViewComboBox
          Left = 3
          Top = 20
          Width = 173
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnChange = ActnFilterExecute
          ListSource = DatModConstruction.ComponiesDatScr
          ListFields = 'COMP_NAME'
          FieldInterval = 5
          DropDownOnEnter = False
          FirstAfterOpen = True
        end
        object CheckBoxCompany: TCheckBox
          Left = 5
          Top = 47
          Width = 170
          Height = 17
          Caption = 'T'#601'tbiq et'
          TabOrder = 1
          OnClick = ActnFilterExecute
        end
      end
      object GroupBox4: TGroupBox
        Left = 2
        Top = 230
        Width = 185
        Height = 70
        Align = alTop
        Caption = 'M'#601'nzil'
        TabOrder = 4
        object DBViewComboBox3: TDBViewComboBox
          Left = 3
          Top = 21
          Width = 173
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnChange = ActnFilterExecute
          ListFields = 'FLATNUMBER'
          FieldInterval = 5
          DropDownOnEnter = False
          FirstAfterOpen = True
        end
        object CheckBoxFlats: TCheckBox
          Left = 5
          Top = 47
          Width = 170
          Height = 17
          Caption = 'T'#601'tbiq et'
          TabOrder = 1
          OnClick = ActnFilterExecute
        end
      end
      object GroupBox5: TGroupBox
        Left = 2
        Top = 20
        Width = 185
        Height = 70
        Align = alTop
        Caption = 'Filiallar'
        TabOrder = 5
        object DBViewComboBox4: TDBViewComboBox
          Left = 3
          Top = 20
          Width = 173
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnChange = ActnFilterExecute
          ListSource = DatModConstruction.FilialsDatSrc
          ListFields = 'name'
          FieldInterval = 5
          DropDownOnEnter = False
          FirstAfterOpen = True
        end
        object CheckBoxFilials: TCheckBox
          Left = 5
          Top = 47
          Width = 170
          Height = 17
          Caption = 'T'#601'tbiq et'
          TabOrder = 1
          OnClick = ActnFilterExecute
        end
      end
      object GroupBox6: TGroupBox
        Left = 2
        Top = 370
        Width = 185
        Height = 70
        Align = alTop
        Caption = #304'stifad'#601#231'i'
        TabOrder = 6
        object DBViewComboBox2: TDBViewComboBox
          Left = 3
          Top = 21
          Width = 173
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnChange = ActnFilterExecute
          ListSource = DatModConstruction.UsersDatSrc
          ListFields = 'name'
          FieldInterval = 5
          DropDownOnEnter = False
          FirstAfterOpen = True
        end
        object CheckboxUsers: TCheckBox
          Left = 5
          Top = 47
          Width = 170
          Height = 17
          Caption = 'T'#601'tbiq et'
          TabOrder = 1
          OnClick = ActnFilterExecute
        end
      end
      object RadioGrpCont: TRadioGroup
        Left = 0
        Top = 440
        Width = 187
        Height = 105
        Caption = 'Filter Contracts'
        Color = clBtnFace
        ItemIndex = 0
        Items.Strings = (
          'Aktiv m'#252'qavil'#601'l'#601'r'
          'Ba'#287'lanm'#305#351' m'#252'qavil'#601'l'#601'r'
          #304'mtina olunmu'#351' m'#252'qavil'#601'l'#601'r')
        ParentBackground = False
        ParentColor = False
        TabOrder = 7
        OnClick = RadioGrpContClick
      end
    end
    object Panel4: TPanel
      Left = 191
      Top = 2
      Width = 831
      Height = 622
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Panelsearch: TGroupBox
        Left = 2
        Top = 562
        Width = 827
        Height = 58
        Align = alBottom
        Caption = 'Axtar'#305#351' paneli'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Visible = False
        object Panel5: TPanel
          Left = 2
          Top = 15
          Width = 137
          Height = 41
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
            Caption = 'M'#252'qavil'#601' N-si'
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
          end
          object Editcontnum: TEdit
            Left = 2
            Top = 16
            Width = 133
            Height = 21
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnExit = EditcontnumExit
            OnKeyPress = EditcontnumKeyPress
          end
        end
        object Panel7: TPanel
          Left = 139
          Top = 15
          Width = 137
          Height = 41
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
            Caption = 'Kredit hesab N-si'
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
          end
          object EditACCNO: TEdit
            Left = 2
            Top = 16
            Width = 133
            Height = 21
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnExit = EditcontnumExit
            OnKeyPress = EditcontnumKeyPress
          end
        end
        object Panel8: TPanel
          Left = 276
          Top = 15
          Width = 137
          Height = 41
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
            Caption = 'M'#252#351't'#601'ri'
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
          end
          object EditCUSTNAME: TEdit
            Left = 0
            Top = 16
            Width = 133
            Height = 21
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnExit = EditcontnumExit
            OnKeyPress = EditcontnumKeyPress
          end
        end
        object Panel9: TPanel
          Left = 687
          Top = 15
          Width = 137
          Height = 41
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
            Caption = 'M'#252'qavil'#601'nin d'#601'y'#601'ri'
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
          end
          object EditCreditsCREDITAMOUNT: TEdit
            Left = 2
            Top = 16
            Width = 133
            Height = 21
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnExit = EditcontnumExit
            OnKeyPress = EditcontnumKeyPress
          end
        end
        object Panel10: TPanel
          Left = 550
          Top = 15
          Width = 137
          Height = 41
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
            Caption = 'Ba'#287'lanma tarixi'
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
          end
          object EditClosedate: TEdit
            Left = 2
            Top = 16
            Width = 133
            Height = 21
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnExit = EditcontnumExit
            OnKeyPress = EditcontnumKeyPress
          end
        end
        object Panel11: TPanel
          Left = 413
          Top = 15
          Width = 137
          Height = 41
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
            Caption = 'A'#231#305'lma tarixi'
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
          end
          object Editopendate: TEdit
            Left = 2
            Top = 16
            Width = 133
            Height = 21
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnExit = EditcontnumExit
            OnKeyPress = EditcontnumKeyPress
          end
        end
      end
      object CommonGrid: TDBGrid
        Left = 2
        Top = 2
        Width = 827
        Height = 383
        Align = alClient
        DataSource = DatModConstruction.CreditsDatSrc
        FixedColor = clActiveCaption
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        PopupMenu = PopupMenu1
        TabOrder = 1
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = CommonGridDrawColumnCell
        OnDblClick = ActnEditContractExecute
        OnTitleClick = CommonGridTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ROWNUM'
            Title.Caption = #8470
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTNUM'
            Title.Caption = 'M'#252'qavil'#601' N-si'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 119
            Visible = True
          end
          item
            Expanded = False
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ACCNO'
            Title.Caption = 'Kredit hesab'#305
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTNAME'
            Title.Caption = 'M'#252#351't'#601'ri'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VAL_NAME'
            Title.Caption = '$'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPENDATE'
            Title.Caption = 'A'#231#305'lma tarixi'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLOSEDATE'
            Title.Caption = 'Ba'#287'lanma tarixi'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITAMOUNT'
            Title.Caption = 'M'#252'qavil'#601'nin d'#601'y'#601'ri'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REST'
            Title.Caption = 'Borc m'#601'bl'#601#287'i'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMP_NAME'
            Title.Caption = 'Layih'#601
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 154
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BLD_NAME'
            Title.Caption = 'Binan'#305'n N-si'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FLATNUMBER'
            Title.Caption = 'M'#601'nzilin N-si  '
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENTRANCE'
            Title.Caption = 'Giri'#351
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FFLOOR'
            Title.Caption = 'M'#601'rt'#601'b'#601
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AREA'
            Title.Caption = 'M'#601'nzilin sah'#601'si (kv.m)'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = True
          end>
      end
      object Memo1: TMemo
        Left = 2
        Top = 385
        Width = 827
        Height = 177
        Align = alBottom
        TabOrder = 2
        Visible = False
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1024
    Height = 41
    ButtonHeight = 36
    ButtonWidth = 108
    Caption = 'ToolBar1'
    Images = ImageList1
    ShowCaptions = True
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = ActnAddContract
      Caption = '        Yeni m'#252'qavil'#601'    '
    end
    object ToolButton3: TToolButton
      Left = 108
      Top = 0
      Action = ActnEditContract
      Caption = 'Redakt'#601
      ImageIndex = 3
    end
    object ToolButton4: TToolButton
      Left = 216
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 224
      Top = 0
      Action = ActnRefresh
      Caption = 'Yenil'#601'm'#601'k'
      ImageIndex = 4
    end
    object ToolButton8: TToolButton
      Left = 332
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 340
      Top = 0
      Action = ActnCloseContract
      Caption = 'Ba'#287'lamaq'
      ImageIndex = 6
    end
    object ToolButton10: TToolButton
      Left = 448
      Top = 0
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object ToolButton11: TToolButton
      Left = 456
      Top = 0
      Action = ActnSettings
      Caption = 'Se'#231'm'#601'l'#601'r'
      DropdownMenu = PopupMenu2
      ImageIndex = 8
      Style = tbsDropDown
    end
    object ToolButton6: TToolButton
      Left = 577
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 585
      Top = 0
      Caption = 'Filter paneli'
      ImageIndex = 7
      Wrap = True
      OnClick = ToolButton9Click
    end
  end
  object ImageList1: TImageList
    Left = 8
    Top = 596
    Bitmap = {
      494C01010D000F00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001001000000000000020
      0000000000000000000000000000000000000040004000400040004000400040
      0040004000400040004000400040004000400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000040004000400040004000400040
      0040004000400040FF7FE07F0042004000400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000040004000400040004000400040
      0040004000400040FF7FE07F0042004000400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000040004000400040004000400040
      0040004000400040FF7FE07F0042004000400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000040004000400040004000401042
      0040004000400040FF7FE07F0042004000400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000040004000400040186310421042
      0040104200400040FF7FE07F0042004000400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000040004018631042186310421042
      0040104200400040FF7FE07F0042004000400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000040104218631042186310421042
      0040104200400040FF7FE07FE07F004000400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000040104218631042186310421042
      004010420040E07FE07FFF7FFF7FE07F00400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000040104218631042186310421042
      0040104200400040004200420042004000400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000040104218631042186310421042
      0040104200400040004000400040004000400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004010421863104218631042FF7F
      00401042004000400040FF7F0042004000400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000040104218631042100218631863
      1863FF7F004000400040FF7F0042004000400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000401042FF7F1863FF7F1002FF7F
      10420040004000400040FF7F0042004000400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000401042FF7F1863FF7F10420040
      00400040004000400040FF7FE07F004000400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000040004000401042004000400040
      00400040004000400042E07FFF7F004200400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000596B596B596B596B1042596B596B
      596B596B596B596B596B596B596B596B596B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000596B596B596BFF031042596B0000
      596B596B0000596B0000596B596B0000596B0000000000000000000000000000
      0000000010420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042186300000000
      000000000000000000000000000000000000596B596BFF031002596BFF7F0000
      596B596B596B596B0000FF7F596B596B596B0000000000000000000000000000
      10420000FF7F0000104200000000000000000000000000420042000010420000
      0000000000000000000000000000000000000000104200000000104218630000
      000000000000000000000000000000000000596BFF031002E003000000001002
      1042596B0000596B0000596BFF7F596B596B0000000000000000000018631863
      18631863FF7F1863186300001042000000000000000018630042004200000000
      00000000000000000000000000000000000000001042000000000000FF7F0000
      000000000000000000000000000000000000FF031002E003E003E003E003E003
      FF031042596B596B596B00000000596B596B000000001863FF7FFF7FFF7FFF7F
      10420000FF7F1042104218631863000000000000000000421863004200421042
      0000000000000000000000000000000000000000104218630000186318631042
      000000000000000000000000000000000000596BFF03E003E003E003E003E003
      E003FF031042596B596B596B596B596B596B1042FF7FFF7FFF7FFF7F10420000
      FF7FFF7F1042FF7F186318631863000000000000000000000042186300420000
      104210421042104210420000000000000000000000001042FF7FFF7F18631863
      10420000000000000000000000000000000000001002FF03E003E0031002E003
      1002E003FF031042596B0000596B0000596B00000000000010420000FF7FFF7F
      104210421042FF7F104218631863000000000000000000000000000000420042
      00421042186318631042000010420000000000000000000000000000FF7F1863
      1863104200000000000000000000000000000000E003596BFF03E00310021002
      E003E003E003FF0310420000596B0000596B0000000000000000FF7F1042E07F
      1042000000000000FF7F10421863000000000000000000000000000000000042
      1042FF7F1863186318631042000000000000000000000000000000000000FF7F
      186318631042000000000000000000000000596B000010021002FF03E0031002
      1002E003E003E003FF031042596B596B596B0000000000000000104218630000
      0000000010421863FF7F1042FF7F000000000000000000000000000000001042
      FF7F1F001F001F001F0018631042104200000000000000000000000000000000
      FF7F18631863104200000000000000000000596B596B00001002596BFF03E003
      E003E0031002E0031002FF031042596B596B0000000000000000000010420000
      10421863FF7F0000FF7F000000000000000000000000000000001F000000FF7F
      18631F00186318631F00186318631F0000000000000000000000000000000000
      0000FF7F1863186318631863000000000000596B596B596B00001002596BFF03
      E003E003E0031002FF031042596B596B596B0000000000000000000000001042
      FF7F0000FF7FFF7F0000FF7F00000000000000000000000000001F000000FF7F
      18631F00FF7F1F00FF7F18631863000000000000000000000000000000000000
      00000000FF7F186300001042186300000000596BE07FE07F596B00001002596B
      FF0310021002FF03100200001042596B596B0000000000000000000000001042
      FF7FFF7F0000FF7F0000FF7F000000000000000000000000000000001F001042
      FF7F1F001F001F001863FF7F10421F0000000000000000000000000000000000
      00000000FF7F0000000000001042000000000000E07FE07F0000596B00001002
      1002FF03FF03100210020000596B596B596B0000000000000000000000000000
      FF7FFF7F0000FF7FFF7FFF7FFF7F000000000000000000000000000000000000
      1042FF7F18631863FF7F10420000000000000000000000000000000000000000
      000000001042186300000000000000000000596BE07FE07F596B596B596B0000
      1002596B100210020000596B596B596B596B0000000000000000000000000000
      1042FF7FFF7FFF7FFF7FFF7F1042000000000000000000000000000000000000
      00001042FF7FFF7F104200000000000000000000000000000000000000000000
      000000000000104210421042000000000000596B596B596B0000596B0000596B
      0000E00310020000596B596B596B596B596B0000000000000000000000000000
      0000FF7FFF7FFF7F104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000596B596B596B0000596B0000596B
      596B00000000596B596B596B596B596B596B0000000000000000000000000000
      0000000010420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C000000000000000000000000
      0000000000000000000000000000007C007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000400040000018631863
      1042104200000000FF7F0000000000000000007C007C0000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F007C007C007C0000000000000000004200000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004000401863FF7F1042
      104218631042000000000000000000000000007C007C007CFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F007C007C007C0000000000000042E07F004200000000
      0000000000000000000000000000000000000000000000000000000000001042
      1000104200000000000000000000000000000000000000400040186310421042
      1863186318631863000000000000000000000000007C007C007CFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F007C007C007C00000000000000000000FF7F004200000000
      0000000000000000000000000000000000000000000000000000104210001000
      1042000000000000000000000000000000000000000000400040186318630000
      10421863100218631002000000000000000000001042007C007C007CFF7FFF7F
      FF7FFF7FFF7F007C007C007C0000000000000000000000000042004200000000
      000000000000000000001F000000000000000000000000000000100010001042
      0000000000000000000000000000000000000000000000400040FF7FFF7FFF7F
      18630000186300001002104200000000000000001042FF7F007C007C007CFF7F
      FF7FFF7F007C007C007CFF7F000000000000000000000000FF7F004200000000
      1042000010421F001F0010421042104200000000000000001042100010420000
      000000000000000000000000000000000000000000000040004010421863FF7F
      FF7FFF7F104210421863186310420000000000001042FF7FFF7F007C007C007C
      FF7F007C007C007CFF7FFF7F000000000000000000000000004200420000FF7F
      E07FFF7FFF7F004200420042FF7F000000000000000000001000100000000000
      0000000000000000000000000000000000000000000000000000000000000000
      10420000104210421863104210421042000000001042FF7FFF7FFF7F007C007C
      007C007C007CFF7FFF7FFF7F000000000000000000000042E07F00420000FF7F
      FF7FFF7F00421863186300421863104200000000000000001000100000000000
      0000100010001000100010000000000000000000000000000000000000000000
      00000000000010421042104210420000000000001042FF7FFF7FFF7FFF7F007C
      007C007C007CFF7FFF7FFF7F000000000000000000000000FF7F00420000FF7F
      E07FFF7F0042004218630042FF7F104200000000000000001000100010420000
      0000000010421000100010000000000000000040000018631863186310420000
      0000FF7F000000001042104200000000000000001042FF7FFF7FFF7F007C007C
      007C007C007C007CFF7FFF7F00000000000000000000FF7FE07FE07F0042FF7F
      FF7FFF7FFF7F00420042FF7FFF7F000000000000000000001042100010001042
      00001042100010001000100000000000000000400000FF7FFF7F104210421042
      00000000000000000000000000000000000000001042FF7FFF7F007C007C007C
      FF7FFF7F007C007C007CFF7F0000000000000000FF7FE07F10421042E07F0042
      FF7F1F00FF7FE07FFF7F1F00E07F104200000000000000000000100010001000
      10001000100010001042100000000000000000400000FF7F1042104218631002
      10020000000000000000000000000000000000001042FF7F007C007C007C0000
      1863FF7FFF7F007C007C007C0000000000000042E07FE07FE07FE07FE07FE07F
      00001F00FF7FFF7F1F001F00E07F000000000000000000000000000010421000
      10001000104200000000100000000000000000400000FF7FFF7F000018630000
      18631863000000000000000000000000000000001042007C007C007CFF7F1863
      0000FF7FFF7FFF7F007C007C007C000000000042E07FE07F1042FF7FE07FE07F
      0000FF7FFF7FFF7FFF7FFF7FFF7F104200000000000000000000000000000000
      0000000000000000000000000000000000000040000010421042FF7FFF7F1042
      1002186310420000000000000000000000000000007C007C007CFF7F0000FF7F
      1863FF7FFF7FFF7F1863007C007C007C00000000FF7FE07F10421042E07F0042
      1042104210421042104210420000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001042
      104210421042104200000000000000000000007C007C007C1042104210420000
      104210421042104200000000007C007C007C00000000FF7FFF7FFF7F00420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      104210421042000000000000000000000000007C007C10421042000010421042
      1042104200000000000000000000007C007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001700FF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
      0000170017001700FF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001000
      0002100000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7F0000104200000000000000000000000000000000000000000000
      1700170017001700FF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010000002
      0002000200000000000000000000000000000000000000000000FF7FFF7FFF7F
      00000000FF7F0000104200000000000000000000000000000000000000001700
      17001700FF7F17001700FF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000100000020002
      0002000210000000000000000000000000000000000000000000FF7FFF7F0000
      00000000000000001042000000000000000000000000FF7FFF7FFF7F17001700
      1700FF7F0000000017001700FF7F000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000020002E003
      E003000200021000000000000000000000000000000000000000FF7F10420000
      00000000000000001042000000000000000000000000FF7F1042104210421700
      FF7FFF7F0000000000001700FF7F000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000002E0030000
      0000E00300020002100000000000000000000000000000000000FF7F00000000
      FF7F0000000000001042000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000001700FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E00300000000
      0000000000020002000200000000000000000000000000000000FF7F0000FF7F
      FF7FFF7F000000001042000000000000000000000000FF7F1042104210421042
      1042FF7F000000000000000000001700FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000E0030002000210000000000000000000000000000000FF7FFF7FFF7F
      FF7F0000000000001042000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000000000000017000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000E00300020002100000000000000000000000FF7FFF7FFF7F
      FF7F0000000000000000104200000000000000000000FF7F1042104200000000
      0000FF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000020002000200000000000000000000000000000000
      00000000000010420000000000000000000000000000FF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E0030002000200000000000000000000000000000000
      00000000000000000000000010420000000000000000FF7F1042104200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000E003000200000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000
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
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF0000FFFFFFFFFFFF0000FF1FFFFF
      E3FF0000FC07C3FFB1FF0000E003C3FF99FF00008001C1FF81FF00000001E00F
      C0FF0000E001F803F87F0000F001FC03FC3F0000F001FC01FE070000F807F401
      FF030000FC07F403FF930000FC03F801FF9B0000FE01FC03FF8F0000FE03FE07
      FFC70000FF0FFFFFFFFF0000FFBFFFFFFFFFFE3F6000FFFFFFFFC0070000E7FF
      FFFFC0030001C3FFFC7FC0038003E3F7F0FFC0018003E397F1FFC0018003E001
      E3FFC0008003E001E7FFFE818003C001E707F9C38003E001E38700678003C001
      E107003F80038001F007003F80030001F837001F80030001FFFF000F80018005
      FFFFFC1F0018C3FFFFFFFE3F007CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F
      FFFFFEFFE00FFF0FFFFFFC7FE00FFE0FFC7FF87FE00F8007FC7FF03FE00F8023
      FC7FF01FE00F8033E00FF30FE00F8039E00FF78FE00F803CE00FFF87E00F803E
      FC7FFFE1E007873FFC7FFFF1E047803FFC7FFFF1FFE3857FFFFFFFF9FFF380FF
      FFFFFFFFFFFF81FFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList1
    OwnerDraw = True
    Left = 40
    Top = 596
    object N1: TMenuItem
      Caption = 'Yeni m'#252'qavil'#601
      ImageIndex = 0
      ShortCut = 16462
      OnClick = ActnAddContractExecute
    end
    object Mqavilap2: TMenuItem
      Bitmap.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B8ABAAAAACABABAAA9A9A9A7A7
        A9A7A7A9A7A7A8A6A6A9A7A7A8A6A6A7A4A4A6A3A3A5A2A2ABAAAAFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBEBEAFAAAAAFAEAEA9A7A7D4C1C1E5
        CBCBE7CCCCECCFCFECCECEEBCECEECCDCDECCCCCECCBCBECCCCCEECDCDDBC1C1
        A9A7A7ADACACAEABABC0BFBFFFFFFFFFFFFFFFFFFFB1AEAECAB3B3E0BDBDADA6
        A6B1B1B1B3A8A8C1AFAFC7B1B1CCB4B4CEB4B4CDB3B3CDB3B3CDB4B4CAB2B2C5
        B0B0C0ADADB1A8A8B9B8B8AFA9A9DDBBBBC9B2B2B2AEAEFFFFFFBBBABAC8B1B1
        FBCACAF9C9C9BAABABB3B3B3B3B3B3ADADADADACACA8A8A8A9A8A8ADACACAEAE
        AEAAAAAAAAA9A9AFAFAFB2B1B1B9B8B8BBBABAB6A9A9F7C8C8FBCACAC7B0B0BE
        BDBDA8A4A4E9C1C1FECBCBFECBCBEDC3C3D0B5B5C5AFAFC0ADADBBABABBBABAB
        BAAAAAB6A9A9B5A9A9B7AAAABBABABBBACACBDACACC2AFAFCCB3B3E9C1C1FDCB
        CBFECBCBE7C0C0AAA7A7A69F9FF1C5C5FECBCBFECCCCFFCCCCFFCCCCFECCCCFD
        CCCCFECCCCFDCBCBFDCCCCFACACAFAC9C9FBCBCBFDCCCCFECBCBFECCCCFDCCCC
        FFCCCCFECCCCFECCCCFECBCBECC2C2A9A4A4A6A0A0F1C6C6FFCCCCFECCCCFFCD
        CDFFCCCCFFCDCDFECDCDFFCECEFFCFCFFFD1D1FED1D1FFD1D1FED1D1FFD0D0FF
        CECEFFCDCDFECDCDFFCCCCFECDCDFECCCCFECCCCEBC2C2A9A4A4A69F9FF1C6C6
        FFCDCDFED1D1FFD8D8FFDFDFFFE5E5FEEAEAFFEEEEFFF0F0FFF2F2FEF1F1FFF2
        F2FEF1F1FFF0F0FFEEEEFFEAEAFEE5E5FFDEDEFED8D8FED1D1FECDCDECC3C3A9
        A4A4A6A1A1F1D2D2FEE4E4FEEBEBFEEEEEFFF0F0FFF0F0FFF2F2FFF1F1FFF1F1
        FFF1F1FFF1F1FFF0F0FFF2F2FFF0F0FFF1F1FFF1F1FFF1F1FFF0F0FFEFEFFEEB
        EBFEE4E4ECCFCFA9A5A5A8A5A5ECDADAFEE8E8FEE8E8FFE9E9FFE9E9FFE9E9FE
        E9E9FFE9E9FFE9E9FFE9E9FEE9E9FFE9E9FEE9E9FFE9E9FFE9E9FFE9E9FEE8E8
        FFE9E9FEE9E9FEE8E8FEE8E8E9D7D7A9A7A7B4B3B3D2C1C1FDDFDFFEDFDFFFE0
        E0FFE0E0FFE0E0FEE0E0FFE0E0FEDFDFFEDFDFFEDFDFFEDFDFFEE0E0FEDFDFFF
        E0E0FFE0E0FEDFDFFFE0E0FEE0E0FEDFDFFDDFDFCFBFBFB6B5B5E0DFDFAFABAB
        DAC2C2F7D3D3FCD5D5FDD6D6FDD5D5FDD7D7FED6D6FDD5D5FDD5D5FDD6D6FDD5
        D5FDD7D7FDD5D5FED6D6FDD6D6FCD5D5FDD6D6FCD5D5F7D2D2D8C1C1AFABABE2
        E2E2FFFFFFDEDEDEB5B3B3B5ABABB9ADADB9ACACB7AAAABAADADBAADADB9ACAC
        B9ACACB9ADADB8ABABBAADADB9ACACBAADADBAADADB7AAAAB9ABABB9ADADB4AB
        ABB5B3B3E0DFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B3FE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEAEAEAE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFBEBEBEFCFCFCFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFE
        FEFEF8F8F8B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFBDBDBDFCFCFCFEFEFEFDFDFDFEFEFEFEFEFEFEFE
        FEFEFEFEFDFDFDFEFEFEF8F8F8B7B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEBEBEFDFDFDFFFFFFFEFEFE
        FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFF9F9F9B8B8B8FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBDBDFC
        FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9B8B8B8
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFBDBDBDFCFCFCFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFE
        FEFEF8F8F8B7B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFBDBDBDFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFFFF
        FFFEFEFEFEFEFEFEFEFEF8F8F8B7B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5B5B5FEFEFEFEFEFEFDFDFD
        FDFDFDFEFEFEFDFDFDFEFEFEFDFDFDFEFEFEFEFEFEB1B1B1FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7B6
        B6B6B5B5B5B5B5B5B5B5B5B5B5B5B4B4B4B5B5B5B5B5B5B5B5B5B6B6B6BABABA
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = 'M'#252'qavil'#601' '#231'ap'#305
      ShortCut = 16464
      OnClick = Mqavilap2Click
    end
    object Hesabat1: TMenuItem
      Bitmap.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFC7AB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFA27547B7916DFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9965329F6E3EA37649E2
        D5C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A68
        359966339F6E3E9C6B3ADCC9B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9A67349966339965329D6B3A9A6836C5A88CFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF9A67349966339864329764329B68369A6735
        B5916CF5F0EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A6734986533AB7A3EA4
        733B986532986432A6794CAC8259E9DFD4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A68
        35976432B28343CAA158B38549986633966330A37648A27345D7C3B0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9A6734986533B08141D6AF61D5B16ABF975DA06F3C935F2C9D6D
        3C9E6D3DC4A789FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF996633986533B08141D2AA5EDEBC72DDBD7E
        CAA66FA77846935F2B9966339A6836B99674FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996734976432B18242D2
        AA5EDBB86FE0C080E4C990D2B27FAD8251976330986431996633AD845BFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A67
        34976432B18241D1A95EDCB970DEBE7EE3C78EE7CF9DDDC397BB95699A673598
        6532A17243A37649FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9A6835976432B18243D2AA5DDBB86FDFBF80E1C58CE8D19FECD8
        AFCAA97E986633996633996633B18A64FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF9A6734966432B18242D2AA5EDCB96FDDBD7D
        E6CC93E2C996C5A374A5774796612E9B6937BA9774FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF996633976432B18242D1
        A95DDBB86FE2C382DABC83BA92609C6B3894612C9F6E3EC8AC91FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A67
        34976432B08141D2AB5EDCBA71D3B072AE824D95612E976431A5784CCFB79FFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9A6835976433B18343D1A95EC9A25EA5774196622F996734AC83
        59DCCAB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF9A6835986532AF8142BA8C4BA17039956230
        9D6B3AB89571E9DED3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A6734986532A0703898
        64329764319F6F3FC0A283F4EFE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A67
        349A6734996532996633A17243CEB69EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9A6835986633996734A27445DFCFBFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF9966339B6836AA8157F1E9E2FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C6A38BF9D7DFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDB3
        9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = 'Hesabat'
      ShortCut = 16456
      OnClick = Hesabat1Click
    end
    object N2: TMenuItem
      Action = ActnEditContract
      Caption = 'Redakt'#601
      ImageIndex = 3
      ShortCut = 16453
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Action = ActnRefresh
      Caption = 'Yenil'#601'm'#601'k'
      ImageIndex = 4
      ShortCut = 116
    end
    object Mqavildnimtina1: TMenuItem
      Bitmap.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFFFDFDFEF9F9FCD1D1E48989B94A4A932727801919781919
        7825257E4646918080B3C9C9DFF7F7FAFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFEFFFCFCFED7D7E87070AA252580151580212191
        2C2C9D3232A23232A22E2E9E22229216168220207E6666A4CFCFE3FBFBFDFEFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFF9F9FCAFAFD02F2F850B0B7F17
        17971E1EA22020A52121A62222A62222A62222A62020A51F1FA31818990C0C82
        272781A1A1C7F6F6FAFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9FC9D9DC51B1B
        7C04048706069905059A05059806069106068806068205058106068706068F06
        069705059A06069904048A15157A8D8DBBF6F6FAFEFEFFFFFFFFFFFFFFFCFCFE
        B2B2D21C1C7D04048B02029801019802028C08087C2D2D856161A18686B78888
        B86A6AA637378A0D0D7B02028902029702029804048E14147AA1A1C7FBFBFDFF
        FFFFFEFEFFDCDCEB34348704048602029801019801019702027D363687D0D0E3
        F6F6FAFCFCFDFCFCFDFAFAFCE8E8F2A7A7CA38388B0606810101960202980404
        8A272781CFCFE3FEFEFFFAFAFD7D7DB106067B03039701019801019801019802
        029407077C6969A6E8E8F2FBFBFDFCFCFDFDFDFEFCFCFDFAFAFCDADAE9505097
        05058002029703039805057F6666A4F6F6FADADAEA29298203038D0202980101
        8E02027F02029502029801019408087D6B6BA8EBEBF4FCFCFEFEFEFEFFFFFFFD
        FDFEFCFCFEDBDBEA38388B03038A0202980303901B1B7CC9C9DF9A9AC3070778
        02029601019704047D2E2E8307077C02029400009702029408087D6C6CA8EBEB
        F3FCFCFEFDFDFEFEFEFEFCFCFDFCFCFDA7A7CA0C0C7B01019602029703037A82
        82B45C5C9E0202810202990101921E1E7FC4C4DC6969A609097E010194000097
        0202940B0B7F6C6CA8ECECF4FBFBFDFEFEFEFDFDFDFDFDFEE8E8F138388B0202
        8E02029901018445459037378802028803039A02028C474792F1F1F7E8E8F26C
        6CA80B0B7E2121A02E2EAA3535A92727897070AAEBEBF3FBFBFDFDFDFDFDFDFE
        F9F9FB6A6AA602028503039A01018C21217C24247E02028C06069B0B0B8B6666
        A4FAFAFCFAFAFDEBEBF46D6DA82A2A8B5555B65C5CBC5555B62B2B8A6F6FAAEC
        ECF4FCFCFEFDFDFEFDFDFE8989B909098308089C01018F12127525257E121292
        3939AF32329B6363A2F9F9FBFCFCFDFCFCFDEBEBF36E6EA82727894F4FB35353
        B84F4FB32626896D6DA8EAEAF3FAFAFDFBFBFD8686B72828903D3DB112129512
        12753B3B8A30309A4E4EB83A3AA3474792F2F2F7FDFDFEFEFEFEFCFCFEECECF4
        7070AA2727894848B14D4DB64747B02424886D6DA8EAEAF3F7F7FA6262A23131
        9A4E4EB83434A026267F6363A323238C4545B43E3EAB252582CECEE1FCFCFDFE
        FEFEFEFEFEFBFBFDEBEBF37070A92222874141AE4343B23E3EAC1F1F866D6DA8
        CECEE23232883939A64646B42828944A4A93A1A1C719197E3A3AAC3C3CB01F1F
        8A7777AEF7F7FAFDFDFEFEFEFEFDFDFEFBFBFDECECF46C6CA82121873838AA3B
        3BAF3636A91E1E853434861D1D853A3AAE3C3CAE1919828989B9E0E0ED323286
        29299B3636AD2D2DA2212181B4B4D2FBFBFDFCFCFDFEFEFEFDFDFEFCFCFEEAEA
        F36D6DA81B1B843030A63333AC3131A716168429299D3535AD2C2CA0272781D2
        D2E4FCFCFD8686B71616812D2DA82D2DAA1F1F952C2C85B5B5D3F8F8FBFDFDFE
        FEFEFEFDFDFDFBFBFDEAEAF36B6BA81919842A2AA52E2EAA2B2BA82D2DA92D2D
        A91818847070AAF9F9FCFFFFFFE4E4EF3F3F8E19198C2525A62424A61A1A931F
        1F817777AECECEE2F1F1F6FAFAFCF9F9FBF2F2F8C4C4DC2F2F831212842626A6
        2424A72525A61B1B91323287D8D8E8FFFFFFFFFFFFFEFEFEBEBED92727811616
        8E1D1DA31D1DA31A1A9A1010841E1E804444916464A36666A44A4A942222810E
        0E811616971D1DA31D1DA31818941F1F7EAFAFD0FDFDFEFFFFFFFFFFFFFFFFFF
        FBFBFDB1B1D126268010108816169F1616A11515A013139A1010920F0F8D0D0D
        8B11119112129914149F1515A116169F11118C1E1E7E9D9DC5FAFAFCFFFFFFFF
        FFFFFFFFFFFFFFFFFEFEFFFBFBFDBEBED93E3E8D0C0C7C0C0C900D0D9A0D0D9D
        0E0E9F0F0F9F0F0F9E0F0F9F0D0D9E0D0D9B0C0C910B0B7E353588B2B2D2FAFA
        FCFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFEFEFEE4E4EF8686B72D
        2D850B0B7804048005058905058D04048D0505890404810909792929827D7DB2
        DCDCEBFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFCFCFDDEDEECA2A2C86363A33A3A8A26267F25257F3737885D5D9F99
        99C2DADAEAFBFBFDFFFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = 'M'#252'qavil'#601'd'#601'n imtina'
      ShortCut = 120
      OnClick = Mqavildnimtina1Click
    end
    object N4: TMenuItem
      Action = ActnCloseContract
      Caption = 'Ba'#287'lamaq'
      ImageIndex = 6
      ShortCut = 119
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Action = ActnPaymentPlane
      Caption = #214'd'#601'ni'#351' plan'#305
      ImageIndex = 9
      ShortCut = 16465
    end
    object N6: TMenuItem
      Caption = #214'd'#601'ni'#351'l'#601'r'
      ImageIndex = 10
      ShortCut = 16497
      OnClick = N6Click
    end
    object Gecikmlrbaxmaq1: TMenuItem
      Bitmap.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000000000000000000000000000000000003471DA3471DA
        3471DA3471DA3471DA3471DA3471DA3471DA3471DA3471DA3471DA3471DA3471
        DA3471DA3471DA3371D80A92243472D93270D93471DA3471D9FFFFFFFFFFFFFF
        FFFF3270D93371DA3371DA3371DA3371DA3371DA3371DA3371DA3371DA3371DA
        3371DA3371DA3371DA3371DA3371DA3271D90A9324118A4C3271D93370D93371
        DAFFFFFFFFFFFFFFFFFF326EDA61A1EA84C8F786CAF786C9F788CAF786CAF887
        CAF887CAF888CAF786C9F786CAF686CAF685C9F585C9F468BFBF129F21039907
        1A993E3371D93371D9FFFFFFFFFFFFFFFFFF306DDA4BA2ED5FCBFD5FCDFD5FCD
        FD61CFFE60CEFE60CEFE5FCDFE60CEFB59C9E056C7D356C7D355C6D355C6D243
        BDA40CA21D0DB20F08A50A0B92293270D7FFFFFFFFFFFFFFFFFF316DDA379DED
        3CC1FD3CC1FD3AB5F83BB1F63AB0F53AAEF33AAEF237B1E513A44F049A0A049B
        0B059B0A059B0A049B08049E051ED31E21DB2209A70A1AA21FFFFFFFFFFFFFFD
        FFFD326EDB379DED3CC2FE3BBDFC358DE83378DF3377DE3277DD3277DC3085D1
        119E4807A50918C71A1DCB1E20CB2020CB211DCD1D29E92932FC3227E4280EB0
        0F19A419FFFFFFFFFFFF316DDA389DED3BC1FD3BBFFC38A4F13999EC3D7CC647
        4983483F754175A3169E4218B1195FF36077FC777DFC7D7DFD7D75FD7564FD64
        4DFE4D37FD3729EB290FB20F0D9F0DFFFFFF316DDA379DED3FC2FD4EC5FC48AE
        F248AEF2613444650000650000601F1D23741122AE227BE87B88F08888F08989
        F1898AF28A8EF88E8CFE8C75FA7535DA350BA70B1EA51EFFFFFF316DDA43A0EE
        7CD3FDA1D9FA5E93E25E93E26304086501035E93E2660B0E275E02089D091DAC
        1D1FAF201FAF201FAF2024B32459DD5977F57745CB450A932330AC31FFFFFFFF
        FFFF326EDB6EADEEADE3FEB0E3FD97CCF696CBF467060767040596CAF46A1113
        466D3032AE4B33AF4C33B04C33B04C28AB3C0BA00E32C73228BD290993232FA1
        4CFFFFFFFFFFFFFEFFFE316DDA6FADED9DDEFD9BDBFB7CB9F07CB9F065030566
        03047CB9F0670F146604056DA9E979B7EE92D3F774B2EC55A7B7119D21069F09
        0A93231D8C653371D9FFFFFFFEFFFEFFFFFF316DDA63AAEE8AD8FD85D3FA579B
        E7579BE7640305650204579BE7630A126503054181DE5297E577C3F44B8FE232
        87AF0A97200992234EBB993371D93371DAFFFFFFFFFFFFFFFFFF316DDA59A7ED
        76D2FD76D2FC6DC7F86DC7F86504056604056DC7F8660F1466040669C1F66DC6
        F874D0FC6BC5F854BAC60A932557C4BF71CEF63371DA3371DAFFFFFFFFFFFFFF
        FFFF316DDA4DA3ED63CCFD63CDFC63CCFC63CCFC65040565040563CCFC661014
        65040663CCFC63CCFC64CEFE63CEFE5DCAEE5CCAEB62CDFA61C9FB3371DA3371
        DAFFFFFFFFFFFFFFFFFF326EDA439AEB4FBBF94FBBF850BBF84FBAF665050666
        080A4FB9F665101566080A4FBCF84FBAF74FBDFA50BDFA50BDFA4FBCF84FBCF8
        4FB8F73371DA3371DAFFFFFFFFFFFFFFFFFF336FDB3470DB3473DC3472DB3472
        DA3370D96503066503053370D8630A136503063472DA3471D93473DC3473DC34
        73DC3472DB3473DC3573DC3270D93270D9FFFFFFFFFFFFFFFFFF3572DA3270D9
        3270D93270D93270D9326ED5680506680405336ED36B10136704063370D8326E
        D53370D83572DA3572DA3572DA3572DA3572DA3572DA3572DAFFFFFFFFFFFFFF
        FFFFFDFEFFFDFEFFFDFEFFFDFEFFFCFDFEFFFFFF6A0707690606FFFFFF711313
        6A0707FFFFFF731718FFFFFFFCFDFEFDFEFFFDFEFFFDFEFFFDFEFFFDFEFFFEFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF6A070769
        0606FFFFFF7214146A0707FFFFFF731718FFFFFFFEFEFEFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
        FFFFFFFF6A0808690606FFFFFF7215156A0707FFFFFF741818FFFFFFFFFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFEFFFFFF6B0808690606FFFFFF6703036A0707FFFFFF7418
        18FFFFFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6C0A0A690606FFFFFFFFFFFF
        FFFFFFFFFFFF761A1AFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFF781E1E67
        0202670303670303670303670202751A1AFFFFFFFFFEFEFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF8330307F2A2A7F29297E2929812D2DFFFFFFFFFFFFFFFEFEFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = 'Gecikm'#601'l'#601'r'#601' baxmaq'
      ShortCut = 16450
      OnClick = Gecikmlrbaxmaq1Click
    end
    object N11: TMenuItem
      Caption = 'B'#252't'#252'n gecikm'#601'l'#601'r'#601' baxmaq'
      ImageIndex = 12
      ShortCut = 16455
      OnClick = N11Click
    end
    object N12: TMenuItem
      Bitmap.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFCFCFCFCFCFCFCFCFCFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2D4F497B6ED719BE65A8AE14E
        82E04E82E04E82E05688E16A96E58DAFEBBACFF3FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3BEEF5789E13B79DD357D
        DF3887E13E91E44198E6419AE63F97E63B92E53588E2307CDF3677DD5386E18E
        AFEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6391E3
        2781E01E96E7239AE72899E72A94E62C90E42C8FE42A8FE42691E52095E61A97
        E71695E62082E14179DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF6390E3277CDF277CDF2E76DD3178DE337DE13482E33382E23482E3
        337DE13078DF2E76DD277BDF247DDF4178DCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF6391E33E79DE669EE97ABCF36BC4F953C3FB41
        C0FD3CC0FD3CBFFD3BBBFB3AB6F938A9F33792EA3276DE4178DCFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFF6995E55792E595D3FA9FE0
        FE9DE0FE95DEFF7CD6FF57CBFF41C5FF3DC4FF3CC3FE3DC2FE42BCFB3C8CE74F
        83E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5CAF0
        4F83DF4885E15A9DEA69B1F072BDF575C3F771C2F760BDF74DB2F541A5F13E96
        EB3C82E24D82DFA8C1ECFFFFFFFFFFFFFFFFFFCEDCF3B4CAF29CB9EE8EAFEB84
        A8E988ABEA92B2EC84A8E96592E45285E04F83E04980DF447EDF437EDF437EDF
        4981DF5789E16F9AE69CB9EED5E0F5FFFFFFC8D8F585A9EA598AE2427CDE3C7D
        DF3D82DF3E86E1408BE23F88E23A82E0387DDE3A79DD477DDE6290E299B7EDFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF608FE22D79DE
        278DE4299AE72E9FE932A0E9339FE9329FE8309EE82C9EE8259DE81F98E71E8E
        E4277DDF4B81DFFFFFFFFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF5C8CE22480E01E87E2267CDF2B77DE2E75DD3075DD3073DC3070DB2E72DC
        2B75DD277ADE1F84E11F86E24880DFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF5C8BE13371DB4984E1579AE83F95EA3489E5327DE031
        71DB316EDA326FDA326FDA3270DB326FDB3170DB3D76DCA1BDEFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF608EE34F8BE392CDF75E9BE83779
        DE3179DE3283E03790E33D99E6409FE841A3E83D9FE73899E7328FE42E82E032
        79DD477FDF8FB0EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9CB9ED437DDF
        5492E53977DD2086E21B98E72094E5268EE32989E22A86E12985E12885E12689
        E3208EE41993E61596E72283E16390E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFBCCFF3739CE63A74DC297ADE2C77DD3378DE337EE03486E4348BE6
        358BE6348AE63385E4327DE13077DE2B78DD2A79DD6390E3FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5486E14782E079B1EF8ACBF779
        CFFC5ECAFD45C4FE3CC2FE3CC2FE3BC0FD3BBCFB39B1F7389BED357ADF6390E3
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6290E35794
        E68FCEF99ADDFD9BDFFE96DEFF83D8FF5FCEFF45C6FF3EC4FF3DC3FE3EC1FD45
        B6F83D87E4739CE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFEFFBFD1F15B8BE2427EDF5090E65DA3EC66B0F168B5F267B7F35AB1F24BA8
        F14099EC3B89E53D7CDF608EE3CBD9F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EAF7ADC5F179A1E75788E1437ADE3773DB
        3471DC3873DC447BDE598AE27BA2E7B2C9F2E5ECF7FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = 'Gecikm'#601'l'#601'r'#601' faizl'#601'rin hesablanmas'#305
      ShortCut = 16449
      OnClick = N12Click
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object ActnFilter1: TMenuItem
      Action = ActnFilter
      Caption = 'Filter paneli'
      ImageIndex = 7
      ShortCut = 115
    end
    object N10: TMenuItem
      Action = ActnSearchPanel
      Caption = 'Axtar'#305#351' paneli'
      ImageIndex = 11
      ShortCut = 114
    end
    object Frdidnicdvli1: TMenuItem
      Caption = 'F'#601'rdi '#246'd'#601'ni'#351' c'#601'dv'#601'li'
      ShortCut = 16466
      OnClick = Frdidnicdvli1Click
    end
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 72
    Top = 596
    object ActnAddContract: TAction
      Caption = '         Yeni m'#252'qavil'#601'    '
      ImageIndex = 0
      OnExecute = ActnAddContractExecute
    end
    object ActnEditContract: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1103
      OnExecute = ActnEditContractExecute
    end
    object ActnCloseContract: TAction
      Caption = #1041#1072#1100#1083#1072#1084#1072#1075
      OnExecute = ActnCloseContractExecute
    end
    object ActnRefresh: TAction
      Caption = #1049#1077#1085#1080#1083#1103#1084#1103#1082
      OnExecute = ActnRefreshExecute
    end
    object ActnSettings: TAction
      Caption = #1057#1077#1095#1084#1103#1083#1103#1088
      OnExecute = ActnSettingsExecute
    end
    object ActnOperations: TAction
      Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090
    end
    object ActnPaymentPlane: TAction
      Caption = #1070#1076#1103#1085#1080#1096' '#1087#1083#1072#1085#1099
      OnExecute = ActnPaymentPlaneExecute
    end
  end
  object StatusImages: TImageList
    Left = 105
    Top = 599
    Bitmap = {
      494C010104000600040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001001000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000841084100000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C311042104210421042
      1042104210421042104210421042104284100000000000000000000000000000
      00000000104218630000000000000000000000000000000000000000846C8410
      0000844CC6540000000000000000000000000000000000000000000000000000
      000000001700FF7F000000000000000000008010604EE03DE03DE03DE03DE03D
      E03DE03DE03DE03DE03DE03D4A29104210420000000000000000000000000000
      0000FF7F0000E07FE07F004200000000000000000000000000000000007C846C
      1042007C085DC618844CC6540000000000000000000000000000000000000000
      0000170017001700FF7F0000000000000000E05EE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FA677082110420000000000000000000000000000
      0000FF7F0000E07FE07F0042000000000000000000008C6D003C003C007C007C
      007C007C005C846C007C003C0000000000000000000000000000000000000000
      1700170017001700FF7F0000000000000000E05EE07FE07FE07FE07FE07FA656
      0000A656E07FE07FE07FE07FA677082108210000000018631042000000000000
      0000FF7F0000E07FE07F0042000000000000000000004A29007C007C007C007C
      E07FE07F003C007C007C003C4A29082100000000000000000000000000001700
      17001700FF7F17001700FF7F0000000000000021E07FE07FE07FE07FE07FA656
      0000A656E07FE07FE07FE07FA63510420000FF7F0000E07FE07F00420000FF7F
      0000FF7F0000E07FE07F00420000000000000000C6180821007C007C007C007C
      E07FE07F003C007C007C007C007C083D000000000000FF7FFF7FFF7F17001700
      1700FF7F0000000017001700FF7F000000000000E05EE07FE07FE07FE07FE07F
      E05EE07FE07FE07FE07FA677082108210000FF7F0000E07FE07F00420000FF7F
      0000FF7F0000E07FE07F00420000000000000821007C007C007C007C007C007C
      E07DE07D005C007C007C007C005C0000000000000000FF7F1042104210421700
      FF7FFF7F0000000000001700FF7F0000000000000021E07FE07FE07FE07F2667
      4629E07FE07FE07FE07FA635104200000000FF7F0000E07FE07F00420000FF7F
      0000FF7F0000E07FE07F00420000000000000000001C846C007C007C007C007C
      E07FE07F003C007C007C007C005C001C000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000001700FF7F000000000000E05EE07FE07FE07FA635
      0000A677E07FE07FA6770821082100000000FF7F0000E07FE07F00420000FF7F
      0000104200420042E07FFF7FE07F000000000000842C846C007C007C007C007C
      E07FE07F003C007C007C007C007C007C4A4500000000FF7F1042104210421042
      1042FF7F000000000000000000001700FF7F000000000021E07FE07FE07F8010
      0000604EE07FE07FA6351042000000000000104200420042E07FFF7FE07F0000
      000000000000104210421042000000000000842C007C007C007C007C007C007C
      E07FE07F003C007C007C007C844CC618000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000000000000000000000001700000000000000E05EE07FE07F0000
      0000E03DE07FA677082108210000000000000000000010421042104200000000
      000000000000000000000000000000000000000000004A45007C007C007C007C
      E07FE07F003C007C007C007CC6740000000000000000FF7F1042104200000000
      0000FF7F00000000000000000000000000000000000000000021E07FE07F0000
      0000E03DE07FA635104200000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000844C007C007C007C007C
      E07FE07F005C007C007C007C007C844C000000000000FF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000E05EE07FA656
      E03DA677A6770821082100000000000000000000000000000000000000000000
      0000000010420000000000000000000000000000C618846CC654005C007C007C
      007C007C007C007C007C003C003C842C000000000000FF7F1042104200000000
      00000000000000000000000000000000000000000000000000000021E07FE07F
      E07FE07FA6351042000000000000000000000000000000000000000000001042
      0000104200000000000000000000000000000000000000000000003C007C006C
      005C007CC674C674007C000000000000000000000000FF7FFF7FFF7FFF7F0000
      00000000000000000000000000000000000000000000000000000000E05EE07F
      E07FA67708210821000000000000000000000000000000000000000010420000
      0000000000000000000000000000000000000000000000000000842CC6740010
      4A29007C4A290000842CC6180000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000021E07F
      E07FA6358C310000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C61800000000
      0000105E00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E03D
      A656000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
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
  object ActionList2: TActionList
    Left = 146
    Top = 595
    object ActnFilter: TAction
      Caption = 'ActnFilter'
      OnExecute = ActnFilterExecute
    end
    object ActnSearchPanel: TAction
      Caption = 'ActnSearch'
      OnExecute = ActnSearchPanelExecute
    end
    object ActnSearch: TAction
      Caption = 'ActnSearch'
      OnExecute = ActnSearchExecute
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 8
    Top = 616
    object Mqavilapsazlanmas1: TMenuItem
      Caption = 'M'#252'qavil'#601' '#231'ap'#305' (sazlanmas'#305')'
      OnClick = Mqavilapsazlanmas1Click
    end
    object yinatnsazlanmas1: TMenuItem
      Caption = 'T'#601'yinat'#305'n sazlanmas'#305
      OnClick = yinatnsazlanmas1Click
    end
  end
  object ExcelExport: TCMExcelExport
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontTitles.Charset = RUSSIAN_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'Tahoma'
    FontTitles.Style = []
    OrientationTitles = 0
    FontData.Charset = RUSSIAN_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Tahoma'
    FontData.Style = []
    FontSummary.Charset = RUSSIAN_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Tahoma'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 224
    Top = 318
  end
end
