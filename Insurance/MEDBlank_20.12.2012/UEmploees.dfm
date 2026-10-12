object fmEmploees: TfmEmploees
  Left = 225
  Top = 198
  Caption = 'fmEmploees'
  ClientHeight = 360
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 729
    Height = 325
    Align = alClient
    Caption = #1057#1099#1100#1086#1088#1090#1072#1083#1072#1085#1072#1078#1072#1075' '#1080#1096#1095#1080#1083#1103#1088#1080#1085' '#1089#1072#1081#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 17
      Width = 725
      Height = 306
      Align = alClient
      DataSource = MedBDataMod.DSEmployees
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = [fsBold]
      OnDrawDataCell = DBGrid1DrawDataCell
      Columns = <
        item
          Expanded = False
          FieldName = 'SURNAME'
          Title.Caption = #1057#1086#1081#1072#1076#1099
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Caption = #1040#1076#1099
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FATHERNAME'
          Title.Caption = #1040#1090#1072#1089#1099#1085#1099#1085' '#1072#1076#1099
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATEOFBIRTH'
          Title.Caption = #1044#1086#1100#1091#1083#1076#1091#1100#1091' '#1090#1072#1088#1080#1093#1080
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SEX'
          Title.Caption = #1046#1080#1085#1089#1080
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OCCCombo'
          Title.Caption = #1052#1103#1096#1100#1091#1083#1080#1081#1081#1103#1090' '#1085#1102#1074#1094
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 117
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GROUP_'
          Title.Caption = #1043#1088#1091#1087
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 325
    Width = 729
    Height = 35
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      729
      35)
    object BitBtn1: TBitBtn
      Left = 546
      Top = 4
      Width = 81
      Height = 27
      Anchors = [akRight, akBottom]
      DoubleBuffered = True
      Kind = bkOK
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 641
      Top = 4
      Width = 81
      Height = 27
      Anchors = [akRight, akBottom]
      DoubleBuffered = True
      Kind = bkCancel
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object OracleNavigator1: TOracleNavigator
      Left = 4
      Top = 3
      Width = 288
      Height = 27
      DataSource = MedBDataMod.DSEmployees
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Flat = True
      TabOrder = 2
    end
  end
end
