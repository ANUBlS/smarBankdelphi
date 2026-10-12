object FormExchange: TFormExchange
  Left = 700
  Top = 236
  BorderStyle = bsDialog
  Caption = 'Exchange of the foreign currency'
  ClientHeight = 466
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxMain: TGroupBox
    Left = 0
    Top = 0
    Width = 400
    Height = 466
    Align = alClient
    Caption = #1042#1072#1083#1081#1091#1090#1072#1085#1099#1085' '#1072#1083#1099#1096#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Panel1: TPanel
      Left = 4
      Top = 19
      Width = 392
      Height = 442
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
        Left = 41
        Top = 12
        Width = 27
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
        Left = 5
        Top = 224
        Width = 53
        Height = 14
        Caption = #1058#1103#1081#1080#1085#1072#1090#1099':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 259
        Top = 40
        Width = 140
        Height = 14
        Caption = #1042#1072#1083#1081#1091#1090#1072#1085#1099#1085' '#1052#1094#1073#1072#1076#1080#1083#1103#1089#1080
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 215
        Top = 11
        Width = 26
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
      object Bevel25: TBevel
        Left = 3
        Top = 32
        Width = 386
        Height = 28
      end
      object DTP_Date: TDateTimePicker
        Left = 81
        Top = 5
        Width = 121
        Height = 21
        Date = 39027.101860532400000000
        Time = 39027.101860532400000000
        Enabled = False
        TabOrder = 0
      end
      object GrBoxValute: TGroupBox
        Left = 2
        Top = 61
        Width = 388
        Height = 92
        Caption = #1042#1072#1083#1081#1091#1090#1072' '#1074#1103' '#1097#1077#1089#1072#1073' '#1089#1077#1095#1080#1084#1083#1103#1088#1080
        TabOrder = 1
        object Label3: TLabel
          Left = 8
          Top = 27
          Width = 46
          Height = 14
          Caption = #1042#1072#1083#1081#1091#1090#1072':'
        end
        object Label4: TLabel
          Left = 6
          Top = 76
          Width = 56
          Height = 14
          Caption = #1052'.'#1041'. '#1082#1091#1088#1089#1091':'
        end
        object Label6: TLabel
          Left = 8
          Top = 51
          Width = 26
          Height = 14
          Caption = #1050'urs:'
        end
        object Label21: TLabel
          Left = 179
          Top = 27
          Width = 18
          Height = 14
          Caption = '==>'
        end
        object Label22: TLabel
          Left = 178
          Top = 54
          Width = 26
          Height = 14
          Caption = 'Kurs:'
        end
        object Label23: TLabel
          Left = 324
          Top = 51
          Width = 73
          Height = 14
          Caption = #1050#1091#1088#1089' '#1085#1080#1089#1073#1103#1090#1080':'
        end
        object Bevel2: TBevel
          Left = 64
          Top = 18
          Width = 80
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel1: TBevel
          Left = 64
          Top = 42
          Width = 80
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel3: TBevel
          Left = 235
          Top = 42
          Width = 81
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel4: TBevel
          Left = 235
          Top = 18
          Width = 81
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel5: TBevel
          Left = 322
          Top = 66
          Width = 62
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel6: TBevel
          Left = 63
          Top = 66
          Width = 81
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Label10: TLabel
          Left = 176
          Top = 75
          Width = 56
          Height = 14
          Caption = #1052'.'#1041'. '#1082#1091#1088#1089#1091':'
        end
        object Bevel7: TBevel
          Left = 235
          Top = 66
          Width = 81
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object DBLC_Currency: TDBLookupComboBox
          Left = 65
          Top = 19
          Width = 78
          Height = 22
          KeyField = 'VAL_ID'
          ListField = 'VAL_NAME'
          ListSource = DataModExch.DSExchAcc
          TabOrder = 0
          OnClick = DBLC_CurrencyClick
        end
        object Edit_purchase_course: TEdit
          Left = 65
          Top = 43
          Width = 78
          Height = 22
          ReadOnly = True
          TabOrder = 1
        end
        object Edit_nb_course: TEdit
          Left = 64
          Top = 67
          Width = 79
          Height = 22
          ReadOnly = True
          TabOrder = 2
        end
        object DBLC_Curr_Other: TDBLookupComboBox
          Left = 236
          Top = 19
          Width = 79
          Height = 22
          KeyField = 'VAL_ID'
          ListField = 'VAL_NAME'
          ListSource = DataModExch.DSExchRateOther
          TabOrder = 3
          OnClick = DBLC_Curr_OtherClick
        end
        object Edit_selling_course: TEdit
          Left = 236
          Top = 43
          Width = 79
          Height = 22
          ReadOnly = True
          TabOrder = 4
        end
        object Edit_Relation_Course: TEdit
          Left = 323
          Top = 67
          Width = 59
          Height = 22
          ReadOnly = True
          TabOrder = 5
        end
        object Edit_other_nb_course: TEdit
          Left = 236
          Top = 67
          Width = 79
          Height = 22
          ReadOnly = True
          TabOrder = 6
        end
      end
      object PanelDest: TPanel
        Left = 3
        Top = 155
        Width = 388
        Height = 59
        BevelInner = bvLowered
        BevelOuter = bvSpace
        TabOrder = 2
        object Label12: TLabel
          Left = 12
          Top = 13
          Width = 152
          Height = 14
          Caption = #1061#1072#1088#1080#1078#1080' '#1074#1072#1083#1081#1091#1090#1072#1085#1099#1085' '#1084#1103#1073#1083#1103#1100#1080
        end
        object Label13: TLabel
          Left = 143
          Top = 13
          Width = 125
          Height = 14
          Caption = #1044#1080#1101#1103#1088' '#1074#1072#1083#1081#1091#1090#1072' '#1084#1103#1073#1083#1103#1100#1080
        end
        object Label14: TLabel
          Left = 281
          Top = 13
          Width = 73
          Height = 14
          Caption = #1069#1103#1083#1080#1088' '#1084#1103#1073#1083#1103#1100
        end
        object Bevel8: TBevel
          Left = 11
          Top = 31
          Width = 121
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel9: TBevel
          Left = 143
          Top = 31
          Width = 121
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel10: TBevel
          Left = 280
          Top = 31
          Width = 98
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Edit_Exchange_Amount: TEdit
          Left = 12
          Top = 32
          Width = 118
          Height = 22
          TabOrder = 0
          OnChange = Edit_Exchange_AmountChange
        end
        object Edit_Ekv_Amount: TEdit
          Left = 144
          Top = 32
          Width = 118
          Height = 22
          ReadOnly = True
          TabOrder = 1
        end
        object Edit_Fee_Amount: TEdit
          Left = 281
          Top = 32
          Width = 95
          Height = 22
          ReadOnly = True
          TabOrder = 2
        end
      end
      object DTP_System_Time: TDateTimePicker
        Left = 254
        Top = 5
        Width = 103
        Height = 22
        Date = 39035.955562789300000000
        Time = 39035.955562789300000000
        Kind = dtkTime
        TabOrder = 3
      end
      object Edit_Setting: TEdit
        Left = 50
        Top = 217
        Width = 340
        Height = 22
        CharCase = ecUpperCase
        Color = clMenu
        ReadOnly = True
        TabOrder = 4
      end
      object Edit_Exch: TDBEdit
        Left = 80
        Top = 39
        Width = 161
        Height = 16
        BorderStyle = bsNone
        Color = clBtnFace
        DataField = 'EX_NAME'
        DataSource = DataModExch.DSExchOffice
        ReadOnly = True
        TabOrder = 5
      end
      object GroupBox1: TGroupBox
        Left = 4
        Top = 239
        Width = 389
        Height = 200
        Caption = #1052#1094#1096#1090#1103#1088#1080' '#1097#1072#1075#1075#1099#1085#1076#1072' '#1080#1085#1092#1086#1088#1084#1072#1089#1080#1081#1072
        TabOrder = 6
        object Label9: TLabel
          Left = 6
          Top = 158
          Width = 59
          Height = 14
          Caption = #1055#1072#1089#1087#1086#1088#1090' '#8470
        end
        object Label17: TLabel
          Left = 6
          Top = 113
          Width = 71
          Height = 14
          Caption = #1058#1103#1075'. '#1077#1076'. '#1086#1088#1075#1072#1085'.'
        end
        object Label18: TLabel
          Left = 6
          Top = 89
          Width = 91
          Height = 14
          Caption = #1064#1103#1093'. '#1090#1103#1089'. '#1077#1076'. '#1089#1103#1085'.'
        end
        object Label16: TLabel
          Left = 6
          Top = 64
          Width = 77
          Height = 14
          Caption = #1040#1090#1072#1089#1099#1085#1099#1085' '#1072#1076#1099
        end
        object Label8: TLabel
          Left = 6
          Top = 42
          Width = 39
          Height = 14
          Caption = #1057#1086#1081#1072#1076#1099
        end
        object Label7: TLabel
          Left = 6
          Top = 22
          Width = 87
          Height = 14
          Caption = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099
        end
        object Label19: TLabel
          Left = 6
          Top = 180
          Width = 84
          Height = 14
          Caption = #1042#1077#1088#1080#1083#1084#1103' '#1090#1072#1088#1080#1093#1080
        end
        object LabelCountry: TLabel
          Left = 6
          Top = 136
          Width = 46
          Height = 14
          Caption = #1070#1083#1082#1103#1083#1103#1088
        end
        object Bevel11: TBevel
          Left = 87
          Top = 13
          Width = 147
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel12: TBevel
          Left = 87
          Top = 34
          Width = 147
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel13: TBevel
          Left = 87
          Top = 55
          Width = 147
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel14: TBevel
          Left = 88
          Top = 81
          Width = 147
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel15: TBevel
          Left = 88
          Top = 104
          Width = 147
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel16: TBevel
          Left = 88
          Top = 127
          Width = 147
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel17: TBevel
          Left = 237
          Top = 12
          Width = 148
          Height = 68
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel18: TBevel
          Left = 238
          Top = 82
          Width = 148
          Height = 67
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel19: TBevel
          Left = 123
          Top = 150
          Width = 112
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel20: TBevel
          Left = 88
          Top = 150
          Width = 35
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel21: TBevel
          Left = 88
          Top = 173
          Width = 147
          Height = 23
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel22: TBevel
          Left = 238
          Top = 151
          Width = 148
          Height = 45
          Shape = bsFrame
          Style = bsRaised
        end
        object Bevel23: TBevel
          Left = 242
          Top = 155
          Width = 140
          Height = 5
        end
        object Bevel24: TBevel
          Left = 242
          Top = 188
          Width = 140
          Height = 5
        end
        object Edit_First_Name: TEdit
          Left = 88
          Top = 14
          Width = 145
          Height = 22
          TabOrder = 0
        end
        object Edit_Last_Name: TEdit
          Left = 88
          Top = 35
          Width = 145
          Height = 22
          TabOrder = 1
        end
        object Edit_Pasport: TEdit
          Left = 124
          Top = 151
          Width = 110
          Height = 22
          MaxLength = 8
          TabOrder = 7
          OnKeyPress = Edit_PasportKeyPress
        end
        object Edit_AZE: TEdit
          Left = 89
          Top = 151
          Width = 33
          Height = 22
          CharCase = ecUpperCase
          TabOrder = 6
          Text = 'AZE'
        end
        object Edit_Giving_Member: TEdit
          Left = 89
          Top = 105
          Width = 145
          Height = 22
          TabOrder = 4
        end
        object Edit_Cust_Confirm: TEdit
          Left = 89
          Top = 82
          Width = 145
          Height = 22
          TabOrder = 3
        end
        object Edit_Father: TEdit
          Left = 88
          Top = 56
          Width = 145
          Height = 22
          TabOrder = 2
        end
        object Edit_Country: TEdit
          Left = 89
          Top = 128
          Width = 145
          Height = 22
          TabOrder = 5
        end
        object DBLC_Country: TDBLookupComboBox
          Left = 240
          Top = 127
          Width = 145
          Height = 22
          KeyField = 'CUST_COUNTRY'
          ListField = 'CUST_COUNTRY'
          ListSource = DataModExch.DSCust_Country
          TabOrder = 9
          OnClick = DBLC_CountryClick
        end
        object Edit_Cust_Date: TMaskEdit
          Left = 89
          Top = 174
          Width = 145
          Height = 22
          EditMask = '99-99-9999;1;'
          MaxLength = 10
          TabOrder = 8
          Text = '  -  -    '
        end
        object DBLC_First_Name: TDBLookupComboBox
          Left = 239
          Top = 14
          Width = 145
          Height = 22
          KeyField = 'CUST_NAME'
          ListField = 'CUST_NAME'
          ListSource = DataModExch.DSCust_Name
          TabOrder = 10
          OnClick = DBLC_First_NameClick
        end
        object DBLC_Last_Name: TDBLookupComboBox
          Left = 239
          Top = 36
          Width = 145
          Height = 22
          KeyField = 'CUST_LNAME'
          ListField = 'CUST_LNAME'
          ListSource = DataModExch.DSCust_LName
          TabOrder = 11
          OnClick = DBLC_Last_NameClick
        end
        object DBLC_Father: TDBLookupComboBox
          Left = 239
          Top = 58
          Width = 145
          Height = 22
          KeyField = 'CUST_FATHER'
          ListField = 'CUST_FATHER'
          ListSource = DataModExch.DSCust_Father
          TabOrder = 12
          OnClick = DBLC_FatherClick
        end
        object BtnRun: TBitBtn
          Left = 242
          Top = 162
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
          TabOrder = 13
          OnClick = BtnRunClick
        end
        object BtnExit: TBitBtn
          Left = 315
          Top = 162
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
          TabOrder = 14
          OnClick = BtnExitClick
        end
        object DBLC_Cust_Confirm: TDBLookupComboBox
          Left = 240
          Top = 83
          Width = 145
          Height = 22
          KeyField = 'CUST_CONFIRM'
          ListField = 'CUST_CONFIRM'
          ListSource = DataModExch.DSCust_Confirm
          TabOrder = 15
          OnClick = DBLC_Cust_ConfirmClick
        end
        object DBLC_Giving_Member: TDBLookupComboBox
          Left = 240
          Top = 105
          Width = 145
          Height = 22
          KeyField = 'CUST_GIVING_MEMBER'
          ListField = 'CUST_GIVING_MEMBER'
          ListSource = DataModExch.DSGiving_Member
          TabOrder = 16
          OnClick = DBLC_Giving_MemberClick
        end
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 16
      Width = 396
      Height = 3
      Align = alTop
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 2
      Top = 19
      Width = 2
      Height = 442
      Align = alLeft
      TabOrder = 2
    end
    object Panel4: TPanel
      Left = 2
      Top = 461
      Width = 396
      Height = 3
      Align = alBottom
      TabOrder = 3
    end
    object Panel5: TPanel
      Left = 396
      Top = 19
      Width = 2
      Height = 442
      Align = alRight
      TabOrder = 4
    end
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 158
    Top = 64
  end
end
