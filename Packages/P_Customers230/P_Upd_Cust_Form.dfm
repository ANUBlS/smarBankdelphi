object P_Upd_Cust: TP_Upd_Cust
  Left = 714
  Top = 60
  BorderStyle = bsDialog
  Caption = 'Customers informations editing'
  ClientHeight = 656
  ClientWidth = 558
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 558
    Height = 656
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
    object Label24: TLabel
      Left = 270
      Top = 601
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
      Left = 39
      Top = 601
      Width = 224
      Height = 13
      Caption = #1043#1077#1081#1076': '#1052#1094#1090#1083#1103#1075' '#1076#1086#1083#1076#1091#1088#1091#1083#1084#1072#1083#1099' '#1086#1083#1072#1085' '#1089#1072#1097#1103#1083#1103#1088' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label27: TLabel
      Left = 281
      Top = 601
      Width = 81
      Height = 13
      Caption = #1080#1096#1072#1088#1103#1083#1103#1085#1084#1080#1096#1076#1080#1088'.'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Tag = 1
      Left = 151
      Top = 620
      Width = 75
      Height = 25
      Caption = #1043#1103#1073#1091#1083
      TabOrder = 6
      OnClick = Button1Click
      OnKeyPress = Button1KeyPress
    end
    object Button2: TButton
      Left = 237
      Top = 620
      Width = 75
      Height = 25
      Caption = #1048#1084#1090#1080#1085#1072
      TabOrder = 7
      OnClick = Button2Click
    end
    object DBEdit1: TDBEdit
      Left = 443
      Top = 227
      Width = 25
      Height = 21
      DataField = 'ID'
      DataSource = P_DataModule.CountryData
      TabOrder = 8
      Visible = False
      OnChange = DBEdit1Change
    end
    object DBEdit2: TDBEdit
      Left = 442
      Top = 261
      Width = 21
      Height = 21
      DataField = 'ID'
      DataSource = P_DataModule.Ad_CountryData
      TabOrder = 9
      Visible = False
      OnChange = DBEdit2Change
    end
    object passp_id: TEdit
      Left = 435
      Top = 152
      Width = 25
      Height = 21
      TabOrder = 10
      Visible = False
    end
    object userid: TEdit
      Left = 424
      Top = 534
      Width = 73
      Height = 21
      TabOrder = 11
      Visible = False
    end
    object Edit1: TEdit
      Left = 440
      Top = 565
      Width = 73
      Height = 21
      TabOrder = 12
      Visible = False
    end
    object GroupBox1: TGroupBox
      Left = 42
      Top = 381
      Width = 515
      Height = 71
      Caption = #1058#1077#1083#1077#1092#1086#1085#1083#1072#1088':'
      TabOrder = 4
      object Label17: TLabel
        Left = 9
        Top = 21
        Width = 28
        Height = 13
        Caption = #1052#1086#1073#1080#1083':'
      end
      object Label23: TLabel
        Left = 41
        Top = 21
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
      object Label18: TLabel
        Left = 9
        Top = 47
        Width = 31
        Height = 13
        Caption = #1064#1103#1097#1103#1088':'
      end
      object Label28: TLabel
        Left = 43
        Top = 47
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
      object EditMobil: TMaskEdit
        Tag = 1
        Left = 94
        Top = 17
        Width = 157
        Height = 21
        TabOrder = 0
        OnKeyPress = EditMobilKeyPress
      end
      object EditPhone: TMaskEdit
        Tag = 1
        Left = 94
        Top = 43
        Width = 156
        Height = 21
        TabOrder = 1
        OnKeyPress = EditPhoneKeyPress
      end
    end
    object GroupBox2: TGroupBox
      Left = 42
      Top = 287
      Width = 515
      Height = 96
      Caption = #1062#1085#1074#1072#1085
      TabOrder = 3
      object Label7: TLabel
        Left = 9
        Top = 21
        Width = 62
        Height = 13
        Caption = #1062#1085#1074#1072#1085'/'#1070#1083#1082#1103':'
      end
      object Label19: TLabel
        Left = 9
        Top = 47
        Width = 67
        Height = 13
        Caption = #1064#1103#1097#1103#1088'/'#1056#1072#1081#1086#1085':'
      end
      object Label20: TLabel
        Left = 9
        Top = 73
        Width = 35
        Height = 13
        Caption = #1062#1085#1074#1072#1085':'
      end
      object Label10: TLabel
        Left = 45
        Top = 73
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
      object Adrs_City: TDBLookupComboBox
        Tag = 1
        Left = 94
        Top = 43
        Width = 161
        Height = 21
        KeyField = 'CITY_NAME'
        ListField = 'CITY_NAME'
        ListFieldIndex = 1
        ListSource = P_DataModule.Ad_Citites
        TabOrder = 1
        OnKeyPress = Adrs_CityKeyPress
      end
      object Adrs_State: TDBLookupComboBox
        Tag = 1
        Left = 94
        Top = 17
        Width = 160
        Height = 21
        KeyField = 'CNTR_NAME'
        ListField = 'CNTR_NAME'
        ListFieldIndex = 1
        ListSource = P_DataModule.Ad_CountryData
        TabOrder = 0
        OnKeyPress = Adrs_StateKeyPress
      end
      object EditAdress: TEdit
        Tag = 1
        Left = 94
        Top = 67
        Width = 400
        Height = 21
        MaxLength = 100
        TabOrder = 2
        OnKeyPress = EditAdressKeyPress
      end
    end
    object GroupBox3: TGroupBox
      Left = 42
      Top = 187
      Width = 515
      Height = 100
      Caption = #1044#1086#1100#1091#1084' '#1097#1072#1075#1075#1099#1085#1076#1072' '#1084#1103#1083#1091#1084#1072#1090#1083#1072#1088
      TabOrder = 2
      object Label3: TLabel
        Left = 9
        Top = 73
        Width = 61
        Height = 13
        Caption = #1044#1086#1100#1091'm tarixi:'
      end
      object Label13: TLabel
        Left = 9
        Top = 47
        Width = 67
        Height = 13
        Caption = #1064#1103#1097#1103#1088'/'#1056#1072#1081#1086#1085':'
      end
      object Label12: TLabel
        Left = 9
        Top = 21
        Width = 25
        Height = 13
        Caption = #1070#1083#1082#1103':'
      end
      object DTPBirthDate: TDateTimePicker
        Tag = 1
        Left = 94
        Top = 69
        Width = 161
        Height = 21
        Date = 38984.460124236100000000
        Time = 38984.460124236100000000
        TabOrder = 2
        OnKeyPress = DTPBirthDateKeyPress
      end
      object BirthPlace: TDBLookupComboBox
        Tag = 1
        Left = 94
        Top = 17
        Width = 161
        Height = 21
        KeyField = 'CNTR_NAME'
        ListField = 'CNTR_NAME'
        ListSource = P_DataModule.CountryData
        TabOrder = 0
        OnKeyPress = BirthPlaceKeyPress
      end
      object EditBirthState: TDBLookupComboBox
        Tag = 1
        Left = 94
        Top = 43
        Width = 160
        Height = 21
        KeyField = 'CITY_NAME'
        ListField = 'CITY_NAME'
        ListSource = P_DataModule.CtiesData
        TabOrder = 1
        OnKeyPress = EditBirthStateKeyPress
      end
    end
    object GroupBox4: TGroupBox
      Left = 42
      Top = 116
      Width = 515
      Height = 70
      Caption = #1055#1072#1089#1087#1086#1088#1090
      TabOrder = 1
      object Label5: TLabel
        Left = 14
        Top = 21
        Width = 48
        Height = 13
        Caption = #1057#1077#1088#1080#1081#1072'/'#8470':'
      end
      object Label9: TLabel
        Left = 65
        Top = 21
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
      object Label29: TLabel
        Left = 18
        Top = 47
        Width = 60
        Height = 13
        Caption = #1042#1077#1088#1080#1083#1076#1080#1081#1080' '#1090#1072#1088#1080#1093':'
      end
      object EditSerial: TEdit
        Tag = 1
        Left = 94
        Top = 17
        Width = 41
        Height = 21
        TabOrder = 0
        OnKeyPress = EditSerialKeyPress
      end
      object EditPassport: TEdit
        Tag = 1
        Left = 136
        Top = 17
        Width = 121
        Height = 21
        TabOrder = 1
        OnChange = EditPassportChange
        OnKeyPress = EditPassportKeyPress
      end
      object DTPickerPasp: TDateTimePicker
        Left = 94
        Top = 43
        Width = 161
        Height = 21
        Date = 39629.482052766200000000
        Time = 39629.482052766200000000
        TabOrder = 2
      end
    end
    object GroupBox5: TGroupBox
      Left = 42
      Top = 8
      Width = 515
      Height = 109
      TabOrder = 0
      object Label1: TLabel
        Left = 18
        Top = 15
        Width = 18
        Height = 13
        Caption = #1040#1076#1099':'
      end
      object Label21: TLabel
        Left = 40
        Top = 11
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
      object Label8: TLabel
        Left = 18
        Top = 39
        Width = 42
        Height = 13
        Caption = #1056#1077#1079#1080#1076#1077#1085#1090
      end
      object Label6: TLabel
        Left = 18
        Top = 63
        Width = 25
        Height = 13
        Caption = 'Cinsi:'
      end
      object Label4: TLabel
        Left = 18
        Top = 87
        Width = 63
        Height = 13
        Caption = #1040#1080#1083#1103' '#1074#1103#1079#1080#1081#1081#1103#1090#1080':'
      end
      object Label16: TLabel
        Left = 48
        Top = 64
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
      object EditByrName: TEdit
        Tag = 1
        Left = 94
        Top = 10
        Width = 275
        Height = 21
        TabOrder = 0
        OnKeyPress = EditByrNameKeyPress
      end
      object ChBox: TCheckBox
        Left = 94
        Top = 35
        Width = 17
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = ChBoxClick
      end
      object CBoxSex: TComboBox
        Tag = 1
        Left = 94
        Top = 59
        Width = 164
        Height = 21
        Style = csDropDownList
        TabOrder = 2
        OnKeyPress = CBoxSexKeyPress
        Items.Strings = (
          #1082#1080#1096#1080
          #1075#1072#1076#1099#1085)
      end
      object CBoxFamStatus: TComboBox
        Tag = 1
        Left = 94
        Top = 83
        Width = 162
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        OnKeyPress = CBoxFamStatusKeyPress
        Items.Strings = (
          ''
          'evli'
          'subay')
      end
    end
    object GroupBox6: TGroupBox
      Left = 42
      Top = 453
      Width = 515
      Height = 143
      TabOrder = 5
      object Label11: TLabel
        Left = 9
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Email:'
      end
      object Label14: TLabel
        Left = 9
        Top = 45
        Width = 26
        Height = 13
        Caption = 'Qrup:'
      end
      object Label2: TLabel
        Left = 9
        Top = 72
        Width = 74
        Height = 13
        Caption = #1052#1094#1083#1082#1080#1081#1081#1103#1090' '#1085#1102#1074#1094':'
      end
      object Label15: TLabel
        Left = 85
        Top = 68
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
        Left = 9
        Top = 104
        Width = 64
        Height = 13
        Caption = #1052#1103#1085#1089#1091#1073#1080#1081#1081#1103#1090#1080':'
      end
      object EditEmail: TEdit
        Tag = 1
        Left = 94
        Top = 14
        Width = 202
        Height = 21
        TabOrder = 0
        OnKeyPress = EditEmailKeyPress
      end
      object dblGroup: TDBLookupComboBox
        Left = 94
        Top = 41
        Width = 169
        Height = 21
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = P_DataModule.custGroup
        TabOrder = 1
      end
      object DBLCBoxVidSob: TDBLookupComboBox
        Left = 94
        Top = 68
        Width = 170
        Height = 21
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = P_DataModule.DS_VidSob
        TabOrder = 2
      end
      object DBLCBoxPrinad: TDBLookupComboBox
        Left = 94
        Top = 97
        Width = 170
        Height = 21
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = P_DataModule.DS_Prinad
        TabOrder = 3
      end
    end
  end
end
