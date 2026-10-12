object VFListForm: TVFListForm
  Left = 685
  Top = 168
  BorderIcons = [biSystemMenu]
  ClientHeight = 488
  ClientWidth = 338
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object VFListBox: TCheckListBox
    Left = 0
    Top = 0
    Width = 304
    Height = 440
    Align = alClient
    ItemHeight = 13
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 440
    Width = 338
    Height = 48
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitTop = 478
    ExplicitWidth = 364
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 137
      Height = 43
      Align = alLeft
      Caption = #1044#1086#1085#1084#1091#1096' '#1089#1072#1097#1103#1083#1103#1088#1080#1085' '#1089#1072#1081#1099
      TabOrder = 0
      object EditFrozenColCnt: TEdit
        Left = 9
        Top = 15
        Width = 95
        Height = 21
        TabOrder = 0
      end
    end
    object BtnSaveClose: TButton
      Left = 152
      Top = 8
      Width = 92
      Height = 34
      Caption = #1043#1103#1073#1091#1083'/'#1041#1072#1100#1083#1072
      TabOrder = 1
      OnClick = BtnSaveCloseClick
    end
    object BtnCancelClose: TButton
      Left = 262
      Top = 8
      Width = 94
      Height = 34
      Caption = #1048#1084#1090#1080#1085#1072'/'#1041#1072#1100#1083#1072
      TabOrder = 2
      OnClick = BtnCancelCloseClick
    end
  end
  object Panel2: TPanel
    Left = 304
    Top = 0
    Width = 34
    Height = 440
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitLeft = 330
    ExplicitHeight = 478
    object spUP: TSpeedButton
      Left = 5
      Top = 188
      Width = 25
      Height = 24
      Action = MoveUp
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
    end
    object spDown: TSpeedButton
      Left = 5
      Top = 223
      Width = 25
      Height = 24
      Action = MoveDown
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
    end
  end
  object Localizer: TNLSLocalizer
    Caption = #1042#1080#1079#1091#1072#1083' '#1084#1103#1083#1091#1084#1072#1090#1083#1072#1088#1099#1085' '#1089#1072#1079#1083#1072#1085#1072#1089#1099'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 232
    Top = 24
  end
  object DataSrcList: TOracleDataSet
    SQL.Strings = (
      'select VF.RowID,VF.* from CR_FIELDS_LIST VF'
      'order by vf.seqno')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 200
    Top = 24
    object DataSrcListID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DataSrcListSEQNO: TFloatField
      FieldName = 'SEQNO'
      Required = True
    end
    object DataSrcListFIELDNAME: TStringField
      FieldName = 'FIELDNAME'
      Required = True
      Size = 64
    end
    object DataSrcListFROZEN: TFloatField
      FieldName = 'FROZEN'
      Required = True
    end
    object DataSrcListUSERID: TFloatField
      FieldName = 'USERID'
      Required = True
    end
    object DataSrcListVISIBLE: TFloatField
      FieldName = 'VISIBLE'
      Required = True
    end
    object DataSrcListFIELDDESC: TStringField
      FieldName = 'FIELDDESC'
      Required = True
      Size = 128
    end
  end
  object ActionsLst: TActionList
    Left = 168
    Top = 24
    object MoveUp: TAction
      OnExecute = MoveUpExecute
    end
    object MoveDown: TAction
      OnExecute = MoveDownExecute
    end
  end
  object SetupPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CR_SETUP'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Left = 136
    Top = 24
  end
end
