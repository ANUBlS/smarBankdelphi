object fmCustomersProperties: TfmCustomersProperties
  Left = 327
  Top = 178
  ActiveControl = DBEdit1
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Sigorta etdiren'
  ClientHeight = 380
  ClientWidth = 495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 64
    Height = 13
    Caption = 'Мцштяри групу'
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 80
    Top = 8
    Width = 297
    Height = 21
    DataField = 'CUST_ID'
    DataSource = InsDataMod.DSInsCustomers
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = InsDataMod.DSCustomers
    TabOrder = 0
    OnKeyPress = DBLookupComboBox1KeyPress
  end
  object GroupBox1: TGroupBox
    Left = 1
    Top = 32
    Width = 493
    Height = 161
    Caption = 'Сыьорта етдирян барядя мялумат'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 15
      Height = 13
      Caption = 'Ады'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 40
      Width = 32
      Height = 13
      Caption = 'Сойады'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 64
      Width = 54
      Height = 13
      Caption = 'Атасынын ады'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 8
      Top = 88
      Width = 76
      Height = 13
      Caption = 'Доьулдуьу тарихи'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 8
      Top = 112
      Width = 69
      Height = 13
      Caption = 'Доьулдуьу йер'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 152
      Top = 136
      Width = 20
      Height = 13
      Caption = 'Жинс'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 256
      Top = 64
      Width = 50
      Height = 13
      Caption = 'Паспорт №'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 256
      Top = 16
      Width = 60
      Height = 13
      Caption = 'Аиля вязиййяти'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 256
      Top = 88
      Width = 82
      Height = 13
      Caption = 'Мяшьулиййят нювц'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
      Left = 256
      Top = 40
      Width = 30
      Height = 13
      Caption = 'Тящсили'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 8
      Top = 136
      Width = 18
      Height = 13
      Caption = 'Йаш'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 256
      Top = 112
      Width = 68
      Height = 13
      Caption = 'Фяалиййят нювц'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel
      Left = 256
      Top = 136
      Width = 52
      Height = 13
      Caption = 'Мясул шяхс'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 88
      Top = 16
      Width = 161
      Height = 21
      DataField = 'NAME'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBEdit2: TDBEdit
      Left = 88
      Top = 40
      Width = 161
      Height = 21
      DataField = 'SURNAME'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBEdit3: TDBEdit
      Left = 88
      Top = 64
      Width = 161
      Height = 21
      DataField = 'FATHERNAME'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DTPDateOfBirth: TDateTimePicker
      Left = 88
      Top = 88
      Width = 161
      Height = 21
      CalAlignment = dtaLeft
      Date = 39030.6930059954
      Time = 39030.6930059954
      DateFormat = dfShort
      DateMode = dmComboBox
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Kind = dtkDate
      ParseInput = False
      ParentFont = False
      TabOrder = 3
      OnChange = DTPDateOfBirthChange
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBEdit9: TDBEdit
      Left = 88
      Top = 112
      Width = 161
      Height = 21
      DataField = 'PLACEOFBIRTH'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBEdit12: TDBEdit
      Left = 344
      Top = 64
      Width = 145
      Height = 21
      DataField = 'PASPORTNO'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 344
      Top = 88
      Width = 145
      Height = 21
      DataField = 'OCC_ID'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = InsDataMod.DSOccupations
      ParentFont = False
      TabOrder = 10
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 344
      Top = 40
      Width = 145
      Height = 21
      DataField = 'ED_ID'
      DataSource = InsDataMod.DSInsCustomers
      DropDownRows = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = InsDataMod.DSEducations
      ParentFont = False
      TabOrder = 8
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBEdit10: TDBEdit
      Left = 88
      Top = 136
      Width = 50
      Height = 21
      DataField = 'AGE'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object cbSex: TComboBox
      Left = 184
      Top = 136
      Width = 65
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 6
      OnKeyPress = DBLookupComboBox1KeyPress
      Items.Strings = (
        'Киши'
        'Гадын')
    end
    object cbMillitaryStatus: TComboBox
      Left = 344
      Top = 16
      Width = 145
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 7
      OnKeyPress = DBLookupComboBox1KeyPress
      Items.Strings = (
        'Субай'
        'Евли'
        'Бошанмыш'
        'Дул')
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 344
      Top = 112
      Width = 145
      Height = 21
      DataField = 'ACT_ID'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = InsDataMod.DSActivity
      ParentFont = False
      TabOrder = 11
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBEdit16: TDBEdit
      Left = 344
      Top = 136
      Width = 145
      Height = 21
      DataField = 'CONTACTPERSON'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      OnKeyPress = DBLookupComboBox1KeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 250
    Top = 193
    Width = 244
    Height = 152
    Caption = 'Ялагя телефонлары'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Label5: TLabel
      Left = 8
      Top = 22
      Width = 52
      Height = 13
      Caption = 'Ев нюмряси'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 43
      Width = 47
      Height = 13
      Caption = 'Иш нюмряси'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 67
      Width = 25
      Height = 13
      Caption = 'Мобил'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 8
      Top = 96
      Width = 23
      Height = 13
      Caption = 'Факс'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 8
      Top = 120
      Width = 69
      Height = 13
      Caption = 'Мясул шяхс тел.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit4: TDBEdit
      Left = 96
      Top = 22
      Width = 145
      Height = 21
      DataField = 'HOMEPHONE'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBEdit5: TDBEdit
      Left = 96
      Top = 46
      Width = 145
      Height = 21
      DataField = 'WORKPHONE'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBEdit6: TDBEdit
      Left = 96
      Top = 70
      Width = 145
      Height = 21
      DataField = 'MOBILEPHONE'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBEdit8: TDBEdit
      Left = 96
      Top = 94
      Width = 145
      Height = 21
      DataField = 'FAX'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBEdit17: TDBEdit
      Left = 95
      Top = 118
      Width = 145
      Height = 21
      DataField = 'CONTACTPERSONPHONE'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnKeyPress = DBLookupComboBox1KeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 2
    Top = 193
    Width = 247
    Height = 152
    Caption = 'Цнван'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label8: TLabel
      Left = 6
      Top = 16
      Width = 100
      Height = 13
      Caption = 'Даими (щцгуги) цнван'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 7
      Top = 56
      Width = 64
      Height = 13
      Caption = 'Фактики цнван'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 9
      Top = 77
      Width = 28
      Height = 13
      Caption = 'Шящяр'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 9
      Top = 103
      Width = 22
      Height = 13
      Caption = 'Юлкя'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 9
      Top = 126
      Width = 32
      Height = 13
      Caption = 'Индекс'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit7: TDBEdit
      Left = 6
      Top = 32
      Width = 235
      Height = 21
      DataField = 'ADDRESS'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBEdit13: TDBEdit
      Left = 78
      Top = 56
      Width = 163
      Height = 21
      DataField = 'MAILINGADDRESS'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBEdit14: TDBEdit
      Left = 78
      Top = 79
      Width = 163
      Height = 21
      DataField = 'CITY'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBEdit11: TDBEdit
      Left = 78
      Top = 103
      Width = 163
      Height = 21
      DataField = 'STATE'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBEdit15: TDBEdit
      Left = 78
      Top = 127
      Width = 163
      Height = 21
      DataField = 'INDEX_'
      DataSource = InsDataMod.DSInsCustomers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnKeyPress = DBLookupComboBox1KeyPress
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 346
    Width = 495
    Height = 34
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object BitBtn1: TBitBtn
      Left = 321
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      TabOrder = 0
      OnClick = BitBtn1Click
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
    end
    object BitBtn2: TBitBtn
      Left = 409
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = BitBtn2Click
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
    end
  end
end
