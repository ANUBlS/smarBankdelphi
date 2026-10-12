object YReportsForm: TYReportsForm
  Left = 677
  Top = 615
  Caption = 'YReportsForm'
  ClientHeight = 350
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 77
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 0
    ExplicitWidth = 595
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 208
      Height = 71
      Align = alLeft
      Caption = #1042#1072#1083#1081#1091#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object CheckBox1: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 0
      end
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 195
        Height = 22
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'VALUTE'
        ListField = 'VALU_NAME'
        ListSource = YReportsDataMod.CurrencysSrc
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox3: TGroupBox
      Left = 209
      Top = 1
      Width = 198
      Height = 71
      Align = alLeft
      Caption = #1060#1080#1083#1080#1072#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object DBLookupComboboxEh2: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 183
        Height = 22
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = YReportsDataMod.BranchesSrc
        TabOrder = 0
        Visible = True
      end
      object CheckBox2: TCheckBox
        Left = 6
        Top = 38
        Width = 97
        Height = 17
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 1
      end
    end
    object GroupBox16: TGroupBox
      Left = 407
      Top = 1
      Width = 183
      Height = 71
      Align = alLeft
      Caption = #1052#1094#1076#1076#1103#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      DesignSize = (
        183
        71)
      object CheckBox3: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 0
      end
      object DBLookupComboboxEh12: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 171
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'IDNAME'
        ListSource = YReportsDataMod.TypesSrc
        TabOrder = 1
        Visible = True
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 228
    Width = 600
    Height = 77
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 1
    ExplicitWidth = 595
    object GroupBox7: TGroupBox
      Left = 1
      Top = 1
      Width = 208
      Height = 71
      Align = alLeft
      Caption = #1041#1086#1088#1078#1072#1083#1072#1085#1099#1085' '#1090#1080#1087#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object CheckBox8: TCheckBox
        Left = 5
        Top = 37
        Width = 97
        Height = 17
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 0
      end
      object DBLookupComboboxEh7: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 195
        Height = 22
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPION'
        ListSource = YReportsDataMod.PersonsSrc
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox9: TGroupBox
      Left = 209
      Top = 1
      Width = 200
      Height = 71
      Align = alLeft
      Caption = #1041#1086#1088#1078#1072#1083#1072#1085#1099#1085' '#1082#1072#1090#1077#1075#1086#1088#1081#1072#1089#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object CheckBox9: TCheckBox
        Left = 5
        Top = 37
        Width = 97
        Height = 17
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 0
      end
      object DBLookupComboboxEh8: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 186
        Height = 22
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = YReportsDataMod.CategoriesSrc
        TabOrder = 1
        Visible = True
      end
    end
    object rgKredStatus: TRadioGroup
      Left = 409
      Top = 1
      Width = 181
      Height = 71
      Align = alLeft
      Caption = #1047#1103#1084#1072#1085#1103#1090#1083#1103#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Aktiv olanlar'
        'Ham'#1099's'#1099
        #1041#1072#1100#1083#1099' '#1082#1088#1077#1076#1080#1090#1083#1103#1088)
      ParentFont = False
      TabOrder = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 77
    Width = 600
    Height = 77
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 2
    ExplicitWidth = 595
    object GroupBox13: TGroupBox
      Left = 1
      Top = 1
      Width = 209
      Height = 71
      Align = alLeft
      Caption = #1042#1077#1088#1080#1083#1084#1103' '#1087#1077#1088#1080#1086#1076#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object CheckBox4: TCheckBox
        Left = 5
        Top = 37
        Width = 97
        Height = 17
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 0
      end
      object DBLookupComboboxEh9: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 194
        Height = 22
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'PURPOSEDESC'
        ListSource = YReportsDataMod.PeriodsSrc
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox4: TGroupBox
      Left = 407
      Top = 1
      Width = 183
      Height = 71
      Align = alLeft
      Caption = #1065#1077#1089#1072#1073#1072#1090' '#1072#1088#1072#1083#1099#1100#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        183
        71)
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 82
        Height = 14
        Caption = #1044#1102#1074#1088#1094#1085' '#1103#1074#1074#1103#1083#1080
      end
      object Label2: TLabel
        Left = 8
        Top = 38
        Width = 68
        Height = 14
        Caption = #1044#1102#1074#1088#1094#1085' '#1089#1086#1085#1091
      end
      object BDateP: TDateTimePicker
        Left = 83
        Top = 12
        Width = 94
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Date = 38477.593060798600000000
        Time = 38477.593060798600000000
        TabOrder = 0
      end
      object EDateP: TDateTimePicker
        Left = 83
        Top = 34
        Width = 94
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Date = 38477.593068935200000000
        Time = 38477.593068935200000000
        TabOrder = 1
      end
    end
    object GroupBox12: TGroupBox
      Left = 210
      Top = 1
      Width = 197
      Height = 71
      Align = alLeft
      Caption = #1042#1077#1088#1080#1083#1084#1080#1096' '#1079#1103#1084#1072#1085#1103#1090#1083#1103#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      DesignSize = (
        197
        71)
      object Label3: TLabel
        Left = 168
        Top = 16
        Width = 22
        Height = 14
        Caption = '-'#1076#1072#1085
      end
      object Label4: TLabel
        Left = 168
        Top = 37
        Width = 21
        Height = 14
        Caption = '-'#1076#1103#1082
      end
      object GCredBegD: TDateTimePicker
        Left = 6
        Top = 12
        Width = 148
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Date = 35431.593060798600000000
        Time = 35431.593060798600000000
        TabOrder = 0
      end
      object GCredEndD: TDateTimePicker
        Left = 6
        Top = 34
        Width = 148
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Date = 38477.593068935200000000
        Time = 38477.593068935200000000
        TabOrder = 1
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 154
    Width = 600
    Height = 74
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 3
    ExplicitWidth = 595
    object GroupBox6: TGroupBox
      Left = 1
      Top = 1
      Width = 208
      Height = 68
      Align = alLeft
      Caption = #1052#1094#1096#1090#1103#1088#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        208
        68)
      object CheckBox5: TCheckBox
        Left = 5
        Top = 38
        Width = 72
        Height = 17
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 0
      end
      object DBLookupComboboxEh4: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 196
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'IDNAME'
        ListSource = YReportsDataMod.CustNamesSrc
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox10: TGroupBox
      Left = 209
      Top = 1
      Width = 199
      Height = 68
      Align = alLeft
      Caption = #1052#1094#1096#1090#1103#1088#1080' '#1082#1086#1076#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        199
        68)
      object CheckBox6: TCheckBox
        Left = 5
        Top = 38
        Width = 72
        Height = 17
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 0
      end
      object DBLookupComboboxEh6: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 183
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'IDNAME'
        ListSource = YReportsDataMod.CustomersSrc
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox11: TGroupBox
      Left = 408
      Top = 1
      Width = 181
      Height = 68
      Align = alLeft
      Caption = #1065#1077#1089#1072#1073#1072#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      DesignSize = (
        181
        68)
      object CheckBox7: TCheckBox
        Left = 5
        Top = 38
        Width = 72
        Height = 17
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cbFormsLook: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 169
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = YReportsDataMod.RepFormsSrc
        TabOrder = 1
        Visible = True
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 305
    Width = 600
    Height = 40
    Align = alTop
    TabOrder = 4
    ExplicitWidth = 595
    object BitBtn1: TBitBtn
      Left = 264
      Top = 8
      Width = 87
      Height = 25
      Caption = #1043#1103#1073#1091#1083
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 352
      Top = 8
      Width = 87
      Height = 25
      Caption = #1041#1072#1100#1083#1072
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object CR_AK_REPORTS: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CR_AK_REPORTS'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Left = 536
    Top = 168
  end
  object Kera: TCMExcelExport
    ConnectTo = ctNewInstance
    StyleColumnWidth = cwAutoFit
    ColumnWidth = 0
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clNavy
    FontTitles.Height = -13
    FontTitles.Name = 'Azl Sans Serif'
    FontTitles.Style = [fsBold]
    BorderTitles.Weight = bwThin
    BorderTitles.LineStyle = blLine
    OrientationTitles = 0
    FontData.Charset = RUSSIAN_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Azl Sans Serif'
    FontData.Style = []
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Azl Sans Serif'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 496
    Top = 168
  end
end
