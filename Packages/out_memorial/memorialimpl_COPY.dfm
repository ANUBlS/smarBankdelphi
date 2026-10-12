object memorial_project: Tmemorial_project
  Left = -4
  Top = -4
  Width = 1160
  Height = 819
  Caption = 'memorial_project'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  OnDestroy = ActiveFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 161
    Top = 34
    Width = 999
    Height = 675
    Align = alClient
    DataSource = memorial_DataModule.DataSrcMain
    DrawingStyle = gdsGradient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CurrInNational'
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Visible = False
      end
      item
        Color = clInactiveCaption
        Expanded = False
        FieldName = 'OP_ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Title.Caption = #1071#1084#1103#1083
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Visible = False
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'VAL_ACC'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Title.Caption = '   $'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 32
        Visible = True
      end
      item
        Color = clWhite
        Expanded = False
        FieldName = 'DEBITOR'
        Title.Caption = #1044#1077#1073#1080#1090#1086#1088
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 120
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'CURRENCYID_C'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Title.Caption = '   $'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 32
        Visible = True
      end
      item
        Color = clWhite
        Expanded = False
        FieldName = 'KREDITOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Title.Caption = 'K'#1088#1077#1076#1080#1090#1086#1088
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 120
        Visible = True
      end
      item
        Color = clWhite
        Expanded = False
        FieldName = 'AMMOUNT'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 110
        Visible = True
      end
      item
        Color = clWhite
        Expanded = False
        FieldName = 'AMMOUNT_C'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 110
        Visible = True
      end
      item
        Color = clWhite
        Expanded = False
        FieldName = 'LAMMOUNT'
        Title.Caption = #1052#1103#1073#1083#1103#1100' '#1084#1072#1085'.'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 120
        Visible = True
      end>
  end
  object FilterPanel: TGroupBox
    Left = 0
    Top = 34
    Width = 161
    Height = 675
    Align = alLeft
    Caption = #1057#1077#1095#1084#1103#1083#1103#1088
    Color = clMenu
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 15
      Width = 145
      Height = 111
      Caption = #1058#1072#1088#1080#1093
      TabOrder = 0
      object Label4: TLabel
        Left = 8
        Top = 19
        Width = 66
        Height = 13
        Caption = #1044#1102#1074#1088#1094#1085' '#1103#1074#1074#1103#1083#1080
      end
      object Label5: TLabel
        Left = 8
        Top = 63
        Width = 61
        Height = 13
        Caption = #1044#1102#1074#1088#1094#1085' '#1089#1086#1085#1091
      end
      object DTPBegin: TDateTimePicker
        Left = 8
        Top = 34
        Width = 96
        Height = 21
        Date = 37429.427791365700000000
        Time = 37429.427791365700000000
        TabOrder = 0
      end
      object DTPEnd: TDateTimePicker
        Left = 8
        Top = 78
        Width = 96
        Height = 21
        Date = 37429.427791365700000000
        Time = 37429.427791365700000000
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 128
      Width = 145
      Height = 41
      Caption = #1042#1072#1083#1081#1091#1090#1072
      TabOrder = 1
      object CmbBoxRate: TComboBox
        Left = 8
        Top = 14
        Width = 132
        Height = 21
        Color = clInfoBk
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = CmbBoxRateChange
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 169
      Width = 145
      Height = 266
      Caption = #1065#1077#1089#1072#1073#1072#1090
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 76
        Height = 13
        Caption = #1065#1077#1089#1072#1073#1072#1090' '#1092#1086#1088#1084#1072#1089#1099
      end
      object Label2: TLabel
        Left = 8
        Top = 208
        Width = 45
        Height = 13
        Caption = #1063#1072#1087' '#1088#1077#1098#1080#1084#1080
      end
      object CmbBoxForm: TComboBox
        Left = 8
        Top = 32
        Width = 132
        Height = 21
        Style = csDropDownList
        Color = clInfoBk
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Items.Strings = (
          'B'#252't'#252'n '#601'm'#601'liyyatlar'
          'M'#252#351't'#601'ri hesablar'#305' '#252'zr'#601
          '----------------------------------'
          'Yaln'#305'z M'#252'r'#601'kk'#601'b valyuta '#399'm'#601'liyyatlar'#305)
      end
      object ComboBoxPrintMode: TComboBox
        Left = 8
        Top = 232
        Width = 130
        Height = 21
        Style = csDropDownList
        Color = clInfoBk
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Items.Strings = (
          'Baxmaq'
          #199'ap etm'#601'k')
      end
      object GroupBox6: TGroupBox
        Left = 8
        Top = 94
        Width = 134
        Height = 108
        Caption = #1052#1094#1096#1090#1103#1088#1080#1083#1103#1088' '#1094#1095#1094#1085
        TabOrder = 2
        object CBCount: TCheckBox
          Left = 7
          Top = 14
          Width = 124
          Height = 14
          Caption = #1052#1094#1096#1090#1103#1088#1080#1083#1103#1088' '#1094#1095#1094#1085' '#1041#1083#1072#1085#1082
          TabOrder = 0
          OnClick = CBCountClick
        end
        object RGBlanck: TRadioGroup
          Left = 2
          Top = 56
          Width = 130
          Height = 50
          Align = alBottom
          Caption = #1041#1083#1072#1085#1082#1083#1072#1088
          Enabled = False
          ItemIndex = 1
          Items.Strings = (
            #1050#1086#1087#1081#1072#1089#1099' '#1080#1083#1103
            #1049#1077#1101#1072#1085#1103' '#1077#1082#1079'.')
          TabOrder = 1
        end
        object ordercount: TCheckBox
          Left = 7
          Top = 36
          Width = 124
          Height = 14
          Caption = 'S'#305'ra '#8470' g'#246'r'#252'ns'#252'n'
          TabOrder = 2
          OnClick = ordercountClick
        end
      end
      object GroupBox7: TGroupBox
        Left = 8
        Top = 54
        Width = 129
        Height = 41
        Caption = #1050#1091#1088#1089' '#1092#1103#1088#1075#1080
        TabOrder = 1
        object CheckBoxDifference: TCheckBox
          Left = 5
          Top = 16
          Width = 79
          Height = 21
          Caption = #1050#1091#1088#1089' '#1092#1103#1088#1075#1080
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
    object BitBtnRun: TBitBtn
      Left = 4
      Top = 483
      Width = 73
      Height = 28
      Caption = '&'#1058#1103#1079#1103#1083#1103
      DoubleBuffered = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtnRunClick
    end
    object CBReport: TCheckBox
      Left = 10
      Top = 518
      Width = 69
      Height = 17
      Caption = #1065#1077#1089#1072#1073#1072#1090
      TabOrder = 4
    end
    object BtnReport: TButton
      Left = 81
      Top = 483
      Width = 71
      Height = 28
      Caption = #1065#1077#1089#1072#1073#1072#1090
      TabOrder = 5
      OnClick = BtnReportClick
    end
    object CBUseBalance: TCheckBox
      Left = 11
      Top = 538
      Width = 147
      Height = 17
      Caption = #1041#1072#1083#1072#1085#1089' '#1092#1080#1083#1090#1077#1088#1083#1103#1088#1080#1085#1076#1103#1085' '#1080#1089#1090#1080#1092#1072#1076#1103' '#1077#1090
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object GroupBox8: TGroupBox
      Left = 9
      Top = 441
      Width = 143
      Height = 37
      Caption = #1060#1080#1083#1080#1072#1083
      TabOrder = 7
      object BranchesSC: TSearchCombo
        Left = 4
        Top = 12
        Width = 135
        Height = 22
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DataSource = memorial_DataModule.DataSrcBranches
        ViewField = 'Name'
        DefaultString = #220'mumi bank '#252'zr'#601
        DefaultStringUse = True
        DefaultStringColor = clNavy
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1160
    Height = 34
    ButtonHeight = 34
    Caption = 'ToolBar1'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object RGTransMode: TRadioGroup
      Left = 0
      Top = 0
      Width = 275
      Height = 34
      Color = clCream
      Columns = 2
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'T'#601'sdiq olunmu'#351'lar'
        'Planla'#351'd'#305'r'#305'lm'#305#351'lar')
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 275
      Top = 0
      Width = 654
      Height = 34
      Color = clCream
      ParentBackground = False
      TabOrder = 1
      object Label3: TLabel
        Left = 12
        Top = 10
        Width = 53
        Height = 13
        Caption = #304'stifad'#601#231'i'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SearchCombo1: TSearchCombo
        Left = 71
        Top = 6
        Width = 145
        Height = 22
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = SearchCombo1Change
        DataSource = memorial_DataModule.DataSrcUsersList
        ViewField = 'name'
        DefaultString = 'B'#252't'#252'n istifad'#601#231'il'#601'r'
        DefaultStringUse = True
        DefaultStringColor = clNavy
      end
      object ProgressBar1: TProgressBar
        Left = 232
        Top = 1
        Width = 421
        Height = 32
        Align = alRight
        Smooth = True
        TabOrder = 1
        ExplicitHeight = 17
      end
    end
    object lb: TLabel
      Left = 929
      Top = 0
      Width = 24
      Height = 34
      Caption = #601'd'#601'd'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 709
    Width = 1160
    Height = 63
    Align = alBottom
    Caption = #1040#1093#1090#1072#1088#1099#1096' '#1074#1103' '#1089#1099#1088#1072#1083#1072#1084#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label6: TLabel
      Left = 12
      Top = 43
      Width = 40
      Height = 13
      Caption = #1057#1099#1088#1072#1083#1072#1084#1072
    end
    object CurrencyID_C: TEdit
      Left = 152
      Top = 14
      Width = 40
      Height = 21
      Hint = #1082#1088#1077#1076#1080#1090' '#1085#1102#1084#1088#1103#1089#1080#1085#1103'   '#1078#1102#1088#1103' '#1072#1093#1090#1072#1088#1099#1096
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnChange = CurrencyID_CChange
      OnKeyPress = CurrencyID_CKeyPress
    end
    object KREDITOR: TEdit
      Left = 189
      Top = 14
      Width = 121
      Height = 21
      Hint = #1052#1103#1073#1083#1103#1101#1103'  '#1078#1102#1088#1103' '#1072#1093#1090#1072#1088#1099#1096
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      OnChange = KREDITORChange
      OnKeyPress = KREDITORKeyPress
    end
    object DEBITOR: TEdit
      Left = 42
      Top = 14
      Width = 109
      Height = 21
      Hint = #1044#1077#1073#1077#1090' '#1085#1102#1084#1088#1103#1089#1080#1085#1103'  '#1078#1102#1088#1103' '#1072#1093#1090#1072#1088#1099#1096
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      OnChange = DEBITORChange
      OnKeyPress = DEBITORKeyPress
    end
    object VAL_ACC: TEdit
      Left = 4
      Top = 14
      Width = 37
      Height = 21
      Hint = #1071#1084#1103#1083#1080#1081#1081#1090#1072'  '#1078#1102#1088#1103' '#1072#1093#1090#1072#1088#1099#1096
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      OnChange = VAL_ACCChange
      OnKeyPress = VAL_ACCKeyPress
    end
    object CmbBoxOrder: TComboBox
      Left = 59
      Top = 39
      Width = 233
      Height = 21
      Style = csDropDownList
      Color = clInfoBk
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnChange = CmbBoxOrderChange
      Items.Strings = (
        'S'#305'ralama'
        'Valyutalar '#252'zr'#601
        'Debet balans hesab'#305' '#252'zr'#601
        'Debet hesab'#305' '#252'zr'#601
        'Kredit balans hesab'#305' '#252'zr'#601
        'Kredit '#252'zr'#601
        'M'#601'bl'#601#287' '#252'zr'#601
        'Manat m'#601'bl'#601#287'i '#252'zr'#601)
    end
    object AMMOUNT_C: TEdit
      Left = 422
      Top = 14
      Width = 112
      Height = 21
      Hint = #1052#1103#1073#1083#1103#1101#1103'('#1084#1072#1085')  '#1078#1102#1088#1103' '#1072#1093#1090#1072#1088#1099#1096
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 5
      OnChange = AMMOUNT_CChange
      OnKeyPress = AMMOUNT_CKeyPress
    end
    object AMMOUNT: TEdit
      Left = 311
      Top = 14
      Width = 110
      Height = 21
      Hint = #1052#1103#1073#1083#1103#1101#1103'  '#1078#1102#1088#1103' '#1072#1093#1090#1072#1088#1099#1096
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 6
      OnChange = AMMOUNTChange
      OnKeyPress = AMMOUNTKeyPress
    end
    object BtnRefer: TButton
      Left = 462
      Top = 37
      Width = 75
      Height = 25
      Caption = #1057#1072#1079#1083#1072#1084#1072'...'
      TabOrder = 7
      OnClick = BtnReferClick
    end
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 772
    Width = 1160
    Height = 47
    Align = alBottom
    Caption = #1058#1103#1081#1080#1085#1072#1090
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object DBEditSetting: TDBEdit
      Left = 8
      Top = 15
      Width = 377
      Height = 21
      Color = clInfoBk
      DataField = 'NAME'
      DataSource = memorial_DataModule.DataSrcMain
      TabOrder = 0
    end
  end
  object ImageList1: TImageList
    Left = 233
    Top = 133
    Bitmap = {
      494C010101001C001C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042104210421042
      1042104210421042104210421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010421042104210421042
      1042104210421042104210421042186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018631863186318631863
      1863186318631863186318631863104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7F1042FF7FFF7F1042
      FF7FFF7F1042FF7FFF7F00001042186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7F1042FF7FFF7F1042
      FF7FFF7F1042FF7FFF7F00001863104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7F1042FF7FFF7F1042
      FF7FFF7F1042FF7FFF7F00001042186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7F1042FF7FFF7F1042
      FF7FFF7F1042FF7FFF7F00001863104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7F1042FF7FFF7F1042
      FF7FFF7F1042FF7FFF7F00001042186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7F1042FF7FFF7F1042
      FF7FFF7F1042FF7FFF7F00001863104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7F1042FF7FFF7F1042
      FF7FFF7F1042FF7FFF7F00001042186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7F1042FF7FFF7F1042
      FF7FFF7F1042FF7FFF7F00001863104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7F1042FF7FFF7F1042
      FF7FFF7F1042FF7FFF7F00001042186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7F1042FF7FFF7F1042
      FF7FFF7F1042FF7FFF7F00001863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7021F00FF7FFF7FFF7FF702F702
      F7021863F70218631863F7020000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F702F702F702F702F702F702F702
      F702F702F702F702F702F7020000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000E001000000000000
      C001000000000000C00100000000000000010000000000000001000000000000
      0001000000000000000100000000000000010000000000000001000000000000
      0001000000000000000100000000000000010000000000000003000000000000
      0007000000000000000700000000000000000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    Left = 361
    Top = 194
    object miPrintSelected: TMenuItem
      Caption = 'Print Selected ...'
      ShortCut = 114
      OnClick = miPrintSelectedClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object miExcelExport: TMenuItem
      Caption = 'Excel Export ...'
      ShortCut = 32848
      OnClick = miExcelExportClick
    end
  end
  object TransactionsExporter: TExcelExporter
    ExportSource = memorial_DataModule.DataSrcMain
    ExportList.Strings = (
      'VAL_ACC'
      'DEBITOR'
      'CURRENCYID_C'
      'KREDITOR'
      'AMMOUNT'
      'AMMOUNT_C'
      'LAMMOUNT')
    SheetName = 'Transactions'
    ShowTitles = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 569
    Top = 162
  end
end
