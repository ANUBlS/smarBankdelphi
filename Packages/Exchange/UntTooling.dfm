object FrmTool: TFrmTool
  Left = 367
  Top = 221
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Exchange Balances'
  ClientHeight = 104
  ClientWidth = 190
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 190
    Height = 104
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 188
      Height = 75
      Align = alClient
      Caption = #1041#1072#1083#1072#1085#1089' '#1097#1077#1089#1072#1073#1083#1072#1088#1099
      TabOrder = 0
      object Panel2: TPanel
        Left = 2
        Top = 16
        Width = 184
        Height = 27
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = ' '#1052#1080#1083#1083#1080' '#1074#1072#1083#1081#1091#1090#1072':'
        TabOrder = 0
        DesignSize = (
          184
          27)
        object DBEdit1: TDBEdit
          Left = 97
          Top = 2
          Width = 87
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'NAT_BALANCE'
          DataSource = ExchangeDataMod.DSTooling
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 86
        end
      end
      object Panel3: TPanel
        Left = 2
        Top = 43
        Width = 184
        Height = 27
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = ' '#1061#1072#1088#1080#1078#1080' '#1074#1072#1083#1081#1091#1090#1072':'
        TabOrder = 1
        DesignSize = (
          184
          27)
        object DBEdit2: TDBEdit
          Left = 97
          Top = 1
          Width = 87
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FOR_BALANCE'
          DataSource = ExchangeDataMod.DSTooling
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 86
        end
      end
    end
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 76
      Width = 188
      Height = 27
      DataSource = ExchangeDataMod.DSTooling
      VisibleButtons = [nbDelete, nbEdit, nbPost, nbCancel]
      Align = alBottom
      Flat = True
      TabOrder = 1
      ExplicitWidth = 187
    end
  end
end
