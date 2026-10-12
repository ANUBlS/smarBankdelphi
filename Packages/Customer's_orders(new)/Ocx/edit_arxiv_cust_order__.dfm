object edit_arxiv_cust_order: Tedit_arxiv_cust_order
  Left = 81
  Top = 148
  BorderStyle = bsDialog
  Caption = 'Arxiv serencam'
  ClientHeight = 360
  ClientWidth = 901
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox33: TGroupBox
    Left = 445
    Top = 1
    Width = 454
    Height = 59
    TabOrder = 0
    object Label29: TLabel
      Left = 35
      Top = 8
      Width = 73
      Height = 13
      Caption = '—€р€нжамын є:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label30: TLabel
      Left = 182
      Top = 8
      Width = 65
      Height = 13
      Caption = '¬алйута нювц:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label33: TLabel
      Left = 323
      Top = 8
      Width = 58
      Height = 13
      Caption = 'јчылма  тарихи'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object editnumber: TEdit
      Left = 12
      Top = 22
      Width = 121
      Height = 21
      Color = clMenu
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = editnumberKeyPress
    end
    object editdate: TDateTimePicker
      Left = 280
      Top = 22
      Width = 162
      Height = 21
      CalAlignment = dtaLeft
      Date = 38716.9766529745
      Time = 38716.9766529745
      Color = clMenu
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Kind = dtkDate
      ParseInput = False
      ParentFont = False
      TabOrder = 1
      OnKeyPress = editdateKeyPress
    end
    object Editval: TEdit
      Left = 145
      Top = 23
      Width = 118
      Height = 21
      Color = clMenu
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyPress = EditvalKeyPress
    end
  end
  object GroupBox25: TGroupBox
    Left = 686
    Top = 61
    Width = 214
    Height = 124
    Caption = 'јлан мцшт€ри'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object GroupBox26: TGroupBox
      Left = 3
      Top = 13
      Width = 198
      Height = 33
      TabOrder = 0
      object Label14: TLabel
        Left = 7
        Top = 12
        Width = 18
        Height = 13
        Caption = 'јды:'
      end
      object Editm_name: TEdit
        Left = 29
        Top = 8
        Width = 163
        Height = 21
        Color = clMenu
        TabOrder = 0
        OnKeyPress = Editm_nameKeyPress
      end
    end
    object GroupBox27: TGroupBox
      Left = 12
      Top = 46
      Width = 189
      Height = 33
      TabOrder = 1
      object Label15: TLabel
        Left = 4
        Top = 11
        Width = 37
        Height = 13
        Caption = 'ўесаб :'
      end
      object Editm_acc: TEdit
        Left = 44
        Top = 8
        Width = 138
        Height = 21
        Color = clMenu
        TabOrder = 0
        OnKeyPress = Editm_accKeyPress
      end
    end
    object GroupBox28: TGroupBox
      Left = 13
      Top = 79
      Width = 188
      Height = 33
      TabOrder = 2
      object Label16: TLabel
        Left = 3
        Top = 12
        Width = 33
        Height = 13
        Caption = '¬ё≈Ќ:'
      end
      object Editm_voin: TEdit
        Left = 53
        Top = 8
        Width = 129
        Height = 21
        Color = clMenu
        TabOrder = 0
        OnKeyPress = Editm_voinKeyPress
      end
    end
  end
  object GroupBox29: TGroupBox
    Left = 446
    Top = 188
    Width = 455
    Height = 87
    Caption = ' ючцрцл€н м€бл€ь'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label17: TLabel
      Left = 9
      Top = 17
      Width = 42
      Height = 13
      Caption = '–€г€мл€'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 168
      Top = 16
      Width = 39
      Height = 13
      Caption = '…азы ил€: '
    end
    object Label32: TLabel
      Left = 117
      Top = 40
      Width = 123
      Height = 13
      Caption = 'ёд€нишин т€йинаты в€ €сас :'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Editn_mon: TEdit
      Left = 55
      Top = 13
      Width = 108
      Height = 21
      Color = clMenu
      TabOrder = 0
      OnKeyPress = Editn_monKeyPress
    end
    object Editw_mon: TEdit
      Left = 207
      Top = 12
      Width = 243
      Height = 21
      Color = clMenu
      TabOrder = 1
      OnKeyPress = Editw_monKeyPress
    end
    object Editcon: TEdit
      Left = 8
      Top = 57
      Width = 441
      Height = 21
      Color = clMenu
      TabOrder = 2
      OnKeyPress = EditconKeyPress
    end
  end
  object GroupBox30: TGroupBox
    Left = 1
    Top = 283
    Width = 443
    Height = 76
    TabOrder = 3
    object Label19: TLabel
      Left = 9
      Top = 14
      Width = 196
      Height = 16
      Caption = '—€р€нжам вермиш верэи органынын'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label26: TLabel
      Left = 18
      Top = 34
      Width = 96
      Height = 16
      Caption = ' в€зиф€ли ш€хсл€ри:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label27: TLabel
      Left = 247
      Top = 17
      Width = 24
      Height = 13
      Caption = '–€ис:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label28: TLabel
      Left = 221
      Top = 41
      Width = 49
      Height = 13
      Caption = 'Ўюб€ р€иси:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Editchief: TEdit
      Left = 284
      Top = 16
      Width = 153
      Height = 21
      Color = clMenu
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = EditchiefKeyPress
    end
    object Edithead: TEdit
      Left = 283
      Top = 40
      Width = 153
      Height = 21
      Color = clMenu
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyPress = EditheadKeyPress
    end
  end
  object GroupBox32: TGroupBox
    Left = 2
    Top = 192
    Width = 442
    Height = 96
    Caption = 'ёд€нишл€ €лаг€дар €лав€ информасийа'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Label23: TLabel
      Left = 17
      Top = 20
      Width = 57
      Height = 13
      Caption = '“€дийй€ ады:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 17
      Top = 43
      Width = 26
      Height = 13
      Caption = 'яƒ¬:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 15
      Top = 67
      Width = 66
      Height = 13
      Caption = 'ямлак верэиси:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 123
      Top = 19
      Width = 64
      Height = 13
      Caption = 'ясас м€бл€ь:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
      Left = 259
      Top = 19
      Width = 22
      Height = 13
      Caption = '‘аиз:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 364
      Top = 18
      Width = 26
      Height = 13
      Caption = '∆€ми:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Editedv: TEdit
      Left = 100
      Top = 39
      Width = 105
      Height = 21
      Color = clMenu
      TabOrder = 0
      OnKeyPress = EditedvKeyPress
    end
    object Editedv_f: TEdit
      Left = 217
      Top = 39
      Width = 105
      Height = 21
      Color = clMenu
      TabOrder = 1
      OnKeyPress = Editedv_fKeyPress
    end
    object Editedv_t: TEdit
      Left = 327
      Top = 39
      Width = 105
      Height = 21
      Color = clMenu
      TabOrder = 2
      OnKeyPress = Editedv_tKeyPress
    end
    object Editpro_t: TEdit
      Left = 327
      Top = 63
      Width = 105
      Height = 21
      Color = clMenu
      TabOrder = 3
      OnKeyPress = Editpro_tKeyPress
    end
    object Editpro_p: TEdit
      Left = 216
      Top = 63
      Width = 105
      Height = 21
      Color = clMenu
      TabOrder = 4
      OnKeyPress = Editpro_pKeyPress
    end
    object Editpro: TEdit
      Left = 99
      Top = 63
      Width = 105
      Height = 21
      Color = clMenu
      TabOrder = 5
      OnKeyPress = EditproKeyPress
    end
  end
  object GroupBox10: TGroupBox
    Left = 239
    Top = -1
    Width = 204
    Height = 196
    Caption = 'Ѕенефисиар  (алан банк)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object GroupBox16: TGroupBox
      Left = 11
      Top = 13
      Width = 190
      Height = 33
      TabOrder = 0
      object Label6: TLabel
        Left = 10
        Top = 12
        Width = 18
        Height = 13
        Caption = 'јды:'
      end
      object editname: TEdit
        Left = 35
        Top = 8
        Width = 149
        Height = 21
        Color = clMenu
        TabOrder = 0
        OnKeyPress = editnameKeyPress
      end
    end
    object GroupBox17: TGroupBox
      Left = 9
      Top = 46
      Width = 192
      Height = 33
      TabOrder = 1
      object Label7: TLabel
        Left = 8
        Top = 11
        Width = 28
        Height = 13
        Caption = ' оду:'
      end
      object Editcode: TEdit
        Left = 43
        Top = 8
        Width = 142
        Height = 21
        Color = clMenu
        TabOrder = 0
        OnKeyPress = EditcodeKeyPress
      end
    end
    object GroupBox18: TGroupBox
      Left = 8
      Top = 78
      Width = 193
      Height = 33
      TabOrder = 2
      object Label8: TLabel
        Left = 9
        Top = 12
        Width = 33
        Height = 13
        Caption = '¬ё≈Ќ:'
      end
      object Editvoin: TEdit
        Left = 43
        Top = 8
        Width = 144
        Height = 21
        Color = clMenu
        TabOrder = 0
        OnKeyPress = EditvoinKeyPress
      end
    end
    object GroupBox19: TGroupBox
      Left = 8
      Top = 110
      Width = 193
      Height = 33
      TabOrder = 3
      object Label9: TLabel
        Left = 3
        Top = 11
        Width = 68
        Height = 13
        Caption = 'ћцхбир ўесаб:'
      end
      object Editacc: TEdit
        Left = 76
        Top = 8
        Width = 111
        Height = 21
        Color = clMenu
        TabOrder = 0
        OnKeyPress = EditaccKeyPress
      end
    end
    object GroupBox20: TGroupBox
      Left = 8
      Top = 146
      Width = 193
      Height = 33
      TabOrder = 4
      object Label10: TLabel
        Left = 3
        Top = 12
        Width = 37
        Height = 13
        Caption = 'SWIFT:'
      end
      object Editswift: TEdit
        Left = 44
        Top = 8
        Width = 147
        Height = 21
        Color = clMenu
        TabOrder = 0
        OnKeyPress = EditswiftKeyPress
      end
    end
  end
  object GroupBox9: TGroupBox
    Left = 2
    Top = -1
    Width = 238
    Height = 195
    Caption = '≈митент  (юд€й€н банк)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object GroupBox11: TGroupBox
      Left = 11
      Top = 13
      Width = 222
      Height = 33
      TabOrder = 0
      object Label2: TLabel
        Left = 10
        Top = 12
        Width = 18
        Height = 13
        Caption = 'јды:'
      end
      object DBname: TDBEdit
        Left = 34
        Top = 8
        Width = 181
        Height = 21
        Color = clMenu
        DataField = 'BANK'
        DataSource = DataModCustOrders.bank_info_
        TabOrder = 0
      end
    end
    object GroupBox12: TGroupBox
      Left = 11
      Top = 46
      Width = 224
      Height = 33
      TabOrder = 1
      object Label1: TLabel
        Left = 5
        Top = 11
        Width = 28
        Height = 13
        Caption = ' оду:'
      end
      object DBcode: TDBEdit
        Left = 44
        Top = 8
        Width = 172
        Height = 21
        Color = clMenu
        DataField = 'KOD_B'
        DataSource = DataModCustOrders.bank_info_
        TabOrder = 0
      end
    end
    object GroupBox13: TGroupBox
      Left = 10
      Top = 78
      Width = 225
      Height = 33
      TabOrder = 2
      object Label3: TLabel
        Left = 8
        Top = 12
        Width = 33
        Height = 13
        Caption = '¬ё≈Ќ:'
      end
      object DBinn: TDBEdit
        Left = 54
        Top = 8
        Width = 161
        Height = 21
        Color = clMenu
        DataField = 'inn'
        DataSource = DataModCustOrders.bank_info_
        TabOrder = 0
      end
    end
    object GroupBox14: TGroupBox
      Left = 10
      Top = 110
      Width = 225
      Height = 33
      TabOrder = 3
      object Label4: TLabel
        Left = 5
        Top = 11
        Width = 68
        Height = 13
        Caption = 'ћцхбир ўесаб:'
      end
      object DBCorAcc: TDBEdit
        Left = 80
        Top = 8
        Width = 138
        Height = 21
        Color = clMenu
        DataField = 'KRNO'
        DataSource = DataModCustOrders.bank_info_
        TabOrder = 0
      end
    end
    object GroupBox15: TGroupBox
      Left = 10
      Top = 146
      Width = 225
      Height = 33
      TabOrder = 4
      object Label5: TLabel
        Left = 27
        Top = 12
        Width = 37
        Height = 13
        Caption = 'SWIFT:'
      end
      object DBswift: TDBEdit
        Left = 88
        Top = 8
        Width = 130
        Height = 21
        Color = clMenu
        DataField = 'Swift'
        DataSource = DataModCustOrders.bank_info_
        TabOrder = 0
      end
    end
  end
  object GroupBox37: TGroupBox
    Left = 444
    Top = 273
    Width = 456
    Height = 85
    TabOrder = 7
    object GroupBox6: TGroupBox
      Left = 10
      Top = 23
      Width = 231
      Height = 39
      Caption = '¬ё≈Ќ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Edit1: TEdit
        Left = 9
        Top = 13
        Width = 216
        Height = 21
        Color = clMenu
        TabOrder = 0
        OnKeyPress = Edit1KeyPress
      end
    end
    object GroupBox5: TGroupBox
      Left = 251
      Top = 22
      Width = 191
      Height = 41
      Caption = 'Ѕаьланма тарихи'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object closedate: TDateTimePicker
        Left = 62
        Top = 15
        Width = 116
        Height = 21
        CalAlignment = dtaLeft
        Date = 38716.9766529745
        Time = 38716.9766529745
        Color = clMenu
        DateFormat = dfShort
        DateMode = dmComboBox
        Enabled = False
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
    end
  end
  object GroupBox21: TGroupBox
    Left = 447
    Top = 62
    Width = 236
    Height = 124
    Caption = 'ёд€й€н мцшт€ри'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    object GroupBox22: TGroupBox
      Left = 11
      Top = 13
      Width = 222
      Height = 33
      TabOrder = 0
      object Label11: TLabel
        Left = 8
        Top = 12
        Width = 18
        Height = 13
        Caption = 'јды:'
      end
      object Editc_name: TEdit
        Left = 35
        Top = 8
        Width = 180
        Height = 21
        Color = clMenu
        TabOrder = 0
        OnKeyPress = Editc_nameKeyPress
      end
    end
    object GroupBox23: TGroupBox
      Left = 12
      Top = 46
      Width = 221
      Height = 33
      TabOrder = 1
      object Label12: TLabel
        Left = 5
        Top = 11
        Width = 37
        Height = 13
        Caption = 'ўесаб :'
      end
      object editc_acc: TEdit
        Left = 46
        Top = 8
        Width = 168
        Height = 21
        Color = clMenu
        TabOrder = 0
        OnKeyPress = editc_accKeyPress
      end
    end
    object GroupBox24: TGroupBox
      Left = 13
      Top = 79
      Width = 220
      Height = 33
      TabOrder = 2
      object Label13: TLabel
        Left = 8
        Top = 12
        Width = 33
        Height = 13
        Caption = '¬ё≈Ќ:'
      end
      object Editc_voin: TEdit
        Left = 54
        Top = 8
        Width = 157
        Height = 21
        Color = clMenu
        TabOrder = 0
        OnKeyPress = Editc_voinKeyPress
      end
    end
  end
end
