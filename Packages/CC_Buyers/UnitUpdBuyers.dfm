object FormUpdBuyers: TFormUpdBuyers
  Left = 407
  Top = 519
  BorderStyle = bsDialog
  Caption = 'FormUpdBuyers'
  ClientHeight = 377
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 534
    Height = 377
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
      Width = 53
      Height = 13
      Caption = #1040#1083#1099#1078#1099#1085#1099#1085' '#1072#1076#1099':'
    end
    object Label2: TLabel
      Left = 8
      Top = 67
      Width = 56
      Height = 13
      Caption = #1044#1086#1100#1091'm '#1081#1077#1088'i:'
    end
    object Label3: TLabel
      Left = 10
      Top = 101
      Width = 61
      Height = 13
      Caption = #1044#1086#1100#1091'm tarixi:'
    end
    object Label4: TLabel
      Left = 308
      Top = 152
      Width = 63
      Height = 13
      Caption = #1040#1080#1083#1103' '#1074#1103#1079#1080#1081#1081#1103#1090#1080':'
    end
    object Label5: TLabel
      Left = 12
      Top = 155
      Width = 58
      Height = 13
      Caption = 'Passport '#8470':'
    end
    object Label6: TLabel
      Left = 332
      Top = 98
      Width = 25
      Height = 13
      Caption = 'Cinsi:'
    end
    object Label7: TLabel
      Left = 16
      Top = 201
      Width = 35
      Height = 13
      Caption = #1062#1085#1074#1072#1085':'
    end
    object Label8: TLabel
      Left = 12
      Top = 238
      Width = 50
      Height = 13
      Caption = #1046#1072#1088#1080' '#1080#1096' '#1081#1077#1088#1080':'
    end
    object Label9: TLabel
      Left = 10
      Top = 278
      Width = 60
      Height = 13
      Caption = #1071#1084#1103#1082' '#1097#1072#1075#1075#1099':'
    end
    object Label11: TLabel
      Left = 24
      Top = 314
      Width = 28
      Height = 13
      Caption = 'Email:'
    end
    object Label12: TLabel
      Left = 153
      Top = 49
      Width = 25
      Height = 13
      Caption = #1070#1083#1082#1103':'
    end
    object Label13: TLabel
      Left = 415
      Top = 48
      Width = 67
      Height = 13
      Caption = #1064#1103#1097#1103#1088'/'#1056#1072#1081#1086#1085':'
    end
    object Label15: TLabel
      Left = 103
      Top = 129
      Width = 32
      Height = 13
      Caption = #1057#1077#1088#1080#1081#1072':'
    end
    object Label16: TLabel
      Left = 156
      Top = 130
      Width = 14
      Height = 13
      Caption = #8470':'
    end
    object Label17: TLabel
      Left = 290
      Top = 260
      Width = 28
      Height = 13
      Caption = #1052#1086#1073#1080#1083':'
    end
    object Label18: TLabel
      Left = 426
      Top = 259
      Width = 18
      Height = 13
      Caption = #1058#1077#1083':'
    end
    object Label14: TLabel
      Left = 185
      Top = 283
      Width = 23
      Height = 13
      Caption = '.'#1084#1072#1085
    end
    object Label10: TLabel
      Left = 130
      Top = 183
      Width = 25
      Height = 13
      Caption = #1070#1083#1082#1103':'
    end
    object Label19: TLabel
      Left = 255
      Top = 183
      Width = 67
      Height = 13
      Caption = #1064#1103#1097#1103#1088'/'#1056#1072#1081#1086#1085':'
    end
    object Label20: TLabel
      Left = 402
      Top = 182
      Width = 35
      Height = 13
      Caption = #1062#1085#1074#1072#1085':'
    end
    object EditByrName: TEdit
      Tag = 1
      Left = 96
      Top = 21
      Width = 417
      Height = 21
      TabOrder = 0
      OnKeyPress = EditByrNameKeyPress
    end
    object DTPBirthDate: TDateTimePicker
      Tag = 1
      Left = 96
      Top = 95
      Width = 169
      Height = 21
      Date = 38984.460124236100000000
      Time = 38984.460124236100000000
      TabOrder = 3
      OnKeyPress = DTPBirthDateKeyPress
    end
    object CBoxFamStatus: TComboBox
      Tag = 1
      Left = 386
      Top = 146
      Width = 129
      Height = 21
      Style = csDropDownList
      TabOrder = 7
      OnKeyPress = CBoxFamStatusKeyPress
      Items.Strings = (
        ''
        'evli'
        'subay')
    end
    object EditSerial: TEdit
      Tag = 1
      Left = 96
      Top = 149
      Width = 41
      Height = 21
      MaxLength = 3
      TabOrder = 5
      OnKeyPress = EditSerialKeyPress
    end
    object CBoxSex: TComboBox
      Tag = 1
      Left = 386
      Top = 95
      Width = 128
      Height = 21
      Style = csDropDownList
      TabOrder = 4
      OnKeyPress = CBoxSexKeyPress
      Items.Strings = (
        ''
        #1082#1080#1096#1080
        #1075#1072#1076#1099#1085)
    end
    object EditWorkPlace: TEdit
      Tag = 1
      Left = 95
      Top = 234
      Width = 423
      Height = 21
      TabOrder = 11
      OnKeyPress = EditWorkPlaceKeyPress
    end
    object EditWage: TEdit
      Tag = 1
      Left = 96
      Top = 277
      Width = 86
      Height = 21
      TabOrder = 12
      OnKeyPress = EditWageKeyPress
    end
    object EditEmail: TEdit
      Tag = 1
      Left = 95
      Top = 312
      Width = 423
      Height = 21
      TabOrder = 15
      OnKeyPress = EditEmailKeyPress
    end
    object EditPassport: TEdit
      Tag = 1
      Left = 144
      Top = 148
      Width = 121
      Height = 21
      MaxLength = 8
      TabOrder = 6
      OnKeyPress = EditPassportKeyPress
    end
    object adrs_state: TEdit
      Tag = 1
      Left = 363
      Top = 200
      Width = 156
      Height = 21
      TabOrder = 10
      OnKeyPress = adrs_stateKeyPress
    end
    object buyerid: TEdit
      Left = 216
      Top = 344
      Width = 73
      Height = 21
      TabOrder = 20
      Text = 'buyerid'
      Visible = False
    end
    object Editmobil: TMaskEdit
      Tag = 1
      Left = 254
      Top = 275
      Width = 121
      Height = 21
      EditMask = '!\(999\)000-0000;1;_'
      MaxLength = 13
      TabOrder = 13
      Text = '(   )   -    '
      OnKeyPress = EditmobilKeyPress
    end
    object EditPhone: TMaskEdit
      Tag = 1
      Left = 384
      Top = 275
      Width = 121
      Height = 21
      EditMask = '999\-99\-99;1;_'
      MaxLength = 9
      TabOrder = 14
      Text = '   -  -  '
      OnKeyPress = EditPhoneKeyPress
    end
    object Button1: TButton
      Left = 320
      Top = 341
      Width = 75
      Height = 25
      Caption = #1043#1103#1073#1091#1083
      TabOrder = 16
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 413
      Top = 340
      Width = 75
      Height = 25
      Caption = #1048#1084#1090#1080#1085#1072
      TabOrder = 17
      OnClick = Button2Click
    end
    object Editstate: TDBLookupComboBox
      Tag = 1
      Left = 368
      Top = 64
      Width = 145
      Height = 21
      KeyField = 'CITY_NAME'
      ListField = 'CITY_NAME'
      ListSource = DataMod_Buyers.ctiesdata
      TabOrder = 2
      OnClick = EditstateClick
      OnKeyPress = EditstateKeyPress
    end
    object DBEdit3: TDBEdit
      Left = 264
      Top = 64
      Width = 73
      Height = 21
      DataField = 'ID'
      DataSource = DataMod_Buyers.countrydata
      TabOrder = 21
      Visible = False
      OnChange = DBEdit3Change
    end
    object BirthPlace: TDBLookupComboBox
      Tag = 1
      Left = 96
      Top = 64
      Width = 161
      Height = 21
      KeyField = 'CNTR_NAME'
      ListField = 'CNTR_NAME'
      ListSource = DataMod_Buyers.countrydata
      TabOrder = 1
      OnKeyPress = BirthPlaceKeyPress
    end
    object birthstate: TEdit
      Tag = 1
      Left = 368
      Top = 64
      Width = 129
      Height = 21
      TabOrder = 19
      OnKeyPress = birthstateKeyPress
    end
    object EditAdress: TDBLookupComboBox
      Tag = 1
      Left = 94
      Top = 200
      Width = 121
      Height = 21
      KeyField = 'CNTR_NAME'
      ListField = 'CNTR_NAME'
      ListSource = DataMod_Buyers.ad_countrydata
      TabOrder = 8
      OnKeyPress = EditAdressKeyPress
    end
    object Editcity: TDBLookupComboBox
      Tag = 1
      Left = 221
      Top = 200
      Width = 136
      Height = 21
      KeyField = 'CITY_NAME'
      ListField = 'CITY_NAME'
      ListSource = DataMod_Buyers.ad_citites
      TabOrder = 9
      OnClick = EditcityClick
      OnKeyPress = EditcityKeyPress
    end
    object adrs_city: TEdit
      Left = 222
      Top = 200
      Width = 117
      Height = 21
      TabOrder = 18
      Text = 'adrs_city'
      OnKeyPress = adrs_cityKeyPress
    end
    object DBEdit4: TDBEdit
      Left = 200
      Top = 176
      Width = 121
      Height = 21
      DataField = 'ID'
      DataSource = DataMod_Buyers.ad_countrydata
      TabOrder = 22
      Visible = False
      OnChange = DBEdit4Change
    end
  end
end
