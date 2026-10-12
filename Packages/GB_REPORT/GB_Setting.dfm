object FormSettingsGBReport: TFormSettingsGBReport
  Left = 367
  Top = 170
  Caption = 'Setting'
  ClientHeight = 359
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 224
    Height = 359
    Align = alLeft
    AutoSize = True
    TabOrder = 0
    object Panel1: TPanel
      Left = 3
      Top = 1
      Width = 220
      Height = 44
      BorderStyle = bsSingle
      TabOrder = 0
      object Label1: TLabel
        Left = 9
        Top = 12
        Width = 22
        Height = 14
        Caption = #1040#1076#1099
      end
      object Edit_Name: TEdit
        Left = 52
        Top = 9
        Width = 156
        Height = 23
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      Left = 3
      Top = 45
      Width = 220
      Height = 44
      BorderStyle = bsSingle
      TabOrder = 1
      object Label4: TLabel
        Left = 9
        Top = 11
        Width = 47
        Height = 14
        Caption = #1052#1103#1073#1083#1103#1100' >'
      end
      object Edit_Mebleg: TEdit
        Left = 78
        Top = 9
        Width = 130
        Height = 22
        TabOrder = 0
        Text = '0'
      end
    end
    object GroupBox1: TGroupBox
      Left = 3
      Top = 89
      Width = 220
      Height = 78
      Caption = #1041#1072#1083#1072#1085#1089' '#1097#1077#1089#1072#1073#1083#1072#1088#1099
      TabOrder = 2
      object Label2: TLabel
        Left = 17
        Top = 23
        Width = 35
        Height = 14
        Caption = #1044#1077#1073#1077#1090':'
      end
      object Label3: TLabel
        Left = 17
        Top = 50
        Width = 40
        Height = 14
        Caption = #1050#1088#1077#1076#1080#1090':'
      end
      object Edit_Debit: TEdit
        Left = 78
        Top = 17
        Width = 130
        Height = 22
        Hint = 'Numune: 1052,381,10,2'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object Edit_Kredit: TEdit
        Left = 78
        Top = 44
        Width = 130
        Height = 22
        Hint = 'Numune: 1052,381,10,2'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object GB_Multi_valyuta: TGroupBox
      Left = 3
      Top = 167
      Width = 220
      Height = 49
      Caption = #1052#1091#1083#1090#1080#1074#1072#1083#1081#1091#1090#1072
      TabOrder = 3
      object CB_Multi_Val: TCheckBox
        Left = 17
        Top = 17
        Width = 156
        Height = 19
        Caption = #1052#1091#1083#1090#1080#1074#1072#1083#1081#1091#1090#1072' '#1103#1084#1103#1083#1080#1081#1081#1072#1090#1099
        TabOrder = 0
      end
    end
    object GB_Emeliyyat_Novleri: TGroupBox
      Left = 3
      Top = 216
      Width = 220
      Height = 130
      Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085' '#1085#1102#1074#1094
      TabOrder = 4
      object Evanescence1: TEvanescence
        Left = 8
        Top = 15
        Width = 204
        Height = 107
        ItemHeight = 14
        TabOrder = 0
        DataSource = DataMod_GBReport.DataSourceVid_OP
        ListField = 'NAME'
        KeyField = 'ID'
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 347
      Width = 222
      Height = 44
      TabOrder = 5
      object Button_OK: TButton
        Left = 71
        Top = 9
        Width = 81
        Height = 27
        Caption = 'OK'
        Default = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Button_OKClick
      end
    end
  end
  object Panel5: TPanel
    Left = 224
    Top = 0
    Width = 242
    Height = 359
    Align = alClient
    Caption = 'Panel5'
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 240
      Height = 27
      DataSource = DataMod_GBReport.DataSource_SQL
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Align = alTop
      TabOrder = 0
    end
    object DBGridReport_SQL: TDBGrid
      Left = 1
      Top = 28
      Width = 240
      Height = 330
      Align = alClient
      DataSource = DataMod_GBReport.DataSource_SQL
      TabOrder = 1
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Alignment = taCenter
          Title.Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085' '#1085#1102#1074#1094
          Width = 200
          Visible = True
        end>
    end
  end
end
