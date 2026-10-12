object MISForm: TMISForm
  Left = 302
  Top = 166
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 529
  ClientWidth = 916
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 916
    Height = 529
    Align = alClient
    BevelInner = bvLowered
    BorderStyle = bsSingle
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 908
      Height = 408
      Align = alClient
      Caption = #1060#1080#1083#1090#1077#1088
      TabOrder = 0
      object Label2: TLabel
        Left = 9
        Top = 56
        Width = 37
        Height = 14
        Caption = 'Valyuta'
      end
      object Label3: TLabel
        Left = 9
        Top = 228
        Width = 74
        Height = 14
        Caption = 'Istifad'#1103#1095'i qrupu'
      end
      object Label4: TLabel
        Left = 279
        Top = 228
        Width = 53
        Height = 14
        Caption = 'M'#1094#1096't'#1103'ri tipi'
      end
      object Label5: TLabel
        Left = 279
        Top = 56
        Width = 20
        Height = 14
        Caption = 'Filial'
      end
      object LookValute: TEvanescence
        Tag = 3112
        Left = 9
        Top = 73
        Width = 256
        Height = 142
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 14
        ParentFont = False
        TabOrder = 1
        DataSource = MISDm.srcValute
        ListField = 'VALU_NAME'
        KeyField = 'VALUTE'
      end
      object LookUsrGrp: TEvanescence
        Tag = 3112
        Left = 9
        Top = 246
        Width = 256
        Height = 159
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 14
        ParentFont = False
        TabOrder = 3
        DataSource = MISDm.srcUsrGrp
        ListField = 'DESCRIPTION'
        KeyField = 'ID'
      end
      object LookPersonelType: TEvanescence
        Tag = 3112
        Left = 270
        Top = 246
        Width = 375
        Height = 159
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 14
        ParentFont = False
        TabOrder = 4
        DataSource = MISDm.srcPersonelType
        ListField = 'DESCRIPTION'
        KeyField = 'ID'
      end
      object LookBranch: TEvanescence
        Tag = 3112
        Left = 270
        Top = 73
        Width = 375
        Height = 142
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 14
        ParentFont = False
        TabOrder = 2
        DataSource = MISDm.srcBranch
        ListField = 'NAME'
        KeyField = 'ID'
      end
      object Panel2: TPanel
        Left = 2
        Top = 16
        Width = 904
        Height = 33
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 5
          Top = 10
          Width = 33
          Height = 14
          Caption = 'Tarix : '
        end
        object Tarix: TDateTimePicker
          Left = 45
          Top = 5
          Width = 141
          Height = 21
          Date = 38258.605396226800000000
          Time = 38258.605396226800000000
          TabOrder = 0
        end
      end
      object challValute: TButton
        Left = 94
        Top = 54
        Width = 71
        Height = 18
        Caption = 'Ham'#1099's'#1099'n'#1099' se'#1095
        TabOrder = 5
        OnClick = CheckAllValuteClick
      end
      object unchallValute: TButton
        Left = 171
        Top = 54
        Width = 71
        Height = 18
        Caption = 'T'#1103'mizl'#1103
        TabOrder = 6
        OnClick = UnCheckAllValuteClick
      end
      object challUsrGrp: TButton
        Left = 94
        Top = 223
        Width = 71
        Height = 19
        Caption = 'Ham'#1099's'#1099'n'#1099' se'#1095
        TabOrder = 7
        OnClick = challUsrGrpClick
      end
      object unchallUsrGrp: TButton
        Left = 171
        Top = 223
        Width = 71
        Height = 19
        Caption = 'T'#1103'mizl'#1103
        TabOrder = 8
        OnClick = unchallUsrGrpClick
      end
      object Panel5: TPanel
        Left = 646
        Top = 49
        Width = 260
        Height = 357
        Align = alRight
        BevelOuter = bvLowered
        TabOrder = 9
        object Panel6: TPanel
          Left = 1
          Top = 290
          Width = 258
          Height = 72
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 0
          object GroupBox8: TGroupBox
            Left = 2
            Top = 2
            Width = 254
            Height = 68
            Align = alClient
            Caption = #1050#1088#1077#1076#1080#1090#1080#1085' '#1085#1086#1074#1094
            TabOrder = 0
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
              Width = 242
              Height = 22
              DropDownBox.Sizable = True
              EditButtons = <>
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'ID'
              ListField = 'DESCRIPTION'
              ListSource = MISDm.DSCreditTypes
              ParentFont = False
              TabOrder = 1
              Visible = True
            end
          end
        end
        object Panel7: TPanel
          Left = 1
          Top = 218
          Width = 258
          Height = 72
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 1
          object GroupBox10: TGroupBox
            Left = 2
            Top = 2
            Width = 253
            Height = 68
            Align = alLeft
            Caption = #1069#1080#1088#1086#1074
            TabOrder = 0
            object CheckBox10: TCheckBox
              Left = 5
              Top = 41
              Width = 105
              Height = 18
              Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
              TabOrder = 0
            end
            object DBLookupComboboxEh10: TDBLookupComboboxEh
              Left = 5
              Top = 15
              Width = 242
              Height = 22
              DropDownBox.Sizable = True
              EditButtons = <>
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'ID'
              ListField = 'DESCRIPTION'
              ListSource = MISDm.DSPledges
              ParentFont = False
              TabOrder = 1
              Visible = True
            end
          end
        end
        object Panel8: TPanel
          Left = 1
          Top = 145
          Width = 258
          Height = 73
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 2
          object GroupBox7: TGroupBox
            Left = 2
            Top = 2
            Width = 252
            Height = 69
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
              Width = 243
              Height = 22
              DropDownBox.Sizable = True
              EditButtons = <>
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'ID'
              ListField = 'DESCRIPION'
              ListSource = MISDm.DSPersons
              ParentFont = False
              TabOrder = 1
              Visible = True
            end
          end
        end
        object Panel9: TPanel
          Left = 1
          Top = 73
          Width = 258
          Height = 72
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 3
          object GroupBox3: TGroupBox
            Left = 2
            Top = 2
            Width = 251
            Height = 68
            Align = alLeft
            Caption = #1069#1077#1078#1080#1082#1084#1080#1096' '#1090#1103#1089#1085#1080#1092#1072#1090
            TabOrder = 0
            object DBLookupComboboxEh2: TDBLookupComboboxEh
              Left = 5
              Top = 15
              Width = 242
              Height = 22
              DropDownBox.Sizable = True
              EditButtons = <>
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'ID'
              ListField = 'FULLDESC'
              ListSource = MISDm.DSSReserves
              ParentFont = False
              TabOrder = 0
              Visible = True
            end
            object CheckBox2: TCheckBox
              Left = 8
              Top = 41
              Width = 104
              Height = 18
              Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
              TabOrder = 1
            end
          end
        end
        object Panel10: TPanel
          Left = 1
          Top = 1
          Width = 258
          Height = 72
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 4
          object GroupBox6: TGroupBox
            Left = 2
            Top = 2
            Width = 252
            Height = 68
            Align = alLeft
            Caption = #1058#1103#1089#1085#1080#1092#1072#1090
            TabOrder = 0
            object CheckBox5: TCheckBox
              Left = 5
              Top = 41
              Width = 105
              Height = 18
              Caption = #1058#1103#1090#1073#1080#1075' '#1077#1090
              TabOrder = 0
            end
            object DBLookupComboboxEh5: TDBLookupComboboxEh
              Left = 5
              Top = 15
              Width = 243
              Height = 22
              DropDownBox.Sizable = True
              EditButtons = <>
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'ID'
              ListField = 'FULLDESC'
              ListSource = MISDm.DSPReserves
              ParentFont = False
              TabOrder = 1
              Visible = True
            end
          end
        end
      end
    end
    object challBranch: TButton
      Left = 350
      Top = 56
      Width = 72
      Height = 18
      Caption = 'Ham'#1099's'#1099'n'#1099' se'#1095
      TabOrder = 1
      OnClick = challBranchClick
    end
    object unchallBranch: TButton
      Left = 428
      Top = 56
      Width = 72
      Height = 18
      Caption = 'T'#1103'mizl'#1103
      TabOrder = 2
      OnClick = unchallBranchClick
    end
    object challPersonalType: TButton
      Left = 350
      Top = 225
      Width = 72
      Height = 19
      Caption = 'Ham'#1099's'#1099'n'#1099' se'#1095
      TabOrder = 3
      OnClick = challPersonalTypeClick
    end
    object unchallPersonalType: TButton
      Left = 428
      Top = 225
      Width = 72
      Height = 19
      Caption = 'T'#1103'mizl'#1103
      TabOrder = 4
      OnClick = unchallPersonalTypeClick
    end
    object Panel3: TGroupBox
      Left = 2
      Top = 410
      Width = 908
      Height = 113
      Align = alBottom
      Caption = '   '
      TabOrder = 5
      DesignSize = (
        908
        113)
      object ButtonExport: TBitBtn
        Left = 812
        Top = 31
        Width = 82
        Height = 27
        Anchors = []
        Caption = #1048#1093#1088#1072#1078' '#1077#1090
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
        TabOrder = 0
        OnClick = ButtonExportClick
      end
      object CloseBtn: TBitBtn
        Left = 812
        Top = 69
        Width = 82
        Height = 27
        Anchors = []
        Cancel = True
        Caption = 'Ba'#1100'la'
        DoubleBuffered = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        ModalResult = 2
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 1
      end
      object SBListBox: TKeyListBox
        Left = 405
        Top = 16
        Width = 140
        Height = 95
        ItemHeight = 14
        Items.Strings = (
          #1042#1072#1083#1081#1091#1090#1072#1081#1072' '#1101#1102#1088#1103
          #1052#1094#1096#1090#1103#1088#1080' '#1090#1080#1087#1080#1085#1103' '#1101#1102#1088#1103
          #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099#1085#1072' '#1101#1102#1088#1103
          #1060#1080#1083#1080#1072#1083#1072' '#1101#1102#1088#1103)
        TabOrder = 2
        Keys.Strings = (
          'J.VAL_NAME'
          'B.PERSONALTYPE'
          'L.NAME'
          'B.BRANCHID')
      end
      object Panel4: TPanel
        Left = 546
        Top = 16
        Width = 28
        Height = 97
        BevelOuter = bvNone
        TabOrder = 3
        object spUP: TSpeedButton
          Left = 2
          Top = 17
          Width = 25
          Height = 24
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042104200001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042186300001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042186300001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042186300001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C10421042104218631042104200001F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1042FF7F1863104200001F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042186300001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C}
          OnClick = spUPClick
        end
        object spDown: TSpeedButton
          Left = 2
          Top = 57
          Width = 25
          Height = 24
          Glyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042186300001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1042FF7F1863104200001F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C10421042104218631042104200001F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042186300001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042186300001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042186300001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1042104200001F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C}
          OnClick = spDownClick
        end
      end
      object Panel11: TPanel
        Left = 102
        Top = 16
        Width = 153
        Height = 95
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 4
        object ChBCalcInt: TCheckBox
          Left = 6
          Top = 34
          Width = 143
          Height = 19
          Alignment = taLeftJustify
          Caption = #1065#1077#1089#1072#1073#1083#1072#1085#1072#1085' '#1082#1088#1077#1076#1080#1090#1083#1103#1088
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object ChBStopInt: TCheckBox
          Left = 6
          Top = 64
          Width = 143
          Height = 18
          Alignment = taLeftJustify
          Caption = #1065#1077#1089#1072#1073'.'#1076#1072#1081#1072#1085'. '#1082#1088#1077#1076#1080#1090#1083#1103#1088
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object CBOnlyRest: TCheckBox
          Left = 6
          Top = 11
          Width = 143
          Height = 18
          Alignment = taLeftJustify
          Caption = #1049#1072#1083#1085#1099#1079' '#1075#1072#1083#1099#1100#1099' '#1086#1083#1072#1085#1083#1072#1088
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
      object Panel12: TPanel
        Left = 2
        Top = 16
        Width = 100
        Height = 95
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 5
        object ChBActCrd: TCheckBox
          Left = 3
          Top = 16
          Width = 93
          Height = 18
          Alignment = taLeftJustify
          Caption = #1040#1082#1090#1080#1074' '#1082#1088#1077#1076#1080#1090#1083#1103#1088
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object ChBClosCrd: TCheckBox
          Left = 4
          Top = 54
          Width = 92
          Height = 18
          Alignment = taLeftJustify
          Caption = #1041#1072#1100#1083#1099' '#1082#1088#1077#1076#1080#1090#1083#1103#1088
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 256
        Top = 16
        Width = 149
        Height = 101
        TabOrder = 6
        object Label6: TLabel
          Left = 6
          Top = 17
          Width = 131
          Height = 14
          Caption = #1070#1076#1103#1085#1080#1096' '#1084#1094#1076#1076#1103#1090#1080#1085#1103' '#1100#1102#1088#1103
        end
        object DTPB: TDateTimePicker
          Left = 4
          Top = 36
          Width = 139
          Height = 20
          Date = 38960.569568136600000000
          Time = 38960.569568136600000000
          TabOrder = 0
        end
        object DTPE: TDateTimePicker
          Left = 4
          Top = 67
          Width = 139
          Height = 20
          Date = 38960.569568136600000000
          Time = 38960.569568136600000000
          TabOrder = 1
        end
      end
    end
  end
  object MisExcelExport_: TCMExcelExport
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
    Left = 296
  end
  object MisExcelExport: TCMExcelExport
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
    FontSummary.Charset = RUSSIAN_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Azl Sans Serif'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 316
    Top = 59
  end
end
