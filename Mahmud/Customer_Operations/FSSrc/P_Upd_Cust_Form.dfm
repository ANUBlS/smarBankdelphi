object P_Upd_Cust: TP_Upd_Cust
  Left = 283
  Top = 296
  BorderStyle = bsDialog
  Caption = 'P_Upd_Cust'
  ClientHeight = 339
  ClientWidth = 538
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 538
    Height = 339
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 26
      Width = 68
      Height = 13
      Caption = 'Мцштяринин ады:'
    end
    object Label2: TLabel
      Left = 8
      Top = 67
      Width = 56
      Height = 13
      Caption = 'Доьуm йерi:'
    end
    object Label3: TLabel
      Left = 10
      Top = 133
      Width = 61
      Height = 13
      Caption = 'Доьуm tarixi:'
    end
    object Label4: TLabel
      Left = 12
      Top = 168
      Width = 63
      Height = 13
      Caption = 'Аиля вязиййяти:'
    end
    object Label5: TLabel
      Left = 15
      Top = 211
      Width = 58
      Height = 13
      Caption = 'Passport №:'
    end
    object Label6: TLabel
      Left = 301
      Top = 162
      Width = 25
      Height = 13
      Caption = 'Cinsi:'
    end
    object Label7: TLabel
      Left = 293
      Top = 66
      Width = 62
      Height = 13
      Caption = 'Цнван/Юлкя:'
    end
    object Label11: TLabel
      Left = 46
      Top = 246
      Width = 28
      Height = 13
      Caption = 'Email:'
    end
    object Label12: TLabel
      Left = 153
      Top = 49
      Width = 25
      Height = 13
      Caption = 'Юлкя:'
    end
    object Label13: TLabel
      Left = 7
      Top = 104
      Width = 67
      Height = 13
      Caption = 'Шящяр/Район:'
    end
    object Label15: TLabel
      Left = 90
      Top = 193
      Width = 32
      Height = 13
      Caption = 'Серийа:'
    end
    object Label16: TLabel
      Left = 143
      Top = 194
      Width = 14
      Height = 13
      Caption = '№:'
    end
    object Label17: TLabel
      Left = 362
      Top = 187
      Width = 28
      Height = 13
      Caption = 'Мобил:'
    end
    object Label18: TLabel
      Left = 459
      Top = 188
      Width = 18
      Height = 13
      Caption = 'Тел:'
    end
    object Label19: TLabel
      Left = 287
      Top = 99
      Width = 67
      Height = 13
      Caption = 'Шящяр/Район:'
    end
    object Label20: TLabel
      Left = 297
      Top = 130
      Width = 35
      Height = 13
      Caption = 'Цнван:'
    end
    object Label21: TLabel
      Left = 83
      Top = 27
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
    object Label22: TLabel
      Left = 13
      Top = 386
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
    object Label24: TLabel
      Left = 251
      Top = 283
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
    object Label25: TLabel
      Left = 20
      Top = 281
      Width = 34
      Height = 13
      Caption = 'Гейд:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 62
      Top = 281
      Width = 190
      Height = 13
      Caption = 'Мцтляг долдурулмасы олан сащяляр '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -8
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label27: TLabel
      Left = 262
      Top = 283
      Width = 81
      Height = 13
      Caption = 'ишарялянмишдир.'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 422
      Top = 27
      Width = 42
      Height = 13
      Caption = 'Резидент'
      Visible = False
    end
    object Label9: TLabel
      Left = 79
      Top = 213
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
    object Label10: TLabel
      Left = 294
      Top = 246
      Width = 33
      Height = 13
      Caption = 'ВЮЕН:'
    end
    object SpeedButton1: TSpeedButton
      Left = 8
      Top = 312
      Width = 103
      Height = 22
      Caption = 'Ялавя Информасийа'
      OnClick = SpeedButton1Click
    end
    object EditByrName: TEdit
      Tag = 1
      Left = 96
      Top = 21
      Width = 297
      Height = 21
      Color = clSilver
      TabOrder = 0
      OnKeyPress = EditByrNameKeyPress
    end
    object DTPBirthDate: TDateTimePicker
      Tag = 1
      Left = 96
      Top = 127
      Width = 161
      Height = 21
      CalAlignment = dtaLeft
      Date = 38984.4601242361
      Time = 38984.4601242361
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 5
      OnKeyPress = DTPBirthDateKeyPress
    end
    object CBoxFamStatus: TComboBox
      Tag = 1
      Left = 96
      Top = 159
      Width = 162
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      OnKeyPress = CBoxFamStatusKeyPress
      Items.Strings = (
        ''
        'evli'
        'subay')
    end
    object EditSerial: TEdit
      Tag = 1
      Left = 91
      Top = 210
      Width = 41
      Height = 21
      Color = clSilver
      Enabled = False
      MaxLength = 3
      TabOrder = 9
      OnKeyPress = EditSerialKeyPress
    end
    object CBoxSex: TComboBox
      Tag = 1
      Left = 360
      Top = 158
      Width = 164
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 8
      OnKeyPress = CBoxSexKeyPress
      Items.Strings = (
        ''
        'киши'
        'гадын')
    end
    object EditEmail: TEdit
      Tag = 1
      Left = 80
      Top = 243
      Width = 177
      Height = 21
      TabOrder = 13
      OnKeyPress = EditEmailKeyPress
    end
    object EditPassport: TEdit
      Tag = 1
      Left = 139
      Top = 211
      Width = 121
      Height = 21
      Color = clSilver
      Enabled = False
      MaxLength = 8
      TabOrder = 10
      OnChange = EditPassportChange
      OnKeyPress = EditPassportKeyPress
    end
    object adrs_city: TEdit
      Tag = 1
      Left = 360
      Top = 124
      Width = 160
      Height = 21
      TabOrder = 6
      OnKeyPress = adrs_cityKeyPress
    end
    object EditPhone: TMaskEdit
      Tag = 1
      Left = 440
      Top = 207
      Width = 81
      Height = 21
      EditMask = '999\-99\-99;1;_'
      MaxLength = 9
      TabOrder = 12
      Text = '   -  -  '
      OnKeyPress = EditPhoneKeyPress
    end
    object Editmobil: TMaskEdit
      Tag = 1
      Left = 339
      Top = 208
      Width = 91
      Height = 21
      EditMask = '!\(999\)000-0000;1;_'
      MaxLength = 13
      TabOrder = 11
      Text = '(   )   -    '
      OnKeyPress = EditmobilKeyPress
    end
    object Button1: TButton
      Tag = 1
      Left = 342
      Top = 309
      Width = 75
      Height = 25
      Caption = 'Гябул'
      TabOrder = 14
      OnClick = Button1Click
      OnKeyPress = Button1KeyPress
    end
    object Button2: TButton
      Left = 432
      Top = 308
      Width = 75
      Height = 25
      Caption = 'Имтина'
      TabOrder = 15
      OnClick = Button2Click
    end
    object DBEdit1: TDBEdit
      Left = 264
      Top = 64
      Width = 25
      Height = 21
      DataField = 'ID'
      DataSource = P_DataModuleFS.countrydata
      TabOrder = 16
      Visible = False
      OnChange = DBEdit1Change
    end
    object adrs_state: TDBLookupComboBox
      Tag = 1
      Left = 361
      Top = 92
      Width = 160
      Height = 21
      KeyField = 'CITY_NAME'
      ListField = 'CITY_NAME'
      ListFieldIndex = 1
      ListSource = P_DataModuleFS.ad_citites
      TabOrder = 4
      OnKeyPress = adrs_stateKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 271
      Top = 130
      Width = 21
      Height = 21
      DataField = 'ID'
      DataSource = P_DataModuleFS.ad_countrydata
      TabOrder = 17
      Visible = False
      OnChange = DBEdit2Change
    end
    object EditAdress: TDBLookupComboBox
      Tag = 1
      Left = 360
      Top = 62
      Width = 161
      Height = 21
      KeyField = 'CNTR_NAME'
      ListField = 'CNTR_NAME'
      ListFieldIndex = 1
      ListSource = P_DataModuleFS.ad_countrydata
      TabOrder = 3
      OnKeyPress = EditAdressKeyPress
    end
    object passp_id: TEdit
      Left = 267
      Top = 160
      Width = 25
      Height = 21
      TabOrder = 18
      Visible = False
    end
    object BirthPlace: TDBLookupComboBox
      Tag = 1
      Left = 96
      Top = 64
      Width = 161
      Height = 21
      KeyField = 'CNTR_NAME'
      ListField = 'CNTR_NAME'
      ListSource = P_DataModuleFS.countrydata
      TabOrder = 1
      OnKeyPress = BirthPlaceKeyPress
    end
    object EditBirthState: TDBLookupComboBox
      Tag = 1
      Left = 97
      Top = 93
      Width = 160
      Height = 21
      KeyField = 'CITY_NAME'
      ListField = 'CITY_NAME'
      ListSource = P_DataModuleFS.ctiesdata
      TabOrder = 2
      OnKeyPress = EditBirthStateKeyPress
    end
    object chbox: TCheckBox
      Left = 405
      Top = 24
      Width = 12
      Height = 17
      Checked = True
      State = cbChecked
      TabOrder = 19
      Visible = False
      OnClick = chboxClick
    end
    object userid: TEdit
      Left = 200
      Top = 312
      Width = 73
      Height = 21
      TabOrder = 20
      Visible = False
    end
    object Edit1: TEdit
      Left = 136
      Top = 310
      Width = 73
      Height = 21
      TabOrder = 21
      Visible = False
    end
    object EditInn: TEdit
      Tag = 1
      Left = 344
      Top = 243
      Width = 177
      Height = 21
      TabOrder = 22
      OnKeyPress = EditEmailKeyPress
    end
  end
end
