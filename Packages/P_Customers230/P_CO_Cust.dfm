object P_CO_Cust_Form: TP_CO_Cust_Form
  Left = 146
  Top = 55
  BorderStyle = bsDialog
  Caption = 'Customers informations'
  ClientHeight = 620
  ClientWidth = 1056
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 529
    Height = 617
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label24: TLabel
      Left = 11
      Top = 589
      Width = 8
      Height = 20
      Caption = '*'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label27: TLabel
      Left = 23
      Top = 590
      Width = 251
      Height = 13
      Caption = #1080#1083#1103' '#1080#1096#1072#1088#1103#1083#1103#1085#1084#1080#1096' '#1089#1072#1097#1103#1083#1103#1088' '#1084#1094#1090#1083#1103#1075' '#1076#1086#1083#1076#1091#1088#1091#1083#1084#1072#1083#1099#1076#1099#1088
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BtnOK: TButton
      Tag = 1
      Left = 313
      Top = 589
      Width = 75
      Height = 25
      Caption = #1043#1103#1073#1091#1083
      TabOrder = 4
      OnClick = BtnOKClick
      OnKeyPress = BtnOKKeyPress
    end
    object BtnCancel: TButton
      Left = 391
      Top = 589
      Width = 75
      Height = 25
      Caption = #1048#1084#1090#1080#1085#1072
      TabOrder = 5
      OnClick = BtnCancelClick
    end
    object GroupBox3: TGroupBox
      Left = 7
      Top = 198
      Width = 515
      Height = 131
      Caption = 'Pasport'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label9: TLabel
        Left = 65
        Top = 41
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 14
        Top = 45
        Width = 51
        Height = 13
        Caption = 'Seriya/'#8470':'
      end
      object Label29: TLabel
        Left = 14
        Top = 70
        Width = 65
        Height = 13
        Caption = 'Verildiyi tarix:'
      end
      object Label26: TLabel
        Left = 266
        Top = 73
        Width = 59
        Height = 13
        Caption = 'Verildiyi yer:'
      end
      object Label30: TLabel
        Left = 281
        Top = 97
        Width = 38
        Height = 13
        Caption = 'Pin kod:'
      end
      object TLabel
        Left = 16
        Top = 19
        Width = 3
        Height = 13
      end
      object Label32: TLabel
        Left = 16
        Top = 19
        Width = 69
        Height = 13
        Caption = 'S'#601'n'#601'din n'#246'v'#252':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label33: TLabel
        Left = 14
        Top = 97
        Width = 69
        Height = 13
        Caption = 'Etibarl'#305'q tarixi:'
      end
      object Label59: TLabel
        Left = 266
        Top = 45
        Width = 62
        Height = 13
        Caption = 'Verildiyi '#246'lk'#601':'
      end
      object Label63: TLabel
        Left = 83
        Top = 17
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label64: TLabel
        Left = 326
        Top = 43
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label70: TLabel
        Left = 319
        Top = 94
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label82: TLabel
        Left = 324
        Top = 71
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label86: TLabel
        Left = 82
        Top = 68
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SBtnCheckPasp: TSpeedButton
        Left = 241
        Top = 41
        Width = 23
        Height = 21
        OnClick = SBtnCheckPaspClick
      end
      object Label101: TLabel
        Left = 84
        Top = 95
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EditSerial: TEdit
        Tag = 1
        Left = 101
        Top = 41
        Width = 41
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 3
        TabOrder = 0
        Text = 'AZE'
        OnKeyPress = EditSerialKeyPress
      end
      object EditPassport: TEdit
        Tag = 1
        Left = 143
        Top = 41
        Width = 97
        Height = 21
        TabOrder = 1
        OnExit = EditPassportExit
        OnKeyPress = EditPassportKeyPress
      end
      object CBoxPassPlace: TComboBox
        Left = 336
        Top = 67
        Width = 163
        Height = 21
        TabOrder = 2
      end
      object EditPINCode: TEdit
        Left = 336
        Top = 93
        Width = 163
        Height = 21
        MaxLength = 7
        TabOrder = 3
      end
      object DBCBox_DocTYPE: TDBLookupComboBox
        Left = 101
        Top = 14
        Width = 398
        Height = 21
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = P_DataModule.Doc_TypesData
        TabOrder = 4
        OnCloseUp = DBCBox_DocTYPECloseUp
      end
      object issue_country: TDBLookupComboBox
        Tag = 1
        Left = 336
        Top = 41
        Width = 163
        Height = 21
        KeyField = 'ID'
        ListField = 'CNTR_NAME'
        ListFieldIndex = 1
        ListSource = P_DataModule.DSR_issue_country
        TabOrder = 5
      end
      object DTPickPassp: TDBDateTimeEditEh
        Left = 101
        Top = 66
        Width = 163
        Height = 21
        EditButtons = <>
        TabOrder = 6
        Visible = True
        EditFormat = 'DD/MM/YYYY'
      end
      object DTPickDocEnd: TDBDateTimeEditEh
        Left = 101
        Top = 93
        Width = 163
        Height = 21
        EditButtons = <>
        TabOrder = 7
        Visible = True
        EditFormat = 'DD/MM/YYYY'
      end
    end
    object GroupBox4: TGroupBox
      Left = 7
      Top = 397
      Width = 515
      Height = 44
      Caption = #1058#1077#1083#1077#1092#1086#1085#1083#1072#1088
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label10: TLabel
        Left = 36
        Top = 17
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 9
        Top = 21
        Width = 28
        Height = 13
        Caption = 'Mobil:'
      end
      object Label28: TLabel
        Left = 229
        Top = 17
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 198
        Top = 21
        Width = 32
        Height = 13
        Caption = #350#601'h'#601'r:'
      end
      object EditMobil: TMaskEdit
        Tag = 1
        Left = 48
        Top = 16
        Width = 144
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = EditMobilKeyPress
      end
      object EditPhone: TMaskEdit
        Tag = 1
        Left = 240
        Top = 16
        Width = 174
        Height = 21
        TabOrder = 1
        OnKeyPress = BtnOKKeyPress
      end
      object sendSMS: TXFCheckBox
        Left = 425
        Top = 19
        Width = 77
        Height = 17
        Alignment = taLeftJustify
        Caption = 'SMS g'#246'nd'#601'r'
        TabOrder = 2
        OnClick = sendSMSClick
      end
    end
    object GroupBox5: TGroupBox
      Left = 7
      Top = 2
      Width = 515
      Height = 198
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 14
        Top = 83
        Width = 42
        Height = 13
        Caption = 'Tam Ad'#305':'
      end
      object Label8: TLabel
        Left = 14
        Top = 106
        Width = 42
        Height = 13
        Caption = 'Rezident'
      end
      object Label6: TLabel
        Left = 14
        Top = 127
        Width = 26
        Height = 13
        Caption = 'Cinsi:'
      end
      object Label4: TLabel
        Left = 14
        Top = 149
        Width = 67
        Height = 13
        Caption = 'Ail'#601' v'#601'ziyy'#601'ti:'
      end
      object Label16: TLabel
        Left = 43
        Top = 127
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label25: TLabel
        Left = 350
        Top = 85
        Width = 31
        Height = 13
        Caption = 'V'#214'EN:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label35: TLabel
        Left = 14
        Top = 171
        Width = 57
        Height = 13
        Caption = 'V'#601't'#601'nda'#351'l'#305#287#305
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label40: TLabel
        Left = 265
        Top = 149
        Width = 57
        Height = 13
        Caption = 'V'#601't'#601'nda'#351'l'#305#287#305
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label42: TLabel
        Left = 265
        Top = 171
        Width = 57
        Height = 13
        Caption = 'V'#601't'#601'nda'#351'l'#305#287#305
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label60: TLabel
        Left = 378
        Top = 81
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label62: TLabel
        Left = 72
        Top = 169
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label71: TLabel
        Left = 16
        Top = 17
        Width = 36
        Height = 13
        Caption = 'Soyad'#305':'
      end
      object Label72: TLabel
        Left = 16
        Top = 38
        Width = 19
        Height = 13
        Caption = 'Ad'#305':'
      end
      object Label73: TLabel
        Left = 14
        Top = 59
        Width = 38
        Height = 13
        Caption = 'Ata ad'#305':'
      end
      object Label74: TLabel
        Left = 53
        Top = 56
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label75: TLabel
        Left = 36
        Top = 33
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label76: TLabel
        Left = 52
        Top = 16
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EditByrName: TEdit
        Tag = 1
        Left = 95
        Top = 79
        Width = 247
        Height = 21
        ReadOnly = True
        TabOrder = 3
        OnKeyPress = EditByrNameKeyPress
      end
      object CBoxSex: TComboBox
        Tag = 1
        Left = 95
        Top = 121
        Width = 163
        Height = 21
        Style = csDropDownList
        TabOrder = 4
        OnKeyPress = CBoxSexKeyPress
        Items.Strings = (
          'ki'#351'i'
          'qad'#305'n')
      end
      object CBoxFamStatus: TComboBox
        Tag = 1
        Left = 95
        Top = 143
        Width = 163
        Height = 21
        Style = csDropDownList
        TabOrder = 5
        OnKeyPress = CBoxFamStatusKeyPress
        Items.Strings = (
          'evli'
          'subay')
      end
      object CheckBox_Phys: TCheckBox
        Left = 263
        Top = 14
        Width = 97
        Height = 17
        Caption = '  Fiziki '#351#601'xs'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object CheckBox_FS: TCheckBox
        Left = 263
        Top = 37
        Width = 97
        Height = 17
        Caption = '  Fiziki sahibkar'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = CheckBox_FSClick
      end
      object Edit_voen: TEdit
        Left = 387
        Top = 79
        Width = 121
        Height = 21
        Color = clScrollBar
        Enabled = False
        TabOrder = 8
      end
      object RadioButton_Rez: TRadioButton
        Left = 95
        Top = 103
        Width = 69
        Height = 17
        Caption = 'Rezident'
        Checked = True
        TabOrder = 9
        TabStop = True
        OnClick = RadioButton_RezClick
      end
      object RadioButton_NeRez: TRadioButton
        Left = 162
        Top = 103
        Width = 88
        Height = 17
        Caption = 'Qeyri rezident'
        TabOrder = 10
        OnClick = RadioButton_NeRezClick
      end
      object Cust_Inform: TButton
        Left = 350
        Top = 111
        Width = 160
        Height = 25
        Caption = #399'lav'#601' informasiya'
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        OnClick = Cust_InformClick
      end
      object DBCBox_Citizenship: TDBLookupComboBox
        Left = 96
        Top = 169
        Width = 163
        Height = 21
        KeyField = 'ID'
        ListField = 'CNTR_NAME'
        ListSource = P_DataModule.CitizenshipData
        TabOrder = 12
      end
      object DBCBox_Citizenship2: TDBLookupComboBox
        Left = 349
        Top = 142
        Width = 163
        Height = 21
        KeyField = 'ID'
        ListField = 'CNTR_NAME'
        ListSource = P_DataModule.Citizenship2_dsr
        TabOrder = 13
      end
      object DBCBox_Citizenship3: TDBLookupComboBox
        Left = 345
        Top = 169
        Width = 163
        Height = 21
        KeyField = 'ID'
        ListField = 'CNTR_NAME'
        ListSource = P_DataModule.Citizenship3_dsr
        TabOrder = 14
      end
      object Edit1: TEdit
        Left = 424
        Top = 89
        Width = 25
        Height = 21
        TabOrder = 15
        Visible = False
      end
      object Edit_FirstName: TEdit
        Tag = 1
        Left = 95
        Top = 35
        Width = 163
        Height = 21
        TabOrder = 1
        OnChange = Edit_LastNameChange
      end
      object Edit_LastName: TEdit
        Tag = 1
        Left = 95
        Top = 14
        Width = 163
        Height = 21
        TabOrder = 0
        OnChange = Edit_LastNameChange
      end
      object Edit_MiddleName: TEdit
        Tag = 1
        Left = 95
        Top = 56
        Width = 163
        Height = 21
        TabOrder = 2
        OnChange = Edit_LastNameChange
      end
      object XFGroupBox6: TXFGroupBox
        Left = 357
        Top = 7
        Width = 155
        Height = 66
        Caption = 'M'#252#351't'#601'rinin keyfiyy'#601't meyar'#305':'
        Color = clBtnFace
        Ctl3D = True
        ParentBackground = True
        ParentColor = False
        ParentCtl3D = False
        TabOrder = 16
        object id_quality_DBLookupComboboxEh: TDBLookupComboboxEh
          Left = 8
          Top = 16
          Width = 139
          Height = 21
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = P_DataModule.Dsrc_cust_quality
          TabOrder = 0
          Visible = True
        end
        object ButtonMeyar: TXFButton
          Left = 3
          Top = 41
          Width = 147
          Height = 22
          Caption = 'Meyar'#305'n n'#246'v'#252'nu daxil et'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 1
          Visible = False
          OnClick = ButtonMeyarClick
        end
      end
    end
    object GroupBox6: TGroupBox
      Left = 7
      Top = 442
      Width = 515
      Height = 143
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Label11: TLabel
        Left = 9
        Top = 14
        Width = 28
        Height = 13
        Caption = 'Email:'
      end
      object Label14: TLabel
        Left = 9
        Top = 41
        Width = 28
        Height = 13
        Caption = 'Qrup:'
      end
      object Label2: TLabel
        Left = 8
        Top = 67
        Width = 90
        Height = 13
        Caption = #1052#1094#1083#1082#1080#1081#1081#1103#1090' '#1085#1102#1074#1094':'
      end
      object Label5: TLabel
        Left = 84
        Top = 67
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label22: TLabel
        Left = 9
        Top = 95
        Width = 77
        Height = 13
        Caption = #1052#1103#1085#1089#1091#1073#1080#1081#1081#1103#1090#1080':'
      end
      object Label31: TLabel
        Left = 9
        Top = 117
        Width = 63
        Height = 13
        Caption = 'Kateqoriyas'#305':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label34: TLabel
        Left = 280
        Top = 40
        Width = 42
        Height = 13
        Caption = 'Qeydl'#601'r:'
      end
      object Label98: TLabel
        Left = 271
        Top = 14
        Width = 62
        Height = 13
        Caption = 'WEB Adress:'
      end
      object DBLCBoxVidSob: TDBLookupComboBox
        Left = 94
        Top = 65
        Width = 170
        Height = 21
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = P_DataModule.DS_VidSob
        TabOrder = 2
      end
      object dblGroup: TDBLookupComboBox
        Left = 94
        Top = 37
        Width = 170
        Height = 21
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = P_DataModule.custGroup
        TabOrder = 1
      end
      object EditEmail: TEdit
        Tag = 1
        Left = 94
        Top = 10
        Width = 170
        Height = 21
        TabOrder = 0
        OnKeyPress = EditEmailKeyPress
      end
      object DBLCBoxPrinad: TDBLookupComboBox
        Left = 94
        Top = 88
        Width = 170
        Height = 21
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = P_DataModule.DS_Prinad
        TabOrder = 3
      end
      object DB_CATEGORY: TDBLookupComboBox
        Left = 94
        Top = 112
        Width = 170
        Height = 21
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = P_DataModule.Categ_Data
        TabOrder = 4
      end
      object Note_Memo: TMemo
        Left = 325
        Top = 37
        Width = 185
        Height = 96
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object EditWebAdrs: TEdit
        Left = 338
        Top = 10
        Width = 172
        Height = 21
        TabOrder = 6
      end
    end
    object BitBtn1: TBitBtn
      Left = 472
      Top = 589
      Width = 47
      Height = 25
      Caption = '>>>'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 6
      OnClick = BitBtn1Click
    end
    object GroupBox2: TGroupBox
      Left = 7
      Top = 329
      Width = 515
      Height = 69
      Caption = 'Qeydiyyat '#252'nvan'#305
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      object Label7: TLabel
        Left = 8
        Top = 21
        Width = 25
        Height = 13
        Caption = #214'lk'#601':'
      end
      object Label19: TLabel
        Left = 191
        Top = 20
        Width = 67
        Height = 13
        Caption = #350#601'h'#601'r/Rayon:'
      end
      object Label20: TLabel
        Left = 8
        Top = 44
        Width = 89
        Height = 13
        Caption = 'Qeydiyyat '#252'nvan'#305':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label23: TLabel
        Left = 98
        Top = 44
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label38: TLabel
        Left = 419
        Top = 20
        Width = 18
        Height = 13
        Caption = 'Zip:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 30
        Top = 18
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label77: TLabel
        Left = 256
        Top = 18
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Adrs_City: TDBLookupComboBox
        Tag = 1
        Left = 265
        Top = 16
        Width = 150
        Height = 21
        KeyField = 'CITY_NAME'
        ListField = 'CITY_NAME'
        ListFieldIndex = 1
        ListSource = P_DataModule.Ad_Citites
        TabOrder = 1
      end
      object Adrs_State: TDBLookupComboBox
        Tag = 1
        Left = 39
        Top = 15
        Width = 150
        Height = 21
        KeyField = 'CNTR_NAME'
        ListField = 'CNTR_NAME'
        ListFieldIndex = 1
        ListSource = P_DataModule.Ad_CountryData
        TabOrder = 0
      end
      object EditAdress: TEdit
        Tag = 1
        Left = 112
        Top = 41
        Width = 394
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 100
        ParentFont = False
        TabOrder = 2
        OnKeyPress = EditAdressKeyPress
      end
      object ZipQ: TEdit
        Tag = 1
        Left = 442
        Top = 16
        Width = 60
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 100
        ParentFont = False
        TabOrder = 3
        OnKeyPress = EditAdressKeyPress
      end
    end
  end
  object PanelAdditional: TPanel
    Left = 528
    Top = -5
    Width = 527
    Height = 617
    BevelInner = bvLowered
    TabOrder = 1
    object LabelSamelyDate: TLabel
      Left = 16
      Top = 561
      Width = 51
      Height = 16
      Caption = 'Diqq'#601't: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object GroupBox7: TGroupBox
      Left = 2
      Top = 71
      Width = 523
      Height = 71
      Align = alTop
      Caption = 'Faktiki '#252'nvan'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label36: TLabel
        Left = 9
        Top = 21
        Width = 25
        Height = 13
        Caption = #214'lk'#601':'
      end
      object Label37: TLabel
        Left = 193
        Top = 21
        Width = 67
        Height = 13
        Caption = #350#601'h'#601'r/Rayon:'
      end
      object Label39: TLabel
        Left = 419
        Top = 21
        Width = 18
        Height = 13
        Caption = 'Zip:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label41: TLabel
        Left = 8
        Top = 47
        Width = 67
        Height = 13
        Caption = 'Faktiki '#252'nvan:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label78: TLabel
        Left = 31
        Top = 18
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label79: TLabel
        Left = 259
        Top = 19
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label83: TLabel
        Left = 76
        Top = 44
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Fakt_Adrs_City: TDBLookupComboBox
        Tag = 1
        Left = 269
        Top = 17
        Width = 150
        Height = 21
        KeyField = 'ID'
        ListField = 'CITY_NAME'
        ListFieldIndex = 1
        ListSource = P_DataModule.DSrFakt_Adrs_City
        TabOrder = 0
      end
      object ZipFakt: TEdit
        Tag = 1
        Left = 442
        Top = 17
        Width = 68
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 100
        ParentFont = False
        TabOrder = 1
        OnKeyPress = EditAdressKeyPress
      end
      object FaktAdress: TEdit
        Tag = 1
        Left = 110
        Top = 44
        Width = 402
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 400
        ParentFont = False
        TabOrder = 2
        OnKeyPress = EditAdressKeyPress
      end
      object Fakt_Adrs_State: TDBLookupComboBox
        Tag = 1
        Left = 41
        Top = 17
        Width = 150
        Height = 21
        KeyField = 'ID'
        ListField = 'CNTR_NAME'
        ListFieldIndex = 1
        ListSource = P_DataModule.DsrFakt_Adrs_Country
        TabOrder = 3
      end
    end
    object GroupBox8: TGroupBox
      Left = 2
      Top = 142
      Width = 523
      Height = 189
      Align = alTop
      Caption = #304#351' yeri haqq'#305'nda m'#601'lumat:'
      TabOrder = 1
      object c: TLabel
        Left = 6
        Top = 19
        Width = 65
        Height = 13
        Caption = #304#351' yerinin ad'#305':'
      end
      object Label44: TLabel
        Left = 6
        Top = 42
        Width = 40
        Height = 13
        Caption = 'V'#601'zif'#601'si:'
      end
      object Label45: TLabel
        Left = 6
        Top = 115
        Width = 35
        Height = 13
        Caption = #220'nvan:'
      end
      object Label46: TLabel
        Left = 168
        Top = 163
        Width = 80
        Height = 13
        Caption = 'Telefon n'#246'mr'#601'si:'
      end
      object Label43: TLabel
        Left = 6
        Top = 66
        Width = 82
        Height = 13
        Caption = #220'nvan'#305'n t'#601'yinat'#305':'
      end
      object Label90: TLabel
        Left = 247
        Top = 66
        Width = 27
        Height = 13
        Caption = #214'lk'#601#305':'
      end
      object Label91: TLabel
        Left = 6
        Top = 90
        Width = 32
        Height = 13
        Caption = #350#601'h'#601'r:'
      end
      object Label92: TLabel
        Left = 247
        Top = 90
        Width = 35
        Height = 13
        Caption = 'Rayon:'
      end
      object Label93: TLabel
        Left = 360
        Top = 90
        Width = 18
        Height = 13
        Caption = 'Zip:'
      end
      object Label94: TLabel
        Left = 6
        Top = 137
        Width = 133
        Height = 13
        Caption = 'Telefon n'#246'mr'#601'sinin t'#601'yinat'#305':'
      end
      object Label95: TLabel
        Left = 278
        Top = 137
        Width = 71
        Height = 13
        Caption = #399'laq'#601' vasit'#601'si:'
      end
      object Label96: TLabel
        Left = 6
        Top = 163
        Width = 86
        Height = 13
        Caption = 'Operatorun kodu:'
      end
      object Label97: TLabel
        Left = 361
        Top = 164
        Width = 62
        Height = 13
        Caption = 'Daxili n'#246'mr'#601':'
      end
      object Work_Place: TEdit
        Left = 96
        Top = 16
        Width = 336
        Height = 21
        TabOrder = 0
      end
      object Work_Post: TEdit
        Left = 96
        Top = 39
        Width = 336
        Height = 21
        TabOrder = 1
      end
      object Work_Address: TEdit
        Left = 96
        Top = 112
        Width = 336
        Height = 21
        TabOrder = 2
      end
      object Work_Phone: TEdit
        Left = 278
        Top = 160
        Width = 80
        Height = 21
        TabOrder = 3
      end
      object DBLC_WorkContactType: TDBLookupComboBox
        Left = 96
        Top = 61
        Width = 145
        Height = 21
        Enabled = False
        KeyField = 'SYMBOL'
        ListField = 'DESCRIPTION'
        ListSource = P_DataModule.ds_work_contact_type
        TabOrder = 4
      end
      object DBLC_workCountry: TDBLookupComboBox
        Left = 287
        Top = 61
        Width = 145
        Height = 21
        KeyField = 'ID'
        ListField = 'CNTR_NAME'
        ListSource = P_DataModule.DS_WorkCountry
        TabOrder = 5
      end
      object DBLC_WorkCity: TDBLookupComboBox
        Left = 96
        Top = 88
        Width = 145
        Height = 21
        KeyField = 'ID'
        ListField = 'CITY_NAME'
        ListSource = P_DataModule.DS_WorkCity
        TabOrder = 6
      end
      object EditWorkState: TEdit
        Left = 287
        Top = 87
        Width = 70
        Height = 21
        TabOrder = 7
      end
      object EditWorkZip: TEdit
        Left = 386
        Top = 87
        Width = 46
        Height = 21
        TabOrder = 8
      end
      object DBLC_WorkPhContType: TDBLookupComboBox
        Left = 146
        Top = 134
        Width = 128
        Height = 21
        Enabled = False
        KeyField = 'SYMBOL'
        ListField = 'DESCRIPTION'
        ListSource = P_DataModule.DS_WorkPhContactType
        TabOrder = 9
      end
      object DBLC_WorkComnType: TDBLookupComboBox
        Left = 357
        Top = 135
        Width = 135
        Height = 21
        KeyField = 'SYMBOL'
        ListField = 'DESCRIPTION'
        ListSource = P_DataModule.DS_WorkPhComnType
        TabOrder = 10
      end
      object EditWorkExt: TEdit
        Left = 431
        Top = 160
        Width = 61
        Height = 21
        TabOrder = 11
      end
      object DBLC_WorkPhoneCode: TDBLookupComboBox
        Left = 96
        Top = 160
        Width = 66
        Height = 21
        KeyField = 'PHONE_CODE'
        ListField = 'PHONE_CODE'
        ListSource = P_DataModule.ds_WorkCntrPrefix
        TabOrder = 12
      end
      object EditWorkPhOpCode: TEdit
        Left = 252
        Top = 160
        Width = 24
        Height = 21
        TabOrder = 13
      end
    end
    object GroupBox9: TGroupBox
      Left = 2
      Top = 331
      Width = 523
      Height = 186
      Align = alTop
      Caption = #399'laq'#601' n'#246'v'#252'n'#601' g'#246'r'#601' m'#601'lumat'
      TabOrder = 2
      object Label47: TLabel
        Left = 16
        Top = 20
        Width = 59
        Height = 13
        Caption = #399'laq'#601' n'#246'v'#252':'
      end
      object Label48: TLabel
        Left = 234
        Top = 21
        Width = 25
        Height = 13
        Caption = #214'lk'#601':'
      end
      object Label49: TLabel
        Left = 16
        Top = 48
        Width = 32
        Height = 13
        Caption = #350#601'h'#601'r:'
      end
      object Label50: TLabel
        Left = 234
        Top = 48
        Width = 35
        Height = 13
        Caption = 'Rayon:'
      end
      object Label52: TLabel
        Left = 16
        Top = 73
        Width = 35
        Height = 13
        Caption = #220'nvan:'
      end
      object Label53: TLabel
        Left = 428
        Top = 22
        Width = 51
        Height = 13
        Caption = #214'lk'#601' kodu:'
      end
      object Label54: TLabel
        Left = 427
        Top = 48
        Width = 18
        Height = 13
        Caption = 'Zip:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label51: TLabel
        Left = 16
        Top = 100
        Width = 204
        Height = 13
        Caption = #399'laq'#601' n'#246'v'#252'n'#601' g'#246'r'#601' telefon n'#246'mr'#601'sinin tipi:'
      end
      object Label55: TLabel
        Left = 16
        Top = 123
        Width = 207
        Height = 13
        Caption = 'Rabit'#601' n'#246'v'#252'n'#601' g'#246'r'#601' telefon n'#246'mr'#601'sinin tipi:'
        WordWrap = True
      end
      object Label56: TLabel
        Left = 16
        Top = 151
        Width = 51
        Height = 13
        Caption = #214'lk'#601' kodu:'
      end
      object Label57: TLabel
        Left = 152
        Top = 151
        Width = 35
        Height = 13
        Caption = 'N'#246'mr'#601':'
      end
      object Label58: TLabel
        Left = 326
        Top = 151
        Width = 62
        Height = 13
        Caption = 'Daxili n'#246'mr'#601':'
      end
      object Label61: TLabel
        Left = 73
        Top = 18
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label65: TLabel
        Left = 259
        Top = 19
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label66: TLabel
        Left = 47
        Top = 46
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label67: TLabel
        Left = 220
        Top = 98
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label68: TLabel
        Left = 223
        Top = 121
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label69: TLabel
        Left = 189
        Top = 149
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label84: TLabel
        Left = 52
        Top = 70
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Address_type: TDBLookupComboBox
        Left = 81
        Top = 18
        Width = 145
        Height = 21
        KeyField = 'SYMBOL'
        ListField = 'DESCRIPTION'
        ListSource = P_DataModule.dsr_mmx_contact_type
        TabOrder = 0
      end
      object CountryByConctType: TDBLookupComboBox
        Tag = 1
        Left = 272
        Top = 18
        Width = 150
        Height = 21
        KeyField = 'ID'
        ListField = 'CNTR_NAME'
        ListFieldIndex = 1
        ListSource = P_DataModule.DSrCountryByConctType
        TabOrder = 1
      end
      object CityByConctType: TDBLookupComboBox
        Tag = 1
        Left = 81
        Top = 45
        Width = 144
        Height = 21
        KeyField = 'ID'
        ListField = 'CITY_NAME'
        ListFieldIndex = 1
        ListSource = P_DataModule.DSrCityByConctType
        TabOrder = 2
      end
      object tph_zip: TEdit
        Tag = 1
        Left = 450
        Top = 45
        Width = 68
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 100
        ParentFont = False
        TabOrder = 3
        OnKeyPress = EditAdressKeyPress
      end
      object tph_state: TEdit
        Left = 272
        Top = 45
        Width = 150
        Height = 21
        TabOrder = 4
      end
      object tph_adress: TEdit
        Left = 81
        Top = 71
        Width = 437
        Height = 21
        TabOrder = 5
      end
      object tph_contact_type: TDBLookupComboBox
        Tag = 1
        Left = 240
        Top = 94
        Width = 150
        Height = 21
        KeyField = 'SYMBOL'
        ListField = 'DESCRIPTION'
        ListFieldIndex = 1
        ListSource = P_DataModule.dsr_tph_contact_type
        TabOrder = 6
      end
      object tph_communication_type: TDBLookupComboBox
        Tag = 1
        Left = 240
        Top = 117
        Width = 150
        Height = 21
        KeyField = 'SYMBOL'
        ListField = 'DESCRIPTION'
        ListFieldIndex = 1
        ListSource = P_DataModule.dsr_mmx_communication_type
        TabOrder = 7
      end
      object tph_country_prefix: TDBLookupComboBox
        Tag = 1
        Left = 71
        Top = 149
        Width = 76
        Height = 21
        KeyField = 'PHONE_CODE'
        ListField = 'PHONE_CODE'
        ListFieldIndex = 1
        ListSource = P_DataModule.dsr_tph_country_prefix
        TabOrder = 8
      end
      object tph_number: TEdit
        Left = 200
        Top = 149
        Width = 121
        Height = 21
        TabOrder = 9
      end
      object tph_extension: TEdit
        Left = 396
        Top = 149
        Width = 85
        Height = 21
        MaxLength = 5
        TabOrder = 10
      end
      object DBEdit_CountryCode: TDBEdit
        Left = 484
        Top = 18
        Width = 32
        Height = 21
        DataField = 'CNTR_CODE'
        DataSource = P_DataModule.DSrCountryByConctType
        ReadOnly = True
        TabOrder = 11
      end
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 523
      Height = 69
      Align = alTop
      Caption = 'Do'#287'um haqq'#305'nda m'#601'lumatlar'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object Label12: TLabel
        Left = 9
        Top = 21
        Width = 25
        Height = 13
        Caption = #214'lk'#601':'
      end
      object Label13: TLabel
        Left = 265
        Top = 21
        Width = 67
        Height = 13
        Caption = #350#601'h'#601'r/Rayon:'
      end
      object Label3: TLabel
        Left = 9
        Top = 44
        Width = 64
        Height = 13
        Caption = 'Do'#287'um tarixi:'
      end
      object Label80: TLabel
        Left = 31
        Top = 18
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label81: TLabel
        Left = 334
        Top = 21
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label88: TLabel
        Left = 75
        Top = 42
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EditBirthCity: TDBLookupComboBox
        Tag = 1
        Left = 350
        Top = 17
        Width = 160
        Height = 21
        KeyField = 'CITY_NAME'
        ListField = 'CITY_NAME'
        ListSource = P_DataModule.CtiesData
        TabOrder = 0
        OnKeyPress = EditBirthCityKeyPress
      end
      object DTPBirthDate: TDBDateTimeEditEh
        Left = 89
        Top = 42
        Width = 161
        Height = 21
        EditButtons = <>
        TabOrder = 1
        Visible = True
        EditFormat = 'DD/MM/YYYY'
      end
      object BirthPlace: TDBLookupComboBox
        Tag = 1
        Left = 88
        Top = 14
        Width = 161
        Height = 21
        KeyField = 'CNTR_NAME'
        ListField = 'CNTR_NAME'
        ListSource = P_DataModule.CountryData
        TabOrder = 2
        OnKeyPress = BirthPlaceKeyPress
      end
    end
    object GroupBox10: TGroupBox
      Left = 2
      Top = 517
      Width = 523
      Height = 38
      Align = alTop
      TabOrder = 4
      object Label85: TLabel
        Left = 4
        Top = 14
        Width = 84
        Height = 13
        Caption = 'Risk kateqoriyas'#305':'
      end
      object Label89: TLabel
        Left = 88
        Top = 12
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label99: TLabel
        Left = 315
        Top = 14
        Width = 90
        Height = 13
        Caption = 'Eynil'#601#351'dirm'#601' tarixi:'
      end
      object Label1000: TLabel
        Left = 406
        Top = 11
        Width = 8
        Height = 16
        Caption = '*'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBLC_RiskCateg: TDBLookupComboBox
        Left = 96
        Top = 11
        Width = 85
        Height = 21
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = P_DataModule.RISK_CATEG
        TabOrder = 0
      end
      object DBLC_CustRiskDesc: TDBLookupComboBox
        Left = 181
        Top = 11
        Width = 130
        Height = 21
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = P_DataModule.DS_cust_risk_desc
        TabOrder = 1
      end
      object DBDateTimeSamelyDate: TDBDateTimeEditEh
        Left = 416
        Top = 10
        Width = 104
        Height = 21
        EditButtons = <>
        TabOrder = 2
        Visible = True
        EditFormat = 'DD/MM/YYYY'
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 700
    OnTimer = Timer1Timer
    Left = 544
    Top = 576
  end
end
