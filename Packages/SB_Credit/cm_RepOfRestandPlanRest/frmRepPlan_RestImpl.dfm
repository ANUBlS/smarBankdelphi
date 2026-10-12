object frmRepPlan_Rest: TfrmRepPlan_Rest
  Left = 322
  Top = 176
  ClientHeight = 231
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 65
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 682
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 233
      Height = 63
      Align = alLeft
      Caption = #1042#1072#1083#1081#1091#1090#1072
      TabOrder = 0
      object CheckBox1: TCheckBox
        Left = 5
        Top = 41
        Width = 105
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 0
      end
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 220
        Height = 22
        EditButtons = <>
        KeyField = 'VALUTE'
        ListField = 'VALU_NAME'
        ListSource = dmRepPlan_Rest.Valute
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox2: TGroupBox
      Left = 466
      Top = 1
      Width = 267
      Height = 63
      Align = alClient
      Caption = #1052#1050#1058
      TabOrder = 1
      ExplicitWidth = 215
      object DBLookupComboboxEh3: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 255
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = dmRepPlan_Rest.UsrGroup
        TabOrder = 0
        Visible = True
      end
      object CheckBox3: TCheckBox
        Left = 5
        Top = 41
        Width = 105
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 234
      Top = 1
      Width = 232
      Height = 63
      Align = alLeft
      Caption = #1060#1080#1083#1080#1072#1083
      TabOrder = 2
      object DBLookupComboboxEh2: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 220
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = dmRepPlan_Rest.Branch
        TabOrder = 0
        Visible = True
      end
      object CheckBox2: TCheckBox
        Left = 6
        Top = 41
        Width = 105
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 1
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 65
    Width = 734
    Height = 64
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 682
    object GroupBox7: TGroupBox
      Left = 1
      Top = 1
      Width = 233
      Height = 62
      Align = alLeft
      Caption = #1041#1086#1088#1078#1072#1083#1072#1085#1099#1085' '#1090#1080#1087#1080
      TabOrder = 0
      object CheckBox7: TCheckBox
        Left = 5
        Top = 41
        Width = 105
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 0
      end
      object DBLookupComboboxEh7: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 220
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = dmRepPlan_Rest.Categories
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox8: TGroupBox
      Left = 466
      Top = 1
      Width = 267
      Height = 62
      Align = alClient
      Caption = #1050#1088#1077#1076#1080#1090#1080#1085' '#1085#1086#1074#1094
      TabOrder = 1
      ExplicitWidth = 215
      object CheckBox9: TCheckBox
        Left = 5
        Top = 41
        Width = 105
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 0
      end
      object DBLookupComboboxEh9: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 255
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = dmRepPlan_Rest.CrdType
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox9: TGroupBox
      Left = 234
      Top = 1
      Width = 232
      Height = 62
      Align = alLeft
      Caption = #1041#1086#1088#1078#1072#1083#1072#1085#1099#1085' '#1082#1072#1090#1077#1075#1086#1088#1081#1072#1089#1099
      TabOrder = 2
      object CheckBox8: TCheckBox
        Left = 5
        Top = 41
        Width = 105
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 0
      end
      object DBLookupComboboxEh8: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 220
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPION'
        ListSource = dmRepPlan_Rest.Persons
        TabOrder = 1
        Visible = True
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 129
    Width = 734
    Height = 65
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 682
    object GroupBox4: TGroupBox
      Left = 1
      Top = 1
      Width = 233
      Height = 63
      Align = alLeft
      Caption = #1058#1103#1089#1085#1080#1092#1072#1090
      TabOrder = 0
      object CheckBox4: TCheckBox
        Left = 5
        Top = 41
        Width = 105
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 0
      end
      object DBLookupComboboxEh4: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 220
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'FULLDESC'
        ListSource = dmRepPlan_Rest.Reserves
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox5: TGroupBox
      Left = 466
      Top = 1
      Width = 267
      Height = 63
      Align = alClient
      Caption = #1048#1089#1090#1080#1092#1072#1076#1103#1095#1080
      TabOrder = 1
      ExplicitWidth = 215
      object DBLookupComboboxEh6: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 255
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = dmRepPlan_Rest.Users
        TabOrder = 0
        Visible = True
      end
      object CheckBox6: TCheckBox
        Left = 5
        Top = 41
        Width = 105
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 1
      end
    end
    object GroupBox6: TGroupBox
      Left = 234
      Top = 1
      Width = 232
      Height = 63
      Align = alLeft
      Caption = #1069#1077#1078#1080#1082#1084#1080#1096' '#1090#1103#1089#1085#1080#1092#1072#1090
      TabOrder = 2
      object DBLookupComboboxEh5: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 220
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'FULLDESC'
        ListSource = dmRepPlan_Rest.DueReserve
        TabOrder = 0
        Visible = True
      end
      object CheckBox5: TCheckBox
        Left = 8
        Top = 41
        Width = 104
        Height = 18
        Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
        TabOrder = 1
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 646
    Top = 202
    Width = 81
    Height = 27
    Caption = 'OK'
    Default = True
    DoubleBuffered = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object DTPRest: TDateTimePicker
    Left = 8
    Top = 200
    Width = 119
    Height = 21
    Date = 39848.622701805600000000
    Time = 39848.622701805600000000
    TabOrder = 4
  end
  object ExcelExp: TCMExcelExport
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontTitles.Charset = RUSSIAN_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'Arial AzLat'
    FontTitles.Style = []
    OrientationTitles = 0
    FontData.Charset = RUSSIAN_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Arial AzLat'
    FontData.Style = []
    FontSummary.Charset = RUSSIAN_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Arial AzLat'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 144
    Top = 184
  end
end
