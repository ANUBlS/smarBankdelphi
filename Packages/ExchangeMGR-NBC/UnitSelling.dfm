object FormSelling: TFormSelling
  Left = 387
  Top = 203
  Caption = 'Selling of the foreign currency'
  ClientHeight = 513
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxMain: TGroupBox
    Left = 0
    Top = 0
    Width = 404
    Height = 513
    Align = alClient
    Caption = #1042#1072#1083#1081#1091#1090#1072#1085#1099#1085' '#1089#1072#1090#1099#1096#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 403
    ExplicitHeight = 514
    object Panel1: TPanel
      Left = 4
      Top = 18
      Width = 396
      Height = 490
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 395
      ExplicitHeight = 491
      object Label1: TLabel
        Left = 26
        Top = 12
        Width = 26
        Height = 14
        Caption = 'Tarix:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 3
        Top = 268
        Width = 54
        Height = 13
        Caption = #1058#1103#1081#1080#1085#1072#1090#1099':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 267
        Top = 40
        Width = 116
        Height = 14
        Caption = #1042#1072#1083#1081#1091#1090#1072#1085#1099#1085' '#1057#1072#1090#1099#1096#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 215
        Top = 13
        Width = 25
        Height = 14
        Caption = 'Vaxt:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 7
        Top = 39
        Width = 74
        Height = 14
        Caption = #1042'.'#1044'.'#1052' -'#1085#1080' '#1072#1076#1099':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Bevel21: TBevel
        Left = 3
        Top = 32
        Width = 386
        Height = 28
      end
      object GroupBox1: TGroupBox
        Left = 2
        Top = 287
        Width = 389
        Height = 200
        Caption = #1052#1094#1096#1090#1103#1088#1080' '#1097#1072#1075#1075#1099#1085#1076#1072' '#1080#1085#1092#1086#1088#1084#1072#1089#1080#1081#1072
        TabOrder = 3
        object Label9: TLabel
          Left = 6
          Top = 158
          Width = 58
          Height = 13
          Caption = #1055#1072#1089#1087#1086#1088#1090' '#8470
        end
        object Label17: TLabel
          Left = 6
          Top = 113
          Width = 77
          Height = 13
          Caption = #1058#1103#1075'. '#1077#1076'. '#1086#1088#1075#1072#1085'.'
        end
        object Label18: TLabel
          Left = 6
          Top = 89
          Width = 94
          Height = 13
          Caption = #1064#1103#1093'. '#1090#1103#1089'. '#1077#1076'. '#1089#1103#1085'.'
        end
        object Label16: TLabel
          Left = 6
          Top = 64
          Width = 76
          Height = 13
          Caption = #1040#1090#1072#1089#1099#1085#1099#1085' '#1072#1076#1099
        end
        object Label8: TLabel
          Left = 6
          Top = 42
          Width = 40
          Height = 13
          Caption = #1057#1086#1081#1072#1076#1099
        end
        object Label7: TLabel
          Left = 6
          Top = 22
          Width = 88
          Height = 13
          Caption = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099
        end
        object Label19: TLabel
          Left = 6
          Top = 180
          Width = 81
          Height = 13
          Caption = #1042#1077#1088#1080#1083#1084#1103' '#1090#1072#1088#1080#1093#1080
        end
        object LabelCountry: TLabel
          Left = 6
          Top = 136
          Width = 46
          Height = 13
          Caption = #1070#1083#1082#1103#1083#1103#1088
        end
        object Bevel7: TBevel
          Left = 87
          Top = 13
          Width = 147
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel8: TBevel
          Left = 87
          Top = 34
          Width = 147
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel9: TBevel
          Left = 87
          Top = 55
          Width = 147
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel10: TBevel
          Left = 88
          Top = 81
          Width = 147
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel11: TBevel
          Left = 88
          Top = 104
          Width = 147
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel12: TBevel
          Left = 88
          Top = 127
          Width = 147
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel13: TBevel
          Left = 237
          Top = 12
          Width = 148
          Height = 68
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel14: TBevel
          Left = 238
          Top = 82
          Width = 148
          Height = 67
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel15: TBevel
          Left = 123
          Top = 150
          Width = 112
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel16: TBevel
          Left = 88
          Top = 150
          Width = 35
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel17: TBevel
          Left = 88
          Top = 173
          Width = 147
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel18: TBevel
          Left = 239
          Top = 152
          Width = 152
          Height = 45
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel19: TBevel
          Left = 242
          Top = 155
          Width = 143
          Height = 5
        end
        object Bevel20: TBevel
          Left = 242
          Top = 188
          Width = 143
          Height = 5
        end
        object Edit_First_Name: TEdit
          Left = 88
          Top = 14
          Width = 145
          Height = 21
          TabOrder = 0
        end
        object Edit_Last_Name: TEdit
          Left = 88
          Top = 35
          Width = 145
          Height = 21
          TabOrder = 1
        end
        object Edit_Pasport: TEdit
          Left = 124
          Top = 151
          Width = 110
          Height = 21
          MaxLength = 8
          TabOrder = 7
          OnKeyPress = Edit_PasportKeyPress
        end
        object Edit_AZE: TEdit
          Left = 89
          Top = 151
          Width = 33
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 6
          Text = 'AZE'
        end
        object Edit_Giving_Member: TEdit
          Left = 89
          Top = 105
          Width = 145
          Height = 21
          TabOrder = 4
        end
        object Edit_Cust_Confirm: TEdit
          Left = 89
          Top = 82
          Width = 145
          Height = 21
          TabOrder = 3
        end
        object Edit_Father: TEdit
          Left = 88
          Top = 56
          Width = 145
          Height = 21
          TabOrder = 2
        end
        object Edit_Country: TEdit
          Left = 89
          Top = 128
          Width = 145
          Height = 21
          TabOrder = 5
        end
        object DBLC_Country: TDBLookupComboBox
          Left = 240
          Top = 127
          Width = 145
          Height = 21
          Enabled = False
          KeyField = 'CUST_COUNTRY'
          ListField = 'CUST_COUNTRY'
          ListSource = DataModExch.DSCust_Country
          ReadOnly = True
          TabOrder = 13
          OnClick = DBLC_CountryClick
        end
        object DBLC_First_Name: TDBLookupComboBox
          Left = 239
          Top = 14
          Width = 145
          Height = 21
          Enabled = False
          KeyField = 'CUST_NAME'
          ListField = 'CUST_NAME'
          ListSource = DataModExch.DSCust_Name
          ReadOnly = True
          TabOrder = 8
          OnClick = DBLC_First_NameClick
        end
        object DBLC_Last_Name: TDBLookupComboBox
          Left = 239
          Top = 36
          Width = 145
          Height = 21
          Enabled = False
          KeyField = 'CUST_LNAME'
          ListField = 'CUST_LNAME'
          ListSource = DataModExch.DSCust_LName
          ReadOnly = True
          TabOrder = 9
          OnClick = DBLC_Last_NameClick
        end
        object DBLC_Father: TDBLookupComboBox
          Left = 239
          Top = 58
          Width = 145
          Height = 21
          Enabled = False
          KeyField = 'CUST_FATHER'
          ListField = 'CUST_FATHER'
          ListSource = DataModExch.DSCust_Father
          ReadOnly = True
          TabOrder = 10
          OnClick = DBLC_FatherClick
        end
        object BtnRun: TBitBtn
          Left = 243
          Top = 160
          Width = 70
          Height = 25
          Caption = #1043#1103#1073#1091#1083
          Default = True
          DoubleBuffered = True
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
          ParentDoubleBuffered = False
          TabOrder = 14
          OnClick = BtnRunClick
        end
        object BtnExit: TBitBtn
          Left = 316
          Top = 160
          Width = 67
          Height = 25
          Caption = '&Imtina'
          DoubleBuffered = True
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
            F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
            000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
            338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
            45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
            3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
            F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
            000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
            338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
            4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
            8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
            333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
            0000}
          ModalResult = 3
          NumGlyphs = 2
          ParentDoubleBuffered = False
          TabOrder = 15
        end
        object DBLC_Cust_Confirm: TDBLookupComboBox
          Left = 240
          Top = 83
          Width = 145
          Height = 21
          Enabled = False
          KeyField = 'CUST_CONFIRM'
          ListField = 'CUST_CONFIRM'
          ListSource = DataModExch.DSCust_Confirm
          ReadOnly = True
          TabOrder = 11
          OnClick = DBLC_Cust_ConfirmClick
        end
        object DBLC_Giving_Member: TDBLookupComboBox
          Left = 240
          Top = 105
          Width = 145
          Height = 21
          Enabled = False
          KeyField = 'CUST_GIVING_MEMBER'
          ListField = 'CUST_GIVING_MEMBER'
          ListSource = DataModExch.DSGiving_Member
          ReadOnly = True
          TabOrder = 12
          OnClick = DBLC_Giving_MemberClick
        end
        object Edit_Cust_Date: TDBDateTimeEditEh
          Left = 89
          Top = 176
          Width = 144
          Height = 21
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 16
          Visible = True
        end
      end
      object DTP_Date: TDateTimePicker
        Left = 60
        Top = 5
        Width = 121
        Height = 21
        Date = 39027.101860532400000000
        Time = 39027.101860532400000000
        Enabled = False
        TabOrder = 1
        TabStop = False
      end
      object GroupBox3: TGroupBox
        Left = 2
        Top = 132
        Width = 388
        Height = 67
        Caption = #1042#1072#1083#1081#1091#1090#1072' '#1074#1103' '#1097#1077#1089#1072#1073' '#1089#1077#1095#1080#1084#1083#1103#1088#1080
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label3: TLabel
          Left = 15
          Top = 21
          Width = 46
          Height = 13
          Caption = #1042#1072#1083#1081#1091#1090#1072':'
        end
        object Label4: TLabel
          Left = 287
          Top = 21
          Width = 58
          Height = 13
          Caption = #1052'.'#1041'. '#1082#1091#1088#1089#1091':'
        end
        object Label6: TLabel
          Left = 168
          Top = 21
          Width = 69
          Height = 13
          Caption = #1057#1072#1090#1099#1096' '#1082'urs'#1091':'
        end
        object Label21: TLabel
          Left = 108
          Top = 40
          Width = 24
          Height = 13
          Caption = '==>'
        end
        object Bevel1: TBevel
          Left = 286
          Top = 38
          Width = 90
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel2: TBevel
          Left = 167
          Top = 38
          Width = 90
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel3: TBevel
          Left = 12
          Top = 38
          Width = 90
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object DBLC_Currency: TDBLookupComboBox
          Left = 14
          Top = 40
          Width = 87
          Height = 21
          KeyField = 'VAL_ID'
          ListField = 'VAL_NAME'
          ListSource = DataModExch.DSExchAcc
          TabOrder = 0
          OnClick = DBLC_CurrencyClick
        end
        object Edit_selling_course: TEdit
          Left = 168
          Top = 39
          Width = 88
          Height = 21
          TabStop = False
          MaxLength = 9
          ReadOnly = True
          TabOrder = 1
          OnExit = Edit_selling_courseExit
          OnKeyPress = Edit_selling_courseKeyPress
        end
        object Edit_nb_course: TEdit
          Left = 287
          Top = 39
          Width = 87
          Height = 21
          TabStop = False
          MaxLength = 6
          ReadOnly = True
          TabOrder = 2
        end
        object Edit_Val_Changed: TEdit
          Left = 131
          Top = 42
          Width = 30
          Height = 23
          TabStop = False
          BorderStyle = bsNone
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 3
          Text = 'AZN'
        end
      end
      object Panel8: TPanel
        Left = 3
        Top = 201
        Width = 387
        Height = 59
        BevelInner = bvLowered
        BevelOuter = bvSpace
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object Label12: TLabel
          Left = 9
          Top = 13
          Width = 148
          Height = 13
          Caption = #1061#1072#1088#1080#1078#1080' '#1074#1072#1083#1081#1091#1090#1072#1085#1099#1085' '#1084#1103#1073#1083#1103#1100#1080
        end
        object Label13: TLabel
          Left = 175
          Top = 13
          Width = 71
          Height = 13
          Caption = #1052#1072#1085#1072#1090' '#1084#1103#1073#1083#1103#1100
        end
        object Label14: TLabel
          Left = 286
          Top = 13
          Width = 70
          Height = 13
          Caption = #1069#1103#1083#1080#1088' '#1084#1103#1073#1083#1103#1100
        end
        object Bevel4: TBevel
          Left = 9
          Top = 30
          Width = 128
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel5: TBevel
          Left = 150
          Top = 30
          Width = 121
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel6: TBevel
          Left = 283
          Top = 30
          Width = 96
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Edit_Selling_Amount: TEdit
          Left = 10
          Top = 31
          Width = 125
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = Edit_Selling_AmountChange
          OnExit = Edit_Selling_AmountExit
          OnKeyPress = Edit_Selling_AmountKeyPress
        end
        object Edit_Ekv_Amount: TEdit
          Left = 151
          Top = 31
          Width = 118
          Height = 21
          TabStop = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object Edit_Fee_Amount: TEdit
          Left = 284
          Top = 31
          Width = 93
          Height = 21
          TabStop = False
          ReadOnly = True
          TabOrder = 2
        end
      end
      object DTP_System_Time: TDateTimePicker
        Left = 246
        Top = 5
        Width = 103
        Height = 21
        Date = 39035.955562789300000000
        Time = 39035.955562789300000000
        Enabled = False
        Kind = dtkTime
        TabOrder = 4
        TabStop = False
      end
      object Edit_Exch: TDBEdit
        Left = 80
        Top = 39
        Width = 182
        Height = 16
        TabStop = False
        BorderStyle = bsNone
        Color = clBtnFace
        DataField = 'EX_NAME'
        DataSource = DataModExch.DSExchOffice
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object Edit_Setting: TEdit
        Left = 53
        Top = 264
        Width = 338
        Height = 21
        CharCase = ecUpperCase
        Color = clMenu
        ReadOnly = True
        TabOrder = 6
      end
      object GroupBox2: TGroupBox
        Left = 3
        Top = 59
        Width = 386
        Height = 41
        Caption = #1057#1072#1090#1099#1096' '#1082#1091#1088#1089#1091' '#1072#1088#1072#1083#1099#1075
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        object Label10: TLabel
          Left = 15
          Top = 16
          Width = 93
          Height = 14
          Caption = #1041#1072#1096#1083#1072#1085#1100#1099#1078'  '#1082#1091#1088#1089':'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 227
          Top = 17
          Width = 48
          Height = 14
          Caption = #1057#1086#1085' '#1082#1091#1088#1089':'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object EditSellingCourseBegin: TEdit
          Left = 114
          Top = 13
          Width = 95
          Height = 22
          BevelInner = bvSpace
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object EditSellingCourseEnd: TEdit
          Left = 282
          Top = 13
          Width = 95
          Height = 22
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object Panel6: TPanel
        Left = 3
        Top = 103
        Width = 389
        Height = 31
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 8
        object RadioButton1: TRadioButton
          Left = 34
          Top = 8
          Width = 113
          Height = 17
          Caption = 'Na'#287'd  kurs'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = RadioButton1Click
        end
        object RadioButton2: TRadioButton
          Left = 227
          Top = 6
          Width = 113
          Height = 17
          Caption = 'Na'#287'd  kurs'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = RadioButton1Click
        end
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 15
      Width = 400
      Height = 3
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 399
    end
    object Panel3: TPanel
      Left = 2
      Top = 18
      Width = 2
      Height = 490
      Align = alLeft
      TabOrder = 2
      ExplicitHeight = 491
    end
    object Panel4: TPanel
      Left = 2
      Top = 508
      Width = 400
      Height = 3
      Align = alBottom
      TabOrder = 3
      ExplicitTop = 509
      ExplicitWidth = 399
    end
    object Panel5: TPanel
      Left = 400
      Top = 18
      Width = 2
      Height = 490
      Align = alRight
      TabOrder = 4
      ExplicitLeft = 399
      ExplicitHeight = 491
    end
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 262
    Top = 180
  end
end
