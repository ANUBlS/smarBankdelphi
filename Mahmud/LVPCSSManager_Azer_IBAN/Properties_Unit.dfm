object PropertiesForm: TPropertiesForm
  Left = 95
  Top = 257
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PropertiesForm'
  ClientHeight = 448
  ClientWidth = 813
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
  OnKeyUp = FormKeyUp
  DesignSize = (
    813
    448)
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton2: TSpeedButton
    Left = 5
    Top = 418
    Width = 97
    Height = 25
    Caption = #1044#1080#1101#1103#1088' '#1087#1072#1088#1072#1084#1077#1090#1088#1083#1103#1088
    OnClick = SpeedButton2Click
  end
  object Admin_: TSpeedButton
    Left = 120
    Top = 420
    Width = 89
    Height = 22
    Caption = #1040#1076#1084#1080#1085' '#1055#1072#1088#1072#1084#1077#1090#1088
    OnClick = Admin_Click
  end
  object But_cancel: TBitBtn
    Left = 731
    Top = 418
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1063#1099#1093#1099#1096
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = But_cancelClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 813
    Height = 413
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 1
    object Panel4: TPanel
      Left = 304
      Top = 0
      Width = 509
      Height = 413
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 509
        Height = 413
        Align = alClient
        Caption = #1061#1070#1065#1050#1057' '#1065#1077#1089#1072#1073#1083#1072#1088#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object DBGrid2: TDBGrid
          Left = 2
          Top = 89
          Width = 252
          Height = 236
          Align = alLeft
          Color = clSilver
          DataSource = DS_XSAccount
          DrawingStyle = gdsGradient
          GradientEndColor = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 2
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VAL_NAME'
              Title.Alignment = taCenter
              Title.Caption = 'Val.'
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 35
              Visible = True
            end
            item
              Alignment = taCenter
              Color = clWhite
              Expanded = False
              FieldName = 'ACC_NO'
              Title.Alignment = taCenter
              Title.Caption = #1065#1077#1089#1072#1073
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 122
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Alignment = taCenter
              Title.Caption = #1060#1080#1083#1080#1072#1083
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 79
              Visible = True
            end>
        end
        object Panel7: TPanel
          Left = 2
          Top = 39
          Width = 505
          Height = 24
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = ' '#1042#1072#1083#1081#1091#1090#1072':'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Combo_valute: TComboBox
            Left = 157
            Top = 1
            Width = 191
            Height = 21
            Style = csDropDownList
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object Valute_ID: TListBox
            Left = 239
            Top = 4
            Width = 26
            Height = 16
            ItemHeight = 13
            TabOrder = 1
            Visible = False
          end
        end
        object Panel8: TPanel
          Left = 2
          Top = 63
          Width = 505
          Height = 26
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = ' '#1065#1077#1089#1072#1073':'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          DesignSize = (
            505
            26)
          object SpeedButton3: TSpeedButton
            Left = 214
            Top = 2
            Width = 25
            Height = 21
            Anchors = [akRight, akBottom]
            Caption = 'OK'
            OnClick = SpeedButton3Click
          end
          object BtnXS_BranchAccountOK: TSpeedButton
            Left = 425
            Top = 1
            Width = 23
            Height = 22
            Caption = 'OK'
            OnClick = BtnXS_BranchAccountOKClick
          end
          object Label4: TLabel
            Left = 450
            Top = 6
            Width = 37
            Height = 13
            Caption = '(2801)'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SearchXsAccount: TSearchEdit
            Left = 46
            Top = 2
            Width = 163
            Height = 21
            CharCase = ecUpperCase
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier'
            Font.Style = []
            MaxLength = 16
            ParentFont = False
            TabOrder = 0
            DataSource = DataMod.Account_Source
            SearchField = 'acc_no'
          end
          object SearchEditXS_BranchAccount: TSearchEdit
            Left = 254
            Top = 2
            Width = 163
            Height = 21
            CharCase = ecUpperCase
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier'
            Font.Style = []
            MaxLength = 16
            ParentFont = False
            TabOrder = 1
            DataSource = DataMod.Account_Source
            SearchField = 'acc_no'
          end
        end
        object GroupBox7: TGroupBox
          Left = 2
          Top = 325
          Width = 505
          Height = 86
          Align = alBottom
          Caption = #1050#1102#1095#1094#1088#1084#1103' '#1103#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085' '#1072#1076#1099
          TabOrder = 3
          object Panel14: TPanel
            Left = 2
            Top = 15
            Width = 501
            Height = 69
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              501
              69)
            object SpeedButton14: TSpeedButton
              Left = 444
              Top = 32
              Width = 53
              Height = 21
              Anchors = [akRight, akBottom]
              Caption = #1043#1103#1073#1091#1083
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = SpeedButton14Click
            end
            object DBText1: TDBText
              Left = 5
              Top = 0
              Width = 244
              Height = 27
              DataField = 'NAME'
              DataSource = DS_Commision
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 255
              Top = 32
              Width = 187
              Height = 21
              Anchors = [akRight, akBottom]
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              KeyField = 'ID'
              ListField = 'NAME'
              ListSource = DS_Commision
              ParentFont = False
              TabOrder = 0
            end
          end
        end
        object Panel9: TPanel
          Left = 2
          Top = 15
          Width = 505
          Height = 24
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = ' '#1060#1080#1083#1080#1072#1083':'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          object ComFilial: TDBViewComboBox
            Left = 157
            Top = 1
            Width = 190
            Height = 21
            Style = csDropDownList
            TabOrder = 0
            ListSource = DSFilial
            ListFields = 'NAME'
            FieldInterval = 5
            DropDownOnEnter = False
          end
        end
        object DBGrid1: TDBGrid
          Left = 254
          Top = 89
          Width = 253
          Height = 236
          Align = alClient
          Color = clSilver
          DataSource = DS_XSBranchAccount
          DrawingStyle = gdsGradient
          GradientEndColor = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 5
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VAL_NAME'
              Title.Alignment = taCenter
              Title.Caption = 'Val.'
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 35
              Visible = True
            end
            item
              Alignment = taCenter
              Color = clWhite
              Expanded = False
              FieldName = 'ACC_NO'
              Title.Alignment = taCenter
              Title.Caption = #1065#1077#1089#1072#1073
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 122
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Alignment = taCenter
              Title.Caption = #1060#1080#1083#1080#1072#1083
              Title.Font.Charset = RUSSIAN_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 79
              Visible = True
            end>
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 304
      Height = 413
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Panel3'
      TabOrder = 1
      object GroupBox3: TGroupBox
        Left = 0
        Top = 53
        Width = 304
        Height = 46
        Align = alTop
        Caption = #1050#1102#1078#1094#1088#1084#1103' '#1083#1080#1084#1080#1090#1080
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          304
          46)
        object SpeedButton5: TSpeedButton
          Left = 246
          Top = 17
          Width = 53
          Height = 21
          Anchors = [akRight, akBottom]
          Caption = #1043#1103#1073#1091#1083
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton5Click
        end
        object Label3: TLabel
          Left = 12
          Top = 21
          Width = 24
          Height = 13
          Caption = #1051#1080#1084#1080#1090':'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Edit_limit: TCurrencyEdit
          Left = 74
          Top = 17
          Width = 165
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '0'
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 304
        Height = 53
        Align = alTop
        Caption = #1057#1091#1073' '#1097#1077#1089#1072#1073#1083#1072#1088#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          304
          53)
        object SpeedButton1: TSpeedButton
          Left = 247
          Top = 19
          Width = 53
          Height = 21
          Anchors = [akRight, akBottom]
          Caption = #1043#1103#1073#1091#1083
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton1Click
        end
        object Label2: TLabel
          Left = 9
          Top = 16
          Width = 57
          Height = 28
          AutoSize = False
          Caption = #1052#1094#1093#1073#1080#1088' '#1089#1072#1073' '#1097#1077#1089#1072#1073':'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Panel5: TPanel
          Left = 26
          Top = 54
          Width = 300
          Height = 31
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = ' SWIFT - '#1084#1094#1093#1073#1080#1088' '#1097#1077#1089#1072#1073':'
          TabOrder = 0
          Visible = False
        end
        object Edit_Account: TEdit
          Left = 73
          Top = 19
          Width = 167
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier'
          Font.Style = []
          MaxLength = 13
          ParentFont = False
          TabOrder = 1
          OnKeyPress = Edit_AccountKeyPress
        end
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 237
        Width = 304
        Height = 67
        Caption = 'SWIFT '#1060#1072#1081#1083' '#1076#1080#1088#1077#1082#1090#1086#1088#1080#1081#1072#1083#1072#1088#1099
        TabOrder = 2
        object Panel10: TPanel
          Left = 2
          Top = 15
          Width = 300
          Height = 26
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = ' '#1069#1103#1083#1103#1085#1083#1103#1088':'
          TabOrder = 0
          DesignSize = (
            300
            26)
          object SpeedButton8: TSpeedButton
            Left = 47
            Top = 4
            Width = 16
            Height = 18
            Caption = '...'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton9: TSpeedButton
            Left = 243
            Top = 3
            Width = 53
            Height = 21
            Anchors = [akRight, akBottom]
            Caption = #1043#1103#1073#1091#1083' '#1077#1090
          end
        end
        object Panel11: TPanel
          Left = 2
          Top = 41
          Width = 300
          Height = 24
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = ' '#1069#1077#1076#1103#1085#1083#1103#1088':'
          TabOrder = 1
          DesignSize = (
            300
            24)
          object SpeedButton10: TSpeedButton
            Left = 48
            Top = 3
            Width = 16
            Height = 18
            Caption = '...'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton11: TSpeedButton
            Left = 243
            Top = 2
            Width = 53
            Height = 21
            Anchors = [akRight, akBottom]
            Caption = #1043#1103#1073#1091#1083' '#1077#1090
          end
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 99
        Width = 304
        Height = 93
        Align = alTop
        Caption = #1060#1072#1081#1083' '#1076#1080#1088#1077#1082#1090#1086#1088#1080#1081#1072#1083#1072#1088#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object Panel6: TPanel
          Left = 2
          Top = 15
          Width = 300
          Height = 26
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = ' '#1069#1103#1083#1103#1085#1083#1103#1088':'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          DesignSize = (
            300
            26)
          object But_in: TSpeedButton
            Left = 219
            Top = 4
            Width = 20
            Height = 18
            Caption = '...'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = But_inClick
          end
          object SpeedButton6: TSpeedButton
            Left = 243
            Top = 3
            Width = 53
            Height = 21
            Anchors = [akRight, akBottom]
            Caption = #1043#1103#1073#1091#1083
            OnClick = SpeedButton6Click
          end
          object Edit_IN_Dir: TEdit
            Left = 52
            Top = 3
            Width = 163
            Height = 21
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel12: TPanel
          Left = 2
          Top = 41
          Width = 300
          Height = 24
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = ' '#1069#1077#1076#1103#1085#1083#1103#1088':'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          DesignSize = (
            300
            24)
          object But_out: TSpeedButton
            Left = 219
            Top = 3
            Width = 20
            Height = 18
            Caption = '...'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = But_outClick
          end
          object SpeedButton7: TSpeedButton
            Left = 243
            Top = 2
            Width = 53
            Height = 21
            Anchors = [akRight, akBottom]
            Caption = #1043#1103#1073#1091#1083
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = SpeedButton7Click
          end
          object Edit_out_dir: TEdit
            Left = 52
            Top = 1
            Width = 164
            Height = 21
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Panel15: TPanel
          Left = 2
          Top = 65
          Width = 300
          Height = 24
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = ' '#1040#1088#1093#1080#1074':'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          DesignSize = (
            300
            24)
          object but_archive: TSpeedButton
            Left = 219
            Top = 3
            Width = 20
            Height = 18
            Caption = '...'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = but_archiveClick
          end
          object SpeedButton16: TSpeedButton
            Left = 243
            Top = 2
            Width = 53
            Height = 21
            Anchors = [akRight, akBottom]
            Caption = #1043#1103#1073#1091#1083
            OnClick = SpeedButton16Click
          end
          object Edit_archiv_dir: TEdit
            Left = 52
            Top = 1
            Width = 164
            Height = 21
            Color = clSilver
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      object GroupBox6: TGroupBox
        Left = 0
        Top = 192
        Width = 304
        Height = 221
        Align = alClient
        Caption = #1070#1076#1103#1085#1080#1096' '#1085#1102#1074#1083#1103#1088#1080#1085#1080#1085' '#1050#1086#1076#1083#1072#1088#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object SpeedButton13: TSpeedButton
          Left = 226
          Top = 169
          Width = 68
          Height = 21
          Caption = 'Sil'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton13Click
        end
        object SpeedButton12: TSpeedButton
          Left = 226
          Top = 143
          Width = 68
          Height = 21
          Caption = #1071#1083#1072#1074#1103' '#1077#1090
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton12Click
        end
        object DBGrid3: TDBGrid
          Left = 2
          Top = 141
          Width = 211
          Height = 78
          Align = alLeft
          BorderStyle = bsNone
          Color = clSilver
          DataSource = DataMod.DSTransTypeCode
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Options = [dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'NAME'
              Width = 160
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODE'
              Width = 30
              Visible = True
            end>
        end
        object Panel13: TPanel
          Left = 2
          Top = 113
          Width = 300
          Height = 28
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvRaised
          BevelOuter = bvNone
          Caption = ' '#1040#1095#1099#1075#1083#1072#1084#1072':'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Label1: TLabel
            Left = 215
            Top = 5
            Width = 28
            Height = 13
            Caption = #1050#1086#1076#1091':'
          end
          object Edit_transcode_name: TEdit
            Left = 51
            Top = 2
            Width = 160
            Height = 21
            CharCase = ecUpperCase
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            MaxLength = 15
            ParentFont = False
            TabOrder = 0
          end
          object Edit_transCode_value: TSpinEdit
            Left = 244
            Top = 2
            Width = 47
            Height = 22
            MaxLength = 3
            MaxValue = 999
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
        end
        object Panel2: TPanel
          Left = 2
          Top = 15
          Width = 300
          Height = 98
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object SpeedButton17: TSpeedButton
            Left = 226
            Top = 60
            Width = 68
            Height = 21
            Caption = 'Sil'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = SpeedButton17Click
          end
          object SpeedButton15: TSpeedButton
            Left = 226
            Top = 34
            Width = 68
            Height = 21
            Caption = #1071#1083#1072#1074#1103' '#1077#1090
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = SpeedButton15Click
          end
          object Panel16: TPanel
            Left = 0
            Top = 0
            Width = 300
            Height = 28
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvNone
            Caption = ' '#1040#1076#1099':'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Edit_TransType_name: TEdit
              Left = 24
              Top = 2
              Width = 187
              Height = 21
              CharCase = ecUpperCase
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              MaxLength = 15
              ParentFont = False
              TabOrder = 0
            end
          end
          object DBCtrlGrid1: TDBCtrlGrid
            Left = 0
            Top = 28
            Width = 214
            Height = 70
            Align = alLeft
            AllowInsert = False
            Color = clBtnFace
            DataSource = DataMod.DSTransTypeName
            PanelBorder = gbNone
            PanelHeight = 17
            PanelWidth = 197
            ParentColor = False
            TabOrder = 1
            RowCount = 4
            SelectedColor = clGray
            object DBText2: TDBText
              Left = 3
              Top = 2
              Width = 186
              Height = 12
              DataField = 'NAME'
              DataSource = DataMod.DSTransTypeName
            end
          end
        end
      end
    end
  end
  object Button1: TButton
    Left = 230
    Top = 419
    Width = 93
    Height = 24
    Caption = #1042#1077#1088#1101#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object DataXSAccount: TOracleDataSet
    SQL.Strings = (
      'SELECT v.val_name, a.acc_no, f.NAME'
      '  FROM xs_accounts x, avalute v, ACCOUNT a, Filial f'
      
        ' WHERE (x.valute = v.valute) AND (x.acc_id = a.id) AND (f.id = x' +
        '.branchid)'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 504
    Top = 167
  end
  object DS_XSAccount: TDataSource
    DataSet = DataXSAccount
    Left = 504
    Top = 200
  end
  object DataTemp: TOracleDataSet
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 400
    Top = 168
  end
  object PackConfig: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'XS_CONTROL'
    Left = 434
    Top = 167
  end
  object Commision: TOracleDataSet
    SQL.Strings = (
      'select * from commision_trans')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 352
    Top = 256
  end
  object DS_Commision: TDataSource
    DataSet = Commision
    Left = 388
    Top = 251
  end
  object DataFilial: TOracleDataSet
    SQL.Strings = (
      'select'
      '    *'
      'from'
      '    Filial'
      ''
      ' '
      ' '
      ' '
      ' ')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 472
    Top = 167
  end
  object DSFilial: TDataSource
    DataSet = DataFilial
    Left = 472
    Top = 200
  end
  object DS_XSBranchAccount: TDataSource
    DataSet = OrDSXS_BranchAccount
    Left = 752
    Top = 200
  end
  object OrDSXS_BranchAccount: TOracleDataSet
    SQL.Strings = (
      'SELECT v.Val_Name, a.Acc_No, f.Name'
      '  FROM xs_BranchAccount x, Avalute v, Account a, Filial f'
      
        ' WHERE (x.valute = v.valute) and (x.AccID = a.ID) and (f.ID = x.' +
        'BranchID)'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 751
    Top = 167
  end
end
