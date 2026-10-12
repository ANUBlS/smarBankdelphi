object Ceskform: TCeskform
  Left = 366
  Top = 119
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Ceskform'
  ClientHeight = 599
  ClientWidth = 862
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
  object GroupBox1: TGroupBox
    Left = 16
    Top = 18
    Width = 411
    Height = 560
    Caption = 'MT'
    TabOrder = 0
    object Label4: TLabel
      Left = 64
      Top = 119
      Width = 87
      Height = 14
      Caption = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 64
      Top = 183
      Width = 109
      Height = 14
      Caption = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1065#1077#1089#1072#1073#1099
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 64
      Top = 47
      Width = 56
      Height = 14
      Caption = #1056#1077#1092#1077#1088#1077#1085#1089#1080
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 64
      Top = 231
      Width = 108
      Height = 14
      Caption = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1042#1070#1045#1053'-'#1080
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object stat: TLabel
      Left = 136
      Top = 24
      Width = 18
      Height = 14
      Caption = 'stat'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Button1: TButton
      Left = 24
      Top = 512
      Width = 75
      Height = 25
      Caption = #1044#1094#1079#1076#1094#1088'!'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 136
      Top = 512
      Width = 75
      Height = 25
      Caption = #1057#1103#1097#1074#1076#1080#1088'!'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 256
      Top = 512
      Width = 75
      Height = 25
      Caption = #1041#1072#1100#1083#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button3Click
    end
    object DBEdit3: TDBEdit
      Left = 24
      Top = 143
      Width = 305
      Height = 21
      DataField = 'DESCRIPTION2'
      DataSource = SWDataModule.sw_in1
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 24
      Top = 199
      Width = 305
      Height = 21
      DataField = 'ACOUNT'
      DataSource = SWDataModule.sw_in1
      ReadOnly = True
      TabOrder = 4
      OnChange = DBEdit4Change
    end
    object DBEdit5: TDBEdit
      Left = 24
      Top = 79
      Width = 305
      Height = 21
      DataField = 'REFERANCE'
      DataSource = SWDataModule.sw_in1
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit6: TDBEdit
      Left = 24
      Top = 255
      Width = 305
      Height = 21
      DataField = 'TAX'
      DataSource = SWDataModule.sw_in1
      ReadOnly = True
      TabOrder = 6
    end
    object Button4: TButton
      Left = 208
      Top = 424
      Width = 137
      Height = 25
      Caption = #1053#1070#1042#1041#1071#1058#1048
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 48
      Top = 424
      Width = 137
      Height = 25
      Caption = #1071#1042#1042#1071#1051#1050#1048
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = Button5Click
    end
    object DBEdit7: TDBEdit
      Left = 176
      Top = 24
      Width = 121
      Height = 21
      DataField = 'ID'
      DataSource = SWDataModule.sw_in1
      ReadOnly = True
      TabOrder = 9
      Visible = False
    end
    object GroupBox5: TGroupBox
      Left = 6
      Top = 291
      Width = 400
      Height = 122
      Caption = #1070#1083#1082#1103' '#1074#1103' '#1097#1077#1089#1072#1073#1072#1090' '#1090#1103#1081#1080#1085#1072#1090#1099
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -12
      Font.Name = 'Arial AzLat'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      object Label40: TLabel
        Left = 167
        Top = 70
        Width = 50
        Height = 14
        Caption = 'Country :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial AzLat'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label41: TLabel
        Left = 164
        Top = 11
        Width = 53
        Height = 14
        Caption = 'H.Teyinat:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial AzLat'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBViewComboBox1: TDBViewComboBox
        Left = 128
        Top = 88
        Width = 145
        Height = 23
        TabOrder = 0
        Visible = False
        ListSource = SWDataModule.DataSourcecountry
        ListFields = 'CNTR_NAME'
        FieldInterval = 5
        DropDownOnEnter = False
      end
      object DBViewComboBox2: TDBViewComboBox
        Left = 88
        Top = 40
        Width = 225
        Height = 23
        TabOrder = 1
        ListSource = SWDataModule.DataSourcehteyinat
        ListFields = 'NAME'
        FieldInterval = 5
        DropDownOnEnter = False
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 431
    Top = 18
    Width = 417
    Height = 560
    Caption = #1052#1094#1096#1090#1103#1088#1080' '#1097#1072#1075#1075#1099#1085#1076#1072' '#1084#1103#1083#1091#1084#1072#1090
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 160
      Top = 139
      Width = 71
      Height = 14
      Caption = #1065#1077#1089#1072#1073#1099#1085' '#1072#1076#1099
    end
    object Label2: TLabel
      Left = 160
      Top = 208
      Width = 87
      Height = 14
      Caption = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099
    end
    object Label3: TLabel
      Left = 117
      Top = 40
      Width = 34
      Height = 14
      Caption = #1065#1077#1089#1072#1073
    end
    object DBEdit1: TDBEdit
      Left = 82
      Top = 163
      Width = 328
      Height = 22
      DataField = 'NAME'
      DataSource = SWDataModule.Account_sw
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 82
      Top = 235
      Width = 328
      Height = 22
      DataField = 'NAME'
      DataSource = SWDataModule.customer
      ReadOnly = True
      TabOrder = 1
    end
    object SearchEdit1: TSearchEdit
      Left = 160
      Top = 38
      Width = 190
      Height = 22
      TabOrder = 2
      OnChange = SearchEdit1Change
      DataSource = SWDataModule.Account_sw
      SearchField = 'ACC_NO'
    end
  end
end
