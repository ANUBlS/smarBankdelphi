object CO_PropertiesForm: TCO_PropertiesForm
  Left = 466
  Top = 510
  Caption = 'CO_PropertiesForm'
  ClientHeight = 359
  ClientWidth = 610
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object Label3: TLabel
    Tag = 17
    Left = 8
    Top = 5
    Width = 136
    Height = 14
    Caption = #1043#1077#1081#1076#1080#1081#1081#1072#1090#1072' '#1072#1083#1099#1085#1084#1099#1096#1076#1099#1088':'
  end
  object Label5: TLabel
    Tag = 22
    Left = 8
    Top = 29
    Width = 90
    Height = 14
    Caption = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099':'
  end
  object Label7: TLabel
    Tag = 23
    Left = 8
    Top = 54
    Width = 52
    Height = 14
    Caption = #1043#1099#1089#1072' '#1072#1076#1099':'
  end
  object Label9: TLabel
    Tag = 25
    Left = 8
    Top = 103
    Width = 33
    Height = 14
    Caption = #1043#1088#1091#1087#1091':'
  end
  object Label10: TLabel
    Tag = 26
    Left = 8
    Top = 128
    Width = 88
    Height = 14
    Caption = #1052#1094#1083#1082#1080#1081#1081#1103#1090' '#1085#1102#1074#1094':'
  end
  object Label11: TLabel
    Tag = 27
    Left = 8
    Top = 153
    Width = 103
    Height = 14
    Caption = #1058#1103#1096#1082#1080#1083#1072#1090' '#1092#1086#1088#1084#1072#1089#1099':'
  end
  object Label12: TLabel
    Tag = 28
    Left = 8
    Top = 179
    Width = 100
    Height = 14
    Caption = #1060#1103#1072#1083#1080#1081#1081#1103#1090' '#1089#1072#1097#1103#1089#1080':'
  end
  object Label13: TLabel
    Tag = 29
    Left = 8
    Top = 202
    Width = 30
    Height = 14
    Caption = #1057#1072#1097#1103':'
  end
  object Label15: TLabel
    Tag = 30
    Left = 8
    Top = 227
    Width = 59
    Height = 14
    Caption = #1054#1050#1055#1054' '#1082#1086#1076#1091':'
  end
  object Label16: TLabel
    Tag = 31
    Left = 8
    Top = 252
    Width = 115
    Height = 14
    Caption = #1042#1077#1088#1101#1080' '#1084#1091#1092#1103#1090#1090#1080#1096#1083#1080#1081#1080':'
  end
  object Label17: TLabel
    Tag = 32
    Left = 8
    Top = 277
    Width = 37
    Height = 14
    Caption = #1042#1070#1048#1053':'
  end
  object Label18: TLabel
    Tag = 33
    Left = 8
    Top = 303
    Width = 146
    Height = 14
    Caption = #1044#1042#1052'-'#1076#1103' '#1075#1077#1081#1076#1103' '#1072#1083#1099#1085#1084#1099#1096#1076#1099#1088':'
  end
  object Label19: TLabel
    Tag = 34
    Left = 282
    Top = 303
    Width = 177
    Height = 14
    Caption = #1053#1080#1079#1072#1084#1085#1072#1084#1103#1089#1080' '#1075#1077#1081#1076#1103' '#1072#1083#1099#1085#1084#1099#1096#1076#1099#1088':'
  end
  object Bevel1: TBevel
    Left = 2
    Top = 323
    Width = 567
    Height = 4
  end
  object Label6: TLabel
    Tag = 21
    Left = 8
    Top = 79
    Width = 77
    Height = 14
    Caption = #1052#1103#1085#1089#1091#1073#1080#1081#1081#1103#1090#1080':'
  end
  object Label8: TLabel
    Tag = 24
    Left = 369
    Top = 277
    Width = 26
    Height = 14
    Caption = #1041#1048#1050':'
  end
  object OpenDateEdit: TDateTimePicker
    Left = 149
    Top = 1
    Width = 101
    Height = 21
    Date = 37342.553889039400000000
    Time = 37342.553889039400000000
    TabOrder = 0
  end
  object OkButton: TButton
    Left = 406
    Top = 332
    Width = 78
    Height = 26
    Caption = 'Ok'
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 489
    Top = 332
    Width = 77
    Height = 26
    Caption = '&Cancel'
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object NameEdit: TDBEdit
    Left = 149
    Top = 25
    Width = 422
    Height = 21
    DataField = 'NAME'
    TabOrder = 3
  end
  object RelationCB: TDBLookupComboBox
    Left = 149
    Top = 74
    Width = 422
    Height = 22
    DataField = 'PRINAD_KOD'
    KeyField = 'ID'
    ListField = 'NAME'
    TabOrder = 4
  end
  object GroupCB: TDBLookupComboBox
    Left = 149
    Top = 99
    Width = 422
    Height = 22
    DataField = 'GROUP_KLIE'
    KeyField = 'ID'
    ListField = 'NAME'
    TabOrder = 5
  end
  object EstateTypeCB: TDBLookupComboBox
    Left = 149
    Top = 124
    Width = 422
    Height = 22
    DataField = 'VID_SOB'
    KeyField = 'ID'
    ListField = 'NAME'
    TabOrder = 6
  end
  object OrganizationTypeCB: TDBLookupComboBox
    Left = 149
    Top = 149
    Width = 422
    Height = 22
    DataField = 'ORG_SOB'
    KeyField = 'ID'
    ListField = 'NAME'
    TabOrder = 7
  end
  object ActionAreaCB: TDBLookupComboBox
    Left = 149
    Top = 173
    Width = 422
    Height = 22
    DataField = 'SFERA_DEY'
    KeyField = 'ID'
    ListField = 'NAME'
    TabOrder = 8
  end
  object BranchCB: TDBLookupComboBox
    Left = 149
    Top = 198
    Width = 422
    Height = 22
    DataField = 'OTRASL'
    KeyField = 'ID'
    ListField = 'NAME'
    TabOrder = 9
  end
  object ClientClosedCB: TCheckBox
    Left = 256
    Top = 2
    Width = 150
    Height = 18
    Caption = #1043#1077#1081#1076#1080#1081#1081#1072#1090#1076#1072#1085' '#1095#1099#1093#1072#1088#1099#1083#1084#1099#1096#1076#1099#1088
    TabOrder = 10
  end
  object ClientClosedPanel: TPanel
    Left = 414
    Top = 0
    Width = 157
    Height = 25
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = #1058#1072#1088#1080#1093':'
    TabOrder = 11
    object CloseDateEdit: TDateTimePicker
      Left = 33
      Top = 0
      Width = 123
      Height = 21
      Date = 37354.872120451400000000
      Time = 37354.872120451400000000
      TabOrder = 0
    end
  end
  object IsNotResidentCB: TDBCheckBox
    Tag = 20
    Left = 440
    Top = 53
    Width = 95
    Height = 16
    Caption = #1056#1077#1079#1080#1076#1077#1085#1090
    DataField = 'NEREZIDENT'
    TabOrder = 12
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object OKPOCodeEdit: TDBEdit
    Left = 149
    Top = 223
    Width = 421
    Height = 21
    DataField = 'KOD_OKPRO'
    TabOrder = 13
  end
  object TazAreaCB: TDBLookupComboBox
    Left = 149
    Top = 248
    Width = 421
    Height = 22
    DataField = 'NALOG_KOD'
    KeyField = 'ID'
    ListField = 'NAME'
    TabOrder = 14
  end
  object TaxIDEdit: TDBEdit
    Left = 149
    Top = 272
    Width = 214
    Height = 21
    DataField = 'INN'
    TabOrder = 15
  end
  object BankIDEdit: TDBEdit
    Left = 405
    Top = 272
    Width = 165
    Height = 21
    DataField = 'BIK'
    TabOrder = 16
  end
  object DBEdit1: TDBEdit
    Left = 149
    Top = 50
    Width = 214
    Height = 21
    DataField = 'SHORT_NAME'
    TabOrder = 17
  end
  object DBEdit3: TDBEdit
    Left = 149
    Top = 297
    Width = 130
    Height = 21
    DataField = 'DAT_NAL'
    TabOrder = 18
  end
  object DBEdit4: TDBEdit
    Left = 439
    Top = 297
    Width = 131
    Height = 21
    DataField = 'DAT_USTAV'
    TabOrder = 19
  end
end
