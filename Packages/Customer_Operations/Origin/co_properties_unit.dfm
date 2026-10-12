object CO_PropertiesForm: TCO_PropertiesForm
  Left = 192
  Top = 107
  Width = 540
  Height = 360
  Caption = 'CO_PropertiesForm'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Tag = 17
    Left = 7
    Top = 5
    Width = 100
    Height = 13
    Caption = 'Гейдиййата алынмышдыр:'
  end
  object Label5: TLabel
    Tag = 22
    Left = 7
    Top = 27
    Width = 68
    Height = 13
    Caption = 'Мцштяринин ады:'
  end
  object Label7: TLabel
    Tag = 23
    Left = 7
    Top = 50
    Width = 41
    Height = 13
    Caption = 'Гыса ады:'
  end
  object Label9: TLabel
    Tag = 25
    Left = 7
    Top = 96
    Width = 32
    Height = 13
    Caption = 'Групу:'
  end
  object Label10: TLabel
    Tag = 26
    Left = 7
    Top = 119
    Width = 74
    Height = 13
    Caption = 'Мцлкиййят нювц:'
  end
  object Label11: TLabel
    Tag = 27
    Left = 7
    Top = 142
    Width = 76
    Height = 13
    Caption = 'Тяшкилат формасы:'
  end
  object Label12: TLabel
    Tag = 28
    Left = 7
    Top = 166
    Width = 77
    Height = 13
    Caption = 'Фяалиййят сащяси:'
  end
  object Label13: TLabel
    Tag = 29
    Left = 7
    Top = 188
    Width = 28
    Height = 13
    Caption = 'Сащя:'
  end
  object Label15: TLabel
    Tag = 30
    Left = 7
    Top = 211
    Width = 60
    Height = 13
    Caption = 'ОКПО коду:'
  end
  object Label16: TLabel
    Tag = 31
    Left = 7
    Top = 234
    Width = 77
    Height = 13
    Caption = 'Верэи муфяттишлийи:'
  end
  object Label17: TLabel
    Tag = 32
    Left = 7
    Top = 257
    Width = 29
    Height = 13
    Caption = 'ВЮИН:'
  end
  object Label18: TLabel
    Tag = 33
    Left = 7
    Top = 281
    Width = 119
    Height = 13
    Caption = 'ДВМ-дя гейдя алынмышдыр:'
  end
  object Label19: TLabel
    Tag = 34
    Left = 262
    Top = 281
    Width = 142
    Height = 13
    Caption = 'Низамнамяси гейдя алынмышдыр:'
  end
  object Bevel1: TBevel
    Left = 2
    Top = 300
    Width = 526
    Height = 4
  end
  object Label6: TLabel
    Tag = 21
    Left = 7
    Top = 73
    Width = 64
    Height = 13
    Caption = 'Мянсубиййяти:'
  end
  object Label8: TLabel
    Tag = 24
    Left = 343
    Top = 257
    Width = 20
    Height = 13
    Caption = 'БИК:'
  end
  object OpenDateEdit: TDateTimePicker
    Left = 138
    Top = 1
    Width = 94
    Height = 21
    CalAlignment = dtaLeft
    Date = 37342.5538890394
    Time = 37342.5538890394
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object OkButton: TButton
    Left = 377
    Top = 308
    Width = 72
    Height = 24
    Caption = 'Ok'
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 454
    Top = 308
    Width = 72
    Height = 24
    Caption = '&Cancel'
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object NameEdit: TDBEdit
    Left = 138
    Top = 23
    Width = 392
    Height = 21
    DataField = 'NAME'
    TabOrder = 3
  end
  object RelationCB: TDBLookupComboBox
    Left = 138
    Top = 69
    Width = 392
    Height = 21
    DataField = 'PRINAD_KOD'
    KeyField = 'ID'
    ListField = 'NAME'
    TabOrder = 4
  end
  object GroupCB: TDBLookupComboBox
    Left = 138
    Top = 92
    Width = 392
    Height = 21
    DataField = 'GROUP_KLIE'
    KeyField = 'ID'
    ListField = 'NAME'
    TabOrder = 5
  end
  object EstateTypeCB: TDBLookupComboBox
    Left = 138
    Top = 115
    Width = 392
    Height = 21
    DataField = 'VID_SOB'
    KeyField = 'ID'
    ListField = 'NAME'
    TabOrder = 6
  end
  object OrganizationTypeCB: TDBLookupComboBox
    Left = 138
    Top = 138
    Width = 392
    Height = 21
    DataField = 'ORG_SOB'
    KeyField = 'ID'
    ListField = 'NAME'
    TabOrder = 7
  end
  object ActionAreaCB: TDBLookupComboBox
    Left = 138
    Top = 161
    Width = 392
    Height = 21
    DataField = 'SFERA_DEY'
    KeyField = 'ID'
    ListField = 'NAME'
    TabOrder = 8
  end
  object BranchCB: TDBLookupComboBox
    Left = 138
    Top = 184
    Width = 392
    Height = 21
    DataField = 'OTRASL'
    KeyField = 'ID'
    ListField = 'NAME'
    TabOrder = 9
  end
  object ClientClosedCB: TCheckBox
    Left = 238
    Top = 2
    Width = 139
    Height = 17
    Caption = 'Гейдиййатдан чыхарылмышдыр'
    TabOrder = 10
  end
  object ClientClosedPanel: TPanel
    Left = 384
    Top = 0
    Width = 146
    Height = 23
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = 'Тарих:'
    TabOrder = 11
    object CloseDateEdit: TDateTimePicker
      Left = 31
      Top = 0
      Width = 114
      Height = 21
      CalAlignment = dtaLeft
      Date = 37354.8721204514
      Time = 37354.8721204514
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
  end
  object IsNotResidentCB: TDBCheckBox
    Tag = 20
    Left = 409
    Top = 49
    Width = 88
    Height = 15
    Caption = 'Резидент'
    DataField = 'NEREZIDENT'
    TabOrder = 12
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object OKPOCodeEdit: TDBEdit
    Left = 138
    Top = 207
    Width = 391
    Height = 21
    DataField = 'KOD_OKPRO'
    TabOrder = 13
  end
  object TazAreaCB: TDBLookupComboBox
    Left = 138
    Top = 230
    Width = 391
    Height = 21
    DataField = 'NALOG_KOD'
    KeyField = 'ID'
    ListField = 'NAME'
    TabOrder = 14
  end
  object TaxIDEdit: TDBEdit
    Left = 138
    Top = 253
    Width = 199
    Height = 21
    DataField = 'INN'
    TabOrder = 15
  end
  object BankIDEdit: TDBEdit
    Left = 376
    Top = 253
    Width = 153
    Height = 21
    DataField = 'BIK'
    TabOrder = 16
  end
  object DBEdit1: TDBEdit
    Left = 138
    Top = 46
    Width = 199
    Height = 21
    DataField = 'SHORT_NAME'
    TabOrder = 17
  end
  object DBEdit3: TDBEdit
    Left = 138
    Top = 276
    Width = 121
    Height = 21
    DataField = 'DAT_NAL'
    TabOrder = 18
  end
  object DBEdit4: TDBEdit
    Left = 408
    Top = 276
    Width = 121
    Height = 21
    DataField = 'DAT_USTAV'
    TabOrder = 19
  end
end
