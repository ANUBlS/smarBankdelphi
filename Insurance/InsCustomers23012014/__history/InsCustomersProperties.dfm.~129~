object fmCustomersProperties: TfmCustomersProperties
  Left = 448
  Top = 245
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'S'#305#287'ortal'#305
  ClientHeight = 519
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 482
    Width = 533
    Height = 37
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      533
      37)
    object BitBtn1: TBitBtn
      Left = 346
      Top = 6
      Width = 80
      Height = 27
      Anchors = [akRight, akBottom]
      Caption = 'OK'
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
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 440
      Top = 6
      Width = 81
      Height = 27
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      DoubleBuffered = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object XFPanel2: TXFPanel
    Left = 0
    Top = 0
    Width = 533
    Height = 101
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object XFLabel1: TXFLabel
      Left = 5
      Top = 46
      Width = 96
      Height = 15
      Caption = 'Daxil edilm'#601' tarixi'
    end
    object XFLabel2: TXFLabel
      Left = 7
      Top = 14
      Width = 29
      Height = 15
      Caption = 'ID-si:'
    end
    object XFLabel3: TXFLabel
      Left = 230
      Top = 14
      Width = 75
      Height = 15
      Caption = 'M'#252#351't'#601'ri qrupu'
    end
    object XFLabel4: TXFLabel
      Left = 230
      Top = 44
      Width = 69
      Height = 15
      Caption = 'M'#252#351't'#601'ri n'#246'v'#252
    end
    object DBEdit10: TDBEdit
      Left = 103
      Top = 11
      Width = 118
      Height = 22
      DataField = 'CUST_ID'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = DBEdit10KeyPress
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 314
      Top = 11
      Width = 212
      Height = 23
      DataField = 'CUST_ID'
      DataSource = InsDataMod.DSInsCustomers
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = InsDataMod.DSCustomers
      TabOrder = 1
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBInsuredType: TDBLookupComboBox
      Left = 314
      Top = 40
      Width = 212
      Height = 23
      DataField = 'INSURED_TYPEID'
      DataSource = InsDataMod.DSInsCustomers
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = InsDataMod.DSCustTypes
      TabOrder = 2
      OnClick = DBInsuredTypeClick
    end
    object DateTimePicker1: TDateTimePicker
      Left = 103
      Top = 40
      Width = 118
      Height = 23
      Date = 41305.512674085650000000
      Time = 41305.512674085650000000
      Enabled = False
      TabOrder = 3
    end
    object XFCheckBox1: TXFCheckBox
      Left = 314
      Top = 77
      Width = 217
      Height = 17
      Caption = 'S'#305#287'ortal'#305' haqq'#305'nda m'#601'lumatlar'#305' yaz '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Visible = False
    end
  end
  object XFGroupBox1: TXFGroupBox
    Left = 0
    Top = 101
    Width = 533
    Height = 187
    Align = alBottom
    Caption = 'S'#305#287'ortal'#305' haqq'#305'nda m'#601'lumatlar '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object XFLabel5: TXFLabel
      Left = 7
      Top = 24
      Width = 18
      Height = 16
      Caption = 'Ad'#305
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object XFLabel6: TXFLabel
      Left = 7
      Top = 48
      Width = 38
      Height = 16
      Caption = 'Soyad'#305
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object XFLabel7: TXFLabel
      Left = 7
      Top = 78
      Width = 66
      Height = 16
      Caption = 'Atas'#305'n'#305'n ad'#305
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object XFLabel8: TXFLabel
      Left = 7
      Top = 104
      Width = 82
      Height = 16
      Caption = 'S'#601'n'#601'din n'#246'v'#252':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object XFLabel9: TXFLabel
      Left = 7
      Top = 131
      Width = 62
      Height = 16
      Caption = 'Seriya / N:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object XFLabel10: TXFLabel
      Left = 267
      Top = 24
      Width = 37
      Height = 16
      Caption = 'V'#214'EN:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object XFLabel11: TXFLabel
      Left = 267
      Top = 48
      Width = 62
      Height = 16
      Caption = 'M'#601'sul '#351#601'xs'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object XFLabel12: TXFLabel
      Left = 267
      Top = 78
      Width = 53
      Height = 16
      Caption = 'F'#601'aliyy'#601'ti'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object XFLabel13: TXFLabel
      Left = 267
      Top = 104
      Width = 27
      Height = 16
      Caption = 'Cinsi'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object XFLabel14: TXFLabel
      Left = 267
      Top = 131
      Width = 55
      Height = 16
      Caption = 'T'#601'v'#601'll'#252'd'#252
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object XFLabel24: TXFLabel
      Left = 267
      Top = 165
      Width = 113
      Height = 14
      Caption = 'S'#252'r'#252'c'#252'l'#252'k t'#601'cr'#252'b'#601'si  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit3: TDBEdit
      Left = 88
      Top = 73
      Width = 173
      Height = 22
      DataField = 'FATHERNAME'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBEdit2: TDBEdit
      Left = 88
      Top = 46
      Width = 173
      Height = 22
      DataField = 'SURNAME'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBEdit1: TDBEdit
      Left = 88
      Top = 18
      Width = 173
      Height = 22
      DataField = 'NAME'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object cbSex: TComboBox
      Left = 374
      Top = 98
      Width = 67
      Height = 22
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnKeyPress = DBLookupComboBox1KeyPress
      Items.Strings = (
        'Ki'#351'i'
        'Qad'#305'n')
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 374
      Top = 72
      Width = 155
      Height = 22
      DataField = 'ACT_ID'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = InsDataMod.DSActivity
      ParentFont = False
      TabOrder = 8
    end
    object DBEdit16: TDBEdit
      Left = 374
      Top = 46
      Width = 154
      Height = 22
      DataField = 'CONTACTPERSON'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBEdit9: TDBEdit
      Left = 88
      Top = 128
      Width = 45
      Height = 22
      DataField = 'PASSER'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DBEdit12: TDBEdit
      Left = 137
      Top = 128
      Width = 124
      Height = 22
      DataField = 'PASPORTNO'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 5
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object CBoxDocType1: TDBLookupComboBox
      Left = 88
      Top = 100
      Width = 173
      Height = 22
      DataField = 'DOCUMENT_TYPE'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = InsDataMod.DsrcDoctaypes
      ParentFont = False
      TabOrder = 3
      OnClick = CBoxDocType1Click
      OnCloseUp = CBoxDocType1CloseUp
    end
    object DBEdit18: TDBEdit
      Left = 374
      Top = 20
      Width = 154
      Height = 22
      DataField = 'INN'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 6
    end
    object DateTimePicker2: TDateTimePicker
      Left = 374
      Top = 126
      Width = 155
      Height = 24
      Date = 41313.552051643520000000
      Time = 41313.552051643520000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
    object DateTimePicker3: TDateTimePicker
      Left = 374
      Top = 160
      Width = 154
      Height = 22
      Date = 41536.445960231480000000
      Time = 41536.445960231480000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
  end
  object XFPanel3: TXFPanel
    Left = 0
    Top = 288
    Width = 533
    Height = 194
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 3
    object XFGroupBox2: TXFGroupBox
      Left = 1
      Top = 1
      Width = 266
      Height = 192
      Align = alLeft
      Caption = #220'nvan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object XFLabel15: TXFLabel
        Left = 8
        Top = 19
        Width = 122
        Height = 16
        Caption = 'Daimi (h'#252'quqi) '#252'nvan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object XFLabel16: TXFLabel
        Left = 8
        Top = 71
        Width = 74
        Height = 16
        Caption = 'Faktiki '#252'nvan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object XFLabel17: TXFLabel
        Left = 6
        Top = 124
        Width = 34
        Height = 16
        Caption = #350#601'h'#601'r'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 8
        Top = 97
        Width = 25
        Height = 16
        Caption = #214'lk'#601
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 149
        Width = 37
        Height = 16
        Caption = #304'ndeks'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object XFLabel18: TXFLabel
        Left = 8
        Top = 171
        Width = 23
        Height = 16
        Caption = 'Mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit7: TDBEdit
        Left = 6
        Top = 39
        Width = 252
        Height = 22
        DataField = 'ADDRESS'
        DataSource = InsDataMod.DSInsCustomers
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = DBLookupComboBox1KeyPress
      end
      object DBEdit15: TDBEdit
        Left = 96
        Top = 145
        Width = 162
        Height = 22
        DataField = 'INDEX_'
        DataSource = InsDataMod.DSInsCustomers
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnKeyPress = DBLookupComboBox1KeyPress
      end
      object DBEdit13: TDBEdit
        Left = 96
        Top = 69
        Width = 162
        Height = 22
        DataField = 'MAILINGADDRESS'
        DataSource = InsDataMod.DSInsCustomers
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyPress = DBLookupComboBox1KeyPress
      end
      object DBEdit19: TDBEdit
        Left = 95
        Top = 168
        Width = 163
        Height = 24
        DataField = 'MAIL'
        DataSource = InsDataMod.DSInsCustomers
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 95
        Top = 91
        Width = 165
        Height = 24
        DataField = 'STATE'
        DataSource = InsDataMod.DSInsCustomers
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'CNTR_NAME'
        ListField = 'CNTR_NAME'
        ListSource = InsDataMod.DSRcountries
        ParentFont = False
        TabOrder = 4
        OnClick = DBLookupComboBox3Click
        OnKeyUp = DBLookupComboBox3KeyUp
      end
      object DBLookupComboBox4: TDBLookupComboBox
        Left = 95
        Top = 118
        Width = 163
        Height = 24
        DataField = 'CITY'
        DataSource = InsDataMod.DSInsCustomers
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'CITY_NAME'
        ListField = 'CITY_NAME'
        ListSource = InsDataMod.DSRcities
        ParentFont = False
        TabOrder = 5
      end
    end
    object XFGroupBox3: TXFGroupBox
      Left = 267
      Top = 1
      Width = 265
      Height = 192
      Align = alClient
      Caption = #399'laq'#601' telefonlar'#305
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object XFLabel19: TXFLabel
        Left = 9
        Top = 19
        Width = 63
        Height = 16
        Caption = 'Ev n'#246'mr'#601'si'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object XFLabel20: TXFLabel
        Left = 9
        Top = 71
        Width = 60
        Height = 16
        Caption = #304#351' n'#246'mr'#601'si'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object XFLabel21: TXFLabel
        Left = 9
        Top = 98
        Width = 30
        Height = 16
        Caption = 'Mobil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object XFLabel22: TXFLabel
        Left = 8
        Top = 124
        Width = 26
        Height = 16
        Caption = 'Faks'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object XFLabel23: TXFLabel
        Left = 9
        Top = 154
        Width = 84
        Height = 16
        Caption = 'M'#601'sul '#351#601'xs tel.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit4: TDBEdit
        Left = 10
        Top = 39
        Width = 248
        Height = 22
        DataField = 'HOMEPHONE'
        DataSource = InsDataMod.DSInsCustomers
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = DBLookupComboBox1KeyPress
      end
      object DBEdit5: TDBEdit
        Left = 102
        Top = 70
        Width = 156
        Height = 22
        DataField = 'WORKPHONE'
        DataSource = InsDataMod.DSInsCustomers
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyPress = DBLookupComboBox1KeyPress
      end
      object DBEdit17: TDBEdit
        Left = 102
        Top = 148
        Width = 156
        Height = 22
        DataField = 'CONTACTPERSONPHONE'
        DataSource = InsDataMod.DSInsCustomers
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnKeyPress = DBLookupComboBox1KeyPress
      end
      object DBEdit8: TDBEdit
        Left = 102
        Top = 122
        Width = 156
        Height = 22
        DataField = 'FAX'
        DataSource = InsDataMod.DSInsCustomers
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnKeyPress = DBLookupComboBox1KeyPress
      end
      object DBEdit6: TDBEdit
        Left = 102
        Top = 96
        Width = 156
        Height = 22
        DataField = 'MOBILEPHONE'
        DataSource = InsDataMod.DSInsCustomers
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnKeyPress = DBLookupComboBox1KeyPress
      end
    end
  end
  object DScont: TOracleDataSet
    SQL.Strings = (
      'select id from countries '
      'where cntr_name=:P_name')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A0050005F004E0041004D004500050000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {05000000010000000400000049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 312
    Top = 336
    object DScontID: TFloatField
      FieldName = 'ID'
      Required = True
    end
  end
  object DSCiti: TOracleDataSet
    SQL.Strings = (
      'select * from cities'
      'where COUNTRY_ID = nvl(:CID,0)'
      'and city_name=:p_name'
      'order by ID')
    Optimize = False
    Variables.Data = {
      0400000002000000080000003A00430049004400030000000000000000000000
      0E0000003A0050005F004E0041004D004500050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000400000004000000490044000100000000001400000043004F005500
      4E005400520059005F0049004400010000000000120000004300490054005900
      5F004E0041004D00450001000000000014000000500048004F004E0045005F00
      43004F0044004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 312
    Top = 376
  end
end
