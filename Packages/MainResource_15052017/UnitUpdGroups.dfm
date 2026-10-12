object FormUpdGroups: TFormUpdGroups
  Left = 773
  Top = 489
  BorderStyle = bsDialog
  Caption = 'EditGroups'
  ClientHeight = 208
  ClientWidth = 542
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PanelM: TPanel
    Left = 0
    Top = 0
    Width = 542
    Height = 208
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object SButton: TSpeedButton
      Left = 1
      Top = 177
      Width = 533
      Height = 26
      Caption = 'Icra et.....'
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
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
      ParentFont = False
      OnClick = SButtonClick
    end
    object GroupBoxName: TGroupBox
      Left = 2
      Top = 2
      Width = 538
      Height = 39
      Align = alTop
      Caption = #1043#1088#1091#1087#1091#1085' '#1072#1076#1099
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object EditGroupName: TEdit
        Left = 3
        Top = 16
        Width = 526
        Height = 22
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBoxNBPercent: TGroupBox
      Left = 2
      Top = 42
      Width = 276
      Height = 37
      Caption = 'Faiz('#1052#1072#1083#1080#1081#1081#1103')'
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      object EditPercentNB: TEdit
        Left = 2
        Top = 14
        Width = 271
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBoxNLPercent: TGroupBox
      Left = 278
      Top = 42
      Width = 256
      Height = 37
      Caption = 'Faiz(Vergi)'
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      object EditPercentNL: TEdit
        Left = 2
        Top = 14
        Width = 251
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBoxDebtAcc: TGroupBox
      Left = 2
      Top = 81
      Width = 275
      Height = 41
      Caption = #1061#1103#1088#1078'/'#1044#1077#1073#1080#1090' '#1097#1077#1089#1072#1073
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 3
      object CB_exp_acc1: TDBLookupComboBox
        Left = 2
        Top = 18
        Width = 271
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'ACC_NO'
        ListSource = DataModWares.DSViewGr
        ParentFont = False
        TabOrder = 0
        Visible = False
      end
      object CB_exp_acc: TDBLookupComboboxEh
        Left = 58
        Top = 18
        Width = 212
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'ACC_NO'
        ListSource = DataModWares.DSViewGr
        TabOrder = 1
        Visible = True
      end
      object Edit1: TEdit
        Left = 3
        Top = 18
        Width = 54
        Height = 22
        TabOrder = 2
        OnChange = Edit1Change
        OnEnter = Edit1Enter
      end
      object ComboBox1: TComboBox
        Left = 60
        Top = 18
        Width = 213
        Height = 22
        TabOrder = 3
        OnChange = ComboBox1Change
      end
    end
    object GroupBoxCredAcc: TGroupBox
      Left = 2
      Top = 127
      Width = 276
      Height = 47
      Caption = #1040#1084#1086#1088#1090#1080#1079#1072#1089#1080#1081#1072'/'#1050#1088#1077#1076#1080#1090' '#1097#1077#1089#1072#1073
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 4
      object CB_amort_acc1: TDBLookupComboBox
        Left = 0
        Top = 24
        Width = 272
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'ACC_NO'
        ListSource = DataModWares.DSViewGr1
        ParentFont = False
        TabOrder = 0
        Visible = False
      end
      object CB_amort_acc: TDBLookupComboboxEh
        Left = 57
        Top = 24
        Width = 216
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'ACC_NO'
        ListSource = DataModWares.DSViewGr1
        TabOrder = 1
        Visible = True
      end
      object Edit3: TEdit
        Left = 2
        Top = 24
        Width = 54
        Height = 22
        TabOrder = 2
        OnChange = Edit3Change
        OnEnter = Edit3Enter
      end
      object ComboBox3: TComboBox
        Left = 59
        Top = 24
        Width = 214
        Height = 22
        TabOrder = 3
        OnChange = ComboBox3Change
      end
    end
    object GroupBox_main_acc: TGroupBox
      Left = 278
      Top = 80
      Width = 256
      Height = 41
      Caption = #1071#1089#1072#1089' '#1074#1103#1089#1072#1080#1090' '#1097#1077#1089#1072#1073#1099
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object CB_main_acc1: TDBLookupComboBox
        Left = 3
        Top = 18
        Width = 250
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'ACC_NO'
        ListSource = DataModWares.DSViewGr2
        ParentFont = False
        TabOrder = 0
        Visible = False
      end
      object CB_main_acc: TDBLookupComboboxEh
        Left = 50
        Top = 19
        Width = 203
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'ACC_NO'
        ListSource = DataModWares.DSViewGr2
        TabOrder = 1
        Visible = True
      end
      object Edit2: TEdit
        Left = 3
        Top = 19
        Width = 46
        Height = 22
        TabOrder = 2
        OnChange = Edit2Change
        OnEnter = Edit2Enter
      end
      object ComboBox2: TComboBox
        Left = 51
        Top = 19
        Width = 202
        Height = 22
        TabOrder = 3
        OnChange = ComboBox2Change
      end
    end
    object GroupBox_sale_acc: TGroupBox
      Left = 278
      Top = 127
      Width = 257
      Height = 47
      Caption = #1040#1083#1075#1099' - '#1057#1072#1090#1075#1099' / '#1047#1103#1088#1103#1088
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      object CB_sale_acc1: TDBLookupComboBox
        Left = 0
        Top = 23
        Width = 254
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'ACC_NO'
        ListSource = DataModWares.DSViewGr3
        ParentFont = False
        TabOrder = 0
        Visible = False
      end
      object CB_sale_acc: TDBLookupComboboxEh
        Left = 48
        Top = 23
        Width = 207
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'ACC_NO'
        ListSource = DataModWares.DSViewGr3
        TabOrder = 1
        Visible = True
      end
      object Edit4: TEdit
        Left = 1
        Top = 23
        Width = 46
        Height = 22
        TabOrder = 2
        OnChange = Edit4Change
        OnEnter = Edit4Enter
      end
      object ComboBox4: TComboBox
        Left = 50
        Top = 23
        Width = 204
        Height = 22
        TabOrder = 3
        OnChange = ComboBox4Change
      end
    end
  end
end
