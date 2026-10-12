object FrmInfo: TFrmInfo
  Left = 230
  Top = 172
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Order Extra Information'
  ClientHeight = 212
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 434
    Height = 212
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 19
      Width = 434
      Height = 43
      Align = alTop
      AutoSize = True
      TabOrder = 0
      object StaticText2: TStaticText
        Left = 1
        Top = 1
        Width = 432
        Height = 18
        Align = alTop
        Alignment = taCenter
        Caption = #1070#1076#1103#1081#1103#1085','#1072#1083#1072#1085' '#1096#1103#1093#1089':'
        Color = clSilver
        ParentColor = False
        TabOrder = 0
      end
      object EIssuedBy: TEdit
        Left = 2
        Top = 20
        Width = 431
        Height = 22
        TabOrder = 1
      end
    end
    object StaticText1: TStaticText
      Left = 0
      Top = 0
      Width = 434
      Height = 19
      Align = alTop
      Alignment = taCenter
      Caption = #1052#1103#1076#1072#1093#1080#1083' / '#1052#1103#1093#1072#1088#1080#1078' '#1054#1088#1076#1077#1088#1080#1085#1103' '#1071#1083#1072#1074#1103#1083#1103#1088
      Color = clNavy
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 0
      Top = 62
      Width = 434
      Height = 47
      Align = alTop
      TabOrder = 2
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 218
        Height = 45
        Align = alLeft
        BevelOuter = bvLowered
        TabOrder = 0
        object StaticText3: TStaticText
          Left = 1
          Top = 1
          Width = 216
          Height = 18
          Align = alTop
          Alignment = taCenter
          Caption = #1057#1103#1085#1103#1076#1080#1085' '#1072#1076#1099':'
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object EPersonDoc: TEdit
          Left = 2
          Top = 20
          Width = 216
          Height = 22
          TabOrder = 1
        end
      end
      object Panel5: TPanel
        Left = 220
        Top = 1
        Width = 213
        Height = 45
        Align = alRight
        BevelOuter = bvLowered
        TabOrder = 1
        object StaticText4: TStaticText
          Left = 1
          Top = 1
          Width = 211
          Height = 18
          Align = alTop
          Alignment = taCenter
          Caption = #1065#1072#1088#1072#1076#1072#1085','#1085#1103' '#1074#1072#1093#1090' '#1074#1077#1088#1080#1083#1080#1073
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object EFromWhen: TEdit
          Left = 2
          Top = 20
          Width = 211
          Height = 22
          TabOrder = 1
        end
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 109
      Width = 434
      Height = 46
      Align = alTop
      TabOrder = 3
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 218
        Height = 44
        Align = alLeft
        BevelOuter = bvLowered
        TabOrder = 0
        object StaticText5: TStaticText
          Left = 1
          Top = 1
          Width = 216
          Height = 18
          Align = alTop
          Alignment = taCenter
          Caption = #1057#1077#1088#1080#1081#1072#1089#1099':'
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object ESeria: TEdit
          Left = 2
          Top = 20
          Width = 216
          Height = 22
          TabOrder = 1
        end
      end
      object Panel8: TPanel
        Left = 220
        Top = 1
        Width = 213
        Height = 44
        Align = alRight
        BevelOuter = bvLowered
        TabOrder = 1
        object StaticText6: TStaticText
          Left = 1
          Top = 1
          Width = 211
          Height = 18
          Align = alTop
          Alignment = taCenter
          Caption = #1053#1102#1084#1088#1103#1089#1080':'
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object EDocNumber: TEdit
          Left = 2
          Top = 20
          Width = 211
          Height = 22
          TabOrder = 1
        end
      end
    end
    object BitBtn1: TBitBtn
      Left = 223
      Top = 183
      Width = 67
      Height = 27
      Action = ActionInsert
      Caption = #1071#1083#1072#1074#1103
      Default = True
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 4
    end
    object BitBtn2: TBitBtn
      Left = 294
      Top = 183
      Width = 67
      Height = 27
      Action = ActionUpdate
      Caption = #1056#1077#1076#1072#1082#1090#1103
      Default = True
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 5
    end
    object BitBtn3: TBitBtn
      Left = 365
      Top = 183
      Width = 67
      Height = 27
      Action = ActionDelete
      Caption = #1057#1080#1083
      Default = True
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 6
    end
    object DBLookupCashInfo: TDBLookupComboBox
      Left = 1
      Top = 156
      Width = 433
      Height = 22
      KeyField = 'ID'
      ListField = 'ISSUEDBY'
      ListSource = CashDataMod.DataBrowseCashInfo
      TabOrder = 7
      OnClick = DBLookupCashInfoClick
    end
  end
  object ActionList1: TActionList
    Left = 456
    Top = 280
    object ActionInsert: TAction
      Caption = #1071#1083#1072#1074#1103
      OnExecute = ActionInsertExecute
      OnUpdate = ActionInsertUpdate
    end
    object ActionUpdate: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1103
      OnExecute = ActionUpdateExecute
      OnUpdate = ActionUpdateUpdate
    end
    object ActionDelete: TAction
      Caption = #1057#1080#1083
      OnExecute = ActionDeleteExecute
      OnUpdate = ActionUpdateUpdate
    end
  end
end
