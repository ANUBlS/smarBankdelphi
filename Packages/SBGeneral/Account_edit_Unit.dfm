object Account_edit: TAccount_edit
  Left = 0
  Top = 0
  AutoSize = True
  ClientHeight = 647
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 470
    Height = 181
    Align = alTop
    Caption = 'Hesab:'
    TabOrder = 0
    object XFLabel1: TXFLabel
      Left = 8
      Top = 15
      Width = 61
      Height = 13
      Caption = 'A'#231#305'lma tarixi:'
    end
    object XFLabel2: TXFLabel
      Left = 194
      Top = 15
      Width = 24
      Height = 13
      Caption = 'Filial:'
    end
    object DTPOpenDate: TDateTimePicker
      Left = 73
      Top = 13
      Width = 115
      Height = 21
      Date = 37357.618323692100000000
      Time = 37357.618323692100000000
      TabOrder = 0
    end
    object DBEditBranchID: TDBEdit
      Left = 223
      Top = 12
      Width = 56
      Height = 21
      DataField = 'KOD_FILIAL'
      DataSource = DataAcc.BranchesData
      TabOrder = 1
    end
    object DBLookupComboBoxBranchName: TDBLookupComboBox
      Left = 279
      Top = 12
      Width = 180
      Height = 21
      DataField = 'FILIAL'
      DataSource = DataAcc.AccountData_edit
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DataAcc.BranchesData
      TabOrder = 2
    end
    object GroupBox2: TGroupBox
      Left = 3
      Top = 39
      Width = 462
      Height = 138
      Caption = 'M'#252#351't'#601'ri haqqinda:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object XFLabel3: TXFLabel
        Left = 10
        Top = 22
        Width = 42
        Height = 13
        Caption = 'M'#252#351't'#601'ri :'
      end
      object XFLabel6: TXFLabel
        Left = 10
        Top = 50
        Width = 62
        Height = 13
        Caption = 'M'#252#351't'#601'ri  tipi :'
      end
      object XFLaCBox: TXFLabel
        Left = 10
        Top = 90
        Width = 76
        Height = 13
        Caption = 'M'#252'lkiyy'#601't n'#246'v'#252':'
      end
      object XFLabel5: TXFLabel
        Left = 10
        Top = 117
        Width = 81
        Height = 13
        Caption = 'F'#601'aliyy'#601't sah'#601'si:'
      end
      object XFCheckBox_type: TXFCheckBox
        Left = 95
        Top = 46
        Width = 117
        Height = 17
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object RBtnNoResident: TXFRadioButton
        Left = 94
        Top = 67
        Width = 87
        Height = 17
        Caption = 'Qeyri-rezident'
        TabOrder = 1
      end
      object EditId: TEdit
        Left = 98
        Top = 18
        Width = 75
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object EditName: TEdit
        Left = 174
        Top = 18
        Width = 282
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object RadioGroup1: TRadioGroup
        Left = 187
        Top = 40
        Width = 113
        Height = 47
        Items.Strings = (
          'Fiziki '#351#601'xs'
          'Fiziki sahibkar')
        TabOrder = 4
        Visible = False
        OnClick = RadioGroup1Click
      end
      object DBLookupvid_sob: TDBLookupComboBox
        Left = 94
        Top = 89
        Width = 364
        Height = 21
        Enabled = False
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = DataAcc.EstateType
        TabOrder = 5
      end
      object DBLookupSFERA_DEY: TDBLookupComboBox
        Left = 95
        Top = 114
        Width = 364
        Height = 21
        Enabled = False
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = DataAcc.ActionArea
        TabOrder = 6
      end
      object XFButtEdit: TXFButton
        Left = 355
        Top = 54
        Width = 60
        Height = 25
        Caption = 'redakt'#601
        DoubleBuffered = True
        Enabled = False
        ParentDoubleBuffered = False
        TabOrder = 7
        OnClick = XFButtEditClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 181
    Width = 470
    Height = 143
    Align = alTop
    AutoSize = True
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 1
    object Panel_BAnkCode: TPanel
      Left = 2
      Top = 2
      Width = 466
      Height = 29
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvSpace
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 7
        Width = 62
        Height = 13
        Caption = 'Bank'#305'n Kodu:'
      end
      object Edit_BankCod: TEdit
        Left = 95
        Top = 4
        Width = 95
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object Button2: TButton
        Left = 277
        Top = 4
        Width = 149
        Height = 22
        Caption = 'Bank'#305'n Rekvizitleri'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button2Click
      end
    end
    object Müxabirləşmə_kodu: TPanel
      Left = 2
      Top = 31
      Width = 466
      Height = 29
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvSpace
      TabOrder = 1
      object Label10: TLabel
        Left = 11
        Top = 7
        Width = 95
        Height = 13
        Caption = 'M'#252'xabirl'#601#351'm'#601' kodu:'
      end
      object Edit_MuxKod: TEdit
        Left = 108
        Top = 3
        Width = 352
        Height = 21
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 60
      Width = 466
      Height = 81
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvSpace
      TabOrder = 2
      object XFLabel7: TXFLabel
        Left = 10
        Top = 11
        Width = 59
        Height = 13
        Caption = 'Hesab'#305'n tipi:'
      end
      object XFLabel20: TXFLabel
        Left = 70
        Top = 11
        Width = 8
        Height = 14
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object XFLabel8: TXFLabel
        Left = 10
        Top = 38
        Width = 88
        Height = 13
        Caption = 'Hesab'#305'n valyutas'#305':'
      end
      object XFLabel21: TXFLabel
        Left = 99
        Top = 37
        Width = 8
        Height = 14
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object XFLabel9: TXFLabel
        Left = 10
        Top = 65
        Width = 75
        Height = 13
        Caption = 'Balans hesab'#305'1:'
      end
      object XFLabel19: TXFLabel
        Left = 86
        Top = 64
        Width = 8
        Height = 14
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 120
        Top = 4
        Width = 70
        Height = 21
        TabOrder = 0
        OnExit = Edit1Exit
        OnKeyPress = Edit1KeyPress
      end
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 191
        Top = 4
        Width = 269
        Height = 21
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = DataAcc.Dsrc_acc_types
        TabOrder = 1
        Visible = True
        OnChange = DBLookupComboboxEh1Change
      end
      object Edit3: TEdit
        Left = 121
        Top = 30
        Width = 69
        Height = 21
        TabOrder = 2
        OnExit = Edit3Exit
        OnKeyPress = Edit3KeyPress
      end
      object DBLookupComboboxEh2: TDBLookupComboboxEh
        Left = 191
        Top = 30
        Width = 268
        Height = 21
        DataField = 'VAL_ACC'
        DataSource = DataAcc.AccountData_edit
        EditButtons = <>
        KeyField = 'VALUTE'
        ListField = 'VALU_NAME'
        ListSource = DataAcc.DsrcValute_acc
        TabOrder = 3
        Visible = True
        OnChange = DBLookupComboboxEh2Change
      end
      object Edit4: TEdit
        Left = 121
        Top = 57
        Width = 69
        Height = 21
        TabOrder = 4
        OnExit = Edit4Exit
        OnKeyPress = Edit4KeyPress
      end
      object DBLookupComboboxEh3: TDBLookupComboboxEh
        Left = 192
        Top = 57
        Width = 268
        Height = 21
        DataField = 'BAL_CN1'
        DataSource = DataAcc.AccountData_edit
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'BAL_CN'
        ListField = 'BALNAME'
        ListSource = DataAcc.Dsrc_bal_spr1Edit
        TabOrder = 5
        Visible = True
        OnChange = DBLookupComboboxEh3Change
      end
    end
  end
  object XFPanel3: TXFPanel
    Left = 0
    Top = 616
    Width = 470
    Height = 31
    Align = alTop
    AutoSize = True
    BevelKind = bkFlat
    TabOrder = 2
    object XFBitBtn1: TXFBitBtn
      Left = 150
      Top = 1
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = XFBitBtn1Click
    end
    object XFBitBtn2: TXFBitBtn
      Left = 231
      Top = 1
      Width = 75
      Height = 25
      Caption = #304'mtina'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = XFBitBtn2Click
    end
  end
  object Panel_Cari_qalıq: TPanel
    Left = 0
    Top = 556
    Width = 470
    Height = 60
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 3
    object GroupBox3: TGroupBox
      Left = 8
      Top = 4
      Width = 454
      Height = 50
      Caption = 'Cari qal'#305'q'
      TabOrder = 0
      object XFLabel22: TXFLabel
        Left = 19
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Qal'#305'q:'
      end
      object XFLabel23: TXFLabel
        Left = 254
        Top = 20
        Width = 53
        Height = 13
        Caption = 'Ekvivalent:'
      end
      object DBEdit6: TDBEdit
        Left = 60
        Top = 17
        Width = 121
        Height = 22
        TabStop = False
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit7: TDBEdit
        Left = 321
        Top = 17
        Width = 121
        Height = 22
        TabStop = False
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 524
    Width = 470
    Height = 32
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 4
    object XFLabel16: TXFLabel
      Left = 31
      Top = 7
      Width = 70
      Height = 14
      Caption = 'Avtohesab:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Acc_nuber_avto: TSpeedButton
      Left = 114
      Top = 5
      Width = 20
      Height = 21
      OnClick = Acc_nuber_avtoClick
    end
    object XFLabel17: TXFLabel
      Left = 140
      Top = 11
      Width = 8
      Height = 14
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EditAccNo: TEdit
      Left = 154
      Top = 5
      Width = 284
      Height = 21
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 494
    Width = 470
    Height = 30
    Align = alTop
    TabOrder = 5
    object XFLabel13: TXFLabel
      Left = 16
      Top = 7
      Width = 59
      Height = 13
      Caption = 'Hesab'#305'n ad'#305':'
    end
    object Edit_AccName: TEdit
      Left = 119
      Top = 5
      Width = 343
      Height = 21
      TabOrder = 0
    end
  end
  object GroupBoxOpenAccount_elave: TGroupBox
    Left = 0
    Top = 361
    Width = 470
    Height = 133
    Align = alTop
    TabOrder = 6
    object XFLabel10: TXFLabel
      Left = 16
      Top = 14
      Width = 81
      Height = 13
      Caption = 'Hesab'#305'n t'#601'yinat'#305':'
    end
    object XFLabel18: TXFLabel
      Left = 106
      Top = 13
      Width = 8
      Height = 14
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object XFLabel11: TXFLabel
      Left = 16
      Top = 44
      Width = 90
      Height = 13
      Caption = 'Hesabatin simvolu:'
    end
    object Label_Symbols: TLabel
      Left = 123
      Top = 67
      Width = 4
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object XFLabel12: TXFLabel
      Left = 16
      Top = 74
      Width = 80
      Height = 13
      Caption = 'Hesab'#305'n simvolu:'
    end
    object XFLabel14: TXFLabel
      Left = 16
      Top = 102
      Width = 56
      Height = 13
      Caption = 'Qeyd kodu:'
    end
    object XFLabel15: TXFLabel
      Left = 240
      Top = 102
      Width = 58
      Height = 13
      Caption = 'Qal'#305#287'a Limit:'
    end
    object Edit5: TEdit
      Left = 124
      Top = 11
      Width = 69
      Height = 21
      TabOrder = 0
      OnExit = Edit5Exit
      OnKeyPress = Edit5KeyPress
    end
    object DBLookupComboboxEh4: TDBLookupComboboxEh
      Left = 194
      Top = 11
      Width = 268
      Height = 21
      DataField = 'SYMB'
      DataSource = DataAcc.AccountData_edit
      EditButtons = <>
      KeyField = 'SYMBOL'
      ListField = 'NAME'
      ListSource = DataAcc.Dsrc_account_symbols1
      TabOrder = 1
      Visible = True
      OnChange = DBLookupComboboxEh4Change
    end
    object Edit6: TEdit
      Left = 124
      Top = 40
      Width = 69
      Height = 21
      TabOrder = 2
    end
    object DBLookupComboboxEh5: TDBLookupComboboxEh
      Left = 193
      Top = 40
      Width = 269
      Height = 21
      DataField = 'SIM_OTCET'
      DataSource = DataAcc.AccountData_edit
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DataAcc.Dsrc_ReportSymbol
      TabOrder = 3
      Visible = True
      OnChange = DBLookupComboboxEh5Change
    end
    object Button1: TButton
      Left = 349
      Top = 67
      Width = 112
      Height = 25
      Caption = 'Simvollar ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Button1Click
    end
    object EditNoteCode: TEdit
      Left = 121
      Top = 99
      Width = 85
      Height = 21
      TabOrder = 5
    end
    object Edit_limit: TEdit
      Left = 304
      Top = 99
      Width = 114
      Height = 21
      TabOrder = 6
    end
  end
  object Pcust_Balans_hesabı: TGroupBox
    Left = 0
    Top = 324
    Width = 470
    Height = 37
    Align = alTop
    TabOrder = 7
    object Label2: TLabel
      Left = 8
      Top = 18
      Width = 75
      Height = 13
      Caption = 'Balans hesab'#305'2:'
    end
    object XFLabel24: TXFLabel
      Left = 86
      Top = 17
      Width = 8
      Height = 14
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit2: TEdit
      Left = 124
      Top = 10
      Width = 69
      Height = 21
      TabOrder = 0
      OnExit = Edit2Exit
      OnKeyPress = Edit2KeyPress
    end
    object DBLookupComboboxEh6: TDBLookupComboboxEh
      Left = 194
      Top = 10
      Width = 268
      Height = 21
      DataField = 'BAL_CN2'
      DataSource = DataAcc.AccountData_edit
      EditButtons = <>
      KeyField = 'BAL_CN'
      ListField = 'BALNAME'
      ListSource = DataAcc.Dsrc_bal_spr2Edit
      TabOrder = 1
      Visible = True
      OnChange = DBLookupComboboxEh6Change
    end
  end
end
