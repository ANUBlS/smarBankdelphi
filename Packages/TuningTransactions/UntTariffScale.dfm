object FormReferences: TFormReferences
  Left = 362
  Top = 184
  Caption = 'FormReferences'
  ClientHeight = 538
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 14
  object Splitter1: TSplitter
    Left = 0
    Top = 225
    Width = 400
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Color = clWindowText
    ParentColor = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 519
    Width = 400
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 400
    Height = 225
    Align = alTop
    Caption = #1052#1094#1096#1090#1103#1088#1080' '#1075#1088#1091#1087#1083#1072#1088#1099
    TabOrder = 1
    object Panel1: TPanel
      Left = 2
      Top = 16
      Width = 396
      Height = 44
      Align = alTop
      BorderStyle = bsSingle
      TabOrder = 0
      object DBNavigator1: TDBNavigator
        Left = 4
        Top = 4
        Width = 250
        Height = 27
        DataSource = TuningDataModule.DSCustomerGroups
        TabOrder = 0
      end
    end
    object GridGroups: TDBGrid
      Left = 2
      Top = 60
      Width = 396
      Height = 138
      Align = alClient
      DataSource = TuningDataModule.DSCustomerGroups
      DrawingStyle = gdsGradient
      TabOrder = 1
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = #8470
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Caption = #1043#1088#1091#1087#1091#1085' '#1072#1076#1099
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 306
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 2
      Top = 198
      Width = 396
      Height = 25
      Align = alBottom
      TabOrder = 2
      DesignSize = (
        396
        25)
      object EditID: TEdit
        Left = 0
        Top = 1
        Width = 69
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = EditIDChange
        OnExit = EditIDExit
        OnKeyPress = EditIDKeyPress
      end
      object EditName: TEdit
        Left = 73
        Top = 1
        Width = 322
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnChange = EditIDChange
        OnExit = EditIDExit
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 228
    Width = 400
    Height = 291
    Align = alClient
    Caption = #1058#1072#1088#1080#1092' '#1080#1085#1090#1077#1088#1074#1072#1083#1083#1072#1088#1099
    TabOrder = 2
    object Panel2: TPanel
      Left = 2
      Top = 16
      Width = 396
      Height = 44
      Align = alTop
      BorderStyle = bsSingle
      TabOrder = 0
      object DBNavigator2: TDBNavigator
        Left = 4
        Top = 4
        Width = 250
        Height = 27
        DataSource = TuningDataModule.DSTariffScale
        TabOrder = 0
      end
    end
    object GridTariffs: TDBGrid
      Left = 2
      Top = 60
      Width = 396
      Height = 229
      Align = alClient
      DataSource = TuningDataModule.DSTariffScale
      DrawingStyle = gdsGradient
      TabOrder = 1
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'GROUPID'
          Title.Caption = #8470
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AMMOUNT'
          Title.Alignment = taRightJustify
          Title.Caption = #1052#1103#1073#1083#1103#1100
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 83
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PERCENT'
          Title.Alignment = taCenter
          Title.Caption = '%'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MINVALUE'
          Title.Alignment = taRightJustify
          Title.Caption = #1052#1080#1085' '#1084#1103#1073#1083#1103#1100
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MAXVALUE'
          Title.Alignment = taRightJustify
          Title.Caption = #1052#1072#1093' '#1084#1103#1073#1083#1103#1100
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 95
          Visible = True
        end>
    end
  end
end
