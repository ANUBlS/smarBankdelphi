object BPMainForm: TBPMainForm
  Left = 300
  Top = 150
  BorderStyle = bsDialog
  ClientHeight = 451
  ClientWidth = 470
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 470
    Height = 53
    Align = alTop
    Caption = ' редит щаггында'
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
      Caption = 'ћцшт€ри'
      TabOrder = 0
      object DBEdit1: TDBEdit
        Left = 3
        Top = 12
        Width = 294
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'NAME'
        DataSource = BPDataModule.DSCreditInfo
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 305
      Top = 15
      Width = 163
      Height = 36
      Align = alClient
      Caption = 'ѕротокол\ѕараграф'
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
  object Panel1: TPanel
    Left = 0
    Top = 416
    Width = 470
    Height = 35
    Align = alBottom
    BorderStyle = bsSingle
    TabOrder = 1
    object Button1: TButton
      Left = 309
      Top = 3
      Width = 75
      Height = 25
      Action = ActionSave
      TabOrder = 0
    end
    object Button2: TButton
      Left = 389
      Top = 3
      Width = 75
      Height = 25
      Action = ActionDismis
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 53
    Width = 470
    Height = 79
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 2
    object Label1: TLabel
      Left = 6
      Top = 9
      Width = 82
      Height = 13
      Caption = 'Ћайищ€нин д€й€ри :'
    end
    object Label2: TLabel
      Left = 6
      Top = 32
      Width = 82
      Height = 13
      Caption = ' редитл€ш€н щисс€:'
    end
    object Label3: TLabel
      Left = 6
      Top = 57
      Width = 83
      Height = 13
      Caption = 'Ёцз€шт дюврц(ай):'
    end
    object Label4: TLabel
      Left = 216
      Top = 9
      Width = 46
      Height = 13
      Caption = 'ћ€гс€ди :'
    end
    object Label5: TLabel
      Left = 216
      Top = 31
      Width = 46
      Height = 13
      Caption = 'ћ€нб€йи :'
    end
    object Label6: TLabel
      Left = 217
      Top = 55
      Width = 32
      Height = 13
      Caption = 'Ќовц :'
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
    object DBEdit13: TDBEdit
      Left = 264
      Top = 29
      Width = 196
      Height = 21
      DataField = 'SOURCE'
      DataSource = BPDataModule.DSBPData
      TabOrder = 4
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 265
      Top = 5
      Width = 195
      Height = 21
      DataField = 'PURPOSE'
      DataSource = BPDataModule.DSBPData
      DropDownBox.Sizable = True
      EditButtons = <>
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
      Width = 197
      Height = 21
      DataField = 'TYPE'
      DataSource = BPDataModule.DSBPData
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'TYPEDESC'
      ListSource = BPDataModule.DSBPTypes
      TabOrder = 5
      Visible = True
      OnKeyValueChanged = DBLookupComboboxEh1KeyValueChanged
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 132
    Width = 235
    Height = 284
    Align = alLeft
    Caption = 'Ё€лирл€р'
    TabOrder = 3
    object Label7: TLabel
      Left = 3
      Top = 12
      Width = 129
      Height = 13
      Caption = '»стещсал ващидл€ринин ващиди .'
    end
    object Label8: TLabel
      Left = 4
      Top = 51
      Width = 119
      Height = 13
      Caption = '»стещсал ващидл€ринин сайы .'
    end
    object Label9: TLabel
      Left = 5
      Top = 92
      Width = 77
      Height = 13
      Caption = 'ћ€щсулун ващиди'
    end
    object Label10: TLabel
      Left = 5
      Top = 134
      Width = 113
      Height = 13
      Caption = '»стещсал олунан м€щсул .'
    end
    object Label11: TLabel
      Left = 5
      Top = 173
      Width = 65
      Height = 13
      Caption = 'ћ€щсулдарлыг .'
    end
    object Label12: TLabel
      Left = 5
      Top = 212
      Width = 125
      Height = 13
      Caption = 'ћ€щсулун 1кг нын гийм€ти .'
    end
    object Label13: TLabel
      Left = 24
      Top = 264
      Width = 51
      Height = 13
      Caption = '∆€ми э€лир :'
    end
    object DBEdit2: TDBEdit
      Left = 4
      Top = 28
      Width = 223
      Height = 21
      DataField = 'UNTMEANSOFPRODUCTION'
      DataSource = BPDataModule.DSBPData
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 4
      Top = 67
      Width = 141
      Height = 21
      DataField = 'NUMBEROFPRODUCTION'
      DataSource = BPDataModule.DSBPData
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 5
      Top = 108
      Width = 220
      Height = 21
      DataField = 'UNTPRODUCTION'
      DataSource = BPDataModule.DSBPData
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 5
      Top = 150
      Width = 139
      Height = 21
      DataField = 'PRODUCTION'
      DataSource = BPDataModule.DSBPData
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 5
      Top = 189
      Width = 139
      Height = 21
      DataField = 'PRODUCTIVITY'
      DataSource = BPDataModule.DSBPData
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 5
      Top = 228
      Width = 139
      Height = 21
      DataField = 'PRODUCTIONCOST'
      DataSource = BPDataModule.DSBPData
      TabOrder = 5
    end
    object DBEdit8: TDBEdit
      Left = 86
      Top = 260
      Width = 139
      Height = 21
      DataField = 'SUMPROFIT'
      DataSource = BPDataModule.DSBPData
      TabOrder = 6
    end
  end
  object GroupBox5: TGroupBox
    Left = 235
    Top = 132
    Width = 235
    Height = 284
    Align = alClient
    Caption = '’€ржл€р'
    TabOrder = 4
    object Label14: TLabel
      Left = 3
      Top = 12
      Width = 71
      Height = 13
      Caption = 'јлынан материал.'
    end
    object Label15: TLabel
      Left = 4
      Top = 51
      Width = 76
      Height = 13
      Caption = 'ям€лиййат х€ржи .'
    end
    object Label16: TLabel
      Left = 5
      Top = 92
      Width = 87
      Height = 13
      Caption = '¬ерэи в€ рцсумлар .'
    end
    object Label17: TLabel
      Left = 5
      Top = 134
      Width = 65
      Height = 13
      Caption = 'ƒиэ€р х€ржл€р .'
    end
    object Label20: TLabel
      Left = 24
      Top = 264
      Width = 52
      Height = 13
      Caption = '∆€ми х€рж :'
    end
    object DBEdit9: TDBEdit
      Left = 4
      Top = 28
      Width = 141
      Height = 21
      DataField = 'BOUGHTMATERIAL'
      DataSource = BPDataModule.DSBPData
      TabOrder = 0
    end
    object DBEdit10: TDBEdit
      Left = 4
      Top = 67
      Width = 141
      Height = 21
      DataField = 'OPERATIONEXPENSE'
      DataSource = BPDataModule.DSBPData
      TabOrder = 1
    end
    object DBEdit11: TDBEdit
      Left = 5
      Top = 108
      Width = 140
      Height = 21
      DataField = 'TAXEXPENSE'
      DataSource = BPDataModule.DSBPData
      TabOrder = 2
    end
    object DBEdit12: TDBEdit
      Left = 5
      Top = 150
      Width = 139
      Height = 21
      DataField = 'OTHEREXPENCE'
      DataSource = BPDataModule.DSBPData
      TabOrder = 3
    end
    object DBEdit15: TDBEdit
      Left = 86
      Top = 260
      Width = 139
      Height = 21
      DataField = 'SUMEXPENSE'
      DataSource = BPDataModule.DSBPData
      TabOrder = 4
    end
  end
  object Localizer: TNLSLocalizer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 248
    Top = 8
  end
  object ActionsList: TActionList
    Left = 211
    Top = 12
    object ActionSave: TAction
      Caption = '…аддаша йаз'
      OnExecute = ActionSaveExecute
      OnUpdate = ActionSaveUpdate
    end
    object ActionDismis: TAction
      Caption = '»мтина'
      OnExecute = ActionDismisExecute
    end
  end
end
