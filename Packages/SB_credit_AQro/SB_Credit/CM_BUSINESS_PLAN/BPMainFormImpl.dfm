object BPMainForm: TBPMainForm
  Left = 278
  Top = 135
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 498
  ClientWidth = 735
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcMain: TPageControl
    Left = 0
    Top = 0
    Width = 735
    Height = 498
    ActivePage = tsLM
    Align = alClient
    TabOrder = 0
    OnChange = pcMainChange
    object tsBP: TTabSheet
      BorderWidth = 2
      Caption = #1041#1080#1079#1085#1077#1089' '#1087#1083#1072#1085
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 723
        Height = 53
        Align = alTop
        Caption = #1050#1088#1077#1076#1080#1090' '#1097#1072#1075#1075#1099#1085#1076#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object GroupBox2: TGroupBox
          Left = 2
          Top = 15
          Width = 303
          Height = 36
          Align = alLeft
          Caption = #1052#1094#1096#1090#1103#1088#1080
          TabOrder = 0
          object DBEdit1: TDBEditEh
            Left = 3
            Top = 12
            Width = 294
            Height = 19
            TabStop = False
            Color = clInfoBk
            DataField = 'NAME'
            DataSource = BPDataModule.DSCreditInfo
            EditButtons = <>
            Flat = True
            TabOrder = 0
            Visible = True
          end
        end
        object GroupBox3: TGroupBox
          Left = 305
          Top = 15
          Width = 416
          Height = 36
          Align = alClient
          Caption = #1055#1088#1086#1090#1086#1082#1086#1083'\'#1055#1072#1088#1072#1075#1088#1072#1092
          TabOrder = 1
          object EditCrdNo: TEdit
            Left = 5
            Top = 12
            Width = 153
            Height = 21
            TabStop = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 53
        Width = 723
        Height = 79
        Align = alTop
        BorderStyle = bsSingle
        TabOrder = 1
        object Label1: TLabel
          Left = 6
          Top = 9
          Width = 82
          Height = 13
          Caption = #1051#1072#1081#1080#1097#1103#1085#1080#1085' '#1076#1103#1081#1103#1088#1080' :'
        end
        object Label2: TLabel
          Left = 6
          Top = 32
          Width = 82
          Height = 13
          Caption = #1050#1088#1077#1076#1080#1090#1083#1103#1096#1103#1085' '#1097#1080#1089#1089#1103':'
        end
        object Label3: TLabel
          Left = 6
          Top = 57
          Width = 83
          Height = 13
          Caption = #1069#1094#1079#1103#1096#1090' '#1076#1102#1074#1088#1094'('#1072#1081'):'
        end
        object Label4: TLabel
          Left = 216
          Top = 9
          Width = 35
          Height = 13
          Caption = #1044#1102#1074#1088#1094' :'
        end
        object Label5: TLabel
          Left = 219
          Top = 31
          Width = 32
          Height = 13
          Caption = #1043#1103#1088#1072#1088' :'
        end
        object Label6: TLabel
          Left = 219
          Top = 55
          Width = 32
          Height = 13
          Caption = #1053#1086#1074#1094' :'
        end
        object Label28: TLabel
          Left = 424
          Top = 8
          Width = 34
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Rayon:'
        end
        object Label29: TLabel
          Left = 424
          Top = 33
          Width = 34
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'K'#1103'nd:'
        end
        object DBNumberEditEh1: TDBNumberEditEh
          Left = 91
          Top = 6
          Width = 121
          Height = 19
          DataField = 'PROJECTCOST'
          DataSource = BPDataModule.DSBPData
          EditButtons = <>
          Flat = True
          TabOrder = 0
          Visible = True
        end
        object DBNumberEditEh2: TDBNumberEditEh
          Left = 91
          Top = 29
          Width = 121
          Height = 19
          DataField = 'GIVENCREDIT'
          DataSource = BPDataModule.DSBPData
          DecimalPlaces = 0
          EditButtons = <>
          Flat = True
          TabOrder = 1
          Visible = True
        end
        object DBNumberEditEh3: TDBNumberEditEh
          Left = 91
          Top = 54
          Width = 121
          Height = 19
          DataField = 'CONCESSIONPERIOD'
          DataSource = BPDataModule.DSBPData
          EditButtons = <>
          Flat = True
          TabOrder = 2
          Visible = True
        end
        object DBLookupComboboxEh1: TDBLookupComboboxEh
          Left = 265
          Top = 5
          Width = 150
          Height = 19
          DataField = 'PURPOSE'
          DataSource = BPDataModule.DSBPData
          DropDownBox.Sizable = True
          EditButtons = <>
          Flat = True
          KeyField = 'ID'
          ListField = 'PURPOSEDESC'
          ListSource = BPDataModule.DSBPPurposes
          TabOrder = 3
          Visible = True
          OnKeyValueChanged = DBLookupComboboxEh1KeyValueChanged
        end
        object DBLookupComboboxEh2: TDBLookupComboboxEh
          Left = 264
          Top = 52
          Width = 150
          Height = 19
          DataField = 'TYPE'
          DataSource = BPDataModule.DSBPData
          DropDownBox.Sizable = True
          EditButtons = <>
          Flat = True
          KeyField = 'ID'
          ListField = 'TYPEDESC'
          ListSource = BPDataModule.DSBPTypes
          TabOrder = 4
          Visible = True
          OnKeyValueChanged = DBLookupComboboxEh1KeyValueChanged
        end
        object DBLookupComboboxEh4: TDBLookupComboboxEh
          Left = 464
          Top = 5
          Width = 121
          Height = 19
          EditButtons = <>
          Flat = True
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = BPDataModule.DistrictsDataSrc
          TabOrder = 5
          Visible = True
        end
        object DBLookupComboboxEh5: TDBLookupComboboxEh
          Left = 464
          Top = 29
          Width = 121
          Height = 19
          DataField = 'VILLAGEID'
          DataSource = BPDataModule.DSBPData
          EditButtons = <>
          Flat = True
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = BPDataModule.VillagesDataSrc
          TabOrder = 6
          Visible = True
        end
        object DBLookupComboboxEh9: TDBLookupComboboxEh
          Left = 265
          Top = 29
          Width = 150
          Height = 19
          DataField = 'SOURCE'
          DataSource = BPDataModule.DSBPData
          DropDownBox.Sizable = True
          EditButtons = <>
          Flat = True
          KeyField = 'ID'
          ListField = 'DESCRIPTION'
          ListSource = BPDataModule.DSBPSources
          TabOrder = 7
          Visible = True
          OnKeyValueChanged = DBLookupComboboxEh1KeyValueChanged
        end
      end
      object GroupBox5: TGroupBox
        Left = 332
        Top = 132
        Width = 391
        Height = 299
        Align = alClient
        Caption = #1061#1103#1088#1078#1083#1103#1088
        TabOrder = 2
        object Label14: TLabel
          Left = 3
          Top = 12
          Width = 71
          Height = 13
          Caption = #1040#1083#1099#1085#1072#1085' '#1084#1072#1090#1077#1088#1080#1072#1083'.'
        end
        object Label15: TLabel
          Left = 4
          Top = 51
          Width = 76
          Height = 13
          Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090' '#1093#1103#1088#1078#1080' .'
        end
        object Label16: TLabel
          Left = 5
          Top = 92
          Width = 87
          Height = 13
          Caption = #1042#1077#1088#1101#1080' '#1074#1103' '#1088#1094#1089#1091#1084#1083#1072#1088' .'
        end
        object Label17: TLabel
          Left = 5
          Top = 134
          Width = 65
          Height = 13
          Caption = #1044#1080#1101#1103#1088' '#1093#1103#1088#1078#1083#1103#1088' .'
        end
        object Label20: TLabel
          Left = 24
          Top = 264
          Width = 52
          Height = 13
          Caption = #1046#1103#1084#1080' '#1093#1103#1088#1078' :'
        end
        object Label30: TLabel
          Left = 32
          Top = 188
          Width = 73
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1052#1103#1097#1089#1091#1083#1091#1085' '#1090#1080#1087#1080':'
        end
        object Label31: TLabel
          Left = 32
          Top = 212
          Width = 73
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1052#1103#1097#1089#1091#1083':'
        end
        object DBEdit9: TDBEditEh
          Left = 4
          Top = 28
          Width = 141
          Height = 19
          DataField = 'BOUGHTMATERIAL'
          DataSource = BPDataModule.DSBPData
          EditButtons = <>
          Flat = True
          TabOrder = 0
          Visible = True
        end
        object DBEdit10: TDBEditEh
          Left = 4
          Top = 67
          Width = 141
          Height = 19
          DataField = 'OPERATIONEXPENSE'
          DataSource = BPDataModule.DSBPData
          EditButtons = <>
          Flat = True
          TabOrder = 1
          Visible = True
        end
        object DBEdit11: TDBEditEh
          Left = 5
          Top = 108
          Width = 140
          Height = 19
          DataField = 'TAXEXPENSE'
          DataSource = BPDataModule.DSBPData
          EditButtons = <>
          Flat = True
          TabOrder = 2
          Visible = True
        end
        object DBEdit12: TDBEditEh
          Left = 5
          Top = 150
          Width = 139
          Height = 19
          DataField = 'OTHEREXPENCE'
          DataSource = BPDataModule.DSBPData
          EditButtons = <>
          Flat = True
          TabOrder = 3
          Visible = True
        end
        object DBEdit15: TDBEditEh
          Left = 86
          Top = 260
          Width = 139
          Height = 19
          DataField = 'SUMEXPENSE'
          DataSource = BPDataModule.DSBPData
          EditButtons = <>
          Flat = True
          TabOrder = 4
          Visible = True
        end
        object DBLookupComboboxEh6: TDBLookupComboboxEh
          Left = 112
          Top = 184
          Width = 141
          Height = 19
          EditButtons = <>
          Flat = True
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = BPDataModule.AKTargetsDataSrc
          TabOrder = 5
          Visible = True
        end
        object DBLookupComboboxEh7: TDBLookupComboboxEh
          Left = 112
          Top = 208
          Width = 141
          Height = 19
          DataField = 'AKPURPOSE'
          DataSource = BPDataModule.DSBPData
          EditButtons = <>
          Flat = True
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = BPDataModule.AKPurposesDataSrc
          TabOrder = 6
          Visible = True
        end
        object DBEdit13: TDBEditEh
          Left = 264
          Top = 29
          Width = 150
          Height = 21
          DataField = 'SOURCE'
          DataSource = BPDataModule.DSBPData
          EditButtons = <>
          TabOrder = 7
          Visible = False
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 431
        Width = 723
        Height = 35
        Align = alBottom
        BorderStyle = bsSingle
        TabOrder = 3
        object Button1: TButton
          Left = 533
          Top = 3
          Width = 75
          Height = 25
          Action = ActionSave
          TabOrder = 0
        end
        object Button2: TButton
          Left = 621
          Top = 3
          Width = 75
          Height = 25
          Action = ActionDismis
          TabOrder = 1
        end
        object CMHintBox1: TCMHintBox
          Left = 8
          Top = 8
          Width = 150
          Height = 18
          AutoSize = True
          BevelOuter = bvNone
          Caption = 'CMHintBox1'
          TabOrder = 2
          Visible = False
          Timeout = 4000
          BeepOnMessage = False
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 132
        Width = 332
        Height = 299
        Align = alLeft
        Caption = #1069#1103#1083#1080#1088#1083#1103#1088
        TabOrder = 4
        object Label7: TLabel
          Left = 3
          Top = 12
          Width = 129
          Height = 13
          Caption = #1048#1089#1090#1077#1097#1089#1072#1083' '#1074#1072#1097#1080#1076#1083#1103#1088#1080#1085#1080#1085' '#1074#1072#1097#1080#1076#1080' .'
        end
        object Label8: TLabel
          Left = 4
          Top = 51
          Width = 119
          Height = 13
          Caption = #1048#1089#1090#1077#1097#1089#1072#1083' '#1074#1072#1097#1080#1076#1083#1103#1088#1080#1085#1080#1085' '#1089#1072#1081#1099' .'
        end
        object Label9: TLabel
          Left = 5
          Top = 92
          Width = 77
          Height = 13
          Caption = #1052#1103#1097#1089#1091#1083#1091#1085' '#1074#1072#1097#1080#1076#1080
        end
        object Label10: TLabel
          Left = 5
          Top = 134
          Width = 113
          Height = 13
          Caption = #1048#1089#1090#1077#1097#1089#1072#1083' '#1086#1083#1091#1085#1072#1085' '#1084#1103#1097#1089#1091#1083' .'
        end
        object Label11: TLabel
          Left = 5
          Top = 173
          Width = 65
          Height = 13
          Caption = #1052#1103#1097#1089#1091#1083#1076#1072#1088#1083#1099#1075' .'
        end
        object Label12: TLabel
          Left = 5
          Top = 212
          Width = 125
          Height = 13
          Caption = #1052#1103#1097#1089#1091#1083#1091#1085' 1'#1082#1075' '#1085#1099#1085' '#1075#1080#1081#1084#1103#1090#1080' .'
        end
        object Label13: TLabel
          Left = 24
          Top = 264
          Width = 51
          Height = 13
          Caption = #1046#1103#1084#1080' '#1101#1103#1083#1080#1088' :'
        end
        object DBEdit2: TDBEditEh
          Left = 4
          Top = 28
          Width = 223
          Height = 19
          DataField = 'UNTMEANSOFPRODUCTION'
          DataSource = BPDataModule.DSBPData
          EditButtons = <>
          Flat = True
          TabOrder = 0
          Visible = True
        end
        object DBEdit3: TDBEditEh
          Left = 4
          Top = 67
          Width = 141
          Height = 19
          DataField = 'NUMBEROFPRODUCTION'
          DataSource = BPDataModule.DSBPData
          EditButtons = <>
          Flat = True
          TabOrder = 1
          Visible = True
        end
        object DBEdit4: TDBEditEh
          Left = 5
          Top = 108
          Width = 220
          Height = 19
          DataField = 'UNTPRODUCTION'
          DataSource = BPDataModule.DSBPData
          EditButtons = <>
          Flat = True
          TabOrder = 2
          Visible = True
        end
        object DBEdit5: TDBEditEh
          Left = 5
          Top = 150
          Width = 139
          Height = 19
          DataField = 'PRODUCTION'
          DataSource = BPDataModule.DSBPData
          EditButtons = <>
          Flat = True
          TabOrder = 3
          Visible = True
        end
        object DBEdit6: TDBEditEh
          Left = 5
          Top = 189
          Width = 139
          Height = 19
          DataField = 'PRODUCTIVITY'
          DataSource = BPDataModule.DSBPData
          EditButtons = <>
          Flat = True
          TabOrder = 4
          Visible = True
        end
        object DBEdit7: TDBEditEh
          Left = 5
          Top = 228
          Width = 139
          Height = 19
          DataField = 'PRODUCTIONCOST'
          DataSource = BPDataModule.DSBPData
          EditButtons = <>
          Flat = True
          TabOrder = 5
          Visible = True
        end
        object DBEdit8: TDBEditEh
          Left = 86
          Top = 260
          Width = 139
          Height = 19
          DataField = 'SUMPROFIT'
          DataSource = BPDataModule.DSBPData
          EditButtons = <>
          Flat = True
          TabOrder = 6
          Visible = True
        end
      end
    end
    object tsLM: TTabSheet
      BorderWidth = 2
      Caption = #1065#1094#1075#1091#1075#1080' '#1090#1103#1076#1073#1080#1088#1083#1103#1088
      ImageIndex = 1
      object GroupBox6: TGroupBox
        Left = 0
        Top = 0
        Width = 723
        Height = 41
        Align = alTop
        Caption = #1052#1094#1096#1090#1103#1088#1080
        TabOrder = 0
        object DBEdit14: TDBEditEh
          Left = 5
          Top = 16
          Width = 492
          Height = 21
          DataField = 'NAME'
          DataSource = DSCreditInfo
          EditButtons = <>
          TabOrder = 0
          Visible = True
        end
      end
      object GroupBox7: TGroupBox
        Left = 0
        Top = 41
        Width = 723
        Height = 272
        Align = alTop
        Caption = #1065#1094#1075#1091#1075#1080' '#1090#1103#1076#1073#1080#1088#1083#1103#1088
        TabOrder = 1
        object DBGrid1: TDBGrid
          Left = 2
          Top = 15
          Width = 719
          Height = 255
          Align = alClient
          DataSource = DataSource1
          FixedColor = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindow
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NUM'
              Title.Caption = #8470
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROTOCOL'
              Title.Caption = #1055#1088#1086#1090
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PARAGRAPH'
              Title.Caption = #1055#1072#1088#1072#1075
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GRANTDATE'
              Title.Caption = #1058#1103#1075'. '#1058#1072#1088#1080#1093#1080
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GIVEDATE'
              Title.Caption = #1042#1077#1088'. '#1058#1072#1088#1080#1093#1080
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MEASURECODE'
              Title.Caption = #1050#1086#1076
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTALAMOUNT'
              Title.Caption = #1040#1082#1090#1080#1074' '#1048#1085#1076'. 1'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MAINDEBT'
              Title.Caption = #1040#1082#1090#1080#1074' '#1048#1085#1076'. 2'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MeasureDesc'
              Title.Caption = #1058#1103#1076#1073#1080#1088#1080#1085' '#1072#1076#1099
              Width = 170
              Visible = True
            end>
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 353
        Width = 723
        Height = 136
        Align = alTop
        TabOrder = 2
        object Label18: TLabel
          Left = 9
          Top = 17
          Width = 70
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #8470': '
        end
        object Label19: TLabel
          Left = 9
          Top = 49
          Width = 70
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1058#1103#1075#1076#1080#1084#1072#1090' '#1090#1072#1088#1080#1093#1080':'
        end
        object Label21: TLabel
          Left = 9
          Top = 81
          Width = 70
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1042#1077#1088#1080#1083#1084#1103' '#1090#1072#1088#1080#1093#1080':'
        end
        object Label22: TLabel
          Left = 200
          Top = 49
          Width = 55
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1050#1086#1076#1091' :'
        end
        object Label23: TLabel
          Left = 200
          Top = 17
          Width = 55
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1055#1088#1086#1090' :'
        end
        object Label24: TLabel
          Left = 368
          Top = 17
          Width = 34
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1055#1072#1088#1072#1075' :'
        end
        object Label25: TLabel
          Left = 368
          Top = 49
          Width = 34
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1040#1076#1099' :'
        end
        object DBText1: TDBText
          Left = 193
          Top = 82
          Width = 111
          Height = 13
          Alignment = taRightJustify
          DataField = 'ACTIVEINDICATOR1'
          DataSource = DataSource2
        end
        object DBText2: TDBText
          Left = 437
          Top = 82
          Width = 136
          Height = 13
          Alignment = taRightJustify
          DataField = 'ACTIVEINDICATOR2'
          DataSource = DataSource2
        end
        object Label26: TLabel
          Left = 309
          Top = 80
          Width = 3
          Height = 13
          Caption = ':'
        end
        object Label27: TLabel
          Left = 577
          Top = 80
          Width = 3
          Height = 13
          Caption = ':'
        end
        object DBEdit16: TDBEditEh
          Left = 86
          Top = 14
          Width = 65
          Height = 21
          DataField = 'NUM'
          DataSource = DataSource1
          EditButtons = <>
          TabOrder = 0
          Visible = True
        end
        object DBDateTimeEditEh1: TDBDateTimeEditEh
          Left = 86
          Top = 46
          Width = 100
          Height = 21
          DataField = 'GRANTDATE'
          DataSource = DataSource1
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 1
          Visible = True
        end
        object DBDateTimeEditEh2: TDBDateTimeEditEh
          Left = 85
          Top = 78
          Width = 100
          Height = 21
          DataField = 'GIVEDATE'
          DataSource = DataSource1
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 2
          Visible = True
        end
        object DBEdit17: TDBEditEh
          Left = 262
          Top = 14
          Width = 100
          Height = 21
          DataField = 'PROTOCOL'
          DataSource = DataSource1
          EditButtons = <>
          TabOrder = 3
          Visible = True
        end
        object DBEdit18: TDBEditEh
          Left = 406
          Top = 14
          Width = 80
          Height = 21
          DataField = 'PARAGRAPH'
          DataSource = DataSource1
          EditButtons = <>
          TabOrder = 4
          Visible = True
        end
        object DBEdit19: TDBEditEh
          Left = 262
          Top = 47
          Width = 100
          Height = 21
          DataField = 'MEASURECODE'
          DataSource = DataSource1
          EditButtons = <>
          TabOrder = 5
          Visible = True
        end
        object DBNumberEditEh4: TDBNumberEditEh
          Left = 315
          Top = 78
          Width = 100
          Height = 21
          DataField = 'TOTALAMOUNT'
          DataSource = DataSource1
          EditButtons = <>
          TabOrder = 6
          Visible = True
        end
        object DBNumberEditEh5: TDBNumberEditEh
          Left = 584
          Top = 78
          Width = 87
          Height = 21
          DataField = 'MAINDEBT'
          DataSource = DataSource1
          EditButtons = <>
          TabOrder = 7
          Visible = True
        end
        object DBLookupComboboxEh3: TDBLookupComboboxEh
          Left = 408
          Top = 47
          Width = 281
          Height = 21
          DataField = 'MEASURECODE'
          DataSource = DataSource1
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'DESCRIPTION'
          ListSource = DataSource2
          TabOrder = 8
          Visible = True
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 313
        Width = 723
        Height = 40
        Align = alTop
        BorderStyle = bsSingle
        TabOrder = 3
        object Button3: TButton
          Left = 152
          Top = 5
          Width = 75
          Height = 25
          Action = Action1
          TabOrder = 0
        end
        object Button4: TButton
          Left = 313
          Top = 5
          Width = 75
          Height = 25
          Action = Action2
          TabOrder = 1
        end
        object Button5: TButton
          Left = 395
          Top = 5
          Width = 75
          Height = 25
          Action = Action3
          TabOrder = 2
        end
        object Button6: TButton
          Left = 478
          Top = 5
          Width = 75
          Height = 25
          Action = Action4
          TabOrder = 3
        end
        object Button7: TButton
          Left = 232
          Top = 5
          Width = 75
          Height = 25
          Action = Action5
          TabOrder = 4
        end
      end
    end
    object tsGrantT: TTabSheet
      Caption = #1043#1088#1072#1085#1090' '#1090#1077#1093#1085#1080#1082#1072#1089#1099
      ImageIndex = 2
      object GroupBox8: TGroupBox
        Left = 0
        Top = 0
        Width = 727
        Height = 97
        Align = alTop
        Caption = #1050#1088#1077#1076#1080#1090' '#1097#1072#1075#1075#1099#1085#1076#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object GroupBox9: TGroupBox
          Left = 2
          Top = 15
          Width = 723
          Height = 39
          Align = alTop
          Caption = #1052#1094#1096#1090#1103#1088#1080
          TabOrder = 0
          object DBEdit20: TDBEditEh
            Left = 11
            Top = 12
            Width = 702
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NAME'
            DataSource = BPDataModule.DSCreditInfo
            EditButtons = <>
            TabOrder = 0
            Visible = True
          end
        end
        object GroupBox10: TGroupBox
          Left = 2
          Top = 54
          Width = 723
          Height = 36
          Align = alTop
          Caption = #1050#1088#1077#1076#1080#1090#1080#1085' '#1085#1102#1084#1088#1103#1089#1080
          TabOrder = 1
          object edCreditNo: TEdit
            Left = 5
            Top = 12
            Width = 153
            Height = 21
            TabStop = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 97
        Width = 727
        Height = 373
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 1
        object GroupBox11: TGroupBox
          Left = 2
          Top = 121
          Width = 723
          Height = 191
          Align = alTop
          Caption = #1043#1088#1072#1085#1090' '#1090#1077#1093#1085#1080#1082#1072#1089#1099#1085#1099#1085' '#1084#1103#1083#1091#1084#1072#1090#1083#1072#1088#1099
          TabOrder = 0
          object Label32: TLabel
            Left = 120
            Top = 38
            Width = 150
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = #1058#1077#1093#1085#1080#1082#1072#1085#1099#1085' '#1072#1076#1099':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label33: TLabel
            Left = 120
            Top = 74
            Width = 150
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = #1043#1088#1072#1085#1090#1099#1085' '#1080#1083#1080':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label34: TLabel
            Left = 120
            Top = 110
            Width = 150
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = #1058#1077#1093#1085#1080#1082#1072#1085#1099#1085' '#1074#1077#1088#1080#1083#1076#1080#1081#1080' '#1090#1072#1088#1080#1093':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label35: TLabel
            Left = 120
            Top = 146
            Width = 150
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = #1058#1077#1093#1085#1080#1082#1072#1085#1099#1085' '#1076#1103#1081#1103#1088#1080':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBLookupComboboxEh8: TDBLookupComboboxEh
            Left = 288
            Top = 36
            Width = 180
            Height = 19
            DataField = 'MACHINEID'
            DataSource = GrantDataSrc
            EditButtons = <>
            Flat = True
            KeyField = 'ID'
            ListField = 'MACHINENAME'
            ListSource = MachinesDataSrc
            TabOrder = 0
            Visible = True
          end
          object DBDateTimeEditEh3: TDBDateTimeEditEh
            Left = 288
            Top = 108
            Width = 180
            Height = 19
            DataField = 'GRANTDATE'
            DataSource = GrantDataSrc
            EditButtons = <>
            Flat = True
            Kind = dtkDateEh
            TabOrder = 1
            Visible = True
          end
          object DBNumberEditEh6: TDBNumberEditEh
            Left = 288
            Top = 72
            Width = 180
            Height = 19
            DataField = 'GRANTYEAR'
            DataSource = GrantDataSrc
            EditButtons = <>
            Flat = True
            TabOrder = 2
            Visible = True
          end
          object DBNumberEditEh7: TDBNumberEditEh
            Left = 288
            Top = 144
            Width = 180
            Height = 19
            DataField = 'MACHINEAMMOUNT'
            DataSource = GrantDataSrc
            EditButtons = <>
            Flat = True
            TabOrder = 3
            Visible = True
          end
        end
        object Button8: TButton
          Left = 496
          Top = 328
          Width = 100
          Height = 30
          Caption = #1049#1072#1076#1076#1072#1096#1072' '#1081#1072#1079
          TabOrder = 1
          OnClick = Button8Click
        end
        object Button9: TButton
          Left = 616
          Top = 328
          Width = 100
          Height = 30
          Caption = 'Imtina'
          TabOrder = 2
          OnClick = Button9Click
        end
        object Panel6: TPanel
          Left = 2
          Top = 2
          Width = 723
          Height = 119
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 3
        end
      end
    end
  end
  object ActionsList: TActionList
    Left = 211
    Top = 12
    object ActionSave: TAction
      Caption = #1049#1072#1076#1076#1072#1096#1072' '#1081#1072#1079
      OnExecute = ActionSaveExecute
      OnUpdate = ActionSaveUpdate
    end
    object ActionDismis: TAction
      Caption = #1048#1084#1090#1080#1085#1072
      OnExecute = ActionDismisExecute
    end
  end
  object ActionList1: TActionList
    Left = 408
    Top = 17
    object Action1: TAction
      Caption = #1049#1077#1085#1080
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = #1049#1072#1076#1076#1072#1096#1072' '#1081#1072#1079
      OnExecute = Action2Execute
      OnUpdate = Action2Update
    end
    object Action3: TAction
      Caption = #1048#1084#1090#1080#1085#1072
      OnExecute = Action3Execute
    end
    object Action4: TAction
      Caption = #1063#1099#1093#1099#1096
      OnExecute = Action4Execute
    end
    object Action5: TAction
      Caption = #1057#1080#1083#1084#1103#1082
      OnExecute = Action5Execute
      OnUpdate = Action5Update
    end
  end
  object CreditInfo: TOracleDataSet
    SQL.Strings = (
      'Select '
      '   Name'
      'From '
      '  CM_BOOROWERINFO '
      'Where '
      '   CreditID=:CreditID'
      '   ')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00430052004500440049005400490044000300
      00000000000000000000}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 312
    Top = 16
  end
  object DSCreditInfo: TDataSource
    DataSet = CreditInfo
    Left = 344
    Top = 16
  end
  object DataSource2: TDataSource
    DataSet = OracleDataSet2
    Left = 464
    Top = 17
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      'SELECT id, description, activeindicator1, activeindicator2'
      '  FROM cm_legal_measure_names')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000004000000040000004900440001000000000016000000440045005300
      4300520049005000540049004F004E0001000000000020000000410043005400
      49005600450049004E00440049004300410054004F0052003100010000000000
      2000000041004300540049005600450049004E00440049004300410054004F00
      52003200010000000000}
    Session = CMDataModule.CMSession
    Left = 552
    Top = 17
    object OracleDataSet2ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OracleDataSet2ACTIVEINDICATOR1: TWideStringField
      FieldName = 'ACTIVEINDICATOR1'
      Size = 100
    end
    object OracleDataSet2ACTIVEINDICATOR2: TWideStringField
      FieldName = 'ACTIVEINDICATOR2'
      Size = 100
    end
    object OracleDataSet2DESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 255
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      
        'SELECT rowid,id, creditid, protocol, paragraph, grantdate, gived' +
        'ate,'
      '       measurecode, totalamount, maindebt, num'
      '  FROM cm_legal_measures'
      'WHERE CreditID=:CreditID')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00430052004500440049005400490044000300
      00000000000000000000}
    Session = CMDataModule.CMSession
    AfterInsert = OracleDataSet1AfterInsert
    AfterPost = OracleDataSet1AfterPost
    Left = 594
    Top = 19
    object OracleDataSet1ID: TFloatField
      FieldName = 'ID'
    end
    object OracleDataSet1CREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object OracleDataSet1PROTOCOL: TFloatField
      FieldName = 'PROTOCOL'
    end
    object OracleDataSet1PARAGRAPH: TFloatField
      FieldName = 'PARAGRAPH'
    end
    object OracleDataSet1GRANTDATE: TDateTimeField
      FieldName = 'GRANTDATE'
    end
    object OracleDataSet1GIVEDATE: TDateTimeField
      FieldName = 'GIVEDATE'
    end
    object OracleDataSet1MEASURECODE: TFloatField
      FieldName = 'MEASURECODE'
      Required = True
    end
    object OracleDataSet1TOTALAMOUNT: TFloatField
      FieldName = 'TOTALAMOUNT'
    end
    object OracleDataSet1MAINDEBT: TFloatField
      FieldName = 'MAINDEBT'
    end
    object OracleDataSet1NUM: TFloatField
      FieldName = 'NUM'
    end
    object OracleDataSet1MeasureDesc: TWideStringField
      FieldKind = fkLookup
      FieldName = 'MeasureDesc'
      LookupDataSet = OracleDataSet2
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIPTION'
      KeyFields = 'MEASURECODE'
      Size = 255
      Lookup = True
    end
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 634
    Top = 19
  end
  object GTMachinesDataSet: TOracleDataSet
    Tag = 12
    SQL.Strings = (
      'select t.rowid, t.*'
      '  from cm_ak_grants t'
      ' where creditid = :CREDITID')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00430052004500440049005400490044000300
      00000000000000000000}
    Session = CMDataModule.CMSession
    Left = 564
    Top = 304
    object GTMachinesDataSetCREDITID: TFloatField
      FieldName = 'CREDITID'
      Required = True
    end
    object GTMachinesDataSetMACHINEID: TFloatField
      FieldName = 'MACHINEID'
      Required = True
    end
    object GTMachinesDataSetGRANTYEAR: TIntegerField
      FieldName = 'GRANTYEAR'
      Required = True
    end
    object GTMachinesDataSetGRANTDATE: TDateTimeField
      FieldName = 'GRANTDATE'
      Required = True
    end
    object GTMachinesDataSetMACHINEAMMOUNT: TFloatField
      FieldName = 'MACHINEAMMOUNT'
      Required = True
    end
  end
  object MachinesDataSet: TOracleDataSet
    Tag = 12
    SQL.Strings = (
      'select * from cm_ak_machines'
      'order by id')
    Optimize = False
    Session = CMDataModule.CMSession
    Left = 564
    Top = 337
    object MachinesDataSetID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object MachinesDataSetMACHINENAME: TWideStringField
      FieldName = 'MACHINENAME'
      Required = True
      Size = 255
    end
    object MachinesDataSetDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 255
    end
  end
  object MachinesDataSrc: TDataSource
    DataSet = MachinesDataSet
    Left = 596
    Top = 337
  end
  object GrantDataSrc: TDataSource
    DataSet = GTMachinesDataSet
    Left = 596
    Top = 305
  end
end
